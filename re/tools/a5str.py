"""Print Pascal/C strings from the reconstructed A5 world.  python a5str.py HEXOFF [HEXOFF...] | all"""
import os, sys, re
sys.path.insert(0, os.path.dirname(__file__))
import cwreloc, paths
G = paths.app_rsrc()
codes = {}
for fn in os.listdir(os.path.join(G, 'CODE')):
    s = int(fn.split('_')[0].split('.')[0])
    if s: codes[s] = open(os.path.join(G, 'CODE', fn), 'rb').read()
P = cwreloc.Program(codes, open(os.path.join(G, 'DATA', '0.bin'), 'rb').read())
W, A5 = P.world, P.a5
def pstr(o):
    n = W[A5 + o]; return W[A5 + o + 1:A5 + o + 1 + n].decode('mac_roman')
if sys.argv[1] == 'all':
    # scan for plausible pascal strings
    o = -A5
    while o < len(W) - A5:
        n = W[A5 + o]
        s = W[A5 + o + 1:A5 + o + 1 + n]
        if n >= 4 and all(32 <= c < 127 or c in (13,) or c >= 0xa0 for c in s):
            print('%05x %r' % (o, s.decode('mac_roman'))); o += 1 + n
        else:
            o += 1
else:
    for a in sys.argv[1:]:
        print(a, repr(pstr(int(a, 16))))
