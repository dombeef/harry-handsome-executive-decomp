# Harry the Handsome Executive — reverse engineering notes

## Toolchain (re/tools)
- `sit5.py`, `macfmt.py` (hqx/MacBinary/SIT!) and `rsrc.py` unpack the archives and resource forks (the
  Installer VISE package inside the download was unpacked separately).
- `disasm68k.py RSRC_DIR re/asm68k` -> full annotated asm (trap names, jump-table targets, the global names in
  `re/globals.txt`, "hexoff name [size]"); `compact.py` -> `re/lst/*.lst`; `fold.py` -> `re/lst2/*.lst`.
  `python re/tools/fold.py show FUNC | python re/tools/sanefold.py -q` prints one function in readable form.
- Tools that read the program (a5str.py, export_a5.py) take the dumped app resource fork from HARRY_APP_RSRC.
- Binary is CodeWarrior 68k far model: absolute longs are relocated (A5 world / CODE1 / own seg).
  Jump table entries live above A5 (`jsr $X.l` where X%8==0 -> function). Globals: `$XXXX.l` = A5+XXXX.
- Pascal-convention functions (UPPERCASE names, SAT library): args pushed left->right, callee pops.
  C-convention (MixedCase): args pushed right->left; first arg at 8(a6).
- LONG PUSHES COVERING TWO WORD PARAMS: Pascal (SetRect, SAT, UPPERCASE): `move.l #$AAAABBBB` = (first=BBBB,
  second=AAAA). C (MixedCase): `#$AAAABBBB` = (first=AAAA, second=BBBB). e.g. SetRect(r,L,T,R,B) with
  `clr.l; move.l #$00200010` = L0 T0 R16 B32.
- FG tile kinds (fgKindRects g_790e, 20 bytes: +4 hot rect, +0xc redraw rect): 0 left half, 1 top half,
  2 right half, 3 bottom half, 4 bottom-left qtr, 5 top-left, 6 top-right, 7 bottom-right, 50 full,
  51/52/53 inset 4/8/12, else full. BG kinds (bgKindRects g_748e, 12 bytes, +4 rect): 3,4,5 inset 6; else inset 2.
- `(x/2)*2` idiom (lsr #31 add asr add) = trunc-to-even.
- 68020 DIVSL shown as `divsl.l ea, dR:dQ` (remainder:quotient).

## Data formats
- Mac system clut 8 palette; index 0 white = transparent in encoded faces.
- HrSp = cached EncodeRect output: rect(8) bounds(8) then ops (u32: op<<24|arg): 0 end, 1 new row,
  3 skip arg px, 2 copy arg px (+data padded to 4).
- Face record (28 bytes): rect(0..8: top,left,bottom,right; for sets = 0,0,h,w), bounds(8..16), +10 handle,
  +14 mask rgn, +18 blitproc.
- LoadEncFaceSetFromPICT(pict, count, w, h, cols, maskFrom, maskTo, hrspBase): cell i = (i%cols, i/cols);
  if hrspBase!=0 face i = HrSp(hrspBase+i).
- Tiles: BG faces PICT 180 (96 tiles, 8 cols, 32x32), FG faces PICT 181 (64 tiles). Level may override:
  level+0x120fe = BG pict id, +0x120fc = FG pict id (0 -> default).
- Hlvl (0x12988 bytes): BG grid u16[128][128] at 0 (row*256+col*2), FG grid at 0x8000.
  Objects at 0x10000: 256 records x 16 bytes: +0 byte active, +2 id, +4..0xb params, +0xc v, +0xe h.
  Header: +0x12032 level number (corruption check), +0x12034 byte custom sounds,
  +0x12074 level info fields #0..#15 (u16 each; see doc "Level Info"), +0x12094 BG tile kinds (4-bit packed,
  96), +0x120c4 FG tile kinds (8-bit packed, for FG tiles 32..55), +0x120f4 start v, +0x120f6 start h,
  +0x120f8 start dir, +0x120fa music id, +0x120fc/+0x120fe tilesets, +0x12100 physics flag, +0x12102..0x1210a
  5 physics constants (defaults 50,70,245,252,150), +0x1208c added to g_f682 each frame,
  +0x114c0 Pascal string (world name check, CheckWorldCorruption).
- Objects IDs: see the "Level Info" document in the game's own Documentation folder (Object IDs).

