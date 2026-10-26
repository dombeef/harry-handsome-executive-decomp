"""CodeWarrior 68k "far model" runtime structures: DATA 0 expansion, relocations, jump table.

Layout (reverse engineered from the app's own startup code in CODE 1):
  CODE n (n>=2): +0 word ?, +2 word jtCount, +4 long jtA5Offset, +8 long relocOffset, code at +12.
  Relocation list = 3 packed passes (add A5 / add CODE1 base / add own base), see read_reloc_pass.
  DATA 0: +0 long ?, +4 packed A5-world image (3 sections) followed by relocation passes for the
  A5 world (base=A5) and then for CODE 1 (base=CODE1).
"""
import struct


def expand_data0(data, below=0x1940, above=0x18670):
    """Return (bytearray world, a5index, end_pos). world[a5index + off] == byte at A5+off."""
    world = bytearray(below + above)
    a5 = below
    p = 4
    for _ in range(3):
        off = struct.unpack_from(">i", data, p)[0]
        p += 4
        q = a5 + off
        while True:
            b = data[p]
            p += 1
            if b & 0x80:
                n = (b & 0x7F) + 1
                world[q:q + n] = data[p:p + n]
                p += n
                q += n
            elif b & 0x40:
                q += (b & 0x3F) + 1
            elif b & 0x20:
                n = (b & 0x1F) + 2
                world[q:q + n] = bytes([data[p]]) * n
                p += 1
                q += n
            elif b & 0x10:
                n = (b & 0x0F) + 1
                world[q:q + n] = b"\xff" * n
                q += n
            elif b == 0:
                break
            elif b == 1:
                q += 4
                world[q:q + 2] = b"\xff\xff"
                q += 2
                world[q:q + 2] = data[p:p + 2]
                p += 2
                q += 2
            elif b == 2:
                q += 4
                world[q] = 0xFF
                q += 1
                world[q:q + 3] = data[p:p + 3]
                p += 3
                q += 3
            elif b == 3:
                world[q:q + 2] = b"\xa9\xf0"
                q += 4
                world[q:q + 2] = data[p:p + 2]
                p += 2
                q += 3
                world[q] = data[p]
                p += 1
                q += 1
            elif b == 4:
                world[q:q + 2] = b"\xa9\xf0"
                q += 3
                world[q:q + 3] = data[p:p + 3]
                p += 3
                q += 4
                world[q] = data[p]
                p += 1
                q += 1
            else:
                raise ValueError("bad DATA op %d" % b)
    return world, a5, p


def read_reloc_pass(data, p):
    """Return (list of offsets, new p)."""
    count = struct.unpack_from(">I", data, p)[0]
    p += 4
    d2 = 0
    out = []
    for _ in range(count):
        b = data[p]
        p += 1
        if b & 0x80:
            v = (b << 1) & 0xFF
            d2 += v - 256 if v & 0x80 else v
        else:
            w = (b << 8) | data[p]
            p += 1
            if b & 0x40:
                v = (w << 2) & 0xFFFF
                v = v - 0x10000 if v & 0x8000 else v
                d2 += v >> 1
            else:
                l = (w << 16) | (data[p] << 8) | data[p + 1]
                p += 2
                v = (l << 2) & 0xFFFFFFFF
                v = v - 0x100000000 if v & 0x80000000 else v
                d2 = v >> 1
        out.append(d2)
    return out, p


def read_reloc(data, p):
    kinds = ("A5", "C1", "SELF")
    res = {}
    for k in kinds:
        offs, p = read_reloc_pass(data, p)
        for o in offs:
            res[o] = k
    return res, p


class Program:
    def __init__(self, codes, data0):
        """codes: {segno: bytes} (excluding 0); data0: DATA 0 resource bytes."""
        self.codes = codes
        self.world, self.a5, p = expand_data0(data0)
        self.world_reloc, p = read_reloc(data0, p)
        c1_reloc, p = read_reloc(data0, p)
        self.reloc = {1: {o: ("SELF" if k == "C1" else k) for o, k in c1_reloc.items()}}
        self.jt_ranges = {}
        for s, code in codes.items():
            if s == 1:
                continue
            _, cnt, jtoff, roff = struct.unpack_from(">HHII", code, 0)
            self.reloc[s], _ = read_reloc(code, roff)
            self.jt_ranges[s] = (jtoff, cnt)
        # jump table: entries with A9F0 at A5+o
        self.jt = {}
        for o in range(0x20, len(self.world) - self.a5 - 8, 8):
            q = self.a5 + o
            if self.world[q:q + 2] == b"\xa9\xf0":
                off = struct.unpack_from(">I", self.world, q + 2)[0]
                seg = struct.unpack_from(">H", self.world, q + 6)[0]
                self.jt[o] = (seg, off)

    def world_long(self, a5off):
        return struct.unpack_from(">I", self.world, self.a5 + a5off)[0]
