"""Classic Mac OS A-line trap names (OS traps keyed by A0nn, Toolbox by A8nn-ABnn)."""
_OS = """00 Open 01 Close 02 Read 03 Write 04 Control 05 Status 06 KillIO 07 GetVolInfo 08 Create 09 Delete
0A OpenRF 0B Rename 0C GetFileInfo 0D SetFileInfo 0E UnmountVol 0F MountVol 10 Allocate 11 GetEOF 12 SetEOF
13 FlushVol 14 GetVol 15 SetVol 17 Eject 18 GetFPos 19 InitZone 1A GetZone 1B SetZone 1C FreeMem 1E NewPtr
1F DisposePtr 20 SetPtrSize 21 GetPtrSize 22 NewHandle 23 DisposeHandle 24 SetHandleSize 25 GetHandleSize
26 HandleZone 27 ReallocHandle 28 RecoverHandle 29 HLock 2A HUnlock 2B EmptyHandle 2C InitApplZone
2D SetApplLimit 2E BlockMove 2F PostEvent 30 OSEventAvail 31 GetOSEvent 32 FlushEvents 33 VInstall 34 VRemove
36 MoreMasters 38 WriteParam 39 ReadDateTime 3A SetDateTime 3B Delay 3C CmpString 40 ResrvMem 44 SetFPos
45 FlushFile 46 GetTrapAddress 47 SetTrapAddress 48 PtrZone 49 HPurge 4A HNoPurge 4B SetGrowZone 4C CompactMem
4D PurgeMem 50 RelString 54 UprString 55 StripAddress 58 InsTime 59 RmvTime 5A PrimeTime 5C MemoryDispatch
60 HFSDispatch 61 MaxBlock 62 PurgeSpace 63 MaxApplZone 64 MoveHHi 65 StackSpace 66 NewEmptyHandle 67 HSetRBit
68 HClrRBit 69 HGetState 6A HSetState 6E SlotManager 85 PowerOff 8F OSDispatch 90 SysEnvirons 93 Microseconds
98 HWPriv AD Gestalt 9F TrapUnimpl"""

