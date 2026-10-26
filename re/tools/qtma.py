"""QuickTime Music Architecture: decode 'Tune' resources (MusicDescription header + event stream) and
'ssai' atomic instruments, as used by Harry the Handsome Executive's music.

  python qtma.py tunes MUSICFORK            summary of every Tune (parts, instruments, events, length)
  python qtma.py events MUSICFORK ID [N]    first N decoded events of one Tune
  python qtma.py inst INSTRUMENTFORK        the sampled instruments (ssai) and their samples
"""
import struct
import sys

import rsrc


def pstr(b):
    return b[1:1 + b[0]].decode("mac_roman")


# ---------------------------------------------------------------- QuickTime atom containers
def atoms(buf, p, end):
    """Yield (type, id, data_or_children) for the atoms in buf[p:end]."""
    while p + 20 <= end:
        size, typ, aid, _r, nkids, _r2 = struct.unpack(">I4sIHHI", buf[p:p + 20])
        if size < 20 or p + size > end:
            return
        typ = typ.decode("mac_roman")
        if nkids:
            yield typ, aid, list(atoms(buf, p + 20, p + size))
        else:
            yield typ, aid, buf[p + 20:p + size]
        p += size


def tone_desc(d):
    """ToneDescription: synthesizerType, synthesizerName, instrumentName, instrumentNumber, gmNumber."""
    return {"synthType": d[0:4].decode("mac_roman"), "synth": pstr(d[4:36]), "name": pstr(d[36:68]),
            "number": struct.unpack(">i", d[68:72])[0], "gm": struct.unpack(">i", d[72:76])[0]}


# ---------------------------------------------------------------- Tune
def parse_tune(d):
    hsize = struct.unpack(">I", d[:4])[0]
    parts = {}
    p = 0x14
    while p < hsize - 4:
        head = struct.unpack(">I", d[p:p + 4])[0]
        if head >> 28 != 0xF:
            break
        ln = head & 0xFFFF
        part = (head >> 16) & 0xFFF
        sub = (struct.unpack(">I", d[p + ln * 4 - 4:p + ln * 4])[0] >> 16) & 0xFF
        body = d[p + 4:p + ln * 4 - 4]
        if sub == 1:      # NoteRequest: NoteRequestInfo (8 bytes) + ToneDescription
            parts[part] = tone_desc(body[8:84])
        elif sub == 6:    # atomic instrument / note request as an atom container
            for typ, _id, kids in atoms(body, 12, len(body)):
                for t2, _i2, data in (kids if isinstance(kids, list) else []):
                    if t2 == "tone":
                        parts[part] = tone_desc(data)
        p += ln * 4
    events = []
    p = hsize
    t = 0
    while p + 4 <= len(d):
        w = struct.unpack(">I", d[p:p + 4])[0]
        top = w >> 29
        if top == 0:                              # rest
            events.append(("rest", t, w & 0x1FFFFFFF))
            t += w & 0x1FFFFFFF
            p += 4
        elif top == 1:                            # note
            part = (w >> 24) & 0x1F
            pitch = ((w >> 18) & 0x3F) + 32
            vel = (w >> 11) & 0x7F
            dur = w & 0x7FF
            events.append(("note", t, part, pitch, vel, dur))
            p += 4
        elif top == 2:                            # controller
            part = (w >> 24) & 0x1F
            ctl = (w >> 16) & 0xFF
            val = w & 0xFFFF
            events.append(("ctl", t, part, ctl, val - 0x10000 if val & 0x8000 else val))
            p += 4
        elif top == 3:                            # marker
            sub = (w >> 16) & 0xFF
            events.append(("marker", t, sub, w & 0xFFFF))
            p += 4
            if w == 0x60000000:                   # end of the sequence
                break
        else:
            w2 = struct.unpack(">I", d[p + 4:p + 8])[0]
            kind = w >> 28
            if kind == 0x9:                       # extended note
                part = (w >> 16) & 0xFFF
                pitch = w & 0xFFFF
                vel = (w2 >> 22) & 0x7F
                dur = w2 & 0x3FFFFF
                events.append(("xnote", t, part, pitch, vel, dur))
                p += 8
            elif kind == 0xA:                     # extended controller
                part = (w >> 16) & 0xFFF
                ctl = w & 0x3FFF
                val = w2 & 0xFFFF
                events.append(("xctl", t, part, ctl, val - 0x10000 if val & 0x8000 else val))
                p += 8
            elif kind == 0xB:                     # knob
                events.append(("knob", t, (w >> 16) & 0xFFF, w & 0xFFFF, w2))
                p += 8
            elif kind == 0xF:                     # general event (length in longs, head + tail)
                ln = w & 0xFFFF
                events.append(("general", t, (w >> 16) & 0xFFF, ln))
                p += ln * 4
            else:
                events.append(("unknown", t, hex(w)))
                p += 4
    return {"parts": parts, "events": events, "length": t}


