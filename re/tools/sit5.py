"""Minimal StuffIt 5 archive lister/extractor (methods 0 and 13).

Usage:
  python sit5.py list  ARCHIVE
  python sit5.py extract ARCHIVE OUTDIR

Each file is written as OUTDIR/<path> (data fork) and, if present,
OUTDIR/<path>.rsrc (resource fork). Type/creator go in OUTDIR/_finderinfo.txt.
"""
import os
import struct
import sys
import zlib

# ---------------------------------------------------------------- CRC16 (ARC)
_CRC_TABLE = []
for _i in range(256):
    _c = _i
    for _ in range(8):
        _c = (_c >> 1) ^ 0xA001 if _c & 1 else _c >> 1
    _CRC_TABLE.append(_c)


def crc16(data, crc=0):
    t = _CRC_TABLE
    for b in data:
        crc = (crc >> 8) ^ t[(crc ^ b) & 0xFF]
    return crc


# ---------------------------------------------------------------- bit reader (LSB first)
class BitReaderLE:
    def __init__(self, data, pos=0):
        self.data = data
        self.pos = pos
        self.bitbuf = 0
        self.bitcount = 0

    def _fill(self, n):
        while self.bitcount < n:
            b = self.data[self.pos] if self.pos < len(self.data) else 0
            self.pos += 1
            self.bitbuf |= b << self.bitcount
            self.bitcount += 8

    def bit(self):
        if self.bitcount == 0:
            self._fill(1)
        v = self.bitbuf & 1
        self.bitbuf >>= 1
        self.bitcount -= 1
        return v

    def bits(self, n):
        if n == 0:
            return 0
        self._fill(n)
        v = self.bitbuf & ((1 << n) - 1)
        self.bitbuf >>= n
        self.bitcount -= n
        return v


# ---------------------------------------------------------------- prefix codes
class PrefixCode:
    """Decoding table keyed by (length, code-as-read-bit-by-bit)."""

    def __init__(self):
        self.table = {}
        self.maxlen = 0

    @classmethod
    def from_lengths(cls, lengths):
        pc = cls()
        code = 0
        maxlen = max([l for l in lengths if l > 0] or [0])
        for length in range(1, maxlen + 1):
            for sym, l in enumerate(lengths):
                if l == length:
                    pc.table[(length, code)] = sym
                    code += 1
            code <<= 1
        pc.maxlen = maxlen
        return pc

    @classmethod
    def from_le_codes(cls, codes, lengths):
        pc = cls()
        for sym, (c, l) in enumerate(zip(codes, lengths)):
            # value's LSB is the first bit read; convert to MSB-first accumulation
            r = 0
            for i in range(l):
                r = (r << 1) | ((c >> i) & 1)
            pc.table[(l, r)] = sym
        pc.maxlen = max(lengths)
        return pc

    def decode(self, br):
        code = 0
        t = self.table
        for length in range(1, self.maxlen + 1):
            code = (code << 1) | br.bit()
            s = t.get((length, code))
            if s is not None:
                return s
        raise ValueError("invalid prefix code")


META_CODES = [
    0x5d8, 0x058, 0x040, 0x0c0, 0x000, 0x078, 0x02b, 0x014,
    0x00c, 0x01c, 0x01b, 0x00b, 0x010, 0x020, 0x038, 0x018,
    0x0d8, 0xbd8, 0x180, 0x680, 0x380, 0xf80, 0x780, 0x480,
    0x080, 0x280, 0x3d8, 0xfd8, 0x7d8, 0x9d8, 0x1d8, 0x004,
    0x001, 0x002, 0x007, 0x003, 0x008,
]
META_LENGTHS = [
    11, 8, 8, 8, 8, 7, 6, 5, 5, 5, 5, 6, 5, 6, 7, 7, 9, 12, 10, 11, 11, 12,
    12, 11, 11, 11, 12, 12, 12, 12, 12, 5, 2, 2, 3, 4, 5,
]
_META = None


