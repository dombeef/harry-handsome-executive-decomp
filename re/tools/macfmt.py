"""BinHex 4.0, MacBinary and classic StuffIt (SIT!) helpers.

  python macfmt.py unpack FILE OUTDIR   -- auto-detects hqx / MacBinary / SIT! / SIT5,
                                           recursing into nested archives.
"""
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(__file__))
import sit5  # noqa: E402

HQX = "!\"#$%&'()*+,-012345689@ABCDEFGHIJKLMNPQRSTUVXYZ[`abcdefhijklmpqr"


def crc_ccitt(data, crc=0):
    for b in data:
        crc ^= b << 8
        for _ in range(8):
            crc = ((crc << 1) ^ 0x1021) & 0xFFFF if crc & 0x8000 else (crc << 1) & 0xFFFF
    return crc


def binhex_decode(text):
    i = text.find(b"(This file must be converted with BinHex")
    i = text.find(b":", i if i >= 0 else 0)
    j = text.find(b":", i + 1)
    body = bytes(c for c in text[i + 1:j] if c not in b"\r\n\t ")
    lut = {ord(c): n for n, c in enumerate(HQX)}
    bits = 0
    nb = 0
    raw = bytearray()
    for c in body:
        bits = (bits << 6) | lut[c]
        nb += 6
        if nb >= 8:
            nb -= 8
            raw.append((bits >> nb) & 0xFF)
    # RLE90
    out = bytearray()
    k = 0
    while k < len(raw):
        b = raw[k]
        if b == 0x90 and k + 1 < len(raw):
            n = raw[k + 1]
            k += 2
            if n == 0:
                out.append(0x90)
            else:
                out += bytes([out[-1]]) * (n - 1)
            continue
        out.append(b)
        k += 1
    nl = out[0]
    name = out[1:1 + nl].decode("mac_roman")
    p = 1 + nl + 1
    ftype, creator = out[p:p + 4], out[p + 4:p + 8]
    p += 10
    dlen, rlen = struct.unpack_from(">II", out, p)
    p += 10
    data = bytes(out[p:p + dlen])
    p += dlen + 2
    rsrc = bytes(out[p:p + rlen])
    return name, ftype, creator, data, rsrc


def is_macbinary(d):
    if len(d) < 128 or d[0] != 0 or d[74] != 0 or not (1 <= d[1] <= 63):
        return False
    dlen, rlen = struct.unpack_from(">II", d, 83)
    return dlen + rlen <= len(d) and d[82] == 0


def macbinary_decode(d):
    nl = d[1]
    name = d[2:2 + nl].decode("mac_roman")
    ftype, creator = d[65:69], d[69:73]
    dlen, rlen = struct.unpack_from(">II", d, 83)
    sec = struct.unpack_from(">H", d, 120)[0]
    p = 128 + ((sec + 127) & ~127)
    data = d[p:p + dlen]
    p += (dlen + 127) & ~127
    rsrc = d[p:p + rlen]
    return name, ftype, creator, data, rsrc


# ---------------------------------------------------------------- classic SIT!
def _sit_lzw(data, outlen):
    """StuffIt method 2: LZC (compress -b14, block mode, LSB-first codes)."""
    out = bytearray()
    br = sit5.BitReaderLE(data)
    total_bits = len(data) * 8
    while True:
        dic = [bytes([i]) for i in range(256)] + [b""]
        nbits = 9
        prev = None
        nread = 0
        reset = False
        while len(out) < outlen:
            if (br.pos * 8 - br.bitcount) + nbits > total_bits:
                return bytes(out[:outlen])
            c = br.bits(nbits)
            nread += 1
            if c == 256:
                # skip to a multiple of nbits*8 codes
                while nread % 8:
                    br.bits(nbits)
                    nread += 1
                reset = True
                break
            if c < len(dic) and (c != 256):
                entry = dic[c] if c < len(dic) else None
            if c < len(dic) and c != 256:
                entry = dic[c]
                if prev is not None:
                    dic.append(prev + entry[:1])
            else:
                entry = prev + prev[:1]
                dic.append(entry)
            out += entry
            prev = entry
            if len(dic) >= (1 << nbits) and nbits < 14:
                # LZC bumps width; codes are read in groups of 8
                while nread % 8:
                    br.bits(nbits)
                    nread += 1
                nbits += 1
                nread = 0
        if not reset or len(out) >= outlen:
            return bytes(out[:outlen])