# ---------------------------------------------------------------- ssai
SDSC = struct.Struct(">4shhIhiiiiiiii")


def parse_ssai(d):
    inst = {"samples": [], "knobs": {}}
    root = list(atoms(d, 12, len(d)))
    for typ, _id, kids in root:
        if typ != "sean":
            continue
        for t2, i2, data in kids:
            if t2 == "tone":
                inst["tone"] = tone_desc(data)
            elif t2 == "knbl":
                inst["knobs"] = knob_list(data)
            elif t2 == "sinf":
                s = {"id": i2}
                for t3, _i3, d3 in data:
                    if t3 == "sdsc":
                        (fmt, ch, bits, rate, sdid, off, n, ltype, ls, le, pn, plo, phi) = SDSC.unpack(d3[:SDSC.size])
                        s.update(format=fmt.decode("mac_roman"), channels=ch, bits=bits, rate=rate / 65536,
                                 dataId=sdid, offset=off, frames=n, loopType=ltype, loopStart=ls, loopEnd=le,
                                 pitchNormal=pn, pitchLow=plo, pitchHigh=phi)
                    elif t3 == "knbl":
                        s["knobs"] = knob_list(d3)
                inst["samples"].append(s)
            elif t2 == "sdat":
                inst.setdefault("data", {})[i2] = data
    return inst


def knob_list(d):
    if len(d) < 8:
        return {}
    n = struct.unpack(">i", d[:4])[0]
    out = {}
    for i in range(n):
        k, v = struct.unpack(">Ii", d[8 + i * 8:16 + i * 8])
        out[k & 0xFFFFFF] = v
    return out


def main():
    cmd, fork = sys.argv[1], sys.argv[2]
    r = rsrc.parse(open(fork, "rb").read())
    if cmd == "tunes":
        for tid in sorted(r["Tune"]):
            name, d = r["Tune"][tid]
            t = parse_tune(d)
            kinds = {}
            ctls = set()
            for e in t["events"]:
                kinds[e[0]] = kinds.get(e[0], 0) + 1
                if e[0] in ("ctl", "xctl"):
                    ctls.add(e[3])
            print(tid, name, "length", t["length"], kinds, "controllers", sorted(ctls))
            for p, tone in sorted(t["parts"].items()):
                print("    part", p, tone["synth"] or tone["synthType"], "|", tone["name"], tone["number"], tone["gm"])
    elif cmd == "events":
        t = parse_tune(r["Tune"][int(sys.argv[3])][1])
        for e in t["events"][:int(sys.argv[4]) if len(sys.argv) > 4 else 60]:
            print(e)
    elif cmd == "inst":
        for iid in sorted(r["ssai"]):
            name, d = r["ssai"][iid]
            inst = parse_ssai(d)
            print(iid, name, inst.get("tone", {}).get("number"), "knobs", inst["knobs"])
            for s in inst["samples"]:
                print("    ", {k: v for k, v in s.items() if k != "knobs"}, "knobs", s.get("knobs"))


if __name__ == "__main__":
    main()