def _meta():
    global _META
    if _META is None:
        _META = PrefixCode.from_le_codes(META_CODES, META_LENGTHS)
    return _META


def _parse_code(br, n):
    meta = _meta()
    lengths = [0] * (n + 70)
    length = 0
    i = 0
    while i < n:
        val = meta.decode(br)
        if val == 31:
            length = -1
        elif val == 32:
            length += 1
        elif val == 33:
            length -= 1
        elif val == 34:
            if br.bit():
                lengths[i] = length
                i += 1
        elif val == 35:
            k = br.bits(3) + 2
            for _ in range(k):
                lengths[i] = length
                i += 1
        elif val == 36:
            k = br.bits(6) + 10
            for _ in range(k):
                lengths[i] = length
                i += 1
        else:
            length = val + 1
        lengths[i] = length
        i += 1
    return PrefixCode.from_lengths([max(l, 0) for l in lengths[:n]])


def decompress13(data, outlen):
    br = BitReaderLE(data, 0)
    val = br.bits(8)
    code = val >> 4
    if code != 0:
        raise NotImplementedError("SIT13 predefined table %d" % code)
    first = _parse_code(br, 321)
    second = first if (val & 0x08) else _parse_code(br, 321)
    offc = _parse_code(br, (val & 0x07) + 10)

    out = bytearray()
    cur = first
    while len(out) < outlen:
        v = cur.decode(br)
        if v < 0x100:
            out.append(v)
            cur = first
            continue
        cur = second
        if v < 0x13E:
            length = v - 0x100 + 3
        elif v == 0x13E:
            length = br.bits(10) + 65
        elif v == 0x13F:
            length = br.bits(15) + 65
        else:
            break
        bl = offc.decode(br)
        if bl == 0:
            off = 1
        elif bl == 1:
            off = 2
        else:
            off = (1 << (bl - 1)) + br.bits(bl - 1) + 1
        start = len(out) - off
        if off >= length:
            out += out[start:start + length]
        else:
            for k in range(length):
                out.append(out[start + k])
    return bytes(out[:outlen])


# ---------------------------------------------------------------- method 15 (Arsenic)
class _Model:
    __slots__ = ("first", "inc", "limit", "freq", "total", "n")

    def __init__(self, first, last, inc, limit):
        self.first, self.inc, self.limit = first, inc, limit
        self.n = last - first + 1
        self.reset()

    def reset(self):
        self.freq = [self.inc] * self.n
        self.total = self.inc * self.n


class _Arith:
    NUMBITS = 26
    ONE = 1 << 25
    HALF = 1 << 24

    def __init__(self, data):
        self.data = data
        self.pos = 0
        self.bitbuf = 0
        self.bitcount = 0
        self.range = self.ONE
        self.code = self._bits(self.NUMBITS)

    def _bits(self, n):
        while self.bitcount < n:
            b = self.data[self.pos] if self.pos < len(self.data) else 0
            self.pos += 1
            self.bitbuf = (self.bitbuf << 8) | b
            self.bitcount += 8
        self.bitcount -= n
        v = (self.bitbuf >> self.bitcount) & ((1 << n) - 1)
        self.bitbuf &= (1 << self.bitcount) - 1
        return v

    def symbol(self, m):
        freq = m.freq
        total = m.total
        renorm = self.range // total
        target = self.code // renorm
        cum = 0
        last = m.n - 1
        n = 0
        while n < last:
            f = freq[n]
            if cum + f > target:
                break
            cum += f
            n += 1
        size = freq[n]
        low = renorm * cum
        self.code -= low
        if cum + size == total:
            self.range -= low
        else:
            self.range = size * renorm
        half = self.HALF
        while self.range <= half:
            self.range <<= 1
            if self.bitcount == 0:
                b = self.data[self.pos] if self.pos < len(self.data) else 0
                self.pos += 1
                self.bitbuf = b
                self.bitcount = 8
            self.bitcount -= 1
            self.code = (self.code << 1) | ((self.bitbuf >> self.bitcount) & 1)
        # update model
        freq[n] += m.inc
        m.total += m.inc
        if m.total > m.limit:
            t = 0
            for i in range(m.n):
                freq[i] = (freq[i] + 1) >> 1
                t += freq[i]
            m.total = t
        return n + m.first

    def bitstring(self, m, bits):
        r = 0
        for i in range(bits):
            if self.symbol(m):
                r |= 1 << i
        return r



