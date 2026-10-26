"""Write the reconstructed, relocated A5 world (initialised globals) for the web port.
web/data/a5.bin holds bytes [A5-below .. A5+above); web/data/a5.json gives the offset of A5 in it."""
import os, json, cwreloc, paths
G = paths.app_rsrc()
codes = {}
for fn in os.listdir(os.path.join(G, 'CODE')):
    s = int(fn.split('_')[0].split('.')[0])
    if s: codes[s] = open(os.path.join(G, 'CODE', fn), 'rb').read()
P = cwreloc.Program(codes, open(os.path.join(G, 'DATA', '0.bin'), 'rb').read())
W, A5 = bytes(P.world), P.a5
start = 0
# only the data area is needed (jump table above A5 is code addresses)
end = min(len(W), A5 + 0x14000)
open(os.path.join(paths.WEB, 'data', 'a5.bin'), 'wb').write(W[start:end])
json.dump({'a5': A5 - start}, open(os.path.join(paths.WEB, 'data', 'a5.json'), 'w'))
print('A5 at', hex(A5 - start), 'size', hex(end - start))
