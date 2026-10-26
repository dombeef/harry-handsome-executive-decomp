"""Disassemble the Harry 68k CODE resources with symbols, relocations and jump-table names.

  python disasm68k.py RSRC_DUMP_DIR OUTDIR

RSRC_DUMP_DIR is a `rsrc.py dump` directory containing CODE/ and DATA/.
Writes OUTDIR/seg<N>.s, OUTDIR/functions.txt (seg, offset, size, name) and OUTDIR/jumptable.txt.
Optional re/globals.txt ("hexoffset name" per line) names A5-world globals.
"""
import os
import re
import struct
import sys

import capstone

sys.path.insert(0, os.path.dirname(__file__))
from traps68k import trap_name  # noqa: E402
import cwreloc  # noqa: E402

MD = capstone.Cs(capstone.CS_ARCH_M68K, capstone.CS_MODE_BIG_ENDIAN | capstone.CS_MODE_M68K_020)
MD.detail = True
IDX_RE = re.compile(r"\(([^()]*?), ([ad]\d\.[wl])( \* \d)?\)")


def fix_index_scale(ins, ops):
    """capstone omits the 68020 index scale for brief-extension operands with displacement."""
    try:
        mems = [o.mem for o in ins.operands
                if o.type == capstone.m68k.M68K_OP_MEM and o.mem.index_reg != 0]
    except capstone.CsError:
        return ops
    if not mems:
        return ops
    it = iter(mems)
    out, last = [], 0
    for m in IDX_RE.finditer(ops):
        mem = next(it, None)
        out.append(ops[last:m.start()])
        txt = m.group(0)
        if mem is not None and not m.group(3) and mem.scale > 1:
            txt = "(%s, %s * %d)" % (m.group(1), m.group(2), mem.scale)
        out.append(txt)
        last = m.end()
    out.append(ops[last:])
    return "".join(out)

ENDERS = (0x4E75, 0x4ED0, 0x4E74)
NAME_RE = re.compile(rb"[A-Za-z_%.][A-Za-z0-9_%.:]*")


def find_functions(code, first):
    """Return list of (start, end_of_code, name)."""
    funcs = []
    start = first
    i = first
    n = len(code)
    while i + 4 <= n:
        w = struct.unpack_from(">H", code, i)[0]
        if w in ENDERS:
            j = i + (4 if w == 0x4E74 else 2)
            name = None
            if j < n:
                b = code[j]
                if 0x81 <= b <= 0x9F:
                    ln = b & 0x7F
                    cand = code[j + 1:j + 1 + ln]
                    if NAME_RE.fullmatch(cand):
                        name, k = cand.decode(), j + 1 + ln
                elif b == 0x80 and j + 1 < n:
                    ln = code[j + 1]
                    cand = code[j + 2:j + 2 + ln]
                    if ln and NAME_RE.fullmatch(cand):
                        name, k = cand.decode(), j + 2 + ln
            if name:
                k += k & 1
                lit = struct.unpack_from(">H", code, k)[0] if k + 2 <= n else 0
                k += 2 + lit
                k += k & 1
                funcs.append((start, j, name))
                start = i = k
                continue
        i += 2
    if start < n:
        funcs.append((start, n, "_tail_%x" % start))
    return funcs