ARSENIC_RAND = [
    0xee, 0x56, 0xf8, 0xc3, 0x9d, 0x9f, 0xae, 0x2c, 0xad, 0xcd, 0x24, 0x9d, 0xa6, 0x101, 0x18, 0xb9,
    0xa1, 0x82, 0x75, 0xe9, 0x9f, 0x55, 0x66, 0x6a, 0x86, 0x71, 0xdc, 0x84, 0x56, 0x96, 0x56, 0xa1,
    0x84, 0x78, 0xb7, 0x32, 0x6a, 0x03, 0xe3, 0x02, 0x11, 0x101, 0x08, 0x44, 0x83, 0x100, 0x43, 0xe3,
    0x1c, 0xf0, 0x86, 0x6a, 0x6b, 0x0f, 0x03, 0x2d, 0x86, 0x17, 0x7b, 0x10, 0xf6, 0x80, 0x78, 0x7a,
    0xa1, 0xe1, 0xef, 0x8c, 0xf6, 0x87, 0x4b, 0xa7, 0xe2, 0x77, 0xfa, 0xb8, 0x81, 0xee, 0x77, 0xc0,
    0x9d, 0x29, 0x20, 0x27, 0x71, 0x12, 0xe0, 0x6b, 0xd1, 0x7c, 0x0a, 0x89, 0x7d, 0x87, 0xc4, 0x101,
    0xc1, 0x31, 0xaf, 0x38, 0x03, 0x68, 0x1b, 0x76, 0x79, 0x3f, 0xdb, 0xc7, 0x1b, 0x36, 0x7b, 0xe2,
    0x63, 0x81, 0xee, 0x0c, 0x63, 0x8b, 0x78, 0x38, 0x97, 0x9b, 0xd7, 0x8f, 0xdd, 0xf2, 0xa3, 0x77,
    0x8c, 0xc3, 0x39, 0x20, 0xb3, 0x12, 0x11, 0x0e, 0x17, 0x42, 0x80, 0x2c, 0xc4, 0x92, 0x59, 0xc8,
    0xdb, 0x40, 0x76, 0x64, 0xb4, 0x55, 0x1a, 0x9e, 0xfe, 0x5f, 0x06, 0x3c, 0x41, 0xef, 0xd4, 0xaa,
    0x98, 0x29, 0xcd, 0x1f, 0x02, 0xa8, 0x87, 0xd2, 0xa0, 0x93, 0x98, 0xef, 0x0c, 0x43, 0xed, 0x9d,
    0xc2, 0xeb, 0x81, 0xe9, 0x64, 0x23, 0x68, 0x1e, 0x25, 0x57, 0xde, 0x9a, 0xcf, 0x7f, 0xe5, 0xba,
    0x41, 0xea, 0xea, 0x36, 0x1a, 0x28, 0x79, 0x20, 0x5e, 0x18, 0x4e, 0x7c, 0x8e, 0x58, 0x7a, 0xef,
    0x91, 0x02, 0x93, 0xbb, 0x56, 0xa1, 0x49, 0x1b, 0x79, 0x92, 0xf3, 0x58, 0x4f, 0x52, 0x9c, 0x02,
    0x77, 0xaf, 0x2a, 0x8f, 0x49, 0xd0, 0x99, 0x4d, 0x98, 0x101, 0x60, 0x93, 0x100, 0x75, 0x31, 0xce,
    0x49, 0x20, 0x56, 0x57, 0xe2, 0xf5, 0x26, 0x2b, 0x8a, 0xbf, 0xde, 0xd0, 0x83, 0x34, 0xf4, 0x17,
]

ARSENIC_STATS = {"ok": 0, "bad": 0}


