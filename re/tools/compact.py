"""Turn re/asm68k/seg*.s into compact, more readable listings re/lst/seg*.lst.

- drops raw bytes, shortens addresses
- replaces "$7096.l ; g_7096" absolute operands by their symbol
- names a6 frame slots: $8(a6) -> arg8, -$c(a6) -> loc_c
- function lookup:  python compact.py show NAME   (prints one function)
"""
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")  # re/
LINE = re.compile(r"^  ([0-9a-f]{6})  [0-9a-f]+\s+(\S+)\s*(.*?)(?:   ; (.*))?$")


def compact_line(line):
    m = LINE.match(line)
    if not m:
        return line.rstrip("\n")
    addr, mn, ops, notes = m.groups()
    ops = ops.strip()
    names = [n.strip() for n in notes.split(",")] if notes else []
    # substitute absolute longs in order
    if names:
        it = iter(names)

        def sub(mm):
            try:
                return next(it)
            except StopIteration:
                return mm.group(0)
        ops2 = re.sub(r"\$[0-9a-f]+\.l", sub, ops)
        if ops2 == ops and names:
            ops2 = ops + "  ;" + ",".join(names)
        ops = ops2
    ops = re.sub(r"(?<![-\w])\$([0-9a-f]+)\(a6\)", lambda mm: "arg%x" % int(mm.group(1), 16), ops)
    ops = re.sub(r"-\$([0-9a-f]+)\(a6\)", lambda mm: "loc%x" % int(mm.group(1), 16), ops)
    ops = re.sub(r"(?<![$\w])a7\b", "sp", ops)
    return "%5x %s %s" % (int(addr, 16), mn, ops)


def build():
    os.makedirs(os.path.join(ROOT, "lst"), exist_ok=True)
    for fn in os.listdir(os.path.join(ROOT, "asm68k")):
        if not fn.endswith(".s"):
            continue
        out = []
        for line in open(os.path.join(ROOT, "asm68k", fn)):
            if line.startswith(";---"):
                continue
            out.append(compact_line(line))
        open(os.path.join(ROOT, "lst", fn[:-2] + ".lst"), "w").write("\n".join(out) + "\n")


def show(names):
    for fn in sorted(os.listdir(os.path.join(ROOT, "lst"))):
        lines = open(os.path.join(ROOT, "lst", fn)).read().split("\n")
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