_TB = """00 SoundDispatch 01 SndDisposeChannel 02 SndAddModifier 03 SndDoCommand 04 SndDoImmediate 05 SndPlay
06 SndControl 07 SndNewChannel 08 InitProcMenu 09 GetControlVariant 0A GetWVariant 0B PopUpMenuSelect
0C RGetResource 0D Count1Resources 0E Get1IndResource 0F Get1IndType 10 Unique1ID 14 SetFractEnable
17 CopyMask 18 FixATan2 1A HOpenResFile 1B HCreateResFile 1C Count1Types 1D InvalMenuBar 1F Get1Resource
20 Get1NamedResource 21 MaxSizeRsrc 22 ResourceDispatch 23 AliasDispatch 24 HFSUtilDispatch 25 MenuDispatch
26 InsertMenuItem 27 HideDialogItem 28 ShowDialogItem 29 LayerDispatch 2A ComponentDispatch 33 ScrnBitMap
36 GetMaskTable 37 MeasureText 38 CalcMask 39 SeedFill 3A ZoomWindow 3B TrackBox 3D TEDispatch 3E TEStyleNew
3F Long2Fix 40 Fix2Long 41 Fix2Frac 42 Frac2Fix 43 Fix2X 44 X2Fix 47 FracCos 48 FracSin 49 FracSqrt
4A FracMul 4B FracDiv 4D FixDiv 50 InitCursor 51 SetCursor 52 HideCursor 53 ShowCursor 55 ShieldCursor
56 ObscureCursor 58 BitAnd 59 BitXor 5A BitNot 5B BitOr 5C BitShift 5D BitTst 5E BitSet 5F BitClr
60 WaitNextEvent 61 Random 62 ForeColor 63 BackColor 64 ColorBit 65 GetPixel 67 LongMul 68 FixMul 69 FixRatio
6A HiWord 6B LoWord 6C FixRound 6D InitPort 6E InitGraf 6F OpenPort 70 LocalToGlobal 71 GlobalToLocal
73 SetPort 74 GetPort 75 SetPortBits 76 PortSize 77 MovePortTo 78 SetOrigin 79 SetClip 7A GetClip 7B ClipRect
7C BackPat 7D ClosePort 7E AddPt 7F SubPt 80 SetPt 81 EqualPt 82 StdText 83 DrawChar 84 DrawString 85 DrawText
86 TextWidth 87 TextFont 88 TextFace 89 TextMode 8A TextSize 8B GetFontInfo 8C StringWidth 8D CharWidth
8E SpaceExtra 90 StdLine 91 LineTo 92 Line 93 MoveTo 94 Move 96 HidePen 97 ShowPen 98 GetPenState
99 SetPenState 9A GetPen 9B PenSize 9C PenMode 9D PenPat 9E PenNormal A0 StdRect A1 FrameRect A2 PaintRect
A3 EraseRect A4 InverRect A5 FillRect A6 EqualRect A7 SetRect A8 OffsetRect A9 InsetRect AA SectRect
AB UnionRect AC Pt2Rect AD PtInRect AE EmptyRect B0 FrameRoundRect B1 PaintRoundRect B2 EraseRoundRect
B7 FrameOval B8 PaintOval B9 EraseOval BE FrameArc BF PaintArc C6 FramePoly C7 PaintPoly CB OpenPoly
CC ClosePoly CD KillPoly CE OffsetPoly CF PackBits D0 UnpackBits D2 FrameRgn D3 PaintRgn D4 EraseRgn
D5 InverRgn D6 FillRgn D7 BitMapToRegion D8 NewRgn D9 DisposeRgn DA OpenRgn DB CloseRgn DC CopyRgn
DD SetEmptyRgn DE SetRecRgn DF RectRgn E0 OffsetRgn E1 InsetRgn E2 EmptyRgn E3 EqualRgn E4 SectRgn
E5 UnionRgn E6 DiffRgn E7 XorRgn E8 PtInRgn E9 RectInRgn EA SetStdProcs EB StdBits EC CopyBits
EF ScrollRect F2 PicComment F3 OpenPicture F4 ClosePicture F5 KillPicture F6 DrawPicture F8 ScalePt
F9 MapPt FA MapRect FB MapRgn FE InitFonts FF GetFName 100 GetFNum 104 DrawGrowIcon 108 ShowHide
10D PaintBehind 110 GetWMgrPort 112 InitWindows 113 NewWindow 114 DisposeWindow 115 ShowWindow
116 HideWindow 117 GetWRefCon 118 SetWRefCon 119 GetWTitle 11A SetWTitle 11B MoveWindow 11C HiliteWindow
11D SizeWindow 11E TrackGoAway 11F SelectWindow 120 BringToFront 122 BeginUpdate 123 EndUpdate
124 FrontWindow 125 DragWindow 127 InvalRgn 128 InvalRect 129 ValidRgn 12A ValidRect 12B GrowWindow
12C FindWindow 12D CloseWindow 130 InitMenus 131 NewMenu 132 DisposeMenu 133 AppendMenu 134 ClearMenuBar
135 InsertMenu 136 DeleteMenu 137 DrawMenuBar 138 HiliteMenu 139 EnableItem 13A DisableItem 13B GetMenuBar
13C SetMenuBar 13D MenuSelect 13E MenuKey 143 GetItemMark 144 SetItemMark 145 CheckItem 146 GetMenuItemText
147 SetMenuItemText 149 GetMenuHandle 14D AppendResMenu 14E PinRect 150 CountMItems 154 NewControl
155 DisposeControl 157 ShowControl 158 HideControl 15D HiliteControl 160 GetControlValue 163 SetControlValue
168 TrackControl 169 DrawControls 16C FindControl 170 GetNextEvent 171 EventAvail 172 GetMouse 173 StillDown
174 Button 175 TickCount 176 GetKeys 177 WaitMouseUp 17B InitDialogs 17C GetNewDialog 17D NewDialog
17E SelectDialogItemText 17F IsDialogEvent 180 DialogSelect 181 DrawDialog 182 CloseDialog 183 DisposeDialog
185 Alert 186 StopAlert 187 NoteAlert 188 CautionAlert 18B ParamText 18D GetDialogItem 18E SetDialogItem
18F SetDialogItemText 190 GetDialogItemText 191 ModalDialog 192 DetachResource 193 SetResPurge
194 CurResFile 197 OpenResFile 198 UseResFile 199 UpdateResFile 19A CloseResFile 19B SetResLoad
19C CountResources 19D GetIndResource 1A0 GetResource 1A1 GetNamedResource 1A2 LoadResource
1A3 ReleaseResource 1A4 HomeResFile 1A5 SizeRsrc 1A6 GetResAttrs 1A7 SetResAttrs 1A8 GetResInfo
1A9 SetResInfo 1AA ChangedResource 1AB AddResource 1AD RemoveResource 1AF ResError 1B0 WriteResource
1B1 CreateResFile 1B2 SystemEvent 1B3 SystemClick 1B4 SystemTask 1B5 SystemMenu 1B6 OpenDeskAcc
1B8 GetPattern 1B9 GetCursor 1BA GetString 1BB GetIcon 1BC GetPicture 1BD GetNewWindow 1BE GetNewControl
1C0 GetNewMBar 1C1 UniqueID 1C3 KeyTranslate 1C4 OpenRFPerm 1C6 SecondsToDate 1C8 SysBeep 1C9 SysError
1CB TEGetText 1CC TEInit 1CD TEDispose 1CE TETextBox 1CF TESetText 1D0 TECalText 1D1 TESetSelect 1D2 TENew
1D3 TEUpdate 1D8 TEActivate 1D9 TEDeactivate 1DE TEInsert 1E0 Munger 1E1 HandToHand 1E2 PtrToXHand
1E3 PtrToHand 1E4 HandAndHand 1E7 Pack0 1E8 Pack1 1E9 Pack2 1EA Pack3 1EB Pack4_FP 1EC Pack5_Trans
1ED Pack6_IntlUtil 1EE Pack7_BinDec 1EF Pack8 1F0 LoadSeg 1F1 UnloadSeg 1F2 Launch 1F4 ExitToShell
1F5 GetAppParms 1FF Debugger 200 OpenCPort 201 InitCPort 202 CloseCPort 203 NewPixMap 204 DisposePixMap
205 CopyPixMap 206 SetPortPix 207 NewPixPat 208 DisposePixPat 20A PenPixPat 20B BackPixPat 20C GetPixPat
20E FillCRect 214 RGBForeColor 215 RGBBackColor 216 SetCPixel 217 GetCPixel 218 GetCTable 219 GetForeColor
21A GetBackColor 21B GetCCursor 21C SetCCursor 21E GetCIcon 21F PlotCIcon 220 OpenCPicture 221 OpColor
222 HiliteColor 224 DisposeCTable 225 DisposeCIcon 226 DisposeCCursor 227 GetMaxDevice 228 GetCTSeed
229 GetDeviceList 22A GetMainDevice 22B GetNextDevice 22C TestDeviceAttribute 22D SetDeviceAttribute
22E InitGDevice 22F NewGDevice 230 DisposeGDevice 231 SetGDevice 232 GetGDevice 233 Color2Index
234 Index2Color 235 InvertColor 236 RealColor 237 GetSubTable 238 UpdatePixMap 239 MakeITable 23F SetEntries
240 QDError 245 NewCWindow 246 GetNewCWindow 248 GetCWMgrPort 24E SetStdCProcs 251 CopyDeepMask
252 HighLevelFSDispatch 259 MixedModeDispatch 25A CodeFragmentDispatch 268 DialogDispatch 290 InitPalettes
291 NewPalette 292 GetNewPalette 293 DisposePalette 294 ActivatePalette 295 SetPalette 296 GetPalette
297 PmForeColor 298 PmBackColor 29A AnimatePalette 29F CTab2Palette 2A0 Palette2CTab 2A2 PaletteDispatch
31D QDExtensions 3FF DebugStr"""


def _build():
    t = {}
    toks = _OS.split()
    for i in range(0, len(toks), 2):
        t[0xA000 | int(toks[i], 16)] = toks[i + 1]
    toks = _TB.split()
    for i in range(0, len(toks), 2):
        t[0xA800 | int(toks[i], 16)] = toks[i + 1]
    return t


TRAPS = _build()


def trap_name(w):
    if w & 0x0800:
        return TRAPS.get(0xA800 | (w & 0x3FF))
    return TRAPS.get(0xA000 | (w & 0xFF))