def decompress15(data, outlen):
    ac = _Arith(data)
    initial = _Model(0, 1, 1, 256)
    selector = _Model(0, 10, 8, 1024)
    mtfm = [_Model(2, 3, 8, 1024), _Model(4, 7, 4, 1024), _Model(8, 15, 4, 1024),
            _Model(16, 31, 4, 1024), _Model(32, 63, 2, 1024), _Model(64, 127, 2, 1024),
            _Model(128, 255, 1, 1024)]
    if ac.bitstring(initial, 8) != ord("A") or ac.bitstring(initial, 8) != ord("s"):
        raise ValueError("bad Arsenic signature")
    blockbits = ac.bitstring(initial, 4) + 9
    blocksize = 1 << blockbits
    endofblocks = ac.symbol(initial)
    out = bytearray()
    while not endofblocks and len(out) < outlen:
        mtf = list(range(256))
        randomized = ac.symbol(initial)
        tindex = ac.bitstring(initial, blockbits)
        block = bytearray()
        while True:
            sel = ac.symbol(selector)
            if sel < 2:
                zstate, zcount = 1, 0
                while sel < 2:
                    zcount += zstate if sel == 0 else 2 * zstate
                    zstate *= 2
                    sel = ac.symbol(selector)
                block += bytes([mtf[0]]) * zcount
            if sel == 10:
                break
            sym = 1 if sel == 2 else ac.symbol(mtfm[sel - 3])
            v = mtf.pop(sym)
            mtf.insert(0, v)
            block.append(v)
        if len(block) > blocksize:
            raise ValueError("block overflow")
        selector.reset()
        for m in mtfm:
            m.reset()
        streamcrc = None
        if ac.symbol(initial):
            streamcrc = ac.bitstring(initial, 32)
            endofblocks = True
        # inverse BWT
        n = len(block)
        counts = [0] * 256
        for b in block:
            counts[b] += 1
        cum = [0] * 256
        t = 0
        for i in range(256):
            cum[i] = t
            t += counts[i]
        transform = [0] * n
        for i, b in enumerate(block):
            transform[cum[b]] = i
            cum[b] += 1
        # walk + RLE (4 equal bytes followed by count)
        idx = tindex
        last = -1
        count = 0
        k = 0
        res = bytearray()
        randidx = 0
        randcount = ARSENIC_RAND[0]
        while k < n:
            idx = transform[idx]
            b = block[idx]
            if randomized and randcount == k:
                b ^= 1
                randidx = (randidx + 1) & 255
                randcount += ARSENIC_RAND[randidx]
            k += 1
            if count == 4:
                count = 0
                if b:
                    res += bytes([last]) * b
                continue
            if b == last:
                count += 1
            else:
                count = 1
                last = b
            res.append(b)
        out += res
        if streamcrc is not None:
            ARSENIC_STATS["ok" if zlib.crc32(out) == streamcrc else "bad"] += 1
    return bytes(out[:outlen])


# ---------------------------------------------------------------- archive walker
def u8(d, o): return d[o]
def u16(d, o): return struct.unpack_from(">H", d, o)[0]
def u32(d, o): return struct.unpack_from(">I", d, o)[0]


