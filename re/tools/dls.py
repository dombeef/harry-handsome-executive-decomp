"""DLS (Downloadable Sounds, level 1) bank reader, for QuickTime's GS instrument set (gs_instruments.dls).

  python dls.py summary FILE.dls        instruments, regions, articulation and wave formats in use
  python dls.py inst FILE.dls PROGRAM [drum]
"""
import collections
import struct
import sys


def chunks(d, p, end):
    while p + 8 <= end:
        cid = d[p:p + 4].decode("latin1")
        size = struct.unpack_from("<I", d, p + 4)[0]
        if cid in ("RIFF", "LIST"):
            yield cid, d[p + 8:p + 12].decode("latin1"), p + 12, p + 8 + size
        else:
            yield cid, None, p + 8, p + 8 + size
        p += 8 + size + (size & 1)


def find(d, p, end, cid, typ=None):
    for c, t, a, b in chunks(d, p, end):
        if c == cid and (typ is None or t == typ):
            return a, b
    return None


def art1(d, a, b):
    _cb, n = struct.unpack_from("<II", d, a)
    return [struct.unpack_from("<HHHHi", d, a + 8 + i * 12) for i in range(n)]


def wsmp(d, a):
    cb, unity, fine, atten, _opt, nloops = struct.unpack_from("<IHhiII", d, a)
    loops = [struct.unpack_from("<IIII", d, a + cb + i * 16)[2:] for i in range(nloops)]
    return {"unity": unity, "fine": fine, "atten": atten / 65536, "loops": loops}


def parse(d):
    root = (12, len(d))
    out = {"instruments": [], "waves": []}
    lins = find(d, *root, "LIST", "lins")
    for c, t, a, b in chunks(d, *lins):
        if t != "ins ":
            continue
        ins = {"regions": [], "art": []}
        h = find(d, a, b, "insh")
        nreg, bank, prog = struct.unpack_from("<III", d, h[0])
        ins.update(drum=bool(bank & 0x80000000), bank=(bank >> 8) & 0x7F, bankLsb=bank & 0x7F, program=prog)
        info = find(d, a, b, "LIST", "INFO")
        if info:
            nam = find(d, *info, "INAM")
            if nam:
                ins["name"] = d[nam[0]:nam[1]].split(b"\0")[0].decode("latin1")
        la = find(d, a, b, "LIST", "lart")
        if la:
            a1 = find(d, *la, "art1")
            if a1:
                ins["art"] = art1(d, *a1)
        lr = find(d, a, b, "LIST", "lrgn")
        for c2, t2, ra, rb in chunks(d, *lr):
            if t2 != "rgn ":
                continue
            rh = find(d, ra, rb, "rgnh")
            klo, khi, vlo, vhi, opt, grp = struct.unpack_from("<HHHHHH", d, rh[0])
            rg = {"key": (klo, khi), "vel": (vlo, vhi), "opt": opt, "group": grp}
            ws = find(d, ra, rb, "wsmp")
            if ws:
                rg["wsmp"] = wsmp(d, ws[0])
            wl = find(d, ra, rb, "wlnk")
            rg["wave"] = struct.unpack_from("<HHII", d, wl[0])[3]
            la2 = find(d, ra, rb, "LIST", "lart")
            if la2:
                a2 = find(d, *la2, "art1")
                if a2:
                    rg["art"] = art1(d, *a2)
            ins["regions"].append(rg)
        out["instruments"].append(ins)
    wvpl = find(d, *root, "LIST", "wvpl")
    for c, t, a, b in chunks(d, *wvpl):
        if t != "wave":
            continue
        f = find(d, a, b, "fmt ")
        tag, ch, rate, _bps, _align, bits = struct.unpack_from("<HHIIHH", d, f[0])
        dat = find(d, a, b, "data")
        w = {"tag": tag, "channels": ch, "rate": rate, "bits": bits, "bytes": dat[1] - dat[0]}
        ws = find(d, a, b, "wsmp")
        if ws:
            w["wsmp"] = wsmp(d, ws[0])
        out["waves"].append(w)
    return out


def main():
    d = open(sys.argv[2], "rb").read()
    bank = parse(d)
    if sys.argv[1] == "summary":
        ins = bank["instruments"]
        print(len(ins), "instruments;", sum(len(i["regions"]) for i in ins), "regions;", len(bank["waves"]), "waves")
        print("melodic bank-0 programs:", len([i for i in ins if not i["drum"] and i["bank"] == 0]),
              " variations:", len([i for i in ins if not i["drum"] and i["bank"]]), " drum kits:",
              [(i["program"], i.get("name")) for i in ins if i["drum"]])
        dst = collections.Counter()
        for i in ins:
            for blk in i["art"] + [b for r in i["regions"] for b in r.get("art", [])]:
                dst[(blk[0], blk[1], blk[2], blk[3])] += 1
        print("articulation (src, ctl, dst, transform): count")
        for k, v in sorted(dst.items(), key=lambda kv: -kv[1])[:30]:
            print("   ", tuple(hex(x) for x in k), v)
        fm = collections.Counter((w["tag"], w["channels"], w["rate"], w["bits"]) for w in bank["waves"])
        print("wave formats:", fm.most_common())
        print("region wsmp:", sum(1 for i in ins for r in i["regions"] if "wsmp" in r), "groups:",
              sorted(set(r["group"] for i in ins for r in i["regions"])))
    elif sys.argv[1] == "inst":
        prog = int(sys.argv[3])
        drum = len(sys.argv) > 4
        for i in bank["instruments"]:
            if i["program"] == prog and i["drum"] == drum and (drum or i["bank"] == 0):
                print(i.get("name"), "bank", i["bank"], "art", i["art"])
                for r in i["regions"]:
                    print("   ", r["key"], r["vel"], "grp", r["group"], "wave", r["wave"], bank["waves"][r["wave"]],
                          r.get("wsmp"), r.get("art"))


if __name__ == "__main__":
    main()
