# Harry the Handsome Executive: Web Port

A browser version of **Harry the Handsome Executive**, the 1997 Macintosh action game by Ben Spees, published by
Ambrosia Software. You play Harry, an office worker who scoots around the office in his swivel chair, kicking
off walls, dodging hazards and fending off his co-workers.

The port is a full rewrite of the original 68k Mac program in JavaScript, made by reading the game's own
disassembled code function by function. It runs in any modern browser on desktop, tablet or phone, plays the
original Episode 1 levels with the original graphics and sound, and needs no plug-ins or emulator.

> This is a non-commercial fan project. It is not affiliated with or endorsed by Ben Spees or Ambrosia Software.
> The game's graphics, sound, music, levels and code belong to their owners.
> See [LICENSE](LICENSE).


## Running it

The game is a static web page in `web/`. Browsers won't load the game's modules from `file://` addresses, so
serve the folder with any static web server, for example Python's:

```bash
python -m http.server 8077 --directory web
```

Then open <http://localhost:8077>, click **Click to start**, and play. After updating the files, reload with
Ctrl+Shift+R (⌘+Shift+R on a Mac) so the browser doesn't run cached code. For development,
`python re/tools/devserver.py 8077` does the same with caching turned off.

Two URL options help with testing: `?level=N` starts a new game on level N, and `?cheats=1` turns on the
original game's developer mode (F1 refills comfort, F11 skips a level, and so on).


## How it was made