def walk(data):
    if not data.startswith(b"StuffIt (c)1997"):
        raise ValueError("not a StuffIt 5 archive")
    first = u32(data, 94)
    entries = {}
    order = []
    pos = first
    while pos + 4 <= len(data) and u32(data, pos) == 0xA5A5A5A5:
        e = {"off": pos}
        version = u8(data, pos + 4)
        hsize = u16(data, pos + 6)
        flags = u8(data, pos + 9)
        e["parent"] = u32(data, pos + 26)
        namelen = u16(data, pos + 30)
        dlen = u32(data, pos + 34)
        dclen = u32(data, pos + 38)
        dcrc = u16(data, pos + 42)
        isdir = bool(flags & 0x40)
        if isdir:
            e["name"] = data[pos + 48:pos + 48 + namelen].decode("mac_roman")
            e["dir"] = True
            if dlen == 0xFFFFFFFF:  # stray placeholder entries
                pos += hsize
                continue
        else:
            e["dir"] = False
            e["dmethod"] = u8(data, pos + 46)
            e["name"] = data[pos + 48:pos + 48 + namelen].decode("mac_roman")
            e["dlen"], e["dclen"], e["dcrc"] = dlen, dclen, dcrc
        p = pos + hsize
        flags2 = u16(data, p)
        e["type"] = data[p + 4:p + 8]
        e["creator"] = data[p + 8:p + 12]
        p += 14 + (22 if version == 1 else 18)
        e["rlen"] = 0
        if flags2 & 1:
            e["rlen"] = u32(data, p)
            e["rclen"] = u32(data, p + 4)
            e["rcrc"] = u16(data, p + 8)
            e["rmethod"] = u8(data, p + 12)
            p += 14
        if not isdir:
            e["rpos"] = p
            p += e.get("rclen", 0)
            e["dpos"] = p
            p += e["dclen"]
        entries[pos] = e
        order.append(e)
        pos = p
    for e in order:
        parts = [e["name"]]
        par = e["parent"]
        while par in entries:
            parts.append(entries[par]["name"])
            par = entries[par]["parent"]
        e["path"] = "/".join(reversed(parts))
    return order


def unpack(data, pos, clen, ulen, method, crc):
    raw = data[pos:pos + clen]
    if method == 0:
        out = raw
    elif method == 13:
        out = decompress13(raw, ulen)
    elif method == 15:
        bad = ARSENIC_STATS["bad"]
        out = decompress15(raw, ulen)
        return out, ARSENIC_STATS["bad"] == bad and len(out) == ulen
    else:
        raise NotImplementedError("method %d" % method)
    ok = crc16(out) == crc
    return out, ok


def safe(name):
    return "".join("_" if c in '<>:"\\|?*' or ord(c) < 32 else c for c in name).rstrip(" .") or "_"


def main():
    cmd, path = sys.argv[1], sys.argv[2]
    data = open(path, "rb").read()
    entries = walk(data)
    if cmd == "list":
        for e in entries:
            if e["dir"]:
                print("D  %s/" % e["path"])
            else:
                print("F  %-60s %4s/%4s data=%d(m%d) rsrc=%d(m%s)" % (
                    e["path"], e["type"].decode("mac_roman"), e["creator"].decode("mac_roman"),
                    e["dlen"], e["dmethod"], e["rlen"], e.get("rmethod", "-")))
        return
    outdir = sys.argv[3]
    only = sys.argv[4] if len(sys.argv) > 4 else None
    info = open(os.path.join(outdir, "_finderinfo.txt"), "a", encoding="utf-8") if os.path.isdir(outdir) else None
    os.makedirs(outdir, exist_ok=True)
    info = info or open(os.path.join(outdir, "_finderinfo.txt"), "a", encoding="utf-8")
    for e in entries:
        if only and only not in e["path"]:
            continue
        target = os.path.join(outdir, *[safe(x) for x in e["path"].split("/")])
        if e["dir"]:
            os.makedirs(target, exist_ok=True)
            continue
        os.makedirs(os.path.dirname(target), exist_ok=True)
        status = []
        if e["dlen"] or e["dclen"]:
            out, ok = unpack(data, e["dpos"], e["dclen"], e["dlen"], e["dmethod"], e["dcrc"])
            open(target, "wb").write(out)
            status.append("data " + ("ok" if ok else "CRC FAIL"))
        if e["rlen"]:
            out, ok = unpack(data, e["rpos"], e["rclen"], e["rlen"], e["rmethod"], e["rcrc"])
            open(target + ".rsrc", "wb").write(out)
            status.append("rsrc " + ("ok" if ok else "CRC FAIL"))
        info.write("%s\t%s\t%s\n" % (e["path"], e["type"].decode("mac_roman"), e["creator"].decode("mac_roman")))
        print(e["path"], ", ".join(status), flush=True)


if __name__ == "__main__":
    main()
