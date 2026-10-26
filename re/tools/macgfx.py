"""Mac graphics decoders: system clut 8, HrSp encoded faces, PICT v1/v2, cicn."""
import struct

from PIL import Image


def _clut8():
    pal = []
    for i in range(215):
        pal.append((0xFF - 0x33 * (i // 36), 0xFF - 0x33 * ((i // 6) % 6), 0xFF - 0x33 * (i % 6)))
    ramp = [0xEE, 0xDD, 0xBB, 0xAA, 0x88, 0x77, 0x55, 0x44, 0x22, 0x11]
    pal += [(v, 0, 0) for v in ramp]
    pal += [(0, v, 0) for v in ramp]
    pal += [(0, 0, v) for v in ramp]
    pal += [(v, v, v) for v in ramp]
    pal.append((0, 0, 0))
    return pal


CLUT8 = _clut8()


# ---------------------------------------------------------------- HrSp
def decode_hrsp(d):
    """Return (rect, bounds, list-of-rows) where rows are lists of (x, bytes)."""
    rect = struct.unpack_from(">hhhh", d, 0)
    bounds = struct.unpack_from(">hhhh", d, 8)
    p = 16
    rows = []
    cur = None
    x = 0
    while p + 4 <= len(d):
        w = struct.unpack_from(">I", d, p)[0]
        p += 4
        op, arg = w >> 24, w & 0xFFFFFF
        if op == 0:
            break
        if op == 1:
            cur = []
            rows.append(cur)
            x = 0
        elif op == 3:
            x += arg
        elif op == 2:
            cur.append((x, d[p:p + arg]))
            x += arg
            p += (arg + 3) & ~3
        else:
            raise ValueError("bad HrSp op %d" % op)
    return rect, bounds, rows


def hrsp_to_image(d, pal=CLUT8):
    rect, bounds, rows = decode_hrsp(d)
    h = rect[2] - rect[0]
    w = rect[3] - rect[1]
    img = Image.new("RGBA", (max(w, 1), max(h, 1)), (0, 0, 0, 0))
    px = img.load()
    for y, row in enumerate(rows):
        for x0, data in row:
            for i, c in enumerate(data):
                r, g, b = pal[c]
                if 0 <= x0 + i < w and y < h:
                    px[x0 + i, y] = (r, g, b, 255)
    return img, rect, bounds


# ---------------------------------------------------------------- PICT
def _unpack_bits(data, p, n):
    out = bytearray()
    end = p + n
    while p < end:
        c = data[p]
        p += 1
        if c < 128:
            out += data[p:p + c + 1]
            p += c + 1
        elif c > 128:
            out += bytes([data[p]]) * (257 - c)
            p += 1
    return out


def _unpack_words(data, p, n):
    out = bytearray()
    end = p + n
    while p < end:
        c = data[p]
        p += 1
        if c < 128:
            out += data[p:p + 2 * (c + 1)]
            p += 2 * (c + 1)
        elif c > 128:
            out += data[p:p + 2] * (257 - c)
            p += 2
    return out


def _read_ctab(d, p):
    seed, flags, size = struct.unpack_from(">IHH", d, p)
    p += 8
    pal = [(0, 0, 0)] * 256
    for i in range(size + 1):
        val, r, g, b = struct.unpack_from(">HHHH", d, p)
        p += 8
        idx = i if flags & 0x8000 else val
        if idx < 256:
            pal[idx] = (r >> 8, g >> 8, b >> 8)
    return pal, p


class PictError(Exception):
    pass


def decode_pict(d, offset=0):
    """Decode a PICT (resource body, or file with 512-byte header if offset=512).
    Returns (PIL RGB image, frame rect, info dict)."""
    p = offset + 2
    frame = struct.unpack_from(">hhhh", d, p)
    p += 8
    top, left, bottom, right = frame
    W, H = right - left, bottom - top
    img = Image.new("RGB", (max(W, 1), max(H, 1)), (255, 255, 255))
    info = {"ops": [], "palettes": []}
    v2 = False
    if d[p:p + 2] == b"\x11\x01":
        p += 2
    elif d[p:p + 4] == b"\x00\x11\x02\xff":
        v2 = True
        p += 4
    else:
        raise PictError("unknown PICT version")

    def op16():
        nonlocal p
        if v2:
            p += p & 1
            o = struct.unpack_from(">H", d, p)[0]
            p += 2
        else:
            o = d[p]
            p += 1
        return o

    def region():
        nonlocal p
        n = struct.unpack_from(">H", d, p)[0]
        r = d[p:p + n]
        p += n
        return r

    def bits(op):
        nonlocal p
        direct = op in (0x9A, 0x9B)
        if direct:
            p += 4  # baseAddr
        rowbytes = struct.unpack_from(">H", d, p)[0]
        is_pixmap = bool(rowbytes & 0x8000)
        rowbytes &= 0x3FFF
        bnd = struct.unpack_from(">hhhh", d, p + 2)
        p += 10
        pal = None
        pixelsize = 1
        cmpcount = 1
        packtype = 0
        if is_pixmap:
            (pmversion, packtype, packsize, hres, vres, pixeltype, pixelsize, cmpcount, cmpsize,
             planebytes, pmtable, pmreserved) = struct.unpack_from(">HHIIIHHHHIII", d, p)
            p += 36
            if not direct:
                pal, p = _read_ctab(d, p)
        else:
            pal = [(255, 255, 255), (0, 0, 0)]
        src = struct.unpack_from(">hhhh", d, p)
        dst = struct.unpack_from(">hhhh", d, p + 8)
        mode = struct.unpack_from(">H", d, p + 16)[0]
        p += 18
        if op in (0x91, 0x99, 0x9B):
            region()
        bh = bnd[2] - bnd[0]
        bw = bnd[3] - bnd[1]
        rows = []
        for _ in range(bh):
            if rowbytes < 8 or packtype == 1:
                rows.append(d[p:p + rowbytes])
                p += rowbytes
                continue
            if rowbytes > 250:
                n = struct.unpack_from(">H", d, p)[0]
                p += 2
            else:
                n = d[p]
                p += 1
            if pixelsize == 16 and direct:
                rows.append(_unpack_words(d, p, n))
            else:
                rows.append(_unpack_bits(d, p, n))
            p += n
        if op in (0x90, 0x91, 0x98, 0x99) or not direct:
            pass
        sub = Image.new("RGB", (max(bw, 1), max(bh, 1)))
        spx = sub.load()
        for y, row in enumerate(rows):
            for x in range(bw):
                if direct and pixelsize == 32:
                    if cmpcount == 4:
                        c = (row[x + bw], row[x + 2 * bw], row[x + 3 * bw])
                    elif cmpcount == 3:
                        c = (row[x], row[x + bw], row[x + 2 * bw])
                    else:
                        c = tuple(row[4 * x + 1:4 * x + 4])
                elif direct and pixelsize == 16:
                    v = (row[2 * x] << 8) | row[2 * x + 1]
                    c = (((v >> 10) & 31) * 255 // 31, ((v >> 5) & 31) * 255 // 31, (v & 31) * 255 // 31)
                else:
                    bitpos = x * pixelsize
                    byte = row[bitpos >> 3] if (bitpos >> 3) < len(row) else 0
                    v = (byte >> (8 - pixelsize - (bitpos & 7))) & ((1 << pixelsize) - 1)
                    c = pal[v]
                spx[x, y] = c
        sw, sh = src[3] - src[1], src[2] - src[0]
        crop = sub.crop((src[1] - bnd[1], src[0] - bnd[0], src[1] - bnd[1] + sw, src[0] - bnd[0] + sh))
        dw, dh = dst[3] - dst[1], dst[2] - dst[0]
        if (dw, dh) != (sw, sh):
            crop = crop.resize((dw, dh))
        img.paste(crop, (dst[1] - left, dst[0] - top))
        if pal:
            info["palettes"].append(pal)
        if not v2:
            p += 0

    while p < len(d):
        op = op16()
        info["ops"].append(op)
        if op == 0xFF or (not v2 and op == 0xFF):
            break
        if op == 0x00:
            continue
        if op == 0x0C00:
            p += 24
        elif op == 0x01:
            region()
        elif op in (0x11,):
            p += 1
        elif op in (0x1A, 0x1B, 0x1F, 0x1D):
            p += 6
        elif op in (0x1E,):
            pass
        elif op in (0x03, 0x05, 0x08, 0x0D, 0x15, 0x16, 0x23, 0xA0):
            p += 2
        elif op in (0x04,):
            p += 1
        elif op in (0x06, 0x07, 0x0B, 0x0C, 0x0E, 0x0F, 0x21):
            p += 4
        elif op in (0x02, 0x09, 0x0A, 0x10, 0x20):
            p += 8
        elif op in (0x30, 0x31, 0x32, 0x33, 0x34):
            p += 8
        elif op in (0x38, 0x39, 0x3A, 0x3B, 0x3C):
            pass
        elif op == 0x22:
            p += 6
        elif op in (0x90, 0x91, 0x98, 0x99, 0x9A, 0x9B):
            bits(op)
        elif op == 0xA1:
            p += 2
            n = struct.unpack_from(">H", d, p)[0]
            p += 2 + n
        elif op == 0x28:
            p += 4
            p += 1 + d[p]
        elif op in (0x29, 0x2A):
            p += 1
            p += 1 + d[p]
        elif op == 0x2B:
            p += 2
            p += 1 + d[p]
        elif op == 0x2C:
            n = struct.unpack_from(">H", d, p)[0]
            p += 2 + n
        elif op == 0x2E:
            n = struct.unpack_from(">H", d, p)[0]
            p += 2 + n
        elif op in (0x70, 0x71, 0x72, 0x73, 0x74, 0x80, 0x81, 0x82, 0x83, 0x84):
            region()
        elif op == 0x8200 or op == 0x8201:
            n = struct.unpack_from(">I", d, p)[0]
            p += 4 + n
            info["quicktime"] = True
        elif 0x0100 <= op <= 0x7FFF:
            p += (op >> 8) * 2
        elif 0x8000 <= op <= 0x80FF:
            pass
        elif op >= 0x8100:
            n = struct.unpack_from(">I", d, p)[0]
            p += 4 + n
        else:
            raise PictError("unhandled PICT opcode %04x at %d" % (op, p))
    return img, frame, info


# ---------------------------------------------------------------- cicn
def decode_cicn(d):
    """Return RGBA image."""
    # PixMap (50 bytes incl baseAddr), mask BitMap (14), icon BitMap (14), iconData handle (4)
    pm_rowbytes = struct.unpack_from(">H", d, 4)[0] & 0x3FFF
    bnd = struct.unpack_from(">hhhh", d, 6)
    pixelsize = struct.unpack_from(">H", d, 32)[0]
    m_rowbytes = struct.unpack_from(">H", d, 50 + 4)[0]
    b_rowbytes = struct.unpack_from(">H", d, 64 + 4)[0]
    h = bnd[2] - bnd[0]
    w = bnd[3] - bnd[1]
    p = 82
    mask = d[p:p + m_rowbytes * h]
    p += m_rowbytes * h
    p += b_rowbytes * h
    pal, p = _read_ctab(d, p)
    pix = d[p:p + pm_rowbytes * h]
    img = Image.new("RGBA", (w, h))
    px = img.load()
    for y in range(h):
        for x in range(w):
            m = (mask[y * m_rowbytes + (x >> 3)] >> (7 - (x & 7))) & 1 if m_rowbytes else 1
            bitpos = x * pixelsize
            byte = pix[y * pm_rowbytes + (bitpos >> 3)]
            v = (byte >> (8 - pixelsize - (bitpos & 7))) & ((1 << pixelsize) - 1)
            r, g, b = pal[v]
            px[x, y] = (r, g, b, 255 if m else 0)
    return img
