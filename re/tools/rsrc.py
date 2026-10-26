"""Classic Mac OS resource fork parser.

  python rsrc.py list FORK
  python rsrc.py dump FORK OUTDIR      (one file per resource: TYPE/ID[_name].bin)
"""
import os
import struct
import sys


def parse(data):
    """Return {type(str): {id(int): (name(str|None), bytes)}}."""
    if len(data) < 16:
        return {}
    doff, moff, dlen, mlen = struct.unpack_from(">IIII", data, 0)
    m = data[moff:moff + mlen]
    tl_off, nl_off = struct.unpack_from(">HH", m, 24)
    ntypes = struct.unpack_from(">H", m, tl_off)[0] + 1
    out = {}
    for t in range(ntypes):
        rtype, cnt, ref_off = struct.unpack_from(">4sHH", m, tl_off + 2 + t * 8)
        rtype = rtype.decode("mac_roman")
        res = out.setdefault(rtype, {})
        for i in range(cnt + 1):
            p = tl_off + ref_off + i * 12
            rid, noff, attr_off = struct.unpack_from(">hHI", m, p)
            off = attr_off & 0xFFFFFF
            name = None
            if noff != 0xFFFF:
                q = nl_off + noff
                name = m[q + 1:q + 1 + m[q]].decode("mac_roman")
            q = doff + off
            ln = struct.unpack_from(">I", data, q)[0]
            res[rid] = (name, data[q + 4:q + 4 + ln])
    return out


def safe(s):
    return "".join("_" if c in '<>:"/\\|?* ' or ord(c) < 32 else c for c in s)


def main():
    cmd, path = sys.argv[1], sys.argv[2]
    r = parse(open(path, "rb").read())
    if cmd == "list":
        for t in sorted(r):
            ids = sorted(r[t])
            print("%-4s x%-4d total=%-8d ids: %s" % (
                t, len(ids), sum(len(v[1]) for v in r[t].values()),
                " ".join("%d%s" % (i, "(%s)" % r[t][i][0] if r[t][i][0] else "") for i in ids[:40])
                + (" ..." if len(ids) > 40 else "")))
    elif cmd == "dump":
        outdir = sys.argv[3]
        for t in r:
            d = os.path.join(outdir, safe(t))
            os.makedirs(d, exist_ok=True)
            for rid, (name, body) in r[t].items():
                fn = "%d%s.bin" % (rid, "_" + safe(name) if name else "")
                open(os.path.join(d, fn), "wb").write(body)


if __name__ == "__main__":
    main()