def sit_classic(d):
    """Yield (path, ftype, creator, data, rsrc) from a SIT! archive."""
    nfiles = struct.unpack_from(">H", d, 4)[0]
    pos = 22
    stack = []
    end = len(d)
    while pos + 112 <= end:
        rmeth, dmeth = d[pos], d[pos + 1]
        nl = d[pos + 2]
        name = d[pos + 3:pos + 3 + nl].decode("mac_roman")
        ftype, creator = d[pos + 66:pos + 70], d[pos + 70:pos + 74]
        rlen, dlen, rclen, dclen = struct.unpack_from(">IIII", d, pos + 84)
        rcrc, dcrc = struct.unpack_from(">HH", d, pos + 100)
        hdr = pos
        pos += 112
        if rmeth == 32 or dmeth == 32:  # folder start
            stack.append(name)
            continue
        if rmeth == 33 or dmeth == 33:  # folder end
            if stack:
                stack.pop()
            continue
        path = "/".join(stack + [name])
        r = _sit_unpack(d[pos:pos + rclen], rmeth & 0x0F, rlen, rcrc)
        pos += rclen
        dd = _sit_unpack(d[pos:pos + dclen], dmeth & 0x0F, dlen, dcrc)
        pos += dclen
        yield path, ftype, creator, dd, r


def _sit_unpack(raw, method, ulen, crc):
    if ulen == 0:
        return b""
    if method == 0:
        out = raw
    elif method == 2:
        out = _sit_lzw(raw, ulen)
    elif method == 13:
        out = sit5.decompress13(raw, ulen)
    elif method == 15:
        bad = sit5.ARSENIC_STATS["bad"]
        out = sit5.decompress15(raw, ulen)
        if sit5.ARSENIC_STATS["bad"] != bad:
            print("   (arsenic crc32 mismatch)")
    else:
        raise NotImplementedError("SIT! method %d" % method)
    if method != 15 and sit5.crc16(out) != crc:
        print("   (crc mismatch, method %d)" % method)
    return out


# ---------------------------------------------------------------- recursive unpack
def write_file(outdir, path, ftype, creator, data, rsrc):
    target = os.path.join(outdir, *[sit5.safe(p) for p in path.split("/")])
    os.makedirs(os.path.dirname(target) or ".", exist_ok=True)
    unpack_blob(outdir, path, ftype, creator, data, rsrc, target)


def unpack_blob(outdir, path, ftype, creator, data, rsrc, target):
    if data.startswith(b"SIT!") or data.startswith(b"StuffIt (c)1997"):
        sub = target + ".d"
        os.makedirs(sub, exist_ok=True)
        print("[archive] %s" % path)
        unpack_archive(data, sub)
        return
    if b"(This file must be converted with BinHex" in data[:512]:
        n, t, c, dd, r = binhex_decode(data)
        print("[hqx] %s -> %s" % (path, n))
        write_file(os.path.dirname(target), n, t, c, dd, r)
        return
    if is_macbinary(data):
        n, t, c, dd, r = macbinary_decode(data)
        print("[macbin] %s -> %s (%s/%s)" % (path, n, t, c))
        write_file(os.path.dirname(target), n, t, c, dd, r)
        return
    if data:
        open(target, "wb").write(data)
    if rsrc:
        open(target + ".rsrc", "wb").write(rsrc)
    with open(os.path.join(outdir, "_finderinfo.txt"), "a", encoding="utf-8") as f:
        f.write("%s\t%s\t%s\n" % (path, ftype.decode("mac_roman"), creator.decode("mac_roman")))
    print("  %s  %s/%s data=%d rsrc=%d" % (path, ftype.decode("mac_roman"), creator.decode("mac_roman"),
                                          len(data), len(rsrc)))


def unpack_archive(data, outdir):
    if data.startswith(b"SIT!"):
        items = sit_classic(data)
    else:
        items = []
        for e in sit5.walk(data):
            if e["dir"]:
                continue
            dd = sit5.unpack(data, e["dpos"], e["dclen"], e["dlen"], e["dmethod"], e["dcrc"])[0] if e["dclen"] else b""
            r = sit5.unpack(data, e["rpos"], e["rclen"], e["rlen"], e["rmethod"], e["rcrc"])[0] if e["rlen"] else b""
            items.append((e["path"], e["type"], e["creator"], dd, r))
    for path, t, c, dd, r in items:
        try:
            write_file(outdir, path, t, c, dd, r)
        except Exception as ex:  # keep going on bad members
            print("!! %s: %r" % (path, ex))


def main():
    cmd, path, outdir = sys.argv[1:4]
    data = open(path, "rb").read()
    rsrc = open(path + ".rsrc", "rb").read() if os.path.exists(path + ".rsrc") else b""
    os.makedirs(outdir, exist_ok=True)
    name = os.path.basename(path)
    unpack_blob(outdir, name, b"????", b"????", data, rsrc, os.path.join(outdir, sit5.safe(name)))


if __name__ == "__main__":
    main()