## SAT (Sprite Animation Toolkit) sprite record (size 0xa2 in Harry)
- 0 kind(word) 2 where.v 4 where.h 6 hotRect(t,l,b,r) e hotRect2(abs) 16 face 1a task(proc) 1e hit(proc)
  22 destruct 26 ? 2a oldwhere 2e next 32 prev 36 drawRect 3e oldDrawRect 46 ?
- Game fields: 4c layer/sortkey, 4e,50 ?, 52,54 ?, 5a v(int) 5c h(int), 5e h<<8 (fixed), 62 v<<8 (fixed),
  66 dir/frame, 68 param(obj index/param), 6e long, 72,74, 76 idle slot index, 7c, 7e face (EncFace*),
  82,84 =-1, 86 long, 8a byte, 8b byte, 8c byte, 8e word, 92 byte, 9e tile-hit proc.
- SATCONFIGURE(false, sort=1 (by $4c), search=1 (AppForwardSearch5), 0x40).
- SATSKIP each frame: for s in list: s.task(s); hot2 = hot+where. Then BUBBLESORT (one forward + one backward
  pass by $4c), SEARCHHITS: for a in list: for b after a while b.$4c <= a.$4c+0x40: if SectRect(hot2):
  a.hit(a,b); b.hit(b,a). Then sprites with task==nil: hit=nil, kind=0.
- New sprites inserted at list head. setup(s) called; hot2 = hot+where.

## Game structure
- Playfield 448x448 at (16,16) in a 640x480 screen; PICT 129 = game screen frame. HUD on the right.
- GameLoop: 30Hz (2 ticks) frame cap; per frame: HandleIdleSprites, HandleSprites (SATSKIP + CheckPlayerCollision),
  FindUpperLeftCorner (camera), SCROLLTO, CheckTileCollisions, EraseSprites/DrawSpritesBehindTiles/
  RedrawFGTiles/DrawSpritesAboveTiles, WRAPCOPY to screen, UpdateText/Meters/Ammo, CheckGameEvents,
  CheckGameLoopKeys, UpdateDynamicSounds, UpdateTrackMap. Ends when g_46ce (levelDone) set.
- Idle sprites: 255 slots x 0x44 at g_14294. Activate when |viewCenter - pos - 24| < 348 on both axes;
  deactivate when > 348 on either and hot rect not intersecting view rect (448x448 at viewLeft/viewTop).
- Player: kind 0x45, layer 10, faces g_81fe (PICT 200, 144 faces 64x64, 12 cols, HrSp 1101+), 36 directions.

## Port status (web/)
- web/index.html + js/main.js boot; js/rsrc.js + js/gfx.js (decoders); js/core: render (indexed fb + effect
  tables + blit), sat (sprite list), level, res (resource chain + face loaders), input (Mac keycodes), timing
  (TickCount/async).
- js/game: state (G globals, Prefs), hooks (late-bound cross-module functions; missing ones warn once),
  tiles, masks (region collisions), physics, player, sound (WebAudio, S(id) handles), world (level setup,
  idle sprites, tile collisions, camera, draw pipeline), game (GameLoop).
