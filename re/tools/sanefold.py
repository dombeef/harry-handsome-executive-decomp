"""Collapse SANE (_Pack4_FP) call sequences in a fold.py listing into symbolic expressions.

usage: python fold.py show FUNC | python sanefold.py
Each _Pack4_FP becomes one line such as  `; SANE loc58 := (word $50(a2) * -0.6)`; the pea/opcode pushes
and the constant stores that only feed SANE are dropped. Reads of a converted result
(`move.w loc4e, $50(a3)`) are annotated with the expression.
"""
import re, struct, sys

lines = sys.stdin.read().split('\n')
QUIET = '-q' in sys.argv

OPS = {0x00: '+', 0x02: '-', 0x04: '*', 0x06: '/'}
FMT = {0x0000: 'x', 0x0800: 'd', 0x1000: 's', 0x2000: 'i', 0x2800: 'l', 0x3000: 'c'}

def locnum(name):
    m = re.fullmatch(r'loc([0-9a-f]+)', name)
    return int(m.group(1), 16) if m else None

imm = {}     # local offset -> immediate (long or word) stored there: (size, value)
sym = {}     # local offset -> (fmt, expr)
pushes = []  # recent pushes since last Pack4: ('pea', name) / ('imm', value)
pending = []  # lines held back (pushes), flushed if not consumed

def ext_value(n):
    """80-bit extended constant stored as long@n, long@n-4, word@n-8"""
    a, b, c = imm.get(n), imm.get(n - 4), imm.get(n - 8)
    if not (a and b and c) or a[0] != 4 or b[0] != 4 or c[0] != 2:
        return None
    se = a[1] >> 16
    mant = ((a[1] & 0xffff) << 48) | (b[1] << 16) | c[1]
    sign = -1 if se & 0x8000 else 1
    e = (se & 0x7fff) - 16383
    return sign * mant / (1 << 63) * 2.0 ** e

def dbl_value(n):
    a, b = imm.get(n), imm.get(n - 4)
    if not (a and b) or a[0] != 4 or b[0] != 4:
        return None
    return struct.unpack('>d', struct.pack('>II', a[1], b[1]))[0]

def sgl_value(n):
    a = imm.get(n)
    if not a or a[0] != 4:
        return None
    return struct.unpack('>f', struct.pack('>I', a[1]))[0]

def fmt_num(v):
    return ('%.6g' % v)

def read(name, fmt):
    n = locnum(name)
    if n is None:
        return {'i': 'word ', 'l': 'long '}.get(fmt, fmt + ':') + name
    if n in sym:
        return sym[n][1]
    v = {'x': ext_value, 'd': dbl_value, 's': sgl_value}.get(fmt, lambda n: None)(n)
    if v is not None:
        return fmt_num(v)
    if fmt in ('i', 'l') and n in imm:
        return str(imm[n][1])
    return name

out = []
for ln in lines:
    m = re.match(r'^\s*([0-9a-f]+) (.*)$', ln)
    if not m:
        out.append(ln); continue
    addr, ins = m.groups()
    mm = re.match(r'pea\.l (.+)$', ins)
    if mm:
        pushes.append(('pea', mm.group(1))); pending.append(ln); continue
    mm = re.match(r'move\.w #\$([0-9a-f]+), -\(sp\)$', ins)
    if mm:
        pushes.append(('imm', int(mm.group(1), 16))); pending.append(ln); continue
    if ins.startswith('_Pack4_FP'):
        if not pushes or pushes[-1][0] != 'imm':
            out.extend(pending); pending = []; out.append(ln); pushes = []; continue
        op = pushes[-1][1]
        args = [p[1] for p in pushes[:-1] if p[0] == 'pea']
        code, fmt = op & 0xff, FMT.get(op & 0x3800, '?')
        txt = None
        if code in OPS and len(args) >= 2:
            src, dst = args[-2], args[-1]
            e = '(%s %s %s)' % (read(dst, 'x'), OPS[code], read(src, fmt))
            sym[locnum(dst)] = ('x', e) if locnum(dst) is not None else None; txt = '%s := %s' % (dst, e)
        elif code == 0x08 and len(args) >= 2:
            src, dst = args[-2], args[-1]
            txt = 'compare %s ? %s   (flags: dst vs src)' % (read(dst, 'x'), read(src, fmt))
        elif code == 0x0e and len(args) >= 2:   # Z2X: dst(ext) = src(fmt)
            src, dst = args[-2], args[-1]
            e = read(src, fmt)
            sym[locnum(dst)] = ('x', e); txt = '%s := %s  (%s->x)' % (dst, e, fmt)
        elif code == 0x10 and len(args) >= 2:   # X2Z: dst(fmt) = src(ext)
            src, dst = args[-2], args[-1]
            e = read(src, 'x')
            if fmt in ('i', 'l'):
                e = 'round(%s)' % e
            sym[locnum(dst)] = (fmt, e); txt = '%s := %s  (x->%s)' % (dst, e, fmt)
        elif code == 0x16 and args:
            dst = args[-1]
            e = 'trunc(%s)' % read(dst, 'x')
            sym[locnum(dst)] = ('x', e); txt = '%s := %s' % (dst, e)
        elif code == 0x14 and args:
            dst = args[-1]
            e = 'rint(%s)' % read(dst, 'x')
            sym[locnum(dst)] = ('x', e); txt = '%s := %s' % (dst, e)
        if txt is None:
            out.extend(pending); out.append(ln + '   ; op=%04x' % op)
        elif QUIET and code != 0x08:
            pass
        else:
            out.append(' %s ; SANE %s' % (addr, txt))
        pending = []; pushes = []
        continue
    # anything else: flush held pushes
    if pending:
        out.extend(pending); pending = []; pushes = []
    mm = re.match(r'move\.([lw]) #\$([0-9a-f]+), (loc[0-9a-f]+)$', ins)
    if mm:
        n = locnum(mm.group(3)); imm[n] = (4 if mm.group(1) == 'l' else 2, int(mm.group(2), 16)); sym.pop(n, None)
        continue  # constant feeding SANE
    mm = re.match(r'clr\.([lw]) (loc[0-9a-f]+)$', ins)
    if mm:
        n = locnum(mm.group(2)); imm[n] = (4 if mm.group(1) == 'l' else 2, 0); sym.pop(n, None)
        out.append(ln); continue
    mm = re.match(r'move\.([lw]) (.+), (loc[0-9a-f]+)$', ins)
    if mm:
        src, n = mm.group(2), locnum(mm.group(3))
        srcn = locnum(src)
        if srcn is not None and srcn in sym:
            sym[n] = sym[srcn]
        else:
            sym[n] = ('i' if mm.group(1) == 'w' else 'l', '%s %s' % ('word' if mm.group(1) == 'w' else 'long', src))
        imm.pop(n, None)
        out.append(ln); continue
    mm = re.match(r'move\.w (loc[0-9a-f]+), (.+)$', ins)
    if mm:
        n = locnum(mm.group(1))
        # low word of a long converted result lives 2 bytes above the long's name
        if n + 2 in sym and sym[n + 2][0] in ('l',):
            out.append('%s   ; = %s' % (ln, sym[n + 2][1])); continue
        if n in sym and sym[n][0] in ('i',):
            out.append('%s   ; = %s' % (ln, sym[n][1])); continue
    mm = re.match(r'move\.l (loc[0-9a-f]+), (.+)$', ins)
    if mm:
        n = locnum(mm.group(1))
        if n in sym:
            out.append('%s   ; = %s' % (ln, sym[n][1])); continue
    out.append(ln)
out.extend(pending)
print('\n'.join(out))
