"""Peephole-fold compact listings (re/lst/*.lst) into denser re/lst2/*.lst for reading.

- collapses the run of argument pushes before a jsr/bsr into the call line: "call F(a, b, c)"
  (pushes are shown in push order; for C functions the LAST pushed is the first argument)
- removes stack cleanup right after calls (addq #n,sp / lea $n(sp),sp)
- drops sign-extension noise (ext.l/ext.w)
- "movea.l hLevel,aX; movea.l (aX),aY; move.l #$OFF,dZ; op (aY, dZ.l)" -> "op LVL[$OFF]"

  python fold.py            (rebuild all)
  python fold.py show NAME  (print folded function)
"""
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")  # re/
L = re.compile(r"^\s*([0-9a-f]+) (\S+)\s?(.*)$")
PUSH = re.compile(r"^(move\.[bwl]|pea\.l|clr\.[bwl]|movea?\.l)$")


def parse(line):
    m = L.match(line)
    if not m:
        return None
    return [int(m.group(1), 16), m.group(2), m.group(3)]


def push_arg(mn, ops):
    if mn.startswith("pea"):
        return "&" + ops
    if mn.startswith("clr"):
        return "0" if ops.endswith("-(sp)") else None
    if ops.endswith(", -(sp)"):
        src = ops[:-7]
        return src.replace("#$", "0x").replace("#", "")
    return None


def fold_function(lines):
    out = []
    i = 0
    n = len(lines)
    parsed = [parse(l) for l in lines]
    while i < n:
        p = parsed[i]
        if p is None:
            out.append(lines[i])
            i += 1
            continue
        addr, mn, ops = p
        if mn in ("ext.l", "ext.w", "extb.l"):
            i += 1
            continue
        # level handle pattern
        if mn == "movea.l" and ops.startswith("hLevel, a") and i + 3 < n and parsed[i + 1] and parsed[i + 2] and parsed[i + 3]:
            a1, a2 = parsed[i + 1], parsed[i + 2]
            m1 = re.match(r"\((a\d)\), (a\d)$", a1[2])
            m2 = re.match(r"#\$([0-9a-f]+), (d\d)$", a2[2])
            if a1[1] == "movea.l" and m1 and a2[1] == "move.l" and m2:
                reg, d = m1.group(2), m2.group(2)
                pat = "(%s, %s.l)" % (reg, d)
                a3 = parsed[i + 3]
                if pat in a3[2]:
                    out.append("%5x %s %s" % (a3[0], a3[1], a3[2].replace(pat, "LVL[$%s]" % m2.group(1))))
                    i += 4
                    continue
        if mn in ("jsr", "bsr.l", "bsr.w", "bsr.b"):
            # gather preceding pushes from out
            args = []
            while out:
                q = parse(out[-1])
                if not q or not PUSH.match(q[1]):
                    break
                a = push_arg(q[1], q[2])
                if a is None:
                    break
                args.insert(0, a)
                out.pop()
            target = ops.split(";")[-1].strip() if ";" in ops else ops
            line = "%5x call %s(%s)" % (addr, target, ", ".join(args))
            out.append(line)
            # skip cleanup
            if i + 1 < n and parsed[i + 1] and (
                    (parsed[i + 1][1] in ("addq.w", "addq.l") and parsed[i + 1][2].endswith(", sp")) or
                    (parsed[i + 1][1] == "lea.l" and re.match(r"\$[0-9a-f]+\(sp\), sp$", parsed[i + 1][2]))):
                i += 1
            i += 1
            continue
        out.append(lines[i])
        i += 1
    return out


def build():
    os.makedirs(os.path.join(ROOT, "lst2"), exist_ok=True)
    for fn in sorted(os.listdir(os.path.join(ROOT, "lst"))):
        lines = open(os.path.join(ROOT, "lst", fn)).read().split("\n")
        res, cur = [], []
        for l in lines:
            if l.startswith("; "):
                res += fold_function(cur)
                cur = []
                res.append(l)
            else:
                cur.append(l)
        res += fold_function(cur)
        open(os.path.join(ROOT, "lst2", fn), "w").write("\n".join(res))


def show(names):
    for fn in sorted(os.listdir(os.path.join(ROOT, "lst2"))):
        lines = open(os.path.join(ROOT, "lst2", fn)).read().split("\n")
        for i, l in enumerate(lines):
            if l.startswith("; ") and l.split()[1] in names:
                j = i + 1
                while j < len(lines) and not lines[j].startswith("; "):
                    j += 1
                print("\n".join(lines[i:j]).rstrip())


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "show":
        show(set(sys.argv[2:]))
    else:
        build()