- MILESTONE 2026-10-04: level 1 renders; Harry scoots/kicks/bounces with ported physics.
- MILESTONE 2026-10-05: complete game. All seg3 sprite families ported (js/game/sprites/*: simple, door,
  message+ShowBalloon, pushables (plant/cooler/barrel/chair/ramp), collider, effect, enemyshot, enemies
  (dart thrower, blob, robot/MG, reversor, turret, ghost, boulder), weapons, mechanisms (button, sliding
  door, grate, fire pipe), people (coworker, mail guy, scientist), boss), death sequence, main menu,
  new game / continue / copier saves (localStorage), Game Over / abort / warp dialogs (core/dialog.js renders
  DLOG/DITL), map, credits, options (prefs persisted). Every level's objects activated without errors.
- Not ported: custom worlds (Open World / "Other...").
  The "wavygravy" ripple is dead code in 1.0.1 (BuildSineTable is empty, nothing reads g_f682).
- sanefold.py collapses SANE (_Pack4) float code; export_a5.py writes the initialised A5 world to
  web/data/a5.bin (static strings/tables, read via js/core/a5.js).
- KeyMap: key k = bit (k&7) of byte (k>>3); folded listings show KeyMap bytes as locNN where loc10 = byte 0,
  loc1 = byte 15 (byte = 16 - N).

## Web additions
- Fonts: web/fonts/fonts.css defines HarryChicago (ChicagoFLF.ttf), HarryGeneva (Geneva-web.ttf), HarryHelvetica
  (local Helvetica/Arial). qd.js renders text anti-aliased into the 8-bit palette (TextOpts.smooth / Prefs.smoothText).
  Original faces: Chicago 12 (dialogs), Geneva 9 (balloons), Helvetica 9 plain/bold (HUD, licence line, inventory
  counts), Helvetica 27 bold + 11 (level intro), Helvetica 36 (cheat banner).
- js/shell.js: HTML menu bar (MENU 128-130 + View), touch pads (Input.actions), screen size/filter (Display.setBackingScale).
- game/commands.js: menu command queue, run from the main menu loop / checkGameLoopKeys / pause loop.
- game/keys.js actionDown(name): Prefs.keys[name] = [primary, secondary]; prefs persist in localStorage
  (harry.prefs), saved games in harry.savedGames.
- Pause = original PICT 4921 at (128,192) + snd 198. Save between levels = silent "Autosave" slot.
- Prefs.autoDoors: hitplayer door branch opens closed/unlocked doors from the kick-opening side.
- Port zoom (qd.js setZoom/zoomFor/unzoom): dialogs, Options, save picker, credits and balloons enlarge when the
  screen is shown small (target: original text size, never below 8pt; capped to fit the 640x480 screen).
- Touch layout: Prefs.touchLayout 'overlay' (default, see-through corners) or 'beside'.
- Audit (2026-10-05): every named game function is ported; unmatched names are Toolbox/SAT plumbing. Not ported on
  purpose: custom worlds, registration (Register…, LevelLimit nag DLOG 170), interlace/line-skip/depth options,
  CheckWorldCorruption. Ramp-vs-ramp RectBounceFake2 == rectBounceFake with a Point offset.
- Startup loading bar ported (core/progbar.js = Init3DProgBar/Update3DProgBar): PICT 128 splash + music 600,
  bar at (205,423) w228. Original advanced 72/65536 per face; web: download = first half, faces (1125) = second.
- web/fonts/Geneva-web.ttf = the GENEVA.TTF supplied for the port, with its cmap rebuilt (Chrome/OTS rejected
  the original's format-4 cmap header). Its space glyph is unusually wide (0.715 em).

## Music from game data (2026-10-06)
- Tune resources = QTMA MusicDescription ('musi', one NoteRequest general event per part: subtype 1 =
  NoteRequestInfo + ToneDescription; subtype 6 = the same as an atom container 'sean' > 'tone') + 32-bit events.
  Time scale 600/s (matches every recording to <0.2%). End = exactly 0x60000000 (other markers are beats).
  Controllers 7 volume / 10 pan (256..512) / 32 bend (+-2 semitones), all 8.8; 33 aftertouch ignored.
- SetMusic: TuneSetHeaderWithSize (0x1c) + TuneQueue (0x0a, rate 1.0, flags 0x16 = loop).
- 'Harry Instruments' = QT music component with 35 'ssai' atom containers: tone, knbl (knobs), sinf (sdsc +
  knbl), sdat (8-bit 22050 Hz). Knobs (0x020000nn): 1 attack ms, 2 decay ms, 3 sustain (65536 = 1), 6 release
  ms, 18 transpose (1/256 semitone), 29 sustain time ms, 30 sustain infinite, 32/33 velocity range,
  35 pitch sensitivity % (drums 0 = fixed pitch).
- Tunes 605 and 608-614 use only Harry's instruments and are synthesised (js/game/tuneplayer.js). 614 parts 2/5
  have a zero name length; the names "Towerful"/"Racked" follow it.
- The others (600-604, 606, 607, 615, 616, 620) use QuickTime's built-in GM instruments (numbers 1..128, drum
  kits 16385+), which aren't in the game: they play the recordings in web/data/music (Zacha Pedro's, made by
  playing the Tune data through QuickTime). 620 mixes GM parts with one Harry part (Tech Drum Kit 1).
- Checked by rendering offline and comparing with the recordings: Harry-instrument tunes match at 0.92-0.98
  (semitone-spectrum correlation, best at zero pitch shift; lengths within 0.2%). A test render of the GM tunes
  through Apple's QuickTime GS sound set (DLS) matched at 0.77-0.98, with one difference: in QuickTime, Fingered
  Bass's lowest region (keys 0-43) sounded an octave higher than the bank implies (root 44 rather than 56).