class Disassembler:
    def __init__(self, rsrcdir):
        self.codes = {}
        for fn in os.listdir(os.path.join(rsrcdir, "CODE")):
            s = int(fn.split("_")[0].split(".")[0])
            if s:
                self.codes[s] = open(os.path.join(rsrcdir, "CODE", fn), "rb").read()
        self.prog = cwreloc.Program(self.codes, open(os.path.join(rsrcdir, "DATA", "0.bin"), "rb").read())
        self.funcs = {s: find_functions(c, 4 if s == 1 else 12) for s, c in self.codes.items()}
        self.fname = {}
        for s, fl in self.funcs.items():
            for st, en, name in fl:
                self.fname[(s, st)] = name
        self.globals = {}
        gpath = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "globals.txt")
        if os.path.exists(gpath):
            for line in open(gpath):
                line = line.split("#")[0].strip()
                if line:
                    parts = line.split()
                    size = int(parts[2], 16) if len(parts) > 2 else 0
                    self.globals[int(parts[0], 16)] = (parts[1], size)

    def jt_name(self, a5off):
        se = self.prog.jt.get(a5off)
        if not se:
            return None
        return self.fname.get(se, "seg%d+%x" % se)

    def global_name(self, a5off):
        if a5off in self.globals:
            return self.globals[a5off][0]
        # inside a named global (struct/array) with a declared size
        for o, (nm, size) in self.globals.items():
            if o < a5off < o + size:
                return "%s+%x" % (nm, a5off - o)
        return "g_%x" % a5off

    def annotate(self, seg, addr, size, raw):
        rel = self.prog.reloc.get(seg, {})
        notes = []
        for o in range(addr, addr + size - 3):
            k = rel.get(o)
            if not k:
                continue
            v = struct.unpack_from(">I", raw, o - addr)[0]
            if k == "A5":
                v = v - (1 << 32) if v & 0x80000000 else v
                nm = self.jt_name(v)
                notes.append(nm if nm else self.global_name(v))
            else:
                tseg = 1 if k == "C1" else seg
                notes.append(self.fname.get((tseg, v), "seg%d+%x" % (tseg, v)))
        return notes

    def disasm_range(self, seg, start, end):
        code = self.codes[seg]
        out = []
        pos = start
        while pos < end:
            table = None
            for ins in MD.disasm(code[pos:end], pos):
                # switch jump table: "jmp $X(pc, dN.w)" with table at X == next address
                if ins.mnemonic == "jmp":
                    m = re.match(r"\$([0-9a-f]+)\(pc, d\d\.w\)$", ins.op_str)
                    if m and int(m.group(1), 16) == ins.address + ins.size:
                        table = int(m.group(1), 16)
                        out.append((ins.address, ins.size, ins.mnemonic, ins.op_str))
                        pos = ins.address + ins.size
                        break
                mn, ops = ins.mnemonic, ins.op_str
                ops = fix_index_scale(ins, ops)
                raw = code[ins.address:ins.address + 4]
                if raw[0] == 0x4C and (raw[1] & 0x80) == 0 and len(raw) == 4:
                    # 68020 long mul/div: capstone hides the second data register
                    ext = (raw[2] << 8) | raw[3]
                    r1, r2 = (ext >> 12) & 7, ext & 7
                    is_div = bool(raw[1] & 0x40)
                    sgn = "s" if ext & 0x800 else "u"
                    ea = ops.rsplit(",", 1)[0]
                    if is_div and (ext & 0x400 or r1 != r2):
                        mn = "div%s%s.l" % (sgn, "" if ext & 0x400 else "l")
                        ops = "%s, d%d:d%d" % (ea, r2, r1)   # remainder:quotient
                    elif not is_div and ext & 0x400:
                        mn = "mul%s.l" % sgn
                        ops = "%s, d%d:d%d" % (ea, r2, r1)   # high:low
                out.append((ins.address, ins.size, mn, ops))
                pos = ins.address + ins.size
            if table is not None:
                first = end
                k = table
                cases = []
                while k + 2 <= end and k < first:
                    off = struct.unpack_from(">h", code, k)[0]
                    tgt = table + off
                    if tgt <= table or tgt >= end:
                        break
                    first = min(first, tgt)
                    cases.append(tgt)
                    k += 2
                for i in range(0, len(cases), 8):
                    out.append((table + 2 * i, 2 * len(cases[i:i + 8]), "cases",
                                " ".join("%d:$%x" % (i + j, c) for j, c in enumerate(cases[i:i + 8]))))
                pos = k
                continue
            if pos < end:
                w = struct.unpack_from(">H", code, pos)[0] if pos + 2 <= end else code[pos]
                if (w & 0xF000) == 0xA000:
                    out.append((pos, 2, "_" + (trap_name(w) or "trap_%04x" % w), ""))
                else:
                    out.append((pos, 2, "dc.w", "$%04x" % w))
                pos += 2
        return out

    def write(self, outdir):
        os.makedirs(outdir, exist_ok=True)
        with open(os.path.join(outdir, "functions.txt"), "w") as ft:
            for s in sorted(self.funcs):
                for st, en, name in self.funcs[s]:
                    ft.write("%d\t%06x\t%d\t%s\n" % (s, st, en - st, name))
        with open(os.path.join(outdir, "jumptable.txt"), "w") as fj:
            for o, (s, off) in sorted(self.prog.jt.items()):
                fj.write("%04x\t%d\t%06x\t%s\n" % (o, s, off, self.fname.get((s, off), "?")))
        for s, code in sorted(self.codes.items()):
            local = {st: name for st, en, name in self.funcs[s]}
            with open(os.path.join(outdir, "seg%d.s" % s), "w") as f:
                for st, en, name in self.funcs[s]:
                    f.write("\n;-------------------------------------------------------------\n")
                    f.write("; %s   (seg %d +%06x, %d bytes)\n" % (name, s, st, en - st))
                    for addr, size, mn, ops in self.disasm_range(s, st, en):
                        raw = code[addr:addr + size]
                        notes = self.annotate(s, addr, size, raw)
                        if mn.startswith(("bsr", "jsr", "jmp", "lea", "pea")) and not notes:
                            m = re.search(r"\$([0-9a-f]+)(?:\(pc\))", ops) or re.match(r"\$([0-9a-f]+)$", ops)
                            if m and int(m.group(1), 16) in local:
                                notes.append(local[int(m.group(1), 16)])
                        f.write("  %06x  %-20s %-9s %s%s\n" % (
                            addr, raw.hex(), mn, ops, ("   ; " + ", ".join(notes)) if notes else ""))


def main():
    d = Disassembler(sys.argv[1])
    d.write(sys.argv[2])
    print("functions:", {s: len(v) for s, v in d.funcs.items()}, "jt:", len(d.prog.jt))


if __name__ == "__main__":
    main()