1. **Extraction.** The game came from the `Harry_(1.0.1)_installer.sit` archive (StuffIt 5), downloaded from
   [Macintosh Repository](https://www.macintoshrepository.org/2994-harry-the-handsome-executive). The archive
   holds an Installer VISE package. `sit5.py` unpacked the archive, the VISE package was unpacked in turn,
   and `rsrc.py` split out the application's resource fork, the Graphics, Sounds, Music, Titles and
   Instruments files, and the "Episode 1" world file.
2. **Disassembly.** The program is a CodeWarrior 68k application in seven code segments. It was compiled with
   MacsBug symbols, so all **633 functions keep their original names**. `disasm68k.py` disassembled the code
   into `re/asm68k`, with the jump table, relocations and Mac Toolbox trap names resolved.
3. **Reading the code.** `compact.py` and `fold.py` turned the raw listing into easier-to-read forms
   (`re/lst`, `re/lst2`), folding stack pushes into call arguments, and `sanefold.py` collapses the SANE
   floating-point library calls into expressions. `export_a5.py` rebuilt the program's initialised global
   variables (the "A5 world") into `web/data/a5.bin`.
4. **Rewriting.** Every game function was rewritten in JavaScript, keeping the original structure, names and
   numbers. Comments name the function being ported (for example `HandleDoorSprite`, `UpLevel`) so any part of
   the port can be checked against the disassembly. Where the original has a quirk, the port keeps it unless
   it is clearly a bug; fixes are commented.
5. **Assets.** Rather than converting the graphics up front, the port reads the original resource files
   directly. `web/data` holds the resource forks (as plain `.rsrc` files), and the browser decodes PICT
   pictures, `cicn` icons, Harry's compressed `HrSp` sprites and `snd ` sounds itself.
6. **Music.** The original played its music live through QuickTime: each `Tune` resource is a list of note
   and controller events (QuickTime Music Architecture), and QuickTime's synthesiser played them. The port does
   the same in the browser (`web/js/game/tuneplayer.js`):
   - The music for levels 5 and 8-14 is written for **Harry's own instruments**: the 35 sampled instruments
     (`ssai`) in the "Harry Instruments" file that ships with the game. The port plays these tunes from the
     game's data, just as the original did.
   - The title, story and ending music and the other levels' music were written for **QuickTime's built-in
     General MIDI instruments**, which were part of QuickTime, not the game. These play recordings of the
     original instead (`web/data/music`), made by playing the game's own tunes through QuickTime.

   The synthesised tunes were checked against recordings of the original: each tune's length matches to
   within 0.2%, the notes line up, and the spectra match closely (correlations of 0.92-0.98). `qtma.py`
   decodes the tunes and instruments for inspection.


## The JavaScript adaptation

The original was built on the Mac Toolbox and the **Sprite Animation Toolkit (SAT)**. The port recreates just
enough of both for the game code to run unchanged in spirit.

**`web/js/core`** emulates the Mac side:

| File | What it stands in for |
|---|---|
| `render.js` | The 8-bit indexed screen, Harry's custom sprite blitters, and the palette-effect tables (tints, translucency, glow, red flashes). It also presents the frame to the page, with scaling. |
| `qd.js` | QuickDraw: ports, pens, rectangles, lines, polygons and text. Text can be enlarged on small screens. |
| `sat.js` | Sprite Animation Toolkit: the sprite list and the per-frame sprite run. |
| `res.js`, `rsrc.js`, `gfx.js` | The Resource Manager, plus decoders for PICT, `cicn`, `HrSp` and the system colour table. |
| `dialog.js` | The Dialog Manager. It draws the game's own `DLOG`/`DITL` dialogs in the classic style. |
| `input.js` | Keyboard, mouse and touch, translated into Mac virtual key codes. |
| `timing.js` | Mac `TickCount` (60 ticks a second), so the original's timing loops keep their speed. |
| `level.js`, `a5.js`, `util.js` | Level records, the original's initialised globals, and fixed-point helpers. |
| `progbar.js` | The startup loading bar. |

**`web/js/game`** is the game itself: physics, the player, collisions, tiles, the HUD, sound and music,
level flow, menus, saving and options. **`web/js/game/sprites`** holds every sprite family: doors, desks,
co-workers, robots, ghosts, turrets, the boss and so on.

**`web/js/shell.js`** builds the page around the game screen: the menu bar, the touch controls and the
screen scaling.

A few conventions make the port easy to compare with the original:

- Sprite fields and globals keep the original's memory offsets where their meaning wasn't certain (`f50`,
  `g_46c0`, ...), and get descriptive names where it was.
- Physics uses the original's fixed-point arithmetic. Floating-point code was translated from the SANE library
  calls, so movement, bounces and impulses match the original's numbers.
- Late-bound calls between modules go through a small `Hooks` table, which stands in for the original's jump
  table and avoids circular imports.


## Upgrades over the original

All of these can be switched off or changed in **Game > Options** or the **View** menu, where that makes sense.

- **Mac OS menu bar** with the original File and Game menus, plus a View menu. The Apple menu uses Harry's own
  application icon.
- **Save Game anywhere** from the File menu. It works like the photocopier saves, which still work too.
- **Save between levels** is on by default. It saves quietly to an "Autosave" slot instead of asking for a
  name every level.
- **Two key bindings per action.** Arrows and WASD both work by default. The second keys are Shift (kick),
  Q (select item), E (use item) and M (map).
- **Touch controls** for phones and tablets. They are see-through buttons over the screen by default, or can
  sit beside it. On portrait and squarish screens the game moves up to clear them.
- **Screen size** 1:1, 1:2 or filling the window, with three scaling filters: sharp pixels, sharp with
  smoothed edges, and smooth.
- **Readable text.** Text is anti-aliased, using Chicago and Geneva fonts. On small screens, dialogs and
  speech bubbles enlarge themselves to keep text at least 8 points (or its original size), and bubble tails
  stay pointed at the speaker.
- **Auto-open doors.** Pushing into an unlocked door from the side a kick would open it opens it, with no
  need to turn around and kick.
- **Pause** with Caps Lock (as in the original), the Pause button or the menu. The game also pauses itself
  when the page is hidden, for example when switching apps on a phone.
- **No registration.** The "unregistered" limits are removed, since the game's registration codes have been
  made freely available.


## Limitations

- **Episode 1 only.** Custom worlds ("New Game In Custom World") are not supported yet.
- **Music is close, not identical.** The tunes for Harry's own instruments are synthesised by the browser
  rather than by QuickTime, so they sound very close to the original but not bit-for-bit the same. The other
  tunes are MP3 recordings, and they are quieter than the synthesised ones.
- **Fonts are stand-ins.** Chicago and Geneva come from TrueType versions, and Helvetica falls back to the
  system's Helvetica or Arial. The bundled Geneva has unusually wide spaces between words.
- **Saves live in the browser.** They are stored in the browser's local storage, so they belong to one browser
  on one device and are lost if site data is cleared. Saved games from the Mac version can't be loaded.
- **Hardware options are gone.** Settings that only mattered on 1990s Macs (interlacing, line skipping, colour
  depth switching) are not offered.
- **Small screens.** On a phone held upright, the Options dialog can only grow as wide as the game screen, so
  its text stays a little under 8 points. Turn the phone sideways for larger text.
- **Browser rules.**
  - Sound can only start after a click or tap, hence the start button.
  - Browsers keep Ctrl/⌘ + N, W and Q for themselves, so those menu shortcuts are not offered.
  - iPhones don't allow web pages to go full screen.
- **Testing.** The port has been tested mainly in Chromium-based browsers. Behaviour was checked against the
  disassembly and by play-testing, not frame by frame against a real 1997 Mac.


## Folders

| Folder | Contents |
|---|---|
| `web/` | **The game.** The page, its JavaScript (`web/js`), fonts, icon, and the game's resource files (`web/data`): the application, Graphics, Sounds, Music, Titles and Instruments files, the Episode 1 world, and the soundtrack recordings (`web/data/music`). This folder is all a web host needs. |
| `re/` | Reverse-engineering workspace (see below). |

### The `re/` folder

| Path | Contents | Fidelity to the original |
|---|---|---|
| `re/asm68k/` | Disassembly of all seven code segments (`seg1.s` to `seg7.s`), with the function list and jump table. | **Exact.** Every byte of code printed in it matches the original program byte for byte; this was verified against the original CODE resources. The only bytes not printed are each segment's small header and the compiled-in function-name records, which appear as the `; FunctionName` headings instead. Labels and comments (Toolbox trap names, jump-table targets, global names) are annotations added by the tools. |
| `re/lst/`, `re/lst2/` | Easier-to-read versions of the same listings. `lst2` folds stack pushes into function-call form. | Derived and reformatted. They are working aids, not a copy of the program. |
| `re/notes.md`, `globals.txt`, `snd_ids.txt`, `a5strings.txt` | Research notes: what the globals, sounds and strings are, and the port's status. | Original research. |
| `re/preview/` | PNG renders of the game's pictures and sprites, made while writing the decoders. | Images of the original artwork. |
| `re/tools/` | The Python tools used to unpack, disassemble and study the game (see below). | Original work. |

### The tools (`re/tools`)

All are Python 3 scripts. Most use only the standard library; `disasm68k.py` needs Capstone and `macgfx.py`
needs Pillow (`pip install capstone pillow`). The comment at the top of each file explains its usage. Tools
that read the game's program code (`a5str.py`, `export_a5.py`) expect the `HARRY_APP_RSRC` environment
variable to point at the application's resource fork, dumped with `rsrc.py dump`.

| Tool | What it does |
|---|---|
| **Unpacking** | |
| `sit5.py` | Lists and extracts StuffIt 5 archives (the format the Harry installer download comes in). |
| `macfmt.py` | Unpacks BinHex, MacBinary and classic StuffIt files, recursing into archives inside archives. |
| `rsrc.py` | Reads classic Mac resource forks: lists them, or dumps every resource to its own file. |
| **Program code** | |
| `disasm68k.py` | Disassembles the game's 68k CODE resources into `re/asm68k`, with function names, relocations, jump-table targets and global names. |
| `cwreloc.py` | Decodes CodeWarrior's runtime structures (the compressed DATA 0, relocation lists and jump table); used by the disassembler. |
| `traps68k.py` | Names classic Mac OS A-line traps (the Toolbox and OS calls) for the disassembler. |
| `compact.py` | Turns the disassembly into compact listings (`re/lst`), and prints any function by name: `compact.py show NAME`. |
| `fold.py` | Folds the compact listings into call form (`re/lst2`): `fold.py show NAME` prints a function with its calls' arguments. |
| `sanefold.py` | Collapses SANE floating-point library calls in `fold.py` output into readable expressions (`fold.py show NAME \| sanefold.py`). |
| `extract_impulse.py` | Pulls the per-direction constants out of a SANE-heavy switch function (used for the physics impulse tables). |
| `a5str.py` | Prints strings from the game's initialised globals by offset (or all of them). |
| `export_a5.py` | Writes the initialised globals for the web port (`web/data/a5.bin` and `a5.json`). |
| **Assets** | |
| `macgfx.py` | Decodes the game's graphics: the system colour table, PICT pictures, `cicn` icons and Harry's `HrSp` sprites. |
| `qtma.py` | Decodes QuickTime music: the `Tune` resources (instruments and note events) and the `ssai` sampled instruments. |
| `dls.py` | Reads DLS instrument banks (such as QuickTime's General MIDI set), for comparing the General MIDI tunes. |
| **Development** | |
| `devserver.py` | Serves `web/` locally with caching turned off, so edited code always reloads. |
| `paths.py` | Where the tools find `re/`, `web/` and the game files; used by the others. |


## Credits

- **Harry the Handsome Executive** (c) 1997 Ben Spees / Ambrosia Software, Inc. Game design, programming and
  artwork by its original creators.
- The Harry 1.0.1 installer used for this port was sourced from
  [Macintosh Repository](https://www.macintoshrepository.org/2994-harry-the-handsome-executive).
- The soundtrack recordings (`web/data/music`) were made by Zacha Pedro (Ambrosia Software forums) by
  playing the game's tunes through QuickTime's instruments, and come from the fan-maintained Harry archive.
  They also served as the reference for checking the synthesised music.
- ChicagoFLF is a free TrueType recreation of Apple's Chicago, under its author's terms. Geneva is Apple's.
- Web port, tools and reverse engineering by Claude Opus 5.5, directed by dombeef.

The port's own code is MIT licensed with a request for visible credit. The original game is not covered by
that license. See [LICENSE](LICENSE).
