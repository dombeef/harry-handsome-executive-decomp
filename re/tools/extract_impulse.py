"""Extract per-direction (op, field, constant) from a SANE-heavy switch function (ApplyModedImpulse style)."""
import re, sys, struct
def ext80(hexs):
    b = bytes.fromhex(hexs)
    se = (b[0] << 8) | b[1]; sign = -1 if se & 0x8000 else 1; e = se & 0x7fff
    m = int.from_bytes(b[2:10], 'big')
    return sign * m * 2.0 ** (e - 16383 - 63)
def extract(path, name):
    txt = open(path).read().split('\n')
    start = [i for i, l in enumerate(txt) if l.startswith('; ' + name + ' ')][0]
    end = start + 1
    while end < len(txt) and not txt[end].startswith('; '): end += 1
    body = txt[start:end]
    cases = {}
    for l in body:
        if ' cases ' in l:
            for c in re.findall(r'(\d+):\$([0-9a-f]+)', l): cases[int(c[0])] = int(c[1], 16)
    addr = lambda l: int(l.split()[0], 16)
    lines = [l for l in body[1:] if re.match(r'^\s*[0-9a-f]+ ', l)]
    res = {}
    targets = sorted(set(cases.values()))
    for d, t in sorted(cases.items()):
        nxt = min([x for x in targets if x > t] + [10**9])
        blk = [l for l in lines if t <= addr(l) < nxt]
        ops = []
        consts = []
        cur = []
        for l in blk:
            m = re.search(r'move\.(l|w) #\$([0-9a-f]+), loc(14|10|c)\b', l)
            m2 = re.search(r'clr\.(l|w) loc(14|10|c)\b', l)
            if m2:
                cur.append('0' * (8 if m2.group(1) == 'l' else 4))
                if len(cur) == 3: consts.append(ext80(''.join(cur))); cur = []
            if m:
                cur.append(m.group(2).rjust(8 if m.group(1)=='l' else 4, '0'))
                if len(cur) == 3: consts.append(ext80(''.join(cur))); cur = []
            m = re.search(r'pea\.l \$(50|4e)\(a2\)', l)
            if m: field = m.group(1)
            m = re.search(r'move\.w #\$(0|2), -\(sp\)', l)
            if m: ops.append((('add' if m.group(1) == '0' else 'sub'), field))
            m = re.search(r'(add|sub)\.w d0, \$(50|4e)\(a2\)', l)
            if m: ops.append((m.group(1), m.group(2))); consts.append(1.0)
        res[d] = list(zip(ops, consts))
    return res
if __name__ == '__main__':
    r = extract(sys.argv[1], sys.argv[2])
    for d in sorted(r): print(d, r[d])
