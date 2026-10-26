
;-------------------------------------------------------------
; FILTER   (seg 7 +00000c, 206 bytes)
  00000c  4e56fff2             link.w    a6, #$fff2
  000010  48e71038             movem.l   d3/a2-a4, -(a7)
  000014  286e0010             movea.l   $10(a6), a4
  000018  246e000c             movea.l   $c(a6), a2
  00001c  266e0008             movea.l   $8(a6), a3
  000020  0c520003             cmpi.w    #$3, (a2)
  000024  660000a2             bne.w     $c8
  000028  594f                 subq.w    #$4, a7
  00002a  2f2a0002             move.l    $2(a2), -(a7)
  00002e  487800ff             pea.l     $ff.w
  000032  a858                 _BitAnd   
  000034  201f                 move.l    (a7)+, d0
  000036  3600                 move.w    d0, d3
  000038  594f                 subq.w    #$4, a7
  00003a  306a000e             movea.w   $e(a2), a0
  00003e  2f08                 move.l    a0, -(a7)
  000040  48780100             pea.l     $100.w
  000044  a858                 _BitAnd   
  000046  201f                 move.l    (a7)+, d0
  000048  6738                 beq.b     $82
  00004a  0c43002e             cmpi.w    #$2e, d3
  00004e  6632                 bne.b     $82
  000050  7001                 moveq     #$1, d0
  000052  d06de902             add.w     -$16fe(a5), d0
  000056  3680                 move.w    d0, (a3)
  000058  2f0c                 move.l    a4, -(a7)
  00005a  7001                 moveq     #$1, d0
  00005c  d06de902             add.w     -$16fe(a5), d0
  000060  3f00                 move.w    d0, -(a7)
  000062  486efff2             pea.l     -$e(a6)
  000066  486efffc             pea.l     -$4(a6)
  00006a  486efff4             pea.l     -$c(a6)
  00006e  a98d                 _GetDialogItem 
  000070  2f2efffc             move.l    -$4(a6), -(a7)
  000074  3f3c0001             move.w    #$1, -(a7)
  000078  a95d                 _HiliteControl 
  00007a  1d7c00010014         move.b    #$1, $14(a6)
  000080  604a                 bra.b     $cc
  000082  0c430003             cmpi.w    #$3, d3
  000086  57c0                 seq.b     d0
  000088  4400                 neg.b     d0
  00008a  0c43000d             cmpi.w    #$d, d3
  00008e  57c1                 seq.b     d1
  000090  4401                 neg.b     d1
  000092  8200                 or.b      d0, d1
  000094  6732                 beq.b     $c8
  000096  7001                 moveq     #$1, d0
  000098  d06de904             add.w     -$16fc(a5), d0
  00009c  3680                 move.w    d0, (a3)
  00009e  2f0c                 move.l    a4, -(a7)
  0000a0  7001                 moveq     #$1, d0
  0000a2  d06de904             add.w     -$16fc(a5), d0
  0000a6  3f00                 move.w    d0, -(a7)
  0000a8  486efff2             pea.l     -$e(a6)
  0000ac  486efffc             pea.l     -$4(a6)
  0000b0  486efff4             pea.l     -$c(a6)
  0000b4  a98d                 _GetDialogItem 
  0000b6  2f2efffc             move.l    -$4(a6), -(a7)
  0000ba  3f3c0001             move.w    #$1, -(a7)
  0000be  a95d                 _HiliteControl 
  0000c0  1d7c00010014         move.b    #$1, $14(a6)
  0000c6  6004                 bra.b     $cc
  0000c8  422e0014             clr.b     $14(a6)
  0000cc  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  0000d0  4e5e                 unlk      a6
  0000d2  205f                 movea.l   (a7)+, a0
  0000d4  4fef000c             lea.l     $c(a7), a7
  0000d8  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; INITITEMLIST   (seg 7 +0000e4, 190 bytes)
  0000e4  4e560000             link.w    a6, #$0
  0000e8  3b7c0003e906         move.w    #$3, -$16fa(a5)
  0000ee  426de908             clr.w     -$16f8(a5)
  0000f2  426de90a             clr.w     -$16f6(a5)
  0000f6  3b7c000ae90c         move.w    #$a, -$16f4(a5)
  0000fc  3b7c001be90e         move.w    #$1b, -$16f2(a5)
  000102  3b7c005ae910         move.w    #$5a, -$16f0(a5)
  000108  3b7c00e1e912         move.w    #$e1, -$16ee(a5)
  00010e  3b7c8808e914         move.w    #$8808, -$16ec(a5)
  000114  3b7c5e30e916         move.w    #$5e30, -$16ea(a5)
  00011a  3b7c5e31e918         move.w    #$5e31, -$16e8(a5)
  000120  3b7c5e32e91a         move.w    #$5e32, -$16e6(a5)
  000126  3b7c5e33e91c         move.w    #$5e33, -$16e4(a5)
  00012c  426de91e             clr.w     -$16e2(a5)
  000130  426de920             clr.w     -$16e0(a5)
  000134  3b7c0068e922         move.w    #$68, -$16de(a5)
  00013a  3b7c008ce924         move.w    #$8c, -$16dc(a5)
  000140  3b7c007ce926         move.w    #$7c, -$16da(a5)
  000146  3b7c00d2e928         move.w    #$d2, -$16d8(a5)
  00014c  3b7c0400e92a         move.w    #$400, -$16d6(a5)
  000152  426de92c             clr.w     -$16d4(a5)
  000156  426de92e             clr.w     -$16d2(a5)
  00015a  3b7c0068e930         move.w    #$68, -$16d0(a5)
  000160  3b7c001ee932         move.w    #$1e, -$16ce(a5)
  000166  3b7c007ce934         move.w    #$7c, -$16cc(a5)
  00016c  3b7c0064e936         move.w    #$64, -$16ca(a5)
  000172  3b7c0400e938         move.w    #$400, -$16c8(a5)
  000178  426de93a             clr.w     -$16c6(a5)
  00017c  426de93c             clr.w     -$16c4(a5)
  000180  3b7c0048e93e         move.w    #$48, -$16c2(a5)
  000186  3b7c001ee940         move.w    #$1e, -$16c0(a5)
  00018c  3b7c005ce942         move.w    #$5c, -$16be(a5)
  000192  3b7c0064e944         move.w    #$64, -$16bc(a5)
  000198  3b7c0400e946         move.w    #$400, -$16ba(a5)
  00019e  4e5e                 unlk      a6
  0001a0  4e75                 rts       

;-------------------------------------------------------------
; SETDCONTROL   (seg 7 +0001b2, 114 bytes)
  0001b2  4e56fee0             link.w    a6, #$fee0
  0001b6  206e000a             movea.l   $a(a6), a0
  0001ba  43eefee2             lea.l     -$11e(a6), a1
  0001be  703f                 moveq     #$3f, d0
  0001c0  22d8                 move.l    (a0)+, (a1)+
  0001c2  51c8fffc             dbra      d0, $1c0
  0001c6  2f2e0010             move.l    $10(a6), -(a7)
  0001ca  3f2e000e             move.w    $e(a6), -(a7)
  0001ce  486efee0             pea.l     -$120(a6)
  0001d2  486effe2             pea.l     -$1e(a6)
  0001d6  486efff8             pea.l     -$8(a6)
  0001da  a98d                 _GetDialogItem 
  0001dc  2f2effe2             move.l    -$1e(a6), -(a7)
  0001e0  486efee2             pea.l     -$11e(a6)
  0001e4  a95f                 _trap_a95f 
  0001e6  4a2e0008             tst.b     $8(a6)
  0001ea  672e                 beq.b     $21a
  0001ec  486effe6             pea.l     -$1a(a6)
  0001f0  a898                 _GetPenState 
  0001f2  a89e                 _PenNormal 
  0001f4  2f3c00030003         move.l    #$30003, -(a7)
  0001fa  a89b                 _PenSize  
  0001fc  486efff8             pea.l     -$8(a6)
  000200  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  000206  a8a9                 _InsetRect 
  000208  486efff8             pea.l     -$8(a6)
  00020c  2f3c00100010         move.l    #$100010, -(a7)
  000212  a8b0                 _FrameRoundRect 
  000214  486effe6             pea.l     -$1a(a6)
  000218  a899                 _SetPenState 
  00021a  4e5e                 unlk      a6
  00021c  205f                 movea.l   (a7)+, a0
  00021e  4fef000c             lea.l     $c(a7), a7
  000222  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; FakeBarf0   (seg 7 +000232, 54 bytes)
  000232  4e560000             link.w    a6, #$0
  000236  3f3c0001             move.w    #$1, -(a7)
  00023a  a9c8                 _SysBeep  
  00023c  206e0008             movea.l   $8(a6), a0
  000240  2f28fec8             move.l    -$138(a0), -(a7)
  000244  a873                 _SetPort  
  000246  206e0008             movea.l   $8(a6), a0
  00024a  4a28fff7             tst.b     -$9(a0)
  00024e  670a                 beq.b     $25a
  000250  206e0008             movea.l   $8(a6), a0
  000254  2f28fecc             move.l    -$134(a0), -(a7)
  000258  aa31                 _SetGDevice 
  00025a  2c6e0008             movea.l   $8(a6), a6
  00025e  4efa03e2             jmp       $642(pc)
  000262  4e5e                 unlk      a6
  000264  2e9f                 move.l    (a7)+, (a7)
  000266  4e75                 rts       

;-------------------------------------------------------------
; SATFAKEALERT   (seg 7 +000274, 1000 bytes)
  000274  4e56f8b6             link.w    a6, #$f8b6
  000278  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  00027c  382e0018             move.w    $18(a6), d4
  000280  362e0016             move.w    $16(a6), d3
  000284  206e0008             movea.l   $8(a6), a0
  000288  43eefcb8             lea.l     -$348(a6), a1
  00028c  703f                 moveq     #$3f, d0
  00028e  22d8                 move.l    (a0)+, (a1)+
  000290  51c8fffc             dbra      d0, $28e
  000294  206e000c             movea.l   $c(a6), a0
  000298  43eefdc8             lea.l     -$238(a6), a1
  00029c  703f                 moveq     #$3f, d0
  00029e  22d8                 move.l    (a0)+, (a1)+
  0002a0  51c8fffc             dbra      d0, $29e
  0002a4  206e0010             movea.l   $10(a6), a0
  0002a8  43eefef4             lea.l     -$10c(a6), a1
  0002ac  703f                 moveq     #$3f, d0
  0002ae  22d8                 move.l    (a0)+, (a1)+
  0002b0  51c8fffc             dbra      d0, $2ae
  0002b4  206e001a             movea.l   $1a(a6), a0
  0002b8  43eefbb8             lea.l     -$448(a6), a1
  0002bc  703f                 moveq     #$3f, d0
  0002be  22d8                 move.l    (a0)+, (a1)+
  0002c0  51c8fffc             dbra      d0, $2be
  0002c4  206e001e             movea.l   $1e(a6), a0
  0002c8  43eefab8             lea.l     -$548(a6), a1
  0002cc  703f                 moveq     #$3f, d0
  0002ce  22d8                 move.l    (a0)+, (a1)+
  0002d0  51c8fffc             dbra      d0, $2ce
  0002d4  206e0022             movea.l   $22(a6), a0
  0002d8  43eef9b8             lea.l     -$648(a6), a1
  0002dc  703f                 moveq     #$3f, d0
  0002de  22d8                 move.l    (a0)+, (a1)+
  0002e0  51c8fffc             dbra      d0, $2de
  0002e4  206e0026             movea.l   $26(a6), a0
  0002e8  43eef8b8             lea.l     -$748(a6), a1
  0002ec  703f                 moveq     #$3f, d0
  0002ee  22d8                 move.l    (a0)+, (a1)+
  0002f0  51c8fffc             dbra      d0, $2ee
  0002f4  3b43e904             move.w    d3, -$16fc(a5)
  0002f8  3b6e0014e902         move.w    $14(a6), -$16fe(a5)
  0002fe  4ebafde4             jsr       $e4(pc)   ; INITITEMLIST
  000302  0c440002             cmpi.w    #$2, d4
  000306  6f0a                 ble.b     $312
  000308  302de93e             move.w    -$16c2(a5), d0
  00030c  5740                 subq.w    #$3, d0
  00030e  3b40e910             move.w    d0, -$16f0(a5)
  000312  a850                 _InitCursor 
  000314  422efff7             clr.b     -$9(a6)
  000318  554f                 subq.w    #$2, a7
  00031a  3f3c0001             move.w    #$1, -(a7)
  00031e  486efdb8             pea.l     -$248(a6)
  000322  4eb900000360         jsr       $360.l   ; seg4+32a
  000328  301f                 move.w    (a7)+, d0
  00032a  6606                 bne.b     $332
  00032c  1d6efdc1fff7         move.b    -$23f(a6), -$9(a6)
  000332  486efec8             pea.l     -$138(a6)
  000336  a874                 _GetPort  
  000338  4a2efff7             tst.b     -$9(a6)
  00033c  6714                 beq.b     $352
  00033e  594f                 subq.w    #$4, a7
  000340  aa32                 _GetGDevice 
  000342  205f                 movea.l   (a7)+, a0
  000344  2d48fecc             move.l    a0, -$134(a6)
  000348  594f                 subq.w    #$4, a7
  00034a  aa2a                 _GetMainDevice 
  00034c  205f                 movea.l   (a7)+, a0
  00034e  2f08                 move.l    a0, -(a7)
  000350  aa31                 _SetGDevice 
  000352  594f                 subq.w    #$4, a7
  000354  48780200             pea.l     $200.w
  000358  201f                 move.l    (a7)+, d0
  00035a  a122                 _NewHandle 
  00035c  2e88                 move.l    a0, (a7)
  00035e  205f                 movea.l   (a7)+, a0
  000360  2648                 movea.l   a0, a3
  000362  200b                 move.l    a3, d0
  000364  6612                 bne.b     $378
  000366  41eefed0             lea.l     -$130(a6), a0
  00036a  d0fc0024             adda.w    #$24, a0
  00036e  48e03f38             movem.l   d2-d7/a2-a4, -(a0)
  000372  2f0e                 move.l    a6, -(a7)
  000374  4ebafebc             jsr       $232(pc)   ; FakeBarf0
  000378  2f0b                 move.l    a3, -(a7)
  00037a  205f                 movea.l   (a7)+, a0
  00037c  a029                 _HLock    
  00037e  3b44e906             move.w    d4, -$16fa(a5)
  000382  486de906             pea.l     -$16fa(a5)
  000386  2f13                 move.l    (a3), -(a7)
  000388  48780200             pea.l     $200.w
  00038c  201f                 move.l    (a7)+, d0
  00038e  225f                 movea.l   (a7)+, a1
  000390  205f                 movea.l   (a7)+, a0
  000392  a02e                 _BlockMove 
  000394  486efff8             pea.l     -$8(a6)
  000398  2f3c00500073         move.l    #$500073, -(a7)
  00039e  2f3c00dc0163         move.l    #$dc0163, -(a7)
  0003a4  a8a7                 _SetRect  
  0003a6  486efff8             pea.l     -$8(a6)
  0003aa  302efffa             move.w    -$6(a6), d0
  0003ae  4440                 neg.w     d0
  0003b0  3f00                 move.w    d0, -(a7)
  0003b2  302efff8             move.w    -$8(a6), d0
  0003b6  4440                 neg.w     d0
  0003b8  3f00                 move.w    d0, -(a7)
  0003ba  a8a8                 _OffsetRect 
  0003bc  4a2efff7             tst.b     -$9(a6)
  0003c0  670000b8             beq.w     $47a
  0003c4  486efff8             pea.l     -$8(a6)
  0003c8  594f                 subq.w    #$4, a7
  0003ca  aa2a                 _GetMainDevice 
  0003cc  205f                 movea.l   (a7)+, a0
  0003ce  2050                 movea.l   (a0), a0
  0003d0  3d680024f8b6         move.w    $24(a0), -$74a(a6)
  0003d6  594f                 subq.w    #$4, a7
  0003d8  aa2a                 _GetMainDevice 
  0003da  205f                 movea.l   (a7)+, a0
  0003dc  2050                 movea.l   (a0), a0
  0003de  30280028             move.w    $28(a0), d0
  0003e2  d06ef8b6             add.w     -$74a(a6), d0
  0003e6  48c0                 ext.l     d0
  0003e8  2200                 move.l    d0, d1
  0003ea  e089                 lsr.l     #$8, d1
  0003ec  e089                 lsr.l     #$8, d1
  0003ee  e089                 lsr.l     #$8, d1
  0003f0  ee89                 lsr.l     #$7, d1
  0003f2  d280                 add.l     d0, d1
  0003f4  e281                 asr.l     #$1, d1
  0003f6  302efffe             move.w    -$2(a6), d0
  0003fa  906efffa             sub.w     -$6(a6), d0
  0003fe  48c0                 ext.l     d0
  000400  2400                 move.l    d0, d2
  000402  e08a                 lsr.l     #$8, d2
  000404  e08a                 lsr.l     #$8, d2
  000406  e08a                 lsr.l     #$8, d2
  000408  ee8a                 lsr.l     #$7, d2
  00040a  d480                 add.l     d0, d2
  00040c  e282                 asr.l     #$1, d2
  00040e  4482                 neg.l     d2
  000410  d481                 add.l     d1, d2
  000412  3f02                 move.w    d2, -(a7)
  000414  4267                 clr.w     -(a7)
  000416  a8a8                 _OffsetRect 
  000418  486efff8             pea.l     -$8(a6)
  00041c  4267                 clr.w     -(a7)
  00041e  594f                 subq.w    #$4, a7
  000420  aa2a                 _GetMainDevice 
  000422  205f                 movea.l   (a7)+, a0
  000424  2050                 movea.l   (a0), a0
  000426  3d680022f8b6         move.w    $22(a0), -$74a(a6)
  00042c  594f                 subq.w    #$4, a7
  00042e  aa2a                 _GetMainDevice 
  000430  205f                 movea.l   (a7)+, a0
  000432  2050                 movea.l   (a0), a0
  000434  30280026             move.w    $26(a0), d0
  000438  d06ef8b6             add.w     -$74a(a6), d0
  00043c  04400014             subi.w    #$14, d0
  000440  48c0                 ext.l     d0
  000442  2200                 move.l    d0, d1
  000444  e089                 lsr.l     #$8, d1
  000446  e089                 lsr.l     #$8, d1
  000448  e089                 lsr.l     #$8, d1
  00044a  ee89                 lsr.l     #$7, d1
  00044c  d280                 add.l     d0, d1
  00044e  e281                 asr.l     #$1, d1
  000450  302efffc             move.w    -$4(a6), d0
  000454  906efff8             sub.w     -$8(a6), d0
  000458  48c0                 ext.l     d0
  00045a  2400                 move.l    d0, d2
  00045c  e08a                 lsr.l     #$8, d2
  00045e  e08a                 lsr.l     #$8, d2
  000460  e08a                 lsr.l     #$8, d2
  000462  ee8a                 lsr.l     #$7, d2
  000464  d480                 add.l     d0, d2
  000466  e282                 asr.l     #$1, d2
  000468  4482                 neg.l     d2
  00046a  d481                 add.l     d1, d2
  00046c  068200000014         addi.l    #$14, d2
  000472  3f02                 move.w    d2, -(a7)
  000474  a8a8                 _OffsetRect 
  000476  60000088             bra.w     $500
  00047a  486efff8             pea.l     -$8(a6)
  00047e  302de74a             move.w    -$18b6(a5), d0
  000482  906de746             sub.w     -$18ba(a5), d0
  000486  48c0                 ext.l     d0
  000488  2200                 move.l    d0, d1
  00048a  e089                 lsr.l     #$8, d1
  00048c  e089                 lsr.l     #$8, d1
  00048e  e089                 lsr.l     #$8, d1
  000490  ee89                 lsr.l     #$7, d1
  000492  d280                 add.l     d0, d1
  000494  e281                 asr.l     #$1, d1
  000496  302efffe             move.w    -$2(a6), d0
  00049a  906efffa             sub.w     -$6(a6), d0
  00049e  48c0                 ext.l     d0
  0004a0  2400                 move.l    d0, d2
  0004a2  e08a                 lsr.l     #$8, d2
  0004a4  e08a                 lsr.l     #$8, d2
  0004a6  e08a                 lsr.l     #$8, d2
  0004a8  ee8a                 lsr.l     #$7, d2
  0004aa  d480                 add.l     d0, d2
  0004ac  e282                 asr.l     #$1, d2
  0004ae  4482                 neg.l     d2
  0004b0  d481                 add.l     d1, d2
  0004b2  3f02                 move.w    d2, -(a7)
  0004b4  4267                 clr.w     -(a7)
  0004b6  a8a8                 _OffsetRect 
  0004b8  486efff8             pea.l     -$8(a6)
  0004bc  4267                 clr.w     -(a7)
  0004be  302de748             move.w    -$18b8(a5), d0
  0004c2  906de744             sub.w     -$18bc(a5), d0
  0004c6  04400014             subi.w    #$14, d0
  0004ca  48c0                 ext.l     d0
  0004cc  2200                 move.l    d0, d1
  0004ce  e089                 lsr.l     #$8, d1
  0004d0  e089                 lsr.l     #$8, d1
  0004d2  e089                 lsr.l     #$8, d1
  0004d4  ee89                 lsr.l     #$7, d1
  0004d6  d280                 add.l     d0, d1
  0004d8  e281                 asr.l     #$1, d1
  0004da  302efffc             move.w    -$4(a6), d0
  0004de  906efff8             sub.w     -$8(a6), d0
  0004e2  48c0                 ext.l     d0
  0004e4  2400                 move.l    d0, d2
  0004e6  e08a                 lsr.l     #$8, d2
  0004e8  e08a                 lsr.l     #$8, d2
  0004ea  e08a                 lsr.l     #$8, d2
  0004ec  ee8a                 lsr.l     #$7, d2
  0004ee  d480                 add.l     d0, d2
  0004f0  e282                 asr.l     #$1, d2
  0004f2  4482                 neg.l     d2
  0004f4  d481                 add.l     d1, d2
  0004f6  068200000014         addi.l    #$14, d2
  0004fc  3f02                 move.w    d2, -(a7)
  0004fe  a8a8                 _OffsetRect 
  000500  594f                 subq.w    #$4, a7
  000502  48780000             pea.l     $0.w
  000506  486efff8             pea.l     -$8(a6)
  00050a  486df6d0             pea.l     -$930(a5)
  00050e  4227                 clr.b     -(a7)
  000510  3f3c0001             move.w    #$1, -(a7)
  000514  4878ffff             pea.l     $ffff.w
  000518  4227                 clr.b     -(a7)
  00051a  42a7                 clr.l     -(a7)
  00051c  2f0b                 move.l    a3, -(a7)
  00051e  a97d                 _NewDialog 
  000520  205f                 movea.l   (a7)+, a0
  000522  2448                 movea.l   a0, a2
  000524  200a                 move.l    a2, d0
  000526  6612                 bne.b     $53a
  000528  41eefed0             lea.l     -$130(a6), a0
  00052c  d0fc0024             adda.w    #$24, a0
  000530  48e03f38             movem.l   d2-d7/a2-a4, -(a0)
  000534  2f0e                 move.l    a6, -(a7)
  000536  4ebafcfa             jsr       $232(pc)   ; FakeBarf0
  00053a  486ef8b8             pea.l     -$748(a6)
  00053e  486ef9b8             pea.l     -$648(a6)
  000542  486efab8             pea.l     -$548(a6)
  000546  486efbb8             pea.l     -$448(a6)
  00054a  a98b                 _ParamText 
  00054c  2f0a                 move.l    a2, -(a7)
  00054e  a873                 _SetPort  
  000550  2f0a                 move.l    a2, -(a7)
  000552  a915                 _ShowWindow 
  000554  3004                 move.w    d4, d0
  000556  5340                 subq.w    #$1, d0
  000558  6700008a             beq.w     $5e4
  00055c  5340                 subq.w    #$1, d0
  00055e  6752                 beq.b     $5b2
  000560  5340                 subq.w    #$1, d0
  000562  6704                 beq.b     $568
  000564  60000096             bra.w     $5fc
  000568  2f0a                 move.l    a2, -(a7)
  00056a  3f3c0004             move.w    #$4, -(a7)
  00056e  486efcb8             pea.l     -$348(a6)
  000572  0c430003             cmpi.w    #$3, d3
  000576  57c0                 seq.b     d0
  000578  4400                 neg.b     d0
  00057a  1f00                 move.b    d0, -(a7)
  00057c  4ebafc34             jsr       $1b2(pc)   ; SETDCONTROL
  000580  2f0a                 move.l    a2, -(a7)
  000582  3f3c0003             move.w    #$3, -(a7)
  000586  486efdc8             pea.l     -$238(a6)
  00058a  0c430002             cmpi.w    #$2, d3
  00058e  57c0                 seq.b     d0
  000590  4400                 neg.b     d0
  000592  1f00                 move.b    d0, -(a7)
  000594  4ebafc1c             jsr       $1b2(pc)   ; SETDCONTROL
  000598  2f0a                 move.l    a2, -(a7)
  00059a  3f3c0002             move.w    #$2, -(a7)
  00059e  486efef4             pea.l     -$10c(a6)
  0005a2  0c430001             cmpi.w    #$1, d3
  0005a6  57c0                 seq.b     d0
  0005a8  4400                 neg.b     d0
  0005aa  1f00                 move.b    d0, -(a7)
  0005ac  4ebafc04             jsr       $1b2(pc)   ; SETDCONTROL
  0005b0  604a                 bra.b     $5fc
  0005b2  2f0a                 move.l    a2, -(a7)
  0005b4  3f3c0003             move.w    #$3, -(a7)
  0005b8  486efdc8             pea.l     -$238(a6)
  0005bc  0c430002             cmpi.w    #$2, d3
  0005c0  57c0                 seq.b     d0
  0005c2  4400                 neg.b     d0
  0005c4  1f00                 move.b    d0, -(a7)
  0005c6  4ebafbea             jsr       $1b2(pc)   ; SETDCONTROL
  0005ca  2f0a                 move.l    a2, -(a7)
  0005cc  3f3c0002             move.w    #$2, -(a7)
  0005d0  486efef4             pea.l     -$10c(a6)
  0005d4  0c430001             cmpi.w    #$1, d3
  0005d8  57c0                 seq.b     d0
  0005da  4400                 neg.b     d0
  0005dc  1f00                 move.b    d0, -(a7)
  0005de  4ebafbd2             jsr       $1b2(pc)   ; SETDCONTROL
  0005e2  6018                 bra.b     $5fc
  0005e4  2f0a                 move.l    a2, -(a7)
  0005e6  3f3c0002             move.w    #$2, -(a7)
  0005ea  486efef4             pea.l     -$10c(a6)
  0005ee  0c430001             cmpi.w    #$1, d3
  0005f2  57c0                 seq.b     d0
  0005f4  4400                 neg.b     d0
  0005f6  1f00                 move.b    d0, -(a7)
  0005f8  4ebafbb8             jsr       $1b2(pc)   ; SETDCONTROL
  0005fc  486d0028             pea.l     $28(a5)
  000600  486efff4             pea.l     -$c(a6)
  000604  a991                 _ModalDialog 
  000606  0c6e0001fff4         cmpi.w    #$1, -$c(a6)
  00060c  6606                 bne.b     $614
  00060e  3d43fff4             move.w    d3, -$c(a6)
  000612  600a                 bra.b     $61e
  000614  302efff4             move.w    -$c(a6), d0
  000618  5340                 subq.w    #$1, d0
  00061a  3d40fff4             move.w    d0, -$c(a6)
  00061e  2f0b                 move.l    a3, -(a7)
  000620  205f                 movea.l   (a7)+, a0
  000622  a02a                 _HUnlock  
  000624  2f0a                 move.l    a2, -(a7)
  000626  a983                 _DisposeDialog 
  000628  2f2efec8             move.l    -$138(a6), -(a7)
  00062c  a873                 _SetPort  
  00062e  4a2efff7             tst.b     -$9(a6)
  000632  6706                 beq.b     $63a
  000634  2f2efecc             move.l    -$134(a6), -(a7)
  000638  aa31                 _SetGDevice 
  00063a  3d6efff4002a         move.w    -$c(a6), $2a(a6)
  000640  600c                 bra.b     $64e
  000642  4feef8a6             lea.l     -$75a(a6), a7
  000646  41eefed0             lea.l     -$130(a6), a0
  00064a  4cd81cfc             movem.l   (a0)+, d2-d7/a2-a4
  00064e  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  000652  4e5e                 unlk      a6
  000654  205f                 movea.l   (a7)+, a0
  000656  4fef0022             lea.l     $22(a7), a7
  00065a  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATREPORTSTR   (seg 7 +00066c, 74 bytes)
  00066c  4e56fefe             link.w    a6, #$fefe
  000670  206e0008             movea.l   $8(a6), a0
  000674  43eeff00             lea.l     -$100(a6), a1
  000678  703f                 moveq     #$3f, d0
  00067a  22d8                 move.l    (a0)+, (a1)+
  00067c  51c8fffc             dbra      d0, $67a
  000680  554f                 subq.w    #$2, a7
  000682  486eff00             pea.l     -$100(a6)
  000686  486df6d0             pea.l     -$930(a5)
  00068a  486df6d0             pea.l     -$930(a5)
  00068e  486df6d0             pea.l     -$930(a5)
  000692  2f3c00010001         move.l    #$10001, -(a7)
  000698  4267                 clr.w     -(a7)
  00069a  486df6ee             pea.l     -$912(a5)
  00069e  486df6d0             pea.l     -$930(a5)
  0006a2  486df6d0             pea.l     -$930(a5)
  0006a6  4ebafbcc             jsr       $274(pc)   ; SATFAKEALERT
  0006aa  301f                 move.w    (a7)+, d0
  0006ac  3d40fefe             move.w    d0, -$102(a6)
  0006b0  4e5e                 unlk      a6
  0006b2  2e9f                 move.l    (a7)+, (a7)
  0006b4  4e75                 rts       

;-------------------------------------------------------------
; SATSOUNDERROR   (seg 7 +0006c6, 30 bytes)
  0006c6  4e560000             link.w    a6, #$0
  0006ca  4aadea80             tst.l     -$1580(a5)
  0006ce  670c                 beq.b     $6dc
  0006d0  3f2e0008             move.w    $8(a6), -(a7)
  0006d4  2f2dea80             move.l    -$1580(a5), -(a7)
  0006d8  205f                 movea.l   (a7)+, a0
  0006da  4e90                 jsr       (a0)
  0006dc  4e5e                 unlk      a6
  0006de  205f                 movea.l   (a7)+, a0
  0006e0  544f                 addq.w    #$2, a7
  0006e2  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SILENCE   (seg 7 +0006f4, 164 bytes)
  0006f4  4e56fff8             link.w    a6, #$fff8
  0006f8  48e71820             movem.l   d3-d4/a2, -(a7)
  0006fc  382e0008             move.w    $8(a6), d4
  000700  3044                 movea.w   d4, a0
  000702  2008                 move.l    a0, d0
  000704  5380                 subq.l    #$1, d0
  000706  e588                 lsl.l     #$2, d0
  000708  41edea40             lea.l     -$15c0(a5), a0
  00070c  4ab00800             tst.l     (a0, d0.l)
  000710  677a                 beq.b     $78c
  000712  45eefff8             lea.l     -$8(a6), a2
  000716  34bc0004             move.w    #$4, (a2)
  00071a  426a0002             clr.w     $2(a2)
  00071e  42aa0004             clr.l     $4(a2)
  000722  554f                 subq.w    #$2, a7
  000724  3044                 movea.w   d4, a0
  000726  2008                 move.l    a0, d0
  000728  5380                 subq.l    #$1, d0
  00072a  e588                 lsl.l     #$2, d0
  00072c  41edea40             lea.l     -$15c0(a5), a0
  000730  2f300800             move.l    (a0, d0.l), -(a7)
  000734  486efff8             pea.l     -$8(a6)
  000738  a804                 _SndDoImmediate 
  00073a  301f                 move.w    (a7)+, d0
  00073c  3600                 move.w    d0, d3
  00073e  4a43                 tst.w     d3
  000740  6706                 beq.b     $748
  000742  3f03                 move.w    d3, -(a7)
  000744  4ebaff80             jsr       $6c6(pc)   ; SATSOUNDERROR
  000748  45eefff8             lea.l     -$8(a6), a2
  00074c  34bc0003             move.w    #$3, (a2)
  000750  426a0002             clr.w     $2(a2)
  000754  42aa0004             clr.l     $4(a2)
  000758  554f                 subq.w    #$2, a7
  00075a  3044                 movea.w   d4, a0
  00075c  2008                 move.l    a0, d0
  00075e  5380                 subq.l    #$1, d0
  000760  e588                 lsl.l     #$2, d0
  000762  41edea40             lea.l     -$15c0(a5), a0
  000766  2f300800             move.l    (a0, d0.l), -(a7)
  00076a  486efff8             pea.l     -$8(a6)
  00076e  a804                 _SndDoImmediate 
  000770  301f                 move.w    (a7)+, d0
  000772  3600                 move.w    d0, d3
  000774  4a43                 tst.w     d3
  000776  6706                 beq.b     $77e
  000778  3f03                 move.w    d3, -(a7)
  00077a  4ebaff4a             jsr       $6c6(pc)   ; SATSOUNDERROR
  00077e  3044                 movea.w   d4, a0
  000780  2008                 move.l    a0, d0
  000782  5380                 subq.l    #$1, d0
  000784  41edea2a             lea.l     -$15d6(a5), a0
  000788  42300800             clr.b     (a0, d0.l)
  00078c  4cdf0418             movem.l   (a7)+, d3-d4/a2
  000790  4e5e                 unlk      a6
  000792  205f                 movea.l   (a7)+, a0
  000794  544f                 addq.w    #$2, a7
  000796  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SDSHUTUP   (seg 7 +0007a2, 92 bytes)
  0007a2  4e56fff8             link.w    a6, #$fff8
  0007a6  2f03                 move.l    d3, -(a7)
  0007a8  206e0008             movea.l   $8(a6), a0
  0007ac  2d50fff8             move.l    (a0), -$8(a6)
  0007b0  2d680004fffc         move.l    $4(a0), -$4(a6)
  0007b6  4aae000c             tst.l     $c(a6)
  0007ba  6726                 beq.b     $7e2
  0007bc  0c6e3039fffa         cmpi.w    #$3039, -$6(a6)
  0007c2  661e                 bne.b     $7e2
  0007c4  594f                 subq.w    #$4, a7
  0007c6  2f2efffc             move.l    -$4(a6), -(a7)
  0007ca  2f4d0004             move.l    a5, $4(a7)
  0007ce  2a5f                 movea.l   (a7)+, a5
  0007d0  201f                 move.l    (a7)+, d0
  0007d2  2600                 move.l    d0, d3
  0007d4  594f                 subq.w    #$4, a7
  0007d6  2f03                 move.l    d3, -(a7)
  0007d8  2f4d0004             move.l    a5, $4(a7)
  0007dc  2a5f                 movea.l   (a7)+, a5
  0007de  201f                 move.l    (a7)+, d0
  0007e0  2600                 move.l    d0, d3
  0007e2  261f                 move.l    (a7)+, d3
  0007e4  4e5e                 unlk      a6
  0007e6  205f                 movea.l   (a7)+, a0
  0007e8  504f                 addq.w    #$8, a7
  0007ea  4ed0                 jmp       (a0)
  0007ec  4e560000             link.w    a6, #$0
  0007f0  4eb9000003c8         jsr       $3c8.l   ; seg4+91a
  0007f6  422dea2a             clr.b     -$15d6(a5)
  0007fa  4e5e                 unlk      a6
  0007fc  4e75                 rts       

;-------------------------------------------------------------
; SDPLAYIT   (seg 7 +00080a, 162 bytes)
  00080a  4e56fff8             link.w    a6, #$fff8
  00080e  2f0a                 move.l    a2, -(a7)
  000810  246e0008             movea.l   $8(a6), a2
  000814  200a                 move.l    a2, d0
  000816  6700008c             beq.w     $8a4
  00081a  4a92                 tst.l     (a2)
  00081c  67000086             beq.w     $8a4
  000820  554f                 subq.w    #$2, a7
  000822  4eb9000003d8         jsr       $3d8.l   ; seg4+9c4
  000828  101f                 move.b    (a7)+, d0
  00082a  6606                 bne.b     $832
  00082c  4eb9000003c8         jsr       $3c8.l   ; seg4+91a
  000832  594f                 subq.w    #$4, a7
  000834  2f0a                 move.l    a2, -(a7)
  000836  4eb900000370         jsr       $370.l   ; seg4+6a2
  00083c  201f                 move.l    (a7)+, d0
  00083e  5d80                 subq.l    #$6, d0
  000840  223c000002e4         move.l    #$2e4, d1
  000846  4eb900000562         jsr       $562.l   ; seg1+562
  00084c  223c000002e4         move.l    #$2e4, d1
  000852  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000858  2d40fffc             move.l    d0, -$4(a6)
  00085c  2f12                 move.l    (a2), -(a7)
  00085e  2f2efffc             move.l    -$4(a6), -(a7)
  000862  48780000             pea.l     $0.w
  000866  4eb9000003d0         jsr       $3d0.l   ; seg4+808
  00086c  594f                 subq.w    #$4, a7
  00086e  2f0a                 move.l    a2, -(a7)
  000870  4eb900000370         jsr       $370.l   ; seg4+6a2
  000876  201f                 move.l    (a7)+, d0
  000878  723c                 moveq     #$3c, d1
  00087a  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000880  223c00002af8         move.l    #$2af8, d1
  000886  4eb900000562         jsr       $562.l   ; seg1+562
  00088c  2d40fff8             move.l    d0, -$8(a6)
  000890  594f                 subq.w    #$4, a7
  000892  a975                 _TickCount 
  000894  201f                 move.l    (a7)+, d0
  000896  d0aefff8             add.l     -$8(a6), d0
  00089a  2b40e9ca             move.l    d0, -$1636(a5)
  00089e  1b7c0001ea2a         move.b    #$1, -$15d6(a5)
  0008a4  245f                 movea.l   (a7)+, a2
  0008a6  4e5e                 unlk      a6
  0008a8  2e9f                 move.l    (a7)+, (a7)
  0008aa  4e75                 rts       

;-------------------------------------------------------------
; SNDDATA   (seg 7 +0008b8, 64 bytes)
  0008b8  4e560000             link.w    a6, #$0
  0008bc  206e0008             movea.l   $8(a6), a0
  0008c0  2250                 movea.l   (a0), a1
  0008c2  0c510001             cmpi.w    #$1, (a1)
  0008c6  6612                 bne.b     $8da
  0008c8  7002                 moveq     #$2, d0
  0008ca  d089                 add.l     a1, d0
  0008cc  2040                 movea.l   d0, a0
  0008ce  3410                 move.w    (a0), d2
  0008d0  7006                 moveq     #$6, d0
  0008d2  c1c2                 muls.w    d2, d0
  0008d4  48c0                 ext.l     d0
  0008d6  d089                 add.l     a1, d0
  0008d8  2240                 movea.l   d0, a1
  0008da  7004                 moveq     #$4, d0
  0008dc  d089                 add.l     a1, d0
  0008de  2240                 movea.l   d0, a1
  0008e0  3411                 move.w    (a1), d2
  0008e2  7008                 moveq     #$8, d0
  0008e4  c1c2                 muls.w    d2, d0
  0008e6  48c0                 ext.l     d0
  0008e8  7202                 moveq     #$2, d1
  0008ea  d289                 add.l     a1, d1
  0008ec  d280                 add.l     d0, d1
  0008ee  2d41000c             move.l    d1, $c(a6)
  0008f2  4e5e                 unlk      a6
  0008f4  2e9f                 move.l    (a7)+, (a7)
  0008f6  4e75                 rts       

;-------------------------------------------------------------
; QCHANBUSY   (seg 7 +000902, 86 bytes)
  000902  4e56ffe8             link.w    a6, #$ffe8
  000906  2f0a                 move.l    a2, -(a7)
  000908  246e0008             movea.l   $8(a6), a2
  00090c  4a2de9b7             tst.b     -$1649(a5)
  000910  6730                 beq.b     $942
  000912  554f                 subq.w    #$2, a7
  000914  2f0a                 move.l    a2, -(a7)
  000916  3f3c0018             move.w    #$18, -(a7)
  00091a  486effe8             pea.l     -$18(a6)
  00091e  203c05100008         move.l    #$5100008, d0
  000924  a800                 _SoundDispatch 
  000926  301f                 move.w    (a7)+, d0
  000928  6710                 beq.b     $93a
  00092a  0c6affff0020         cmpi.w    #$ffff, $20(a2)
  000930  56c0                 sne.b     d0
  000932  4400                 neg.b     d0
  000934  1d40000c             move.b    d0, $c(a6)
  000938  6016                 bra.b     $950
  00093a  1d6efff4000c         move.b    -$c(a6), $c(a6)
  000940  600e                 bra.b     $950
  000942  0c6affff0020         cmpi.w    #$ffff, $20(a2)
  000948  56c0                 sne.b     d0
  00094a  4400                 neg.b     d0
  00094c  1d40000c             move.b    d0, $c(a6)
  000950  245f                 movea.l   (a7)+, a2
  000952  4e5e                 unlk      a6
  000954  2e9f                 move.l    (a7)+, (a7)
  000956  4e75                 rts       

;-------------------------------------------------------------
; PLAYIT   (seg 7 +000964, 668 bytes)
  000964  4e56fff4             link.w    a6, #$fff4
  000968  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  00096c  246e000c             movea.l   $c(a6), a2
  000970  3a2e000a             move.w    $a(a6), d5
  000974  362e0008             move.w    $8(a6), d3
  000978  4a43                 tst.w     d3
  00097a  67000278             beq.w     $bf4
  00097e  4a2de9b8             tst.b     -$1648(a5)
  000982  670e                 beq.b     $992
  000984  3b45ea0a             move.w    d5, -$15f6(a5)
  000988  2f0a                 move.l    a2, -(a7)
  00098a  4ebafe7e             jsr       $80a(pc)   ; SDPLAYIT
  00098e  60000264             bra.w     $bf4
  000992  3043                 movea.w   d3, a0
  000994  2008                 move.l    a0, d0
  000996  5380                 subq.l    #$1, d0
  000998  e588                 lsl.l     #$2, d0
  00099a  41edea40             lea.l     -$15c0(a5), a0
  00099e  4ab00800             tst.l     (a0, d0.l)
  0009a2  6632                 bne.b     $9d6
  0009a4  554f                 subq.w    #$2, a7
  0009a6  3043                 movea.w   d3, a0
  0009a8  2008                 move.l    a0, d0
  0009aa  5380                 subq.l    #$1, d0
  0009ac  e588                 lsl.l     #$2, d0
  0009ae  41edea40             lea.l     -$15c0(a5), a0
  0009b2  48700800             pea.l     (a0, d0.l)
  0009b6  3f3c0005             move.w    #$5, -(a7)
  0009ba  2f2dea3a             move.l    -$15c6(a5), -(a7)
  0009be  486d0038             pea.l     $38(a5)
  0009c2  a807                 _SndNewChannel 
  0009c4  301f                 move.w    (a7)+, d0
  0009c6  3800                 move.w    d0, d4
  0009c8  4a44                 tst.w     d4
  0009ca  672a                 beq.b     $9f6
  0009cc  3f04                 move.w    d4, -(a7)
  0009ce  4ebafcf6             jsr       $6c6(pc)   ; SATSOUNDERROR
  0009d2  60000220             bra.w     $bf4
  0009d6  554f                 subq.w    #$2, a7
  0009d8  3043                 movea.w   d3, a0
  0009da  2008                 move.l    a0, d0
  0009dc  5380                 subq.l    #$1, d0
  0009de  e588                 lsl.l     #$2, d0
  0009e0  41edea40             lea.l     -$15c0(a5), a0
  0009e4  2f300800             move.l    (a0, d0.l), -(a7)
  0009e8  4ebaff18             jsr       $902(pc)   ; QCHANBUSY
  0009ec  101f                 move.b    (a7)+, d0
  0009ee  6706                 beq.b     $9f6
  0009f0  3f03                 move.w    d3, -(a7)
  0009f2  4ebafd00             jsr       $6f4(pc)   ; SILENCE
  0009f6  3043                 movea.w   d3, a0
  0009f8  2008                 move.l    a0, d0
  0009fa  5380                 subq.l    #$1, d0
  0009fc  e588                 lsl.l     #$2, d0
  0009fe  41edea40             lea.l     -$15c0(a5), a0
  000a02  4ab00800             tst.l     (a0, d0.l)
  000a06  670001ec             beq.w     $bf4
  000a0a  200a                 move.l    a2, d0
  000a0c  670001e6             beq.w     $bf4
  000a10  4a92                 tst.l     (a2)
  000a12  670001e0             beq.w     $bf4
  000a16  47eefff8             lea.l     -$8(a6), a3
  000a1a  36bc0051             move.w    #$51, (a3)
  000a1e  426b0002             clr.w     $2(a3)
  000a22  594f                 subq.w    #$4, a7
  000a24  2f0a                 move.l    a2, -(a7)
  000a26  4ebafe90             jsr       $8b8(pc)   ; SNDDATA
  000a2a  205f                 movea.l   (a7)+, a0
  000a2c  27480004             move.l    a0, $4(a3)
  000a30  554f                 subq.w    #$2, a7
  000a32  3043                 movea.w   d3, a0
  000a34  2008                 move.l    a0, d0
  000a36  5380                 subq.l    #$1, d0
  000a38  e588                 lsl.l     #$2, d0
  000a3a  41edea40             lea.l     -$15c0(a5), a0
  000a3e  2f300800             move.l    (a0, d0.l), -(a7)
  000a42  486efff8             pea.l     -$8(a6)
  000a46  4227                 clr.b     -(a7)
  000a48  a803                 _SndDoCommand 
  000a4a  301f                 move.w    (a7)+, d0
  000a4c  3800                 move.w    d0, d4
  000a4e  4a44                 tst.w     d4
  000a50  670a                 beq.b     $a5c
  000a52  3f04                 move.w    d4, -(a7)
  000a54  4ebafc70             jsr       $6c6(pc)   ; SATSOUNDERROR
  000a58  6000019a             bra.w     $bf4
  000a5c  7008                 moveq     #$8, d0
  000a5e  d0aefffc             add.l     -$4(a6), d0
  000a62  2040                 movea.l   d0, a0
  000a64  3810                 move.w    (a0), d4
  000a66  4a44                 tst.w     d4
  000a68  6602                 bne.b     $a6c
  000a6a  7801                 moveq     #$1, d4
  000a6c  206efffc             movea.l   -$4(a6), a0
  000a70  10280014             move.b    $14(a0), d0
  000a74  7200                 moveq     #$0, d1
  000a76  1200                 move.b    d0, d1
  000a78  0c4100fe             cmpi.w    #$fe, d1
  000a7c  660000ea             bne.w     $b68
  000a80  206efffc             movea.l   -$4(a6), a0
  000a84  30280038             move.w    $38(a0), d0
  000a88  670e                 beq.b     $a98
  000a8a  5740                 subq.w    #$3, d0
  000a8c  674a                 beq.b     $ad8
  000a8e  5740                 subq.w    #$3, d0
  000a90  6700008a             beq.w     $b1c
  000a94  600000c8             bra.w     $b5e
  000a98  594f                 subq.w    #$4, a7
  000a9a  2f0a                 move.l    a2, -(a7)
  000a9c  4eb900000370         jsr       $370.l   ; seg4+6a2
  000aa2  201f                 move.l    (a7)+, d0
  000aa4  723c                 moveq     #$3c, d1
  000aa6  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000aac  3044                 movea.w   d4, a0
  000aae  2208                 move.l    a0, d1
  000ab0  4eb900000562         jsr       $562.l   ; seg1+562
  000ab6  2d40fff4             move.l    d0, -$c(a6)
  000aba  594f                 subq.w    #$4, a7
  000abc  a975                 _TickCount 
  000abe  201f                 move.l    (a7)+, d0
  000ac0  d0aefff4             add.l     -$c(a6), d0
  000ac4  3043                 movea.w   d3, a0
  000ac6  2208                 move.l    a0, d1
  000ac8  5381                 subq.l    #$1, d1
  000aca  e589                 lsl.l     #$2, d1
  000acc  41ede9ca             lea.l     -$1636(a5), a0
  000ad0  21801800             move.l    d0, (a0, d1.l)
  000ad4  600000ce             bra.w     $ba4
  000ad8  594f                 subq.w    #$4, a7
  000ada  2f0a                 move.l    a2, -(a7)
  000adc  4eb900000370         jsr       $370.l   ; seg4+6a2
  000ae2  201f                 move.l    (a7)+, d0
  000ae4  223c000000b4         move.l    #$b4, d1
  000aea  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000af0  3044                 movea.w   d4, a0
  000af2  2208                 move.l    a0, d1
  000af4  4eb900000562         jsr       $562.l   ; seg1+562
  000afa  2d40fff4             move.l    d0, -$c(a6)
  000afe  594f                 subq.w    #$4, a7
  000b00  a975                 _TickCount 
  000b02  201f                 move.l    (a7)+, d0
  000b04  d0aefff4             add.l     -$c(a6), d0
  000b08  3043                 movea.w   d3, a0
  000b0a  2208                 move.l    a0, d1
  000b0c  5381                 subq.l    #$1, d1
  000b0e  e589                 lsl.l     #$2, d1
  000b10  41ede9ca             lea.l     -$1636(a5), a0
  000b14  21801800             move.l    d0, (a0, d1.l)
  000b18  6000008a             bra.w     $ba4
  000b1c  594f                 subq.w    #$4, a7
  000b1e  2f0a                 move.l    a2, -(a7)
  000b20  4eb900000370         jsr       $370.l   ; seg4+6a2
  000b26  201f                 move.l    (a7)+, d0
  000b28  223c00000168         move.l    #$168, d1
  000b2e  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000b34  3044                 movea.w   d4, a0
  000b36  2208                 move.l    a0, d1
  000b38  4eb900000562         jsr       $562.l   ; seg1+562
  000b3e  2d40fff4             move.l    d0, -$c(a6)
  000b42  594f                 subq.w    #$4, a7
  000b44  a975                 _TickCount 
  000b46  201f                 move.l    (a7)+, d0
  000b48  d0aefff4             add.l     -$c(a6), d0
  000b4c  3043                 movea.w   d3, a0
  000b4e  2208                 move.l    a0, d1
  000b50  5381                 subq.l    #$1, d1
  000b52  e589                 lsl.l     #$2, d1
  000b54  41ede9ca             lea.l     -$1636(a5), a0
  000b58  21801800             move.l    d0, (a0, d1.l)
  000b5c  6046                 bra.b     $ba4
  000b5e  3f3cffd5             move.w    #$ffd5, -(a7)
  000b62  4ebafb62             jsr       $6c6(pc)   ; SATSOUNDERROR
  000b66  603c                 bra.b     $ba4
  000b68  594f                 subq.w    #$4, a7
  000b6a  2f0a                 move.l    a2, -(a7)
  000b6c  4eb900000370         jsr       $370.l   ; seg4+6a2
  000b72  201f                 move.l    (a7)+, d0
  000b74  723c                 moveq     #$3c, d1
  000b76  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  000b7c  3044                 movea.w   d4, a0
  000b7e  2208                 move.l    a0, d1
  000b80  4eb900000562         jsr       $562.l   ; seg1+562
  000b86  2d40fff4             move.l    d0, -$c(a6)
  000b8a  594f                 subq.w    #$4, a7
  000b8c  a975                 _TickCount 
  000b8e  201f                 move.l    (a7)+, d0
  000b90  d0aefff4             add.l     -$c(a6), d0
  000b94  3043                 movea.w   d3, a0
  000b96  2208                 move.l    a0, d1
  000b98  5381                 subq.l    #$1, d1
  000b9a  e589                 lsl.l     #$2, d1
  000b9c  41ede9ca             lea.l     -$1636(a5), a0
  000ba0  21801800             move.l    d0, (a0, d1.l)
  000ba4  3043                 movea.w   d3, a0
  000ba6  2008                 move.l    a0, d0
  000ba8  5380                 subq.l    #$1, d0
  000baa  41edea2a             lea.l     -$15d6(a5), a0
  000bae  11bc00010800         move.b    #$1, (a0, d0.l)
  000bb4  3043                 movea.w   d3, a0
  000bb6  2008                 move.l    a0, d0
  000bb8  5380                 subq.l    #$1, d0
  000bba  d080                 add.l     d0, d0
  000bbc  41edea0a             lea.l     -$15f6(a5), a0
  000bc0  31850800             move.w    d5, (a0, d0.l)
  000bc4  45eefff8             lea.l     -$8(a6), a2
  000bc8  34bc000a             move.w    #$a, (a2)
  000bcc  357c00010002         move.w    #$1, $2(a2)
  000bd2  42aa0004             clr.l     $4(a2)
  000bd6  554f                 subq.w    #$2, a7
  000bd8  3043                 movea.w   d3, a0
  000bda  2008                 move.l    a0, d0
  000bdc  5380                 subq.l    #$1, d0
  000bde  e588                 lsl.l     #$2, d0
  000be0  41edea40             lea.l     -$15c0(a5), a0
  000be4  2f300800             move.l    (a0, d0.l), -(a7)
  000be8  486efff8             pea.l     -$8(a6)
  000bec  4227                 clr.b     -(a7)
  000bee  a803                 _SndDoCommand 
  000bf0  301f                 move.w    (a7)+, d0
  000bf2  3800                 move.w    d0, d4
  000bf4  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  000bf8  4e5e                 unlk      a6
  000bfa  205f                 movea.l   (a7)+, a0
  000bfc  504f                 addq.w    #$8, a7
  000bfe  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; GETBESTCHANNEL   (seg 7 +000c0a, 218 bytes)
  000c0a  4e56fffe             link.w    a6, #$fffe
  000c0e  48e71c00             movem.l   d3-d5, -(a7)
  000c12  362e0008             move.w    $8(a6), d3
  000c16  4a2de9b8             tst.b     -$1648(a5)
  000c1a  673e                 beq.b     $c5a
  000c1c  b66dea0a             cmp.w     -$15f6(a5), d3
  000c20  5ec0                 sgt.b     d0
  000c22  4400                 neg.b     d0
  000c24  1d40fffe             move.b    d0, -$2(a6)
  000c28  102dea2a             move.b    -$15d6(a5), d0
  000c2c  57c0                 seq.b     d0
  000c2e  4400                 neg.b     d0
  000c30  1d40ffff             move.b    d0, -$1(a6)
  000c34  554f                 subq.w    #$2, a7
  000c36  4eb9000003d8         jsr       $3d8.l   ; seg4+9c4
  000c3c  101f                 move.b    (a7)+, d0
  000c3e  802effff             or.b      -$1(a6), d0
  000c42  802efffe             or.b      -$2(a6), d0
  000c46  670a                 beq.b     $c52
  000c48  3d7c0001000a         move.w    #$1, $a(a6)
  000c4e  60000088             bra.w     $cd8
  000c52  426e000a             clr.w     $a(a6)
  000c56  60000080             bra.w     $cd8
  000c5a  426e000a             clr.w     $a(a6)
  000c5e  3803                 move.w    d3, d4
  000c60  3a2dea3e             move.w    -$15c2(a5), d5
  000c64  7601                 moveq     #$1, d3
  000c66  606c                 bra.b     $cd4
  000c68  3043                 movea.w   d3, a0
  000c6a  2008                 move.l    a0, d0
  000c6c  5380                 subq.l    #$1, d0
  000c6e  e588                 lsl.l     #$2, d0
  000c70  41edea40             lea.l     -$15c0(a5), a0
  000c74  4ab00800             tst.l     (a0, d0.l)
  000c78  6606                 bne.b     $c80
  000c7a  3d43000a             move.w    d3, $a(a6)
  000c7e  6058                 bra.b     $cd8
  000c80  3043                 movea.w   d3, a0
  000c82  2008                 move.l    a0, d0
  000c84  5380                 subq.l    #$1, d0
  000c86  41edea2a             lea.l     -$15d6(a5), a0
  000c8a  4a300800             tst.b     (a0, d0.l)
  000c8e  6606                 bne.b     $c96
  000c90  3d43000a             move.w    d3, $a(a6)
  000c94  6042                 bra.b     $cd8
  000c96  3043                 movea.w   d3, a0
  000c98  2008                 move.l    a0, d0
  000c9a  5380                 subq.l    #$1, d0
  000c9c  41ede9ba             lea.l     -$1646(a5), a0
  000ca0  4a300800             tst.b     (a0, d0.l)
  000ca4  6626                 bne.b     $ccc
  000ca6  3043                 movea.w   d3, a0
  000ca8  2008                 move.l    a0, d0
  000caa  5380                 subq.l    #$1, d0
  000cac  d080                 add.l     d0, d0
  000cae  41edea0a             lea.l     -$15f6(a5), a0
  000cb2  b8700800             cmp.w     (a0, d0.l), d4
  000cb6  6f14                 ble.b     $ccc
  000cb8  3043                 movea.w   d3, a0
  000cba  2008                 move.l    a0, d0
  000cbc  5380                 subq.l    #$1, d0
  000cbe  d080                 add.l     d0, d0
  000cc0  41edea0a             lea.l     -$15f6(a5), a0
  000cc4  38300800             move.w    (a0, d0.l), d4
  000cc8  3d43000a             move.w    d3, $a(a6)
  000ccc  0c437fff             cmpi.w    #$7fff, d3
  000cd0  6706                 beq.b     $cd8
  000cd2  5243                 addq.w    #$1, d3
  000cd4  b645                 cmp.w     d5, d3
  000cd6  6f90                 ble.b     $c68
  000cd8  4cdf0038             movem.l   (a7)+, d3-d5
  000cdc  4e5e                 unlk      a6
  000cde  205f                 movea.l   (a7)+, a0
  000ce0  544f                 addq.w    #$2, a7
  000ce2  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; RESETQ   (seg 7 +000cf6, 20 bytes)
  000cf6  4e560000             link.w    a6, #$0
  000cfa  426de94c             clr.w     -$16b4(a5)
  000cfe  426de94a             clr.w     -$16b6(a5)
  000d02  426de948             clr.w     -$16b8(a5)
  000d06  4e5e                 unlk      a6
  000d08  4e75                 rts       

;-------------------------------------------------------------
; PLAYQ   (seg 7 +000d14, 118 bytes)
  000d14  4e560000             link.w    a6, #$0
  000d18  2f03                 move.l    d3, -(a7)
  000d1a  4a6de94c             tst.w     -$16b4(a5)
  000d1e  6764                 beq.b     $d84
  000d20  554f                 subq.w    #$2, a7
  000d22  7001                 moveq     #$1, d0
  000d24  d06de948             add.w     -$16b8(a5), d0
  000d28  c1fc0006             muls.w    #$6, d0
  000d2c  41ede94e             lea.l     -$16b2(a5), a0
  000d30  3f300804             move.w    $4(a0, d0.l), -(a7)
  000d34  4ebafed4             jsr       $c0a(pc)   ; GETBESTCHANNEL
  000d38  301f                 move.w    (a7)+, d0
  000d3a  3600                 move.w    d0, d3
  000d3c  4a43                 tst.w     d3
  000d3e  6744                 beq.b     $d84
  000d40  302de94c             move.w    -$16b4(a5), d0
  000d44  5340                 subq.w    #$1, d0
  000d46  3b40e94c             move.w    d0, -$16b4(a5)
  000d4a  594f                 subq.w    #$4, a7
  000d4c  302de948             move.w    -$16b8(a5), d0
  000d50  5240                 addq.w    #$1, d0
  000d52  48c0                 ext.l     d0
  000d54  2f00                 move.l    d0, -(a7)
  000d56  4878000f             pea.l     $f.w
  000d5a  a858                 _BitAnd   
  000d5c  201f                 move.l    (a7)+, d0
  000d5e  3b40e948             move.w    d0, -$16b8(a5)
  000d62  7006                 moveq     #$6, d0
  000d64  c1ede948             muls.w    -$16b8(a5), d0
  000d68  41ede94e             lea.l     -$16b2(a5), a0
  000d6c  2f300800             move.l    (a0, d0.l), -(a7)
  000d70  7006                 moveq     #$6, d0
  000d72  c1ede948             muls.w    -$16b8(a5), d0
  000d76  41ede94e             lea.l     -$16b2(a5), a0
  000d7a  3f300804             move.w    $4(a0, d0.l), -(a7)
  000d7e  3f03                 move.w    d3, -(a7)
  000d80  4ebafbe2             jsr       $964(pc)   ; PLAYIT
  000d84  261f                 move.l    (a7)+, d3
  000d86  4e5e                 unlk      a6
  000d88  4e75                 rts       

;-------------------------------------------------------------
; SATSOUNDINIT   (seg 7 +000d92, 216 bytes)
  000d92  4e56ffec             link.w    a6, #$ffec
  000d96  2f03                 move.l    d3, -(a7)
  000d98  4a6dea3e             tst.w     -$15c2(a5)
  000d9c  6e0000c6             bgt.w     $e64
  000da0  554f                 subq.w    #$2, a7
  000da2  3f3c0001             move.w    #$1, -(a7)
  000da6  486efff0             pea.l     -$10(a6)
  000daa  4eb900000360         jsr       $360.l   ; seg4+32a
  000db0  301f                 move.w    (a7)+, d0
  000db2  3600                 move.w    d0, d3
  000db4  0c6e0602fff4         cmpi.w    #$602, -$c(a6)
  000dba  5dc0                 slt.b     d0
  000dbc  4400                 neg.b     d0
  000dbe  1600                 move.b    d0, d3
  000dc0  0c6e0700fff4         cmpi.w    #$700, -$c(a6)
  000dc6  6d1e                 blt.b     $de6
  000dc8  594f                 subq.w    #$4, a7
  000dca  203c000c0008         move.l    #$c0008, d0
  000dd0  a800                 _SoundDispatch 
  000dd2  2d5fffec             move.l    (a7)+, -$14(a6)
  000dd6  0c6e0003ffec         cmpi.w    #$3, -$14(a6)
  000ddc  5cc0                 sge.b     d0
  000dde  4400                 neg.b     d0
  000de0  1b40e9b7             move.b    d0, -$1649(a5)
  000de4  6004                 bra.b     $dea
  000de6  422de9b7             clr.b     -$1649(a5)
  000dea  1b43e9b8             move.b    d3, -$1648(a5)
  000dee  7601                 moveq     #$1, d3
  000df0  602e                 bra.b     $e20
  000df2  3043                 movea.w   d3, a0
  000df4  2008                 move.l    a0, d0
  000df6  5380                 subq.l    #$1, d0
  000df8  e588                 lsl.l     #$2, d0
  000dfa  41edea40             lea.l     -$15c0(a5), a0
  000dfe  42b00800             clr.l     (a0, d0.l)
  000e02  3043                 movea.w   d3, a0
  000e04  2008                 move.l    a0, d0
  000e06  5380                 subq.l    #$1, d0
  000e08  41edea2a             lea.l     -$15d6(a5), a0
  000e0c  42300800             clr.b     (a0, d0.l)
  000e10  3043                 movea.w   d3, a0
  000e12  2008                 move.l    a0, d0
  000e14  5380                 subq.l    #$1, d0
  000e16  41ede9ba             lea.l     -$1646(a5), a0
  000e1a  42300800             clr.b     (a0, d0.l)
  000e1e  5243                 addq.w    #$1, d3
  000e20  0c430010             cmpi.w    #$10, d3
  000e24  6fcc                 ble.b     $df2
  000e26  3b7c0001ea3e         move.w    #$1, -$15c2(a5)
  000e2c  4aadea3a             tst.l     -$15c6(a5)
  000e30  6608                 bne.b     $e3a
  000e32  2b7c00000084ea3a     move.l    #$84, -$15c6(a5)
  000e3a  42adea80             clr.l     -$1580(a5)
  000e3e  7601                 moveq     #$1, d3
  000e40  6010                 bra.b     $e52
  000e42  3043                 movea.w   d3, a0
  000e44  2008                 move.l    a0, d0
  000e46  5380                 subq.l    #$1, d0
  000e48  41edea2a             lea.l     -$15d6(a5), a0
  000e4c  42300800             clr.b     (a0, d0.l)
  000e50  5243                 addq.w    #$1, d3
  000e52  0c430010             cmpi.w    #$10, d3
  000e56  6fea                 ble.b     $e42
  000e58  422de9b9             clr.b     -$1647(a5)
  000e5c  4ebafe98             jsr       $cf6(pc)   ; RESETQ
  000e60  42ade9b2             clr.l     -$164e(a5)
  000e64  261f                 move.l    (a7)+, d3
  000e66  4e5e                 unlk      a6
  000e68  4e75                 rts       

;-------------------------------------------------------------
; SATSOUNDRESET   (seg 7 +000e7a, 168 bytes)
  000e7a  4e560000             link.w    a6, #$0
  000e7e  48e71c00             movem.l   d3-d5, -(a7)
  000e82  4a2de9b8             tst.b     -$1648(a5)
  000e86  6706                 beq.b     $e8e
  000e88  4ebaf962             jsr       $7ec(pc)
  000e8c  6042                 bra.b     $ed0
  000e8e  382dea3e             move.w    -$15c2(a5), d4
  000e92  7601                 moveq     #$1, d3
  000e94  6036                 bra.b     $ecc
  000e96  3043                 movea.w   d3, a0
  000e98  2008                 move.l    a0, d0
  000e9a  5380                 subq.l    #$1, d0
  000e9c  e588                 lsl.l     #$2, d0
  000e9e  41edea40             lea.l     -$15c0(a5), a0
  000ea2  4ab00800             tst.l     (a0, d0.l)
  000ea6  671c                 beq.b     $ec4
  000ea8  554f                 subq.w    #$2, a7
  000eaa  3043                 movea.w   d3, a0
  000eac  2008                 move.l    a0, d0
  000eae  5380                 subq.l    #$1, d0
  000eb0  e588                 lsl.l     #$2, d0
  000eb2  41edea40             lea.l     -$15c0(a5), a0
  000eb6  2f300800             move.l    (a0, d0.l), -(a7)
  000eba  1f3c0001             move.b    #$1, -(a7)
  000ebe  a801                 _SndDisposeChannel 
  000ec0  301f                 move.w    (a7)+, d0
  000ec2  3a00                 move.w    d0, d5
  000ec4  0c437fff             cmpi.w    #$7fff, d3
  000ec8  6706                 beq.b     $ed0
  000eca  5243                 addq.w    #$1, d3
  000ecc  b644                 cmp.w     d4, d3
  000ece  6fc6                 ble.b     $e96
  000ed0  382dea3e             move.w    -$15c2(a5), d4
  000ed4  7601                 moveq     #$1, d3
  000ed6  6018                 bra.b     $ef0
  000ed8  3043                 movea.w   d3, a0
  000eda  2008                 move.l    a0, d0
  000edc  5380                 subq.l    #$1, d0
  000ede  e588                 lsl.l     #$2, d0
  000ee0  41edea40             lea.l     -$15c0(a5), a0
  000ee4  42b00800             clr.l     (a0, d0.l)
  000ee8  0c437fff             cmpi.w    #$7fff, d3
  000eec  6706                 beq.b     $ef4
  000eee  5243                 addq.w    #$1, d3
  000ef0  b644                 cmp.w     d4, d3
  000ef2  6fe4                 ble.b     $ed8
  000ef4  382dea3e             move.w    -$15c2(a5), d4
  000ef8  7601                 moveq     #$1, d3
  000efa  6016                 bra.b     $f12
  000efc  3043                 movea.w   d3, a0
  000efe  2008                 move.l    a0, d0
  000f00  5380                 subq.l    #$1, d0
  000f02  41edea2a             lea.l     -$15d6(a5), a0
  000f06  42300800             clr.b     (a0, d0.l)
  000f0a  0c437fff             cmpi.w    #$7fff, d3
  000f0e  6706                 beq.b     $f16
  000f10  5243                 addq.w    #$1, d3
  000f12  b644                 cmp.w     d4, d3
  000f14  6fe6                 ble.b     $efc
  000f16  42ade9b2             clr.l     -$164e(a5)
  000f1a  4cdf0038             movem.l   (a7)+, d3-d5
  000f1e  4e5e                 unlk      a6
  000f20  4e75                 rts       

;-------------------------------------------------------------
; SATSOUNDSHUTUPCHANNEL   (seg 7 +000f32, 122 bytes)
  000f32  4e56fffe             link.w    a6, #$fffe
  000f36  2f03                 move.l    d3, -(a7)
  000f38  362e0008             move.w    $8(a6), d3
  000f3c  4a2de9b8             tst.b     -$1648(a5)
  000f40  6706                 beq.b     $f48
  000f42  4ebaf8a8             jsr       $7ec(pc)
  000f46  605a                 bra.b     $fa2
  000f48  b66dea3e             cmp.w     -$15c2(a5), d3
  000f4c  6e54                 bgt.b     $fa2
  000f4e  0c430001             cmpi.w    #$1, d3
  000f52  6d4e                 blt.b     $fa2
  000f54  3043                 movea.w   d3, a0
  000f56  2008                 move.l    a0, d0
  000f58  5380                 subq.l    #$1, d0
  000f5a  e588                 lsl.l     #$2, d0
  000f5c  41edea40             lea.l     -$15c0(a5), a0
  000f60  4ab00800             tst.l     (a0, d0.l)
  000f64  671e                 beq.b     $f84
  000f66  554f                 subq.w    #$2, a7
  000f68  3043                 movea.w   d3, a0
  000f6a  2008                 move.l    a0, d0
  000f6c  5380                 subq.l    #$1, d0
  000f6e  e588                 lsl.l     #$2, d0
  000f70  41edea40             lea.l     -$15c0(a5), a0
  000f74  2f300800             move.l    (a0, d0.l), -(a7)
  000f78  1f3c0001             move.b    #$1, -(a7)
  000f7c  a801                 _SndDisposeChannel 
  000f7e  301f                 move.w    (a7)+, d0
  000f80  3d40fffe             move.w    d0, -$2(a6)
  000f84  3043                 movea.w   d3, a0
  000f86  2008                 move.l    a0, d0
  000f88  5380                 subq.l    #$1, d0
  000f8a  e588                 lsl.l     #$2, d0
  000f8c  41edea40             lea.l     -$15c0(a5), a0
  000f90  42b00800             clr.l     (a0, d0.l)
  000f94  3043                 movea.w   d3, a0
  000f96  2008                 move.l    a0, d0
  000f98  5380                 subq.l    #$1, d0
  000f9a  41edea2a             lea.l     -$15d6(a5), a0
  000f9e  42300800             clr.b     (a0, d0.l)
  000fa2  261f                 move.l    (a7)+, d3
  000fa4  4e5e                 unlk      a6
  000fa6  205f                 movea.l   (a7)+, a0
  000fa8  544f                 addq.w    #$2, a7
  000faa  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATSOUNDSHUTUP   (seg 7 +000fc4, 16 bytes)
  000fc4  4e560000             link.w    a6, #$0
  000fc8  4ebafeb0             jsr       $e7a(pc)   ; SATSOUNDRESET
  000fcc  4ebafd28             jsr       $cf6(pc)   ; RESETQ
  000fd0  4e5e                 unlk      a6
  000fd2  4e75                 rts       

;-------------------------------------------------------------
; SATSOUNDEVENTS   (seg 7 +000fe6, 278 bytes)
  000fe6  4e560000             link.w    a6, #$0
  000fea  48e71c00             movem.l   d3-d5, -(a7)
  000fee  4a2de9b8             tst.b     -$1648(a5)
  000ff2  6712                 beq.b     $1006
  000ff4  554f                 subq.w    #$2, a7
  000ff6  4eb9000003d8         jsr       $3d8.l   ; seg4+9c4
  000ffc  101f                 move.b    (a7)+, d0
  000ffe  6764                 beq.b     $1064
  001000  422dea2a             clr.b     -$15d6(a5)
  001004  605e                 bra.b     $1064
  001006  382dea3e             move.w    -$15c2(a5), d4
  00100a  7601                 moveq     #$1, d3
  00100c  6052                 bra.b     $1060
  00100e  3043                 movea.w   d3, a0
  001010  2008                 move.l    a0, d0
  001012  5380                 subq.l    #$1, d0
  001014  e588                 lsl.l     #$2, d0
  001016  41edea40             lea.l     -$15c0(a5), a0
  00101a  4ab00800             tst.l     (a0, d0.l)
  00101e  6610                 bne.b     $1030
  001020  3043                 movea.w   d3, a0
  001022  2008                 move.l    a0, d0
  001024  5380                 subq.l    #$1, d0
  001026  41edea2a             lea.l     -$15d6(a5), a0
  00102a  42300800             clr.b     (a0, d0.l)
  00102e  6028                 bra.b     $1058
  001030  554f                 subq.w    #$2, a7
  001032  3043                 movea.w   d3, a0
  001034  2008                 move.l    a0, d0
  001036  5380                 subq.l    #$1, d0
  001038  e588                 lsl.l     #$2, d0
  00103a  41edea40             lea.l     -$15c0(a5), a0
  00103e  2f300800             move.l    (a0, d0.l), -(a7)
  001042  4ebaf8be             jsr       $902(pc)   ; QCHANBUSY
  001046  101f                 move.b    (a7)+, d0
  001048  660e                 bne.b     $1058
  00104a  3043                 movea.w   d3, a0
  00104c  2008                 move.l    a0, d0
  00104e  5380                 subq.l    #$1, d0
  001050  41edea2a             lea.l     -$15d6(a5), a0
  001054  42300800             clr.b     (a0, d0.l)
  001058  0c437fff             cmpi.w    #$7fff, d3
  00105c  6706                 beq.b     $1064
  00105e  5243                 addq.w    #$1, d3
  001060  b644                 cmp.w     d4, d3
  001062  6faa                 ble.b     $100e
  001064  594f                 subq.w    #$4, a7
  001066  a975                 _TickCount 
  001068  201f                 move.l    (a7)+, d0
  00106a  2a00                 move.l    d0, d5
  00106c  382dea3e             move.w    -$15c2(a5), d4
  001070  7601                 moveq     #$1, d3
  001072  6030                 bra.b     $10a4
  001074  3043                 movea.w   d3, a0
  001076  2008                 move.l    a0, d0
  001078  5380                 subq.l    #$1, d0
  00107a  41edea2a             lea.l     -$15d6(a5), a0
  00107e  4a300800             tst.b     (a0, d0.l)
  001082  6718                 beq.b     $109c
  001084  3043                 movea.w   d3, a0
  001086  2008                 move.l    a0, d0
  001088  5380                 subq.l    #$1, d0
  00108a  e588                 lsl.l     #$2, d0
  00108c  41ede9ca             lea.l     -$1636(a5), a0
  001090  bab00800             cmp.l     (a0, d0.l), d5
  001094  6f06                 ble.b     $109c
  001096  3f03                 move.w    d3, -(a7)
  001098  4ebafe98             jsr       $f32(pc)   ; SATSOUNDSHUTUPCHANNEL
  00109c  0c437fff             cmpi.w    #$7fff, d3
  0010a0  6706                 beq.b     $10a8
  0010a2  5243                 addq.w    #$1, d3
  0010a4  b644                 cmp.w     d4, d3
  0010a6  6fcc                 ble.b     $1074
  0010a8  4aade9b2             tst.l     -$164e(a5)
  0010ac  673c                 beq.b     $10ea
  0010ae  554f                 subq.w    #$2, a7
  0010b0  3f2de9ae             move.w    -$1652(a5), -(a7)
  0010b4  4ebafb54             jsr       $c0a(pc)   ; GETBESTCHANNEL
  0010b8  301f                 move.w    (a7)+, d0
  0010ba  3600                 move.w    d0, d3
  0010bc  4a43                 tst.w     d3
  0010be  670e                 beq.b     $10ce
  0010c0  2f2de9b2             move.l    -$164e(a5), -(a7)
  0010c4  3f2de9ae             move.w    -$1652(a5), -(a7)
  0010c8  3f03                 move.w    d3, -(a7)
  0010ca  4ebaf898             jsr       $964(pc)   ; PLAYIT
  0010ce  102de9b1             move.b    -$164f(a5), d0
  0010d2  57c0                 seq.b     d0
  0010d4  4400                 neg.b     d0
  0010d6  4a43                 tst.w     d3
  0010d8  56c1                 sne.b     d1
  0010da  4401                 neg.b     d1
  0010dc  8200                 or.b      d0, d1
  0010de  6714                 beq.b     $10f4
  0010e0  42ade9b2             clr.l     -$164e(a5)
  0010e4  426de9ae             clr.w     -$1652(a5)
  0010e8  600a                 bra.b     $10f4
  0010ea  4a6de94c             tst.w     -$16b4(a5)
  0010ee  6f04                 ble.b     $10f4
  0010f0  4ebafc22             jsr       $d14(pc)   ; PLAYQ
  0010f4  4cdf0038             movem.l   (a7)+, d3-d5
  0010f8  4e5e                 unlk      a6
  0010fa  4e75                 rts       

;-------------------------------------------------------------
; SATSAFERECTBLIT   (seg 7 +00110e, 56 bytes)
  00110e  4e560000             link.w    a6, #$0
  001112  206e0010             movea.l   $10(a6), a0
  001116  2050                 movea.l   (a0), a0
  001118  48680002             pea.l     $2(a0)
  00111c  206e000c             movea.l   $c(a6), a0
  001120  2050                 movea.l   (a0), a0
  001122  48680002             pea.l     $2(a0)
  001126  2f2e0008             move.l    $8(a6), -(a7)
  00112a  2f2e0008             move.l    $8(a6), -(a7)
  00112e  4267                 clr.w     -(a7)
  001130  48780000             pea.l     $0.w
  001134  2f2de7e0             move.l    -$1820(a5), -(a7)
  001138  205f                 movea.l   (a7)+, a0
  00113a  4e90                 jsr       (a0)
  00113c  4e5e                 unlk      a6
  00113e  205f                 movea.l   (a7)+, a0
  001140  4fef000c             lea.l     $c(a7), a7
  001144  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATSAFEMASKBLIT   (seg 7 +001158, 982 bytes)
  001158  4e56fff0             link.w    a6, #$fff0
  00115c  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  001160  246e001c             movea.l   $1c(a6), a2
  001164  2a2e0018             move.l    $18(a6), d5
  001168  286e0014             movea.l   $14(a6), a4
  00116c  382e000a             move.w    $a(a6), d4
  001170  362e0008             move.w    $8(a6), d3
  001174  4a85                 tst.l     d5
  001176  6708                 beq.b     $1180
  001178  2045                 movea.l   d5, a0
  00117a  26680026             movea.l   $26(a0), a3
  00117e  6002                 bra.b     $1182
  001180  97cb                 suba.l    a3, a3
  001182  2d6e0010fff8         move.l    $10(a6), -$8(a6)
  001188  2d6e000cfff0         move.l    $c(a6), -$10(a6)
  00118e  302efffa             move.w    -$6(a6), d0
  001192  d044                 add.w     d4, d0
  001194  3d40fffe             move.w    d0, -$2(a6)
  001198  302efff8             move.w    -$8(a6), d0
  00119c  d043                 add.w     d3, d0
  00119e  3d40fffc             move.w    d0, -$4(a6)
  0011a2  302efff2             move.w    -$e(a6), d0
  0011a6  d044                 add.w     d4, d0
  0011a8  3d40fff6             move.w    d0, -$a(a6)
  0011ac  302efff0             move.w    -$10(a6), d0
  0011b0  d043                 add.w     d3, d0
  0011b2  3d40fff4             move.w    d0, -$c(a6)
  0011b6  0c6d0004e860         cmpi.w    #$4, -$17a0(a5)
  0011bc  660001fa             bne.w     $13b8
  0011c0  594f                 subq.w    #$4, a7
  0011c2  302efffa             move.w    -$6(a6), d0
  0011c6  906efff2             sub.w     -$e(a6), d0
  0011ca  48c0                 ext.l     d0
  0011cc  2f00                 move.l    d0, -(a7)
  0011ce  48780001             pea.l     $1.w
  0011d2  a858                 _BitAnd   
  0011d4  201f                 move.l    (a7)+, d0
  0011d6  660000dc             bne.w     $12b4
  0011da  2052                 movea.l   (a2), a0
  0011dc  226de878             movea.l   -$1788(a5), a1
  0011e0  22690002             movea.l   $2(a1), a1
  0011e4  2251                 movea.l   (a1), a1
  0011e6  2290                 move.l    (a0), (a1)
  0011e8  206de878             movea.l   -$1788(a5), a0
  0011ec  20680002             movea.l   $2(a0), a0
  0011f0  2050                 movea.l   (a0), a0
  0011f2  216a000c0006         move.l    $c(a2), $6(a0)
  0011f8  216a0010000a         move.l    $10(a2), $a(a0)
  0011fe  594f                 subq.w    #$4, a7
  001200  306a0014             movea.w   $14(a2), a0
  001204  2f08                 move.l    a0, -(a7)
  001206  48788000             pea.l     $8000.w
  00120a  a85b                 _BitOr    
  00120c  201f                 move.l    (a7)+, d0
  00120e  206de878             movea.l   -$1788(a5), a0
  001212  20680002             movea.l   $2(a0), a0
  001216  2050                 movea.l   (a0), a0
  001218  31400004             move.w    d0, $4(a0)
  00121c  4aaa001a             tst.l     $1a(a2)
  001220  6624                 bne.b     $1246
  001222  206de878             movea.l   -$1788(a5), a0
  001226  48680002             pea.l     $2(a0)
  00122a  486a0006             pea.l     $6(a2)
  00122e  2054                 movea.l   (a4), a0
  001230  48680002             pea.l     $2(a0)
  001234  486efff8             pea.l     -$8(a6)
  001238  486efff8             pea.l     -$8(a6)
  00123c  486efff0             pea.l     -$10(a6)
  001240  a817                 _CopyMask 
  001242  600002dc             bra.w     $1520
  001246  2f2a001a             move.l    $1a(a2), -(a7)
  00124a  2f2de7ea             move.l    -$1816(a5), -(a7)
  00124e  2f2de7bc             move.l    -$1844(a5), -(a7)
  001252  205f                 movea.l   (a7)+, a0
  001254  4e90                 jsr       (a0)
  001256  2f2de7ea             move.l    -$1816(a5), -(a7)
  00125a  302efff2             move.w    -$e(a6), d0
  00125e  906efffa             sub.w     -$6(a6), d0
  001262  3f00                 move.w    d0, -(a7)
  001264  302efff0             move.w    -$10(a6), d0
  001268  906efff8             sub.w     -$8(a6), d0
  00126c  3f00                 move.w    d0, -(a7)
  00126e  2f2de7c0             move.l    -$1840(a5), -(a7)
  001272  205f                 movea.l   (a7)+, a0
  001274  4e90                 jsr       (a0)
  001276  200b                 move.l    a3, d0
  001278  6712                 beq.b     $128c
  00127a  2f0b                 move.l    a3, -(a7)
  00127c  2f2de7ea             move.l    -$1816(a5), -(a7)
  001280  2f2de7ea             move.l    -$1816(a5), -(a7)
  001284  2f2de7c4             move.l    -$183c(a5), -(a7)
  001288  205f                 movea.l   (a7)+, a0
  00128a  4e90                 jsr       (a0)
  00128c  206de878             movea.l   -$1788(a5), a0
  001290  48680002             pea.l     $2(a0)
  001294  2054                 movea.l   (a4), a0
  001296  48680002             pea.l     $2(a0)
  00129a  486efff8             pea.l     -$8(a6)
  00129e  486efff0             pea.l     -$10(a6)
  0012a2  4267                 clr.w     -(a7)
  0012a4  2f2de7ea             move.l    -$1816(a5), -(a7)
  0012a8  2f2de7e0             move.l    -$1820(a5), -(a7)
  0012ac  205f                 movea.l   (a7)+, a0
  0012ae  4e90                 jsr       (a0)
  0012b0  6000026e             bra.w     $1520
  0012b4  2052                 movea.l   (a2), a0
  0012b6  226de878             movea.l   -$1788(a5), a1
  0012ba  22690002             movea.l   $2(a1), a1
  0012be  2251                 movea.l   (a1), a1
  0012c0  22a80004             move.l    $4(a0), (a1)
  0012c4  2052                 movea.l   (a2), a0
  0012c6  226de878             movea.l   -$1788(a5), a1
  0012ca  22690002             movea.l   $2(a1), a1
  0012ce  2251                 movea.l   (a1), a1
  0012d0  2368000e0006         move.l    $e(a0), $6(a1)
  0012d6  23680012000a         move.l    $12(a0), $a(a1)
  0012dc  206de878             movea.l   -$1788(a5), a0
  0012e0  20680002             movea.l   $2(a0), a0
  0012e4  2050                 movea.l   (a0), a0
  0012e6  42680008             clr.w     $8(a0)
  0012ea  7001                 moveq     #$1, d0
  0012ec  d06efffa             add.w     -$6(a6), d0
  0012f0  3d40fffa             move.w    d0, -$6(a6)
  0012f4  7001                 moveq     #$1, d0
  0012f6  d06efffe             add.w     -$2(a6), d0
  0012fa  3d40fffe             move.w    d0, -$2(a6)
  0012fe  594f                 subq.w    #$4, a7
  001300  2052                 movea.l   (a2), a0
  001302  32680016             movea.w   $16(a0), a1
  001306  2f09                 move.l    a1, -(a7)
  001308  48788000             pea.l     $8000.w
  00130c  a85b                 _BitOr    
  00130e  201f                 move.l    (a7)+, d0
  001310  206de878             movea.l   -$1788(a5), a0
  001314  20680002             movea.l   $2(a0), a0
  001318  2050                 movea.l   (a0), a0
  00131a  31400004             move.w    d0, $4(a0)
  00131e  4aaa001a             tst.l     $1a(a2)
  001322  6624                 bne.b     $1348
  001324  206de878             movea.l   -$1788(a5), a0
  001328  48680002             pea.l     $2(a0)
  00132c  486a0006             pea.l     $6(a2)
  001330  2054                 movea.l   (a4), a0
  001332  48680002             pea.l     $2(a0)
  001336  486efff8             pea.l     -$8(a6)
  00133a  486efff8             pea.l     -$8(a6)
  00133e  486efff0             pea.l     -$10(a6)
  001342  a817                 _CopyMask 
  001344  600001da             bra.w     $1520
  001348  2f2a001a             move.l    $1a(a2), -(a7)
  00134c  2f2de7ea             move.l    -$1816(a5), -(a7)
  001350  2f2de7bc             move.l    -$1844(a5), -(a7)
  001354  205f                 movea.l   (a7)+, a0
  001356  4e90                 jsr       (a0)
  001358  2f2de7ea             move.l    -$1816(a5), -(a7)
  00135c  302efff2             move.w    -$e(a6), d0
  001360  906efffa             sub.w     -$6(a6), d0
  001364  5240                 addq.w    #$1, d0
  001366  3f00                 move.w    d0, -(a7)
  001368  302efff0             move.w    -$10(a6), d0
  00136c  906efff8             sub.w     -$8(a6), d0
  001370  3f00                 move.w    d0, -(a7)
  001372  2f2de7c0             move.l    -$1840(a5), -(a7)
  001376  205f                 movea.l   (a7)+, a0
  001378  4e90                 jsr       (a0)
  00137a  200b                 move.l    a3, d0
  00137c  6712                 beq.b     $1390
  00137e  2f0b                 move.l    a3, -(a7)
  001380  2f2de7ea             move.l    -$1816(a5), -(a7)
  001384  2f2de7ea             move.l    -$1816(a5), -(a7)
  001388  2f2de7c4             move.l    -$183c(a5), -(a7)
  00138c  205f                 movea.l   (a7)+, a0
  00138e  4e90                 jsr       (a0)
  001390  206de878             movea.l   -$1788(a5), a0
  001394  48680002             pea.l     $2(a0)
  001398  2054                 movea.l   (a4), a0
  00139a  48680002             pea.l     $2(a0)
  00139e  486efff8             pea.l     -$8(a6)
  0013a2  486efff0             pea.l     -$10(a6)
  0013a6  4267                 clr.w     -(a7)
  0013a8  2f2de7ea             move.l    -$1816(a5), -(a7)
  0013ac  2f2de7e0             move.l    -$1820(a5), -(a7)
  0013b0  205f                 movea.l   (a7)+, a0
  0013b2  4e90                 jsr       (a0)
  0013b4  6000016a             bra.w     $1520
  0013b8  0c6d0001e860         cmpi.w    #$1, -$17a0(a5)
  0013be  6f0000da             ble.w     $149a
  0013c2  206de878             movea.l   -$1788(a5), a0
  0013c6  20680002             movea.l   $2(a0), a0
  0013ca  2050                 movea.l   (a0), a0
  0013cc  2092                 move.l    (a2), (a0)
  0013ce  206de878             movea.l   -$1788(a5), a0
  0013d2  20680002             movea.l   $2(a0), a0
  0013d6  2050                 movea.l   (a0), a0
  0013d8  216a000c0006         move.l    $c(a2), $6(a0)
  0013de  216a0010000a         move.l    $10(a2), $a(a0)
  0013e4  594f                 subq.w    #$4, a7
  0013e6  306a0014             movea.w   $14(a2), a0
  0013ea  2f08                 move.l    a0, -(a7)
  0013ec  48788000             pea.l     $8000.w
  0013f0  a85b                 _BitOr    
  0013f2  201f                 move.l    (a7)+, d0
  0013f4  206de878             movea.l   -$1788(a5), a0
  0013f8  20680002             movea.l   $2(a0), a0
  0013fc  2050                 movea.l   (a0), a0
  0013fe  31400004             move.w    d0, $4(a0)
  001402  4aaa001a             tst.l     $1a(a2)
  001406  6624                 bne.b     $142c
  001408  206de878             movea.l   -$1788(a5), a0
  00140c  48680002             pea.l     $2(a0)
  001410  486a0006             pea.l     $6(a2)
  001414  2054                 movea.l   (a4), a0
  001416  48680002             pea.l     $2(a0)
  00141a  486efff8             pea.l     -$8(a6)
  00141e  486efff8             pea.l     -$8(a6)
  001422  486efff0             pea.l     -$10(a6)
  001426  a817                 _CopyMask 
  001428  600000f6             bra.w     $1520
  00142c  2f2a001a             move.l    $1a(a2), -(a7)
  001430  2f2de7ea             move.l    -$1816(a5), -(a7)
  001434  2f2de7bc             move.l    -$1844(a5), -(a7)
  001438  205f                 movea.l   (a7)+, a0
  00143a  4e90                 jsr       (a0)
  00143c  2f2de7ea             move.l    -$1816(a5), -(a7)
  001440  302efff2             move.w    -$e(a6), d0
  001444  906efffa             sub.w     -$6(a6), d0
  001448  3f00                 move.w    d0, -(a7)
  00144a  302efff0             move.w    -$10(a6), d0
  00144e  906efff8             sub.w     -$8(a6), d0
  001452  3f00                 move.w    d0, -(a7)
  001454  2f2de7c0             move.l    -$1840(a5), -(a7)
  001458  205f                 movea.l   (a7)+, a0
  00145a  4e90                 jsr       (a0)
  00145c  200b                 move.l    a3, d0
  00145e  6712                 beq.b     $1472
  001460  2f0b                 move.l    a3, -(a7)
  001462  2f2de7ea             move.l    -$1816(a5), -(a7)
  001466  2f2de7ea             move.l    -$1816(a5), -(a7)
  00146a  2f2de7c4             move.l    -$183c(a5), -(a7)
  00146e  205f                 movea.l   (a7)+, a0
  001470  4e90                 jsr       (a0)
  001472  206de878             movea.l   -$1788(a5), a0
  001476  48680002             pea.l     $2(a0)
  00147a  2054                 movea.l   (a4), a0
  00147c  48680002             pea.l     $2(a0)
  001480  486efff8             pea.l     -$8(a6)
  001484  486efff0             pea.l     -$10(a6)
  001488  4267                 clr.w     -(a7)
  00148a  2f2de7ea             move.l    -$1816(a5), -(a7)
  00148e  2f2de7e0             move.l    -$1820(a5), -(a7)
  001492  205f                 movea.l   (a7)+, a0
  001494  4e90                 jsr       (a0)
  001496  60000088             bra.w     $1520
  00149a  4aaa001a             tst.l     $1a(a2)
  00149e  661c                 bne.b     $14bc
  0014a0  2f12                 move.l    (a2), -(a7)
  0014a2  486a0006             pea.l     $6(a2)
  0014a6  2054                 movea.l   (a4), a0
  0014a8  48680002             pea.l     $2(a0)
  0014ac  486efff8             pea.l     -$8(a6)
  0014b0  486efff8             pea.l     -$8(a6)
  0014b4  486efff0             pea.l     -$10(a6)
  0014b8  a817                 _CopyMask 
  0014ba  6064                 bra.b     $1520
  0014bc  2f2a001a             move.l    $1a(a2), -(a7)
  0014c0  2f2de7ea             move.l    -$1816(a5), -(a7)
  0014c4  2f2de7bc             move.l    -$1844(a5), -(a7)
  0014c8  205f                 movea.l   (a7)+, a0
  0014ca  4e90                 jsr       (a0)
  0014cc  2f2de7ea             move.l    -$1816(a5), -(a7)
  0014d0  302efff2             move.w    -$e(a6), d0
  0014d4  906efffa             sub.w     -$6(a6), d0
  0014d8  3f00                 move.w    d0, -(a7)
  0014da  302efff0             move.w    -$10(a6), d0
  0014de  906efff8             sub.w     -$8(a6), d0
  0014e2  3f00                 move.w    d0, -(a7)
  0014e4  2f2de7c0             move.l    -$1840(a5), -(a7)
  0014e8  205f                 movea.l   (a7)+, a0
  0014ea  4e90                 jsr       (a0)
  0014ec  200b                 move.l    a3, d0
  0014ee  6712                 beq.b     $1502
  0014f0  2f0b                 move.l    a3, -(a7)
  0014f2  2f2de7ea             move.l    -$1816(a5), -(a7)
  0014f6  2f2de7ea             move.l    -$1816(a5), -(a7)
  0014fa  2f2de7c4             move.l    -$183c(a5), -(a7)
  0014fe  205f                 movea.l   (a7)+, a0
  001500  4e90                 jsr       (a0)
  001502  2f12                 move.l    (a2), -(a7)
  001504  2054                 movea.l   (a4), a0
  001506  48680002             pea.l     $2(a0)
  00150a  486efff8             pea.l     -$8(a6)
  00150e  486efff0             pea.l     -$10(a6)
  001512  4267                 clr.w     -(a7)
  001514  2f2de7ea             move.l    -$1816(a5), -(a7)
  001518  2f2de7e0             move.l    -$1820(a5), -(a7)
  00151c  205f                 movea.l   (a7)+, a0
  00151e  4e90                 jsr       (a0)
  001520  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  001524  4e5e                 unlk      a6
  001526  205f                 movea.l   (a7)+, a0
  001528  4fef0018             lea.l     $18(a7), a7
  00152c  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATRAND   (seg 7 +001540, 50 bytes)
  001540  4e560000             link.w    a6, #$0
  001544  2f03                 move.l    d3, -(a7)
  001546  554f                 subq.w    #$2, a7
  001548  a861                 _Random   
  00154a  301f                 move.w    (a7)+, d0
  00154c  3600                 move.w    d0, d3
  00154e  4a43                 tst.w     d3
  001550  6c02                 bge.b     $1554
  001552  4443                 neg.w     d3
  001554  3043                 movea.w   d3, a0
  001556  326e0008             movea.w   $8(a6), a1
  00155a  2008                 move.l    a0, d0
  00155c  2209                 move.l    a1, d1
  00155e  4eb9000005e0         jsr       $5e0.l   ; seg1+5e0
  001564  3d40000a             move.w    d0, $a(a6)
  001568  261f                 move.l    (a7)+, d3
  00156a  4e5e                 unlk      a6
  00156c  205f                 movea.l   (a7)+, a0
  00156e  544f                 addq.w    #$2, a7
  001570  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATINITTOOLBOX   (seg 7 +00157c, 32 bytes)
  00157c  4e560000             link.w    a6, #$0
  001580  486de7b8             pea.l     -$1848(a5)
  001584  a86e                 _InitGraf 
  001586  a8fe                 _InitFonts 
  001588  a912                 _InitWindows 
  00158a  a930                 _InitMenus 
  00158c  a9cc                 _TEInit   
  00158e  a850                 _InitCursor 
  001590  48780000             pea.l     $0.w
  001594  a97b                 _InitDialogs 
  001596  a063                 _MaxApplZone 
  001598  4e5e                 unlk      a6
  00159a  4e75                 rts       

;-------------------------------------------------------------
; SETUPPIXMAP   (seg 7 +0015ae, 440 bytes)
  0015ae  4e56fff4             link.w    a6, #$fff4
  0015b2  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  0015b6  382e0016             move.w    $16(a6), d4
  0015ba  3a2e000c             move.w    $c(a6), d5
  0015be  286e0008             movea.l   $8(a6), a4
  0015c2  206e0012             movea.l   $12(a6), a0
  0015c6  2d50fff4             move.l    (a0), -$c(a6)
  0015ca  2d680004fff8         move.l    $4(a0), -$8(a6)
  0015d0  7600                 moveq     #$0, d3
  0015d2  42aefffc             clr.l     -$4(a6)
  0015d6  97cb                 suba.l    a3, a3
  0015d8  0c440008             cmpi.w    #$8, d4
  0015dc  6e18                 bgt.b     $15f6
  0015de  2d6e000efffc         move.l    $e(a6), -$4(a6)
  0015e4  554f                 subq.w    #$2, a7
  0015e6  486efffc             pea.l     -$4(a6)
  0015ea  4eb9000003f8         jsr       $3f8.l   ; seg4+a1e
  0015f0  301f                 move.w    (a7)+, d0
  0015f2  3600                 move.w    d0, d3
  0015f4  6028                 bra.b     $161e
  0015f6  594f                 subq.w    #$4, a7
  0015f8  594f                 subq.w    #$4, a7
  0015fa  48780008             pea.l     $8.w
  0015fe  201f                 move.l    (a7)+, d0
  001600  a122                 _NewHandle 
  001602  2e88                 move.l    a0, (a7)
  001604  205f                 movea.l   (a7)+, a0
  001606  2f08                 move.l    a0, -(a7)
  001608  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  00160e  205f                 movea.l   (a7)+, a0
  001610  2d48fffc             move.l    a0, -$4(a6)
  001614  554f                 subq.w    #$2, a7
  001616  3eb80220             move.w    $220.w, (a7)
  00161a  301f                 move.w    (a7)+, d0
  00161c  3600                 move.w    d0, d3
  00161e  4a43                 tst.w     d3
  001620  6600011e             bne.w     $1740
  001624  0c440001             cmpi.w    #$1, d4
  001628  6632                 bne.b     $165c
  00162a  594f                 subq.w    #$4, a7
  00162c  594f                 subq.w    #$4, a7
  00162e  302efff8             move.w    -$8(a6), d0
  001632  906efff4             sub.w     -$c(a6), d0
  001636  c1c5                 muls.w    d5, d0
  001638  5880                 addq.l    #$4, d0
  00163a  2f00                 move.l    d0, -(a7)
  00163c  201f                 move.l    (a7)+, d0
  00163e  a11e                 _NewPtr   
  001640  2e88                 move.l    a0, (a7)
  001642  205f                 movea.l   (a7)+, a0
  001644  2f08                 move.l    a0, -(a7)
  001646  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  00164c  205f                 movea.l   (a7)+, a0
  00164e  2648                 movea.l   a0, a3
  001650  200b                 move.l    a3, d0
  001652  672c                 beq.b     $1680
  001654  7004                 moveq     #$4, d0
  001656  d08b                 add.l     a3, d0
  001658  2640                 movea.l   d0, a3
  00165a  6024                 bra.b     $1680
  00165c  594f                 subq.w    #$4, a7
  00165e  594f                 subq.w    #$4, a7
  001660  302efff8             move.w    -$8(a6), d0
  001664  906efff4             sub.w     -$c(a6), d0
  001668  c1c5                 muls.w    d5, d0
  00166a  2f00                 move.l    d0, -(a7)
  00166c  201f                 move.l    (a7)+, d0
  00166e  a11e                 _NewPtr   
  001670  2e88                 move.l    a0, (a7)
  001672  205f                 movea.l   (a7)+, a0
  001674  2f08                 move.l    a0, -(a7)
  001676  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  00167c  205f                 movea.l   (a7)+, a0
  00167e  2648                 movea.l   a0, a3
  001680  200b                 move.l    a3, d0
  001682  670000b0             beq.w     $1734
  001686  2454                 movea.l   (a4), a2
  001688  248b                 move.l    a3, (a2)
  00168a  3005                 move.w    d5, d0
  00168c  0080ffff8000         ori.l     #$ffff8000, d0
  001692  35400004             move.w    d0, $4(a2)
  001696  256efff40006         move.l    -$c(a6), $6(a2)
  00169c  256efff8000a         move.l    -$8(a6), $a(a2)
  0016a2  426a000e             clr.w     $e(a2)
  0016a6  426a0010             clr.w     $10(a2)
  0016aa  42aa0012             clr.l     $12(a2)
  0016ae  257c004800000016     move.l    #$480000, $16(a2)
  0016b6  257c00480000001a     move.l    #$480000, $1a(a2)
  0016be  35440020             move.w    d4, $20(a2)
  0016c2  42aa0026             clr.l     $26(a2)
  0016c6  42aa002e             clr.l     $2e(a2)
  0016ca  0c440008             cmpi.w    #$8, d4
  0016ce  6e16                 bgt.b     $16e6
  0016d0  426a001e             clr.w     $1e(a2)
  0016d4  357c00010022         move.w    #$1, $22(a2)
  0016da  35440024             move.w    d4, $24(a2)
  0016de  256efffc002a         move.l    -$4(a6), $2a(a2)
  0016e4  605e                 bra.b     $1744
  0016e6  357c0010001e         move.w    #$10, $1e(a2)
  0016ec  357c00030022         move.w    #$3, $22(a2)
  0016f2  0c440010             cmpi.w    #$10, d4
  0016f6  6608                 bne.b     $1700
  0016f8  357c00050024         move.w    #$5, $24(a2)
  0016fe  6006                 bra.b     $1706
  001700  357c00080024         move.w    #$8, $24(a2)
  001706  2054                 movea.l   (a4), a0
  001708  7003                 moveq     #$3, d0
  00170a  c1e80024             muls.w    $24(a0), d0
  00170e  48c0                 ext.l     d0
  001710  206efffc             movea.l   -$4(a6), a0
  001714  2050                 movea.l   (a0), a0
  001716  2080                 move.l    d0, (a0)
  001718  206efffc             movea.l   -$4(a6), a0
  00171c  2050                 movea.l   (a0), a0
  00171e  42680004             clr.w     $4(a0)
  001722  206efffc             movea.l   -$4(a6), a0
  001726  2050                 movea.l   (a0), a0
  001728  42680006             clr.w     $6(a0)
  00172c  256efffc002a         move.l    -$4(a6), $2a(a2)
  001732  6010                 bra.b     $1744
  001734  554f                 subq.w    #$2, a7
  001736  3eb80220             move.w    $220.w, (a7)
  00173a  301f                 move.w    (a7)+, d0
  00173c  3600                 move.w    d0, d3
  00173e  6004                 bra.b     $1744
  001740  42aefffc             clr.l     -$4(a6)
  001744  4a43                 tst.w     d3
  001746  670c                 beq.b     $1754
  001748  4aaefffc             tst.l     -$4(a6)
  00174c  6706                 beq.b     $1754
  00174e  2f2efffc             move.l    -$4(a6), -(a7)
  001752  aa24                 _DisposeCTable 
  001754  3d430018             move.w    d3, $18(a6)
  001758  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  00175c  4e5e                 unlk      a6
  00175e  205f                 movea.l   (a7)+, a0
  001760  4fef0010             lea.l     $10(a7), a7
  001764  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; CREATEGDEVICE   (seg 7 +001774, 318 bytes)
  001774  4e560000             link.w    a6, #$0
  001778  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  00177c  282e000c             move.l    $c(a6), d4
  001780  7600                 moveq     #$0, d3
  001782  97cb                 suba.l    a3, a3
  001784  99cc                 suba.l    a4, a4
  001786  594f                 subq.w    #$4, a7
  001788  4878003e             pea.l     $3e.w
  00178c  201f                 move.l    (a7)+, d0
  00178e  a122                 _NewHandle 
  001790  2e88                 move.l    a0, (a7)
  001792  205f                 movea.l   (a7)+, a0
  001794  2648                 movea.l   a0, a3
  001796  200b                 move.l    a3, d0
  001798  670000de             beq.w     $1878
  00179c  594f                 subq.w    #$4, a7
  00179e  48780002             pea.l     $2.w
  0017a2  201f                 move.l    (a7)+, d0
  0017a4  a322                 _NewHandle 
  0017a6  2e88                 move.l    a0, (a7)
  0017a8  205f                 movea.l   (a7)+, a0
  0017aa  2848                 movea.l   a0, a4
  0017ac  200c                 move.l    a4, d0
  0017ae  670000bc             beq.w     $186c
  0017b2  2453                 movea.l   (a3), a2
  0017b4  4252                 clr.w     (a2)
  0017b6  426a0002             clr.w     $2(a2)
  0017ba  2044                 movea.l   d4, a0
  0017bc  2050                 movea.l   (a0), a0
  0017be  0c6800080020         cmpi.w    #$8, $20(a0)
  0017c4  6e06                 bgt.b     $17cc
  0017c6  426a0004             clr.w     $4(a2)
  0017ca  6006                 bra.b     $17d2
  0017cc  357c00020004         move.w    #$2, $4(a2)
  0017d2  254c0006             move.l    a4, $6(a2)
  0017d6  357c0004000a         move.w    #$4, $a(a2)
  0017dc  42aa000c             clr.l     $c(a2)
  0017e0  42aa0010             clr.l     $10(a2)
  0017e4  426a0014             clr.w     $14(a2)
  0017e8  25440016             move.l    d4, $16(a2)
  0017ec  42aa001a             clr.l     $1a(a2)
  0017f0  42aa001e             clr.l     $1e(a2)
  0017f4  2044                 movea.l   d4, a0
  0017f6  2050                 movea.l   (a0), a0
  0017f8  256800060022         move.l    $6(a0), $22(a2)
  0017fe  2568000a0026         move.l    $a(a0), $26(a2)
  001804  70ff                 moveq     #$ff, d0
  001806  2540002a             move.l    d0, $2a(a2)
  00180a  426a002e             clr.w     $2e(a2)
  00180e  426a0030             clr.w     $30(a2)
  001812  42aa0032             clr.l     $32(a2)
  001816  42aa0036             clr.l     $36(a2)
  00181a  42aa003a             clr.l     $3a(a2)
  00181e  2044                 movea.l   d4, a0
  001820  2050                 movea.l   (a0), a0
  001822  0c6800010020         cmpi.w    #$1, $20(a0)
  001828  6f0a                 ble.b     $1834
  00182a  2f0b                 move.l    a3, -(a7)
  00182c  4267                 clr.w     -(a7)
  00182e  1f3c0001             move.b    #$1, -(a7)
  001832  aa2d                 _SetDeviceAttribute 
  001834  2f0b                 move.l    a3, -(a7)
  001836  3f3c000e             move.w    #$e, -(a7)
  00183a  1f3c0001             move.b    #$1, -(a7)
  00183e  aa2d                 _SetDeviceAttribute 
  001840  2044                 movea.l   d4, a0
  001842  2050                 movea.l   (a0), a0
  001844  0c6800080020         cmpi.w    #$8, $20(a0)
  00184a  6e36                 bgt.b     $1882
  00184c  2044                 movea.l   d4, a0
  00184e  2050                 movea.l   (a0), a0
  001850  2f28002a             move.l    $2a(a0), -(a7)
  001854  2053                 movea.l   (a3), a0
  001856  2f280006             move.l    $6(a0), -(a7)
  00185a  2053                 movea.l   (a3), a0
  00185c  3f28000a             move.w    $a(a0), -(a7)
  001860  aa39                 _MakeITable 
  001862  554f                 subq.w    #$2, a7
  001864  aa40                 _QDError  
  001866  301f                 move.w    (a7)+, d0
  001868  3600                 move.w    d0, d3
  00186a  6016                 bra.b     $1882
  00186c  554f                 subq.w    #$2, a7
  00186e  3eb80220             move.w    $220.w, (a7)
  001872  301f                 move.w    (a7)+, d0
  001874  3600                 move.w    d0, d3
  001876  600a                 bra.b     $1882
  001878  554f                 subq.w    #$2, a7
  00187a  3eb80220             move.w    $220.w, (a7)
  00187e  301f                 move.w    (a7)+, d0
  001880  3600                 move.w    d0, d3
  001882  4a43                 tst.w     d3
  001884  6716                 beq.b     $189c
  001886  200c                 move.l    a4, d0
  001888  6706                 beq.b     $1890
  00188a  2f0c                 move.l    a4, -(a7)
  00188c  205f                 movea.l   (a7)+, a0
  00188e  a023                 _DisposeHandle 
  001890  200b                 move.l    a3, d0
  001892  670e                 beq.b     $18a2
  001894  2f0b                 move.l    a3, -(a7)
  001896  205f                 movea.l   (a7)+, a0
  001898  a023                 _DisposeHandle 
  00189a  6006                 bra.b     $18a2
  00189c  206e0008             movea.l   $8(a6), a0
  0018a0  208b                 move.l    a3, (a0)
  0018a2  3d430010             move.w    d3, $10(a6)
  0018a6  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  0018aa  4e5e                 unlk      a6
  0018ac  205f                 movea.l   (a7)+, a0
  0018ae  504f                 addq.w    #$8, a7
  0018b0  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; CREATEOFFSCREEN   (seg 7 +0018c2, 514 bytes)
  0018c2  4e56fff0             link.w    a6, #$fff0
  0018c6  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0018ca  2a2e0016             move.l    $16(a6), d5
  0018ce  382e0014             move.w    $14(a6), d4
  0018d2  286e0010             movea.l   $10(a6), a4
  0018d6  95ca                 suba.l    a2, a2
  0018d8  97cb                 suba.l    a3, a3
  0018da  42aefffc             clr.l     -$4(a6)
  0018de  7600                 moveq     #$0, d3
  0018e0  200c                 move.l    a4, d0
  0018e2  6714                 beq.b     $18f8
  0018e4  554f                 subq.w    #$2, a7
  0018e6  2f0c                 move.l    a4, -(a7)
  0018e8  205f                 movea.l   (a7)+, a0
  0018ea  a069                 _HGetState 
  0018ec  1e80                 move.b    d0, (a7)
  0018ee  101f                 move.b    (a7)+, d0
  0018f0  1e00                 move.b    d0, d7
  0018f2  2f0c                 move.l    a4, -(a7)
  0018f4  205f                 movea.l   (a7)+, a0
  0018f6  a04a                 _HNoPurge 
  0018f8  2045                 movea.l   d5, a0
  0018fa  2245                 movea.l   d5, a1
  0018fc  30290006             move.w    $6(a1), d0
  001900  90680002             sub.w     $2(a0), d0
  001904  c1c4                 muls.w    d4, d0
  001906  0640001f             addi.w    #$1f, d0
  00190a  48c0                 ext.l     d0
  00190c  2200                 move.l    d0, d1
  00190e  e881                 asr.l     #$4, d1
  001910  e089                 lsr.l     #$8, d1
  001912  e089                 lsr.l     #$8, d1
  001914  e089                 lsr.l     #$8, d1
  001916  e689                 lsr.l     #$3, d1
  001918  d280                 add.l     d0, d1
  00191a  ea81                 asr.l     #$5, d1
  00191c  7004                 moveq     #$4, d0
  00191e  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  001924  3c00                 move.w    d0, d6
  001926  554f                 subq.w    #$2, a7
  001928  2f2df6d2             move.l    -$92e(a5), -(a7)
  00192c  486efff4             pea.l     -$c(a6)
  001930  4eb900000368         jsr       $368.l   ; seg4+494
  001936  301f                 move.w    (a7)+, d0
  001938  3600                 move.w    d0, d3
  00193a  7600                 moveq     #$0, d3
  00193c  0cae00000200fff4     cmpi.l    #$200, -$c(a6)
  001944  5cc0                 sge.b     d0
  001946  4400                 neg.b     d0
  001948  1d40fff1             move.b    d0, -$f(a6)
  00194c  0c440020             cmpi.w    #$20, d4
  001950  57c0                 seq.b     d0
  001952  4400                 neg.b     d0
  001954  0c440010             cmpi.w    #$10, d4
  001958  57c1                 seq.b     d1
  00195a  4401                 neg.b     d1
  00195c  8200                 or.b      d0, d1
  00195e  c22efff1             and.b     -$f(a6), d1
  001962  0c440008             cmpi.w    #$8, d4
  001966  57c0                 seq.b     d0
  001968  4400                 neg.b     d0
  00196a  1d40fff2             move.b    d0, -$e(a6)
  00196e  0c440004             cmpi.w    #$4, d4
  001972  57c0                 seq.b     d0
  001974  4400                 neg.b     d0
  001976  1d40fff3             move.b    d0, -$d(a6)
  00197a  0c440002             cmpi.w    #$2, d4
  00197e  57c0                 seq.b     d0
  001980  4400                 neg.b     d0
  001982  0c440001             cmpi.w    #$1, d4
  001986  57c2                 seq.b     d2
  001988  4402                 neg.b     d2
  00198a  8400                 or.b      d0, d2
  00198c  842efff3             or.b      -$d(a6), d2
  001990  842efff2             or.b      -$e(a6), d2
  001994  8401                 or.b      d1, d2
  001996  6718                 beq.b     $19b0
  001998  0c463ffe             cmpi.w    #$3ffe, d6
  00199c  6e0e                 bgt.b     $19ac
  00199e  0c440008             cmpi.w    #$8, d4
  0019a2  6e0e                 bgt.b     $19b2
  0019a4  200c                 move.l    a4, d0
  0019a6  660a                 bne.b     $19b2
  0019a8  76ce                 moveq     #$ce, d3
  0019aa  6006                 bra.b     $19b2
  0019ac  76ce                 moveq     #$ce, d3
  0019ae  6002                 bra.b     $19b2
  0019b0  76ce                 moveq     #$ce, d3
  0019b2  4a43                 tst.w     d3
  0019b4  66000088             bne.w     $1a3e
  0019b8  594f                 subq.w    #$4, a7
  0019ba  4878006c             pea.l     $6c.w
  0019be  201f                 move.l    (a7)+, d0
  0019c0  a11e                 _NewPtr   
  0019c2  2e88                 move.l    a0, (a7)
  0019c4  205f                 movea.l   (a7)+, a0
  0019c6  2448                 movea.l   a0, a2
  0019c8  200a                 move.l    a2, d0
  0019ca  6768                 beq.b     $1a34
  0019cc  486efff8             pea.l     -$8(a6)
  0019d0  a874                 _GetPort  
  0019d2  2f0a                 move.l    a2, -(a7)
  0019d4  aa00                 _OpenCPort 
  0019d6  2045                 movea.l   d5, a0
  0019d8  25500010             move.l    (a0), $10(a2)
  0019dc  256800040014         move.l    $4(a0), $14(a2)
  0019e2  2f2a0018             move.l    $18(a2), -(a7)
  0019e6  2f05                 move.l    d5, -(a7)
  0019e8  a8df                 _RectRgn  
  0019ea  2f05                 move.l    d5, -(a7)
  0019ec  a87b                 _ClipRect 
  0019ee  554f                 subq.w    #$2, a7
  0019f0  3f04                 move.w    d4, -(a7)
  0019f2  2f05                 move.l    d5, -(a7)
  0019f4  2f0c                 move.l    a4, -(a7)
  0019f6  3f06                 move.w    d6, -(a7)
  0019f8  2f2a0002             move.l    $2(a2), -(a7)
  0019fc  4ebafbb0             jsr       $15ae(pc)   ; SETUPPIXMAP
  001a00  301f                 move.w    (a7)+, d0
  001a02  3600                 move.w    d0, d3
  001a04  4a43                 tst.w     d3
  001a06  6624                 bne.b     $1a2c
  001a08  256a00020002         move.l    $2(a2), $2(a2)
  001a0e  206a0002             movea.l   $2(a2), a0
  001a12  226a0002             movea.l   $2(a2), a1
  001a16  2290                 move.l    (a0), (a1)
  001a18  266a0002             movea.l   $2(a2), a3
  001a1c  554f                 subq.w    #$2, a7
  001a1e  2f0b                 move.l    a3, -(a7)
  001a20  486efffc             pea.l     -$4(a6)
  001a24  4ebafd4e             jsr       $1774(pc)   ; CREATEGDEVICE
  001a28  301f                 move.w    (a7)+, d0
  001a2a  3600                 move.w    d0, d3
  001a2c  2f2efff8             move.l    -$8(a6), -(a7)
  001a30  a873                 _SetPort  
  001a32  600a                 bra.b     $1a3e
  001a34  554f                 subq.w    #$2, a7
  001a36  3eb80220             move.w    $220.w, (a7)
  001a3a  301f                 move.w    (a7)+, d0
  001a3c  3600                 move.w    d0, d3
  001a3e  200c                 move.l    a4, d0
  001a40  670a                 beq.b     $1a4c
  001a42  2f0c                 move.l    a4, -(a7)
  001a44  1f07                 move.b    d7, -(a7)
  001a46  101f                 move.b    (a7)+, d0
  001a48  205f                 movea.l   (a7)+, a0
  001a4a  a06a                 _HSetState 
  001a4c  4a43                 tst.w     d3
  001a4e  6754                 beq.b     $1aa4
  001a50  200b                 move.l    a3, d0
  001a52  6724                 beq.b     $1a78
  001a54  2053                 movea.l   (a3), a0
  001a56  2f28002a             move.l    $2a(a0), -(a7)
  001a5a  aa24                 _DisposeCTable 
  001a5c  2053                 movea.l   (a3), a0
  001a5e  0c6800010020         cmpi.w    #$1, $20(a0)
  001a64  660a                 bne.b     $1a70
  001a66  2053                 movea.l   (a3), a0
  001a68  2010                 move.l    (a0), d0
  001a6a  5980                 subq.l    #$4, d0
  001a6c  2053                 movea.l   (a3), a0
  001a6e  2080                 move.l    d0, (a0)
  001a70  2053                 movea.l   (a3), a0
  001a72  2f10                 move.l    (a0), -(a7)
  001a74  205f                 movea.l   (a7)+, a0
  001a76  a01f                 _DisposePtr 
  001a78  4aaefffc             tst.l     -$4(a6)
  001a7c  6716                 beq.b     $1a94
  001a7e  206efffc             movea.l   -$4(a6), a0
  001a82  2050                 movea.l   (a0), a0
  001a84  2f280006             move.l    $6(a0), -(a7)
  001a88  205f                 movea.l   (a7)+, a0
  001a8a  a023                 _DisposeHandle 
  001a8c  2f2efffc             move.l    -$4(a6), -(a7)
  001a90  205f                 movea.l   (a7)+, a0
  001a92  a023                 _DisposeHandle 
  001a94  200a                 move.l    a2, d0
  001a96  671a                 beq.b     $1ab2
  001a98  2f0a                 move.l    a2, -(a7)
  001a9a  a87d                 _ClosePort 
  001a9c  2f0a                 move.l    a2, -(a7)
  001a9e  205f                 movea.l   (a7)+, a0
  001aa0  a01f                 _DisposePtr 
  001aa2  600e                 bra.b     $1ab2
  001aa4  206e000c             movea.l   $c(a6), a0
  001aa8  208a                 move.l    a2, (a0)
  001aaa  206e0008             movea.l   $8(a6), a0
  001aae  20aefffc             move.l    -$4(a6), (a0)
  001ab2  3d43001a             move.w    d3, $1a(a6)
  001ab6  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001aba  4e5e                 unlk      a6
  001abc  205f                 movea.l   (a7)+, a0
  001abe  4fef0012             lea.l     $12(a7), a7
  001ac2  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; DISPOSEOFFSCREEN   (seg 7 +001ad6, 172 bytes)
  001ad6  4e56fffc             link.w    a6, #$fffc
  001ada  48e70038             movem.l   a2-a4, -(a7)
  001ade  246e000c             movea.l   $c(a6), a2
  001ae2  266e0008             movea.l   $8(a6), a3
  001ae6  486efffc             pea.l     -$4(a6)
  001aea  a874                 _GetPort  
  001aec  b5eefffc             cmpa.l    -$4(a6), a2
  001af0  660c                 bne.b     $1afe
  001af2  486efffc             pea.l     -$4(a6)
  001af6  aa48                 _GetCWMgrPort 
  001af8  2f2efffc             move.l    -$4(a6), -(a7)
  001afc  a873                 _SetPort  
  001afe  594f                 subq.w    #$4, a7
  001b00  aa32                 _GetGDevice 
  001b02  205f                 movea.l   (a7)+, a0
  001b04  2848                 movea.l   a0, a4
  001b06  b9cb                 cmpa.l    a3, a4
  001b08  660a                 bne.b     $1b14
  001b0a  594f                 subq.w    #$4, a7
  001b0c  aa2a                 _GetMainDevice 
  001b0e  205f                 movea.l   (a7)+, a0
  001b10  2f08                 move.l    a0, -(a7)
  001b12  aa31                 _SetGDevice 
  001b14  2053                 movea.l   (a3), a0
  001b16  42a80016             clr.l     $16(a0)
  001b1a  2f0b                 move.l    a3, -(a7)
  001b1c  aa30                 _DisposeGDevice 
  001b1e  206a0002             movea.l   $2(a2), a0
  001b22  2050                 movea.l   (a0), a0
  001b24  4a90                 tst.l     (a0)
  001b26  672c                 beq.b     $1b54
  001b28  206a0002             movea.l   $2(a2), a0
  001b2c  2050                 movea.l   (a0), a0
  001b2e  0c6800010020         cmpi.w    #$1, $20(a0)
  001b34  6612                 bne.b     $1b48
  001b36  206a0002             movea.l   $2(a2), a0
  001b3a  2050                 movea.l   (a0), a0
  001b3c  2010                 move.l    (a0), d0
  001b3e  5980                 subq.l    #$4, d0
  001b40  206a0002             movea.l   $2(a2), a0
  001b44  2050                 movea.l   (a0), a0
  001b46  2080                 move.l    d0, (a0)
  001b48  206a0002             movea.l   $2(a2), a0
  001b4c  2050                 movea.l   (a0), a0
  001b4e  2f10                 move.l    (a0), -(a7)
  001b50  205f                 movea.l   (a7)+, a0
  001b52  a01f                 _DisposePtr 
  001b54  206a0002             movea.l   $2(a2), a0
  001b58  2050                 movea.l   (a0), a0
  001b5a  4aa8002a             tst.l     $2a(a0)
  001b5e  670c                 beq.b     $1b6c
  001b60  206a0002             movea.l   $2(a2), a0
  001b64  2050                 movea.l   (a0), a0
  001b66  2f28002a             move.l    $2a(a0), -(a7)
  001b6a  aa24                 _DisposeCTable 
  001b6c  2f0a                 move.l    a2, -(a7)
  001b6e  a87d                 _ClosePort 
  001b70  2f0a                 move.l    a2, -(a7)
  001b72  205f                 movea.l   (a7)+, a0
  001b74  a01f                 _DisposePtr 
  001b76  4cdf1c00             movem.l   (a7)+, a2-a4
  001b7a  4e5e                 unlk      a6
  001b7c  205f                 movea.l   (a7)+, a0
  001b7e  504f                 addq.w    #$8, a7
  001b80  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATKILLSPRITE   (seg 7 +001b96, 86 bytes)
  001b96  4e560000             link.w    a6, #$0
  001b9a  2f0a                 move.l    a2, -(a7)
  001b9c  246e0008             movea.l   $8(a6), a2
  001ba0  4aaa002e             tst.l     $2e(a2)
  001ba4  670a                 beq.b     $1bb0
  001ba6  206a002e             movea.l   $2e(a2), a0
  001baa  216a00320032         move.l    $32(a2), $32(a0)
  001bb0  4aaa0032             tst.l     $32(a2)
  001bb4  670c                 beq.b     $1bc2
  001bb6  206a0032             movea.l   $32(a2), a0
  001bba  216a002e002e         move.l    $2e(a2), $2e(a0)
  001bc0  6006                 bra.b     $1bc8
  001bc2  2b6a002ee866         move.l    $2e(a2), -$179a(a5)
  001bc8  4aaa0022             tst.l     $22(a2)
  001bcc  670c                 beq.b     $1bda
  001bce  2f0a                 move.l    a2, -(a7)
  001bd0  2f2a0022             move.l    $22(a2), -(a7)
  001bd4  205f                 movea.l   (a7)+, a0
  001bd6  4e90                 jsr       (a0)
  001bd8  600a                 bra.b     $1be4
  001bda  256de8fe002e         move.l    -$1702(a5), $2e(a2)
  001be0  2b4ae8fe             move.l    a2, -$1702(a5)
  001be4  245f                 movea.l   (a7)+, a2
  001be6  4e5e                 unlk      a6
  001be8  2e9f                 move.l    (a7)+, (a7)
  001bea  4e75                 rts       

;-------------------------------------------------------------
; DISPOSEICONPORT   (seg 7 +001bfc, 54 bytes)
  001bfc  4e560000             link.w    a6, #$0
  001c00  2f0a                 move.l    a2, -(a7)
  001c02  246e0008             movea.l   $8(a6), a2
  001c06  4a92                 tst.l     (a2)
  001c08  6720                 beq.b     $1c2a
  001c0a  4a2de8b4             tst.b     -$174c(a5)
  001c0e  670c                 beq.b     $1c1c
  001c10  2052                 movea.l   (a2), a0
  001c12  20680002             movea.l   $2(a0), a0
  001c16  2050                 movea.l   (a0), a0
  001c18  4290                 clr.l     (a0)
  001c1a  6006                 bra.b     $1c22
  001c1c  2052                 movea.l   (a2), a0
  001c1e  42a80002             clr.l     $2(a0)
  001c22  2f0a                 move.l    a2, -(a7)
  001c24  4eb900001cb8         jsr       $1cb8.l   ; SATDISPOSEOFFSCREEN
  001c2a  245f                 movea.l   (a7)+, a2
  001c2c  4e5e                 unlk      a6
  001c2e  2e9f                 move.l    (a7)+, (a7)
  001c30  4e75                 rts       

;-------------------------------------------------------------
; SATKILL   (seg 7 +001c44, 106 bytes)
  001c44  4e560000             link.w    a6, #$0
  001c48  422de7e5             clr.b     -$181b(a5)
  001c4c  486de878             pea.l     -$1788(a5)
  001c50  4ebaffaa             jsr       $1bfc(pc)   ; DISPOSEICONPORT
  001c54  486de892             pea.l     -$176e(a5)
  001c58  4ebaffa2             jsr       $1bfc(pc)   ; DISPOSEICONPORT
  001c5c  2f2de8ac             move.l    -$1754(a5), -(a7)
  001c60  a87d                 _ClosePort 
  001c62  2f2de8ac             move.l    -$1754(a5), -(a7)
  001c66  205f                 movea.l   (a7)+, a0
  001c68  a01f                 _DisposePtr 
  001c6a  42ade8ac             clr.l     -$1754(a5)
  001c6e  486de80c             pea.l     -$17f4(a5)
  001c72  4eb900001cb8         jsr       $1cb8.l   ; SATDISPOSEOFFSCREEN
  001c78  486de826             pea.l     -$17da(a5)
  001c7c  4eb900001cb8         jsr       $1cb8.l   ; SATDISPOSEOFFSCREEN
  001c82  4aade870             tst.l     -$1790(a5)
  001c86  670e                 beq.b     $1c96
  001c88  2f2de870             move.l    -$1790(a5), -(a7)
  001c8c  2f2de874             move.l    -$178c(a5), -(a7)
  001c90  4eb900001ad6         jsr       $1ad6.l   ; DISPOSEOFFSCREEN
  001c96  42ade870             clr.l     -$1790(a5)
  001c9a  6008                 bra.b     $1ca4
  001c9c  2f2de866             move.l    -$179a(a5), -(a7)
  001ca0  4ebafef4             jsr       $1b96(pc)   ; SATKILLSPRITE
  001ca4  4aade866             tst.l     -$179a(a5)
  001ca8  66f2                 bne.b     $1c9c
  001caa  4e5e                 unlk      a6
  001cac  4e75                 rts       

;-------------------------------------------------------------
; SATDISPOSEOFFSCREEN   (seg 7 +001cb8, 144 bytes)
  001cb8  4e56fffc             link.w    a6, #$fffc
  001cbc  2f0a                 move.l    a2, -(a7)
  001cbe  246e0008             movea.l   $8(a6), a2
  001cc2  4a92                 tst.l     (a2)
  001cc4  677a                 beq.b     $1d40
  001cc6  4a2de8b4             tst.b     -$174c(a5)
  001cca  670e                 beq.b     $1cda
  001ccc  2f12                 move.l    (a2), -(a7)
  001cce  2f2a0004             move.l    $4(a2), -(a7)
  001cd2  4eb900001ad6         jsr       $1ad6.l   ; DISPOSEOFFSCREEN
  001cd8  6052                 bra.b     $1d2c
  001cda  486efffc             pea.l     -$4(a6)
  001cde  a874                 _GetPort  
  001ce0  206efffc             movea.l   -$4(a6), a0
  001ce4  b1d2                 cmpa.l    (a2), a0
  001ce6  660c                 bne.b     $1cf4
  001ce8  486efffc             pea.l     -$4(a6)
  001cec  a910                 _GetWMgrPort 
  001cee  2f2efffc             move.l    -$4(a6), -(a7)
  001cf2  a873                 _SetPort  
  001cf4  2052                 movea.l   (a2), a0
  001cf6  4aa80002             tst.l     $2(a0)
  001cfa  670e                 beq.b     $1d0a
  001cfc  2052                 movea.l   (a2), a0
  001cfe  20280002             move.l    $2(a0), d0
  001d02  5980                 subq.l    #$4, d0
  001d04  2052                 movea.l   (a2), a0
  001d06  21400002             move.l    d0, $2(a0)
  001d0a  2f12                 move.l    (a2), -(a7)
  001d0c  a87d                 _ClosePort 
  001d0e  2052                 movea.l   (a2), a0
  001d10  4aa80002             tst.l     $2(a0)
  001d14  670a                 beq.b     $1d20
  001d16  2052                 movea.l   (a2), a0
  001d18  2f280002             move.l    $2(a0), -(a7)
  001d1c  205f                 movea.l   (a7)+, a0
  001d1e  a01f                 _DisposePtr 
  001d20  2052                 movea.l   (a2), a0
  001d22  42a80002             clr.l     $2(a0)
  001d26  2f12                 move.l    (a2), -(a7)
  001d28  205f                 movea.l   (a7)+, a0
  001d2a  a01f                 _DisposePtr 
  001d2c  4292                 clr.l     (a2)
  001d2e  4aaa0008             tst.l     $8(a2)
  001d32  6708                 beq.b     $1d3c
  001d34  2f2a0008             move.l    $8(a2), -(a7)
  001d38  205f                 movea.l   (a7)+, a0
  001d3a  a01f                 _DisposePtr 
  001d3c  42aa0008             clr.l     $8(a2)
  001d40  245f                 movea.l   (a7)+, a2
  001d42  4e5e                 unlk      a6
  001d44  2e9f                 move.l    (a7)+, (a7)
  001d46  4e75                 rts       

;-------------------------------------------------------------
; BAILOUT   (seg 7 +001d5e, 106 bytes)
  001d5e  4e56fefe             link.w    a6, #$fefe
  001d62  206e0008             movea.l   $8(a6), a0
  001d66  43eeff00             lea.l     -$100(a6), a1
  001d6a  703f                 moveq     #$3f, d0
  001d6c  22d8                 move.l    (a0)+, (a1)+
  001d6e  51c8fffc             dbra      d0, $1d6c
  001d72  4eb900001c44         jsr       $1c44.l   ; SATKILL
  001d78  4aadea84             tst.l     -$157c(a5)
  001d7c  670a                 beq.b     $1d88
  001d7e  2f2dea84             move.l    -$157c(a5), -(a7)
  001d82  205f                 movea.l   (a7)+, a0
  001d84  4e90                 jsr       (a0)
  001d86  6032                 bra.b     $1dba
  001d88  554f                 subq.w    #$2, a7
  001d8a  486eff00             pea.l     -$100(a6)
  001d8e  486df6d6             pea.l     -$92a(a5)
  001d92  486df6d6             pea.l     -$92a(a5)
  001d96  486df6d6             pea.l     -$92a(a5)
  001d9a  2f3c00010001         move.l    #$10001, -(a7)
  001da0  4267                 clr.w     -(a7)
  001da2  486df7ee             pea.l     -$812(a5)
  001da6  486df6d6             pea.l     -$92a(a5)
  001daa  486df6d6             pea.l     -$92a(a5)
  001dae  4eb900000274         jsr       $274.l   ; SATFAKEALERT
  001db4  301f                 move.w    (a7)+, d0
  001db6  3d40fefe             move.w    d0, -$102(a6)
  001dba  4eb900000fc4         jsr       $fc4.l   ; SATSOUNDSHUTUP
  001dc0  a9f4                 _ExitToShell 
  001dc2  4e5e                 unlk      a6
  001dc4  2e9f                 move.l    (a7)+, (a7)
  001dc6  4e75                 rts       

;-------------------------------------------------------------
; CHECKNOMEM   (seg 7 +001dd2, 24 bytes)
  001dd2  4e560000             link.w    a6, #$0
  001dd6  4aae0008             tst.l     $8(a6)
  001dda  6608                 bne.b     $1de4
  001ddc  486df8ee             pea.l     -$712(a5)
  001de0  4ebaff7c             jsr       $1d5e(pc)   ; BAILOUT
  001de4  4e5e                 unlk      a6
  001de6  2e9f                 move.l    (a7)+, (a7)
  001de8  4e75                 rts       

;-------------------------------------------------------------
; SATNEWPTR   (seg 7 +001df8, 88 bytes)
  001df8  4e56fffc             link.w    a6, #$fffc
  001dfc  2f0a                 move.l    a2, -(a7)
  001dfe  203c000007d0         move.l    #$7d0, d0
  001e04  d0ae0008             add.l     $8(a6), d0
  001e08  2d40fffc             move.l    d0, -$4(a6)
  001e0c  594f                 subq.w    #$4, a7
  001e0e  a01c                 _FreeMem  
  001e10  2e80                 move.l    d0, (a7)
  001e12  201f                 move.l    (a7)+, d0
  001e14  b0aefffc             cmp.l     -$4(a6), d0
  001e18  6c08                 bge.b     $1e22
  001e1a  48780000             pea.l     $0.w
  001e1e  4ebaffb2             jsr       $1dd2(pc)   ; CHECKNOMEM
  001e22  594f                 subq.w    #$4, a7
  001e24  594f                 subq.w    #$4, a7
  001e26  2f2e0008             move.l    $8(a6), -(a7)
  001e2a  201f                 move.l    (a7)+, d0
  001e2c  a31e                 _NewPtr   
  001e2e  2e88                 move.l    a0, (a7)
  001e30  205f                 movea.l   (a7)+, a0
  001e32  2f08                 move.l    a0, -(a7)
  001e34  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  001e3a  205f                 movea.l   (a7)+, a0
  001e3c  2448                 movea.l   a0, a2
  001e3e  2f0a                 move.l    a2, -(a7)
  001e40  4ebaff90             jsr       $1dd2(pc)   ; CHECKNOMEM
  001e44  2d4a000c             move.l    a2, $c(a6)
  001e48  245f                 movea.l   (a7)+, a2
  001e4a  4e5e                 unlk      a6
  001e4c  2e9f                 move.l    (a7)+, (a7)
  001e4e  4e75                 rts       

;-------------------------------------------------------------
; NUMTOOLBOXTRAPS   (seg 7 +001e5c, 68 bytes)
  001e5c  4e56fffc             link.w    a6, #$fffc
  001e60  594f                 subq.w    #$4, a7
  001e62  3f3caa6e             move.w    #$aa6e, -(a7)
  001e66  1f3c0001             move.b    #$1, -(a7)
  001e6a  4eb900000378         jsr       $378.l   ; seg4+6b0
  001e70  205f                 movea.l   (a7)+, a0
  001e72  2d48fffc             move.l    a0, -$4(a6)
  001e76  594f                 subq.w    #$4, a7
  001e78  3f3ca86e             move.w    #$a86e, -(a7)
  001e7c  1f3c0001             move.b    #$1, -(a7)
  001e80  4eb900000378         jsr       $378.l   ; seg4+6b0
  001e86  205f                 movea.l   (a7)+, a0
  001e88  b1eefffc             cmpa.l    -$4(a6), a0
  001e8c  6608                 bne.b     $1e96
  001e8e  3d7c02000008         move.w    #$200, $8(a6)
  001e94  6006                 bra.b     $1e9c
  001e96  3d7c04000008         move.w    #$400, $8(a6)
  001e9c  4e5e                 unlk      a6
  001e9e  4e75                 rts       

;-------------------------------------------------------------
; GETTRAPTYPE   (seg 7 +001eb2, 38 bytes)
  001eb2  4e560000             link.w    a6, #$0
  001eb6  302e0008             move.w    $8(a6), d0
  001eba  028000000800         andi.l    #$800, d0
  001ec0  4a80                 tst.l     d0
  001ec2  6f08                 ble.b     $1ecc
  001ec4  1d7c0001000a         move.b    #$1, $a(a6)
  001eca  6004                 bra.b     $1ed0
  001ecc  422e000a             clr.b     $a(a6)
  001ed0  4e5e                 unlk      a6
  001ed2  205f                 movea.l   (a7)+, a0
  001ed4  544f                 addq.w    #$2, a7
  001ed6  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATTRAPAVAILABLE   (seg 7 +001ee6, 112 bytes)
  001ee6  4e56fffc             link.w    a6, #$fffc
  001eea  48e71800             movem.l   d3-d4, -(a7)
  001eee  362e0008             move.w    $8(a6), d3
  001ef2  554f                 subq.w    #$2, a7
  001ef4  3f03                 move.w    d3, -(a7)
  001ef6  4ebaffba             jsr       $1eb2(pc)   ; GETTRAPTYPE
  001efa  101f                 move.b    (a7)+, d0
  001efc  1800                 move.b    d0, d4
  001efe  0c040001             cmpi.b    #$1, d4
  001f02  6616                 bne.b     $1f1a
  001f04  0283000007ff         andi.l    #$7ff, d3
  001f0a  554f                 subq.w    #$2, a7
  001f0c  4ebaff4e             jsr       $1e5c(pc)   ; NUMTOOLBOXTRAPS
  001f10  301f                 move.w    (a7)+, d0
  001f12  b640                 cmp.w     d0, d3
  001f14  6d04                 blt.b     $1f1a
  001f16  363ca89f             move.w    #$a89f, d3
  001f1a  594f                 subq.w    #$4, a7
  001f1c  3f3ca89f             move.w    #$a89f, -(a7)
  001f20  1f3c0001             move.b    #$1, -(a7)
  001f24  4eb900000378         jsr       $378.l   ; seg4+6b0
  001f2a  205f                 movea.l   (a7)+, a0
  001f2c  2d48fffc             move.l    a0, -$4(a6)
  001f30  594f                 subq.w    #$4, a7
  001f32  3f03                 move.w    d3, -(a7)
  001f34  1f04                 move.b    d4, -(a7)
  001f36  4eb900000378         jsr       $378.l   ; seg4+6b0
  001f3c  205f                 movea.l   (a7)+, a0
  001f3e  b1eefffc             cmpa.l    -$4(a6), a0
  001f42  56c0                 sne.b     d0
  001f44  4400                 neg.b     d0
  001f46  1d40000a             move.b    d0, $a(a6)
  001f4a  4cdf0018             movem.l   (a7)+, d3-d4
  001f4e  4e5e                 unlk      a6
  001f50  205f                 movea.l   (a7)+, a0
  001f52  544f                 addq.w    #$2, a7
  001f54  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; GETPICTRESDATA   (seg 7 +001f6a, 48 bytes)
  001f6a  4e560000             link.w    a6, #$0
  001f6e  2f2dea8c             move.l    -$1574(a5), -(a7)
  001f72  2f2dea88             move.l    -$1578(a5), -(a7)
  001f76  2f2e000a             move.l    $a(a6), -(a7)
  001f7a  306e0008             movea.w   $8(a6), a0
  001f7e  2f08                 move.l    a0, -(a7)
  001f80  7001                 moveq     #$1, d0
  001f82  a822                 _ResourceDispatch 
  001f84  306e0008             movea.w   $8(a6), a0
  001f88  202dea88             move.l    -$1578(a5), d0
  001f8c  d088                 add.l     a0, d0
  001f8e  2b40ea88             move.l    d0, -$1578(a5)
  001f92  4e5e                 unlk      a6
  001f94  205f                 movea.l   (a7)+, a0
  001f96  5c4f                 addq.w    #$6, a7
  001f98  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; INTERNALGETANDDRAWPICTRES   (seg 7 +001fac, 764 bytes)
  001fac  4e56ff62             link.w    a6, #$ff62
  001fb0  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  001fb4  162e0008             move.b    $8(a6), d3
  001fb8  206e000a             movea.l   $a(a6), a0
  001fbc  2d50fff8             move.l    (a0), -$8(a6)
  001fc0  2d680004fffc         move.l    $4(a0), -$4(a6)
  001fc6  4227                 clr.b     -(a7)
  001fc8  a99b                 _SetResLoad 
  001fca  594f                 subq.w    #$4, a7
  001fcc  2f2df6d8             move.l    -$928(a5), -(a7)
  001fd0  3f2e000e             move.w    $e(a6), -(a7)
  001fd4  a9a0                 _GetResource 
  001fd6  205f                 movea.l   (a7)+, a0
  001fd8  2b48ea8c             move.l    a0, -$1574(a5)
  001fdc  1f3c0001             move.b    #$1, -(a7)
  001fe0  a99b                 _SetResLoad 
  001fe2  4aadea8c             tst.l     -$1574(a5)
  001fe6  670002b4             beq.w     $229c
  001fea  206dea8c             movea.l   -$1574(a5), a0
  001fee  4a90                 tst.l     (a0)
  001ff0  670000a2             beq.w     $2094
  001ff4  7000                 moveq     #$0, d0
  001ff6  1003                 move.b    d3, d0
  001ff8  670c                 beq.b     $2006
  001ffa  5340                 subq.w    #$1, d0
  001ffc  671c                 beq.b     $201a
  001ffe  5340                 subq.w    #$1, d0
  002000  6726                 beq.b     $2028
  002002  60000298             bra.w     $229c
  002006  2f2dea8c             move.l    -$1574(a5), -(a7)
  00200a  206dea8c             movea.l   -$1574(a5), a0
  00200e  2050                 movea.l   (a0), a0
  002010  48680002             pea.l     $2(a0)
  002014  a8f6                 _DrawPicture 
  002016  60000284             bra.w     $229c
  00201a  2f2dea8c             move.l    -$1574(a5), -(a7)
  00201e  486efff8             pea.l     -$8(a6)
  002022  a8f6                 _DrawPicture 
  002024  60000276             bra.w     $229c
  002028  206dea8c             movea.l   -$1574(a5), a0
  00202c  2050                 movea.l   (a0), a0
  00202e  2d680002fff0         move.l    $2(a0), -$10(a6)
  002034  2d680006fff4         move.l    $6(a0), -$c(a6)
  00203a  45eefff0             lea.l     -$10(a6), a2
  00203e  486efff0             pea.l     -$10(a6)
  002042  302efffe             move.w    -$2(a6), d0
  002046  906efffa             sub.w     -$6(a6), d0
  00204a  906a0006             sub.w     $6(a2), d0
  00204e  906a0002             sub.w     $2(a2), d0
  002052  48c0                 ext.l     d0
  002054  2200                 move.l    d0, d1
  002056  e089                 lsr.l     #$8, d1
  002058  e089                 lsr.l     #$8, d1
  00205a  e089                 lsr.l     #$8, d1
  00205c  ee89                 lsr.l     #$7, d1
  00205e  d280                 add.l     d0, d1
  002060  e281                 asr.l     #$1, d1
  002062  3f01                 move.w    d1, -(a7)
  002064  302efffc             move.w    -$4(a6), d0
  002068  906efff8             sub.w     -$8(a6), d0
  00206c  906a0004             sub.w     $4(a2), d0
  002070  9052                 sub.w     (a2), d0
  002072  48c0                 ext.l     d0
  002074  2200                 move.l    d0, d1
  002076  e089                 lsr.l     #$8, d1
  002078  e089                 lsr.l     #$8, d1
  00207a  e089                 lsr.l     #$8, d1
  00207c  ee89                 lsr.l     #$7, d1
  00207e  d280                 add.l     d0, d1
  002080  e281                 asr.l     #$1, d1
  002082  3f01                 move.w    d1, -(a7)
  002084  a8a8                 _OffsetRect 
  002086  2f2dea8c             move.l    -$1574(a5), -(a7)
  00208a  486efff0             pea.l     -$10(a6)
  00208e  a8f6                 _DrawPicture 
  002090  6000020a             bra.w     $229c
  002094  594f                 subq.w    #$4, a7
  002096  a01c                 _FreeMem  
  002098  2e80                 move.l    d0, (a7)
  00209a  201f                 move.l    (a7)+, d0
  00209c  2d40ff62             move.l    d0, -$9e(a6)
  0020a0  594f                 subq.w    #$4, a7
  0020a2  2f2dea8c             move.l    -$1574(a5), -(a7)
  0020a6  a9a5                 _SizeRsrc 
  0020a8  201f                 move.l    (a7)+, d0
  0020aa  068000004e20         addi.l    #$4e20, d0
  0020b0  b0aeff62             cmp.l     -$9e(a6), d0
  0020b4  5dc0                 slt.b     d0
  0020b6  4400                 neg.b     d0
  0020b8  1d40ff67             move.b    d0, -$99(a6)
  0020bc  554f                 subq.w    #$2, a7
  0020be  3f3ca822             move.w    #$a822, -(a7)
  0020c2  4eb900001ee6         jsr       $1ee6.l   ; SATTRAPAVAILABLE
  0020c8  101f                 move.b    (a7)+, d0
  0020ca  57c0                 seq.b     d0
  0020cc  4400                 neg.b     d0
  0020ce  802eff67             or.b      -$99(a6), d0
  0020d2  670000b4             beq.w     $2188
  0020d6  2f2dea8c             move.l    -$1574(a5), -(a7)
  0020da  a9a2                 _LoadResource 
  0020dc  554f                 subq.w    #$2, a7
  0020de  a9af                 _ResError 
  0020e0  301f                 move.w    (a7)+, d0
  0020e2  6600009a             bne.w     $217e
  0020e6  7000                 moveq     #$0, d0
  0020e8  1003                 move.b    d3, d0
  0020ea  670c                 beq.b     $20f8
  0020ec  5340                 subq.w    #$1, d0
  0020ee  671a                 beq.b     $210a
  0020f0  5340                 subq.w    #$1, d0
  0020f2  6722                 beq.b     $2116
  0020f4  60000088             bra.w     $217e
  0020f8  2f2dea8c             move.l    -$1574(a5), -(a7)
  0020fc  206dea8c             movea.l   -$1574(a5), a0
  002100  2050                 movea.l   (a0), a0
  002102  48680002             pea.l     $2(a0)
  002106  a8f6                 _DrawPicture 
  002108  6074                 bra.b     $217e
  00210a  2f2dea8c             move.l    -$1574(a5), -(a7)
  00210e  486efff8             pea.l     -$8(a6)
  002112  a8f6                 _DrawPicture 
  002114  6068                 bra.b     $217e
  002116  206dea8c             movea.l   -$1574(a5), a0
  00211a  2050                 movea.l   (a0), a0
  00211c  2d680002fff0         move.l    $2(a0), -$10(a6)
  002122  2d680006fff4         move.l    $6(a0), -$c(a6)
  002128  45eefff0             lea.l     -$10(a6), a2
  00212c  486efff0             pea.l     -$10(a6)
  002130  302efffe             move.w    -$2(a6), d0
  002134  906efffa             sub.w     -$6(a6), d0
  002138  906a0006             sub.w     $6(a2), d0
  00213c  906a0002             sub.w     $2(a2), d0
  002140  48c0                 ext.l     d0
  002142  2200                 move.l    d0, d1
  002144  e089                 lsr.l     #$8, d1
  002146  e089                 lsr.l     #$8, d1
  002148  e089                 lsr.l     #$8, d1
  00214a  ee89                 lsr.l     #$7, d1
  00214c  d280                 add.l     d0, d1
  00214e  e281                 asr.l     #$1, d1
  002150  3f01                 move.w    d1, -(a7)
  002152  302efffc             move.w    -$4(a6), d0
  002156  906efff8             sub.w     -$8(a6), d0
  00215a  906a0004             sub.w     $4(a2), d0
  00215e  9052                 sub.w     (a2), d0
  002160  48c0                 ext.l     d0
  002162  2200                 move.l    d0, d1
  002164  e089                 lsr.l     #$8, d1
  002166  e089                 lsr.l     #$8, d1
  002168  e089                 lsr.l     #$8, d1
  00216a  ee89                 lsr.l     #$7, d1
  00216c  d280                 add.l     d0, d1
  00216e  e281                 asr.l     #$1, d1
  002170  3f01                 move.w    d1, -(a7)
  002172  a8a8                 _OffsetRect 
  002174  2f2dea8c             move.l    -$1574(a5), -(a7)
  002178  486efff0             pea.l     -$10(a6)
  00217c  a8f6                 _DrawPicture 
  00217e  2f2dea8c             move.l    -$1574(a5), -(a7)
  002182  a9a3                 _ReleaseResource 
  002184  60000116             bra.w     $229c
  002188  486effec             pea.l     -$14(a6)
  00218c  a874                 _GetPort  
  00218e  594f                 subq.w    #$4, a7
  002190  206effec             movea.l   -$14(a6), a0
  002194  32680006             movea.w   $6(a0), a1
  002198  2f09                 move.l    a1, -(a7)
  00219a  48788000             pea.l     $8000.w
  00219e  a858                 _BitAnd   
  0021a0  201f                 move.l    (a7)+, d0
  0021a2  661c                 bne.b     $21c0
  0021a4  486eff68             pea.l     -$98(a6)
  0021a8  a8ea                 _SetStdProcs 
  0021aa  41eeff68             lea.l     -$98(a6), a0
  0021ae  226effec             movea.l   -$14(a6), a1
  0021b2  23480068             move.l    a0, $68(a1)
  0021b6  41ed0070             lea.l     $70(a5), a0
  0021ba  2d48ff94             move.l    a0, -$6c(a6)
  0021be  601a                 bra.b     $21da
  0021c0  486eff9c             pea.l     -$64(a6)
  0021c4  aa4e                 _SetStdCProcs 
  0021c6  41eeff9c             lea.l     -$64(a6), a0
  0021ca  226effec             movea.l   -$14(a6), a1
  0021ce  23480068             move.l    a0, $68(a1)
  0021d2  41ed0070             lea.l     $70(a5), a0
  0021d6  2d48ffc8             move.l    a0, -$38(a6)
  0021da  594f                 subq.w    #$4, a7
  0021dc  4878000a             pea.l     $a.w
  0021e0  201f                 move.l    (a7)+, d0
  0021e2  a122                 _NewHandle 
  0021e4  2e88                 move.l    a0, (a7)
  0021e6  205f                 movea.l   (a7)+, a0
  0021e8  2448                 movea.l   a0, a2
  0021ea  780a                 moveq     #$a, d4
  0021ec  2f2dea8c             move.l    -$1574(a5), -(a7)
  0021f0  42a7                 clr.l     -(a7)
  0021f2  2f12                 move.l    (a2), -(a7)
  0021f4  2f04                 move.l    d4, -(a7)
  0021f6  7001                 moveq     #$1, d0
  0021f8  a822                 _ResourceDispatch 
  0021fa  700a                 moveq     #$a, d0
  0021fc  2b40ea88             move.l    d0, -$1578(a5)
  002200  7000                 moveq     #$0, d0
  002202  1003                 move.b    d3, d0
  002204  670a                 beq.b     $2210
  002206  5340                 subq.w    #$1, d0
  002208  6712                 beq.b     $221c
  00220a  5340                 subq.w    #$1, d0
  00220c  6718                 beq.b     $2226
  00220e  6078                 bra.b     $2288
  002210  2f0a                 move.l    a2, -(a7)
  002212  2052                 movea.l   (a2), a0
  002214  48680002             pea.l     $2(a0)
  002218  a8f6                 _DrawPicture 
  00221a  606c                 bra.b     $2288
  00221c  2f0a                 move.l    a2, -(a7)
  00221e  486efff8             pea.l     -$8(a6)
  002222  a8f6                 _DrawPicture 
  002224  6062                 bra.b     $2288
  002226  2052                 movea.l   (a2), a0
  002228  2d680002fff0         move.l    $2(a0), -$10(a6)
  00222e  2d680006fff4         move.l    $6(a0), -$c(a6)
  002234  47eefff0             lea.l     -$10(a6), a3
  002238  486efff0             pea.l     -$10(a6)
  00223c  302efffe             move.w    -$2(a6), d0
  002240  906efffa             sub.w     -$6(a6), d0
  002244  906b0006             sub.w     $6(a3), d0
  002248  906b0002             sub.w     $2(a3), d0
  00224c  48c0                 ext.l     d0
  00224e  2200                 move.l    d0, d1
  002250  e089                 lsr.l     #$8, d1
  002252  e089                 lsr.l     #$8, d1
  002254  e089                 lsr.l     #$8, d1
  002256  ee89                 lsr.l     #$7, d1
  002258  d280                 add.l     d0, d1
  00225a  e281                 asr.l     #$1, d1
  00225c  3f01                 move.w    d1, -(a7)
  00225e  302efffc             move.w    -$4(a6), d0
  002262  906efff8             sub.w     -$8(a6), d0
  002266  906b0004             sub.w     $4(a3), d0
  00226a  9053                 sub.w     (a3), d0
  00226c  48c0                 ext.l     d0
  00226e  2200                 move.l    d0, d1
  002270  e089                 lsr.l     #$8, d1
  002272  e089                 lsr.l     #$8, d1
  002274  e089                 lsr.l     #$8, d1
  002276  ee89                 lsr.l     #$7, d1
  002278  d280                 add.l     d0, d1
  00227a  e281                 asr.l     #$1, d1
  00227c  3f01                 move.w    d1, -(a7)
  00227e  a8a8                 _OffsetRect 
  002280  2f0a                 move.l    a2, -(a7)
  002282  486efff0             pea.l     -$10(a6)
  002286  a8f6                 _DrawPicture 
  002288  206effec             movea.l   -$14(a6), a0
  00228c  42a80068             clr.l     $68(a0)
  002290  2f0a                 move.l    a2, -(a7)
  002292  205f                 movea.l   (a7)+, a0
  002294  a023                 _DisposeHandle 
  002296  2f2dea8c             move.l    -$1574(a5), -(a7)
  00229a  a9a3                 _ReleaseResource 
  00229c  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  0022a0  4e5e                 unlk      a6
  0022a2  205f                 movea.l   (a7)+, a0
  0022a4  504f                 addq.w    #$8, a7
  0022a6  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETANDDRAWPICTRES   (seg 7 +0022c4, 26 bytes)
  0022c4  4e56fff8             link.w    a6, #$fff8
  0022c8  3f2e0008             move.w    $8(a6), -(a7)
  0022cc  486efff8             pea.l     -$8(a6)
  0022d0  4227                 clr.b     -(a7)
  0022d2  4ebafcd8             jsr       $1fac(pc)   ; INTERNALGETANDDRAWPICTRES
  0022d6  4e5e                 unlk      a6
  0022d8  205f                 movea.l   (a7)+, a0
  0022da  544f                 addq.w    #$2, a7
  0022dc  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETANDDRAWPICTRESINRECT   (seg 7 +0022f6, 28 bytes)
  0022f6  4e560000             link.w    a6, #$0
  0022fa  3f2e000c             move.w    $c(a6), -(a7)
  0022fe  2f2e0008             move.l    $8(a6), -(a7)
  002302  1f3c0001             move.b    #$1, -(a7)
  002306  4ebafca4             jsr       $1fac(pc)   ; INTERNALGETANDDRAWPICTRES
  00230a  4e5e                 unlk      a6
  00230c  205f                 movea.l   (a7)+, a0
  00230e  5c4f                 addq.w    #$6, a7
  002310  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETANDCENTERPICTRESINRECT   (seg 7 +002330, 28 bytes)
  002330  4e560000             link.w    a6, #$0
  002334  3f2e000c             move.w    $c(a6), -(a7)
  002338  2f2e0008             move.l    $8(a6), -(a7)
  00233c  1f3c0002             move.b    #$2, -(a7)
  002340  4ebafc6a             jsr       $1fac(pc)   ; INTERNALGETANDDRAWPICTRES
  002344  4e5e                 unlk      a6
  002346  205f                 movea.l   (a7)+, a0
  002348  5c4f                 addq.w    #$6, a7
  00234a  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATCONFIGURE   (seg 7 +00236c, 36 bytes)
  00236c  4e560000             link.w    a6, #$0
  002370  1b6e000ee84c         move.b    $e(a6), -$17b4(a5)
  002376  3b6e000ce84e         move.w    $c(a6), -$17b2(a5)
  00237c  3b6e000ae850         move.w    $a(a6), -$17b0(a5)
  002382  3b6e0008e852         move.w    $8(a6), -$17ae(a5)
  002388  4e5e                 unlk      a6
  00238a  205f                 movea.l   (a7)+, a0
  00238c  504f                 addq.w    #$8, a7
  00238e  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATSETSPRITERECSIZE   (seg 7 +0023a0, 48 bytes)
  0023a0  4e560000             link.w    a6, #$0
  0023a4  2f0a                 move.l    a2, -(a7)
  0023a6  2b6e0008e7e6         move.l    $8(a6), -$181a(a5)
  0023ac  6014                 bra.b     $23c2
  0023ae  246de8fe             movea.l   -$1702(a5), a2
  0023b2  206de8fe             movea.l   -$1702(a5), a0
  0023b6  2b68002ee8fe         move.l    $2e(a0), -$1702(a5)
  0023bc  2f0a                 move.l    a2, -(a7)
  0023be  205f                 movea.l   (a7)+, a0
  0023c0  a01f                 _DisposePtr 
  0023c2  4aade8fe             tst.l     -$1702(a5)
  0023c6  66e6                 bne.b     $23ae
  0023c8  245f                 movea.l   (a7)+, a2
  0023ca  4e5e                 unlk      a6
  0023cc  2e9f                 move.l    (a7)+, (a7)
  0023ce  4e75                 rts       

;-------------------------------------------------------------
; SetRectBlit0   (seg 7 +0023e6, 70 bytes)
  0023e6  4e560000             link.w    a6, #$0
  0023ea  2f0a                 move.l    a2, -(a7)
  0023ec  246e0010             movea.l   $10(a6), a2
  0023f0  200a                 move.l    a2, d0
  0023f2  660e                 bne.b     $2402
  0023f4  41f900000048         lea.l     $48.l, a0   ; SATSAFERECTBLIT
  0023fa  226e000c             movea.l   $c(a6), a1
  0023fe  2288                 move.l    a0, (a1)
  002400  601e                 bra.b     $2420
  002402  2f0a                 move.l    a2, -(a7)
  002404  205f                 movea.l   (a7)+, a0
  002406  a064                 _MoveHHi  
  002408  2f0a                 move.l    a2, -(a7)
  00240a  205f                 movea.l   (a7)+, a0
  00240c  a029                 _HLock    
  00240e  594f                 subq.w    #$4, a7
  002410  2f12                 move.l    (a2), -(a7)
  002412  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  002418  205f                 movea.l   (a7)+, a0
  00241a  226e000c             movea.l   $c(a6), a1
  00241e  2288                 move.l    a0, (a1)
  002420  245f                 movea.l   (a7)+, a2
  002422  4e5e                 unlk      a6
  002424  205f                 movea.l   (a7)+, a0
  002426  4fef000c             lea.l     $c(a7), a7
  00242a  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SetMaskBlit1   (seg 7 +00243c, 70 bytes)
  00243c  4e560000             link.w    a6, #$0
  002440  2f0a                 move.l    a2, -(a7)
  002442  246e0010             movea.l   $10(a6), a2
  002446  200a                 move.l    a2, d0
  002448  660e                 bne.b     $2458
  00244a  41f900000050         lea.l     $50.l, a0   ; SATSAFEMASKBLIT
  002450  226e000c             movea.l   $c(a6), a1
  002454  2288                 move.l    a0, (a1)
  002456  601e                 bra.b     $2476
  002458  2f0a                 move.l    a2, -(a7)
  00245a  205f                 movea.l   (a7)+, a0
  00245c  a064                 _MoveHHi  
  00245e  2f0a                 move.l    a2, -(a7)
  002460  205f                 movea.l   (a7)+, a0
  002462  a029                 _HLock    
  002464  594f                 subq.w    #$4, a7
  002466  2f12                 move.l    (a2), -(a7)
  002468  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  00246e  205f                 movea.l   (a7)+, a0
  002470  226e000c             movea.l   $c(a6), a1
  002474  2288                 move.l    a0, (a1)
  002476  245f                 movea.l   (a7)+, a2
  002478  4e5e                 unlk      a6
  00247a  205f                 movea.l   (a7)+, a0
  00247c  4fef000c             lea.l     $c(a7), a7
  002480  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATCUSTOMINIT   (seg 7 +002492, 2444 bytes)
  002492  4e56ffa2             link.w    a6, #$ffa2
  002496  48e71f30             movem.l   d3-d7/a2-a3, -(a7)
  00249a  266e0016             movea.l   $16(a6), a3
  00249e  246e0012             movea.l   $12(a6), a2
  0024a2  162e0010             move.b    $10(a6), d3
  0024a6  1c2e0008             move.b    $8(a6), d6
  0024aa  1b7c0001e7e5         move.b    #$1, -$181b(a5)
  0024b0  4aade7ea             tst.l     -$1816(a5)
  0024b4  660a                 bne.b     $24c0
  0024b6  594f                 subq.w    #$4, a7
  0024b8  a8d8                 _NewRgn   
  0024ba  205f                 movea.l   (a7)+, a0
  0024bc  2b48e7ea             move.l    a0, -$1816(a5)
  0024c0  3e2de860             move.w    -$17a0(a5), d7
  0024c4  554f                 subq.w    #$2, a7
  0024c6  3f3c0001             move.w    #$1, -(a7)
  0024ca  486effa2             pea.l     -$5e(a6)
  0024ce  4eb900000360         jsr       $360.l   ; seg4+32a
  0024d4  301f                 move.w    (a7)+, d0
  0024d6  3800                 move.w    d0, d4
  0024d8  1b6effabe8b4         move.b    -$55(a6), -$174c(a5)
  0024de  486effb6             pea.l     -$4a(a6)
  0024e2  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  0024e8  4a2de8b4             tst.b     -$174c(a5)
  0024ec  670e                 beq.b     $24fc
  0024ee  554f                 subq.w    #$2, a7
  0024f0  1eb80cb2             move.b    $cb2.w, (a7)
  0024f4  101f                 move.b    (a7)+, d0
  0024f6  1b40e8b5             move.b    d0, -$174b(a5)
  0024fa  6006                 bra.b     $2502
  0024fc  1b7c0001e8b5         move.b    #$1, -$174b(a5)
  002502  4aade7e6             tst.l     -$181a(a5)
  002506  6606                 bne.b     $250e
  002508  705c                 moveq     #$5c, d0
  00250a  2b40e7e6             move.l    d0, -$181a(a5)
  00250e  594f                 subq.w    #$4, a7
  002510  3f3ca8ec             move.w    #$a8ec, -(a7)
  002514  1f3c0001             move.b    #$1, -(a7)
  002518  4eb900000378         jsr       $378.l   ; seg4+6b0
  00251e  205f                 movea.l   (a7)+, a0
  002520  2b48e7e0             move.l    a0, -$1820(a5)
  002524  594f                 subq.w    #$4, a7
  002526  3f3ca8dc             move.w    #$a8dc, -(a7)
  00252a  1f3c0001             move.b    #$1, -(a7)
  00252e  4eb900000378         jsr       $378.l   ; seg4+6b0
  002534  205f                 movea.l   (a7)+, a0
  002536  2b48e7bc             move.l    a0, -$1844(a5)
  00253a  594f                 subq.w    #$4, a7
  00253c  3f3ca8e0             move.w    #$a8e0, -(a7)
  002540  1f3c0001             move.b    #$1, -(a7)
  002544  4eb900000378         jsr       $378.l   ; seg4+6b0
  00254a  205f                 movea.l   (a7)+, a0
  00254c  2b48e7c0             move.l    a0, -$1840(a5)
  002550  594f                 subq.w    #$4, a7
  002552  3f3ca8e4             move.w    #$a8e4, -(a7)
  002556  1f3c0001             move.b    #$1, -(a7)
  00255a  4eb900000378         jsr       $378.l   ; seg4+6b0
  002560  205f                 movea.l   (a7)+, a0
  002562  2b48e7c4             move.l    a0, -$183c(a5)
  002566  594f                 subq.w    #$4, a7
  002568  3f3ca01f             move.w    #$a01f, -(a7)
  00256c  1f3c0001             move.b    #$1, -(a7)
  002570  4eb900000378         jsr       $378.l   ; seg4+6b0
  002576  205f                 movea.l   (a7)+, a0
  002578  2b48e7c8             move.l    a0, -$1838(a5)
  00257c  594f                 subq.w    #$4, a7
  00257e  3f3ca11e             move.w    #$a11e, -(a7)
  002582  1f3c0001             move.b    #$1, -(a7)
  002586  4eb900000378         jsr       $378.l   ; seg4+6b0
  00258c  205f                 movea.l   (a7)+, a0
  00258e  2b48e7cc             move.l    a0, -$1834(a5)
  002592  594f                 subq.w    #$4, a7
  002594  3f3ca873             move.w    #$a873, -(a7)
  002598  1f3c0001             move.b    #$1, -(a7)
  00259c  4eb900000378         jsr       $378.l   ; seg4+6b0
  0025a2  205f                 movea.l   (a7)+, a0
  0025a4  2b48e7d0             move.l    a0, -$1830(a5)
  0025a8  594f                 subq.w    #$4, a7
  0025aa  3f3ca874             move.w    #$a874, -(a7)
  0025ae  1f3c0001             move.b    #$1, -(a7)
  0025b2  4eb900000378         jsr       $378.l   ; seg4+6b0
  0025b8  205f                 movea.l   (a7)+, a0
  0025ba  2b48e7d4             move.l    a0, -$182c(a5)
  0025be  594f                 subq.w    #$4, a7
  0025c0  3f3caa31             move.w    #$aa31, -(a7)
  0025c4  1f3c0001             move.b    #$1, -(a7)
  0025c8  4eb900000378         jsr       $378.l   ; seg4+6b0
  0025ce  205f                 movea.l   (a7)+, a0
  0025d0  2b48e7d8             move.l    a0, -$1828(a5)
  0025d4  594f                 subq.w    #$4, a7
  0025d6  3f3caa32             move.w    #$aa32, -(a7)
  0025da  1f3c0001             move.b    #$1, -(a7)
  0025de  4eb900000378         jsr       $378.l   ; seg4+6b0
  0025e4  205f                 movea.l   (a7)+, a0
  0025e6  2b48e7dc             move.l    a0, -$1824(a5)
  0025ea  4a2de8b4             tst.b     -$174c(a5)
  0025ee  6606                 bne.b     $25f6
  0025f0  42ade7f2             clr.l     -$180e(a5)
  0025f4  6014                 bra.b     $260a
  0025f6  200a                 move.l    a2, d0
  0025f8  6706                 beq.b     $2600
  0025fa  2b4ae7f2             move.l    a2, -$180e(a5)
  0025fe  600a                 bra.b     $260a
  002600  594f                 subq.w    #$4, a7
  002602  aa2a                 _GetMainDevice 
  002604  205f                 movea.l   (a7)+, a0
  002606  2b48e7f2             move.l    a0, -$180e(a5)
  00260a  4a2de8b4             tst.b     -$174c(a5)
  00260e  670e                 beq.b     $261e
  002610  594f                 subq.w    #$4, a7
  002612  aa2a                 _GetMainDevice 
  002614  205f                 movea.l   (a7)+, a0
  002616  b1ede7f2             cmpa.l    -$180e(a5), a0
  00261a  6702                 beq.b     $261e
  00261c  7601                 moveq     #$1, d3
  00261e  4eb90000432c         jsr       $432c.l   ; SATSETUPSCREENVARS
  002624  4a03                 tst.b     d3
  002626  6704                 beq.b     $262c
  002628  7600                 moveq     #$0, d3
  00262a  600c                 bra.b     $2638
  00262c  554f                 subq.w    #$2, a7
  00262e  4eb900005da8         jsr       $5da8.l   ; SATGETMBARHEIGHT
  002634  301f                 move.w    (a7)+, d0
  002636  3600                 move.w    d0, d3
  002638  206e001a             movea.l   $1a(a6), a0
  00263c  2d50fff8             move.l    (a0), -$8(a6)
  002640  2d680004fffc         move.l    $4(a0), -$4(a6)
  002646  200b                 move.l    a3, d0
  002648  6600009c             bne.w     $26e6
  00264c  4a2e000c             tst.b     $c(a6)
  002650  6718                 beq.b     $266a
  002652  2d6de858fff0         move.l    -$17a8(a5), -$10(a6)
  002658  2d6de85cfff4         move.l    -$17a4(a5), -$c(a6)
  00265e  302efff0             move.w    -$10(a6), d0
  002662  d043                 add.w     d3, d0
  002664  3d40fff0             move.w    d0, -$10(a6)
  002668  600c                 bra.b     $2676
  00266a  2d6efff8fff0         move.l    -$8(a6), -$10(a6)
  002670  2d6efffcfff4         move.l    -$4(a6), -$c(a6)
  002676  4aade7ee             tst.l     -$1812(a5)
  00267a  6718                 beq.b     $2694
  00267c  206de7ee             movea.l   -$1812(a5), a0
  002680  226de7ee             movea.l   -$1812(a5), a1
  002684  30290010             move.w    $10(a1), d0
  002688  b0680014             cmp.w     $14(a0), d0
  00268c  6606                 bne.b     $2694
  00268e  2f2de7ee             move.l    -$1812(a5), -(a7)
  002692  a914                 _DisposeWindow 
  002694  4a2de8b4             tst.b     -$174c(a5)
  002698  6726                 beq.b     $26c0
  00269a  594f                 subq.w    #$4, a7
  00269c  48780000             pea.l     $0.w
  0026a0  486efff0             pea.l     -$10(a6)
  0026a4  486df6dc             pea.l     -$924(a5)
  0026a8  4227                 clr.b     -(a7)
  0026aa  3f3c0002             move.w    #$2, -(a7)
  0026ae  4878ffff             pea.l     $ffff.w
  0026b2  4227                 clr.b     -(a7)
  0026b4  42a7                 clr.l     -(a7)
  0026b6  aa45                 _NewCWindow 
  0026b8  205f                 movea.l   (a7)+, a0
  0026ba  2b48e7ee             move.l    a0, -$1812(a5)
  0026be  6064                 bra.b     $2724
  0026c0  594f                 subq.w    #$4, a7
  0026c2  48780000             pea.l     $0.w
  0026c6  486efff0             pea.l     -$10(a6)
  0026ca  486df6dc             pea.l     -$924(a5)
  0026ce  4227                 clr.b     -(a7)
  0026d0  3f3c0002             move.w    #$2, -(a7)
  0026d4  4878ffff             pea.l     $ffff.w
  0026d8  4227                 clr.b     -(a7)
  0026da  42a7                 clr.l     -(a7)
  0026dc  a913                 _NewWindow 
  0026de  205f                 movea.l   (a7)+, a0
  0026e0  2b48e7ee             move.l    a0, -$1812(a5)
  0026e4  603e                 bra.b     $2724
  0026e6  2b4be7ee             move.l    a3, -$1812(a5)
  0026ea  486effb2             pea.l     -$4e(a6)
  0026ee  a874                 _GetPort  
  0026f0  2f2de7ee             move.l    -$1812(a5), -(a7)
  0026f4  a873                 _SetPort  
  0026f6  206de7ee             movea.l   -$1812(a5), a0
  0026fa  2d680010fff0         move.l    $10(a0), -$10(a6)
  002700  2d680014fff4         move.l    $14(a0), -$c(a6)
  002706  486efff0             pea.l     -$10(a6)
  00270a  a870                 _LocalToGlobal 
  00270c  486efff4             pea.l     -$c(a6)
  002710  a870                 _LocalToGlobal 
  002712  486efff8             pea.l     -$8(a6)
  002716  a870                 _LocalToGlobal 
  002718  486efffc             pea.l     -$4(a6)
  00271c  a870                 _LocalToGlobal 
  00271e  2f2effb2             move.l    -$4e(a6), -(a7)
  002722  a873                 _SetPort  
  002724  4a2e000e             tst.b     $e(a6)
  002728  6772                 beq.b     $279c
  00272a  3a2efffe             move.w    -$2(a6), d5
  00272e  9a6efffa             sub.w     -$6(a6), d5
  002732  382efffc             move.w    -$4(a6), d4
  002736  986efff8             sub.w     -$8(a6), d4
  00273a  302de85e             move.w    -$17a2(a5), d0
  00273e  906de85a             sub.w     -$17a6(a5), d0
  002742  9045                 sub.w     d5, d0
  002744  48c0                 ext.l     d0
  002746  2200                 move.l    d0, d1
  002748  e089                 lsr.l     #$8, d1
  00274a  e089                 lsr.l     #$8, d1
  00274c  e089                 lsr.l     #$8, d1
  00274e  ee89                 lsr.l     #$7, d1
  002750  d280                 add.l     d0, d1
  002752  e281                 asr.l     #$1, d1
  002754  306de85a             movea.w   -$17a6(a5), a0
  002758  d288                 add.l     a0, d1
  00275a  3d41fffa             move.w    d1, -$6(a6)
  00275e  3005                 move.w    d5, d0
  002760  d06efffa             add.w     -$6(a6), d0
  002764  3d40fffe             move.w    d0, -$2(a6)
  002768  302de85c             move.w    -$17a4(a5), d0
  00276c  9043                 sub.w     d3, d0
  00276e  906de858             sub.w     -$17a8(a5), d0
  002772  9044                 sub.w     d4, d0
  002774  48c0                 ext.l     d0
  002776  2200                 move.l    d0, d1
  002778  e089                 lsr.l     #$8, d1
  00277a  e089                 lsr.l     #$8, d1
  00277c  e089                 lsr.l     #$8, d1
  00277e  ee89                 lsr.l     #$7, d1
  002780  d280                 add.l     d0, d1
  002782  e281                 asr.l     #$1, d1
  002784  306de858             movea.w   -$17a8(a5), a0
  002788  d288                 add.l     a0, d1
  00278a  3043                 movea.w   d3, a0
  00278c  d288                 add.l     a0, d1
  00278e  3d41fff8             move.w    d1, -$8(a6)
  002792  3004                 move.w    d4, d0
  002794  d06efff8             add.w     -$8(a6), d0
  002798  3d40fffc             move.w    d0, -$4(a6)
  00279c  4a06                 tst.b     d6
  00279e  6740                 beq.b     $27e0
  0027a0  302efffa             move.w    -$6(a6), d0
  0027a4  b06efff2             cmp.w     -$e(a6), d0
  0027a8  6c06                 bge.b     $27b0
  0027aa  3d6efff2fffa         move.w    -$e(a6), -$6(a6)
  0027b0  302efffe             move.w    -$2(a6), d0
  0027b4  b06efff6             cmp.w     -$a(a6), d0
  0027b8  6f06                 ble.b     $27c0
  0027ba  3d6efff6fffe         move.w    -$a(a6), -$2(a6)
  0027c0  302efff8             move.w    -$8(a6), d0
  0027c4  b06efff0             cmp.w     -$10(a6), d0
  0027c8  6c06                 bge.b     $27d0
  0027ca  3d6efff0fff8         move.w    -$10(a6), -$8(a6)
  0027d0  302efffc             move.w    -$4(a6), d0
  0027d4  b06efff4             cmp.w     -$c(a6), d0
  0027d8  6f06                 ble.b     $27e0
  0027da  3d6efff4fffc         move.w    -$c(a6), -$4(a6)
  0027e0  2d6de858ffd8         move.l    -$17a8(a5), -$28(a6)
  0027e6  2d6de85cffdc         move.l    -$17a4(a5), -$24(a6)
  0027ec  486effd8             pea.l     -$28(a6)
  0027f0  302effda             move.w    -$26(a6), d0
  0027f4  4440                 neg.w     d0
  0027f6  3f00                 move.w    d0, -(a7)
  0027f8  302effd8             move.w    -$28(a6), d0
  0027fc  4440                 neg.w     d0
  0027fe  3f00                 move.w    d0, -(a7)
  002800  a8a8                 _OffsetRect 
  002802  4a06                 tst.b     d6
  002804  6746                 beq.b     $284c
  002806  302efffa             move.w    -$6(a6), d0
  00280a  b06de85a             cmp.w     -$17a6(a5), d0
  00280e  6c06                 bge.b     $2816
  002810  3d6de85afffa         move.w    -$17a6(a5), -$6(a6)
  002816  302efffe             move.w    -$2(a6), d0
  00281a  b06de85e             cmp.w     -$17a2(a5), d0
  00281e  6f06                 ble.b     $2826
  002820  3d6de85efffe         move.w    -$17a2(a5), -$2(a6)
  002826  302de858             move.w    -$17a8(a5), d0
  00282a  d043                 add.w     d3, d0
  00282c  b06efff8             cmp.w     -$8(a6), d0
  002830  6f0a                 ble.b     $283c
  002832  302de858             move.w    -$17a8(a5), d0
  002836  d043                 add.w     d3, d0
  002838  3d40fff8             move.w    d0, -$8(a6)
  00283c  302efffc             move.w    -$4(a6), d0
  002840  b06de85c             cmp.w     -$17a4(a5), d0
  002844  6f06                 ble.b     $284c
  002846  3d6de85cfffc         move.w    -$17a4(a5), -$4(a6)
  00284c  4a06                 tst.b     d6
  00284e  672c                 beq.b     $287c
  002850  594f                 subq.w    #$4, a7
  002852  700f                 moveq     #$f, d0
  002854  d06efffa             add.w     -$6(a6), d0
  002858  48c0                 ext.l     d0
  00285a  2f00                 move.l    d0, -(a7)
  00285c  4878fff0             pea.l     $fff0.w
  002860  a858                 _BitAnd   
  002862  201f                 move.l    (a7)+, d0
  002864  3d40fffa             move.w    d0, -$6(a6)
  002868  594f                 subq.w    #$4, a7
  00286a  306efffe             movea.w   -$2(a6), a0
  00286e  2f08                 move.l    a0, -(a7)
  002870  4878fff8             pea.l     $fff8.w
  002874  a858                 _BitAnd   
  002876  201f                 move.l    (a7)+, d0
  002878  3d40fffe             move.w    d0, -$2(a6)
  00287c  302efffe             move.w    -$2(a6), d0
  002880  b06efffa             cmp.w     -$6(a6), d0
  002884  6c06                 bge.b     $288c
  002886  3d6efffafffe         move.w    -$6(a6), -$2(a6)
  00288c  302efffc             move.w    -$4(a6), d0
  002890  b06efff8             cmp.w     -$8(a6), d0
  002894  6c06                 bge.b     $289c
  002896  3d6efff8fffc         move.w    -$8(a6), -$4(a6)
  00289c  302efffe             move.w    -$2(a6), d0
  0028a0  906efffa             sub.w     -$6(a6), d0
  0028a4  3b40e808             move.w    d0, -$17f8(a5)
  0028a8  302efffc             move.w    -$4(a6), d0
  0028ac  906efff8             sub.w     -$8(a6), d0
  0028b0  3b40e80a             move.w    d0, -$17f6(a5)
  0028b4  4eb900004308         jsr       $4308.l   ; SATSETPORTSCREEN
  0028ba  2d6efff8ffd0         move.l    -$8(a6), -$30(a6)
  0028c0  2d6efffcffd4         move.l    -$4(a6), -$2c(a6)
  0028c6  486effd0             pea.l     -$30(a6)
  0028ca  a871                 _GlobalToLocal 
  0028cc  486effd4             pea.l     -$2c(a6)
  0028d0  a871                 _GlobalToLocal 
  0028d2  2b6efff8e8ee         move.l    -$8(a6), -$1712(a5)
  0028d8  2b6efffce8f2         move.l    -$4(a6), -$170e(a5)
  0028de  486de8ee             pea.l     -$1712(a5)
  0028e2  302de85a             move.w    -$17a6(a5), d0
  0028e6  4440                 neg.w     d0
  0028e8  3f00                 move.w    d0, -(a7)
  0028ea  302de858             move.w    -$17a8(a5), d0
  0028ee  4440                 neg.w     d0
  0028f0  3f00                 move.w    d0, -(a7)
  0028f2  a8a8                 _OffsetRect 
  0028f4  2d6efff0ffe8         move.l    -$10(a6), -$18(a6)
  0028fa  2d6efff4ffec         move.l    -$c(a6), -$14(a6)
  002900  486effe8             pea.l     -$18(a6)
  002904  302de85a             move.w    -$17a6(a5), d0
  002908  4440                 neg.w     d0
  00290a  3f00                 move.w    d0, -(a7)
  00290c  302de858             move.w    -$17a8(a5), d0
  002910  4440                 neg.w     d0
  002912  3f00                 move.w    d0, -(a7)
  002914  a8a8                 _OffsetRect 
  002916  302de8f0             move.w    -$1710(a5), d0
  00291a  b06effea             cmp.w     -$16(a6), d0
  00291e  6c06                 bge.b     $2926
  002920  3b6effeae8f0         move.w    -$16(a6), -$1710(a5)
  002926  302de8f4             move.w    -$170c(a5), d0
  00292a  b06effee             cmp.w     -$12(a6), d0
  00292e  6f06                 ble.b     $2936
  002930  3b6effeee8f4         move.w    -$12(a6), -$170c(a5)
  002936  302de8ee             move.w    -$1712(a5), d0
  00293a  b06effe8             cmp.w     -$18(a6), d0
  00293e  6c06                 bge.b     $2946
  002940  3b6effe8e8ee         move.w    -$18(a6), -$1712(a5)
  002946  302de8f2             move.w    -$170e(a5), d0
  00294a  b06effec             cmp.w     -$14(a6), d0
  00294e  6f06                 ble.b     $2956
  002950  3b6effece8f2         move.w    -$14(a6), -$170e(a5)
  002956  302de8f2             move.w    -$170e(a5), d0
  00295a  b06de8ee             cmp.w     -$1712(a5), d0
  00295e  6e0a                 bgt.b     $296a
  002960  7001                 moveq     #$1, d0
  002962  d06de8ee             add.w     -$1712(a5), d0
  002966  3b40e8f2             move.w    d0, -$170e(a5)
  00296a  302efffa             move.w    -$6(a6), d0
  00296e  4440                 neg.w     d0
  002970  906de85a             sub.w     -$17a6(a5), d0
  002974  48c0                 ext.l     d0
  002976  2b40e840             move.l    d0, -$17c0(a5)
  00297a  302efff8             move.w    -$8(a6), d0
  00297e  4440                 neg.w     d0
  002980  906de858             sub.w     -$17a8(a5), d0
  002984  48c0                 ext.l     d0
  002986  2b40e844             move.l    d0, -$17bc(a5)
  00298a  302efffa             move.w    -$6(a6), d0
  00298e  4440                 neg.w     d0
  002990  d06efff2             add.w     -$e(a6), d0
  002994  3f00                 move.w    d0, -(a7)
  002996  302efff8             move.w    -$8(a6), d0
  00299a  4440                 neg.w     d0
  00299c  d06efff0             add.w     -$10(a6), d0
  0029a0  3f00                 move.w    d0, -(a7)
  0029a2  a878                 _SetOrigin 
  0029a4  206de7ee             movea.l   -$1812(a5), a0
  0029a8  2b680010e8f6         move.l    $10(a0), -$170a(a5)
  0029ae  2b680014e8fa         move.l    $14(a0), -$1706(a5)
  0029b4  486de8f6             pea.l     -$170a(a5)
  0029b8  a870                 _LocalToGlobal 
  0029ba  486de8fa             pea.l     -$1706(a5)
  0029be  a870                 _LocalToGlobal 
  0029c0  4a2de8b4             tst.b     -$174c(a5)
  0029c4  6770                 beq.b     $2a36
  0029c6  206de7f2             movea.l   -$180e(a5), a0
  0029ca  2050                 movea.l   (a0), a0
  0029cc  20680016             movea.l   $16(a0), a0
  0029d0  2050                 movea.l   (a0), a0
  0029d2  2b50e802             move.l    (a0), -$17fe(a5)
  0029d6  594f                 subq.w    #$4, a7
  0029d8  206de7f2             movea.l   -$180e(a5), a0
  0029dc  2050                 movea.l   (a0), a0
  0029de  20680016             movea.l   $16(a0), a0
  0029e2  2050                 movea.l   (a0), a0
  0029e4  32680004             movea.w   $4(a0), a1
  0029e8  2f09                 move.l    a1, -(a7)
  0029ea  48783fff             pea.l     $3fff.w
  0029ee  a858                 _BitAnd   
  0029f0  201f                 move.l    (a7)+, d0
  0029f2  3b40e806             move.w    d0, -$17fa(a5)
  0029f6  486de8ee             pea.l     -$1712(a5)
  0029fa  206de7f2             movea.l   -$180e(a5), a0
  0029fe  2050                 movea.l   (a0), a0
  002a00  20680016             movea.l   $16(a0), a0
  002a04  2050                 movea.l   (a0), a0
  002a06  2f10                 move.l    (a0), -(a7)
  002a08  594f                 subq.w    #$4, a7
  002a0a  48783fff             pea.l     $3fff.w
  002a0e  206de7f2             movea.l   -$180e(a5), a0
  002a12  2050                 movea.l   (a0), a0
  002a14  20680016             movea.l   $16(a0), a0
  002a18  2050                 movea.l   (a0), a0
  002a1a  32680004             movea.w   $4(a0), a1
  002a1e  2f09                 move.l    a1, -(a7)
  002a20  a858                 _BitAnd   
  002a22  201f                 move.l    (a7)+, d0
  002a24  3f00                 move.w    d0, -(a7)
  002a26  486de7f6             pea.l     -$180a(a5)
  002a2a  3f2de860             move.w    -$17a0(a5), -(a7)
  002a2e  4eb900002e92         jsr       $2e92.l   ; SATMAKEROWLIST
  002a34  6026                 bra.b     $2a5c
  002a36  2b6de73ee802         move.l    -$18c2(a5), -$17fe(a5)
  002a3c  3b6de742e806         move.w    -$18be(a5), -$17fa(a5)
  002a42  486de8ee             pea.l     -$1712(a5)
  002a46  2f2de73e             move.l    -$18c2(a5), -(a7)
  002a4a  3f2de742             move.w    -$18be(a5), -(a7)
  002a4e  486de7f6             pea.l     -$180a(a5)
  002a52  3f2de860             move.w    -$17a0(a5), -(a7)
  002a56  4eb900002e92         jsr       $2e92.l   ; SATMAKEROWLIST
  002a5c  2b6de8eee7fa         move.l    -$1712(a5), -$1806(a5)
  002a62  2b6de8f2e7fe         move.l    -$170e(a5), -$1802(a5)
  002a68  486de7fa             pea.l     -$1806(a5)
  002a6c  302de7fc             move.w    -$1804(a5), d0
  002a70  4440                 neg.w     d0
  002a72  3f00                 move.w    d0, -(a7)
  002a74  302de7fa             move.w    -$1806(a5), d0
  002a78  4440                 neg.w     d0
  002a7a  3f00                 move.w    d0, -(a7)
  002a7c  a8a8                 _OffsetRect 
  002a7e  362de808             move.w    -$17f8(a5), d3
  002a82  966de8f4             sub.w     -$170c(a5), d3
  002a86  d66de8f0             add.w     -$1710(a5), d3
  002a8a  4a43                 tst.w     d3
  002a8c  6f1a                 ble.b     $2aa8
  002a8e  486de7fa             pea.l     -$1806(a5)
  002a92  3043                 movea.w   d3, a0
  002a94  2008                 move.l    a0, d0
  002a96  e088                 lsr.l     #$8, d0
  002a98  e088                 lsr.l     #$8, d0
  002a9a  e088                 lsr.l     #$8, d0
  002a9c  ee88                 lsr.l     #$7, d0
  002a9e  d088                 add.l     a0, d0
  002aa0  e280                 asr.l     #$1, d0
  002aa2  3f00                 move.w    d0, -(a7)
  002aa4  4267                 clr.w     -(a7)
  002aa6  a8a8                 _OffsetRect 
  002aa8  362de80a             move.w    -$17f6(a5), d3
  002aac  966de8f2             sub.w     -$170e(a5), d3
  002ab0  d66de8ee             add.w     -$1712(a5), d3
  002ab4  4a43                 tst.w     d3
  002ab6  6f1a                 ble.b     $2ad2
  002ab8  486de7fa             pea.l     -$1806(a5)
  002abc  4267                 clr.w     -(a7)
  002abe  3043                 movea.w   d3, a0
  002ac0  2008                 move.l    a0, d0
  002ac2  e088                 lsr.l     #$8, d0
  002ac4  e088                 lsr.l     #$8, d0
  002ac6  e088                 lsr.l     #$8, d0
  002ac8  ee88                 lsr.l     #$7, d0
  002aca  d088                 add.l     a0, d0
  002acc  e280                 asr.l     #$1, d0
  002ace  3f00                 move.w    d0, -(a7)
  002ad0  a8a8                 _OffsetRect 
  002ad2  4eb900000d92         jsr       $d92.l   ; SATSOUNDINIT
  002ad8  486effe0             pea.l     -$20(a6)
  002adc  42a7                 clr.l     -(a7)
  002ade  2f3c00400042         move.l    #$400042, -(a7)
  002ae4  a8a7                 _SetRect  
  002ae6  486de878             pea.l     -$1788(a5)
  002aea  4eb900001bfc         jsr       $1bfc.l   ; DISPOSEICONPORT
  002af0  486de892             pea.l     -$176e(a5)
  002af4  4eb900001bfc         jsr       $1bfc.l   ; DISPOSEICONPORT
  002afa  4aade8ac             tst.l     -$1754(a5)
  002afe  6712                 beq.b     $2b12
  002b00  2f2de8ac             move.l    -$1754(a5), -(a7)
  002b04  a87d                 _ClosePort 
  002b06  2f2de8ac             move.l    -$1754(a5), -(a7)
  002b0a  205f                 movea.l   (a7)+, a0
  002b0c  a01f                 _DisposePtr 
  002b0e  42ade8ac             clr.l     -$1754(a5)
  002b12  486de878             pea.l     -$1788(a5)
  002b16  486effe0             pea.l     -$20(a6)
  002b1a  4eb900002f64         jsr       $2f64.l   ; SATMAKEOFFSCREEN
  002b20  4a2de8b4             tst.b     -$174c(a5)
  002b24  6712                 beq.b     $2b38
  002b26  206de878             movea.l   -$1788(a5), a0
  002b2a  20680002             movea.l   $2(a0), a0
  002b2e  2050                 movea.l   (a0), a0
  002b30  2f10                 move.l    (a0), -(a7)
  002b32  205f                 movea.l   (a7)+, a0
  002b34  a01f                 _DisposePtr 
  002b36  6030                 bra.b     $2b68
  002b38  206de878             movea.l   -$1788(a5), a0
  002b3c  4aa80002             tst.l     $2(a0)
  002b40  6712                 beq.b     $2b54
  002b42  206de878             movea.l   -$1788(a5), a0
  002b46  20280002             move.l    $2(a0), d0
  002b4a  5980                 subq.l    #$4, d0
  002b4c  206de878             movea.l   -$1788(a5), a0
  002b50  21400002             move.l    d0, $2(a0)
  002b54  206de878             movea.l   -$1788(a5), a0
  002b58  2f280002             move.l    $2(a0), -(a7)
  002b5c  205f                 movea.l   (a7)+, a0
  002b5e  a01f                 _DisposePtr 
  002b60  206de878             movea.l   -$1788(a5), a0
  002b64  42a80002             clr.l     $2(a0)
  002b68  486de892             pea.l     -$176e(a5)
  002b6c  486effe0             pea.l     -$20(a6)
  002b70  4eb900002f64         jsr       $2f64.l   ; SATMAKEOFFSCREEN
  002b76  4a2de8b4             tst.b     -$174c(a5)
  002b7a  6712                 beq.b     $2b8e
  002b7c  206de892             movea.l   -$176e(a5), a0
  002b80  20680002             movea.l   $2(a0), a0
  002b84  2050                 movea.l   (a0), a0
  002b86  2f10                 move.l    (a0), -(a7)
  002b88  205f                 movea.l   (a7)+, a0
  002b8a  a01f                 _DisposePtr 
  002b8c  6030                 bra.b     $2bbe
  002b8e  206de892             movea.l   -$176e(a5), a0
  002b92  4aa80002             tst.l     $2(a0)
  002b96  6712                 beq.b     $2baa
  002b98  206de892             movea.l   -$176e(a5), a0
  002b9c  20280002             move.l    $2(a0), d0
  002ba0  5980                 subq.l    #$4, d0
  002ba2  206de892             movea.l   -$176e(a5), a0
  002ba6  21400002             move.l    d0, $2(a0)
  002baa  206de892             movea.l   -$176e(a5), a0
  002bae  2f280002             move.l    $2(a0), -(a7)
  002bb2  205f                 movea.l   (a7)+, a0
  002bb4  a01f                 _DisposePtr 
  002bb6  206de892             movea.l   -$176e(a5), a0
  002bba  42a80002             clr.l     $2(a0)
  002bbe  594f                 subq.w    #$4, a7
  002bc0  4878006c             pea.l     $6c.w
  002bc4  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  002bca  205f                 movea.l   (a7)+, a0
  002bcc  2b48e8ac             move.l    a0, -$1754(a5)
  002bd0  2f2de8ac             move.l    -$1754(a5), -(a7)
  002bd4  a86f                 _OpenPort 
  002bd6  206de8ac             movea.l   -$1754(a5), a0
  002bda  216effe00010         move.l    -$20(a6), $10(a0)
  002be0  216effe40014         move.l    -$1c(a6), $14(a0)
  002be6  206de8ac             movea.l   -$1754(a5), a0
  002bea  226de8ac             movea.l   -$1754(a5), a1
  002bee  236800100008         move.l    $10(a0), $8(a1)
  002bf4  23680014000c         move.l    $14(a0), $c(a1)
  002bfa  206de8ac             movea.l   -$1754(a5), a0
  002bfe  2f280018             move.l    $18(a0), -(a7)
  002c02  486effe0             pea.l     -$20(a6)
  002c06  a8df                 _RectRgn  
  002c08  486effe0             pea.l     -$20(a6)
  002c0c  a87b                 _ClipRect 
  002c0e  206de8ac             movea.l   -$1754(a5), a0
  002c12  226de8ac             movea.l   -$1754(a5), a1
  002c16  30290016             move.w    $16(a1), d0
  002c1a  90680012             sub.w     $12(a0), d0
  002c1e  0640001f             addi.w    #$1f, d0
  002c22  48c0                 ext.l     d0
  002c24  2200                 move.l    d0, d1
  002c26  e881                 asr.l     #$4, d1
  002c28  e089                 lsr.l     #$8, d1
  002c2a  e089                 lsr.l     #$8, d1
  002c2c  e089                 lsr.l     #$8, d1
  002c2e  e689                 lsr.l     #$3, d1
  002c30  d280                 add.l     d0, d1
  002c32  ea81                 asr.l     #$5, d1
  002c34  7004                 moveq     #$4, d0
  002c36  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  002c3c  206de8ac             movea.l   -$1754(a5), a0
  002c40  31400006             move.w    d0, $6(a0)
  002c44  206de8ac             movea.l   -$1754(a5), a0
  002c48  42a80002             clr.l     $2(a0)
  002c4c  4a6de852             tst.w     -$17ae(a5)
  002c50  6606                 bne.b     $2c58
  002c52  3b7c0020e852         move.w    #$20, -$17ae(a5)
  002c58  42ade870             clr.l     -$1790(a5)
  002c5c  4a2e000a             tst.b     $a(a6)
  002c60  670c                 beq.b     $2c6e
  002c62  4a2de8b4             tst.b     -$174c(a5)
  002c66  6706                 beq.b     $2c6e
  002c68  4eb9000032b0         jsr       $32b0.l   ; SATINITDITHER
  002c6e  4aade8b0             tst.l     -$1750(a5)
  002c72  670c                 beq.b     $2c80
  002c74  be6de860             cmp.w     -$17a0(a5), d7
  002c78  6706                 beq.b     $2c80
  002c7a  4eb9000040d6         jsr       $40d6.l   ; SATRELOADICONS
  002c80  3f2e0020             move.w    $20(a6), -(a7)
  002c84  3f2e001e             move.w    $1e(a6), -(a7)
  002c88  4eb900004484         jsr       $4484.l   ; SATSETUPOFFANDBACK
  002c8e  4a2de8b4             tst.b     -$174c(a5)
  002c92  6700013c             beq.w     $2dd0
  002c96  594f                 subq.w    #$4, a7
  002c98  2f2df6de             move.l    -$922(a5), -(a7)
  002c9c  3f3c0001             move.w    #$1, -(a7)
  002ca0  a81f                 _Get1Resource 
  002ca2  205f                 movea.l   (a7)+, a0
  002ca4  2f08                 move.l    a0, -(a7)
  002ca6  486de8b6             pea.l     -$174a(a5)
  002caa  2f0e                 move.l    a6, -(a7)
  002cac  4ebaf738             jsr       $23e6(pc)   ; SetRectBlit0
  002cb0  594f                 subq.w    #$4, a7
  002cb2  2f2df6e2             move.l    -$91e(a5), -(a7)
  002cb6  3f3c0001             move.w    #$1, -(a7)
  002cba  a81f                 _Get1Resource 
  002cbc  205f                 movea.l   (a7)+, a0
  002cbe  2f08                 move.l    a0, -(a7)
  002cc0  486de8ba             pea.l     -$1746(a5)
  002cc4  2f0e                 move.l    a6, -(a7)
  002cc6  4ebaf774             jsr       $243c(pc)   ; SetMaskBlit1
  002cca  594f                 subq.w    #$4, a7
  002ccc  2f2df6de             move.l    -$922(a5), -(a7)
  002cd0  3f3c0002             move.w    #$2, -(a7)
  002cd4  a81f                 _Get1Resource 
  002cd6  205f                 movea.l   (a7)+, a0
  002cd8  2f08                 move.l    a0, -(a7)
  002cda  486de8be             pea.l     -$1742(a5)
  002cde  2f0e                 move.l    a6, -(a7)
  002ce0  4ebaf704             jsr       $23e6(pc)   ; SetRectBlit0
  002ce4  594f                 subq.w    #$4, a7
  002ce6  2f2df6e2             move.l    -$91e(a5), -(a7)
  002cea  3f3c0002             move.w    #$2, -(a7)
  002cee  a81f                 _Get1Resource 
  002cf0  205f                 movea.l   (a7)+, a0
  002cf2  2f08                 move.l    a0, -(a7)
  002cf4  486de8c2             pea.l     -$173e(a5)
  002cf8  2f0e                 move.l    a6, -(a7)
  002cfa  4ebaf740             jsr       $243c(pc)   ; SetMaskBlit1
  002cfe  594f                 subq.w    #$4, a7
  002d00  2f2df6de             move.l    -$922(a5), -(a7)
  002d04  3f3c0004             move.w    #$4, -(a7)
  002d08  a81f                 _Get1Resource 
  002d0a  205f                 movea.l   (a7)+, a0
  002d0c  2f08                 move.l    a0, -(a7)
  002d0e  486de8c6             pea.l     -$173a(a5)
  002d12  2f0e                 move.l    a6, -(a7)
  002d14  4ebaf6d0             jsr       $23e6(pc)   ; SetRectBlit0
  002d18  594f                 subq.w    #$4, a7
  002d1a  2f2df6e2             move.l    -$91e(a5), -(a7)
  002d1e  3f3c0004             move.w    #$4, -(a7)
  002d22  a81f                 _Get1Resource 
  002d24  205f                 movea.l   (a7)+, a0
  002d26  2f08                 move.l    a0, -(a7)
  002d28  486de8ca             pea.l     -$1736(a5)
  002d2c  2f0e                 move.l    a6, -(a7)
  002d2e  4ebaf70c             jsr       $243c(pc)   ; SetMaskBlit1
  002d32  594f                 subq.w    #$4, a7
  002d34  2f2df6de             move.l    -$922(a5), -(a7)
  002d38  3f3c0008             move.w    #$8, -(a7)
  002d3c  a81f                 _Get1Resource 
  002d3e  205f                 movea.l   (a7)+, a0
  002d40  2f08                 move.l    a0, -(a7)
  002d42  486de8ce             pea.l     -$1732(a5)
  002d46  2f0e                 move.l    a6, -(a7)
  002d48  4ebaf69c             jsr       $23e6(pc)   ; SetRectBlit0
  002d4c  594f                 subq.w    #$4, a7
  002d4e  2f2df6e2             move.l    -$91e(a5), -(a7)
  002d52  3f3c0008             move.w    #$8, -(a7)
  002d56  a81f                 _Get1Resource 
  002d58  205f                 movea.l   (a7)+, a0
  002d5a  2f08                 move.l    a0, -(a7)
  002d5c  486de8d2             pea.l     -$172e(a5)
  002d60  2f0e                 move.l    a6, -(a7)
  002d62  4ebaf6d8             jsr       $243c(pc)   ; SetMaskBlit1
  002d66  594f                 subq.w    #$4, a7
  002d68  2f2df6de             move.l    -$922(a5), -(a7)
  002d6c  3f3c0010             move.w    #$10, -(a7)
  002d70  a81f                 _Get1Resource 
  002d72  205f                 movea.l   (a7)+, a0
  002d74  2f08                 move.l    a0, -(a7)
  002d76  486de8d6             pea.l     -$172a(a5)
  002d7a  2f0e                 move.l    a6, -(a7)
  002d7c  4ebaf668             jsr       $23e6(pc)   ; SetRectBlit0
  002d80  594f                 subq.w    #$4, a7
  002d82  2f2df6e2             move.l    -$91e(a5), -(a7)
  002d86  3f3c0010             move.w    #$10, -(a7)
  002d8a  a81f                 _Get1Resource 
  002d8c  205f                 movea.l   (a7)+, a0
  002d8e  2f08                 move.l    a0, -(a7)
  002d90  486de8da             pea.l     -$1726(a5)
  002d94  2f0e                 move.l    a6, -(a7)
  002d96  4ebaf6a4             jsr       $243c(pc)   ; SetMaskBlit1
  002d9a  594f                 subq.w    #$4, a7
  002d9c  2f2df6de             move.l    -$922(a5), -(a7)
  002da0  3f3c0020             move.w    #$20, -(a7)
  002da4  a81f                 _Get1Resource 
  002da6  205f                 movea.l   (a7)+, a0
  002da8  2f08                 move.l    a0, -(a7)
  002daa  486de8de             pea.l     -$1722(a5)
  002dae  2f0e                 move.l    a6, -(a7)
  002db0  4ebaf634             jsr       $23e6(pc)   ; SetRectBlit0
  002db4  594f                 subq.w    #$4, a7
  002db6  2f2df6e2             move.l    -$91e(a5), -(a7)
  002dba  3f3c0020             move.w    #$20, -(a7)
  002dbe  a81f                 _Get1Resource 
  002dc0  205f                 movea.l   (a7)+, a0
  002dc2  2f08                 move.l    a0, -(a7)
  002dc4  486de8e2             pea.l     -$171e(a5)
  002dc8  2f0e                 move.l    a6, -(a7)
  002dca  4ebaf670             jsr       $243c(pc)   ; SetMaskBlit1
  002dce  6030                 bra.b     $2e00
  002dd0  594f                 subq.w    #$4, a7
  002dd2  2f2df6de             move.l    -$922(a5), -(a7)
  002dd6  4267                 clr.w     -(a7)
  002dd8  a81f                 _Get1Resource 
  002dda  205f                 movea.l   (a7)+, a0
  002ddc  2f08                 move.l    a0, -(a7)
  002dde  486de8b6             pea.l     -$174a(a5)
  002de2  2f0e                 move.l    a6, -(a7)
  002de4  4ebaf600             jsr       $23e6(pc)   ; SetRectBlit0
  002de8  594f                 subq.w    #$4, a7
  002dea  2f2df6e2             move.l    -$91e(a5), -(a7)
  002dee  4267                 clr.w     -(a7)
  002df0  a81f                 _Get1Resource 
  002df2  205f                 movea.l   (a7)+, a0
  002df4  2f08                 move.l    a0, -(a7)
  002df6  486de8ba             pea.l     -$1746(a5)
  002dfa  2f0e                 move.l    a6, -(a7)
  002dfc  4ebaf63e             jsr       $243c(pc)   ; SetMaskBlit1
  002e00  4eb90000418a         jsr       $418a.l   ; SATSETUPBLITTERS
  002e06  486effb6             pea.l     -$4a(a6)
  002e0a  4eb900004278         jsr       $4278.l   ; SATSETPORT
  002e10  4cdf0cf8             movem.l   (a7)+, d3-d7/a2-a3
  002e14  4e5e                 unlk      a6
  002e16  205f                 movea.l   (a7)+, a0
  002e18  4fef001a             lea.l     $1a(a7), a7
  002e1c  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATINITEMPTY   (seg 7 +002e2e, 50 bytes)
  002e2e  4e56fff8             link.w    a6, #$fff8
  002e32  486efff8             pea.l     -$8(a6)
  002e36  42a7                 clr.l     -(a7)
  002e38  42a7                 clr.l     -(a7)
  002e3a  a8a7                 _SetRect  
  002e3c  42a7                 clr.l     -(a7)
  002e3e  486efff8             pea.l     -$8(a6)
  002e42  48780000             pea.l     $0.w
  002e46  48780000             pea.l     $0.w
  002e4a  4227                 clr.b     -(a7)
  002e4c  1f3c0001             move.b    #$1, -(a7)
  002e50  4227                 clr.b     -(a7)
  002e52  4227                 clr.b     -(a7)
  002e54  1f3c0001             move.b    #$1, -(a7)
  002e58  4ebaf638             jsr       $2492(pc)   ; SATCUSTOMINIT
  002e5c  4e5e                 unlk      a6
  002e5e  4e75                 rts       

;-------------------------------------------------------------
; SATINSTALLSYNCH   (seg 7 +002e70, 16 bytes)
  002e70  4e560000             link.w    a6, #$0
  002e74  2b6e0008e862         move.l    $8(a6), -$179e(a5)
  002e7a  4e5e                 unlk      a6
  002e7c  2e9f                 move.l    (a7)+, (a7)
  002e7e  4e75                 rts       

;-------------------------------------------------------------
; SATMAKEROWLIST   (seg 7 +002e92, 192 bytes)
  002e92  4e56fff8             link.w    a6, #$fff8
  002e96  48e71e20             movem.l   d3-d6/a2, -(a7)
  002e9a  3a2e000e             move.w    $e(a6), d5
  002e9e  246e000a             movea.l   $a(a6), a2
  002ea2  206e0014             movea.l   $14(a6), a0
  002ea6  2d50fff8             move.l    (a0), -$8(a6)
  002eaa  2d680004fffc         move.l    $4(a0), -$4(a6)
  002eb0  4a92                 tst.l     (a2)
  002eb2  6706                 beq.b     $2eba
  002eb4  2f12                 move.l    (a2), -(a7)
  002eb6  205f                 movea.l   (a7)+, a0
  002eb8  a01f                 _DisposePtr 
  002eba  594f                 subq.w    #$4, a7
  002ebc  302efffc             move.w    -$4(a6), d0
  002ec0  906efff8             sub.w     -$8(a6), d0
  002ec4  48c0                 ext.l     d0
  002ec6  e588                 lsl.l     #$2, d0
  002ec8  2f00                 move.l    d0, -(a7)
  002eca  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  002ed0  205f                 movea.l   (a7)+, a0
  002ed2  2488                 move.l    a0, (a2)
  002ed4  4a92                 tst.l     (a2)
  002ed6  676c                 beq.b     $2f44
  002ed8  302efffa             move.w    -$6(a6), d0
  002edc  c1ee0008             muls.w    $8(a6), d0
  002ee0  48c0                 ext.l     d0
  002ee2  2200                 move.l    d0, d1
  002ee4  e481                 asr.l     #$2, d1
  002ee6  e089                 lsr.l     #$8, d1
  002ee8  e089                 lsr.l     #$8, d1
  002eea  e089                 lsr.l     #$8, d1
  002eec  ea89                 lsr.l     #$5, d1
  002eee  d280                 add.l     d0, d1
  002ef0  e681                 asr.l     #$3, d1
  002ef2  3005                 move.w    d5, d0
  002ef4  c1eefff8             muls.w    -$8(a6), d0
  002ef8  d0ae0010             add.l     $10(a6), d0
  002efc  d081                 add.l     d1, d0
  002efe  2052                 movea.l   (a2), a0
  002f00  2080                 move.l    d0, (a0)
  002f02  7c01                 moveq     #$1, d6
  002f04  dc6efff8             add.w     -$8(a6), d6
  002f08  382efffc             move.w    -$4(a6), d4
  002f0c  5344                 subq.w    #$1, d4
  002f0e  3606                 move.w    d6, d3
  002f10  602e                 bra.b     $2f40
  002f12  3045                 movea.w   d5, a0
  002f14  3003                 move.w    d3, d0
  002f16  906efff8             sub.w     -$8(a6), d0
  002f1a  5340                 subq.w    #$1, d0
  002f1c  48c0                 ext.l     d0
  002f1e  e588                 lsl.l     #$2, d0
  002f20  2252                 movea.l   (a2), a1
  002f22  20310800             move.l    (a1, d0.l), d0
  002f26  d088                 add.l     a0, d0
  002f28  3203                 move.w    d3, d1
  002f2a  926efff8             sub.w     -$8(a6), d1
  002f2e  48c1                 ext.l     d1
  002f30  e589                 lsl.l     #$2, d1
  002f32  2052                 movea.l   (a2), a0
  002f34  21801800             move.l    d0, (a0, d1.l)
  002f38  0c437fff             cmpi.w    #$7fff, d3
  002f3c  6706                 beq.b     $2f44
  002f3e  5243                 addq.w    #$1, d3
  002f40  b644                 cmp.w     d4, d3
  002f42  6fce                 ble.b     $2f12
  002f44  4cdf0478             movem.l   (a7)+, d3-d6/a2
  002f48  4e5e                 unlk      a6
  002f4a  205f                 movea.l   (a7)+, a0
  002f4c  4fef0010             lea.l     $10(a7), a7
  002f50  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATMAKEOFFSCREEN   (seg 7 +002f64, 616 bytes)
  002f64  4e56fffc             link.w    a6, #$fffc
  002f68  48e71038             movem.l   d3/a2-a4, -(a7)
  002f6c  246e000c             movea.l   $c(a6), a2
  002f70  266e0008             movea.l   $8(a6), a3
  002f74  4a2de8b4             tst.b     -$174c(a5)
  002f78  6708                 beq.b     $2f82
  002f7a  594f                 subq.w    #$4, a7
  002f7c  aa32                 _GetGDevice 
  002f7e  205f                 movea.l   (a7)+, a0
  002f80  2848                 movea.l   a0, a4
  002f82  486efffc             pea.l     -$4(a6)
  002f86  a874                 _GetPort  
  002f88  42aa0008             clr.l     $8(a2)
  002f8c  4a2de8b4             tst.b     -$174c(a5)
  002f90  67000134             beq.w     $30c6
  002f94  4aade7f2             tst.l     -$180e(a5)
  002f98  660a                 bne.b     $2fa4
  002f9a  486df9ee             pea.l     -$612(a5)
  002f9e  4eb900001d5e         jsr       $1d5e.l   ; BAILOUT
  002fa4  206de7f2             movea.l   -$180e(a5), a0
  002fa8  2050                 movea.l   (a0), a0
  002faa  20680016             movea.l   $16(a0), a0
  002fae  2050                 movea.l   (a0), a0
  002fb0  2628002a             move.l    $2a(a0), d3
  002fb4  554f                 subq.w    #$2, a7
  002fb6  2f0b                 move.l    a3, -(a7)
  002fb8  206de7f2             movea.l   -$180e(a5), a0
  002fbc  2050                 movea.l   (a0), a0
  002fbe  20680016             movea.l   $16(a0), a0
  002fc2  2050                 movea.l   (a0), a0
  002fc4  3f280020             move.w    $20(a0), -(a7)
  002fc8  2f03                 move.l    d3, -(a7)
  002fca  2f0a                 move.l    a2, -(a7)
  002fcc  486a0004             pea.l     $4(a2)
  002fd0  4eb9000018c2         jsr       $18c2.l   ; CREATEOFFSCREEN
  002fd6  301f                 move.w    (a7)+, d0
  002fd8  670a                 beq.b     $2fe4
  002fda  486df8ee             pea.l     -$712(a5)
  002fde  4eb900001d5e         jsr       $1d5e.l   ; BAILOUT
  002fe4  2052                 movea.l   (a2), a0
  002fe6  2f280002             move.l    $2(a0), -(a7)
  002fea  205f                 movea.l   (a7)+, a0
  002fec  a064                 _MoveHHi  
  002fee  2052                 movea.l   (a2), a0
  002ff0  2f280002             move.l    $2(a0), -(a7)
  002ff4  205f                 movea.l   (a7)+, a0
  002ff6  a029                 _HLock    
  002ff8  594f                 subq.w    #$4, a7
  002ffa  2052                 movea.l   (a2), a0
  002ffc  20680002             movea.l   $2(a0), a0
  003000  2f10                 move.l    (a0), -(a7)
  003002  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  003008  205f                 movea.l   (a7)+, a0
  00300a  2252                 movea.l   (a2), a1
  00300c  22690002             movea.l   $2(a1), a1
  003010  2288                 move.l    a0, (a1)
  003012  594f                 subq.w    #$4, a7
  003014  206a0004             movea.l   $4(a2), a0
  003018  2f10                 move.l    (a0), -(a7)
  00301a  4eb9000003f0         jsr       $3f0.l   ; seg4+a04
  003020  205f                 movea.l   (a7)+, a0
  003022  226a0004             movea.l   $4(a2), a1
  003026  2288                 move.l    a0, (a1)
  003028  554f                 subq.w    #$2, a7
  00302a  3eb80220             move.w    $220.w, (a7)
  00302e  301f                 move.w    (a7)+, d0
  003030  670a                 beq.b     $303c
  003032  486df8ee             pea.l     -$712(a5)
  003036  4eb900001d5e         jsr       $1d5e.l   ; BAILOUT
  00303c  2f0c                 move.l    a4, -(a7)
  00303e  aa31                 _SetGDevice 
  003040  2f2efffc             move.l    -$4(a6), -(a7)
  003044  a873                 _SetPort  
  003046  206a0004             movea.l   $4(a2), a0
  00304a  2050                 movea.l   (a0), a0
  00304c  20680016             movea.l   $16(a0), a0
  003050  2050                 movea.l   (a0), a0
  003052  25500014             move.l    (a0), $14(a2)
  003056  2052                 movea.l   (a2), a0
  003058  25680010000c         move.l    $10(a0), $c(a2)
  00305e  256800140010         move.l    $14(a0), $10(a2)
  003064  594f                 subq.w    #$4, a7
  003066  206a0004             movea.l   $4(a2), a0
  00306a  2050                 movea.l   (a0), a0
  00306c  20680016             movea.l   $16(a0), a0
  003070  2050                 movea.l   (a0), a0
  003072  32680004             movea.w   $4(a0), a1
  003076  2f09                 move.l    a1, -(a7)
  003078  48783fff             pea.l     $3fff.w
  00307c  a858                 _BitAnd   
  00307e  201f                 move.l    (a7)+, d0
  003080  35400018             move.w    d0, $18(a2)
  003084  2652                 movea.l   (a2), a3
  003086  486b0010             pea.l     $10(a3)
  00308a  206b0002             movea.l   $2(a3), a0
  00308e  2050                 movea.l   (a0), a0
  003090  2f10                 move.l    (a0), -(a7)
  003092  594f                 subq.w    #$4, a7
  003094  206b0002             movea.l   $2(a3), a0
  003098  2050                 movea.l   (a0), a0
  00309a  32680004             movea.w   $4(a0), a1
  00309e  2f09                 move.l    a1, -(a7)
  0030a0  48783fff             pea.l     $3fff.w
  0030a4  a858                 _BitAnd   
  0030a6  201f                 move.l    (a7)+, d0
  0030a8  3f00                 move.w    d0, -(a7)
  0030aa  486a0008             pea.l     $8(a2)
  0030ae  206de7f2             movea.l   -$180e(a5), a0
  0030b2  2050                 movea.l   (a0), a0
  0030b4  20680016             movea.l   $16(a0), a0
  0030b8  2050                 movea.l   (a0), a0
  0030ba  3f280020             move.w    $20(a0), -(a7)
  0030be  4ebafdd2             jsr       $2e92(pc)   ; SATMAKEROWLIST
  0030c2  600000fc             bra.w     $31c0
  0030c6  42aa0004             clr.l     $4(a2)
  0030ca  594f                 subq.w    #$4, a7
  0030cc  4878006c             pea.l     $6c.w
  0030d0  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  0030d6  205f                 movea.l   (a7)+, a0
  0030d8  2488                 move.l    a0, (a2)
  0030da  2f12                 move.l    (a2), -(a7)
  0030dc  a86f                 _OpenPort 
  0030de  2052                 movea.l   (a2), a0
  0030e0  21530010             move.l    (a3), $10(a0)
  0030e4  216b00040014         move.l    $4(a3), $14(a0)
  0030ea  2052                 movea.l   (a2), a0
  0030ec  2252                 movea.l   (a2), a1
  0030ee  236800100008         move.l    $10(a0), $8(a1)
  0030f4  23680014000c         move.l    $14(a0), $c(a1)
  0030fa  2052                 movea.l   (a2), a0
  0030fc  2f280018             move.l    $18(a0), -(a7)
  003100  2f0b                 move.l    a3, -(a7)
  003102  a8df                 _RectRgn  
  003104  2f0b                 move.l    a3, -(a7)
  003106  a87b                 _ClipRect 
  003108  2052                 movea.l   (a2), a0
  00310a  2252                 movea.l   (a2), a1
  00310c  30290016             move.w    $16(a1), d0
  003110  90680012             sub.w     $12(a0), d0
  003114  0640001f             addi.w    #$1f, d0
  003118  48c0                 ext.l     d0
  00311a  2200                 move.l    d0, d1
  00311c  e881                 asr.l     #$4, d1
  00311e  e089                 lsr.l     #$8, d1
  003120  e089                 lsr.l     #$8, d1
  003122  e089                 lsr.l     #$8, d1
  003124  e689                 lsr.l     #$3, d1
  003126  d280                 add.l     d0, d1
  003128  ea81                 asr.l     #$5, d1
  00312a  7004                 moveq     #$4, d0
  00312c  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  003132  2052                 movea.l   (a2), a0
  003134  31400006             move.w    d0, $6(a0)
  003138  594f                 subq.w    #$4, a7
  00313a  2052                 movea.l   (a2), a0
  00313c  2252                 movea.l   (a2), a1
  00313e  30280006             move.w    $6(a0), d0
  003142  2052                 movea.l   (a2), a0
  003144  32280014             move.w    $14(a0), d1
  003148  92690010             sub.w     $10(a1), d1
  00314c  c3c0                 muls.w    d0, d1
  00314e  5881                 addq.l    #$4, d1
  003150  2f01                 move.l    d1, -(a7)
  003152  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003158  205f                 movea.l   (a7)+, a0
  00315a  2252                 movea.l   (a2), a1
  00315c  23480002             move.l    a0, $2(a1)
  003160  2052                 movea.l   (a2), a0
  003162  4aa80002             tst.l     $2(a0)
  003166  670e                 beq.b     $3176
  003168  2052                 movea.l   (a2), a0
  00316a  7004                 moveq     #$4, d0
  00316c  d0a80002             add.l     $2(a0), d0
  003170  2052                 movea.l   (a2), a0
  003172  21400002             move.l    d0, $2(a0)
  003176  2f12                 move.l    (a2), -(a7)
  003178  a873                 _SetPort  
  00317a  2052                 movea.l   (a2), a0
  00317c  48680010             pea.l     $10(a0)
  003180  a8a3                 _EraseRect 
  003182  2052                 movea.l   (a2), a0
  003184  256800020014         move.l    $2(a0), $14(a2)
  00318a  2052                 movea.l   (a2), a0
  00318c  25680010000c         move.l    $10(a0), $c(a2)
  003192  256800140010         move.l    $14(a0), $10(a2)
  003198  2052                 movea.l   (a2), a0
  00319a  356800060018         move.w    $6(a0), $18(a2)
  0031a0  2652                 movea.l   (a2), a3
  0031a2  486b0010             pea.l     $10(a3)
  0031a6  2f2b0002             move.l    $2(a3), -(a7)
  0031aa  3f2b0006             move.w    $6(a3), -(a7)
  0031ae  486a0008             pea.l     $8(a2)
  0031b2  3f2de860             move.w    -$17a0(a5), -(a7)
  0031b6  4ebafcda             jsr       $2e92(pc)   ; SATMAKEROWLIST
  0031ba  2f2efffc             move.l    -$4(a6), -(a7)
  0031be  a873                 _SetPort  
  0031c0  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  0031c4  4e5e                 unlk      a6
  0031c6  205f                 movea.l   (a7)+, a0
  0031c8  504f                 addq.w    #$8, a7
  0031ca  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; GETROWBYTESDEV   (seg 7 +0031e0, 98 bytes)
  0031e0  4e560000             link.w    a6, #$0
  0031e4  4a2de8b4             tst.b     -$174c(a5)
  0031e8  6732                 beq.b     $321c
  0031ea  594f                 subq.w    #$4, a7
  0031ec  48788000             pea.l     $8000.w
  0031f0  206de7f2             movea.l   -$180e(a5), a0
  0031f4  2050                 movea.l   (a0), a0
  0031f6  20680016             movea.l   $16(a0), a0
  0031fa  2050                 movea.l   (a0), a0
  0031fc  302e0008             move.w    $8(a6), d0
  003200  c1e80020             muls.w    $20(a0), d0
  003204  0640001f             addi.w    #$1f, d0
  003208  7200                 moveq     #$0, d1
  00320a  3200                 move.w    d0, d1
  00320c  ea89                 lsr.l     #$5, d1
  00320e  e589                 lsl.l     #$2, d1
  003210  2f01                 move.l    d1, -(a7)
  003212  a85b                 _BitOr    
  003214  201f                 move.l    (a7)+, d0
  003216  3d40000a             move.w    d0, $a(a6)
  00321a  601e                 bra.b     $323a
  00321c  594f                 subq.w    #$4, a7
  00321e  48788000             pea.l     $8000.w
  003222  701f                 moveq     #$1f, d0
  003224  d06e0008             add.w     $8(a6), d0
  003228  7200                 moveq     #$0, d1
  00322a  3200                 move.w    d0, d1
  00322c  ea89                 lsr.l     #$5, d1
  00322e  e589                 lsl.l     #$2, d1
  003230  2f01                 move.l    d1, -(a7)
  003232  a85b                 _BitOr    
  003234  201f                 move.l    (a7)+, d0
  003236  3d40000a             move.w    d0, $a(a6)
  00323a  4e5e                 unlk      a6
  00323c  205f                 movea.l   (a7)+, a0
  00323e  544f                 addq.w    #$2, a7
  003240  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; GETROWBYTES2DEV   (seg 7 +003254, 74 bytes)
  003254  4e560000             link.w    a6, #$0
  003258  4a2de8b4             tst.b     -$174c(a5)
  00325c  6726                 beq.b     $3284
  00325e  206de7f2             movea.l   -$180e(a5), a0
  003262  2050                 movea.l   (a0), a0
  003264  20680016             movea.l   $16(a0), a0
  003268  2050                 movea.l   (a0), a0
  00326a  302e0008             move.w    $8(a6), d0
  00326e  c1e80020             muls.w    $20(a0), d0
  003272  0640001f             addi.w    #$1f, d0
  003276  7200                 moveq     #$0, d1
  003278  3200                 move.w    d0, d1
  00327a  ea89                 lsr.l     #$5, d1
  00327c  e589                 lsl.l     #$2, d1
  00327e  3d41000a             move.w    d1, $a(a6)
  003282  6012                 bra.b     $3296
  003284  701f                 moveq     #$1f, d0
  003286  d06e0008             add.w     $8(a6), d0
  00328a  7200                 moveq     #$0, d1
  00328c  3200                 move.w    d0, d1
  00328e  ea89                 lsr.l     #$5, d1
  003290  e589                 lsl.l     #$2, d1
  003292  3d41000a             move.w    d1, $a(a6)
  003296  4e5e                 unlk      a6
  003298  205f                 movea.l   (a7)+, a0
  00329a  544f                 addq.w    #$2, a7
  00329c  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATINITDITHER   (seg 7 +0032b0, 112 bytes)
  0032b0  4e56fff6             link.w    a6, #$fff6
  0032b4  2f0a                 move.l    a2, -(a7)
  0032b6  4aade870             tst.l     -$1790(a5)
  0032ba  670e                 beq.b     $32ca
  0032bc  2f2de870             move.l    -$1790(a5), -(a7)
  0032c0  2f2de874             move.l    -$178c(a5), -(a7)
  0032c4  4eb900001ad6         jsr       $1ad6.l   ; DISPOSEOFFSCREEN
  0032ca  594f                 subq.w    #$4, a7
  0032cc  3f3c0008             move.w    #$8, -(a7)
  0032d0  aa18                 _GetCTable 
  0032d2  205f                 movea.l   (a7)+, a0
  0032d4  2448                 movea.l   a0, a2
  0032d6  200a                 move.l    a2, d0
  0032d8  6606                 bne.b     $32e0
  0032da  42ade870             clr.l     -$1790(a5)
  0032de  603a                 bra.b     $331a
  0032e0  206de878             movea.l   -$1788(a5), a0
  0032e4  2d680010fff8         move.l    $10(a0), -$8(a6)
  0032ea  2d680014fffc         move.l    $14(a0), -$4(a6)
  0032f0  554f                 subq.w    #$2, a7
  0032f2  486efff8             pea.l     -$8(a6)
  0032f6  3f3c0008             move.w    #$8, -(a7)
  0032fa  2f0a                 move.l    a2, -(a7)
  0032fc  486de870             pea.l     -$1790(a5)
  003300  486de874             pea.l     -$178c(a5)
  003304  4eb9000018c2         jsr       $18c2.l   ; CREATEOFFSCREEN
  00330a  301f                 move.w    (a7)+, d0
  00330c  3d40fff6             move.w    d0, -$a(a6)
  003310  4a6efff6             tst.w     -$a(a6)
  003314  6704                 beq.b     $331a
  003316  42ade870             clr.l     -$1790(a5)
  00331a  245f                 movea.l   (a7)+, a2
  00331c  4e5e                 unlk      a6
  00331e  4e75                 rts       

;-------------------------------------------------------------
; DITHERICON   (seg 7 +003330, 176 bytes)
  003330  4e56fff8             link.w    a6, #$fff8
  003334  2f0a                 move.l    a2, -(a7)
  003336  246e0008             movea.l   $8(a6), a2
  00333a  486efffc             pea.l     -$4(a6)
  00333e  a874                 _GetPort  
  003340  594f                 subq.w    #$4, a7
  003342  aa32                 _GetGDevice 
  003344  205f                 movea.l   (a7)+, a0
  003346  2d48fff8             move.l    a0, -$8(a6)
  00334a  4aade870             tst.l     -$1790(a5)
  00334e  6606                 bne.b     $3356
  003350  4ebaff5e             jsr       $32b0(pc)   ; SATINITDITHER
  003354  6030                 bra.b     $3386
  003356  206de878             movea.l   -$1788(a5), a0
  00335a  226de870             movea.l   -$1790(a5), a1
  00335e  30290014             move.w    $14(a1), d0
  003362  b0680014             cmp.w     $14(a0), d0
  003366  5dc0                 slt.b     d0
  003368  4400                 neg.b     d0
  00336a  206de878             movea.l   -$1788(a5), a0
  00336e  226de870             movea.l   -$1790(a5), a1
  003372  32290016             move.w    $16(a1), d1
  003376  b2680016             cmp.w     $16(a0), d1
  00337a  5dc1                 slt.b     d1
  00337c  4401                 neg.b     d1
  00337e  8200                 or.b      d0, d1
  003380  6704                 beq.b     $3386
  003382  4ebaff2c             jsr       $32b0(pc)   ; SATINITDITHER
  003386  2f0a                 move.l    a2, -(a7)
  003388  2f2de870             move.l    -$1790(a5), -(a7)
  00338c  2f2de874             move.l    -$178c(a5), -(a7)
  003390  2052                 movea.l   (a2), a0
  003392  48680046             pea.l     $46(a0)
  003396  4eb9000036ae         jsr       $36ae.l   ; SATPLOTCICN
  00339c  486de878             pea.l     -$1788(a5)
  0033a0  4eb900004278         jsr       $4278.l   ; SATSETPORT
  0033a6  206de870             movea.l   -$1790(a5), a0
  0033aa  48680002             pea.l     $2(a0)
  0033ae  206de878             movea.l   -$1788(a5), a0
  0033b2  48680002             pea.l     $2(a0)
  0033b6  2052                 movea.l   (a2), a0
  0033b8  48680046             pea.l     $46(a0)
  0033bc  2052                 movea.l   (a2), a0
  0033be  48680046             pea.l     $46(a0)
  0033c2  3f3c0040             move.w    #$40, -(a7)
  0033c6  48780000             pea.l     $0.w
  0033ca  a8ec                 _CopyBits 
  0033cc  2f2efffc             move.l    -$4(a6), -(a7)
  0033d0  a873                 _SetPort  
  0033d2  2f2efff8             move.l    -$8(a6), -(a7)
  0033d6  aa31                 _SetGDevice 
  0033d8  245f                 movea.l   (a7)+, a2
  0033da  4e5e                 unlk      a6
  0033dc  2e9f                 move.l    (a7)+, (a7)
  0033de  4e75                 rts       

;-------------------------------------------------------------
; COPYBMAP   (seg 7 +0033ee, 406 bytes)
  0033ee  4e560000             link.w    a6, #$0
  0033f2  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  0033f6  286e000c             movea.l   $c(a6), a4
  0033fa  282e0008             move.l    $8(a6), d4
  0033fe  2044                 movea.l   d4, a0
  003400  4a90                 tst.l     (a0)
  003402  6708                 beq.b     $340c
  003404  2044                 movea.l   d4, a0
  003406  2f10                 move.l    (a0), -(a7)
  003408  205f                 movea.l   (a7)+, a0
  00340a  a01f                 _DisposePtr 
  00340c  2044                 movea.l   d4, a0
  00340e  4290                 clr.l     (a0)
  003410  0c6c00010004         cmpi.w    #$1, $4(a4)
  003416  5ec0                 sgt.b     d0
  003418  4400                 neg.b     d0
  00341a  802de8b4             or.b      -$174c(a5), d0
  00341e  6742                 beq.b     $3462
  003420  244c                 movea.l   a4, a2
  003422  362a000a             move.w    $a(a2), d3
  003426  966a0006             sub.w     $6(a2), d3
  00342a  c7ea0004             muls.w    $4(a2), d3
  00342e  2f0c                 move.l    a4, -(a7)
  003430  2f04                 move.l    d4, -(a7)
  003432  4878000e             pea.l     $e.w
  003436  201f                 move.l    (a7)+, d0
  003438  225f                 movea.l   (a7)+, a1
  00343a  205f                 movea.l   (a7)+, a0
  00343c  a02e                 _BlockMove 
  00343e  594f                 subq.w    #$4, a7
  003440  2f03                 move.l    d3, -(a7)
  003442  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003448  205f                 movea.l   (a7)+, a0
  00344a  2244                 movea.l   d4, a1
  00344c  2288                 move.l    a0, (a1)
  00344e  2f14                 move.l    (a4), -(a7)
  003450  2044                 movea.l   d4, a0
  003452  2f10                 move.l    (a0), -(a7)
  003454  2f03                 move.l    d3, -(a7)
  003456  201f                 move.l    (a7)+, d0
  003458  225f                 movea.l   (a7)+, a1
  00345a  205f                 movea.l   (a7)+, a0
  00345c  a02e                 _BlockMove 
  00345e  6000008c             bra.w     $34ec
  003462  2444                 movea.l   d4, a2
  003464  256c00060006         move.l    $6(a4), $6(a2)
  00346a  256c000a000a         move.l    $a(a4), $a(a2)
  003470  302a000c             move.w    $c(a2), d0
  003474  906a0008             sub.w     $8(a2), d0
  003478  0640000f             addi.w    #$f, d0
  00347c  48c0                 ext.l     d0
  00347e  2200                 move.l    d0, d1
  003480  e681                 asr.l     #$3, d1
  003482  e089                 lsr.l     #$8, d1
  003484  e089                 lsr.l     #$8, d1
  003486  e089                 lsr.l     #$8, d1
  003488  e889                 lsr.l     #$4, d1
  00348a  d280                 add.l     d0, d1
  00348c  e881                 asr.l     #$4, d1
  00348e  7002                 moveq     #$2, d0
  003490  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  003496  35400004             move.w    d0, $4(a2)
  00349a  594f                 subq.w    #$4, a7
  00349c  302a000a             move.w    $a(a2), d0
  0034a0  906a0006             sub.w     $6(a2), d0
  0034a4  c1ea0004             muls.w    $4(a2), d0
  0034a8  2f00                 move.l    d0, -(a7)
  0034aa  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  0034b0  205f                 movea.l   (a7)+, a0
  0034b2  2488                 move.l    a0, (a2)
  0034b4  244c                 movea.l   a4, a2
  0034b6  362a000a             move.w    $a(a2), d3
  0034ba  966a0006             sub.w     $6(a2), d3
  0034be  c7ea0004             muls.w    $4(a2), d3
  0034c2  2654                 movea.l   (a4), a3
  0034c4  2044                 movea.l   d4, a0
  0034c6  2450                 movea.l   (a0), a2
  0034c8  3a2c000a             move.w    $a(a4), d5
  0034cc  5345                 subq.w    #$1, d5
  0034ce  7600                 moveq     #$0, d3
  0034d0  6016                 bra.b     $34e8
  0034d2  1493                 move.b    (a3), (a2)
  0034d4  7001                 moveq     #$1, d0
  0034d6  d08b                 add.l     a3, d0
  0034d8  2640                 movea.l   d0, a3
  0034da  7002                 moveq     #$2, d0
  0034dc  d08a                 add.l     a2, d0
  0034de  2440                 movea.l   d0, a2
  0034e0  0c437fff             cmpi.w    #$7fff, d3
  0034e4  6706                 beq.b     $34ec
  0034e6  5243                 addq.w    #$1, d3
  0034e8  b645                 cmp.w     d5, d3
  0034ea  6fe6                 ble.b     $34d2
  0034ec  594f                 subq.w    #$4, a7
  0034ee  306c000c             movea.w   $c(a4), a0
  0034f2  2f08                 move.l    a0, -(a7)
  0034f4  48780007             pea.l     $7.w
  0034f8  a858                 _BitAnd   
  0034fa  201f                 move.l    (a7)+, d0
  0034fc  3a00                 move.w    d0, d5
  0034fe  4a45                 tst.w     d5
  003500  6776                 beq.b     $3578
  003502  244c                 movea.l   a4, a2
  003504  362a000a             move.w    $a(a2), d3
  003508  966a0006             sub.w     $6(a2), d3
  00350c  c7ea0004             muls.w    $4(a2), d3
  003510  306c0004             movea.w   $4(a4), a0
  003514  2014                 move.l    (a4), d0
  003516  d088                 add.l     a0, d0
  003518  5380                 subq.l    #$1, d0
  00351a  2640                 movea.l   d0, a3
  00351c  2044                 movea.l   d4, a0
  00351e  32680004             movea.w   $4(a0), a1
  003522  2044                 movea.l   d4, a0
  003524  2010                 move.l    (a0), d0
  003526  d089                 add.l     a1, d0
  003528  5380                 subq.l    #$1, d0
  00352a  2440                 movea.l   d0, a2
  00352c  7008                 moveq     #$8, d0
  00352e  9045                 sub.w     d5, d0
  003530  2c3c000000ff         move.l    #$ff, d6
  003536  e1ae                 lsl.l     d0, d6
  003538  3a2c000a             move.w    $a(a4), d5
  00353c  5345                 subq.w    #$1, d5
  00353e  7600                 moveq     #$0, d3
  003540  6032                 bra.b     $3574
  003542  594f                 subq.w    #$4, a7
  003544  1013                 move.b    (a3), d0
  003546  4880                 ext.w     d0
  003548  48c0                 ext.l     d0
  00354a  2f00                 move.l    d0, -(a7)
  00354c  3046                 movea.w   d6, a0
  00354e  2f08                 move.l    a0, -(a7)
  003550  a858                 _BitAnd   
  003552  201f                 move.l    (a7)+, d0
  003554  1480                 move.b    d0, (a2)
  003556  306c0004             movea.w   $4(a4), a0
  00355a  200b                 move.l    a3, d0
  00355c  d088                 add.l     a0, d0
  00355e  2640                 movea.l   d0, a3
  003560  2044                 movea.l   d4, a0
  003562  32680004             movea.w   $4(a0), a1
  003566  200a                 move.l    a2, d0
  003568  d089                 add.l     a1, d0
  00356a  2440                 movea.l   d0, a2
  00356c  0c437fff             cmpi.w    #$7fff, d3
  003570  6706                 beq.b     $3578
  003572  5243                 addq.w    #$1, d3
  003574  b645                 cmp.w     d5, d3
  003576  6fca                 ble.b     $3542
  003578  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  00357c  4e5e                 unlk      a6
  00357e  205f                 movea.l   (a7)+, a0
  003580  504f                 addq.w    #$8, a7
  003582  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; MAKEBMAP   (seg 7 +003590, 106 bytes)
  003590  4e56fff8             link.w    a6, #$fff8
  003594  2f0a                 move.l    a2, -(a7)
  003596  206e0008             movea.l   $8(a6), a0
  00359a  2d50fff8             move.l    (a0), -$8(a6)
  00359e  2d680004fffc         move.l    $4(a0), -$4(a6)
  0035a4  246e000c             movea.l   $c(a6), a2
  0035a8  256efff80006         move.l    -$8(a6), $6(a2)
  0035ae  256efffc000a         move.l    -$4(a6), $a(a2)
  0035b4  701f                 moveq     #$1f, d0
  0035b6  d06a000c             add.w     $c(a2), d0
  0035ba  48c0                 ext.l     d0
  0035bc  2200                 move.l    d0, d1
  0035be  e881                 asr.l     #$4, d1
  0035c0  e089                 lsr.l     #$8, d1
  0035c2  e089                 lsr.l     #$8, d1
  0035c4  e089                 lsr.l     #$8, d1
  0035c6  e689                 lsr.l     #$3, d1
  0035c8  d280                 add.l     d0, d1
  0035ca  ea81                 asr.l     #$5, d1
  0035cc  7004                 moveq     #$4, d0
  0035ce  4eb9000004d2         jsr       $4d2.l   ; seg1+4d2
  0035d4  35400004             move.w    d0, $4(a2)
  0035d8  594f                 subq.w    #$4, a7
  0035da  302a0004             move.w    $4(a2), d0
  0035de  c1ea000a             muls.w    $a(a2), d0
  0035e2  48c0                 ext.l     d0
  0035e4  2f00                 move.l    d0, -(a7)
  0035e6  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  0035ec  205f                 movea.l   (a7)+, a0
  0035ee  2488                 move.l    a0, (a2)
  0035f0  245f                 movea.l   (a7)+, a2
  0035f2  4e5e                 unlk      a6
  0035f4  205f                 movea.l   (a7)+, a0
  0035f6  504f                 addq.w    #$8, a7
  0035f8  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETCICN   (seg 7 +003606, 154 bytes)
  003606  4e560000             link.w    a6, #$0
  00360a  48e71030             movem.l   d3/a2-a3, -(a7)
  00360e  362e0008             move.w    $8(a6), d3
  003612  4a2de7e5             tst.b     -$181b(a5)
  003616  6606                 bne.b     $361e
  003618  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  00361e  4a2de8b4             tst.b     -$174c(a5)
  003622  671e                 beq.b     $3642
  003624  594f                 subq.w    #$4, a7
  003626  3f03                 move.w    d3, -(a7)
  003628  aa1e                 _GetCIcon 
  00362a  205f                 movea.l   (a7)+, a0
  00362c  2448                 movea.l   a0, a2
  00362e  594f                 subq.w    #$4, a7
  003630  2f2df6e6             move.l    -$91a(a5), -(a7)
  003634  3f03                 move.w    d3, -(a7)
  003636  a9a0                 _GetResource 
  003638  205f                 movea.l   (a7)+, a0
  00363a  2648                 movea.l   a0, a3
  00363c  2f0b                 move.l    a3, -(a7)
  00363e  a9a3                 _ReleaseResource 
  003640  604e                 bra.b     $3690
  003642  594f                 subq.w    #$4, a7
  003644  2f2df6e6             move.l    -$91a(a5), -(a7)
  003648  3f03                 move.w    d3, -(a7)
  00364a  a9a0                 _GetResource 
  00364c  205f                 movea.l   (a7)+, a0
  00364e  2448                 movea.l   a0, a2
  003650  200a                 move.l    a2, d0
  003652  673c                 beq.b     $3690
  003654  2f0a                 move.l    a2, -(a7)
  003656  205f                 movea.l   (a7)+, a0
  003658  a029                 _HLock    
  00365a  2f0a                 move.l    a2, -(a7)
  00365c  205f                 movea.l   (a7)+, a0
  00365e  a04a                 _HNoPurge 
  003660  2652                 movea.l   (a2), a3
  003662  47eb0040             lea.l     $40(a3), a3
  003666  362b000a             move.w    $a(a3), d3
  00366a  966b0006             sub.w     $6(a3), d3
  00366e  c7eb0004             muls.w    $4(a3), d3
  003672  3043                 movea.w   d3, a0
  003674  2252                 movea.l   (a2), a1
  003676  43e90052             lea.l     $52(a1), a1
  00367a  2009                 move.l    a1, d0
  00367c  d088                 add.l     a0, d0
  00367e  2052                 movea.l   (a2), a0
  003680  21400040             move.l    d0, $40(a0)
  003684  2052                 movea.l   (a2), a0
  003686  41e80052             lea.l     $52(a0), a0
  00368a  2252                 movea.l   (a2), a1
  00368c  23480032             move.l    a0, $32(a1)
  003690  2d4a000a             move.l    a2, $a(a6)
  003694  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  003698  4e5e                 unlk      a6
  00369a  205f                 movea.l   (a7)+, a0
  00369c  544f                 addq.w    #$2, a7
  00369e  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATPLOTCICN   (seg 7 +0036ae, 224 bytes)
  0036ae  4e56ffe0             link.w    a6, #$ffe0
  0036b2  48e71038             movem.l   d3/a2-a4, -(a7)
  0036b6  246e0014             movea.l   $14(a6), a2
  0036ba  266e0010             movea.l   $10(a6), a3
  0036be  262e000c             move.l    $c(a6), d3
  0036c2  286e0008             movea.l   $8(a6), a4
  0036c6  200a                 move.l    a2, d0
  0036c8  670000b6             beq.w     $3780
  0036cc  486efffc             pea.l     -$4(a6)
  0036d0  a874                 _GetPort  
  0036d2  200b                 move.l    a3, d0
  0036d4  6706                 beq.b     $36dc
  0036d6  2f0b                 move.l    a3, -(a7)
  0036d8  a873                 _SetPort  
  0036da  6004                 bra.b     $36e0
  0036dc  266efffc             movea.l   -$4(a6), a3
  0036e0  4a2de8b4             tst.b     -$174c(a5)
  0036e4  671c                 beq.b     $3702
  0036e6  594f                 subq.w    #$4, a7
  0036e8  aa32                 _GetGDevice 
  0036ea  205f                 movea.l   (a7)+, a0
  0036ec  2648                 movea.l   a0, a3
  0036ee  4a83                 tst.l     d3
  0036f0  6704                 beq.b     $36f6
  0036f2  2f03                 move.l    d3, -(a7)
  0036f4  aa31                 _SetGDevice 
  0036f6  2f0c                 move.l    a4, -(a7)
  0036f8  2f0a                 move.l    a2, -(a7)
  0036fa  aa1f                 _PlotCIcon 
  0036fc  2f0b                 move.l    a3, -(a7)
  0036fe  aa31                 _SetGDevice 
  003700  6078                 bra.b     $377a
  003702  2052                 movea.l   (a2), a0
  003704  0c6800010036         cmpi.w    #$1, $36(a0)
  00370a  6f22                 ble.b     $372e
  00370c  2052                 movea.l   (a2), a0
  00370e  48680040             pea.l     $40(a0)
  003712  2052                 movea.l   (a2), a0
  003714  48680032             pea.l     $32(a0)
  003718  486b0002             pea.l     $2(a3)
  00371c  2052                 movea.l   (a2), a0
  00371e  48680046             pea.l     $46(a0)
  003722  2052                 movea.l   (a2), a0
  003724  48680046             pea.l     $46(a0)
  003728  2f0c                 move.l    a4, -(a7)
  00372a  a817                 _CopyMask 
  00372c  604c                 bra.b     $377a
  00372e  2052                 movea.l   (a2), a0
  003730  48680040             pea.l     $40(a0)
  003734  486effe0             pea.l     -$20(a6)
  003738  4ebafcb4             jsr       $33ee(pc)   ; COPYBMAP
  00373c  2052                 movea.l   (a2), a0
  00373e  48680032             pea.l     $32(a0)
  003742  486effee             pea.l     -$12(a6)
  003746  4ebafca6             jsr       $33ee(pc)   ; COPYBMAP
  00374a  2052                 movea.l   (a2), a0
  00374c  48680040             pea.l     $40(a0)
  003750  2052                 movea.l   (a2), a0
  003752  48680032             pea.l     $32(a0)
  003756  486b0002             pea.l     $2(a3)
  00375a  2052                 movea.l   (a2), a0
  00375c  48680046             pea.l     $46(a0)
  003760  2052                 movea.l   (a2), a0
  003762  48680046             pea.l     $46(a0)
  003766  2f0c                 move.l    a4, -(a7)
  003768  a817                 _CopyMask 
  00376a  2f2effe0             move.l    -$20(a6), -(a7)
  00376e  205f                 movea.l   (a7)+, a0
  003770  a01f                 _DisposePtr 
  003772  2f2effee             move.l    -$12(a6), -(a7)
  003776  205f                 movea.l   (a7)+, a0
  003778  a01f                 _DisposePtr 
  00377a  2f2efffc             move.l    -$4(a6), -(a7)
  00377e  a873                 _SetPort  
  003780  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  003784  4e5e                 unlk      a6
  003786  205f                 movea.l   (a7)+, a0
  003788  4fef0010             lea.l     $10(a7), a7
  00378c  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATDISPOSECICN   (seg 7 +00379c, 38 bytes)
  00379c  4e560000             link.w    a6, #$0
  0037a0  2f0a                 move.l    a2, -(a7)
  0037a2  246e0008             movea.l   $8(a6), a2
  0037a6  200a                 move.l    a2, d0
  0037a8  6710                 beq.b     $37ba
  0037aa  4a2de8b4             tst.b     -$174c(a5)
  0037ae  6706                 beq.b     $37b6
  0037b0  2f0a                 move.l    a2, -(a7)
  0037b2  aa25                 _DisposeCIcon 
  0037b4  6004                 bra.b     $37ba
  0037b6  2f0a                 move.l    a2, -(a7)
  0037b8  a9a3                 _ReleaseResource 
  0037ba  245f                 movea.l   (a7)+, a2
  0037bc  4e5e                 unlk      a6
  0037be  2e9f                 move.l    (a7)+, (a7)
  0037c0  4e75                 rts       

;-------------------------------------------------------------
; DISPOSEFACEDATA   (seg 7 +0037d4, 178 bytes)
  0037d4  4e560000             link.w    a6, #$0
  0037d8  48e70030             movem.l   a2-a3, -(a7)
  0037dc  246e000a             movea.l   $a(a6), a2
  0037e0  302e0008             move.w    $8(a6), d0
  0037e4  5340                 subq.w    #$1, d0
  0037e6  6706                 beq.b     $37ee
  0037e8  5740                 subq.w    #$3, d0
  0037ea  671c                 beq.b     $3808
  0037ec  6060                 bra.b     $384e
  0037ee  4a92                 tst.l     (a2)
  0037f0  6764                 beq.b     $3856
  0037f2  2052                 movea.l   (a2), a0
  0037f4  4a90                 tst.l     (a0)
  0037f6  6708                 beq.b     $3800
  0037f8  2052                 movea.l   (a2), a0
  0037fa  2f10                 move.l    (a0), -(a7)
  0037fc  205f                 movea.l   (a7)+, a0
  0037fe  a01f                 _DisposePtr 
  003800  2f12                 move.l    (a2), -(a7)
  003802  205f                 movea.l   (a7)+, a0
  003804  a01f                 _DisposePtr 
  003806  604e                 bra.b     $3856
  003808  2652                 movea.l   (a2), a3
  00380a  2f13                 move.l    (a3), -(a7)
  00380c  205f                 movea.l   (a7)+, a0
  00380e  a01f                 _DisposePtr 
  003810  2f2b0004             move.l    $4(a3), -(a7)
  003814  205f                 movea.l   (a7)+, a0
  003816  a01f                 _DisposePtr 
  003818  2f2b0008             move.l    $8(a3), -(a7)
  00381c  205f                 movea.l   (a7)+, a0
  00381e  a01f                 _DisposePtr 
  003820  4aab0020             tst.l     $20(a3)
  003824  6708                 beq.b     $382e
  003826  2f2b0020             move.l    $20(a3), -(a7)
  00382a  205f                 movea.l   (a7)+, a0
  00382c  a01f                 _DisposePtr 
  00382e  42ab0020             clr.l     $20(a3)
  003832  4aab0024             tst.l     $24(a3)
  003836  6708                 beq.b     $3840
  003838  2f2b0024             move.l    $24(a3), -(a7)
  00383c  205f                 movea.l   (a7)+, a0
  00383e  a01f                 _DisposePtr 
  003840  42ab0024             clr.l     $24(a3)
  003844  2f12                 move.l    (a2), -(a7)
  003846  205f                 movea.l   (a7)+, a0
  003848  a01f                 _DisposePtr 
  00384a  4292                 clr.l     (a2)
  00384c  6008                 bra.b     $3856
  00384e  2f12                 move.l    (a2), -(a7)
  003850  205f                 movea.l   (a7)+, a0
  003852  a01f                 _DisposePtr 
  003854  4292                 clr.l     (a2)
  003856  4aaa001e             tst.l     $1e(a2)
  00385a  6708                 beq.b     $3864
  00385c  2f2a001e             move.l    $1e(a2), -(a7)
  003860  205f                 movea.l   (a7)+, a0
  003862  a01f                 _DisposePtr 
  003864  42aa001e             clr.l     $1e(a2)
  003868  4aaa0022             tst.l     $22(a2)
  00386c  6708                 beq.b     $3876
  00386e  2f2a0022             move.l    $22(a2), -(a7)
  003872  205f                 movea.l   (a7)+, a0
  003874  a01f                 _DisposePtr 
  003876  42aa0022             clr.l     $22(a2)
  00387a  4cdf0c00             movem.l   (a7)+, a2-a3
  00387e  4e5e                 unlk      a6
  003880  205f                 movea.l   (a7)+, a0
  003882  5c4f                 addq.w    #$6, a7
  003884  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; NEWFACEDATA   (seg 7 +003898, 470 bytes)
  003898  4e56fff8             link.w    a6, #$fff8
  00389c  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  0038a0  246e000a             movea.l   $a(a6), a2
  0038a4  382e0008             move.w    $8(a6), d4
  0038a8  2d6a000cfff8         move.l    $c(a2), -$8(a6)
  0038ae  2d6a0010fffc         move.l    $10(a2), -$4(a6)
  0038b4  3004                 move.w    d4, d0
  0038b6  5340                 subq.w    #$1, d0
  0038b8  6708                 beq.b     $38c2
  0038ba  5740                 subq.w    #$3, d0
  0038bc  6766                 beq.b     $3924
  0038be  60000150             bra.w     $3a10
  0038c2  594f                 subq.w    #$4, a7
  0038c4  4878000e             pea.l     $e.w
  0038c8  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  0038ce  205f                 movea.l   (a7)+, a0
  0038d0  2488                 move.l    a0, (a2)
  0038d2  2652                 movea.l   (a2), a3
  0038d4  276efff80006         move.l    -$8(a6), $6(a3)
  0038da  276efffc000a         move.l    -$4(a6), $a(a3)
  0038e0  554f                 subq.w    #$2, a7
  0038e2  3f2b000c             move.w    $c(a3), -(a7)
  0038e6  4ebaf96c             jsr       $3254(pc)   ; GETROWBYTES2DEV
  0038ea  301f                 move.w    (a7)+, d0
  0038ec  37400004             move.w    d0, $4(a3)
  0038f0  362efffc             move.w    -$4(a6), d3
  0038f4  966efff8             sub.w     -$8(a6), d3
  0038f8  c7eb0004             muls.w    $4(a3), d3
  0038fc  594f                 subq.w    #$4, a7
  0038fe  2f03                 move.l    d3, -(a7)
  003900  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003906  205f                 movea.l   (a7)+, a0
  003908  2688                 move.l    a0, (a3)
  00390a  486b0006             pea.l     $6(a3)
  00390e  2f13                 move.l    (a3), -(a7)
  003910  3f2b0004             move.w    $4(a3), -(a7)
  003914  486a001e             pea.l     $1e(a2)
  003918  3f3c0001             move.w    #$1, -(a7)
  00391c  4ebaf574             jsr       $2e92(pc)   ; SATMAKEROWLIST
  003920  60000140             bra.w     $3a62
  003924  594f                 subq.w    #$4, a7
  003926  48780028             pea.l     $28.w
  00392a  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003930  205f                 movea.l   (a7)+, a0
  003932  2488                 move.l    a0, (a2)
  003934  2652                 movea.l   (a2), a3
  003936  554f                 subq.w    #$2, a7
  003938  3f2efffe             move.w    -$2(a6), -(a7)
  00393c  4ebaf916             jsr       $3254(pc)   ; GETROWBYTES2DEV
  003940  301f                 move.w    (a7)+, d0
  003942  35400014             move.w    d0, $14(a2)
  003946  362efffc             move.w    -$4(a6), d3
  00394a  c7ea0014             muls.w    $14(a2), d3
  00394e  594f                 subq.w    #$4, a7
  003950  2f03                 move.l    d3, -(a7)
  003952  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003958  205f                 movea.l   (a7)+, a0
  00395a  2688                 move.l    a0, (a3)
  00395c  486efff8             pea.l     -$8(a6)
  003960  2f13                 move.l    (a3), -(a7)
  003962  3f2a0014             move.w    $14(a2), -(a7)
  003966  486a001e             pea.l     $1e(a2)
  00396a  3f3c0004             move.w    #$4, -(a7)
  00396e  4ebaf522             jsr       $2e92(pc)   ; SATMAKEROWLIST
  003972  554f                 subq.w    #$2, a7
  003974  7001                 moveq     #$1, d0
  003976  d06efffe             add.w     -$2(a6), d0
  00397a  3f00                 move.w    d0, -(a7)
  00397c  4ebaf8d6             jsr       $3254(pc)   ; GETROWBYTES2DEV
  003980  301f                 move.w    (a7)+, d0
  003982  37400016             move.w    d0, $16(a3)
  003986  362efffc             move.w    -$4(a6), d3
  00398a  c7eb0016             muls.w    $16(a3), d3
  00398e  48c3                 ext.l     d3
  003990  594f                 subq.w    #$4, a7
  003992  2f03                 move.l    d3, -(a7)
  003994  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  00399a  205f                 movea.l   (a7)+, a0
  00399c  27480004             move.l    a0, $4(a3)
  0039a0  276efff80018         move.l    -$8(a6), $18(a3)
  0039a6  276efffc001c         move.l    -$4(a6), $1c(a3)
  0039ac  486b0018             pea.l     $18(a3)
  0039b0  48780001             pea.l     $1.w
  0039b4  a8a8                 _OffsetRect 
  0039b6  486b0018             pea.l     $18(a3)
  0039ba  2f2b0004             move.l    $4(a3), -(a7)
  0039be  3f2b0016             move.w    $16(a3), -(a7)
  0039c2  486b0020             pea.l     $20(a3)
  0039c6  3f3c0004             move.w    #$4, -(a7)
  0039ca  4ebaf4c6             jsr       $2e92(pc)   ; SATMAKEROWLIST
  0039ce  486b0008             pea.l     $8(a3)
  0039d2  486b0018             pea.l     $18(a3)
  0039d6  4ebafbb8             jsr       $3590(pc)   ; MAKEBMAP
  0039da  426b0010             clr.w     $10(a3)
  0039de  486b000e             pea.l     $e(a3)
  0039e2  2f2b0008             move.l    $8(a3), -(a7)
  0039e6  3f2b000c             move.w    $c(a3), -(a7)
  0039ea  486b0024             pea.l     $24(a3)
  0039ee  3f3c0001             move.w    #$1, -(a7)
  0039f2  4ebaf49e             jsr       $2e92(pc)   ; SATMAKEROWLIST
  0039f6  486a000c             pea.l     $c(a2)
  0039fa  2f2a0006             move.l    $6(a2), -(a7)
  0039fe  3f2a000a             move.w    $a(a2), -(a7)
  003a02  486a0022             pea.l     $22(a2)
  003a06  3f3c0001             move.w    #$1, -(a7)
  003a0a  4ebaf486             jsr       $2e92(pc)   ; SATMAKEROWLIST
  003a0e  6052                 bra.b     $3a62
  003a10  554f                 subq.w    #$2, a7
  003a12  3f2efffe             move.w    -$2(a6), -(a7)
  003a16  4ebaf83c             jsr       $3254(pc)   ; GETROWBYTES2DEV
  003a1a  301f                 move.w    (a7)+, d0
  003a1c  35400014             move.w    d0, $14(a2)
  003a20  362efffc             move.w    -$4(a6), d3
  003a24  c7ea0014             muls.w    $14(a2), d3
  003a28  594f                 subq.w    #$4, a7
  003a2a  2f03                 move.l    d3, -(a7)
  003a2c  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003a32  205f                 movea.l   (a7)+, a0
  003a34  2488                 move.l    a0, (a2)
  003a36  486efff8             pea.l     -$8(a6)
  003a3a  2f12                 move.l    (a2), -(a7)
  003a3c  3f2a0014             move.w    $14(a2), -(a7)
  003a40  486a001e             pea.l     $1e(a2)
  003a44  3f04                 move.w    d4, -(a7)
  003a46  4ebaf44a             jsr       $2e92(pc)   ; SATMAKEROWLIST
  003a4a  486a000c             pea.l     $c(a2)
  003a4e  2f2a0006             move.l    $6(a2), -(a7)
  003a52  3f2a000a             move.w    $a(a2), -(a7)
  003a56  486a0022             pea.l     $22(a2)
  003a5a  3f3c0001             move.w    #$1, -(a7)
  003a5e  4ebaf432             jsr       $2e92(pc)   ; SATMAKEROWLIST
  003a62  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  003a66  4e5e                 unlk      a6
  003a68  205f                 movea.l   (a7)+, a0
  003a6a  5c4f                 addq.w    #$6, a7
  003a6c  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATNEWFACEPP   (seg 7 +003a7c, 116 bytes)
  003a7c  4e560000             link.w    a6, #$0
  003a80  48e70038             movem.l   a2-a4, -(a7)
  003a84  266e000c             movea.l   $c(a6), a3
  003a88  286e0008             movea.l   $8(a6), a4
  003a8c  4a2de7e5             tst.b     -$181b(a5)
  003a90  6606                 bne.b     $3a98
  003a92  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  003a98  2f0b                 move.l    a3, -(a7)
  003a9a  302b0002             move.w    $2(a3), d0
  003a9e  4440                 neg.w     d0
  003aa0  3f00                 move.w    d0, -(a7)
  003aa2  3013                 move.w    (a3), d0
  003aa4  4440                 neg.w     d0
  003aa6  3f00                 move.w    d0, -(a7)
  003aa8  a8a8                 _OffsetRect 
  003aaa  200c                 move.l    a4, d0
  003aac  6612                 bne.b     $3ac0
  003aae  594f                 subq.w    #$4, a7
  003ab0  4878002e             pea.l     $2e.w
  003ab4  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  003aba  205f                 movea.l   (a7)+, a0
  003abc  2448                 movea.l   a0, a2
  003abe  6002                 bra.b     $3ac2
  003ac0  244c                 movea.l   a4, a2
  003ac2  486a0006             pea.l     $6(a2)
  003ac6  2f0b                 move.l    a3, -(a7)
  003ac8  4ebafac6             jsr       $3590(pc)   ; MAKEBMAP
  003acc  2f0a                 move.l    a2, -(a7)
  003ace  3f2de860             move.w    -$17a0(a5), -(a7)
  003ad2  4ebafdc4             jsr       $3898(pc)   ; NEWFACEDATA
  003ad6  256de8b00016         move.l    -$1750(a5), $16(a2)
  003adc  2b4ae8b0             move.l    a2, -$1750(a5)
  003ae0  2d4a0010             move.l    a2, $10(a6)
  003ae4  4cdf1c00             movem.l   (a7)+, a2-a4
  003ae8  4e5e                 unlk      a6
  003aea  205f                 movea.l   (a7)+, a0
  003aec  504f                 addq.w    #$8, a7
  003aee  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; REBUILDFACE   (seg 7 +003b00, 36 bytes)
  003b00  4e560000             link.w    a6, #$0
  003b04  2f2e000c             move.l    $c(a6), -(a7)
  003b08  3f2e000a             move.w    $a(a6), -(a7)
  003b0c  4ebafcc6             jsr       $37d4(pc)   ; DISPOSEFACEDATA
  003b10  2f2e000c             move.l    $c(a6), -(a7)
  003b14  3f2e0008             move.w    $8(a6), -(a7)
  003b18  4ebafd7e             jsr       $3898(pc)   ; NEWFACEDATA
  003b1c  4e5e                 unlk      a6
  003b1e  205f                 movea.l   (a7)+, a0
  003b20  504f                 addq.w    #$8, a7
  003b22  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SETICONPORT   (seg 7 +003b32, 276 bytes)
  003b32  4e56fff8             link.w    a6, #$fff8
  003b36  2f0a                 move.l    a2, -(a7)
  003b38  206e0008             movea.l   $8(a6), a0
  003b3c  2d50fff8             move.l    (a0), -$8(a6)
  003b40  2d680004fffc         move.l    $4(a0), -$4(a6)
  003b46  4a2de8b4             tst.b     -$174c(a5)
  003b4a  6774                 beq.b     $3bc0
  003b4c  206de878             movea.l   -$1788(a5), a0
  003b50  20680002             movea.l   $2(a0), a0
  003b54  2050                 movea.l   (a0), a0
  003b56  20ae000c             move.l    $c(a6), (a0)
  003b5a  206de878             movea.l   -$1788(a5), a0
  003b5e  20680002             movea.l   $2(a0), a0
  003b62  2050                 movea.l   (a0), a0
  003b64  216efff80006         move.l    -$8(a6), $6(a0)
  003b6a  216efffc000a         move.l    -$4(a6), $a(a0)
  003b70  554f                 subq.w    #$2, a7
  003b72  3f2efffe             move.w    -$2(a6), -(a7)
  003b76  4ebaf668             jsr       $31e0(pc)   ; GETROWBYTESDEV
  003b7a  301f                 move.w    (a7)+, d0
  003b7c  206de878             movea.l   -$1788(a5), a0
  003b80  20680002             movea.l   $2(a0), a0
  003b84  2050                 movea.l   (a0), a0
  003b86  31400004             move.w    d0, $4(a0)
  003b8a  206de878             movea.l   -$1788(a5), a0
  003b8e  216efff80010         move.l    -$8(a6), $10(a0)
  003b94  216efffc0014         move.l    -$4(a6), $14(a0)
  003b9a  2f2de878             move.l    -$1788(a5), -(a7)
  003b9e  a873                 _SetPort  
  003ba0  4aade87c             tst.l     -$1784(a5)
  003ba4  6752                 beq.b     $3bf8
  003ba6  206de87c             movea.l   -$1784(a5), a0
  003baa  2050                 movea.l   (a0), a0
  003bac  216efff80022         move.l    -$8(a6), $22(a0)
  003bb2  216efffc0026         move.l    -$4(a6), $26(a0)
  003bb8  2f2de87c             move.l    -$1784(a5), -(a7)
  003bbc  aa31                 _SetGDevice 
  003bbe  6038                 bra.b     $3bf8
  003bc0  246de878             movea.l   -$1788(a5), a2
  003bc4  256e000c0002         move.l    $c(a6), $2(a2)
  003bca  256efff80008         move.l    -$8(a6), $8(a2)
  003bd0  256efffc000c         move.l    -$4(a6), $c(a2)
  003bd6  554f                 subq.w    #$2, a7
  003bd8  3f2efffe             move.w    -$2(a6), -(a7)
  003bdc  4ebaf676             jsr       $3254(pc)   ; GETROWBYTES2DEV
  003be0  301f                 move.w    (a7)+, d0
  003be2  35400006             move.w    d0, $6(a2)
  003be6  256efff80010         move.l    -$8(a6), $10(a2)
  003bec  256efffc0014         move.l    -$4(a6), $14(a2)
  003bf2  2f2de878             move.l    -$1788(a5), -(a7)
  003bf6  a873                 _SetPort  
  003bf8  206de878             movea.l   -$1788(a5), a0
  003bfc  20680018             movea.l   $18(a0), a0
  003c00  2050                 movea.l   (a0), a0
  003c02  30280008             move.w    $8(a0), d0
  003c06  b06efffe             cmp.w     -$2(a6), d0
  003c0a  5dc0                 slt.b     d0
  003c0c  4400                 neg.b     d0
  003c0e  206de878             movea.l   -$1788(a5), a0
  003c12  20680018             movea.l   $18(a0), a0
  003c16  2050                 movea.l   (a0), a0
  003c18  32280006             move.w    $6(a0), d1
  003c1c  b26efffc             cmp.w     -$4(a6), d1
  003c20  5dc1                 slt.b     d1
  003c22  4401                 neg.b     d1
  003c24  8200                 or.b      d0, d1
  003c26  6714                 beq.b     $3c3c
  003c28  206de878             movea.l   -$1788(a5), a0
  003c2c  2f280018             move.l    $18(a0), -(a7)
  003c30  486efff8             pea.l     -$8(a6)
  003c34  a8df                 _RectRgn  
  003c36  486efff8             pea.l     -$8(a6)
  003c3a  a87b                 _ClipRect 
  003c3c  245f                 movea.l   (a7)+, a2
  003c3e  4e5e                 unlk      a6
  003c40  205f                 movea.l   (a7)+, a0
  003c42  504f                 addq.w    #$8, a7
  003c44  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SETICONPORT2   (seg 7 +003c54, 276 bytes)
  003c54  4e56fff8             link.w    a6, #$fff8
  003c58  2f0a                 move.l    a2, -(a7)
  003c5a  206e0008             movea.l   $8(a6), a0
  003c5e  2d50fff8             move.l    (a0), -$8(a6)
  003c62  2d680004fffc         move.l    $4(a0), -$4(a6)
  003c68  4a2de8b4             tst.b     -$174c(a5)
  003c6c  6774                 beq.b     $3ce2
  003c6e  206de892             movea.l   -$176e(a5), a0
  003c72  20680002             movea.l   $2(a0), a0
  003c76  2050                 movea.l   (a0), a0
  003c78  20ae000c             move.l    $c(a6), (a0)
  003c7c  206de892             movea.l   -$176e(a5), a0
  003c80  20680002             movea.l   $2(a0), a0
  003c84  2050                 movea.l   (a0), a0
  003c86  216efff80006         move.l    -$8(a6), $6(a0)
  003c8c  216efffc000a         move.l    -$4(a6), $a(a0)
  003c92  554f                 subq.w    #$2, a7
  003c94  3f2efffe             move.w    -$2(a6), -(a7)
  003c98  4ebaf546             jsr       $31e0(pc)   ; GETROWBYTESDEV
  003c9c  301f                 move.w    (a7)+, d0
  003c9e  206de892             movea.l   -$176e(a5), a0
  003ca2  20680002             movea.l   $2(a0), a0
  003ca6  2050                 movea.l   (a0), a0
  003ca8  31400004             move.w    d0, $4(a0)
  003cac  206de892             movea.l   -$176e(a5), a0
  003cb0  216efff80010         move.l    -$8(a6), $10(a0)
  003cb6  216efffc0014         move.l    -$4(a6), $14(a0)
  003cbc  2f2de892             move.l    -$176e(a5), -(a7)
  003cc0  a873                 _SetPort  
  003cc2  4aade896             tst.l     -$176a(a5)
  003cc6  6752                 beq.b     $3d1a
  003cc8  206de896             movea.l   -$176a(a5), a0
  003ccc  2050                 movea.l   (a0), a0
  003cce  216efff80022         move.l    -$8(a6), $22(a0)
  003cd4  216efffc0026         move.l    -$4(a6), $26(a0)
  003cda  2f2de896             move.l    -$176a(a5), -(a7)
  003cde  aa31                 _SetGDevice 
  003ce0  6038                 bra.b     $3d1a
  003ce2  246de892             movea.l   -$176e(a5), a2
  003ce6  256e000c0002         move.l    $c(a6), $2(a2)
  003cec  256efff80008         move.l    -$8(a6), $8(a2)
  003cf2  256efffc000c         move.l    -$4(a6), $c(a2)
  003cf8  554f                 subq.w    #$2, a7
  003cfa  3f2efffe             move.w    -$2(a6), -(a7)
  003cfe  4ebaf554             jsr       $3254(pc)   ; GETROWBYTES2DEV
  003d02  301f                 move.w    (a7)+, d0
  003d04  35400006             move.w    d0, $6(a2)
  003d08  256efff80010         move.l    -$8(a6), $10(a2)
  003d0e  256efffc0014         move.l    -$4(a6), $14(a2)
  003d14  2f2de892             move.l    -$176e(a5), -(a7)
  003d18  a873                 _SetPort  
  003d1a  206de892             movea.l   -$176e(a5), a0
  003d1e  20680018             movea.l   $18(a0), a0
  003d22  2050                 movea.l   (a0), a0
  003d24  30280008             move.w    $8(a0), d0
  003d28  b06efffe             cmp.w     -$2(a6), d0
  003d2c  5dc0                 slt.b     d0
  003d2e  4400                 neg.b     d0
  003d30  206de892             movea.l   -$176e(a5), a0
  003d34  20680018             movea.l   $18(a0), a0
  003d38  2050                 movea.l   (a0), a0
  003d3a  32280006             move.w    $6(a0), d1
  003d3e  b26efffc             cmp.w     -$4(a6), d1
  003d42  5dc1                 slt.b     d1
  003d44  4401                 neg.b     d1
  003d46  8200                 or.b      d0, d1
  003d48  6714                 beq.b     $3d5e
  003d4a  206de892             movea.l   -$176e(a5), a0
  003d4e  2f280018             move.l    $18(a0), -(a7)
  003d52  486efff8             pea.l     -$8(a6)
  003d56  a8df                 _RectRgn  
  003d58  486efff8             pea.l     -$8(a6)
  003d5c  a87b                 _ClipRect 
  003d5e  245f                 movea.l   (a7)+, a2
  003d60  4e5e                 unlk      a6
  003d62  205f                 movea.l   (a7)+, a0
  003d64  504f                 addq.w    #$8, a7
  003d66  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; INTERNALCHANGEDFACE   (seg 7 +003d78, 260 bytes)
  003d78  4e56fff4             link.w    a6, #$fff4
  003d7c  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  003d80  246e000a             movea.l   $a(a6), a2
  003d84  362e0008             move.w    $8(a6), d3
  003d88  486efff4             pea.l     -$c(a6)
  003d8c  a874                 _GetPort  
  003d8e  4a2de8b4             tst.b     -$174c(a5)
  003d92  6708                 beq.b     $3d9c
  003d94  594f                 subq.w    #$4, a7
  003d96  aa32                 _GetGDevice 
  003d98  205f                 movea.l   (a7)+, a0
  003d9a  2808                 move.l    a0, d4
  003d9c  4a43                 tst.w     d3
  003d9e  6604                 bne.b     $3da4
  003da0  362de860             move.w    -$17a0(a5), d3
  003da4  284a                 movea.l   a2, a4
  003da6  3003                 move.w    d3, d0
  003da8  5940                 subq.w    #$4, d0
  003daa  6702                 beq.b     $3dae
  003dac  6060                 bra.b     $3e0e
  003dae  2654                 movea.l   (a4), a3
  003db0  2f13                 move.l    (a3), -(a7)
  003db2  486c000c             pea.l     $c(a4)
  003db6  4ebafd7a             jsr       $3b32(pc)   ; SETICONPORT
  003dba  2d6b0018fff8         move.l    $18(a3), -$8(a6)
  003dc0  2d6b001cfffc         move.l    $1c(a3), -$4(a6)
  003dc6  426efffa             clr.w     -$6(a6)
  003dca  2f2b0004             move.l    $4(a3), -(a7)
  003dce  486efff8             pea.l     -$8(a6)
  003dd2  4ebafe80             jsr       $3c54(pc)   ; SETICONPORT2
  003dd6  206de878             movea.l   -$1788(a5), a0
  003dda  48680002             pea.l     $2(a0)
  003dde  206de892             movea.l   -$176e(a5), a0
  003de2  48680002             pea.l     $2(a0)
  003de6  486c000c             pea.l     $c(a4)
  003dea  486b0018             pea.l     $18(a3)
  003dee  4267                 clr.w     -(a7)
  003df0  48780000             pea.l     $0.w
  003df4  a8ec                 _CopyBits 
  003df6  486c0006             pea.l     $6(a4)
  003dfa  486b0008             pea.l     $8(a3)
  003dfe  486c000c             pea.l     $c(a4)
  003e02  486b0018             pea.l     $18(a3)
  003e06  4267                 clr.w     -(a7)
  003e08  48780000             pea.l     $0.w
  003e0c  a8ec                 _CopyBits 
  003e0e  4aaa001a             tst.l     $1a(a2)
  003e12  660a                 bne.b     $3e1e
  003e14  594f                 subq.w    #$4, a7
  003e16  a8d8                 _NewRgn   
  003e18  205f                 movea.l   (a7)+, a0
  003e1a  2548001a             move.l    a0, $1a(a2)
  003e1e  554f                 subq.w    #$2, a7
  003e20  3f3ca8d7             move.w    #$a8d7, -(a7)
  003e24  4eb900001ee6         jsr       $1ee6.l   ; SATTRAPAVAILABLE
  003e2a  101f                 move.b    (a7)+, d0
  003e2c  c02de8b4             and.b     -$174c(a5), d0
  003e30  6716                 beq.b     $3e48
  003e32  554f                 subq.w    #$2, a7
  003e34  2f2a001a             move.l    $1a(a2), -(a7)
  003e38  486a0006             pea.l     $6(a2)
  003e3c  a8d7                 _BitMapToRegion 
  003e3e  301f                 move.w    (a7)+, d0
  003e40  671e                 beq.b     $3e60
  003e42  42aa001a             clr.l     $1a(a2)
  003e46  6018                 bra.b     $3e60
  003e48  554f                 subq.w    #$2, a7
  003e4a  2f2a001a             move.l    $1a(a2), -(a7)
  003e4e  486a0006             pea.l     $6(a2)
  003e52  4eb900000340         jsr       $340.l   ; _tail_c
  003e58  301f                 move.w    (a7)+, d0
  003e5a  6704                 beq.b     $3e60
  003e5c  42aa001a             clr.l     $1a(a2)
  003e60  4a2de8b4             tst.b     -$174c(a5)
  003e64  6704                 beq.b     $3e6a
  003e66  2f04                 move.l    d4, -(a7)
  003e68  aa31                 _SetGDevice 
  003e6a  2f2efff4             move.l    -$c(a6), -(a7)
  003e6e  a873                 _SetPort  
  003e70  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  003e74  4e5e                 unlk      a6
  003e76  205f                 movea.l   (a7)+, a0
  003e78  5c4f                 addq.w    #$6, a7
  003e7a  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; REDRAWFACE   (seg 7 +003e92, 256 bytes)
  003e92  4e56ffe6             link.w    a6, #$ffe6
  003e96  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  003e9a  266e000a             movea.l   $a(a6), a3
  003e9e  362e0008             move.w    $8(a6), d3
  003ea2  4aab0026             tst.l     $26(a3)
  003ea6  6728                 beq.b     $3ed0
  003ea8  486effe6             pea.l     -$1a(a6)
  003eac  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  003eb2  2f0b                 move.l    a3, -(a7)
  003eb4  4eb900004132         jsr       $4132.l   ; SATSETPORTFACE
  003eba  2f0b                 move.l    a3, -(a7)
  003ebc  3f03                 move.w    d3, -(a7)
  003ebe  2f2b0026             move.l    $26(a3), -(a7)
  003ec2  205f                 movea.l   (a7)+, a0
  003ec4  4e90                 jsr       (a0)
  003ec6  486effe6             pea.l     -$1a(a6)
  003eca  4eb900004278         jsr       $4278.l   ; SATSETPORT
  003ed0  4a6b0004             tst.w     $4(a3)
  003ed4  670000b0             beq.w     $3f86
  003ed8  594f                 subq.w    #$4, a7
  003eda  3f2b0004             move.w    $4(a3), -(a7)
  003ede  4ebaf726             jsr       $3606(pc)   ; SATGETCICN
  003ee2  205f                 movea.l   (a7)+, a0
  003ee4  2448                 movea.l   a0, a2
  003ee6  200a                 move.l    a2, d0
  003ee8  6700009c             beq.w     $3f86
  003eec  3003                 move.w    d3, d0
  003eee  5340                 subq.w    #$1, d0
  003ef0  6706                 beq.b     $3ef8
  003ef2  5740                 subq.w    #$3, d0
  003ef4  6734                 beq.b     $3f2a
  003ef6  6062                 bra.b     $3f5a
  003ef8  2852                 movea.l   (a2), a4
  003efa  49ec0040             lea.l     $40(a4), a4
  003efe  382c000a             move.w    $a(a4), d4
  003f02  986c0006             sub.w     $6(a4), d4
  003f06  c9ec0004             muls.w    $4(a4), d4
  003f0a  48c4                 ext.l     d4
  003f0c  2052                 movea.l   (a2), a0
  003f0e  41e80052             lea.l     $52(a0), a0
  003f12  2008                 move.l    a0, d0
  003f14  d084                 add.l     d4, d0
  003f16  2052                 movea.l   (a2), a0
  003f18  21400040             move.l    d0, $40(a0)
  003f1c  2052                 movea.l   (a2), a0
  003f1e  48680040             pea.l     $40(a0)
  003f22  2f13                 move.l    (a3), -(a7)
  003f24  4ebaf4c8             jsr       $33ee(pc)   ; COPYBMAP
  003f28  604e                 bra.b     $3f78
  003f2a  2053                 movea.l   (a3), a0
  003f2c  2f10                 move.l    (a0), -(a7)
  003f2e  486b000c             pea.l     $c(a3)
  003f32  4ebafbfe             jsr       $3b32(pc)   ; SETICONPORT
  003f36  4aade870             tst.l     -$1790(a5)
  003f3a  6708                 beq.b     $3f44
  003f3c  2f0a                 move.l    a2, -(a7)
  003f3e  4ebaf3f0             jsr       $3330(pc)   ; DITHERICON
  003f42  6034                 bra.b     $3f78
  003f44  2f0a                 move.l    a2, -(a7)
  003f46  2f2de878             move.l    -$1788(a5), -(a7)
  003f4a  2f2de87c             move.l    -$1784(a5), -(a7)
  003f4e  2052                 movea.l   (a2), a0
  003f50  48680046             pea.l     $46(a0)
  003f54  4ebaf758             jsr       $36ae(pc)   ; SATPLOTCICN
  003f58  601e                 bra.b     $3f78
  003f5a  2f13                 move.l    (a3), -(a7)
  003f5c  486b000c             pea.l     $c(a3)
  003f60  4ebafbd0             jsr       $3b32(pc)   ; SETICONPORT
  003f64  2f0a                 move.l    a2, -(a7)
  003f66  2f2de878             move.l    -$1788(a5), -(a7)
  003f6a  2f2de87c             move.l    -$1784(a5), -(a7)
  003f6e  2052                 movea.l   (a2), a0
  003f70  48680046             pea.l     $46(a0)
  003f74  4ebaf738             jsr       $36ae(pc)   ; SATPLOTCICN
  003f78  2f0b                 move.l    a3, -(a7)
  003f7a  3f03                 move.w    d3, -(a7)
  003f7c  4ebafdfa             jsr       $3d78(pc)   ; INTERNALCHANGEDFACE
  003f80  2f0a                 move.l    a2, -(a7)
  003f82  4ebaf818             jsr       $379c(pc)   ; SATDISPOSECICN
  003f86  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  003f8a  4e5e                 unlk      a6
  003f8c  205f                 movea.l   (a7)+, a0
  003f8e  5c4f                 addq.w    #$6, a7
  003f90  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETFACE   (seg 7 +003fa0, 34 bytes)
  003fa0  4e560000             link.w    a6, #$0
  003fa4  594f                 subq.w    #$4, a7
  003fa6  3f2e0008             move.w    $8(a6), -(a7)
  003faa  48780000             pea.l     $0.w
  003fae  4eb900003fd0         jsr       $3fd0.l   ; SATGETFACEPP
  003fb4  205f                 movea.l   (a7)+, a0
  003fb6  2d48000a             move.l    a0, $a(a6)
  003fba  4e5e                 unlk      a6
  003fbc  205f                 movea.l   (a7)+, a0
  003fbe  544f                 addq.w    #$2, a7
  003fc0  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETFACEPP   (seg 7 +003fd0, 246 bytes)
  003fd0  4e56ffe6             link.w    a6, #$ffe6
  003fd4  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  003fd8  362e000c             move.w    $c(a6), d3
  003fdc  286e0008             movea.l   $8(a6), a4
  003fe0  4a2de7e5             tst.b     -$181b(a5)
  003fe4  6606                 bne.b     $3fec
  003fe6  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  003fec  200c                 move.l    a4, d0
  003fee  661c                 bne.b     $400c
  003ff0  246de8b0             movea.l   -$1750(a5), a2
  003ff4  6012                 bra.b     $4008
  003ff6  b66a0004             cmp.w     $4(a2), d3
  003ffa  6608                 bne.b     $4004
  003ffc  2d4a000e             move.l    a2, $e(a6)
  004000  600000b8             bra.w     $40ba
  004004  246a0016             movea.l   $16(a2), a2
  004008  200a                 move.l    a2, d0
  00400a  66ea                 bne.b     $3ff6
  00400c  486effe6             pea.l     -$1a(a6)
  004010  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  004016  594f                 subq.w    #$4, a7
  004018  2f2df6e6             move.l    -$91a(a5), -(a7)
  00401c  3f03                 move.w    d3, -(a7)
  00401e  a9a0                 _GetResource 
  004020  205f                 movea.l   (a7)+, a0
  004022  2648                 movea.l   a0, a3
  004024  200b                 move.l    a3, d0
  004026  6608                 bne.b     $4030
  004028  42ae000e             clr.l     $e(a6)
  00402c  6000008c             bra.w     $40ba
  004030  554f                 subq.w    #$2, a7
  004032  2f0b                 move.l    a3, -(a7)
  004034  205f                 movea.l   (a7)+, a0
  004036  a069                 _HGetState 
  004038  1e80                 move.b    d0, (a7)
  00403a  101f                 move.b    (a7)+, d0
  00403c  1800                 move.b    d0, d4
  00403e  2f0b                 move.l    a3, -(a7)
  004040  205f                 movea.l   (a7)+, a0
  004042  a04a                 _HNoPurge 
  004044  2f0b                 move.l    a3, -(a7)
  004046  205f                 movea.l   (a7)+, a0
  004048  a029                 _HLock    
  00404a  594f                 subq.w    #$4, a7
  00404c  2053                 movea.l   (a3), a0
  00404e  48680038             pea.l     $38(a0)
  004052  2f0c                 move.l    a4, -(a7)
  004054  4ebafa26             jsr       $3a7c(pc)   ; SATNEWFACEPP
  004058  205f                 movea.l   (a7)+, a0
  00405a  2448                 movea.l   a0, a2
  00405c  35430004             move.w    d3, $4(a2)
  004060  42aa001a             clr.l     $1a(a2)
  004064  2053                 movea.l   (a3), a0
  004066  41e80052             lea.l     $52(a0), a0
  00406a  2253                 movea.l   (a3), a1
  00406c  23480032             move.l    a0, $32(a1)
  004070  2053                 movea.l   (a3), a0
  004072  48680032             pea.l     $32(a0)
  004076  486a0006             pea.l     $6(a2)
  00407a  4ebaf372             jsr       $33ee(pc)   ; COPYBMAP
  00407e  486a000c             pea.l     $c(a2)
  004082  2f2a0006             move.l    $6(a2), -(a7)
  004086  3f2a000a             move.w    $a(a2), -(a7)
  00408a  486a0022             pea.l     $22(a2)
  00408e  3f3c0001             move.w    #$1, -(a7)
  004092  4ebaedfe             jsr       $2e92(pc)   ; SATMAKEROWLIST
  004096  2f0b                 move.l    a3, -(a7)
  004098  1f04                 move.b    d4, -(a7)
  00409a  101f                 move.b    (a7)+, d0
  00409c  205f                 movea.l   (a7)+, a0
  00409e  a06a                 _HSetState 
  0040a0  97cb                 suba.l    a3, a3
  0040a2  2f0a                 move.l    a2, -(a7)
  0040a4  3f2de860             move.w    -$17a0(a5), -(a7)
  0040a8  4ebafde8             jsr       $3e92(pc)   ; REDRAWFACE
  0040ac  2d4a000e             move.l    a2, $e(a6)
  0040b0  486effe6             pea.l     -$1a(a6)
  0040b4  4eb900004278         jsr       $4278.l   ; SATSETPORT
  0040ba  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  0040be  4e5e                 unlk      a6
  0040c0  205f                 movea.l   (a7)+, a0
  0040c2  5c4f                 addq.w    #$6, a7
  0040c4  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATRELOADICONS   (seg 7 +0040d6, 74 bytes)
  0040d6  4e560000             link.w    a6, #$0
  0040da  2f0a                 move.l    a2, -(a7)
  0040dc  246de8b0             movea.l   -$1750(a5), a2
  0040e0  6034                 bra.b     $4116
  0040e2  2f0a                 move.l    a2, -(a7)
  0040e4  3f2de860             move.w    -$17a0(a5), -(a7)
  0040e8  206de7f2             movea.l   -$180e(a5), a0
  0040ec  2050                 movea.l   (a0), a0
  0040ee  20680016             movea.l   $16(a0), a0
  0040f2  2050                 movea.l   (a0), a0
  0040f4  3f280020             move.w    $20(a0), -(a7)
  0040f8  4ebafa06             jsr       $3b00(pc)   ; REBUILDFACE
  0040fc  2f0a                 move.l    a2, -(a7)
  0040fe  206de7f2             movea.l   -$180e(a5), a0
  004102  2050                 movea.l   (a0), a0
  004104  20680016             movea.l   $16(a0), a0
  004108  2050                 movea.l   (a0), a0
  00410a  3f280020             move.w    $20(a0), -(a7)
  00410e  4ebafd82             jsr       $3e92(pc)   ; REDRAWFACE
  004112  246a0016             movea.l   $16(a2), a2
  004116  200a                 move.l    a2, d0
  004118  66c8                 bne.b     $40e2
  00411a  245f                 movea.l   (a7)+, a2
  00411c  4e5e                 unlk      a6
  00411e  4e75                 rts       

;-------------------------------------------------------------
; SATSETPORTFACE   (seg 7 +004132, 70 bytes)
  004132  4e560000             link.w    a6, #$0
  004136  2f0a                 move.l    a2, -(a7)
  004138  246e0008             movea.l   $8(a6), a2
  00413c  302de860             move.w    -$17a0(a5), d0
  004140  5340                 subq.w    #$1, d0
  004142  6706                 beq.b     $414a
  004144  5740                 subq.w    #$3, d0
  004146  6710                 beq.b     $4158
  004148  601c                 bra.b     $4166
  00414a  2052                 movea.l   (a2), a0
  00414c  2f10                 move.l    (a0), -(a7)
  00414e  486a000c             pea.l     $c(a2)
  004152  4ebaf9de             jsr       $3b32(pc)   ; SETICONPORT
  004156  6018                 bra.b     $4170
  004158  2052                 movea.l   (a2), a0
  00415a  2f10                 move.l    (a0), -(a7)
  00415c  486a000c             pea.l     $c(a2)
  004160  4ebaf9d0             jsr       $3b32(pc)   ; SETICONPORT
  004164  600a                 bra.b     $4170
  004166  2f12                 move.l    (a2), -(a7)
  004168  486a000c             pea.l     $c(a2)
  00416c  4ebaf9c4             jsr       $3b32(pc)   ; SETICONPORT
  004170  245f                 movea.l   (a7)+, a2
  004172  4e5e                 unlk      a6
  004174  2e9f                 move.l    (a7)+, (a7)
  004176  4e75                 rts       

;-------------------------------------------------------------
; SATSETUPBLITTERS   (seg 7 +00418a, 144 bytes)
  00418a  4e560000             link.w    a6, #$0
  00418e  302de860             move.w    -$17a0(a5), d0
  004192  5340                 subq.w    #$1, d0
  004194  6718                 beq.b     $41ae
  004196  5340                 subq.w    #$1, d0
  004198  6722                 beq.b     $41bc
  00419a  5540                 subq.w    #$2, d0
  00419c  672c                 beq.b     $41ca
  00419e  5940                 subq.w    #$4, d0
  0041a0  6736                 beq.b     $41d8
  0041a2  5140                 subq.w    #$8, d0
  0041a4  6740                 beq.b     $41e6
  0041a6  04400010             subi.w    #$10, d0
  0041aa  6748                 beq.b     $41f4
  0041ac  6054                 bra.b     $4202
  0041ae  2b6de8b6e8e6         move.l    -$174a(a5), -$171a(a5)
  0041b4  2b6de8bae8ea         move.l    -$1746(a5), -$1716(a5)
  0041ba  605a                 bra.b     $4216
  0041bc  2b6de8bee8e6         move.l    -$1742(a5), -$171a(a5)
  0041c2  2b6de8c2e8ea         move.l    -$173e(a5), -$1716(a5)
  0041c8  604c                 bra.b     $4216
  0041ca  2b6de8c6e8e6         move.l    -$173a(a5), -$171a(a5)
  0041d0  2b6de8cae8ea         move.l    -$1736(a5), -$1716(a5)
  0041d6  603e                 bra.b     $4216
  0041d8  2b6de8cee8e6         move.l    -$1732(a5), -$171a(a5)
  0041de  2b6de8d2e8ea         move.l    -$172e(a5), -$1716(a5)
  0041e4  6030                 bra.b     $4216
  0041e6  2b6de8d6e8e6         move.l    -$172a(a5), -$171a(a5)
  0041ec  2b6de8dae8ea         move.l    -$1726(a5), -$1716(a5)
  0041f2  6022                 bra.b     $4216
  0041f4  2b6de8dee8e6         move.l    -$1722(a5), -$171a(a5)
  0041fa  2b6de8e2e8ea         move.l    -$171e(a5), -$1716(a5)
  004200  6014                 bra.b     $4216
  004202  41f900000048         lea.l     $48.l, a0   ; SATSAFERECTBLIT
  004208  2b48e8e6             move.l    a0, -$171a(a5)
  00420c  41f900000050         lea.l     $50.l, a0   ; SATSAFEMASKBLIT
  004212  2b48e8ea             move.l    a0, -$1716(a5)
  004216  4e5e                 unlk      a6
  004218  4e75                 rts       

;-------------------------------------------------------------
; SATGETPORT   (seg 7 +00422e, 60 bytes)
  00422e  4e560000             link.w    a6, #$0
  004232  2f0a                 move.l    a2, -(a7)
  004234  246e0008             movea.l   $8(a6), a2
  004238  4a2de7e5             tst.b     -$181b(a5)
  00423c  6606                 bne.b     $4244
  00423e  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  004244  2f0a                 move.l    a2, -(a7)
  004246  a874                 _GetPort  
  004248  4a2de8b4             tst.b     -$174c(a5)
  00424c  670c                 beq.b     $425a
  00424e  594f                 subq.w    #$4, a7
  004250  aa32                 _GetGDevice 
  004252  205f                 movea.l   (a7)+, a0
  004254  25480004             move.l    a0, $4(a2)
  004258  6004                 bra.b     $425e
  00425a  42aa0004             clr.l     $4(a2)
  00425e  42aa0008             clr.l     $8(a2)
  004262  245f                 movea.l   (a7)+, a2
  004264  4e5e                 unlk      a6
  004266  2e9f                 move.l    (a7)+, (a7)
  004268  4e75                 rts       

;-------------------------------------------------------------
; SATSETPORT   (seg 7 +004278, 52 bytes)
  004278  4e560000             link.w    a6, #$0
  00427c  2f0a                 move.l    a2, -(a7)
  00427e  246e0008             movea.l   $8(a6), a2
  004282  4a2de7e5             tst.b     -$181b(a5)
  004286  6606                 bne.b     $428e
  004288  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  00428e  2f12                 move.l    (a2), -(a7)
  004290  a873                 _SetPort  
  004292  4a2de8b4             tst.b     -$174c(a5)
  004296  670c                 beq.b     $42a4
  004298  4aaa0004             tst.l     $4(a2)
  00429c  6706                 beq.b     $42a4
  00429e  2f2a0004             move.l    $4(a2), -(a7)
  0042a2  aa31                 _SetGDevice 
  0042a4  245f                 movea.l   (a7)+, a2
  0042a6  4e5e                 unlk      a6
  0042a8  2e9f                 move.l    (a7)+, (a7)
  0042aa  4e75                 rts       

;-------------------------------------------------------------
; SATSETPORTOFFSCREEN   (seg 7 +0042ba, 16 bytes)
  0042ba  4e560000             link.w    a6, #$0
  0042be  486de80c             pea.l     -$17f4(a5)
  0042c2  4ebaffb4             jsr       $4278(pc)   ; SATSETPORT
  0042c6  4e5e                 unlk      a6
  0042c8  4e75                 rts       

;-------------------------------------------------------------
; SATSETPORTBACKSCREEN   (seg 7 +0042e0, 16 bytes)
  0042e0  4e560000             link.w    a6, #$0
  0042e4  486de826             pea.l     -$17da(a5)
  0042e8  4ebaff8e             jsr       $4278(pc)   ; SATSETPORT
  0042ec  4e5e                 unlk      a6
  0042ee  4e75                 rts       

;-------------------------------------------------------------
; SATSETPORTSCREEN   (seg 7 +004308, 16 bytes)
  004308  4e560000             link.w    a6, #$0
  00430c  486de7ee             pea.l     -$1812(a5)
  004310  4ebaff66             jsr       $4278(pc)   ; SATSETPORT
  004314  4e5e                 unlk      a6
  004316  4e75                 rts       

;-------------------------------------------------------------
; SATSETUPSCREENVARS   (seg 7 +00432c, 76 bytes)
  00432c  4e560000             link.w    a6, #$0
  004330  2f0a                 move.l    a2, -(a7)
  004332  4a2de8b4             tst.b     -$174c(a5)
  004336  6728                 beq.b     $4360
  004338  246de7f2             movea.l   -$180e(a5), a2
  00433c  2052                 movea.l   (a2), a0
  00433e  20680016             movea.l   $16(a0), a0
  004342  2050                 movea.l   (a0), a0
  004344  2b680006e858         move.l    $6(a0), -$17a8(a5)
  00434a  2b68000ae85c         move.l    $a(a0), -$17a4(a5)
  004350  2052                 movea.l   (a2), a0
  004352  20680016             movea.l   $16(a0), a0
  004356  2050                 movea.l   (a0), a0
  004358  3b680020e860         move.w    $20(a0), -$17a0(a5)
  00435e  6012                 bra.b     $4372
  004360  2b6de744e858         move.l    -$18bc(a5), -$17a8(a5)
  004366  2b6de748e85c         move.l    -$18b8(a5), -$17a4(a5)
  00436c  3b7c0001e860         move.w    #$1, -$17a0(a5)
  004372  245f                 movea.l   (a7)+, a2
  004374  4e5e                 unlk      a6
  004376  4e75                 rts       

;-------------------------------------------------------------
; SATDRAWPICTS   (seg 7 +00438e, 230 bytes)
  00438e  4e56ffdc             link.w    a6, #$ffdc
  004392  48e71c20             movem.l   d3-d5/a2, -(a7)
  004396  382e000a             move.w    $a(a6), d4
  00439a  3a2e0008             move.w    $8(a6), d5
  00439e  486effde             pea.l     -$22(a6)
  0043a2  4ebafe8a             jsr       $422e(pc)   ; SATGETPORT
  0043a6  3b44e848             move.w    d4, -$17b8(a5)
  0043aa  3b45e84a             move.w    d5, -$17b6(a5)
  0043ae  0c6d0001e860         cmpi.w    #$1, -$17a0(a5)
  0043b4  5ec0                 sgt.b     d0
  0043b6  4400                 neg.b     d0
  0043b8  1d40ffdd             move.b    d0, -$23(a6)
  0043bc  4a44                 tst.w     d4
  0043be  56c0                 sne.b     d0
  0043c0  4400                 neg.b     d0
  0043c2  c02de8b4             and.b     -$174c(a5), d0
  0043c6  c02effdd             and.b     -$23(a6), d0
  0043ca  6704                 beq.b     $43d0
  0043cc  3604                 move.w    d4, d3
  0043ce  6002                 bra.b     $43d2
  0043d0  3605                 move.w    d5, d3
  0043d2  4a43                 tst.w     d3
  0043d4  6700008c             beq.w     $4462
  0043d8  4ebaff06             jsr       $42e0(pc)   ; SATSETPORTBACKSCREEN
  0043dc  4227                 clr.b     -(a7)
  0043de  a99b                 _SetResLoad 
  0043e0  594f                 subq.w    #$4, a7
  0043e2  2f2df6ea             move.l    -$916(a5), -(a7)
  0043e6  3f03                 move.w    d3, -(a7)
  0043e8  a9a0                 _GetResource 
  0043ea  205f                 movea.l   (a7)+, a0
  0043ec  2448                 movea.l   a0, a2
  0043ee  1f3c0001             move.b    #$1, -(a7)
  0043f2  a99b                 _SetResLoad 
  0043f4  200a                 move.l    a2, d0
  0043f6  660a                 bne.b     $4402
  0043f8  486dfaee             pea.l     -$512(a5)
  0043fc  4eb900001d5e         jsr       $1d5e.l   ; BAILOUT
  004402  486efff8             pea.l     -$8(a6)
  004406  42a7                 clr.l     -(a7)
  004408  3f2de808             move.w    -$17f8(a5), -(a7)
  00440c  3f2de80a             move.w    -$17f6(a5), -(a7)
  004410  a8a7                 _SetRect  
  004412  4ebafecc             jsr       $42e0(pc)   ; SATSETPORTBACKSCREEN
  004416  4a2de84c             tst.b     -$17b4(a5)
  00441a  670e                 beq.b     $442a
  00441c  3f03                 move.w    d3, -(a7)
  00441e  486efff8             pea.l     -$8(a6)
  004422  4eb9000022f6         jsr       $22f6.l   ; SATGETANDDRAWPICTRESINRECT
  004428  600c                 bra.b     $4436
  00442a  3f03                 move.w    d3, -(a7)
  00442c  486efff8             pea.l     -$8(a6)
  004430  4eb900002330         jsr       $2330.l   ; SATGETANDCENTERPICTRESINRECT
  004436  4ebafe82             jsr       $42ba(pc)   ; SATSETPORTOFFSCREEN
  00443a  206de826             movea.l   -$17da(a5), a0
  00443e  48680002             pea.l     $2(a0)
  004442  206de80c             movea.l   -$17f4(a5), a0
  004446  48680002             pea.l     $2(a0)
  00444a  206de80c             movea.l   -$17f4(a5), a0
  00444e  48680010             pea.l     $10(a0)
  004452  206de80c             movea.l   -$17f4(a5), a0
  004456  48680010             pea.l     $10(a0)
  00445a  4267                 clr.w     -(a7)
  00445c  48780000             pea.l     $0.w
  004460  a8ec                 _CopyBits 
  004462  486effde             pea.l     -$22(a6)
  004466  4ebafe10             jsr       $4278(pc)   ; SATSETPORT
  00446a  4cdf0438             movem.l   (a7)+, d3-d5/a2
  00446e  4e5e                 unlk      a6
  004470  2e9f                 move.l    (a7)+, (a7)
  004472  4e75                 rts       

;-------------------------------------------------------------
; SATSETUPOFFANDBACK   (seg 7 +004484, 334 bytes)
  004484  4e56fff0             link.w    a6, #$fff0
  004488  3b6e000ae848         move.w    $a(a6), -$17b8(a5)
  00448e  3b6e0008e84a         move.w    $8(a6), -$17b6(a5)
  004494  486efff8             pea.l     -$8(a6)
  004498  42a7                 clr.l     -(a7)
  00449a  7008                 moveq     #$8, d0
  00449c  d06de808             add.w     -$17f8(a5), d0
  0044a0  3f00                 move.w    d0, -(a7)
  0044a2  3f2de80a             move.w    -$17f6(a5), -(a7)
  0044a6  a8a7                 _SetRect  
  0044a8  4aade80c             tst.l     -$17f4(a5)
  0044ac  670a                 beq.b     $44b8
  0044ae  486de80c             pea.l     -$17f4(a5)
  0044b2  4eb900001cb8         jsr       $1cb8.l   ; SATDISPOSEOFFSCREEN
  0044b8  4aade826             tst.l     -$17da(a5)
  0044bc  670a                 beq.b     $44c8
  0044be  486de826             pea.l     -$17da(a5)
  0044c2  4eb900001cb8         jsr       $1cb8.l   ; SATDISPOSEOFFSCREEN
  0044c8  486de80c             pea.l     -$17f4(a5)
  0044cc  486efff8             pea.l     -$8(a6)
  0044d0  4ebaea92             jsr       $2f64(pc)   ; SATMAKEOFFSCREEN
  0044d4  486de826             pea.l     -$17da(a5)
  0044d8  486efff8             pea.l     -$8(a6)
  0044dc  4ebaea86             jsr       $2f64(pc)   ; SATMAKEOFFSCREEN
  0044e0  302efffe             move.w    -$2(a6), d0
  0044e4  5140                 subq.w    #$8, d0
  0044e6  3d40fffe             move.w    d0, -$2(a6)
  0044ea  206de80c             movea.l   -$17f4(a5), a0
  0044ee  316efffe0016         move.w    -$2(a6), $16(a0)
  0044f4  3b6efffee81e         move.w    -$2(a6), -$17e2(a5)
  0044fa  4a2de8b4             tst.b     -$174c(a5)
  0044fe  6710                 beq.b     $4510
  004500  206de80c             movea.l   -$17f4(a5), a0
  004504  20680002             movea.l   $2(a0), a0
  004508  2050                 movea.l   (a0), a0
  00450a  316efffe000c         move.w    -$2(a6), $c(a0)
  004510  206de826             movea.l   -$17da(a5), a0
  004514  316efffe0016         move.w    -$2(a6), $16(a0)
  00451a  3b6efffee838         move.w    -$2(a6), -$17c8(a5)
  004520  4a2de8b4             tst.b     -$174c(a5)
  004524  6710                 beq.b     $4536
  004526  206de826             movea.l   -$17da(a5), a0
  00452a  20680002             movea.l   $2(a0), a0
  00452e  2050                 movea.l   (a0), a0
  004530  316efffe000c         move.w    -$2(a6), $c(a0)
  004536  4aade7ee             tst.l     -$1812(a5)
  00453a  660a                 bne.b     $4546
  00453c  486dfbee             pea.l     -$412(a5)
  004540  4eb900001d5e         jsr       $1d5e.l   ; BAILOUT
  004546  2d6de858fff0         move.l    -$17a8(a5), -$10(a6)
  00454c  2d6de85cfff4         move.l    -$17a4(a5), -$c(a6)
  004552  486efff0             pea.l     -$10(a6)
  004556  302efff2             move.w    -$e(a6), d0
  00455a  4440                 neg.w     d0
  00455c  3f00                 move.w    d0, -(a7)
  00455e  302efff0             move.w    -$10(a6), d0
  004562  4440                 neg.w     d0
  004564  3f00                 move.w    d0, -(a7)
  004566  a8a8                 _OffsetRect 
  004568  4ebafd50             jsr       $42ba(pc)   ; SATSETPORTOFFSCREEN
  00456c  206de80c             movea.l   -$17f4(a5), a0
  004570  48680010             pea.l     $10(a0)
  004574  a87b                 _ClipRect 
  004576  206de826             movea.l   -$17da(a5), a0
  00457a  2f280018             move.l    $18(a0), -(a7)
  00457e  206de80c             movea.l   -$17f4(a5), a0
  004582  48680010             pea.l     $10(a0)
  004586  a8df                 _RectRgn  
  004588  206de80c             movea.l   -$17f4(a5), a0
  00458c  48680010             pea.l     $10(a0)
  004590  a8a2                 _PaintRect 
  004592  4ebafd4c             jsr       $42e0(pc)   ; SATSETPORTBACKSCREEN
  004596  206de826             movea.l   -$17da(a5), a0
  00459a  48680010             pea.l     $10(a0)
  00459e  a87b                 _ClipRect 
  0045a0  206de826             movea.l   -$17da(a5), a0
  0045a4  2f280018             move.l    $18(a0), -(a7)
  0045a8  206de826             movea.l   -$17da(a5), a0
  0045ac  48680010             pea.l     $10(a0)
  0045b0  a8df                 _RectRgn  
  0045b2  206de826             movea.l   -$17da(a5), a0
  0045b6  48680010             pea.l     $10(a0)
  0045ba  a8a2                 _PaintRect 
  0045bc  3f2e000a             move.w    $a(a6), -(a7)
  0045c0  3f2e0008             move.w    $8(a6), -(a7)
  0045c4  4ebafdc8             jsr       $438e(pc)   ; SATDRAWPICTS
  0045c8  4ebafd3e             jsr       $4308(pc)   ; SATSETPORTSCREEN
  0045cc  4e5e                 unlk      a6
  0045ce  2e9f                 move.l    (a7)+, (a7)
  0045d0  4e75                 rts       

;-------------------------------------------------------------
; SATREDRAW   (seg 7 +0045e8, 212 bytes)
  0045e8  4e56ffde             link.w    a6, #$ffde
  0045ec  486effde             pea.l     -$22(a6)
  0045f0  4ebafc3c             jsr       $422e(pc)   ; SATGETPORT
  0045f4  4ebafd12             jsr       $4308(pc)   ; SATSETPORTSCREEN
  0045f8  486efff8             pea.l     -$8(a6)
  0045fc  206de7ee             movea.l   -$1812(a5), a0
  004600  3f280012             move.w    $12(a0), -(a7)
  004604  206de7ee             movea.l   -$1812(a5), a0
  004608  3f280010             move.w    $10(a0), -(a7)
  00460c  4267                 clr.w     -(a7)
  00460e  206de7ee             movea.l   -$1812(a5), a0
  004612  3f280014             move.w    $14(a0), -(a7)
  004616  a8a7                 _SetRect  
  004618  486efff8             pea.l     -$8(a6)
  00461c  a8a2                 _PaintRect 
  00461e  486efff8             pea.l     -$8(a6)
  004622  4267                 clr.w     -(a7)
  004624  206de7ee             movea.l   -$1812(a5), a0
  004628  3f280010             move.w    $10(a0), -(a7)
  00462c  3f2de808             move.w    -$17f8(a5), -(a7)
  004630  4267                 clr.w     -(a7)
  004632  a8a7                 _SetRect  
  004634  486efff8             pea.l     -$8(a6)
  004638  a8a2                 _PaintRect 
  00463a  486efff8             pea.l     -$8(a6)
  00463e  4267                 clr.w     -(a7)
  004640  3f2de80a             move.w    -$17f6(a5), -(a7)
  004644  206de7ee             movea.l   -$1812(a5), a0
  004648  3f280016             move.w    $16(a0), -(a7)
  00464c  206de7ee             movea.l   -$1812(a5), a0
  004650  3f280014             move.w    $14(a0), -(a7)
  004654  a8a7                 _SetRect  
  004656  486efff8             pea.l     -$8(a6)
  00465a  a8a2                 _PaintRect 
  00465c  486efff8             pea.l     -$8(a6)
  004660  3f2de808             move.w    -$17f8(a5), -(a7)
  004664  206de7ee             movea.l   -$1812(a5), a0
  004668  3f280010             move.w    $10(a0), -(a7)
  00466c  206de7ee             movea.l   -$1812(a5), a0
  004670  3f280016             move.w    $16(a0), -(a7)
  004674  3f2de80a             move.w    -$17f6(a5), -(a7)
  004678  a8a7                 _SetRect  
  00467a  486efff8             pea.l     -$8(a6)
  00467e  a8a2                 _PaintRect 
  004680  486efff8             pea.l     -$8(a6)
  004684  42a7                 clr.l     -(a7)
  004686  3f2de808             move.w    -$17f8(a5), -(a7)
  00468a  3f2de80a             move.w    -$17f6(a5), -(a7)
  00468e  a8a7                 _SetRect  
  004690  206de80c             movea.l   -$17f4(a5), a0
  004694  48680002             pea.l     $2(a0)
  004698  206de7ee             movea.l   -$1812(a5), a0
  00469c  48680002             pea.l     $2(a0)
  0046a0  486efff8             pea.l     -$8(a6)
  0046a4  486efff8             pea.l     -$8(a6)
  0046a8  4267                 clr.w     -(a7)
  0046aa  48780000             pea.l     $0.w
  0046ae  a8ec                 _CopyBits 
  0046b0  486effde             pea.l     -$22(a6)
  0046b4  4ebafbc2             jsr       $4278(pc)   ; SATSETPORT
  0046b8  4e5e                 unlk      a6
  0046ba  4e75                 rts       

;-------------------------------------------------------------
; SATBACKCHANGED   (seg 7 +0046c8, 104 bytes)
  0046c8  4e560000             link.w    a6, #$0
  0046cc  48e70030             movem.l   a2-a3, -(a7)
  0046d0  246e0008             movea.l   $8(a6), a2
  0046d4  4a52                 tst.w     (a2)
  0046d6  6c02                 bge.b     $46da
  0046d8  4252                 clr.w     (a2)
  0046da  302a0004             move.w    $4(a2), d0
  0046de  b06de80a             cmp.w     -$17f6(a5), d0
  0046e2  6f06                 ble.b     $46ea
  0046e4  356de80a0004         move.w    -$17f6(a5), $4(a2)
  0046ea  4a6a0002             tst.w     $2(a2)
  0046ee  6c04                 bge.b     $46f4
  0046f0  426a0002             clr.w     $2(a2)
  0046f4  302a0006             move.w    $6(a2), d0
  0046f8  b06de808             cmp.w     -$17f8(a5), d0
  0046fc  6f06                 ble.b     $4704
  0046fe  356de8080006         move.w    -$17f8(a5), $6(a2)
  004704  594f                 subq.w    #$4, a7
  004706  4878000c             pea.l     $c.w
  00470a  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  004710  205f                 movea.l   (a7)+, a0
  004712  2648                 movea.l   a0, a3
  004714  276de86a0008         move.l    -$1796(a5), $8(a3)
  00471a  2692                 move.l    (a2), (a3)
  00471c  276a00040004         move.l    $4(a2), $4(a3)
  004722  2b4be86a             move.l    a3, -$1796(a5)
  004726  4cdf0c00             movem.l   (a7)+, a2-a3
  00472a  4e5e                 unlk      a6
  00472c  2e9f                 move.l    (a7)+, (a7)
  00472e  4e75                 rts       

;-------------------------------------------------------------
; SATNOP   (seg 7 +004742, 10 bytes)
  004742  4e560000             link.w    a6, #$0
  004746  4e5e                 unlk      a6
  004748  2e9f                 move.l    (a7)+, (a7)
  00474a  4e75                 rts       

;-------------------------------------------------------------
; SATNEWSPRITEPP   (seg 7 +004756, 338 bytes)
  004756  4e560000             link.w    a6, #$0
  00475a  48e71038             movem.l   d3/a2-a4, -(a7)
  00475e  286e0016             movea.l   $16(a6), a4
  004762  266e0012             movea.l   $12(a6), a3
  004766  262e0008             move.l    $8(a6), d3
  00476a  4a2de7e5             tst.b     -$181b(a5)
  00476e  6606                 bne.b     $4776
  004770  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  004776  200b                 move.l    a3, d0
  004778  6658                 bne.b     $47d2
  00477a  4aade8fe             tst.l     -$1702(a5)
  00477e  6740                 beq.b     $47c0
  004780  246de8fe             movea.l   -$1702(a5), a2
  004784  206de8fe             movea.l   -$1702(a5), a0
  004788  2b68002ee8fe         move.l    $2e(a0), -$1702(a5)
  00478e  42aa001a             clr.l     $1a(a2)
  004792  42aa001e             clr.l     $1e(a2)
  004796  42aa0022             clr.l     $22(a2)
  00479a  42aa0016             clr.l     $16(a2)
  00479e  42aa0046             clr.l     $46(a2)
  0047a2  486a003e             pea.l     $3e(a2)
  0047a6  42a7                 clr.l     -(a7)
  0047a8  42a7                 clr.l     -(a7)
  0047aa  a8a7                 _SetRect  
  0047ac  486a0036             pea.l     $36(a2)
  0047b0  42a7                 clr.l     -(a7)
  0047b2  42a7                 clr.l     -(a7)
  0047b4  a8a7                 _SetRect  
  0047b6  42aa002a             clr.l     $2a(a2)
  0047ba  42aa0026             clr.l     $26(a2)
  0047be  6048                 bra.b     $4808
  0047c0  594f                 subq.w    #$4, a7
  0047c2  2f2de7e6             move.l    -$181a(a5), -(a7)
  0047c6  4eb900001df8         jsr       $1df8.l   ; SATNEWPTR
  0047cc  205f                 movea.l   (a7)+, a0
  0047ce  2448                 movea.l   a0, a2
  0047d0  6036                 bra.b     $4808
  0047d2  244b                 movea.l   a3, a2
  0047d4  42aa001a             clr.l     $1a(a2)
  0047d8  42aa001e             clr.l     $1e(a2)
  0047dc  42aa0022             clr.l     $22(a2)
  0047e0  42aa0016             clr.l     $16(a2)
  0047e4  42aa0016             clr.l     $16(a2)
  0047e8  42aa0046             clr.l     $46(a2)
  0047ec  486a003e             pea.l     $3e(a2)
  0047f0  42a7                 clr.l     -(a7)
  0047f2  42a7                 clr.l     -(a7)
  0047f4  a8a7                 _SetRect  
  0047f6  486a0036             pea.l     $36(a2)
  0047fa  42a7                 clr.l     -(a7)
  0047fc  42a7                 clr.l     -(a7)
  0047fe  a8a7                 _SetRect  
  004800  42aa002a             clr.l     $2a(a2)
  004804  42aa0026             clr.l     $26(a2)
  004808  200a                 move.l    a2, d0
  00480a  6756                 beq.b     $4862
  00480c  264a                 movea.l   a2, a3
  00480e  36ae0010             move.w    $10(a6), (a3)
  004812  376e000e0004         move.w    $e(a6), $4(a3)
  004818  376e000c0002         move.w    $c(a6), $2(a3)
  00481e  276b0002002a         move.l    $2(a3), $2a(a3)
  004824  200c                 move.l    a4, d0
  004826  661e                 bne.b     $4846
  004828  276de866002e         move.l    -$179a(a5), $2e(a3)
  00482e  42ab0032             clr.l     $32(a3)
  004832  2b4ae866             move.l    a2, -$179a(a5)
  004836  4aab002e             tst.l     $2e(a3)
  00483a  6726                 beq.b     $4862
  00483c  206b002e             movea.l   $2e(a3), a0
  004840  214a0032             move.l    a2, $32(a0)
  004844  601c                 bra.b     $4862
  004846  276c002e002e         move.l    $2e(a4), $2e(a3)
  00484c  274c0032             move.l    a4, $32(a3)
  004850  294a002e             move.l    a2, $2e(a4)
  004854  4aab002e             tst.l     $2e(a3)
  004858  6708                 beq.b     $4862
  00485a  206b002e             movea.l   $2e(a3), a0
  00485e  214a0032             move.l    a2, $32(a0)
  004862  200a                 move.l    a2, d0
  004864  6730                 beq.b     $4896
  004866  4a83                 tst.l     d3
  004868  6724                 beq.b     $488e
  00486a  2f0a                 move.l    a2, -(a7)
  00486c  2f03                 move.l    d3, -(a7)
  00486e  205f                 movea.l   (a7)+, a0
  004870  4e90                 jsr       (a0)
  004872  256a0006000e         move.l    $6(a2), $e(a2)
  004878  256a000a0012         move.l    $a(a2), $12(a2)
  00487e  486a000e             pea.l     $e(a2)
  004882  3f2a0004             move.w    $4(a2), -(a7)
  004886  3f2a0002             move.w    $2(a2), -(a7)
  00488a  a8a8                 _OffsetRect 
  00488c  6008                 bra.b     $4896
  00488e  41ed00f8             lea.l     $f8(a5), a0
  004892  2548001a             move.l    a0, $1a(a2)
  004896  2d4a001a             move.l    a2, $1a(a6)
  00489a  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  00489e  4e5e                 unlk      a6
  0048a0  205f                 movea.l   (a7)+, a0
  0048a2  4fef0012             lea.l     $12(a7), a7
  0048a6  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATNEWSPRITE   (seg 7 +0048ba, 50 bytes)
  0048ba  4e560000             link.w    a6, #$0
  0048be  594f                 subq.w    #$4, a7
  0048c0  48780000             pea.l     $0.w
  0048c4  48780000             pea.l     $0.w
  0048c8  3f2e0010             move.w    $10(a6), -(a7)
  0048cc  3f2e000e             move.w    $e(a6), -(a7)
  0048d0  3f2e000c             move.w    $c(a6), -(a7)
  0048d4  2f2e0008             move.l    $8(a6), -(a7)
  0048d8  4ebafe7c             jsr       $4756(pc)   ; SATNEWSPRITEPP
  0048dc  205f                 movea.l   (a7)+, a0
  0048de  2d480012             move.l    a0, $12(a6)
  0048e2  4e5e                 unlk      a6
  0048e4  205f                 movea.l   (a7)+, a0
  0048e6  4fef000a             lea.l     $a(a7), a7
  0048ea  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; MYSECTRECT   (seg 7 +0048fc, 96 bytes)
  0048fc  4e56fffe             link.w    a6, #$fffe
  004900  48e70030             movem.l   a2-a3, -(a7)
  004904  266e0010             movea.l   $10(a6), a3
  004908  246e000c             movea.l   $c(a6), a2
  00490c  302a0002             move.w    $2(a2), d0
  004910  b06b0006             cmp.w     $6(a3), d0
  004914  5dc0                 slt.b     d0
  004916  4400                 neg.b     d0
  004918  1d40fffe             move.b    d0, -$2(a6)
  00491c  302b0002             move.w    $2(a3), d0
  004920  b06a0006             cmp.w     $6(a2), d0
  004924  5dc0                 slt.b     d0
  004926  4400                 neg.b     d0
  004928  1d40ffff             move.b    d0, -$1(a6)
  00492c  3012                 move.w    (a2), d0
  00492e  b06b0004             cmp.w     $4(a3), d0
  004932  5dc0                 slt.b     d0
  004934  4400                 neg.b     d0
  004936  3213                 move.w    (a3), d1
  004938  b26a0004             cmp.w     $4(a2), d1
  00493c  5dc1                 slt.b     d1
  00493e  4401                 neg.b     d1
  004940  c200                 and.b     d0, d1
  004942  c22effff             and.b     -$1(a6), d1
  004946  c22efffe             and.b     -$2(a6), d1
  00494a  1d410014             move.b    d1, $14(a6)
  00494e  4cdf0c00             movem.l   (a7)+, a2-a3
  004952  4e5e                 unlk      a6
  004954  205f                 movea.l   (a7)+, a0
  004956  4fef000c             lea.l     $c(a7), a7
  00495a  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; KindSearch0   (seg 7 +00496a, 270 bytes)
  00496a  4e56fff8             link.w    a6, #$fff8
  00496e  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  004972  266de866             movea.l   -$179a(a5), a3
  004976  422de86e             clr.b     -$1792(a5)
  00497a  600000ec             bra.w     $4a68
  00497e  4a53                 tst.w     (a3)
  004980  6f0000d2             ble.w     $4a54
  004984  382b0002             move.w    $2(a3), d4
  004988  d86de852             add.w     -$17ae(a5), d4
  00498c  362b0002             move.w    $2(a3), d3
  004990  966de852             sub.w     -$17ae(a5), d3
  004994  246b002e             movea.l   $2e(a3), a2
  004998  6056                 bra.b     $49f0
  00499a  4a52                 tst.w     (a2)
  00499c  6c42                 bge.b     $49e0
  00499e  554f                 subq.w    #$2, a7
  0049a0  486b000e             pea.l     $e(a3)
  0049a4  486a000e             pea.l     $e(a2)
  0049a8  486efff8             pea.l     -$8(a6)
  0049ac  4ebaff4e             jsr       $48fc(pc)   ; MYSECTRECT
  0049b0  101f                 move.b    (a7)+, d0
  0049b2  672c                 beq.b     $49e0
  0049b4  36bc000a             move.w    #$a, (a3)
  0049b8  34bcfff6             move.w    #$fff6, (a2)
  0049bc  4aab001e             tst.l     $1e(a3)
  0049c0  670c                 beq.b     $49ce
  0049c2  2f0b                 move.l    a3, -(a7)
  0049c4  2f0a                 move.l    a2, -(a7)
  0049c6  2f2b001e             move.l    $1e(a3), -(a7)
  0049ca  205f                 movea.l   (a7)+, a0
  0049cc  4e90                 jsr       (a0)
  0049ce  4aaa001e             tst.l     $1e(a2)
  0049d2  670c                 beq.b     $49e0
  0049d4  2f0a                 move.l    a2, -(a7)
  0049d6  2f0b                 move.l    a3, -(a7)
  0049d8  2f2a001e             move.l    $1e(a2), -(a7)
  0049dc  205f                 movea.l   (a7)+, a0
  0049de  4e90                 jsr       (a0)
  0049e0  246a002e             movea.l   $2e(a2), a2
  0049e4  200a                 move.l    a2, d0
  0049e6  6708                 beq.b     $49f0
  0049e8  b86a0002             cmp.w     $2(a2), d4
  0049ec  6c02                 bge.b     $49f0
  0049ee  95ca                 suba.l    a2, a2
  0049f0  200a                 move.l    a2, d0
  0049f2  66a6                 bne.b     $499a
  0049f4  246b0032             movea.l   $32(a3), a2
  0049f8  6056                 bra.b     $4a50
  0049fa  4a52                 tst.w     (a2)
  0049fc  6c42                 bge.b     $4a40
  0049fe  554f                 subq.w    #$2, a7
  004a00  486b000e             pea.l     $e(a3)
  004a04  486a000e             pea.l     $e(a2)
  004a08  486efff8             pea.l     -$8(a6)
  004a0c  4ebafeee             jsr       $48fc(pc)   ; MYSECTRECT
  004a10  101f                 move.b    (a7)+, d0
  004a12  672c                 beq.b     $4a40
  004a14  36bc000a             move.w    #$a, (a3)
  004a18  34bcfff6             move.w    #$fff6, (a2)
  004a1c  4aab001e             tst.l     $1e(a3)
  004a20  670c                 beq.b     $4a2e
  004a22  2f0b                 move.l    a3, -(a7)
  004a24  2f0a                 move.l    a2, -(a7)
  004a26  2f2b001e             move.l    $1e(a3), -(a7)
  004a2a  205f                 movea.l   (a7)+, a0
  004a2c  4e90                 jsr       (a0)
  004a2e  4aaa001e             tst.l     $1e(a2)
  004a32  670c                 beq.b     $4a40
  004a34  2f0a                 move.l    a2, -(a7)
  004a36  2f0b                 move.l    a3, -(a7)
  004a38  2f2a001e             move.l    $1e(a2), -(a7)
  004a3c  205f                 movea.l   (a7)+, a0
  004a3e  4e90                 jsr       (a0)
  004a40  246a0032             movea.l   $32(a2), a2
  004a44  200a                 move.l    a2, d0
  004a46  6708                 beq.b     $4a50
  004a48  b66a0002             cmp.w     $2(a2), d3
  004a4c  6f02                 ble.b     $4a50
  004a4e  95ca                 suba.l    a2, a2
  004a50  200a                 move.l    a2, d0
  004a52  66a6                 bne.b     $49fa
  004a54  0c53ffff             cmpi.w    #$ffff, (a3)
  004a58  5dc0                 slt.b     d0
  004a5a  4400                 neg.b     d0
  004a5c  802de86e             or.b      -$1792(a5), d0
  004a60  1b40e86e             move.b    d0, -$1792(a5)
  004a64  266b002e             movea.l   $2e(a3), a3
  004a68  200b                 move.l    a3, d0
  004a6a  6600ff12             bne.w     $497e
  004a6e  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  004a72  4e5e                 unlk      a6
  004a74  2e9f                 move.l    (a7)+, (a7)
  004a76  4e75                 rts       

;-------------------------------------------------------------
; ForwardSearch1   (seg 7 +004a86, 128 bytes)
  004a86  4e56fff8             link.w    a6, #$fff8
  004a8a  48e71030             movem.l   d3/a2-a3, -(a7)
  004a8e  266de866             movea.l   -$179a(a5), a3
  004a92  422de86e             clr.b     -$1792(a5)
  004a96  6060                 bra.b     $4af8
  004a98  362b0002             move.w    $2(a3), d3
  004a9c  d66de852             add.w     -$17ae(a5), d3
  004aa0  246b002e             movea.l   $2e(a3), a2
  004aa4  604a                 bra.b     $4af0
  004aa6  554f                 subq.w    #$2, a7
  004aa8  486b000e             pea.l     $e(a3)
  004aac  486a000e             pea.l     $e(a2)
  004ab0  486efff8             pea.l     -$8(a6)
  004ab4  4ebafe46             jsr       $48fc(pc)   ; MYSECTRECT
  004ab8  101f                 move.b    (a7)+, d0
  004aba  6724                 beq.b     $4ae0
  004abc  4aab001e             tst.l     $1e(a3)
  004ac0  670c                 beq.b     $4ace
  004ac2  2f0b                 move.l    a3, -(a7)
  004ac4  2f0a                 move.l    a2, -(a7)
  004ac6  2f2b001e             move.l    $1e(a3), -(a7)
  004aca  205f                 movea.l   (a7)+, a0
  004acc  4e90                 jsr       (a0)
  004ace  4aaa001e             tst.l     $1e(a2)
  004ad2  670c                 beq.b     $4ae0
  004ad4  2f0a                 move.l    a2, -(a7)
  004ad6  2f0b                 move.l    a3, -(a7)
  004ad8  2f2a001e             move.l    $1e(a2), -(a7)
  004adc  205f                 movea.l   (a7)+, a0
  004ade  4e90                 jsr       (a0)
  004ae0  246a002e             movea.l   $2e(a2), a2
  004ae4  200a                 move.l    a2, d0
  004ae6  6708                 beq.b     $4af0
  004ae8  b66a0002             cmp.w     $2(a2), d3
  004aec  6c02                 bge.b     $4af0
  004aee  95ca                 suba.l    a2, a2
  004af0  200a                 move.l    a2, d0
  004af2  66b2                 bne.b     $4aa6
  004af4  266b002e             movea.l   $2e(a3), a3
  004af8  200b                 move.l    a3, d0
  004afa  669c                 bne.b     $4a98
  004afc  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004b00  4e5e                 unlk      a6
  004b02  2e9f                 move.l    (a7)+, (a7)
  004b04  4e75                 rts       

;-------------------------------------------------------------
; ForwardOneSearch2   (seg 7 +004b18, 130 bytes)
  004b18  4e56fff8             link.w    a6, #$fff8
  004b1c  48e71030             movem.l   d3/a2-a3, -(a7)
  004b20  266de866             movea.l   -$179a(a5), a3
  004b24  422de86e             clr.b     -$1792(a5)
  004b28  6062                 bra.b     $4b8c
  004b2a  362b0002             move.w    $2(a3), d3
  004b2e  d66de852             add.w     -$17ae(a5), d3
  004b32  246b002e             movea.l   $2e(a3), a2
  004b36  604c                 bra.b     $4b84
  004b38  554f                 subq.w    #$2, a7
  004b3a  486b000e             pea.l     $e(a3)
  004b3e  486a000e             pea.l     $e(a2)
  004b42  486efff8             pea.l     -$8(a6)
  004b46  4ebafdb4             jsr       $48fc(pc)   ; MYSECTRECT
  004b4a  101f                 move.b    (a7)+, d0
  004b4c  6726                 beq.b     $4b74
  004b4e  4aab001e             tst.l     $1e(a3)
  004b52  670e                 beq.b     $4b62
  004b54  2f0b                 move.l    a3, -(a7)
  004b56  2f0a                 move.l    a2, -(a7)
  004b58  2f2b001e             move.l    $1e(a3), -(a7)
  004b5c  205f                 movea.l   (a7)+, a0
  004b5e  4e90                 jsr       (a0)
  004b60  6012                 bra.b     $4b74
  004b62  4aaa001e             tst.l     $1e(a2)
  004b66  670c                 beq.b     $4b74
  004b68  2f0a                 move.l    a2, -(a7)
  004b6a  2f0b                 move.l    a3, -(a7)
  004b6c  2f2a001e             move.l    $1e(a2), -(a7)
  004b70  205f                 movea.l   (a7)+, a0
  004b72  4e90                 jsr       (a0)
  004b74  246a002e             movea.l   $2e(a2), a2
  004b78  200a                 move.l    a2, d0
  004b7a  6708                 beq.b     $4b84
  004b7c  b66a0002             cmp.w     $2(a2), d3
  004b80  6c02                 bge.b     $4b84
  004b82  95ca                 suba.l    a2, a2
  004b84  200a                 move.l    a2, d0
  004b86  66b0                 bne.b     $4b38
  004b88  266b002e             movea.l   $2e(a3), a3
  004b8c  200b                 move.l    a3, d0
  004b8e  669a                 bne.b     $4b2a
  004b90  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004b94  4e5e                 unlk      a6
  004b96  2e9f                 move.l    (a7)+, (a7)
  004b98  4e75                 rts       

;-------------------------------------------------------------
; BackwardSearch3   (seg 7 +004bae, 128 bytes)
  004bae  4e56fff8             link.w    a6, #$fff8
  004bb2  48e71030             movem.l   d3/a2-a3, -(a7)
  004bb6  266de866             movea.l   -$179a(a5), a3
  004bba  422de86e             clr.b     -$1792(a5)
  004bbe  6060                 bra.b     $4c20
  004bc0  362b0002             move.w    $2(a3), d3
  004bc4  966de852             sub.w     -$17ae(a5), d3
  004bc8  246b0032             movea.l   $32(a3), a2
  004bcc  604a                 bra.b     $4c18
  004bce  554f                 subq.w    #$2, a7
  004bd0  486b000e             pea.l     $e(a3)
  004bd4  486a000e             pea.l     $e(a2)
  004bd8  486efff8             pea.l     -$8(a6)
  004bdc  4ebafd1e             jsr       $48fc(pc)   ; MYSECTRECT
  004be0  101f                 move.b    (a7)+, d0
  004be2  6724                 beq.b     $4c08
  004be4  4aab001e             tst.l     $1e(a3)
  004be8  670c                 beq.b     $4bf6
  004bea  2f0b                 move.l    a3, -(a7)
  004bec  2f0a                 move.l    a2, -(a7)
  004bee  2f2b001e             move.l    $1e(a3), -(a7)
  004bf2  205f                 movea.l   (a7)+, a0
  004bf4  4e90                 jsr       (a0)
  004bf6  4aaa001e             tst.l     $1e(a2)
  004bfa  670c                 beq.b     $4c08
  004bfc  2f0a                 move.l    a2, -(a7)
  004bfe  2f0b                 move.l    a3, -(a7)
  004c00  2f2a001e             move.l    $1e(a2), -(a7)
  004c04  205f                 movea.l   (a7)+, a0
  004c06  4e90                 jsr       (a0)
  004c08  246a0032             movea.l   $32(a2), a2
  004c0c  200a                 move.l    a2, d0
  004c0e  6708                 beq.b     $4c18
  004c10  b66a0002             cmp.w     $2(a2), d3
  004c14  6f02                 ble.b     $4c18
  004c16  95ca                 suba.l    a2, a2
  004c18  200a                 move.l    a2, d0
  004c1a  66b2                 bne.b     $4bce
  004c1c  266b002e             movea.l   $2e(a3), a3
  004c20  200b                 move.l    a3, d0
  004c22  669c                 bne.b     $4bc0
  004c24  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004c28  4e5e                 unlk      a6
  004c2a  2e9f                 move.l    (a7)+, (a7)
  004c2c  4e75                 rts       

;-------------------------------------------------------------
; AppKindSearch4   (seg 7 +004c40, 270 bytes)
  004c40  4e56fff8             link.w    a6, #$fff8
  004c44  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  004c48  266de866             movea.l   -$179a(a5), a3
  004c4c  422de86e             clr.b     -$1792(a5)
  004c50  600000ec             bra.w     $4d3e
  004c54  4a53                 tst.w     (a3)
  004c56  6f0000d2             ble.w     $4d2a
  004c5a  382b004c             move.w    $4c(a3), d4
  004c5e  d86de852             add.w     -$17ae(a5), d4
  004c62  362b004c             move.w    $4c(a3), d3
  004c66  966de852             sub.w     -$17ae(a5), d3
  004c6a  246b002e             movea.l   $2e(a3), a2
  004c6e  6056                 bra.b     $4cc6
  004c70  4a52                 tst.w     (a2)
  004c72  6c42                 bge.b     $4cb6
  004c74  554f                 subq.w    #$2, a7
  004c76  486b000e             pea.l     $e(a3)
  004c7a  486a000e             pea.l     $e(a2)
  004c7e  486efff8             pea.l     -$8(a6)
  004c82  4ebafc78             jsr       $48fc(pc)   ; MYSECTRECT
  004c86  101f                 move.b    (a7)+, d0
  004c88  672c                 beq.b     $4cb6
  004c8a  36bc000a             move.w    #$a, (a3)
  004c8e  34bcfff6             move.w    #$fff6, (a2)
  004c92  4aab001e             tst.l     $1e(a3)
  004c96  670c                 beq.b     $4ca4
  004c98  2f0b                 move.l    a3, -(a7)
  004c9a  2f0a                 move.l    a2, -(a7)
  004c9c  2f2b001e             move.l    $1e(a3), -(a7)
  004ca0  205f                 movea.l   (a7)+, a0
  004ca2  4e90                 jsr       (a0)
  004ca4  4aaa001e             tst.l     $1e(a2)
  004ca8  670c                 beq.b     $4cb6
  004caa  2f0a                 move.l    a2, -(a7)
  004cac  2f0b                 move.l    a3, -(a7)
  004cae  2f2a001e             move.l    $1e(a2), -(a7)
  004cb2  205f                 movea.l   (a7)+, a0
  004cb4  4e90                 jsr       (a0)
  004cb6  246a002e             movea.l   $2e(a2), a2
  004cba  200a                 move.l    a2, d0
  004cbc  6708                 beq.b     $4cc6
  004cbe  b86a004c             cmp.w     $4c(a2), d4
  004cc2  6c02                 bge.b     $4cc6
  004cc4  95ca                 suba.l    a2, a2
  004cc6  200a                 move.l    a2, d0
  004cc8  66a6                 bne.b     $4c70
  004cca  246b0032             movea.l   $32(a3), a2
  004cce  6056                 bra.b     $4d26
  004cd0  4a52                 tst.w     (a2)
  004cd2  6c42                 bge.b     $4d16
  004cd4  554f                 subq.w    #$2, a7
  004cd6  486b000e             pea.l     $e(a3)
  004cda  486a000e             pea.l     $e(a2)
  004cde  486efff8             pea.l     -$8(a6)
  004ce2  4ebafc18             jsr       $48fc(pc)   ; MYSECTRECT
  004ce6  101f                 move.b    (a7)+, d0
  004ce8  672c                 beq.b     $4d16
  004cea  36bc000a             move.w    #$a, (a3)
  004cee  34bcfff6             move.w    #$fff6, (a2)
  004cf2  4aab001e             tst.l     $1e(a3)
  004cf6  670c                 beq.b     $4d04
  004cf8  2f0b                 move.l    a3, -(a7)
  004cfa  2f0a                 move.l    a2, -(a7)
  004cfc  2f2b001e             move.l    $1e(a3), -(a7)
  004d00  205f                 movea.l   (a7)+, a0
  004d02  4e90                 jsr       (a0)
  004d04  4aaa001e             tst.l     $1e(a2)
  004d08  670c                 beq.b     $4d16
  004d0a  2f0a                 move.l    a2, -(a7)
  004d0c  2f0b                 move.l    a3, -(a7)
  004d0e  2f2a001e             move.l    $1e(a2), -(a7)
  004d12  205f                 movea.l   (a7)+, a0
  004d14  4e90                 jsr       (a0)
  004d16  246a0032             movea.l   $32(a2), a2
  004d1a  200a                 move.l    a2, d0
  004d1c  6708                 beq.b     $4d26
  004d1e  b66a004c             cmp.w     $4c(a2), d3
  004d22  6f02                 ble.b     $4d26
  004d24  95ca                 suba.l    a2, a2
  004d26  200a                 move.l    a2, d0
  004d28  66a6                 bne.b     $4cd0
  004d2a  0c53ffff             cmpi.w    #$ffff, (a3)
  004d2e  5dc0                 slt.b     d0
  004d30  4400                 neg.b     d0
  004d32  802de86e             or.b      -$1792(a5), d0
  004d36  1b40e86e             move.b    d0, -$1792(a5)
  004d3a  266b002e             movea.l   $2e(a3), a3
  004d3e  200b                 move.l    a3, d0
  004d40  6600ff12             bne.w     $4c54
  004d44  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  004d48  4e5e                 unlk      a6
  004d4a  2e9f                 move.l    (a7)+, (a7)
  004d4c  4e75                 rts       

;-------------------------------------------------------------
; AppForwardSearch5   (seg 7 +004d60, 128 bytes)
  004d60  4e56fff8             link.w    a6, #$fff8
  004d64  48e71030             movem.l   d3/a2-a3, -(a7)
  004d68  266de866             movea.l   -$179a(a5), a3
  004d6c  422de86e             clr.b     -$1792(a5)
  004d70  6060                 bra.b     $4dd2
  004d72  362b004c             move.w    $4c(a3), d3
  004d76  d66de852             add.w     -$17ae(a5), d3
  004d7a  246b002e             movea.l   $2e(a3), a2
  004d7e  604a                 bra.b     $4dca
  004d80  554f                 subq.w    #$2, a7
  004d82  486b000e             pea.l     $e(a3)
  004d86  486a000e             pea.l     $e(a2)
  004d8a  486efff8             pea.l     -$8(a6)
  004d8e  4ebafb6c             jsr       $48fc(pc)   ; MYSECTRECT
  004d92  101f                 move.b    (a7)+, d0
  004d94  6724                 beq.b     $4dba
  004d96  4aab001e             tst.l     $1e(a3)
  004d9a  670c                 beq.b     $4da8
  004d9c  2f0b                 move.l    a3, -(a7)
  004d9e  2f0a                 move.l    a2, -(a7)
  004da0  2f2b001e             move.l    $1e(a3), -(a7)
  004da4  205f                 movea.l   (a7)+, a0
  004da6  4e90                 jsr       (a0)
  004da8  4aaa001e             tst.l     $1e(a2)
  004dac  670c                 beq.b     $4dba
  004dae  2f0a                 move.l    a2, -(a7)
  004db0  2f0b                 move.l    a3, -(a7)
  004db2  2f2a001e             move.l    $1e(a2), -(a7)
  004db6  205f                 movea.l   (a7)+, a0
  004db8  4e90                 jsr       (a0)
  004dba  246a002e             movea.l   $2e(a2), a2
  004dbe  200a                 move.l    a2, d0
  004dc0  6708                 beq.b     $4dca
  004dc2  b66a004c             cmp.w     $4c(a2), d3
  004dc6  6c02                 bge.b     $4dca
  004dc8  95ca                 suba.l    a2, a2
  004dca  200a                 move.l    a2, d0
  004dcc  66b2                 bne.b     $4d80
  004dce  266b002e             movea.l   $2e(a3), a3
  004dd2  200b                 move.l    a3, d0
  004dd4  669c                 bne.b     $4d72
  004dd6  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004dda  4e5e                 unlk      a6
  004ddc  2e9f                 move.l    (a7)+, (a7)
  004dde  4e75                 rts       

;-------------------------------------------------------------
; AppForwardOneSearch6   (seg 7 +004df4, 130 bytes)
  004df4  4e56fff8             link.w    a6, #$fff8
  004df8  48e71030             movem.l   d3/a2-a3, -(a7)
  004dfc  266de866             movea.l   -$179a(a5), a3
  004e00  422de86e             clr.b     -$1792(a5)
  004e04  6062                 bra.b     $4e68
  004e06  362b004c             move.w    $4c(a3), d3
  004e0a  d66de852             add.w     -$17ae(a5), d3
  004e0e  246b002e             movea.l   $2e(a3), a2
  004e12  604c                 bra.b     $4e60
  004e14  554f                 subq.w    #$2, a7
  004e16  486b000e             pea.l     $e(a3)
  004e1a  486a000e             pea.l     $e(a2)
  004e1e  486efff8             pea.l     -$8(a6)
  004e22  4ebafad8             jsr       $48fc(pc)   ; MYSECTRECT
  004e26  101f                 move.b    (a7)+, d0
  004e28  6726                 beq.b     $4e50
  004e2a  4aab001e             tst.l     $1e(a3)
  004e2e  670e                 beq.b     $4e3e
  004e30  2f0b                 move.l    a3, -(a7)
  004e32  2f0a                 move.l    a2, -(a7)
  004e34  2f2b001e             move.l    $1e(a3), -(a7)
  004e38  205f                 movea.l   (a7)+, a0
  004e3a  4e90                 jsr       (a0)
  004e3c  6012                 bra.b     $4e50
  004e3e  4aaa001e             tst.l     $1e(a2)
  004e42  670c                 beq.b     $4e50
  004e44  2f0a                 move.l    a2, -(a7)
  004e46  2f0b                 move.l    a3, -(a7)
  004e48  2f2a001e             move.l    $1e(a2), -(a7)
  004e4c  205f                 movea.l   (a7)+, a0
  004e4e  4e90                 jsr       (a0)
  004e50  246a002e             movea.l   $2e(a2), a2
  004e54  200a                 move.l    a2, d0
  004e56  6708                 beq.b     $4e60
  004e58  b66a004c             cmp.w     $4c(a2), d3
  004e5c  6c02                 bge.b     $4e60
  004e5e  95ca                 suba.l    a2, a2
  004e60  200a                 move.l    a2, d0
  004e62  66b0                 bne.b     $4e14
  004e64  266b002e             movea.l   $2e(a3), a3
  004e68  200b                 move.l    a3, d0
  004e6a  669a                 bne.b     $4e06
  004e6c  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004e70  4e5e                 unlk      a6
  004e72  2e9f                 move.l    (a7)+, (a7)
  004e74  4e75                 rts       

;-------------------------------------------------------------
; AppBackwardSearch7   (seg 7 +004e8e, 128 bytes)
  004e8e  4e56fff8             link.w    a6, #$fff8
  004e92  48e71030             movem.l   d3/a2-a3, -(a7)
  004e96  266de866             movea.l   -$179a(a5), a3
  004e9a  422de86e             clr.b     -$1792(a5)
  004e9e  6060                 bra.b     $4f00
  004ea0  362b004c             move.w    $4c(a3), d3
  004ea4  966de852             sub.w     -$17ae(a5), d3
  004ea8  246b0032             movea.l   $32(a3), a2
  004eac  604a                 bra.b     $4ef8
  004eae  554f                 subq.w    #$2, a7
  004eb0  486b000e             pea.l     $e(a3)
  004eb4  486a000e             pea.l     $e(a2)
  004eb8  486efff8             pea.l     -$8(a6)
  004ebc  4ebafa3e             jsr       $48fc(pc)   ; MYSECTRECT
  004ec0  101f                 move.b    (a7)+, d0
  004ec2  6724                 beq.b     $4ee8
  004ec4  4aab001e             tst.l     $1e(a3)
  004ec8  670c                 beq.b     $4ed6
  004eca  2f0b                 move.l    a3, -(a7)
  004ecc  2f0a                 move.l    a2, -(a7)
  004ece  2f2b001e             move.l    $1e(a3), -(a7)
  004ed2  205f                 movea.l   (a7)+, a0
  004ed4  4e90                 jsr       (a0)
  004ed6  4aaa001e             tst.l     $1e(a2)
  004eda  670c                 beq.b     $4ee8
  004edc  2f0a                 move.l    a2, -(a7)
  004ede  2f0b                 move.l    a3, -(a7)
  004ee0  2f2a001e             move.l    $1e(a2), -(a7)
  004ee4  205f                 movea.l   (a7)+, a0
  004ee6  4e90                 jsr       (a0)
  004ee8  246a0032             movea.l   $32(a2), a2
  004eec  200a                 move.l    a2, d0
  004eee  6708                 beq.b     $4ef8
  004ef0  b66a004c             cmp.w     $4c(a2), d3
  004ef4  6f02                 ble.b     $4ef8
  004ef6  95ca                 suba.l    a2, a2
  004ef8  200a                 move.l    a2, d0
  004efa  66b2                 bne.b     $4eae
  004efc  266b002e             movea.l   $2e(a3), a3
  004f00  200b                 move.l    a3, d0
  004f02  669c                 bne.b     $4ea0
  004f04  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004f08  4e5e                 unlk      a6
  004f0a  2e9f                 move.l    (a7)+, (a7)
  004f0c  4e75                 rts       

;-------------------------------------------------------------
; AllKindSearch8   (seg 7 +004f24, 140 bytes)
  004f24  4e56fff8             link.w    a6, #$fff8
  004f28  48e70030             movem.l   a2-a3, -(a7)
  004f2c  266de866             movea.l   -$179a(a5), a3
  004f30  422de86e             clr.b     -$1792(a5)
  004f34  606c                 bra.b     $4fa2
  004f36  4a53                 tst.w     (a3)
  004f38  6f54                 ble.b     $4f8e
  004f3a  246de866             movea.l   -$179a(a5), a2
  004f3e  604a                 bra.b     $4f8a
  004f40  4a52                 tst.w     (a2)
  004f42  6c42                 bge.b     $4f86
  004f44  554f                 subq.w    #$2, a7
  004f46  486b000e             pea.l     $e(a3)
  004f4a  486a000e             pea.l     $e(a2)
  004f4e  486efff8             pea.l     -$8(a6)
  004f52  4ebaf9a8             jsr       $48fc(pc)   ; MYSECTRECT
  004f56  101f                 move.b    (a7)+, d0
  004f58  672c                 beq.b     $4f86
  004f5a  36bc000a             move.w    #$a, (a3)
  004f5e  34bcfff6             move.w    #$fff6, (a2)
  004f62  4aab001e             tst.l     $1e(a3)
  004f66  670c                 beq.b     $4f74
  004f68  2f0b                 move.l    a3, -(a7)
  004f6a  2f0a                 move.l    a2, -(a7)
  004f6c  2f2b001e             move.l    $1e(a3), -(a7)
  004f70  205f                 movea.l   (a7)+, a0
  004f72  4e90                 jsr       (a0)
  004f74  4aaa001e             tst.l     $1e(a2)
  004f78  670c                 beq.b     $4f86
  004f7a  2f0a                 move.l    a2, -(a7)
  004f7c  2f0b                 move.l    a3, -(a7)
  004f7e  2f2a001e             move.l    $1e(a2), -(a7)
  004f82  205f                 movea.l   (a7)+, a0
  004f84  4e90                 jsr       (a0)
  004f86  246a002e             movea.l   $2e(a2), a2
  004f8a  200a                 move.l    a2, d0
  004f8c  66b2                 bne.b     $4f40
  004f8e  0c53ffff             cmpi.w    #$ffff, (a3)
  004f92  5dc0                 slt.b     d0
  004f94  4400                 neg.b     d0
  004f96  802de86e             or.b      -$1792(a5), d0
  004f9a  1b40e86e             move.b    d0, -$1792(a5)
  004f9e  266b002e             movea.l   $2e(a3), a3
  004fa2  200b                 move.l    a3, d0
  004fa4  6690                 bne.b     $4f36
  004fa6  4cdf0c00             movem.l   (a7)+, a2-a3
  004faa  4e5e                 unlk      a6
  004fac  2e9f                 move.l    (a7)+, (a7)
  004fae  4e75                 rts       

;-------------------------------------------------------------
; AllForwardSearch9   (seg 7 +004fc2, 108 bytes)
  004fc2  4e56fff8             link.w    a6, #$fff8
  004fc6  48e70030             movem.l   a2-a3, -(a7)
  004fca  266de866             movea.l   -$179a(a5), a3
  004fce  422de86e             clr.b     -$1792(a5)
  004fd2  604c                 bra.b     $5020
  004fd4  246b002e             movea.l   $2e(a3), a2
  004fd8  603e                 bra.b     $5018
  004fda  554f                 subq.w    #$2, a7
  004fdc  486b000e             pea.l     $e(a3)
  004fe0  486a000e             pea.l     $e(a2)
  004fe4  486efff8             pea.l     -$8(a6)
  004fe8  4ebaf912             jsr       $48fc(pc)   ; MYSECTRECT
  004fec  101f                 move.b    (a7)+, d0
  004fee  6724                 beq.b     $5014
  004ff0  4aab001e             tst.l     $1e(a3)
  004ff4  670c                 beq.b     $5002
  004ff6  2f0b                 move.l    a3, -(a7)
  004ff8  2f0a                 move.l    a2, -(a7)
  004ffa  2f2b001e             move.l    $1e(a3), -(a7)
  004ffe  205f                 movea.l   (a7)+, a0
  005000  4e90                 jsr       (a0)
  005002  4aaa001e             tst.l     $1e(a2)
  005006  670c                 beq.b     $5014
  005008  2f0a                 move.l    a2, -(a7)
  00500a  2f0b                 move.l    a3, -(a7)
  00500c  2f2a001e             move.l    $1e(a2), -(a7)
  005010  205f                 movea.l   (a7)+, a0
  005012  4e90                 jsr       (a0)
  005014  246a002e             movea.l   $2e(a2), a2
  005018  200a                 move.l    a2, d0
  00501a  66be                 bne.b     $4fda
  00501c  266b002e             movea.l   $2e(a3), a3
  005020  200b                 move.l    a3, d0
  005022  66b0                 bne.b     $4fd4
  005024  4cdf0c00             movem.l   (a7)+, a2-a3
  005028  4e5e                 unlk      a6
  00502a  2e9f                 move.l    (a7)+, (a7)
  00502c  4e75                 rts       

;-------------------------------------------------------------
; AllForwardOneSearch10   (seg 7 +005042, 110 bytes)
  005042  4e56fff8             link.w    a6, #$fff8
  005046  48e70030             movem.l   a2-a3, -(a7)
  00504a  266de866             movea.l   -$179a(a5), a3
  00504e  422de86e             clr.b     -$1792(a5)
  005052  604e                 bra.b     $50a2
  005054  246b002e             movea.l   $2e(a3), a2
  005058  6040                 bra.b     $509a
  00505a  554f                 subq.w    #$2, a7
  00505c  486b000e             pea.l     $e(a3)
  005060  486a000e             pea.l     $e(a2)
  005064  486efff8             pea.l     -$8(a6)
  005068  4ebaf892             jsr       $48fc(pc)   ; MYSECTRECT
  00506c  101f                 move.b    (a7)+, d0
  00506e  6726                 beq.b     $5096
  005070  4aab001e             tst.l     $1e(a3)
  005074  670e                 beq.b     $5084
  005076  2f0b                 move.l    a3, -(a7)
  005078  2f0a                 move.l    a2, -(a7)
  00507a  2f2b001e             move.l    $1e(a3), -(a7)
  00507e  205f                 movea.l   (a7)+, a0
  005080  4e90                 jsr       (a0)
  005082  6012                 bra.b     $5096
  005084  4aaa001e             tst.l     $1e(a2)
  005088  670c                 beq.b     $5096
  00508a  2f0a                 move.l    a2, -(a7)
  00508c  2f0b                 move.l    a3, -(a7)
  00508e  2f2a001e             move.l    $1e(a2), -(a7)
  005092  205f                 movea.l   (a7)+, a0
  005094  4e90                 jsr       (a0)
  005096  246a002e             movea.l   $2e(a2), a2
  00509a  200a                 move.l    a2, d0
  00509c  66bc                 bne.b     $505a
  00509e  266b002e             movea.l   $2e(a3), a3
  0050a2  200b                 move.l    a3, d0
  0050a4  66ae                 bne.b     $5054
  0050a6  4cdf0c00             movem.l   (a7)+, a2-a3
  0050aa  4e5e                 unlk      a6
  0050ac  2e9f                 move.l    (a7)+, (a7)
  0050ae  4e75                 rts       

;-------------------------------------------------------------
; AllBackwardSearch11   (seg 7 +0050c8, 108 bytes)
  0050c8  4e56fff8             link.w    a6, #$fff8
  0050cc  48e70030             movem.l   a2-a3, -(a7)
  0050d0  266de866             movea.l   -$179a(a5), a3
  0050d4  422de86e             clr.b     -$1792(a5)
  0050d8  604c                 bra.b     $5126
  0050da  246b0032             movea.l   $32(a3), a2
  0050de  603e                 bra.b     $511e
  0050e0  554f                 subq.w    #$2, a7
  0050e2  486b000e             pea.l     $e(a3)
  0050e6  486a000e             pea.l     $e(a2)
  0050ea  486efff8             pea.l     -$8(a6)
  0050ee  4ebaf80c             jsr       $48fc(pc)   ; MYSECTRECT
  0050f2  101f                 move.b    (a7)+, d0
  0050f4  6724                 beq.b     $511a
  0050f6  4aab001e             tst.l     $1e(a3)
  0050fa  670c                 beq.b     $5108
  0050fc  2f0b                 move.l    a3, -(a7)
  0050fe  2f0a                 move.l    a2, -(a7)
  005100  2f2b001e             move.l    $1e(a3), -(a7)
  005104  205f                 movea.l   (a7)+, a0
  005106  4e90                 jsr       (a0)
  005108  4aaa001e             tst.l     $1e(a2)
  00510c  670c                 beq.b     $511a
  00510e  2f0a                 move.l    a2, -(a7)
  005110  2f0b                 move.l    a3, -(a7)
  005112  2f2a001e             move.l    $1e(a2), -(a7)
  005116  205f                 movea.l   (a7)+, a0
  005118  4e90                 jsr       (a0)
  00511a  246a0032             movea.l   $32(a2), a2
  00511e  200a                 move.l    a2, d0
  005120  66be                 bne.b     $50e0
  005122  266b002e             movea.l   $2e(a3), a3
  005126  200b                 move.l    a3, d0
  005128  66b0                 bne.b     $50da
  00512a  4cdf0c00             movem.l   (a7)+, a2-a3
  00512e  4e5e                 unlk      a6
  005130  2e9f                 move.l    (a7)+, (a7)
  005132  4e75                 rts       

;-------------------------------------------------------------
; BothSearch12   (seg 7 +00514a, 188 bytes)
  00514a  4e56fff8             link.w    a6, #$fff8
  00514e  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  005152  266de866             movea.l   -$179a(a5), a3
  005156  422de86e             clr.b     -$1792(a5)
  00515a  6000009a             bra.w     $51f6
  00515e  382b0002             move.w    $2(a3), d4
  005162  d86de852             add.w     -$17ae(a5), d4
  005166  362b0002             move.w    $2(a3), d3
  00516a  966de852             sub.w     -$17ae(a5), d3
  00516e  246b002e             movea.l   $2e(a3), a2
  005172  4aab001e             tst.l     $1e(a3)
  005176  6738                 beq.b     $51b0
  005178  6032                 bra.b     $51ac
  00517a  554f                 subq.w    #$2, a7
  00517c  486b000e             pea.l     $e(a3)
  005180  486a000e             pea.l     $e(a2)
  005184  486efff8             pea.l     -$8(a6)
  005188  4ebaf772             jsr       $48fc(pc)   ; MYSECTRECT
  00518c  101f                 move.b    (a7)+, d0
  00518e  670c                 beq.b     $519c
  005190  2f0b                 move.l    a3, -(a7)
  005192  2f0a                 move.l    a2, -(a7)
  005194  2f2b001e             move.l    $1e(a3), -(a7)
  005198  205f                 movea.l   (a7)+, a0
  00519a  4e90                 jsr       (a0)
  00519c  246a002e             movea.l   $2e(a2), a2
  0051a0  200a                 move.l    a2, d0
  0051a2  6708                 beq.b     $51ac
  0051a4  b86a0002             cmp.w     $2(a2), d4
  0051a8  6c02                 bge.b     $51ac
  0051aa  95ca                 suba.l    a2, a2
  0051ac  200a                 move.l    a2, d0
  0051ae  66ca                 bne.b     $517a
  0051b0  246b0032             movea.l   $32(a3), a2
  0051b4  4aab001e             tst.l     $1e(a3)
  0051b8  6738                 beq.b     $51f2
  0051ba  6032                 bra.b     $51ee
  0051bc  554f                 subq.w    #$2, a7
  0051be  486b000e             pea.l     $e(a3)
  0051c2  486a000e             pea.l     $e(a2)
  0051c6  486efff8             pea.l     -$8(a6)
  0051ca  4ebaf730             jsr       $48fc(pc)   ; MYSECTRECT
  0051ce  101f                 move.b    (a7)+, d0
  0051d0  670c                 beq.b     $51de
  0051d2  2f0b                 move.l    a3, -(a7)
  0051d4  2f0a                 move.l    a2, -(a7)
  0051d6  2f2b001e             move.l    $1e(a3), -(a7)
  0051da  205f                 movea.l   (a7)+, a0
  0051dc  4e90                 jsr       (a0)
  0051de  246a0032             movea.l   $32(a2), a2
  0051e2  200a                 move.l    a2, d0
  0051e4  6708                 beq.b     $51ee
  0051e6  b66a0002             cmp.w     $2(a2), d3
  0051ea  6f02                 ble.b     $51ee
  0051ec  95ca                 suba.l    a2, a2
  0051ee  200a                 move.l    a2, d0
  0051f0  66ca                 bne.b     $51bc
  0051f2  266b002e             movea.l   $2e(a3), a3
  0051f6  200b                 move.l    a3, d0
  0051f8  6600ff64             bne.w     $515e
  0051fc  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  005200  4e5e                 unlk      a6
  005202  2e9f                 move.l    (a7)+, (a7)
  005204  4e75                 rts       

;-------------------------------------------------------------
; AppBothSearch13   (seg 7 +005216, 188 bytes)
  005216  4e56fff8             link.w    a6, #$fff8
  00521a  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  00521e  266de866             movea.l   -$179a(a5), a3
  005222  422de86e             clr.b     -$1792(a5)
  005226  6000009a             bra.w     $52c2
  00522a  382b004c             move.w    $4c(a3), d4
  00522e  d86de852             add.w     -$17ae(a5), d4
  005232  362b004c             move.w    $4c(a3), d3
  005236  966de852             sub.w     -$17ae(a5), d3
  00523a  246b002e             movea.l   $2e(a3), a2
  00523e  4aab001e             tst.l     $1e(a3)
  005242  6738                 beq.b     $527c
  005244  6032                 bra.b     $5278
  005246  554f                 subq.w    #$2, a7
  005248  486b000e             pea.l     $e(a3)
  00524c  486a000e             pea.l     $e(a2)
  005250  486efff8             pea.l     -$8(a6)
  005254  4ebaf6a6             jsr       $48fc(pc)   ; MYSECTRECT
  005258  101f                 move.b    (a7)+, d0
  00525a  670c                 beq.b     $5268
  00525c  2f0b                 move.l    a3, -(a7)
  00525e  2f0a                 move.l    a2, -(a7)
  005260  2f2b001e             move.l    $1e(a3), -(a7)
  005264  205f                 movea.l   (a7)+, a0
  005266  4e90                 jsr       (a0)
  005268  246a002e             movea.l   $2e(a2), a2
  00526c  200a                 move.l    a2, d0
  00526e  6708                 beq.b     $5278
  005270  b86a004c             cmp.w     $4c(a2), d4
  005274  6c02                 bge.b     $5278
  005276  95ca                 suba.l    a2, a2
  005278  200a                 move.l    a2, d0
  00527a  66ca                 bne.b     $5246
  00527c  246b0032             movea.l   $32(a3), a2
  005280  4aab001e             tst.l     $1e(a3)
  005284  6738                 beq.b     $52be
  005286  6032                 bra.b     $52ba
  005288  554f                 subq.w    #$2, a7
  00528a  486b000e             pea.l     $e(a3)
  00528e  486a000e             pea.l     $e(a2)
  005292  486efff8             pea.l     -$8(a6)
  005296  4ebaf664             jsr       $48fc(pc)   ; MYSECTRECT
  00529a  101f                 move.b    (a7)+, d0
  00529c  670c                 beq.b     $52aa
  00529e  2f0b                 move.l    a3, -(a7)
  0052a0  2f0a                 move.l    a2, -(a7)
  0052a2  2f2b001e             move.l    $1e(a3), -(a7)
  0052a6  205f                 movea.l   (a7)+, a0
  0052a8  4e90                 jsr       (a0)
  0052aa  246a0032             movea.l   $32(a2), a2
  0052ae  200a                 move.l    a2, d0
  0052b0  6708                 beq.b     $52ba
  0052b2  b66a004c             cmp.w     $4c(a2), d3
  0052b6  6f02                 ble.b     $52ba
  0052b8  95ca                 suba.l    a2, a2
  0052ba  200a                 move.l    a2, d0
  0052bc  66ca                 bne.b     $5288
  0052be  266b002e             movea.l   $2e(a3), a3
  0052c2  200b                 move.l    a3, d0
  0052c4  6600ff64             bne.w     $522a
  0052c8  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  0052cc  4e5e                 unlk      a6
  0052ce  2e9f                 move.l    (a7)+, (a7)
  0052d0  4e75                 rts       

;-------------------------------------------------------------
; AllBothSearch14   (seg 7 +0052e4, 144 bytes)
  0052e4  4e56fff8             link.w    a6, #$fff8
  0052e8  48e70030             movem.l   a2-a3, -(a7)
  0052ec  266de866             movea.l   -$179a(a5), a3
  0052f0  422de86e             clr.b     -$1792(a5)
  0052f4  6070                 bra.b     $5366
  0052f6  246b002e             movea.l   $2e(a3), a2
  0052fa  4aab001e             tst.l     $1e(a3)
  0052fe  672c                 beq.b     $532c
  005300  6026                 bra.b     $5328
  005302  554f                 subq.w    #$2, a7
  005304  486b000e             pea.l     $e(a3)
  005308  486a000e             pea.l     $e(a2)
  00530c  486efff8             pea.l     -$8(a6)
  005310  4ebaf5ea             jsr       $48fc(pc)   ; MYSECTRECT
  005314  101f                 move.b    (a7)+, d0
  005316  670c                 beq.b     $5324
  005318  2f0b                 move.l    a3, -(a7)
  00531a  2f0a                 move.l    a2, -(a7)
  00531c  2f2b001e             move.l    $1e(a3), -(a7)
  005320  205f                 movea.l   (a7)+, a0
  005322  4e90                 jsr       (a0)
  005324  246a002e             movea.l   $2e(a2), a2
  005328  200a                 move.l    a2, d0
  00532a  66d6                 bne.b     $5302
  00532c  246b0032             movea.l   $32(a3), a2
  005330  4aab001e             tst.l     $1e(a3)
  005334  672c                 beq.b     $5362
  005336  6026                 bra.b     $535e
  005338  554f                 subq.w    #$2, a7
  00533a  486b000e             pea.l     $e(a3)
  00533e  486a000e             pea.l     $e(a2)
  005342  486efff8             pea.l     -$8(a6)
  005346  4ebaf5b4             jsr       $48fc(pc)   ; MYSECTRECT
  00534a  101f                 move.b    (a7)+, d0
  00534c  670c                 beq.b     $535a
  00534e  2f0b                 move.l    a3, -(a7)
  005350  2f0a                 move.l    a2, -(a7)
  005352  2f2b001e             move.l    $1e(a3), -(a7)
  005356  205f                 movea.l   (a7)+, a0
  005358  4e90                 jsr       (a0)
  00535a  246a0032             movea.l   $32(a2), a2
  00535e  200a                 move.l    a2, d0
  005360  66d6                 bne.b     $5338
  005362  266b002e             movea.l   $2e(a3), a3
  005366  200b                 move.l    a3, d0
  005368  668c                 bne.b     $52f6
  00536a  4cdf0c00             movem.l   (a7)+, a2-a3
  00536e  4e5e                 unlk      a6
  005370  2e9f                 move.l    (a7)+, (a7)
  005372  4e75                 rts       

;-------------------------------------------------------------
; SEARCHHITS   (seg 7 +005386, 256 bytes)
  005386  4e560000             link.w    a6, #$0
  00538a  302de84e             move.w    -$17b2(a5), d0
  00538e  670e                 beq.b     $539e
  005390  5340                 subq.w    #$1, d0
  005392  675e                 beq.b     $53f2
  005394  5340                 subq.w    #$1, d0
  005396  670000a4             beq.w     $543c
  00539a  600000e6             bra.w     $5482
  00539e  302de850             move.w    -$17b0(a5), d0
  0053a2  0c400005             cmpi.w    #$5, d0
  0053a6  620000da             bhi.w     $5482
  0053aa  d040                 add.w     d0, d0
  0053ac  303b0006             move.w    $53b4(pc, d0.w), d0
  0053b0  4efb0002             jmp       $53b4(pc, d0.w)
  0053b4  000c0016002000ce002a0034 cases     0:$53c0 1:$53ca 2:$53d4 3:$5482 4:$53de 5:$53e8
  0053c0  2f0e                 move.l    a6, -(a7)
  0053c2  4ebaf5a6             jsr       $496a(pc)   ; KindSearch0
  0053c6  600000ba             bra.w     $5482
  0053ca  2f0e                 move.l    a6, -(a7)
  0053cc  4ebaf6b8             jsr       $4a86(pc)   ; ForwardSearch1
  0053d0  600000b0             bra.w     $5482
  0053d4  2f0e                 move.l    a6, -(a7)
  0053d6  4ebaf7d6             jsr       $4bae(pc)   ; BackwardSearch3
  0053da  600000a6             bra.w     $5482
  0053de  2f0e                 move.l    a6, -(a7)
  0053e0  4ebaf736             jsr       $4b18(pc)   ; ForwardOneSearch2
  0053e4  6000009c             bra.w     $5482
  0053e8  2f0e                 move.l    a6, -(a7)
  0053ea  4ebafd5e             jsr       $514a(pc)   ; BothSearch12
  0053ee  60000092             bra.w     $5482
  0053f2  302de850             move.w    -$17b0(a5), d0
  0053f6  0c400005             cmpi.w    #$5, d0
  0053fa  62000086             bhi.w     $5482
  0053fe  d040                 add.w     d0, d0
  005400  303b0006             move.w    $5408(pc, d0.w), d0
  005404  4efb0002             jmp       $5408(pc, d0.w)
  005408  000c0014001c007a0024002c cases     0:$5414 1:$541c 2:$5424 3:$5482 4:$542c 5:$5434
  005414  2f0e                 move.l    a6, -(a7)
  005416  4ebaf828             jsr       $4c40(pc)   ; AppKindSearch4
  00541a  6066                 bra.b     $5482
  00541c  2f0e                 move.l    a6, -(a7)
  00541e  4ebaf940             jsr       $4d60(pc)   ; AppForwardSearch5
  005422  605e                 bra.b     $5482
  005424  2f0e                 move.l    a6, -(a7)
  005426  4ebafa66             jsr       $4e8e(pc)   ; AppBackwardSearch7
  00542a  6056                 bra.b     $5482
  00542c  2f0e                 move.l    a6, -(a7)
  00542e  4ebaf9c4             jsr       $4df4(pc)   ; AppForwardOneSearch6
  005432  604e                 bra.b     $5482
  005434  2f0e                 move.l    a6, -(a7)
  005436  4ebafdde             jsr       $5216(pc)   ; AppBothSearch13
  00543a  6046                 bra.b     $5482
  00543c  302de850             move.w    -$17b0(a5), d0
  005440  0c400005             cmpi.w    #$5, d0
  005444  623c                 bhi.b     $5482
  005446  d040                 add.w     d0, d0
  005448  303b0006             move.w    $5450(pc, d0.w), d0
  00544c  4efb0002             jmp       $5450(pc, d0.w)
  005450  000c0014001c00320024002c cases     0:$545c 1:$5464 2:$546c 3:$5482 4:$5474 5:$547c
  00545c  2f0e                 move.l    a6, -(a7)
  00545e  4ebafac4             jsr       $4f24(pc)   ; AllKindSearch8
  005462  601e                 bra.b     $5482
  005464  2f0e                 move.l    a6, -(a7)
  005466  4ebafb5a             jsr       $4fc2(pc)   ; AllForwardSearch9
  00546a  6016                 bra.b     $5482
  00546c  2f0e                 move.l    a6, -(a7)
  00546e  4ebafc58             jsr       $50c8(pc)   ; AllBackwardSearch11
  005472  600e                 bra.b     $5482
  005474  2f0e                 move.l    a6, -(a7)
  005476  4ebafbca             jsr       $5042(pc)   ; AllForwardOneSearch10
  00547a  6006                 bra.b     $5482
  00547c  2f0e                 move.l    a6, -(a7)
  00547e  4ebafe64             jsr       $52e4(pc)   ; AllBothSearch14
  005482  4e5e                 unlk      a6
  005484  4e75                 rts       

;-------------------------------------------------------------
; BUBBLESORT   (seg 7 +005494, 444 bytes)
  005494  4e560000             link.w    a6, #$0
  005498  48e70018             movem.l   a3-a4, -(a7)
  00549c  4aade866             tst.l     -$179a(a5)
  0054a0  670001a6             beq.w     $5648
  0054a4  0c6d0002e84e         cmpi.w    #$2, -$17b2(a5)
  0054aa  6700019c             beq.w     $5648
  0054ae  4a6de84e             tst.w     -$17b2(a5)
  0054b2  660000c8             bne.w     $557c
  0054b6  206de866             movea.l   -$179a(a5), a0
  0054ba  2268002e             movea.l   $2e(a0), a1
  0054be  6054                 bra.b     $5514
  0054c0  2869002e             movea.l   $2e(a1), a4
  0054c4  20690032             movea.l   $32(a1), a0
  0054c8  30290002             move.w    $2(a1), d0
  0054cc  b0680002             cmp.w     $2(a0), d0
  0054d0  6c3e                 bge.b     $5510
  0054d2  26690032             movea.l   $32(a1), a3
  0054d6  4aab0032             tst.l     $32(a3)
  0054da  6708                 beq.b     $54e4
  0054dc  206b0032             movea.l   $32(a3), a0
  0054e0  2149002e             move.l    a1, $2e(a0)
  0054e4  4aa9002e             tst.l     $2e(a1)
  0054e8  6708                 beq.b     $54f2
  0054ea  2069002e             movea.l   $2e(a1), a0
  0054ee  214b0032             move.l    a3, $32(a0)
  0054f2  236b00320032         move.l    $32(a3), $32(a1)
  0054f8  2769002e002e         move.l    $2e(a1), $2e(a3)
  0054fe  234b002e             move.l    a3, $2e(a1)
  005502  27490032             move.l    a1, $32(a3)
  005506  b7ede866             cmpa.l    -$179a(a5), a3
  00550a  6604                 bne.b     $5510
  00550c  2b49e866             move.l    a1, -$179a(a5)
  005510  2649                 movea.l   a1, a3
  005512  224c                 movea.l   a4, a1
  005514  2009                 move.l    a1, d0
  005516  66a8                 bne.b     $54c0
  005518  200b                 move.l    a3, d0
  00551a  6758                 beq.b     $5574
  00551c  226b0032             movea.l   $32(a3), a1
  005520  6052                 bra.b     $5574
  005522  28690032             movea.l   $32(a1), a4
  005526  2069002e             movea.l   $2e(a1), a0
  00552a  30290002             move.w    $2(a1), d0
  00552e  b0680002             cmp.w     $2(a0), d0
  005532  6f3e                 ble.b     $5572
  005534  2669002e             movea.l   $2e(a1), a3
  005538  4aab002e             tst.l     $2e(a3)
  00553c  6708                 beq.b     $5546
  00553e  206b002e             movea.l   $2e(a3), a0
  005542  21490032             move.l    a1, $32(a0)
  005546  4aa90032             tst.l     $32(a1)
  00554a  6708                 beq.b     $5554
  00554c  20690032             movea.l   $32(a1), a0
  005550  214b002e             move.l    a3, $2e(a0)
  005554  236b002e002e         move.l    $2e(a3), $2e(a1)
  00555a  276900320032         move.l    $32(a1), $32(a3)
  005560  234b0032             move.l    a3, $32(a1)
  005564  2749002e             move.l    a1, $2e(a3)
  005568  b3ede866             cmpa.l    -$179a(a5), a1
  00556c  6604                 bne.b     $5572
  00556e  2b4be866             move.l    a3, -$179a(a5)
  005572  224c                 movea.l   a4, a1
  005574  2009                 move.l    a1, d0
  005576  66aa                 bne.b     $5522
  005578  600000ce             bra.w     $5648
  00557c  0c6d0001e84e         cmpi.w    #$1, -$17b2(a5)
  005582  660000c4             bne.w     $5648
  005586  206de866             movea.l   -$179a(a5), a0
  00558a  2268002e             movea.l   $2e(a0), a1
  00558e  6054                 bra.b     $55e4
  005590  2869002e             movea.l   $2e(a1), a4
  005594  20690032             movea.l   $32(a1), a0
  005598  3029004c             move.w    $4c(a1), d0
  00559c  b068004c             cmp.w     $4c(a0), d0
  0055a0  6c3e                 bge.b     $55e0
  0055a2  26690032             movea.l   $32(a1), a3
  0055a6  4aab0032             tst.l     $32(a3)
  0055aa  6708                 beq.b     $55b4
  0055ac  206b0032             movea.l   $32(a3), a0
  0055b0  2149002e             move.l    a1, $2e(a0)
  0055b4  4aa9002e             tst.l     $2e(a1)
  0055b8  6708                 beq.b     $55c2
  0055ba  2069002e             movea.l   $2e(a1), a0
  0055be  214b0032             move.l    a3, $32(a0)
  0055c2  236b00320032         move.l    $32(a3), $32(a1)
  0055c8  2769002e002e         move.l    $2e(a1), $2e(a3)
  0055ce  234b002e             move.l    a3, $2e(a1)
  0055d2  27490032             move.l    a1, $32(a3)
  0055d6  b7ede866             cmpa.l    -$179a(a5), a3
  0055da  6604                 bne.b     $55e0
  0055dc  2b49e866             move.l    a1, -$179a(a5)
  0055e0  2649                 movea.l   a1, a3
  0055e2  224c                 movea.l   a4, a1
  0055e4  2009                 move.l    a1, d0
  0055e6  66a8                 bne.b     $5590
  0055e8  200b                 move.l    a3, d0
  0055ea  6758                 beq.b     $5644
  0055ec  226b0032             movea.l   $32(a3), a1
  0055f0  6052                 bra.b     $5644
  0055f2  28690032             movea.l   $32(a1), a4
  0055f6  2069002e             movea.l   $2e(a1), a0
  0055fa  3029004c             move.w    $4c(a1), d0
  0055fe  b068004c             cmp.w     $4c(a0), d0
  005602  6f3e                 ble.b     $5642
  005604  2669002e             movea.l   $2e(a1), a3
  005608  4aab002e             tst.l     $2e(a3)
  00560c  6708                 beq.b     $5616
  00560e  206b002e             movea.l   $2e(a3), a0
  005612  21490032             move.l    a1, $32(a0)
  005616  4aa90032             tst.l     $32(a1)
  00561a  6708                 beq.b     $5624
  00561c  20690032             movea.l   $32(a1), a0
  005620  214b002e             move.l    a3, $2e(a0)
  005624  236b002e002e         move.l    $2e(a3), $2e(a1)
  00562a  276900320032         move.l    $32(a1), $32(a3)
  005630  234b0032             move.l    a3, $32(a1)
  005634  2749002e             move.l    a1, $2e(a3)
  005638  b3ede866             cmpa.l    -$179a(a5), a1
  00563c  6604                 bne.b     $5642
  00563e  2b4be866             move.l    a3, -$179a(a5)
  005642  224c                 movea.l   a4, a1
  005644  2009                 move.l    a1, d0
  005646  66aa                 bne.b     $55f2
  005648  4cdf1800             movem.l   (a7)+, a3-a4
  00564c  4e5e                 unlk      a6
  00564e  4e75                 rts       

;-------------------------------------------------------------
; SATRUN   (seg 7 +00565e, 994 bytes)
  00565e  4e56ffe4             link.w    a6, #$ffe4
  005662  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  005666  1d7c0001ffe5         move.b    #$1, -$1b(a6)
  00566c  4a2de8b4             tst.b     -$174c(a5)
  005670  6726                 beq.b     $5698
  005672  206de810             movea.l   -$17f0(a5), a0
  005676  2050                 movea.l   (a0), a0
  005678  20680016             movea.l   $16(a0), a0
  00567c  2050                 movea.l   (a0), a0
  00567e  2068002a             movea.l   $2a(a0), a0
  005682  2050                 movea.l   (a0), a0
  005684  226de7f2             movea.l   -$180e(a5), a1
  005688  2251                 movea.l   (a1), a1
  00568a  22690016             movea.l   $16(a1), a1
  00568e  2251                 movea.l   (a1), a1
  005690  2269002a             movea.l   $2a(a1), a1
  005694  2251                 movea.l   (a1), a1
  005696  2290                 move.l    (a0), (a1)
  005698  4a2e0008             tst.b     $8(a6)
  00569c  6706                 beq.b     $56a4
  00569e  286de8e6             movea.l   -$171a(a5), a4
  0056a2  6006                 bra.b     $56aa
  0056a4  49f900000048         lea.l     $48.l, a4   ; SATSAFERECTBLIT
  0056aa  4a2de8b5             tst.b     -$174b(a5)
  0056ae  57c0                 seq.b     d0
  0056b0  4400                 neg.b     d0
  0056b2  41f900000048         lea.l     $48.l, a0   ; SATSAFERECTBLIT
  0056b8  b9c8                 cmpa.l    a0, a4
  0056ba  56c1                 sne.b     d1
  0056bc  4401                 neg.b     d1
  0056be  c200                 and.b     d0, d1
  0056c0  1801                 move.b    d1, d4
  0056c2  41f900000050         lea.l     $50.l, a0   ; SATSAFEMASKBLIT
  0056c8  b1ede8ea             cmpa.l    -$1716(a5), a0
  0056cc  57c0                 seq.b     d0
  0056ce  4400                 neg.b     d0
  0056d0  41f900000048         lea.l     $48.l, a0   ; SATSAFERECTBLIT
  0056d6  b9c8                 cmpa.l    a0, a4
  0056d8  57c1                 seq.b     d1
  0056da  4401                 neg.b     d1
  0056dc  8200                 or.b      d0, d1
  0056de  1601                 move.b    d1, d3
  0056e0  4a03                 tst.b     d3
  0056e2  670a                 beq.b     $56ee
  0056e4  486effe6             pea.l     -$1a(a6)
  0056e8  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  0056ee  266de866             movea.l   -$179a(a5), a3
  0056f2  6046                 bra.b     $573a
  0056f4  244b                 movea.l   a3, a2
  0056f6  4aaa001a             tst.l     $1a(a2)
  0056fa  670a                 beq.b     $5706
  0056fc  2f0b                 move.l    a3, -(a7)
  0056fe  2f2a001a             move.l    $1a(a2), -(a7)
  005702  205f                 movea.l   (a7)+, a0
  005704  4e90                 jsr       (a0)
  005706  302a0006             move.w    $6(a2), d0
  00570a  d06a0002             add.w     $2(a2), d0
  00570e  3540000e             move.w    d0, $e(a2)
  005712  302a000a             move.w    $a(a2), d0
  005716  d06a0002             add.w     $2(a2), d0
  00571a  35400012             move.w    d0, $12(a2)
  00571e  302a0008             move.w    $8(a2), d0
  005722  d06a0004             add.w     $4(a2), d0
  005726  35400010             move.w    d0, $10(a2)
  00572a  302a000c             move.w    $c(a2), d0
  00572e  d06a0004             add.w     $4(a2), d0
  005732  35400014             move.w    d0, $14(a2)
  005736  266b002e             movea.l   $2e(a3), a3
  00573a  200b                 move.l    a3, d0
  00573c  66b6                 bne.b     $56f4
  00573e  4ebafd54             jsr       $5494(pc)   ; BUBBLESORT
  005742  4ebafc42             jsr       $5386(pc)   ; SEARCHHITS
  005746  4a03                 tst.b     d3
  005748  6706                 beq.b     $5750
  00574a  4eb9000042ba         jsr       $42ba.l   ; SATSETPORTOFFSCREEN
  005750  266de866             movea.l   -$179a(a5), a3
  005754  602c                 bra.b     $5782
  005756  244b                 movea.l   a3, a2
  005758  4a6a003a             tst.w     $3a(a2)
  00575c  6714                 beq.b     $5772
  00575e  486de826             pea.l     -$17da(a5)
  005762  486de80c             pea.l     -$17f4(a5)
  005766  486a0036             pea.l     $36(a2)
  00576a  2f2de8e6             move.l    -$171a(a5), -(a7)
  00576e  205f                 movea.l   (a7)+, a0
  005770  4e90                 jsr       (a0)
  005772  256a0036003e         move.l    $36(a2), $3e(a2)
  005778  256a003a0042         move.l    $3a(a2), $42(a2)
  00577e  266b002e             movea.l   $2e(a3), a3
  005782  200b                 move.l    a3, d0
  005784  66d0                 bne.b     $5756
  005786  246de86a             movea.l   -$1796(a5), a2
  00578a  6016                 bra.b     $57a2
  00578c  486de826             pea.l     -$17da(a5)
  005790  486de80c             pea.l     -$17f4(a5)
  005794  2f0a                 move.l    a2, -(a7)
  005796  2f2de8e6             move.l    -$171a(a5), -(a7)
  00579a  205f                 movea.l   (a7)+, a0
  00579c  4e90                 jsr       (a0)
  00579e  246a0008             movea.l   $8(a2), a2
  0057a2  200a                 move.l    a2, d0
  0057a4  66e6                 bne.b     $578c
  0057a6  266de866             movea.l   -$179a(a5), a3
  0057aa  600000d2             bra.w     $587e
  0057ae  244b                 movea.l   a3, a2
  0057b0  4aaa001a             tst.l     $1a(a2)
  0057b4  670000c4             beq.w     $587a
  0057b8  4aaa0016             tst.l     $16(a2)
  0057bc  670000b8             beq.w     $5876
  0057c0  256a00020036         move.l    $2(a2), $36(a2)
  0057c6  206a0016             movea.l   $16(a2), a0
  0057ca  302a0002             move.w    $2(a2), d0
  0057ce  d0680010             add.w     $10(a0), d0
  0057d2  3540003a             move.w    d0, $3a(a2)
  0057d6  206a0016             movea.l   $16(a2), a0
  0057da  302a0004             move.w    $4(a2), d0
  0057de  d0680012             add.w     $12(a0), d0
  0057e2  3540003c             move.w    d0, $3c(a2)
  0057e6  206a0016             movea.l   $16(a2), a0
  0057ea  4aa8002a             tst.l     $2a(a0)
  0057ee  672e                 beq.b     $581e
  0057f0  2f2a0016             move.l    $16(a2), -(a7)
  0057f4  2f0b                 move.l    a3, -(a7)
  0057f6  486de80c             pea.l     -$17f4(a5)
  0057fa  42a7                 clr.l     -(a7)
  0057fc  2f2a0002             move.l    $2(a2), -(a7)
  005800  206a0016             movea.l   $16(a2), a0
  005804  3f280012             move.w    $12(a0), -(a7)
  005808  206a0016             movea.l   $16(a2), a0
  00580c  3f280010             move.w    $10(a0), -(a7)
  005810  206a0016             movea.l   $16(a2), a0
  005814  2f28002a             move.l    $2a(a0), -(a7)
  005818  205f                 movea.l   (a7)+, a0
  00581a  4e90                 jsr       (a0)
  00581c  605c                 bra.b     $587a
  00581e  4aaa0026             tst.l     $26(a2)
  005822  662a                 bne.b     $584e
  005824  2f2a0016             move.l    $16(a2), -(a7)
  005828  2f0b                 move.l    a3, -(a7)
  00582a  486de80c             pea.l     -$17f4(a5)
  00582e  42a7                 clr.l     -(a7)
  005830  2f2a0002             move.l    $2(a2), -(a7)
  005834  206a0016             movea.l   $16(a2), a0
  005838  3f280012             move.w    $12(a0), -(a7)
  00583c  206a0016             movea.l   $16(a2), a0
  005840  3f280010             move.w    $10(a0), -(a7)
  005844  2f2de8ea             move.l    -$1716(a5), -(a7)
  005848  205f                 movea.l   (a7)+, a0
  00584a  4e90                 jsr       (a0)
  00584c  602c                 bra.b     $587a
  00584e  2f2a0016             move.l    $16(a2), -(a7)
  005852  2f0b                 move.l    a3, -(a7)
  005854  486de80c             pea.l     -$17f4(a5)
  005858  42a7                 clr.l     -(a7)
  00585a  2f2a0002             move.l    $2(a2), -(a7)
  00585e  206a0016             movea.l   $16(a2), a0
  005862  3f280012             move.w    $12(a0), -(a7)
  005866  206a0016             movea.l   $16(a2), a0
  00586a  3f280010             move.w    $10(a0), -(a7)
  00586e  4eb900001158         jsr       $1158.l   ; SATSAFEMASKBLIT
  005874  6004                 bra.b     $587a
  005876  426a003a             clr.w     $3a(a2)
  00587a  266b002e             movea.l   $2e(a3), a3
  00587e  200b                 move.l    a3, d0
  005880  6600ff2c             bne.w     $57ae
  005884  4aade862             tst.l     -$179e(a5)
  005888  676e                 beq.b     $58f8
  00588a  4a03                 tst.b     d3
  00588c  670a                 beq.b     $5898
  00588e  486effe6             pea.l     -$1a(a6)
  005892  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005898  554f                 subq.w    #$2, a7
  00589a  2f2de862             move.l    -$179e(a5), -(a7)
  00589e  205f                 movea.l   (a7)+, a0
  0058a0  4e90                 jsr       (a0)
  0058a2  101f                 move.b    (a7)+, d0
  0058a4  6752                 beq.b     $58f8
  0058a6  6014                 bra.b     $58bc
  0058a8  206de86a             movea.l   -$1796(a5), a0
  0058ac  26680008             movea.l   $8(a0), a3
  0058b0  2f2de86a             move.l    -$1796(a5), -(a7)
  0058b4  205f                 movea.l   (a7)+, a0
  0058b6  a01f                 _DisposePtr 
  0058b8  2b4be86a             move.l    a3, -$1796(a5)
  0058bc  4aade86a             tst.l     -$1796(a5)
  0058c0  66e6                 bne.b     $58a8
  0058c2  4eb900000fe6         jsr       $fe6.l   ; SATSOUNDEVENTS
  0058c8  4a03                 tst.b     d3
  0058ca  670a                 beq.b     $58d6
  0058cc  486effe6             pea.l     -$1a(a6)
  0058d0  4eb900004278         jsr       $4278.l   ; SATSETPORT
  0058d6  266de866             movea.l   -$179a(a5), a3
  0058da  6014                 bra.b     $58f0
  0058dc  246b002e             movea.l   $2e(a3), a2
  0058e0  4aab001a             tst.l     $1a(a3)
  0058e4  6608                 bne.b     $58ee
  0058e6  2f0b                 move.l    a3, -(a7)
  0058e8  4eb900001b96         jsr       $1b96.l   ; SATKILLSPRITE
  0058ee  264a                 movea.l   a2, a3
  0058f0  200b                 move.l    a3, d0
  0058f2  66e8                 bne.b     $58dc
  0058f4  6000013e             bra.w     $5a34
  0058f8  4a03                 tst.b     d3
  0058fa  6706                 beq.b     $5902
  0058fc  4eb900004308         jsr       $4308.l   ; SATSETPORTSCREEN
  005902  4a04                 tst.b     d4
  005904  670c                 beq.b     $5912
  005906  486effe5             pea.l     -$1b(a6)
  00590a  205f                 movea.l   (a7)+, a0
  00590c  1010                 move.b    (a0), d0
  00590e  a05d                 _trap_a05d 
  005910  1080                 move.b    d0, (a0)
  005912  266de866             movea.l   -$179a(a5), a3
  005916  600000c8             bra.w     $59e0
  00591a  244b                 movea.l   a3, a2
  00591c  4aaa001a             tst.l     $1a(a2)
  005920  67000092             beq.w     $59b4
  005924  4aaa0016             tst.l     $16(a2)
  005928  6700008a             beq.w     $59b4
  00592c  4a6a0038             tst.w     $38(a2)
  005930  6c04                 bge.b     $5936
  005932  426a0038             clr.w     $38(a2)
  005936  302a003c             move.w    $3c(a2), d0
  00593a  b06de808             cmp.w     -$17f8(a5), d0
  00593e  6f06                 ble.b     $5946
  005940  356de808003c         move.w    -$17f8(a5), $3c(a2)
  005946  4a6a0036             tst.w     $36(a2)
  00594a  6c04                 bge.b     $5950
  00594c  426a0036             clr.w     $36(a2)
  005950  302a003a             move.w    $3a(a2), d0
  005954  b06de80a             cmp.w     -$17f6(a5), d0
  005958  6f06                 ble.b     $5960
  00595a  356de80a003a         move.w    -$17f6(a5), $3a(a2)
  005960  4a6a0042             tst.w     $42(a2)
  005964  6742                 beq.b     $59a8
  005966  302a0036             move.w    $36(a2), d0
  00596a  b06a003e             cmp.w     $3e(a2), d0
  00596e  6c06                 bge.b     $5976
  005970  356a0036003e         move.w    $36(a2), $3e(a2)
  005976  302a0038             move.w    $38(a2), d0
  00597a  b06a0040             cmp.w     $40(a2), d0
  00597e  6c06                 bge.b     $5986
  005980  356a00380040         move.w    $38(a2), $40(a2)
  005986  302a003c             move.w    $3c(a2), d0
  00598a  b06a0044             cmp.w     $44(a2), d0
  00598e  6f06                 ble.b     $5996
  005990  356a003c0044         move.w    $3c(a2), $44(a2)
  005996  302a003a             move.w    $3a(a2), d0
  00599a  b06a0042             cmp.w     $42(a2), d0
  00599e  6f14                 ble.b     $59b4
  0059a0  356a003a0042         move.w    $3a(a2), $42(a2)
  0059a6  600c                 bra.b     $59b4
  0059a8  256a0036003e         move.l    $36(a2), $3e(a2)
  0059ae  256a003a0042         move.l    $3a(a2), $42(a2)
  0059b4  4a6a0042             tst.w     $42(a2)
  0059b8  6712                 beq.b     $59cc
  0059ba  486de80c             pea.l     -$17f4(a5)
  0059be  486de7ee             pea.l     -$1812(a5)
  0059c2  486a003e             pea.l     $3e(a2)
  0059c6  2f0c                 move.l    a4, -(a7)
  0059c8  205f                 movea.l   (a7)+, a0
  0059ca  4e90                 jsr       (a0)
  0059cc  246b002e             movea.l   $2e(a3), a2
  0059d0  4aab001a             tst.l     $1a(a3)
  0059d4  6608                 bne.b     $59de
  0059d6  2f0b                 move.l    a3, -(a7)
  0059d8  4eb900001b96         jsr       $1b96.l   ; SATKILLSPRITE
  0059de  264a                 movea.l   a2, a3
  0059e0  200b                 move.l    a3, d0
  0059e2  6600ff36             bne.w     $591a
  0059e6  246de86a             movea.l   -$1796(a5), a2
  0059ea  601c                 bra.b     $5a08
  0059ec  486de80c             pea.l     -$17f4(a5)
  0059f0  486de7ee             pea.l     -$1812(a5)
  0059f4  2f0a                 move.l    a2, -(a7)
  0059f6  2f0c                 move.l    a4, -(a7)
  0059f8  205f                 movea.l   (a7)+, a0
  0059fa  4e90                 jsr       (a0)
  0059fc  266a0008             movea.l   $8(a2), a3
  005a00  2f0a                 move.l    a2, -(a7)
  005a02  205f                 movea.l   (a7)+, a0
  005a04  a01f                 _DisposePtr 
  005a06  244b                 movea.l   a3, a2
  005a08  200a                 move.l    a2, d0
  005a0a  66e0                 bne.b     $59ec
  005a0c  42ade86a             clr.l     -$1796(a5)
  005a10  4a04                 tst.b     d4
  005a12  670c                 beq.b     $5a20
  005a14  486effe5             pea.l     -$1b(a6)
  005a18  205f                 movea.l   (a7)+, a0
  005a1a  1010                 move.b    (a0), d0
  005a1c  a05d                 _trap_a05d 
  005a1e  1080                 move.b    d0, (a0)
  005a20  4a03                 tst.b     d3
  005a22  670a                 beq.b     $5a2e
  005a24  486effe6             pea.l     -$1a(a6)
  005a28  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005a2e  4eb900000fe6         jsr       $fe6.l   ; SATSOUNDEVENTS
  005a34  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  005a38  4e5e                 unlk      a6
  005a3a  205f                 movea.l   (a7)+, a0
  005a3c  544f                 addq.w    #$2, a7
  005a3e  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATSKIP   (seg 7 +005a4a, 140 bytes)
  005a4a  4e560000             link.w    a6, #$0
  005a4e  48e70038             movem.l   a2-a4, -(a7)
  005a52  266de866             movea.l   -$179a(a5), a3
  005a56  6046                 bra.b     $5a9e
  005a58  244b                 movea.l   a3, a2
  005a5a  4aaa001a             tst.l     $1a(a2)
  005a5e  670a                 beq.b     $5a6a
  005a60  2f0b                 move.l    a3, -(a7)
  005a62  2f2a001a             move.l    $1a(a2), -(a7)
  005a66  205f                 movea.l   (a7)+, a0
  005a68  4e90                 jsr       (a0)
  005a6a  302a0006             move.w    $6(a2), d0
  005a6e  d06a0002             add.w     $2(a2), d0
  005a72  3540000e             move.w    d0, $e(a2)
  005a76  302a000a             move.w    $a(a2), d0
  005a7a  d06a0002             add.w     $2(a2), d0
  005a7e  35400012             move.w    d0, $12(a2)
  005a82  302a0008             move.w    $8(a2), d0
  005a86  d06a0004             add.w     $4(a2), d0
  005a8a  35400010             move.w    d0, $10(a2)
  005a8e  302a000c             move.w    $c(a2), d0
  005a92  d06a0004             add.w     $4(a2), d0
  005a96  35400014             move.w    d0, $14(a2)
  005a9a  266b002e             movea.l   $2e(a3), a3
  005a9e  200b                 move.l    a3, d0
  005aa0  66b6                 bne.b     $5a58
  005aa2  4ebaf9f0             jsr       $5494(pc)   ; BUBBLESORT
  005aa6  4ebaf8de             jsr       $5386(pc)   ; SEARCHHITS
  005aaa  266de866             movea.l   -$179a(a5), a3
  005aae  6014                 bra.b     $5ac4
  005ab0  244b                 movea.l   a3, a2
  005ab2  286a002e             movea.l   $2e(a2), a4
  005ab6  4aaa001a             tst.l     $1a(a2)
  005aba  6606                 bne.b     $5ac2
  005abc  42aa001e             clr.l     $1e(a2)
  005ac0  4252                 clr.w     (a2)
  005ac2  264c                 movea.l   a4, a3
  005ac4  200b                 move.l    a3, d0
  005ac6  66e8                 bne.b     $5ab0
  005ac8  4eb900000fe6         jsr       $fe6.l   ; SATSOUNDEVENTS
  005ace  4cdf1c00             movem.l   (a7)+, a2-a4
  005ad2  4e5e                 unlk      a6
  005ad4  4e75                 rts       

;-------------------------------------------------------------
; SATPLOTFACE   (seg 7 +005ae0, 330 bytes)
  005ae0  4e56ffde             link.w    a6, #$ffde
  005ae4  48e70038             movem.l   a2-a4, -(a7)
  005ae8  266e0012             movea.l   $12(a6), a3
  005aec  286e000e             movea.l   $e(a6), a4
  005af0  4a2de7e5             tst.b     -$181b(a5)
  005af4  6606                 bne.b     $5afc
  005af6  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  005afc  200b                 move.l    a3, d0
  005afe  6700011c             beq.w     $5c1c
  005b02  2d6b000cfff8         move.l    $c(a3), -$8(a6)
  005b08  2d6b0010fffc         move.l    $10(a3), -$4(a6)
  005b0e  302efff8             move.w    -$8(a6), d0
  005b12  d06e000a             add.w     $a(a6), d0
  005b16  3d40fff8             move.w    d0, -$8(a6)
  005b1a  302efffc             move.w    -$4(a6), d0
  005b1e  d06e000a             add.w     $a(a6), d0
  005b22  3d40fffc             move.w    d0, -$4(a6)
  005b26  302efffa             move.w    -$6(a6), d0
  005b2a  d06e000c             add.w     $c(a6), d0
  005b2e  3d40fffa             move.w    d0, -$6(a6)
  005b32  302efffe             move.w    -$2(a6), d0
  005b36  d06e000c             add.w     $c(a6), d0
  005b3a  3d40fffe             move.w    d0, -$2(a6)
  005b3e  4a2e0008             tst.b     $8(a6)
  005b42  674c                 beq.b     $5b90
  005b44  302de860             move.w    -$17a0(a5), d0
  005b48  5340                 subq.w    #$1, d0
  005b4a  6718                 beq.b     $5b64
  005b4c  5340                 subq.w    #$1, d0
  005b4e  671a                 beq.b     $5b6a
  005b50  5540                 subq.w    #$2, d0
  005b52  671c                 beq.b     $5b70
  005b54  5940                 subq.w    #$4, d0
  005b56  671e                 beq.b     $5b76
  005b58  5140                 subq.w    #$8, d0
  005b5a  6720                 beq.b     $5b7c
  005b5c  04400010             subi.w    #$10, d0
  005b60  6720                 beq.b     $5b82
  005b62  6024                 bra.b     $5b88
  005b64  246de8ba             movea.l   -$1746(a5), a2
  005b68  602c                 bra.b     $5b96
  005b6a  246de8c2             movea.l   -$173e(a5), a2
  005b6e  6026                 bra.b     $5b96
  005b70  246de8ca             movea.l   -$1736(a5), a2
  005b74  6020                 bra.b     $5b96
  005b76  246de8d2             movea.l   -$172e(a5), a2
  005b7a  601a                 bra.b     $5b96
  005b7c  246de8da             movea.l   -$1726(a5), a2
  005b80  6014                 bra.b     $5b96
  005b82  246de8e2             movea.l   -$171e(a5), a2
  005b86  600e                 bra.b     $5b96
  005b88  45f900000050         lea.l     $50.l, a2   ; SATSAFEMASKBLIT
  005b8e  6006                 bra.b     $5b96
  005b90  45f900000050         lea.l     $50.l, a2   ; SATSAFEMASKBLIT
  005b96  200c                 move.l    a4, d0
  005b98  6610                 bne.b     $5baa
  005b9a  486efff8             pea.l     -$8(a6)
  005b9e  4ebaeb28             jsr       $46c8(pc)   ; SATBACKCHANGED
  005ba2  49ede7ee             lea.l     -$1812(a5), a4
  005ba6  49ec0038             lea.l     $38(a4), a4
  005baa  41f900000050         lea.l     $50.l, a0   ; SATSAFEMASKBLIT
  005bb0  b5c8                 cmpa.l    a0, a2
  005bb2  6612                 bne.b     $5bc6
  005bb4  486effde             pea.l     -$22(a6)
  005bb8  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  005bbe  2f0c                 move.l    a4, -(a7)
  005bc0  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005bc6  4aab002a             tst.l     $2a(a3)
  005bca  6720                 beq.b     $5bec
  005bcc  2f0b                 move.l    a3, -(a7)
  005bce  48780000             pea.l     $0.w
  005bd2  2f0c                 move.l    a4, -(a7)
  005bd4  42a7                 clr.l     -(a7)
  005bd6  2f2e000a             move.l    $a(a6), -(a7)
  005bda  3f2b0012             move.w    $12(a3), -(a7)
  005bde  3f2b0010             move.w    $10(a3), -(a7)
  005be2  2f2b002a             move.l    $2a(a3), -(a7)
  005be6  205f                 movea.l   (a7)+, a0
  005be8  4e90                 jsr       (a0)
  005bea  601c                 bra.b     $5c08
  005bec  2f0b                 move.l    a3, -(a7)
  005bee  48780000             pea.l     $0.w
  005bf2  2f0c                 move.l    a4, -(a7)
  005bf4  42a7                 clr.l     -(a7)
  005bf6  2f2e000a             move.l    $a(a6), -(a7)
  005bfa  3f2b0012             move.w    $12(a3), -(a7)
  005bfe  3f2b0010             move.w    $10(a3), -(a7)
  005c02  2f0a                 move.l    a2, -(a7)
  005c04  205f                 movea.l   (a7)+, a0
  005c06  4e90                 jsr       (a0)
  005c08  41f900000050         lea.l     $50.l, a0   ; SATSAFEMASKBLIT
  005c0e  b5c8                 cmpa.l    a0, a2
  005c10  660a                 bne.b     $5c1c
  005c12  486effde             pea.l     -$22(a6)
  005c16  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005c1c  4cdf1c00             movem.l   (a7)+, a2-a4
  005c20  4e5e                 unlk      a6
  005c22  205f                 movea.l   (a7)+, a0
  005c24  4fef000e             lea.l     $e(a7), a7
  005c28  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATCOPYBITS   (seg 7 +005c38, 154 bytes)
  005c38  4e56fffc             link.w    a6, #$fffc
  005c3c  48e70038             movem.l   a2-a4, -(a7)
  005c40  246e0012             movea.l   $12(a6), a2
  005c44  286e000a             movea.l   $a(a6), a4
  005c48  4a2de7e5             tst.b     -$181b(a5)
  005c4c  6606                 bne.b     $5c54
  005c4e  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  005c54  200a                 move.l    a2, d0
  005c56  660e                 bne.b     $5c66
  005c58  2f0c                 move.l    a4, -(a7)
  005c5a  4ebaea6c             jsr       $46c8(pc)   ; SATBACKCHANGED
  005c5e  45ede7ee             lea.l     -$1812(a5), a2
  005c62  45ea0038             lea.l     $38(a2), a2
  005c66  486efffc             pea.l     -$4(a6)
  005c6a  a874                 _GetPort  
  005c6c  4a2de8b4             tst.b     -$174c(a5)
  005c70  6708                 beq.b     $5c7a
  005c72  594f                 subq.w    #$4, a7
  005c74  aa32                 _GetGDevice 
  005c76  205f                 movea.l   (a7)+, a0
  005c78  2648                 movea.l   a0, a3
  005c7a  2f12                 move.l    (a2), -(a7)
  005c7c  a873                 _SetPort  
  005c7e  4a2de8b4             tst.b     -$174c(a5)
  005c82  670c                 beq.b     $5c90
  005c84  4aaa0004             tst.l     $4(a2)
  005c88  6706                 beq.b     $5c90
  005c8a  2f2a0004             move.l    $4(a2), -(a7)
  005c8e  aa31                 _SetGDevice 
  005c90  206e0016             movea.l   $16(a6), a0
  005c94  2050                 movea.l   (a0), a0
  005c96  48680002             pea.l     $2(a0)
  005c9a  2052                 movea.l   (a2), a0
  005c9c  48680002             pea.l     $2(a0)
  005ca0  2f2e000e             move.l    $e(a6), -(a7)
  005ca4  2f0c                 move.l    a4, -(a7)
  005ca6  4267                 clr.w     -(a7)
  005ca8  48780000             pea.l     $0.w
  005cac  2f2de7e0             move.l    -$1820(a5), -(a7)
  005cb0  205f                 movea.l   (a7)+, a0
  005cb2  4e90                 jsr       (a0)
  005cb4  4a2de8b4             tst.b     -$174c(a5)
  005cb8  6704                 beq.b     $5cbe
  005cba  2f0b                 move.l    a3, -(a7)
  005cbc  aa31                 _SetGDevice 
  005cbe  2f2efffc             move.l    -$4(a6), -(a7)
  005cc2  a873                 _SetPort  
  005cc4  4cdf1c00             movem.l   (a7)+, a2-a4
  005cc8  4e5e                 unlk      a6
  005cca  205f                 movea.l   (a7)+, a0
  005ccc  4fef0012             lea.l     $12(a7), a7
  005cd0  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATCOPYBITSTOSCREEN   (seg 7 +005ce0, 130 bytes)
  005ce0  4e56fff8             link.w    a6, #$fff8
  005ce4  4a2de7e5             tst.b     -$181b(a5)
  005ce8  6606                 bne.b     $5cf0
  005cea  4eb900002e2e         jsr       $2e2e.l   ; SATINITEMPTY
  005cf0  486efffc             pea.l     -$4(a6)
  005cf4  a874                 _GetPort  
  005cf6  4a2de8b4             tst.b     -$174c(a5)
  005cfa  670a                 beq.b     $5d06
  005cfc  594f                 subq.w    #$4, a7
  005cfe  aa32                 _GetGDevice 
  005d00  205f                 movea.l   (a7)+, a0
  005d02  2d48fff8             move.l    a0, -$8(a6)
  005d06  2f2de7ee             move.l    -$1812(a5), -(a7)
  005d0a  a873                 _SetPort  
  005d0c  4a2de8b4             tst.b     -$174c(a5)
  005d10  670c                 beq.b     $5d1e
  005d12  4aade7f2             tst.l     -$180e(a5)
  005d16  6706                 beq.b     $5d1e
  005d18  2f2de7f2             move.l    -$180e(a5), -(a7)
  005d1c  aa31                 _SetGDevice 
  005d1e  206e0012             movea.l   $12(a6), a0
  005d22  2050                 movea.l   (a0), a0
  005d24  48680002             pea.l     $2(a0)
  005d28  206de7ee             movea.l   -$1812(a5), a0
  005d2c  48680002             pea.l     $2(a0)
  005d30  2f2e000e             move.l    $e(a6), -(a7)
  005d34  2f2e000a             move.l    $a(a6), -(a7)
  005d38  4267                 clr.w     -(a7)
  005d3a  48780000             pea.l     $0.w
  005d3e  2f2de7e0             move.l    -$1820(a5), -(a7)
  005d42  205f                 movea.l   (a7)+, a0
  005d44  4e90                 jsr       (a0)
  005d46  4a2de8b4             tst.b     -$174c(a5)
  005d4a  6706                 beq.b     $5d52
  005d4c  2f2efff8             move.l    -$8(a6), -(a7)
  005d50  aa31                 _SetGDevice 
  005d52  2f2efffc             move.l    -$4(a6), -(a7)
  005d56  a873                 _SetPort  
  005d58  4e5e                 unlk      a6
  005d5a  205f                 movea.l   (a7)+, a0
  005d5c  4fef000e             lea.l     $e(a7), a7
  005d60  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATSETMBARHEIGHT   (seg 7 +005d78, 28 bytes)
  005d78  4e56fffc             link.w    a6, #$fffc
  005d7c  2d7c00000baafffc     move.l    #$baa, -$4(a6)
  005d84  206efffc             movea.l   -$4(a6), a0
  005d88  30ae0008             move.w    $8(a6), (a0)
  005d8c  4e5e                 unlk      a6
  005d8e  205f                 movea.l   (a7)+, a0
  005d90  544f                 addq.w    #$2, a7
  005d92  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; SATGETMBARHEIGHT   (seg 7 +005da8, 14 bytes)
  005da8  4e560000             link.w    a6, #$0
  005dac  3d780baa0008         move.w    $baa.w, $8(a6)
  005db2  4e5e                 unlk      a6
  005db4  4e75                 rts       

;-------------------------------------------------------------
; SATSHOWMBAR   (seg 7 +005dca, 206 bytes)
  005dca  4e56ffde             link.w    a6, #$ffde
  005dce  48e70030             movem.l   a2-a3, -(a7)
  005dd2  246e0008             movea.l   $8(a6), a2
  005dd6  200a                 move.l    a2, d0
  005dd8  6604                 bne.b     $5dde
  005dda  246de7ee             movea.l   -$1812(a5), a2
  005dde  200a                 move.l    a2, d0
  005de0  660a                 bne.b     $5dec
  005de2  594f                 subq.w    #$4, a7
  005de4  2eb809d6             move.l    $9d6.w, (a7)
  005de8  205f                 movea.l   (a7)+, a0
  005dea  2448                 movea.l   a0, a2
  005dec  486effde             pea.l     -$22(a6)
  005df0  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  005df6  4eb900004308         jsr       $4308.l   ; SATSETPORTSCREEN
  005dfc  2f0a                 move.l    a2, -(a7)
  005dfe  a873                 _SetPort  
  005e00  0c6d0005ea90         cmpi.w    #$5, -$1570(a5)
  005e06  6f0a                 ble.b     $5e12
  005e08  3f2dea90             move.w    -$1570(a5), -(a7)
  005e0c  4ebaff6a             jsr       $5d78(pc)   ; SATSETMBARHEIGHT
  005e10  6008                 bra.b     $5e1a
  005e12  3f3c0014             move.w    #$14, -(a7)
  005e16  4ebaff60             jsr       $5d78(pc)   ; SATSETMBARHEIGHT
  005e1a  2d6de744fff8         move.l    -$18bc(a5), -$8(a6)
  005e20  2d6de748fffc         move.l    -$18b8(a5), -$4(a6)
  005e26  554f                 subq.w    #$2, a7
  005e28  4ebaff7e             jsr       $5da8(pc)   ; SATGETMBARHEIGHT
  005e2c  301f                 move.w    (a7)+, d0
  005e2e  d06efff8             add.w     -$8(a6), d0
  005e32  3d40fffc             move.w    d0, -$4(a6)
  005e36  594f                 subq.w    #$4, a7
  005e38  a8d8                 _NewRgn   
  005e3a  205f                 movea.l   (a7)+, a0
  005e3c  2648                 movea.l   a0, a3
  005e3e  2f0b                 move.l    a3, -(a7)
  005e40  486efff8             pea.l     -$8(a6)
  005e44  a8df                 _RectRgn  
  005e46  594f                 subq.w    #$4, a7
  005e48  2eb809ee             move.l    $9ee.w, (a7)
  005e4c  205f                 movea.l   (a7)+, a0
  005e4e  2f08                 move.l    a0, -(a7)
  005e50  2f0b                 move.l    a3, -(a7)
  005e52  594f                 subq.w    #$4, a7
  005e54  2eb809ee             move.l    $9ee.w, (a7)
  005e58  205f                 movea.l   (a7)+, a0
  005e5a  2f08                 move.l    a0, -(a7)
  005e5c  a8e6                 _DiffRgn  
  005e5e  486efff8             pea.l     -$8(a6)
  005e62  a871                 _GlobalToLocal 
  005e64  486efffc             pea.l     -$4(a6)
  005e68  a871                 _GlobalToLocal 
  005e6a  2f0b                 move.l    a3, -(a7)
  005e6c  486efff8             pea.l     -$8(a6)
  005e70  a8df                 _RectRgn  
  005e72  2f2a0018             move.l    $18(a2), -(a7)
  005e76  2f0b                 move.l    a3, -(a7)
  005e78  2f2a0018             move.l    $18(a2), -(a7)
  005e7c  a8e6                 _DiffRgn  
  005e7e  a937                 _DrawMenuBar 
  005e80  486effde             pea.l     -$22(a6)
  005e84  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005e8a  2f0b                 move.l    a3, -(a7)
  005e8c  a8d9                 _DisposeRgn 
  005e8e  4cdf0c00             movem.l   (a7)+, a2-a3
  005e92  4e5e                 unlk      a6
  005e94  2e9f                 move.l    (a7)+, (a7)
  005e96  4e75                 rts       

;-------------------------------------------------------------
; SATHIDEMBAR   (seg 7 +005ea6, 284 bytes)
  005ea6  4e56ffd6             link.w    a6, #$ffd6
  005eaa  48e70030             movem.l   a2-a3, -(a7)
  005eae  246e0008             movea.l   $8(a6), a2
  005eb2  200a                 move.l    a2, d0
  005eb4  6604                 bne.b     $5eba
  005eb6  246de7ee             movea.l   -$1812(a5), a2
  005eba  200a                 move.l    a2, d0
  005ebc  660a                 bne.b     $5ec8
  005ebe  594f                 subq.w    #$4, a7
  005ec0  2eb809d6             move.l    $9d6.w, (a7)
  005ec4  205f                 movea.l   (a7)+, a0
  005ec6  2448                 movea.l   a0, a2
  005ec8  486effde             pea.l     -$22(a6)
  005ecc  4eb90000422e         jsr       $422e.l   ; SATGETPORT
  005ed2  4eb900004308         jsr       $4308.l   ; SATSETPORTSCREEN
  005ed8  2f0a                 move.l    a2, -(a7)
  005eda  a873                 _SetPort  
  005edc  554f                 subq.w    #$2, a7
  005ede  4ebafec8             jsr       $5da8(pc)   ; SATGETMBARHEIGHT
  005ee2  301f                 move.w    (a7)+, d0
  005ee4  3b40ea90             move.w    d0, -$1570(a5)
  005ee8  4267                 clr.w     -(a7)
  005eea  4ebafe8c             jsr       $5d78(pc)   ; SATSETMBARHEIGHT
  005eee  2d6de744fff8         move.l    -$18bc(a5), -$8(a6)
  005ef4  2d6de748fffc         move.l    -$18b8(a5), -$4(a6)
  005efa  302efff8             move.w    -$8(a6), d0
  005efe  d06dea90             add.w     -$1570(a5), d0
  005f02  3d40fffc             move.w    d0, -$4(a6)
  005f06  594f                 subq.w    #$4, a7
  005f08  a8d8                 _NewRgn   
  005f0a  205f                 movea.l   (a7)+, a0
  005f0c  2648                 movea.l   a0, a3
  005f0e  2f0b                 move.l    a3, -(a7)
  005f10  486efff8             pea.l     -$8(a6)
  005f14  a8df                 _RectRgn  
  005f16  594f                 subq.w    #$4, a7
  005f18  2eb809ee             move.l    $9ee.w, (a7)
  005f1c  205f                 movea.l   (a7)+, a0
  005f1e  2f08                 move.l    a0, -(a7)
  005f20  2f0b                 move.l    a3, -(a7)
  005f22  594f                 subq.w    #$4, a7
  005f24  2eb809ee             move.l    $9ee.w, (a7)
  005f28  205f                 movea.l   (a7)+, a0
  005f2a  2f08                 move.l    a0, -(a7)
  005f2c  a8e5                 _UnionRgn 
  005f2e  2f0a                 move.l    a2, -(a7)
  005f30  2f0b                 move.l    a3, -(a7)
  005f32  a90d                 _PaintBehind 
  005f34  2f0a                 move.l    a2, -(a7)
  005f36  2f0b                 move.l    a3, -(a7)
  005f38  a90a                 _trap_a90a 
  005f3a  486de7ee             pea.l     -$1812(a5)
  005f3e  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005f44  2f0a                 move.l    a2, -(a7)
  005f46  a873                 _SetPort  
  005f48  486efff8             pea.l     -$8(a6)
  005f4c  a871                 _GlobalToLocal 
  005f4e  486efffc             pea.l     -$4(a6)
  005f52  a871                 _GlobalToLocal 
  005f54  486efff8             pea.l     -$8(a6)
  005f58  a928                 _InvalRect 
  005f5a  b5ede7ee             cmpa.l    -$1812(a5), a2
  005f5e  664a                 bne.b     $5faa
  005f60  554f                 subq.w    #$2, a7
  005f62  486efff8             pea.l     -$8(a6)
  005f66  206de80c             movea.l   -$17f4(a5), a0
  005f6a  48680010             pea.l     $10(a0)
  005f6e  486effd6             pea.l     -$2a(a6)
  005f72  a8aa                 _SectRect 
  005f74  101f                 move.b    (a7)+, d0
  005f76  6722                 beq.b     $5f9a
  005f78  206de80c             movea.l   -$17f4(a5), a0
  005f7c  48680002             pea.l     $2(a0)
  005f80  206de7ee             movea.l   -$1812(a5), a0
  005f84  48680002             pea.l     $2(a0)
  005f88  486efff8             pea.l     -$8(a6)
  005f8c  486efff8             pea.l     -$8(a6)
  005f90  4267                 clr.w     -(a7)
  005f92  48780000             pea.l     $0.w
  005f96  a8ec                 _CopyBits 
  005f98  6006                 bra.b     $5fa0
  005f9a  486efff8             pea.l     -$8(a6)
  005f9e  a8a2                 _PaintRect 
  005fa0  486effde             pea.l     -$22(a6)
  005fa4  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005faa  486effde             pea.l     -$22(a6)
  005fae  4eb900004278         jsr       $4278.l   ; SATSETPORT
  005fb4  2f0b                 move.l    a3, -(a7)
  005fb6  a8d9                 _DisposeRgn 
  005fb8  4cdf0c00             movem.l   (a7)+, a2-a3
  005fbc  4e5e                 unlk      a6
  005fbe  2e9f                 move.l    (a7)+, (a7)
  005fc0  4e75                 rts       

;-------------------------------------------------------------
; _tail_5fd0   (seg 7 +005fd0, 12703 bytes)
  005fd0  4e560000             link.w    a6, #$0
  005fd4  2f03                 move.l    d3, -(a7)
  005fd6  7600                 moveq     #$0, d3
  005fd8  4a2dedb5             tst.b     -$124b(a5)
  005fdc  6706                 beq.b     $5fe4
  005fde  303cfc17             move.w    #$fc17, d0
  005fe2  6060                 bra.b     $6044
  005fe4  486decb4             pea.l     -$134c(a5)
  005fe8  2f3c00010384         move.l    #$10384, -(a7)
  005fee  4ead0408             jsr       $408(a5)
  005ff2  4a2decb4             tst.b     -$134c(a5)
  005ff6  6606                 bne.b     $5ffe
  005ff8  303cfb50             move.w    #$fb50, d0
  005ffc  6046                 bra.b     $6044
  005ffe  486debb4             pea.l     -$144c(a5)
  006002  2f3c00040384         move.l    #$40384, -(a7)
  006008  4ead0408             jsr       $408(a5)
  00600c  4a2debb4             tst.b     -$144c(a5)
  006010  6606                 bne.b     $6018
  006012  303cfb50             move.w    #$fb50, d0
  006016  602c                 bra.b     $6044
  006018  1b6e0008ea92         move.b    $8(a6), -$156e(a5)
  00601e  4a2e0008             tst.b     $8(a6)
  006022  6708                 beq.b     $602c
  006024  41edebb0             lea.l     -$1450(a5), a0
  006028  20b8020c             move.l    $20c.w, (a0)
  00602c  486dea94             pea.l     -$156c(a5)
  006030  4eba0624             jsr       $6656(pc)
  006034  3600                 move.w    d0, d3
  006036  4a43                 tst.w     d3
  006038  584f                 addq.w    #$4, a7
  00603a  6606                 bne.b     $6042
  00603c  1b7c0001edb5         move.b    #$1, -$124b(a5)
  006042  3003                 move.w    d3, d0
  006044  261f                 move.l    (a7)+, d3
  006046  4e5e                 unlk      a6
  006048  4e75                 rts       
  00604a  4e56fffc             link.w    a6, #$fffc
  00604e  4a2dedb5             tst.b     -$124b(a5)
  006052  6742                 beq.b     $6096
  006054  4a2dea93             tst.b     -$156d(a5)
  006058  6704                 beq.b     $605e
  00605a  4eba11a4             jsr       $7200(pc)
  00605e  4a2dea92             tst.b     -$156e(a5)
  006062  6704                 beq.b     $6068
  006064  52adeb9c             addq.l    #$1, -$1464(a5)
  006068  4a2dea92             tst.b     -$156e(a5)
  00606c  671a                 beq.b     $6088
  00606e  4aadebb0             tst.l     -$1450(a5)
  006072  6714                 beq.b     $6088
  006074  41eefffc             lea.l     -$4(a6), a0
  006078  20b8020c             move.l    $20c.w, (a0)
  00607c  202efffc             move.l    -$4(a6), d0
  006080  90adebb0             sub.l     -$1450(a5), d0
  006084  d1adeb98             add.l     d0, -$1468(a5)
  006088  486dea94             pea.l     -$156c(a5)
  00608c  4eba072e             jsr       $67bc(pc)
  006090  422dedb5             clr.b     -$124b(a5)
  006094  584f                 addq.w    #$4, a7
  006096  4e5e                 unlk      a6
  006098  4e75                 rts       
  00609a  4e560000             link.w    a6, #$0
  00609e  48e71038             movem.l   d3/a2-a4, -(a7)
  0060a2  286e0008             movea.l   $8(a6), a4
  0060a6  7600                 moveq     #$0, d3
  0060a8  4214                 clr.b     (a4)
  0060aa  4a2dedb5             tst.b     -$124b(a5)
  0060ae  6756                 beq.b     $6106
  0060b0  3f3c0384             move.w    #$384, -(a7)
  0060b4  4eba08f2             jsr       $69a8(pc)
  0060b8  2448                 movea.l   a0, a2
  0060ba  3f3c0384             move.w    #$384, -(a7)
  0060be  2f0a                 move.l    a2, -(a7)
  0060c0  4eba0a00             jsr       $6ac2(pc)
  0060c4  204a                 movea.l   a2, a0
  0060c6  a064                 _MoveHHi  
  0060c8  a029                 _HLock    
  0060ca  3f3c0384             move.w    #$384, -(a7)
  0060ce  2052                 movea.l   (a2), a0
  0060d0  3f280200             move.w    $200(a0), -(a7)
  0060d4  2f12                 move.l    (a2), -(a7)
  0060d6  4eba0cba             jsr       $6d92(pc)
  0060da  2648                 movea.l   a0, a3
  0060dc  2052                 movea.l   (a2), a0
  0060de  48680100             pea.l     $100(a0)
  0060e2  2f0b                 move.l    a3, -(a7)
  0060e4  1f3c0001             move.b    #$1, -(a7)
  0060e8  1f3c0001             move.b    #$1, -(a7)
  0060ec  4ead0380             jsr       $380(a5)
  0060f0  101f                 move.b    (a7)+, d0
  0060f2  1880                 move.b    d0, (a4)
  0060f4  204b                 movea.l   a3, a0
  0060f6  a01f                 _DisposePtr 
  0060f8  204a                 movea.l   a2, a0
  0060fa  a02a                 _HUnlock  
  0060fc  204a                 movea.l   a2, a0
  0060fe  a023                 _DisposeHandle 
  006100  4fef000e             lea.l     $e(a7), a7
  006104  6004                 bra.b     $610a
  006106  363cfc17             move.w    #$fc17, d3
  00610a  3003                 move.w    d3, d0
  00610c  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  006110  4e5e                 unlk      a6
  006112  4e75                 rts       
  006114  4e56fcde             link.w    a6, #$fcde
  006118  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  00611c  7a00                 moveq     #$0, d5
  00611e  4a2dedb5             tst.b     -$124b(a5)
  006122  67000258             beq.w     $637c
  006126  7007                 moveq     #$7, d0
  006128  2d40fcee             move.l    d0, -$312(a6)
  00612c  486efceb             pea.l     -$315(a6)
  006130  4ebaff68             jsr       $609a(pc)
  006134  3600                 move.w    d0, d3
  006136  486efcee             pea.l     -$312(a6)
  00613a  4eba0330             jsr       $646c(pc)
  00613e  3600                 move.w    d0, d3
  006140  4a2efceb             tst.b     -$315(a6)
  006144  504f                 addq.w    #$8, a7
  006146  6608                 bne.b     $6150
  006148  7007                 moveq     #$7, d0
  00614a  b0aefcee             cmp.l     -$312(a6), d0
  00614e  6f08                 ble.b     $6158
  006150  4a2e0008             tst.b     $8(a6)
  006154  6700022a             beq.w     $6380
  006158  7c00                 moveq     #$0, d6
  00615a  7800                 moveq     #$0, d4
  00615c  4eba0efa             jsr       $7058(pc)
  006160  3800                 move.w    d0, d4
  006162  47ed0188             lea.l     $188(a5), a3
  006166  49ed0180             lea.l     $180(a5), a4
  00616a  41ed0178             lea.l     $178(a5), a0
  00616e  2e08                 move.l    a0, d7
  006170  a850                 _InitCursor 
  006172  594f                 subq.w    #$4, a7
  006174  2f3c444c4f47         move.l    #$444c4f47, -(a7)
  00617a  3f3c0384             move.w    #$384, -(a7)
  00617e  a9a0                 _GetResource 
  006180  205f                 movea.l   (a7)+, a0
  006182  2448                 movea.l   a0, a2
  006184  200a                 move.l    a2, d0
  006186  6602                 bne.b     $618a
  006188  a9f4                 _ExitToShell 
  00618a  594f                 subq.w    #$4, a7
  00618c  2f3c4449544c         move.l    #$4449544c, -(a7)
  006192  3f3c0384             move.w    #$384, -(a7)
  006196  a9a0                 _GetResource 
  006198  205f                 movea.l   (a7)+, a0
  00619a  2448                 movea.l   a0, a2
  00619c  200a                 move.l    a2, d0
  00619e  6602                 bne.b     $61a2
  0061a0  a9f4                 _ExitToShell 
  0061a2  594f                 subq.w    #$4, a7
  0061a4  3f3c0384             move.w    #$384, -(a7)
  0061a8  42a7                 clr.l     -(a7)
  0061aa  4878ffff             pea.l     $ffff.w
  0061ae  a97c                 _GetNewDialog 
  0061b0  205f                 movea.l   (a7)+, a0
  0061b2  2448                 movea.l   a0, a2
  0061b4  2f0a                 move.l    a2, -(a7)
  0061b6  3f3c0002             move.w    #$2, -(a7)
  0061ba  486efff6             pea.l     -$a(a6)
  0061be  486efef2             pea.l     -$10e(a6)
  0061c2  486efff8             pea.l     -$8(a6)
  0061c6  a98d                 _GetDialogItem 
  0061c8  2f2efef2             move.l    -$10e(a6), -(a7)
  0061cc  3f3c00ff             move.w    #$ff, -(a7)
  0061d0  a95d                 _HiliteControl 
  0061d2  2f0a                 move.l    a2, -(a7)
  0061d4  3f3c0003             move.w    #$3, -(a7)
  0061d8  486efff6             pea.l     -$a(a6)
  0061dc  486efef2             pea.l     -$10e(a6)
  0061e0  486efff8             pea.l     -$8(a6)
  0061e4  a98d                 _GetDialogItem 
  0061e6  2f0a                 move.l    a2, -(a7)
  0061e8  3f3c0003             move.w    #$3, -(a7)
  0061ec  3f2efff6             move.w    -$a(a6), -(a7)
  0061f0  2f0b                 move.l    a3, -(a7)
  0061f2  486efff8             pea.l     -$8(a6)
  0061f6  a98e                 _SetDialogItem 
  0061f8  2f0a                 move.l    a2, -(a7)
  0061fa  3f3c0005             move.w    #$5, -(a7)
  0061fe  486efff6             pea.l     -$a(a6)
  006202  486efef2             pea.l     -$10e(a6)
  006206  486efff8             pea.l     -$8(a6)
  00620a  a98d                 _GetDialogItem 
  00620c  2f0a                 move.l    a2, -(a7)
  00620e  3f3c0005             move.w    #$5, -(a7)
  006212  3f2efff6             move.w    -$a(a6), -(a7)
  006216  2f0c                 move.l    a4, -(a7)
  006218  486efff8             pea.l     -$8(a6)
  00621c  a98e                 _SetDialogItem 
  00621e  486efce6             pea.l     -$31a(a6)
  006222  a874                 _GetPort  
  006224  2f0a                 move.l    a2, -(a7)
  006226  a873                 _SetPort  
  006228  486d0170             pea.l     $170(a5)
  00622c  486efff8             pea.l     -$8(a6)
  006230  3f3c0384             move.w    #$384, -(a7)
  006234  4eba107e             jsr       $72b4(pc)
  006238  3600                 move.w    d0, d3
  00623a  4a44                 tst.w     d4
  00623c  4fef000a             lea.l     $a(a7), a7
  006240  6f2a                 ble.b     $626c
  006242  2f0a                 move.l    a2, -(a7)
  006244  3f3c0006             move.w    #$6, -(a7)
  006248  486efff6             pea.l     -$a(a6)
  00624c  486efef2             pea.l     -$10e(a6)
  006250  486efff8             pea.l     -$8(a6)
  006254  a98d                 _GetDialogItem 
  006256  486d0170             pea.l     $170(a5)
  00625a  486efff8             pea.l     -$8(a6)
  00625e  3f3c0385             move.w    #$385, -(a7)
  006262  4eba1050             jsr       $72b4(pc)
  006266  3600                 move.w    d0, d3
  006268  4fef000a             lea.l     $a(a7), a7
  00626c  2f2efce6             move.l    -$31a(a6), -(a7)
  006270  a873                 _SetPort  
  006272  2f0a                 move.l    a2, -(a7)
  006274  4eba0cc0             jsr       $6f36(pc)
  006278  2f0a                 move.l    a2, -(a7)
  00627a  594f                 subq.w    #$4, a7
  00627c  a975                 _TickCount 
  00627e  201f                 move.l    (a7)+, d0
  006280  7205                 moveq     #$5, d1
  006282  c3c4                 muls.w    d4, d1
  006284  2d40fcde             move.l    d0, -$322(a6)
  006288  703c                 moveq     #$3c, d0
  00628a  4ead0cd8             jsr       $cd8(a5)
  00628e  d0aefcde             add.l     -$322(a6), d0
  006292  2f00                 move.l    d0, -(a7)
  006294  a918                 _SetWRefCon 
  006296  584f                 addq.w    #$4, a7
  006298  6018                 bra.b     $62b2
  00629a  2f07                 move.l    d7, -(a7)
  00629c  486efcec             pea.l     -$314(a6)
  0062a0  a991                 _ModalDialog 
  0062a2  302efcec             move.w    -$314(a6), d0
  0062a6  5340                 subq.w    #$1, d0
  0062a8  6706                 beq.b     $62b0
  0062aa  5340                 subq.w    #$1, d0
  0062ac  6702                 beq.b     $62b0
  0062ae  6002                 bra.b     $62b2
  0062b0  7c01                 moveq     #$1, d6
  0062b2  4a06                 tst.b     d6
  0062b4  67e4                 beq.b     $629a
  0062b6  2f0a                 move.l    a2, -(a7)
  0062b8  a916                 _HideWindow 
  0062ba  4eba1234             jsr       $74f0(pc)
  0062be  2f0a                 move.l    a2, -(a7)
  0062c0  a983                 _DisposeDialog 
  0062c2  0c6e0001fcec         cmpi.w    #$1, -$314(a6)
  0062c8  660000b6             bne.w     $6380
  0062cc  7600                 moveq     #$0, d3
  0062ce  41edfcee             lea.l     -$312(a5), a0
  0062d2  43eefef6             lea.l     -$10a(a6), a1
  0062d6  703f                 moveq     #$3f, d0
  0062d8  22d8                 move.l    (a0)+, (a1)+
  0062da  51c8fffc             dbra      d0, $62d8
  0062de  486efdf2             pea.l     -$20e(a6)
  0062e2  2f3c00010384         move.l    #$10384, -(a7)
  0062e8  4ead0408             jsr       $408(a5)
  0062ec  7000                 moveq     #$0, d0
  0062ee  102efef6             move.b    -$10a(a6), d0
  0062f2  41eefef6             lea.l     -$10a(a6), a0
  0062f6  43f00001             lea.l     $1(a0, d0.w), a1
  0062fa  41eefdf3             lea.l     -$20d(a6), a0
  0062fe  7000                 moveq     #$0, d0
  006300  102efdf2             move.b    -$20e(a6), d0
  006304  a02e                 _BlockMove 
  006306  102efdf2             move.b    -$20e(a6), d0
  00630a  d12efef6             add.b     d0, -$10a(a6)
  00630e  1f3c0001             move.b    #$1, -(a7)
  006312  486efef6             pea.l     -$10a(a6)
  006316  4eba01f6             jsr       $650e(pc)
  00631a  3600                 move.w    d0, d3
  00631c  4a43                 tst.w     d3
  00631e  5c4f                 addq.w    #$6, a7
  006320  675e                 beq.b     $6380
  006322  7600                 moveq     #$0, d3
  006324  6016                 bra.b     $633c
  006326  3f3c0001             move.w    #$1, -(a7)
  00632a  a9c8                 _SysBeep  
  00632c  207c0000003c         movea.l   #$3c, a0
  006332  43eefce2             lea.l     -$31e(a6), a1
  006336  a03b                 _Delay    
  006338  2280                 move.l    d0, (a1)
  00633a  5243                 addq.w    #$1, d3
  00633c  0c430005             cmpi.w    #$5, d3
  006340  6de4                 blt.b     $6326
  006342  a850                 _InitCursor 
  006344  486efcf2             pea.l     -$30e(a6)
  006348  2f3c00040384         move.l    #$40384, -(a7)
  00634e  4ead0408             jsr       $408(a5)
  006352  486efcf2             pea.l     -$30e(a6)
  006356  486efef6             pea.l     -$10a(a6)
  00635a  486efcf2             pea.l     -$30e(a6)
  00635e  486efcf2             pea.l     -$30e(a6)
  006362  a98b                 _ParamText 
  006364  554f                 subq.w    #$2, a7
  006366  3f3c0385             move.w    #$385, -(a7)
  00636a  42a7                 clr.l     -(a7)
  00636c  a985                 _Alert    
  00636e  301f                 move.w    (a7)+, d0
  006370  3600                 move.w    d0, d3
  006372  0c43ffff             cmpi.w    #$ffff, d3
  006376  6608                 bne.b     $6380
  006378  a9f4                 _ExitToShell 
  00637a  6004                 bra.b     $6380
  00637c  3a3cfc17             move.w    #$fc17, d5
  006380  3005                 move.w    d5, d0
  006382  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  006386  4e5e                 unlk      a6
  006388  4e75                 rts       
  00638a  4e56fffc             link.w    a6, #$fffc
  00638e  48e71030             movem.l   d3/a2-a3, -(a7)
  006392  266e0008             movea.l   $8(a6), a3
  006396  7600                 moveq     #$0, d3
  006398  4a2dedb5             tst.b     -$124b(a5)
  00639c  674e                 beq.b     $63ec
  00639e  486effff             pea.l     -$1(a6)
  0063a2  4ebafcf6             jsr       $609a(pc)
  0063a6  3d40fffc             move.w    d0, -$4(a6)
  0063aa  4a2effff             tst.b     -$1(a6)
  0063ae  584f                 addq.w    #$4, a7
  0063b0  672c                 beq.b     $63de
  0063b2  3f3c0384             move.w    #$384, -(a7)
  0063b6  4eba05f0             jsr       $69a8(pc)
  0063ba  2448                 movea.l   a0, a2
  0063bc  3f3c0384             move.w    #$384, -(a7)
  0063c0  2f0a                 move.l    a2, -(a7)
  0063c2  4eba06fe             jsr       $6ac2(pc)
  0063c6  2052                 movea.l   (a2), a0
  0063c8  224b                 movea.l   a3, a1
  0063ca  203c00000100         move.l    #$100, d0
  0063d0  a22e                 _BlockMove 
  0063d2  204a                 movea.l   a2, a0
  0063d4  a02a                 _HUnlock  
  0063d6  204a                 movea.l   a2, a0
  0063d8  a023                 _DisposeHandle 
  0063da  504f                 addq.w    #$8, a7
  0063dc  6012                 bra.b     $63f0
  0063de  2f0b                 move.l    a3, -(a7)
  0063e0  2f3c00020384         move.l    #$20384, -(a7)
  0063e6  4ead0408             jsr       $408(a5)
  0063ea  6004                 bra.b     $63f0
  0063ec  363cfc17             move.w    #$fc17, d3
  0063f0  3003                 move.w    d3, d0
  0063f2  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  0063f6  4e5e                 unlk      a6
  0063f8  4e75                 rts       
  0063fa  4e56fffc             link.w    a6, #$fffc
  0063fe  48e71030             movem.l   d3/a2-a3, -(a7)
  006402  266e0008             movea.l   $8(a6), a3
  006406  7600                 moveq     #$0, d3
  006408  4a2dedb5             tst.b     -$124b(a5)
  00640c  6750                 beq.b     $645e
  00640e  486effff             pea.l     -$1(a6)
  006412  4ebafc86             jsr       $609a(pc)
  006416  3d40fffc             move.w    d0, -$4(a6)
  00641a  4a2effff             tst.b     -$1(a6)
  00641e  584f                 addq.w    #$4, a7
  006420  672e                 beq.b     $6450
  006422  3f3c0384             move.w    #$384, -(a7)
  006426  4eba0580             jsr       $69a8(pc)
  00642a  2448                 movea.l   a0, a2
  00642c  3f3c0384             move.w    #$384, -(a7)
  006430  2f0a                 move.l    a2, -(a7)
  006432  4eba068e             jsr       $6ac2(pc)
  006436  2052                 movea.l   (a2), a0
  006438  32680200             movea.w   $200(a0), a1
  00643c  2f09                 move.l    a1, -(a7)
  00643e  2f0b                 move.l    a3, -(a7)
  006440  4ead03e8             jsr       $3e8(a5)
  006444  204a                 movea.l   a2, a0
  006446  a02a                 _HUnlock  
  006448  204a                 movea.l   a2, a0
  00644a  a023                 _DisposeHandle 
  00644c  504f                 addq.w    #$8, a7
  00644e  6012                 bra.b     $6462
  006450  2f0b                 move.l    a3, -(a7)
  006452  2f3c00030384         move.l    #$30384, -(a7)
  006458  4ead0408             jsr       $408(a5)
  00645c  6004                 bra.b     $6462
  00645e  363cfc17             move.w    #$fc17, d3
  006462  3003                 move.w    d3, d0
  006464  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  006468  4e5e                 unlk      a6
  00646a  4e75                 rts       
  00646c  4e56fffc             link.w    a6, #$fffc
  006470  2f03                 move.l    d3, -(a7)
  006472  7600                 moveq     #$0, d3
  006474  4a2dedb5             tst.b     -$124b(a5)
  006478  6732                 beq.b     $64ac
  00647a  41eefffc             lea.l     -$4(a6), a0
  00647e  20b8020c             move.l    $20c.w, (a0)
  006482  202efffc             move.l    -$4(a6), d0
  006486  90adeb94             sub.l     -$146c(a5), d0
  00648a  223c00015180         move.l    #$15180, d1
  006490  4ead0cde             jsr       $cde(a5)
  006494  5280                 addq.l    #$1, d0
  006496  206e0008             movea.l   $8(a6), a0
  00649a  2080                 move.l    d0, (a0)
  00649c  202efffc             move.l    -$4(a6), d0
  0064a0  b0adeb94             cmp.l     -$146c(a5), d0
  0064a4  640a                 bcc.b     $64b0
  0064a6  705a                 moveq     #$5a, d0
  0064a8  2080                 move.l    d0, (a0)
  0064aa  6004                 bra.b     $64b0
  0064ac  363cfc17             move.w    #$fc17, d3
  0064b0  3003                 move.w    d3, d0
  0064b2  261f                 move.l    (a7)+, d3
  0064b4  4e5e                 unlk      a6
  0064b6  4e75                 rts       
  0064b8  4e560000             link.w    a6, #$0
  0064bc  7000                 moveq     #$0, d0
  0064be  4a2dedb5             tst.b     -$124b(a5)
  0064c2  670a                 beq.b     $64ce
  0064c4  206e0008             movea.l   $8(a6), a0
  0064c8  20adeb9c             move.l    -$1464(a5), (a0)
  0064cc  6004                 bra.b     $64d2
  0064ce  303cfc17             move.w    #$fc17, d0
  0064d2  4e5e                 unlk      a6
  0064d4  4e75                 rts       
  0064d6  4e56fffc             link.w    a6, #$fffc
  0064da  2f03                 move.l    d3, -(a7)
  0064dc  7600                 moveq     #$0, d3
  0064de  4a2dedb5             tst.b     -$124b(a5)
  0064e2  671e                 beq.b     $6502
  0064e4  41eefffc             lea.l     -$4(a6), a0
  0064e8  20b8020c             move.l    $20c.w, (a0)
  0064ec  202deb98             move.l    -$1468(a5), d0
  0064f0  223c00000e10         move.l    #$e10, d1
  0064f6  4ead0cde             jsr       $cde(a5)
  0064fa  206e0008             movea.l   $8(a6), a0
  0064fe  2080                 move.l    d0, (a0)
  006500  6004                 bra.b     $6506
  006502  363cfc17             move.w    #$fc17, d3
  006506  3003                 move.w    d3, d0
  006508  261f                 move.l    (a7)+, d3
  00650a  4e5e                 unlk      a6
  00650c  4e75                 rts       
  00650e  4e56f9fc             link.w    a6, #$f9fc
  006512  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  006516  266e0008             movea.l   $8(a6), a3
  00651a  182e000c             move.b    $c(a6), d4
  00651e  7600                 moveq     #$0, d3
  006520  4a04                 tst.b     d4
  006522  675a                 beq.b     $657e
  006524  554f                 subq.w    #$2, a7
  006526  42a7                 clr.l     -(a7)
  006528  486efa46             pea.l     -$5ba(a6)
  00652c  486efa42             pea.l     -$5be(a6)
  006530  4ead0410             jsr       $410(a5)
  006534  301f                 move.w    (a7)+, d0
  006536  3600                 move.w    d0, d3
  006538  4a43                 tst.w     d3
  00653a  6642                 bne.b     $657e
  00653c  554f                 subq.w    #$2, a7
  00653e  3f2efa46             move.w    -$5ba(a6), -(a7)
  006542  2f2efa42             move.l    -$5be(a6), -(a7)
  006546  2f0b                 move.l    a3, -(a7)
  006548  486ef9fc             pea.l     -$604(a6)
  00654c  7001                 moveq     #$1, d0
  00654e  aa52                 _HighLevelFSDispatch 
  006550  301f                 move.w    (a7)+, d0
  006552  3600                 move.w    d0, d3
  006554  3d7c4c43ffda         move.w    #$4c43, -$26(a6)
  00655a  7020                 moveq     #$20, d0
  00655c  2d40ffdc             move.l    d0, -$24(a6)
  006560  426effe0             clr.w     -$20(a6)
  006564  3d7c4800ffe2         move.w    #$4800, -$1e(a6)
  00656a  41eef9fc             lea.l     -$604(a6), a0
  00656e  2d48ffe4             move.l    a0, -$1c(a6)
  006572  42aefffc             clr.l     -$4(a6)
  006576  41eeffd4             lea.l     -$2c(a6), a0
  00657a  a9f2                 _Launch   
  00657c  3600                 move.w    d0, d3
  00657e  4a04                 tst.b     d4
  006580  6706                 beq.b     $6588
  006582  4a43                 tst.w     d3
  006584  670000c6             beq.w     $664c
  006588  42aeffd0             clr.l     -$30(a6)
  00658c  594f                 subq.w    #$4, a7
  00658e  3f3c0004             move.w    #$4, -(a7)
  006592  a9b9                 _GetCursor 
  006594  205f                 movea.l   (a7)+, a0
  006596  2448                 movea.l   a0, a2
  006598  200a                 move.l    a2, d0
  00659a  6704                 beq.b     $65a0
  00659c  2f12                 move.l    (a2), -(a7)
  00659e  a851                 _SetCursor 
  0065a0  554f                 subq.w    #$2, a7
  0065a2  42a7                 clr.l     -(a7)
  0065a4  3f3cffff             move.w    #$ffff, -(a7)
  0065a8  2f0b                 move.l    a3, -(a7)
  0065aa  486efa48             pea.l     -$5b8(a6)
  0065ae  48780014             pea.l     $14.w
  0065b2  486effd0             pea.l     -$30(a6)
  0065b6  1f3c0001             move.b    #$1, -(a7)
  0065ba  4227                 clr.b     -(a7)
  0065bc  4eba1a96             jsr       $8054(pc)
  0065c0  301f                 move.w    (a7)+, d0
  0065c2  3600                 move.w    d0, d3
  0065c4  a850                 _InitCursor 
  0065c6  4aaeffd0             tst.l     -$30(a6)
  0065ca  6f000080             ble.w     $664c
  0065ce  7aff                 moveq     #$ff, d5
  0065d0  7800                 moveq     #$0, d4
  0065d2  603a                 bra.b     $660e
  0065d4  554f                 subq.w    #$2, a7
  0065d6  7046                 moveq     #$46, d0
  0065d8  c1c4                 muls.w    d4, d0
  0065da  41eefa48             lea.l     -$5b8(a6), a0
  0065de  d1c0                 adda.l    d0, a0
  0065e0  4850                 pea.l     (a0)
  0065e2  486effc0             pea.l     -$40(a6)
  0065e6  7007                 moveq     #$7, d0
  0065e8  aa52                 _HighLevelFSDispatch 
  0065ea  301f                 move.w    (a7)+, d0
  0065ec  0cae4150504cffc0     cmpi.l    #$4150504c, -$40(a6)
  0065f4  6616                 bne.b     $660c
  0065f6  0cae41726567ffc4     cmpi.l    #$41726567, -$3c(a6)
  0065fe  660c                 bne.b     $660c
  006600  302effc8             move.w    -$38(a6), d0
  006604  02408000             andi.w    #$8000, d0
  006608  6602                 bne.b     $660c
  00660a  3a04                 move.w    d4, d5
  00660c  5244                 addq.w    #$1, d4
  00660e  3044                 movea.w   d4, a0
  006610  b1eeffd0             cmpa.l    -$30(a6), a0
  006614  6dbe                 blt.b     $65d4
  006616  0c45ffff             cmpi.w    #$ffff, d5
  00661a  6730                 beq.b     $664c
  00661c  3d7c4c43ffda         move.w    #$4c43, -$26(a6)
  006622  7020                 moveq     #$20, d0
  006624  2d40ffdc             move.l    d0, -$24(a6)
  006628  426effe0             clr.w     -$20(a6)
  00662c  3d7c4800ffe2         move.w    #$4800, -$1e(a6)
  006632  7046                 moveq     #$46, d0
  006634  c1c5                 muls.w    d5, d0
  006636  41eefa48             lea.l     -$5b8(a6), a0
  00663a  d1c0                 adda.l    d0, a0
  00663c  2d48ffe4             move.l    a0, -$1c(a6)
  006640  42aefffc             clr.l     -$4(a6)
  006644  41eeffd4             lea.l     -$2c(a6), a0
  006648  a9f2                 _Launch   
  00664a  3600                 move.w    d0, d3
  00664c  3003                 move.w    d3, d0
  00664e  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  006652  4e5e                 unlk      a6
  006654  4e75                 rts       
  006656  4e56fec8             link.w    a6, #$fec8
  00665a  48e71c20             movem.l   d3-d5/a2, -(a7)
  00665e  246e0008             movea.l   $8(a6), a2
  006662  7600                 moveq     #$0, d3
  006664  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  00666a  7800                 moveq     #$0, d4
  00666c  554f                 subq.w    #$2, a7
  00666e  3f3c8000             move.w    #$8000, -(a7)
  006672  2f3c70726566         move.l    #$70726566, -(a7)
  006678  1f3c0001             move.b    #$1, -(a7)
  00667c  486efffc             pea.l     -$4(a6)
  006680  486efff8             pea.l     -$8(a6)
  006684  4ead0438             jsr       $438(a5)
  006688  301f                 move.w    (a7)+, d0
  00668a  3600                 move.w    d0, d3
  00668c  4a43                 tst.w     d3
  00668e  660000e6             bne.w     $6776
  006692  554f                 subq.w    #$2, a7
  006694  3f2efffc             move.w    -$4(a6), -(a7)
  006698  2f2efff8             move.l    -$8(a6), -(a7)
  00669c  486dfdee             pea.l     -$212(a5)
  0066a0  1f3c0003             move.b    #$3, -(a7)
  0066a4  486efffe             pea.l     -$2(a6)
  0066a8  4ead0418             jsr       $418(a5)
  0066ac  301f                 move.w    (a7)+, d0
  0066ae  3600                 move.w    d0, d3
  0066b0  4a43                 tst.w     d3
  0066b2  660000c0             bne.w     $6774
  0066b6  7a00                 moveq     #$0, d5
  0066b8  554f                 subq.w    #$2, a7
  0066ba  3f2efffc             move.w    -$4(a6), -(a7)
  0066be  2f2efff8             move.l    -$8(a6), -(a7)
  0066c2  486dfdee             pea.l     -$212(a5)
  0066c6  486efecc             pea.l     -$134(a6)
  0066ca  4ead0428             jsr       $428(a5)
  0066ce  301f                 move.w    (a7)+, d0
  0066d0  3600                 move.w    d0, d3
  0066d2  006e4000fed4         ori.w     #$4000, -$12c(a6)
  0066d8  554f                 subq.w    #$2, a7
  0066da  3f2efffc             move.w    -$4(a6), -(a7)
  0066de  2f2efff8             move.l    -$8(a6), -(a7)
  0066e2  486dfdee             pea.l     -$212(a5)
  0066e6  486efecc             pea.l     -$134(a6)
  0066ea  4ead0430             jsr       $430(a5)
  0066ee  301f                 move.w    (a7)+, d0
  0066f0  3600                 move.w    d0, d3
  0066f2  554f                 subq.w    #$2, a7
  0066f4  3f2efffe             move.w    -$2(a6), -(a7)
  0066f8  3f3c0001             move.w    #$1, -(a7)
  0066fc  42a7                 clr.l     -(a7)
  0066fe  4ead03b8             jsr       $3b8(a5)
  006702  301f                 move.w    (a7)+, d0
  006704  3600                 move.w    d0, d3
  006706  603e                 bra.b     $6746
  006708  2d7c0000011cfec8     move.l    #$11c, -$138(a6)
  006710  554f                 subq.w    #$2, a7
  006712  3f2efffe             move.w    -$2(a6), -(a7)
  006716  486efec8             pea.l     -$138(a6)
  00671a  486efedc             pea.l     -$124(a6)
  00671e  4ead0398             jsr       $398(a5)
  006722  301f                 move.w    (a7)+, d0
  006724  3600                 move.w    d0, d3
  006726  4a43                 tst.w     d3
  006728  661c                 bne.b     $6746
  00672a  554f                 subq.w    #$2, a7
  00672c  486decb4             pea.l     -$134c(a5)
  006730  486efedc             pea.l     -$124(a6)
  006734  1f3c0001             move.b    #$1, -(a7)
  006738  1f3c0001             move.b    #$1, -(a7)
  00673c  4ead0380             jsr       $380(a5)
  006740  101f                 move.b    (a7)+, d0
  006742  6702                 beq.b     $6746
  006744  7a01                 moveq     #$1, d5
  006746  4a05                 tst.b     d5
  006748  6604                 bne.b     $674e
  00674a  4a43                 tst.w     d3
  00674c  67ba                 beq.b     $6708
  00674e  4a05                 tst.b     d5
  006750  6710                 beq.b     $6762
  006752  41eefedc             lea.l     -$124(a6), a0
  006756  224a                 movea.l   a2, a1
  006758  203c0000011c         move.l    #$11c, d0
  00675e  a22e                 _BlockMove 
  006760  6002                 bra.b     $6764
  006762  7801                 moveq     #$1, d4
  006764  554f                 subq.w    #$2, a7
  006766  3f2efffe             move.w    -$2(a6), -(a7)
  00676a  4ead0390             jsr       $390(a5)
  00676e  301f                 move.w    (a7)+, d0
  006770  3600                 move.w    d0, d3
  006772  6002                 bra.b     $6776
  006774  7801                 moveq     #$1, d4
  006776  4a04                 tst.b     d4
  006778  6738                 beq.b     $67b2
  00677a  41edecb4             lea.l     -$134c(a5), a0
  00677e  224a                 movea.l   a2, a1
  006780  203c00000100         move.l    #$100, d0
  006786  a22e                 _BlockMove 
  006788  41ea0100             lea.l     $100(a2), a0
  00678c  20b8020c             move.l    $20c.w, (a0)
  006790  42aa0104             clr.l     $104(a2)
  006794  42aa0108             clr.l     $108(a2)
  006798  42aa010c             clr.l     $10c(a2)
  00679c  42aa0110             clr.l     $110(a2)
  0067a0  42aa0114             clr.l     $114(a2)
  0067a4  42aa0118             clr.l     $118(a2)
  0067a8  2f0a                 move.l    a2, -(a7)
  0067aa  4eba0010             jsr       $67bc(pc)
  0067ae  3600                 move.w    d0, d3
  0067b0  584f                 addq.w    #$4, a7
  0067b2  3003                 move.w    d3, d0
  0067b4  4cdf0438             movem.l   (a7)+, d3-d5/a2
  0067b8  4e5e                 unlk      a6
  0067ba  4e75                 rts       
  0067bc  4e56fec8             link.w    a6, #$fec8
  0067c0  48e71800             movem.l   d3-d4, -(a7)
  0067c4  7600                 moveq     #$0, d3
  0067c6  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  0067cc  554f                 subq.w    #$2, a7
  0067ce  3f3c8000             move.w    #$8000, -(a7)
  0067d2  2f3c70726566         move.l    #$70726566, -(a7)
  0067d8  1f3c0001             move.b    #$1, -(a7)
  0067dc  486efffc             pea.l     -$4(a6)
  0067e0  486efff8             pea.l     -$8(a6)
  0067e4  4ead0438             jsr       $438(a5)
  0067e8  301f                 move.w    (a7)+, d0
  0067ea  3600                 move.w    d0, d3
  0067ec  4a43                 tst.w     d3
  0067ee  6600014a             bne.w     $693a
  0067f2  554f                 subq.w    #$2, a7
  0067f4  3f2efffc             move.w    -$4(a6), -(a7)
  0067f8  2f2efff8             move.l    -$8(a6), -(a7)
  0067fc  486dfdee             pea.l     -$212(a5)
  006800  1f3c0003             move.b    #$3, -(a7)
  006804  486efffe             pea.l     -$2(a6)
  006808  4ead0418             jsr       $418(a5)
  00680c  301f                 move.w    (a7)+, d0
  00680e  3600                 move.w    d0, d3
  006810  0c43ffd5             cmpi.w    #$ffd5, d3
  006814  6640                 bne.b     $6856
  006816  554f                 subq.w    #$2, a7
  006818  3f2efffc             move.w    -$4(a6), -(a7)
  00681c  2f2efff8             move.l    -$8(a6), -(a7)
  006820  486dfdee             pea.l     -$212(a5)
  006824  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00682a  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  006830  4ead0420             jsr       $420(a5)
  006834  301f                 move.w    (a7)+, d0
  006836  3600                 move.w    d0, d3
  006838  554f                 subq.w    #$2, a7
  00683a  3f2efffc             move.w    -$4(a6), -(a7)
  00683e  2f2efff8             move.l    -$8(a6), -(a7)
  006842  486dfdee             pea.l     -$212(a5)
  006846  1f3c0003             move.b    #$3, -(a7)
  00684a  486efffe             pea.l     -$2(a6)
  00684e  4ead0418             jsr       $418(a5)
  006852  301f                 move.w    (a7)+, d0
  006854  3600                 move.w    d0, d3
  006856  4a43                 tst.w     d3
  006858  660000e0             bne.w     $693a
  00685c  7800                 moveq     #$0, d4
  00685e  554f                 subq.w    #$2, a7
  006860  3f2efffc             move.w    -$4(a6), -(a7)
  006864  2f2efff8             move.l    -$8(a6), -(a7)
  006868  486dfdee             pea.l     -$212(a5)
  00686c  486effe4             pea.l     -$1c(a6)
  006870  4ead0428             jsr       $428(a5)
  006874  301f                 move.w    (a7)+, d0
  006876  3600                 move.w    d0, d3
  006878  006e4000ffec         ori.w     #$4000, -$14(a6)
  00687e  554f                 subq.w    #$2, a7
  006880  3f2efffc             move.w    -$4(a6), -(a7)
  006884  2f2efff8             move.l    -$8(a6), -(a7)
  006888  486dfdee             pea.l     -$212(a5)
  00688c  486effe4             pea.l     -$1c(a6)
  006890  4ead0430             jsr       $430(a5)
  006894  301f                 move.w    (a7)+, d0
  006896  3600                 move.w    d0, d3
  006898  554f                 subq.w    #$2, a7
  00689a  3f2efffe             move.w    -$2(a6), -(a7)
  00689e  3f3c0001             move.w    #$1, -(a7)
  0068a2  42a7                 clr.l     -(a7)
  0068a4  4ead03b8             jsr       $3b8(a5)
  0068a8  301f                 move.w    (a7)+, d0
  0068aa  3600                 move.w    d0, d3
  0068ac  603e                 bra.b     $68ec
  0068ae  2d7c0000011cfff4     move.l    #$11c, -$c(a6)
  0068b6  554f                 subq.w    #$2, a7
  0068b8  3f2efffe             move.w    -$2(a6), -(a7)
  0068bc  486efff4             pea.l     -$c(a6)
  0068c0  486efec8             pea.l     -$138(a6)
  0068c4  4ead0398             jsr       $398(a5)
  0068c8  301f                 move.w    (a7)+, d0
  0068ca  3600                 move.w    d0, d3
  0068cc  4a43                 tst.w     d3
  0068ce  661c                 bne.b     $68ec
  0068d0  554f                 subq.w    #$2, a7
  0068d2  486decb4             pea.l     -$134c(a5)
  0068d6  486efec8             pea.l     -$138(a6)
  0068da  1f3c0001             move.b    #$1, -(a7)
  0068de  1f3c0001             move.b    #$1, -(a7)
  0068e2  4ead0380             jsr       $380(a5)
  0068e6  101f                 move.b    (a7)+, d0
  0068e8  6702                 beq.b     $68ec
  0068ea  7801                 moveq     #$1, d4
  0068ec  4a04                 tst.b     d4
  0068ee  6604                 bne.b     $68f4
  0068f0  4a43                 tst.w     d3
  0068f2  67ba                 beq.b     $68ae
  0068f4  4a04                 tst.b     d4
  0068f6  6716                 beq.b     $690e
  0068f8  554f                 subq.w    #$2, a7
  0068fa  3f2efffe             move.w    -$2(a6), -(a7)
  0068fe  3f3c0003             move.w    #$3, -(a7)
  006902  4878fee4             pea.l     $fee4.w
  006906  4ead03b8             jsr       $3b8(a5)
  00690a  301f                 move.w    (a7)+, d0
  00690c  3600                 move.w    d0, d3
  00690e  2d7c0000011cfff4     move.l    #$11c, -$c(a6)
  006916  554f                 subq.w    #$2, a7
  006918  3f2efffe             move.w    -$2(a6), -(a7)
  00691c  486efff4             pea.l     -$c(a6)
  006920  2f2e0008             move.l    $8(a6), -(a7)
  006924  4ead03a0             jsr       $3a0(a5)
  006928  301f                 move.w    (a7)+, d0
  00692a  3600                 move.w    d0, d3
  00692c  554f                 subq.w    #$2, a7
  00692e  3f2efffe             move.w    -$2(a6), -(a7)
  006932  4ead0390             jsr       $390(a5)
  006936  301f                 move.w    (a7)+, d0
  006938  3600                 move.w    d0, d3
  00693a  3003                 move.w    d3, d0
  00693c  4cdf0018             movem.l   (a7)+, d3-d4
  006940  4e5e                 unlk      a6
  006942  4e75                 rts       
  006944  4e56fffe             link.w    a6, #$fffe
  006948  48e71020             movem.l   d3/a2, -(a7)
  00694c  362e0008             move.w    $8(a6), d3
  006950  426efffe             clr.w     -$2(a6)
  006954  95ca                 suba.l    a2, a2
  006956  203c00000202         move.l    #$202, d0
  00695c  a322                 _NewHandle 
  00695e  2448                 movea.l   a0, a2
  006960  200a                 move.l    a2, d0
  006962  670a                 beq.b     $696e
  006964  554f                 subq.w    #$2, a7
  006966  3eb80220             move.w    $220.w, (a7)
  00696a  301f                 move.w    (a7)+, d0
  00696c  6704                 beq.b     $6972
  00696e  204a                 movea.l   a2, a0
  006970  602e                 bra.b     $69a0
  006972  204a                 movea.l   a2, a0
  006974  a064                 _MoveHHi  
  006976  a029                 _HLock    
  006978  2f12                 move.l    (a2), -(a7)
  00697a  3f03                 move.w    d3, -(a7)
  00697c  3f3c0002             move.w    #$2, -(a7)
  006980  4ead0408             jsr       $408(a5)
  006984  2052                 movea.l   (a2), a0
  006986  42680200             clr.w     $200(a0)
  00698a  2052                 movea.l   (a2), a0
  00698c  48680100             pea.l     $100(a0)
  006990  3f03                 move.w    d3, -(a7)
  006992  3f3c0003             move.w    #$3, -(a7)
  006996  4ead0408             jsr       $408(a5)
  00699a  204a                 movea.l   a2, a0
  00699c  a02a                 _HUnlock  
  00699e  204a                 movea.l   a2, a0
  0069a0  4cdf0408             movem.l   (a7)+, d3/a2
  0069a4  4e5e                 unlk      a6
  0069a6  4e75                 rts       
  0069a8  4e56fcf6             link.w    a6, #$fcf6
  0069ac  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  0069b0  382e0008             move.w    $8(a6), d4
  0069b4  7600                 moveq     #$0, d3
  0069b6  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  0069bc  95ca                 suba.l    a2, a2
  0069be  42aefdfa             clr.l     -$206(a6)
  0069c2  2d7c00000202fdf6     move.l    #$202, -$20a(a6)
  0069ca  41edfdfe             lea.l     -$202(a5), a0
  0069ce  43eefdfe             lea.l     -$202(a6), a1
  0069d2  703f                 moveq     #$3f, d0
  0069d4  22d8                 move.l    (a0)+, (a1)+
  0069d6  51c8fffc             dbra      d0, $69d4
  0069da  486efcf6             pea.l     -$30a(a6)
  0069de  3f04                 move.w    d4, -(a7)
  0069e0  3f3c0001             move.w    #$1, -(a7)
  0069e4  4ead0408             jsr       $408(a5)
  0069e8  41eefcf6             lea.l     -$30a(a6), a0
  0069ec  43eefefe             lea.l     -$102(a6), a1
  0069f0  203c00000100         move.l    #$100, d0
  0069f6  a02e                 _BlockMove 
  0069f8  47eefdfe             lea.l     -$202(a6), a3
  0069fc  528b                 addq.l    #$1, a3
  0069fe  7000                 moveq     #$0, d0
  006a00  102efefe             move.b    -$102(a6), d0
  006a04  5240                 addq.w    #$1, d0
  006a06  49eefefe             lea.l     -$102(a6), a4
  006a0a  d8c0                 adda.w    d0, a4
  006a0c  204b                 movea.l   a3, a0
  006a0e  224c                 movea.l   a4, a1
  006a10  7000                 moveq     #$0, d0
  006a12  102efdfe             move.b    -$202(a6), d0
  006a16  a02e                 _BlockMove 
  006a18  102efdfe             move.b    -$202(a6), d0
  006a1c  d12efefe             add.b     d0, -$102(a6)
  006a20  486efffe             pea.l     -$2(a6)
  006a24  1f3c0001             move.b    #$1, -(a7)
  006a28  486efefe             pea.l     -$102(a6)
  006a2c  4eba01c0             jsr       $6bee(pc)
  006a30  3600                 move.w    d0, d3
  006a32  4a43                 tst.w     d3
  006a34  4fef000a             lea.l     $a(a7), a7
  006a38  6704                 beq.b     $6a3e
  006a3a  204a                 movea.l   a2, a0
  006a3c  607c                 bra.b     $6aba
  006a3e  554f                 subq.w    #$2, a7
  006a40  3f2efffe             move.w    -$2(a6), -(a7)
  006a44  486efdfa             pea.l     -$206(a6)
  006a48  4ead03b0             jsr       $3b0(a5)
  006a4c  301f                 move.w    (a7)+, d0
  006a4e  3600                 move.w    d0, d3
  006a50  4a43                 tst.w     d3
  006a52  6704                 beq.b     $6a58
  006a54  204a                 movea.l   a2, a0
  006a56  6062                 bra.b     $6aba
  006a58  4aaefdfa             tst.l     -$206(a6)
  006a5c  660c                 bne.b     $6a6a
  006a5e  3f04                 move.w    d4, -(a7)
  006a60  4ebafee2             jsr       $6944(pc)
  006a64  2448                 movea.l   a0, a2
  006a66  544f                 addq.w    #$2, a7
  006a68  6040                 bra.b     $6aaa
  006a6a  202efdf6             move.l    -$20a(a6), d0
  006a6e  a322                 _NewHandle 
  006a70  2448                 movea.l   a0, a2
  006a72  200a                 move.l    a2, d0
  006a74  670a                 beq.b     $6a80
  006a76  554f                 subq.w    #$2, a7
  006a78  3eb80220             move.w    $220.w, (a7)
  006a7c  301f                 move.w    (a7)+, d0
  006a7e  6704                 beq.b     $6a84
  006a80  204a                 movea.l   a2, a0
  006a82  6036                 bra.b     $6aba
  006a84  204a                 movea.l   a2, a0
  006a86  a029                 _HLock    
  006a88  554f                 subq.w    #$2, a7
  006a8a  3f2efffe             move.w    -$2(a6), -(a7)
  006a8e  486efdf6             pea.l     -$20a(a6)
  006a92  2f12                 move.l    (a2), -(a7)
  006a94  4ead0398             jsr       $398(a5)
  006a98  301f                 move.w    (a7)+, d0
  006a9a  3600                 move.w    d0, d3
  006a9c  204a                 movea.l   a2, a0
  006a9e  a02a                 _HUnlock  
  006aa0  4a43                 tst.w     d3
  006aa2  6706                 beq.b     $6aaa
  006aa4  204a                 movea.l   a2, a0
  006aa6  a023                 _DisposeHandle 
  006aa8  95ca                 suba.l    a2, a2
  006aaa  554f                 subq.w    #$2, a7
  006aac  3f2efffe             move.w    -$2(a6), -(a7)
  006ab0  4ead0390             jsr       $390(a5)
  006ab4  301f                 move.w    (a7)+, d0
  006ab6  3600                 move.w    d0, d3
  006ab8  204a                 movea.l   a2, a0
  006aba  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  006abe  4e5e                 unlk      a6
  006ac0  4e75                 rts       
  006ac2  4e56fcfa             link.w    a6, #$fcfa
  006ac6  48e71038             movem.l   d3/a2-a4, -(a7)
  006aca  246e0008             movea.l   $8(a6), a2
  006ace  7600                 moveq     #$0, d3
  006ad0  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  006ad6  594f                 subq.w    #$4, a7
  006ad8  2f0a                 move.l    a2, -(a7)
  006ada  4ead0370             jsr       $370(a5)
  006ade  201f                 move.l    (a7)+, d0
  006ae0  2d40fdfa             move.l    d0, -$206(a6)
  006ae4  41edfefe             lea.l     -$102(a5), a0
  006ae8  43eefdfe             lea.l     -$202(a6), a1
  006aec  703f                 moveq     #$3f, d0
  006aee  22d8                 move.l    (a0)+, (a1)+
  006af0  51c8fffc             dbra      d0, $6aee
  006af4  486efcfa             pea.l     -$306(a6)
  006af8  3f2e000c             move.w    $c(a6), -(a7)
  006afc  3f3c0001             move.w    #$1, -(a7)
  006b00  4ead0408             jsr       $408(a5)
  006b04  41eefcfa             lea.l     -$306(a6), a0
  006b08  43eefefe             lea.l     -$102(a6), a1
  006b0c  203c00000100         move.l    #$100, d0
  006b12  a02e                 _BlockMove 
  006b14  47eefdfe             lea.l     -$202(a6), a3
  006b18  528b                 addq.l    #$1, a3
  006b1a  7000                 moveq     #$0, d0
  006b1c  102efefe             move.b    -$102(a6), d0
  006b20  5240                 addq.w    #$1, d0
  006b22  49eefefe             lea.l     -$102(a6), a4
  006b26  d8c0                 adda.w    d0, a4
  006b28  204b                 movea.l   a3, a0
  006b2a  224c                 movea.l   a4, a1
  006b2c  7000                 moveq     #$0, d0
  006b2e  102efdfe             move.b    -$202(a6), d0
  006b32  a02e                 _BlockMove 
  006b34  102efdfe             move.b    -$202(a6), d0
  006b38  d12efefe             add.b     d0, -$102(a6)
  006b3c  486efffe             pea.l     -$2(a6)
  006b40  1f3c0003             move.b    #$3, -(a7)
  006b44  486efefe             pea.l     -$102(a6)
  006b48  4eba00a4             jsr       $6bee(pc)
  006b4c  3600                 move.w    d0, d3
  006b4e  4a43                 tst.w     d3
  006b50  4fef000a             lea.l     $a(a7), a7
  006b54  6706                 beq.b     $6b5c
  006b56  3003                 move.w    d3, d0
  006b58  6000008c             bra.w     $6be6
  006b5c  554f                 subq.w    #$2, a7
  006b5e  3f2efffe             move.w    -$2(a6), -(a7)
  006b62  3f3c0001             move.w    #$1, -(a7)
  006b66  42a7                 clr.l     -(a7)
  006b68  4ead03b8             jsr       $3b8(a5)
  006b6c  301f                 move.w    (a7)+, d0
  006b6e  3600                 move.w    d0, d3
  006b70  4a43                 tst.w     d3
  006b72  6710                 beq.b     $6b84
  006b74  554f                 subq.w    #$2, a7
  006b76  3f2efffe             move.w    -$2(a6), -(a7)
  006b7a  4ead0390             jsr       $390(a5)
  006b7e  301f                 move.w    (a7)+, d0
  006b80  3003                 move.w    d3, d0
  006b82  6062                 bra.b     $6be6
  006b84  204a                 movea.l   a2, a0
  006b86  a029                 _HLock    
  006b88  554f                 subq.w    #$2, a7
  006b8a  3f2efffe             move.w    -$2(a6), -(a7)
  006b8e  486efdfa             pea.l     -$206(a6)
  006b92  2f12                 move.l    (a2), -(a7)
  006b94  4ead03a0             jsr       $3a0(a5)
  006b98  301f                 move.w    (a7)+, d0
  006b9a  3600                 move.w    d0, d3
  006b9c  204a                 movea.l   a2, a0
  006b9e  a02a                 _HUnlock  
  006ba0  4a43                 tst.w     d3
  006ba2  671c                 beq.b     $6bc0
  006ba4  554f                 subq.w    #$2, a7
  006ba6  42a7                 clr.l     -(a7)
  006ba8  4267                 clr.w     -(a7)
  006baa  4ead03a8             jsr       $3a8(a5)
  006bae  301f                 move.w    (a7)+, d0
  006bb0  554f                 subq.w    #$2, a7
  006bb2  3f2efffe             move.w    -$2(a6), -(a7)
  006bb6  4ead0390             jsr       $390(a5)
  006bba  301f                 move.w    (a7)+, d0
  006bbc  3003                 move.w    d3, d0
  006bbe  6026                 bra.b     $6be6
  006bc0  554f                 subq.w    #$2, a7
  006bc2  42a7                 clr.l     -(a7)
  006bc4  4267                 clr.w     -(a7)
  006bc6  4ead03a8             jsr       $3a8(a5)
  006bca  301f                 move.w    (a7)+, d0
  006bcc  3600                 move.w    d0, d3
  006bce  4a43                 tst.w     d3
  006bd0  6704                 beq.b     $6bd6
  006bd2  3003                 move.w    d3, d0
  006bd4  6010                 bra.b     $6be6
  006bd6  554f                 subq.w    #$2, a7
  006bd8  3f2efffe             move.w    -$2(a6), -(a7)
  006bdc  4ead0390             jsr       $390(a5)
  006be0  301f                 move.w    (a7)+, d0
  006be2  3600                 move.w    d0, d3
  006be4  3003                 move.w    d3, d0
  006be6  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  006bea  4e5e                 unlk      a6
  006bec  4e75                 rts       
  006bee  4e56fff8             link.w    a6, #$fff8
  006bf2  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  006bf6  246e0008             movea.l   $8(a6), a2
  006bfa  182e000c             move.b    $c(a6), d4
  006bfe  266e000e             movea.l   $e(a6), a3
  006c02  7600                 moveq     #$0, d3
  006c04  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  006c0a  36aefffe             move.w    -$2(a6), (a3)
  006c0e  554f                 subq.w    #$2, a7
  006c10  3f3c8000             move.w    #$8000, -(a7)
  006c14  2f3c70726566         move.l    #$70726566, -(a7)
  006c1a  1f3c0001             move.b    #$1, -(a7)
  006c1e  486efffc             pea.l     -$4(a6)
  006c22  486efff8             pea.l     -$8(a6)
  006c26  4ead0438             jsr       $438(a5)
  006c2a  301f                 move.w    (a7)+, d0
  006c2c  3600                 move.w    d0, d3
  006c2e  4a43                 tst.w     d3
  006c30  6704                 beq.b     $6c36
  006c32  3003                 move.w    d3, d0
  006c34  6078                 bra.b     $6cae
  006c36  554f                 subq.w    #$2, a7
  006c38  3f2efffc             move.w    -$4(a6), -(a7)
  006c3c  2f2efff8             move.l    -$8(a6), -(a7)
  006c40  2f0a                 move.l    a2, -(a7)
  006c42  1f04                 move.b    d4, -(a7)
  006c44  486efffe             pea.l     -$2(a6)
  006c48  4ead0418             jsr       $418(a5)
  006c4c  301f                 move.w    (a7)+, d0
  006c4e  3600                 move.w    d0, d3
  006c50  0c43ffd5             cmpi.w    #$ffd5, d3
  006c54  664a                 bne.b     $6ca0
  006c56  554f                 subq.w    #$2, a7
  006c58  3f2efffc             move.w    -$4(a6), -(a7)
  006c5c  2f2efff8             move.l    -$8(a6), -(a7)
  006c60  2f0a                 move.l    a2, -(a7)
  006c62  2f3c41726567         move.l    #$41726567, -(a7)
  006c68  2f3c416c6963         move.l    #$416c6963, -(a7)
  006c6e  4ead0420             jsr       $420(a5)
  006c72  301f                 move.w    (a7)+, d0
  006c74  3600                 move.w    d0, d3
  006c76  4a43                 tst.w     d3
  006c78  6704                 beq.b     $6c7e
  006c7a  3003                 move.w    d3, d0
  006c7c  6030                 bra.b     $6cae
  006c7e  554f                 subq.w    #$2, a7
  006c80  3f2efffc             move.w    -$4(a6), -(a7)
  006c84  2f2efff8             move.l    -$8(a6), -(a7)
  006c88  2f0a                 move.l    a2, -(a7)
  006c8a  1f04                 move.b    d4, -(a7)
  006c8c  486efffe             pea.l     -$2(a6)
  006c90  4ead0418             jsr       $418(a5)
  006c94  301f                 move.w    (a7)+, d0
  006c96  3600                 move.w    d0, d3
  006c98  4a43                 tst.w     d3
  006c9a  670c                 beq.b     $6ca8
  006c9c  3003                 move.w    d3, d0
  006c9e  600e                 bra.b     $6cae
  006ca0  4a43                 tst.w     d3
  006ca2  6704                 beq.b     $6ca8
  006ca4  3003                 move.w    d3, d0
  006ca6  6006                 bra.b     $6cae
  006ca8  36aefffe             move.w    -$2(a6), (a3)
  006cac  3003                 move.w    d3, d0
  006cae  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  006cb2  4e5e                 unlk      a6
  006cb4  4e75                 rts       
  006cb6  4e560000             link.w    a6, #$0
  006cba  206e0008             movea.l   $8(a6), a0
  006cbe  342e000c             move.w    $c(a6), d2
  006cc2  7020                 moveq     #$20, d0
  006cc4  9042                 sub.w     d2, d0
  006cc6  2210                 move.l    (a0), d1
  006cc8  e1a9                 lsl.l     d0, d1
  006cca  2010                 move.l    (a0), d0
  006ccc  e4a8                 lsr.l     d2, d0
  006cce  2080                 move.l    d0, (a0)
  006cd0  8390                 or.l      d1, (a0)
  006cd2  4e5e                 unlk      a6
  006cd4  4e75                 rts       
  006cd6  4e560000             link.w    a6, #$0
  006cda  206e0008             movea.l   $8(a6), a0
  006cde  342e000c             move.w    $c(a6), d2
  006ce2  7020                 moveq     #$20, d0
  006ce4  9042                 sub.w     d2, d0
  006ce6  2210                 move.l    (a0), d1
  006ce8  e0a9                 lsr.l     d0, d1
  006cea  2010                 move.l    (a0), d0
  006cec  e5a8                 lsl.l     d2, d0
  006cee  2080                 move.l    d0, (a0)
  006cf0  8390                 or.l      d1, (a0)
  006cf2  4e5e                 unlk      a6
  006cf4  4e75                 rts       
  006cf6  4e560000             link.w    a6, #$0
  006cfa  206e0008             movea.l   $8(a6), a0
  006cfe  7000                 moveq     #$0, d0
  006d00  1010                 move.b    (a0), d0
  006d02  5240                 addq.w    #$1, d0
  006d04  6018                 bra.b     $6d1e
  006d06  0c3000610000         cmpi.b    #$61, (a0, d0.w)
  006d0c  650e                 bcs.b     $6d1c
  006d0e  0c30007a0000         cmpi.b    #$7a, (a0, d0.w)
  006d14  6206                 bhi.b     $6d1c
  006d16  043000200000         subi.b    #$20, (a0, d0.w)
  006d1c  5340                 subq.w    #$1, d0
  006d1e  4a40                 tst.w     d0
  006d20  6ee4                 bgt.b     $6d06
  006d22  4e5e                 unlk      a6
  006d24  4e75                 rts       
  006d26  4e560000             link.w    a6, #$0
  006d2a  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  006d2e  246e0008             movea.l   $8(a6), a2
  006d32  266e000c             movea.l   $c(a6), a3
  006d36  7a00                 moveq     #$0, d5
  006d38  1a13                 move.b    (a3), d5
  006d3a  7601                 moveq     #$1, d3
  006d3c  6048                 bra.b     $6d86
  006d3e  2812                 move.l    (a2), d4
  006d40  0284000000ff         andi.l    #$ff, d4
  006d46  d8333000             add.b     (a3, d3.w), d4
  006d4a  7000                 moveq     #$0, d0
  006d4c  1004                 move.b    d4, d0
  006d4e  48c0                 ext.l     d0
  006d50  2212                 move.l    (a2), d1
  006d52  0281ffffff00         andi.l    #$ffffff00, d1
  006d58  8280                 or.l      d0, d1
  006d5a  2481                 move.l    d1, (a2)
  006d5c  3f3c0005             move.w    #$5, -(a7)
  006d60  2f0a                 move.l    a2, -(a7)
  006d62  4ebaff72             jsr       $6cd6(pc)
  006d66  2812                 move.l    (a2), d4
  006d68  02840000ffff         andi.l    #$ffff, d4
  006d6e  d86e0010             add.w     $10(a6), d4
  006d72  7000                 moveq     #$0, d0
  006d74  3004                 move.w    d4, d0
  006d76  2212                 move.l    (a2), d1
  006d78  0281ffff0000         andi.l    #$ffff0000, d1
  006d7e  8280                 or.l      d0, d1
  006d80  2481                 move.l    d1, (a2)
  006d82  5243                 addq.w    #$1, d3
  006d84  5c4f                 addq.w    #$6, a7
  006d86  b645                 cmp.w     d5, d3
  006d88  6fb4                 ble.b     $6d3e
  006d8a  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  006d8e  4e5e                 unlk      a6
  006d90  4e75                 rts       
  006d92  4e56fefc             link.w    a6, #$fefc
  006d96  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  006d9a  266e0008             movea.l   $8(a6), a3
  006d9e  362e000c             move.w    $c(a6), d3
  006da2  486efefc             pea.l     -$104(a6)
  006da6  3f2e000e             move.w    $e(a6), -(a7)
  006daa  3f3c0001             move.w    #$1, -(a7)
  006dae  4ead0408             jsr       $408(a5)
  006db2  203c00000100         move.l    #$100, d0
  006db8  a11e                 _NewPtr   
  006dba  2448                 movea.l   a0, a2
  006dbc  200a                 move.l    a2, d0
  006dbe  6754                 beq.b     $6e14
  006dc0  2f0b                 move.l    a3, -(a7)
  006dc2  4ebaff32             jsr       $6cf6(pc)
  006dc6  42aefffc             clr.l     -$4(a6)
  006dca  3f03                 move.w    d3, -(a7)
  006dcc  2f0b                 move.l    a3, -(a7)
  006dce  486efffc             pea.l     -$4(a6)
  006dd2  4ebaff52             jsr       $6d26(pc)
  006dd6  3f03                 move.w    d3, -(a7)
  006dd8  486efefc             pea.l     -$104(a6)
  006ddc  486efffc             pea.l     -$4(a6)
  006de0  4ebaff44             jsr       $6d26(pc)
  006de4  14bc0008             move.b    #$8, (a2)
  006de8  7601                 moveq     #$1, d3
  006dea  4fef0018             lea.l     $18(a7), a7
  006dee  601e                 bra.b     $6e0e
  006df0  780f                 moveq     #$f, d4
  006df2  c8aefffc             and.l     -$4(a6), d4
  006df6  3f3c0004             move.w    #$4, -(a7)
  006dfa  486efffc             pea.l     -$4(a6)
  006dfe  4ebafeb6             jsr       $6cb6(pc)
  006e02  7041                 moveq     #$41, d0
  006e04  d880                 add.l     d0, d4
  006e06  15843000             move.b    d4, (a2, d3.w)
  006e0a  5243                 addq.w    #$1, d3
  006e0c  5c4f                 addq.w    #$6, a7
  006e0e  0c430008             cmpi.w    #$8, d3
  006e12  6fdc                 ble.b     $6df0
  006e14  204a                 movea.l   a2, a0
  006e16  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  006e1a  4e5e                 unlk      a6
  006e1c  4e75                 rts       
  006e1e  4e56fee8             link.w    a6, #$fee8
  006e22  302e000c             move.w    $c(a6), d0
  006e26  0c400007             cmpi.w    #$7, d0
  006e2a  620000f6             bhi.w     $6f22
  006e2e  d040                 add.w     d0, d0
  006e30  303b0006             move.w    $6e38(pc, d0.w), d0
  006e34  4efb0002             jmp       $6e38(pc, d0.w)
  006e38  00ea001000220040005e008400aa00c6 cases     0:$6f22 1:$6e48 2:$6e5a 3:$6e78 4:$6e96 5:$6ebc 6:$6ee2 7:$6efe
  006e48  486eff00             pea.l     -$100(a6)
  006e4c  2f3c00040384         move.l    #$40384, -(a7)
  006e52  4ead0408             jsr       $408(a5)
  006e56  600000ca             bra.w     $6f22
  006e5a  42aefefc             clr.l     -$104(a6)
  006e5e  486efefc             pea.l     -$104(a6)
  006e62  4ebaf608             jsr       $646c(pc)
  006e66  2f2efefc             move.l    -$104(a6), -(a7)
  006e6a  486eff00             pea.l     -$100(a6)
  006e6e  4ead03e8             jsr       $3e8(a5)
  006e72  584f                 addq.w    #$4, a7
  006e74  600000ac             bra.w     $6f22
  006e78  42aefef8             clr.l     -$108(a6)
  006e7c  486efef8             pea.l     -$108(a6)
  006e80  4ebaf654             jsr       $64d6(pc)
  006e84  2f2efef8             move.l    -$108(a6), -(a7)
  006e88  486eff00             pea.l     -$100(a6)
  006e8c  4ead03e8             jsr       $3e8(a5)
  006e90  584f                 addq.w    #$4, a7
  006e92  6000008e             bra.w     $6f22
  006e96  42aefef4             clr.l     -$10c(a6)
  006e9a  422eff00             clr.b     -$100(a6)
  006e9e  486efef4             pea.l     -$10c(a6)
  006ea2  4ebaf5c8             jsr       $646c(pc)
  006ea6  7001                 moveq     #$1, d0
  006ea8  b0aefef4             cmp.l     -$10c(a6), d0
  006eac  584f                 addq.w    #$4, a7
  006eae  6772                 beq.b     $6f22
  006eb0  522eff00             addq.b    #$1, -$100(a6)
  006eb4  1d7c0073ff01         move.b    #$73, -$ff(a6)
  006eba  6066                 bra.b     $6f22
  006ebc  42aefef0             clr.l     -$110(a6)
  006ec0  422eff00             clr.b     -$100(a6)
  006ec4  486efef0             pea.l     -$110(a6)
  006ec8  4ebaf60c             jsr       $64d6(pc)
  006ecc  7001                 moveq     #$1, d0
  006ece  b0aefef0             cmp.l     -$110(a6), d0
  006ed2  584f                 addq.w    #$4, a7
  006ed4  674c                 beq.b     $6f22
  006ed6  522eff00             addq.b    #$1, -$100(a6)
  006eda  1d7c0073ff01         move.b    #$73, -$ff(a6)
  006ee0  6040                 bra.b     $6f22
  006ee2  42aefeec             clr.l     -$114(a6)
  006ee6  486efeec             pea.l     -$114(a6)
  006eea  4ebaf5cc             jsr       $64b8(pc)
  006eee  2f2efeec             move.l    -$114(a6), -(a7)
  006ef2  486eff00             pea.l     -$100(a6)
  006ef6  4ead03e8             jsr       $3e8(a5)
  006efa  584f                 addq.w    #$4, a7
  006efc  6024                 bra.b     $6f22
  006efe  42aefee8             clr.l     -$118(a6)
  006f02  422eff00             clr.b     -$100(a6)
  006f06  486efee8             pea.l     -$118(a6)
  006f0a  4ebaf5ac             jsr       $64b8(pc)
  006f0e  7001                 moveq     #$1, d0
  006f10  b0aefee8             cmp.l     -$118(a6), d0
  006f14  584f                 addq.w    #$4, a7
  006f16  670a                 beq.b     $6f22
  006f18  522eff00             addq.b    #$1, -$100(a6)
  006f1c  1d7c0073ff01         move.b    #$73, -$ff(a6)
  006f22  41eeff00             lea.l     -$100(a6), a0
  006f26  226e0008             movea.l   $8(a6), a1
  006f2a  203c00000100         move.l    #$100, d0
  006f30  a22e                 _BlockMove 
  006f32  4e5e                 unlk      a6
  006f34  4e75                 rts       
  006f36  4e56ffe0             link.w    a6, #$ffe0
  006f3a  48e71c20             movem.l   d3-d5/a2, -(a7)
  006f3e  246e0008             movea.l   $8(a6), a2
  006f42  486effe8             pea.l     -$18(a6)
  006f46  a874                 _GetPort  
  006f48  2d6a0010fff8         move.l    $10(a2), -$8(a6)
  006f4e  2d6a0014fffc         move.l    $14(a2), -$4(a6)
  006f54  2f0a                 move.l    a2, -(a7)
  006f56  a873                 _SetPort  
  006f58  3d6efffafff6         move.w    -$6(a6), -$a(a6)
  006f5e  3d6efff8fff4         move.w    -$8(a6), -$c(a6)
  006f64  486efff4             pea.l     -$c(a6)
  006f68  a870                 _LocalToGlobal 
  006f6a  3d6efff6fffa         move.w    -$a(a6), -$6(a6)
  006f70  3d6efff4fff8         move.w    -$c(a6), -$8(a6)
  006f76  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  006f7c  3d6efffcfff4         move.w    -$4(a6), -$c(a6)
  006f82  486efff4             pea.l     -$c(a6)
  006f86  a870                 _LocalToGlobal 
  006f88  3d6efff6fffe         move.w    -$a(a6), -$2(a6)
  006f8e  3d6efff4fffc         move.w    -$c(a6), -$4(a6)
  006f94  486effe4             pea.l     -$1c(a6)
  006f98  aa48                 _GetCWMgrPort 
  006f9a  2f2effe4             move.l    -$1c(a6), -(a7)
  006f9e  a873                 _SetPort  
  006fa0  a89e                 _PenNormal 
  006fa2  594f                 subq.w    #$4, a7
  006fa4  2eb809ee             move.l    $9ee.w, (a7)
  006fa8  205f                 movea.l   (a7)+, a0
  006faa  2050                 movea.l   (a0), a0
  006fac  48680002             pea.l     $2(a0)
  006fb0  a87b                 _ClipRect 
  006fb2  362efffe             move.w    -$2(a6), d3
  006fb6  966efffa             sub.w     -$6(a6), d3
  006fba  48c3                 ext.l     d3
  006fbc  87fc0010             divs.w    #$10, d3
  006fc0  48c3                 ext.l     d3
  006fc2  87fc0002             divs.w    #$2, d3
  006fc6  382efffc             move.w    -$4(a6), d4
  006fca  986efff8             sub.w     -$8(a6), d4
  006fce  48c4                 ext.l     d4
  006fd0  89fc0010             divs.w    #$10, d4
  006fd4  48c4                 ext.l     d4
  006fd6  89fc0002             divs.w    #$2, d4
  006fda  2d6efff8ffec         move.l    -$8(a6), -$14(a6)
  006fe0  2d6efffcfff0         move.l    -$4(a6), -$10(a6)
  006fe6  486effec             pea.l     -$14(a6)
  006fea  3003                 move.w    d3, d0
  006fec  e948                 lsl.w     #$4, d0
  006fee  3f00                 move.w    d0, -(a7)
  006ff0  3004                 move.w    d4, d0
  006ff2  e948                 lsl.w     #$4, d0
  006ff4  3f00                 move.w    d0, -(a7)
  006ff6  a8a9                 _InsetRect 
  006ff8  7a00                 moveq     #$0, d5
  006ffa  6044                 bra.b     $7040
  006ffc  207c00000001         movea.l   #$1, a0
  007002  43eeffe0             lea.l     -$20(a6), a1
  007006  a03b                 _Delay    
  007008  2280                 move.l    d0, (a1)
  00700a  486effec             pea.l     -$14(a6)
  00700e  a8a1                 _FrameRect 
  007010  486effec             pea.l     -$14(a6)
  007014  2f3c00010001         move.l    #$10001, -(a7)
  00701a  a8a9                 _InsetRect 
  00701c  486effec             pea.l     -$14(a6)
  007020  a8a3                 _EraseRect 
  007022  486effec             pea.l     -$14(a6)
  007026  4878ffff             pea.l     $ffff.w
  00702a  a8a9                 _InsetRect 
  00702c  486effec             pea.l     -$14(a6)
  007030  3003                 move.w    d3, d0
  007032  4440                 neg.w     d0
  007034  3f00                 move.w    d0, -(a7)
  007036  3004                 move.w    d4, d0
  007038  4440                 neg.w     d0
  00703a  3f00                 move.w    d0, -(a7)
  00703c  a8a9                 _InsetRect 
  00703e  5245                 addq.w    #$1, d5
  007040  0c450010             cmpi.w    #$10, d5
  007044  6fb6                 ble.b     $6ffc
  007046  2f0a                 move.l    a2, -(a7)
  007048  a915                 _ShowWindow 
  00704a  2f2effe8             move.l    -$18(a6), -(a7)
  00704e  a873                 _SetPort  
  007050  4cdf0438             movem.l   (a7)+, d3-d5/a2
  007054  4e5e                 unlk      a6
  007056  4e75                 rts       
  007058  4e56fff8             link.w    a6, #$fff8
  00705c  2f03                 move.l    d3, -(a7)
  00705e  7600                 moveq     #$0, d3
  007060  486efffc             pea.l     -$4(a6)
  007064  4ebaf406             jsr       $646c(pc)
  007068  486efff8             pea.l     -$8(a6)
  00706c  4ebaf468             jsr       $64d6(pc)
  007070  701e                 moveq     #$1e, d0
  007072  b0aefffc             cmp.l     -$4(a6), d0
  007076  504f                 addq.w    #$8, a7
  007078  6c0a                 bge.b     $7084
  00707a  7006                 moveq     #$6, d0
  00707c  b0aefff8             cmp.l     -$8(a6), d0
  007080  6c02                 bge.b     $7084
  007082  5243                 addq.w    #$1, d3
  007084  703c                 moveq     #$3c, d0
  007086  b0aefffc             cmp.l     -$4(a6), d0
  00708a  6c0a                 bge.b     $7096
  00708c  700c                 moveq     #$c, d0
  00708e  b0aefff8             cmp.l     -$8(a6), d0
  007092  6c02                 bge.b     $7096
  007094  5243                 addq.w    #$1, d3
  007096  3003                 move.w    d3, d0
  007098  261f                 move.l    (a7)+, d3
  00709a  4e5e                 unlk      a6
  00709c  4e75                 rts       
  00709e  4e56ffee             link.w    a6, #$ffee
  0070a2  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  0070a6  266e0010             movea.l   $10(a6), a3
  0070aa  246e000c             movea.l   $c(a6), a2
  0070ae  200d                 move.l    a5, d0
  0070b0  2a780904             movea.l   $904.w, a5
  0070b4  2a00                 move.l    d0, d5
  0070b6  7800                 moveq     #$0, d4
  0070b8  594f                 subq.w    #$4, a7
  0070ba  2f0b                 move.l    a3, -(a7)
  0070bc  a917                 _GetWRefCon 
  0070be  201f                 move.l    (a7)+, d0
  0070c0  2600                 move.l    d0, d3
  0070c2  4a83                 tst.l     d3
  0070c4  673c                 beq.b     $7102
  0070c6  594f                 subq.w    #$4, a7
  0070c8  a975                 _TickCount 
  0070ca  201f                 move.l    (a7)+, d0
  0070cc  9083                 sub.l     d3, d0
  0070ce  0c800000012c         cmpi.l    #$12c, d0
  0070d4  632c                 bls.b     $7102
  0070d6  594f                 subq.w    #$4, a7
  0070d8  a975                 _TickCount 
  0070da  201f                 move.l    (a7)+, d0
  0070dc  b083                 cmp.l     d3, d0
  0070de  6322                 bls.b     $7102
  0070e0  2f0b                 move.l    a3, -(a7)
  0070e2  3f3c0002             move.w    #$2, -(a7)
  0070e6  486efffa             pea.l     -$6(a6)
  0070ea  486efffc             pea.l     -$4(a6)
  0070ee  486efff2             pea.l     -$e(a6)
  0070f2  a98d                 _GetDialogItem 
  0070f4  2f2efffc             move.l    -$4(a6), -(a7)
  0070f8  4267                 clr.w     -(a7)
  0070fa  a95d                 _HiliteControl 
  0070fc  2f0b                 move.l    a3, -(a7)
  0070fe  42a7                 clr.l     -(a7)
  007100  a918                 _SetWRefCon 
  007102  594f                 subq.w    #$4, a7
  007104  7000                 moveq     #$0, d0
  007106  302a000e             move.w    $e(a2), d0
  00710a  2f00                 move.l    d0, -(a7)
  00710c  48780100             pea.l     $100.w
  007110  a858                 _BitAnd   
  007112  201f                 move.l    (a7)+, d0
  007114  6704                 beq.b     $711a
  007116  7601                 moveq     #$1, d3
  007118  6002                 bra.b     $711c
  00711a  7600                 moveq     #$0, d3
  00711c  0c520003             cmpi.w    #$3, (a2)
  007120  6706                 beq.b     $7128
  007122  0c520005             cmpi.w    #$5, (a2)
  007126  6662                 bne.b     $718a
  007128  4a03                 tst.b     d3
  00712a  665e                 bne.b     $718a
  00712c  594f                 subq.w    #$4, a7
  00712e  2f2a0002             move.l    $2(a2), -(a7)
  007132  487800ff             pea.l     $ff.w
  007136  a858                 _BitAnd   
  007138  201f                 move.l    (a7)+, d0
  00713a  1600                 move.b    d0, d3
  00713c  0c030003             cmpi.b    #$3, d3
  007140  6706                 beq.b     $7148
  007142  0c03000d             cmpi.b    #$d, d3
  007146  6642                 bne.b     $718a
  007148  206e0008             movea.l   $8(a6), a0
  00714c  30bc0001             move.w    #$1, (a0)
  007150  7801                 moveq     #$1, d4
  007152  2f0b                 move.l    a3, -(a7)
  007154  3f3c0001             move.w    #$1, -(a7)
  007158  486efffa             pea.l     -$6(a6)
  00715c  486efffc             pea.l     -$4(a6)
  007160  486efff2             pea.l     -$e(a6)
  007164  a98d                 _GetDialogItem 
  007166  246efffc             movea.l   -$4(a6), a2
  00716a  2f2efffc             move.l    -$4(a6), -(a7)
  00716e  3f3c0001             move.w    #$1, -(a7)
  007172  a95d                 _HiliteControl 
  007174  207c00000008         movea.l   #$8, a0
  00717a  43eeffee             lea.l     -$12(a6), a1
  00717e  a03b                 _Delay    
  007180  2280                 move.l    d0, (a1)
  007182  2f2efffc             move.l    -$4(a6), -(a7)
  007186  4267                 clr.w     -(a7)
  007188  a95d                 _HiliteControl 
  00718a  2005                 move.l    d5, d0
  00718c  c18d                 exg.l     d0, a5
  00718e  1f44003a             move.b    d4, $3a(a7)
  007192  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  007196  4e5e                 unlk      a6
  007198  205f                 movea.l   (a7)+, a0
  00719a  4fef000c             lea.l     $c(a7), a7
  00719e  4ed0                 jmp       (a0)
  0071a0  4e56fffc             link.w    a6, #$fffc
  0071a4  200d                 move.l    a5, d0
  0071a6  2a780904             movea.l   $904.w, a5
  0071aa  2d40fffc             move.l    d0, -$4(a6)
  0071ae  4eba02ee             jsr       $749e(pc)
  0071b2  202efffc             move.l    -$4(a6), d0
  0071b6  c18d                 exg.l     d0, a5
  0071b8  4e5e                 unlk      a6
  0071ba  205f                 movea.l   (a7)+, a0
  0071bc  5c4f                 addq.w    #$6, a7
  0071be  4ed0                 jmp       (a0)
  0071c0  4e56fff2             link.w    a6, #$fff2
  0071c4  a89e                 _PenNormal 
  0071c6  2f2e000a             move.l    $a(a6), -(a7)
  0071ca  3f2e0008             move.w    $8(a6), -(a7)
  0071ce  486efff6             pea.l     -$a(a6)
  0071d2  486efff2             pea.l     -$e(a6)
  0071d6  486efff8             pea.l     -$8(a6)
  0071da  a98d                 _GetDialogItem 
  0071dc  2f3c00030003         move.l    #$30003, -(a7)
  0071e2  a89b                 _PenSize  
  0071e4  486efff8             pea.l     -$8(a6)
  0071e8  2f3c00100010         move.l    #$100010, -(a7)
  0071ee  a8b0                 _FrameRoundRect 
  0071f0  2f3c00010001         move.l    #$10001, -(a7)
  0071f6  a89b                 _PenSize  
  0071f8  4e5e                 unlk      a6
  0071fa  205f                 movea.l   (a7)+, a0
  0071fc  5c4f                 addq.w    #$6, a7
  0071fe  4ed0                 jmp       (a0)
  007200  4e560000             link.w    a6, #$0
  007204  4aadeee4             tst.l     -$111c(a5)
  007208  670c                 beq.b     $7216
  00720a  2f2deee4             move.l    -$111c(a5), -(a7)
  00720e  4eba0018             jsr       $7228(pc)
  007212  584f                 addq.w    #$4, a7
  007214  600c                 bra.b     $7222
  007216  4a6dedbe             tst.w     -$1242(a5)
  00721a  6706                 beq.b     $7222
  00721c  41ededba             lea.l     -$1246(a5), a0
  007220  a05f                 _trap_a05f 
  007222  7000                 moveq     #$0, d0
  007224  4e5e                 unlk      a6
  007226  4e75                 rts       
  007228  4e560000             link.w    a6, #$0
  00722c  206e0008             movea.l   $8(a6), a0
  007230  b1edeee4             cmpa.l    -$111c(a5), a0
  007234  667a                 bne.b     $72b0
  007236  422deee3             clr.b     -$111d(a5)
  00723a  4aadeee4             tst.l     -$111c(a5)
  00723e  6724                 beq.b     $7264
  007240  4eba02ae             jsr       $74f0(pc)
  007244  2f2deee4             move.l    -$111c(a5), -(a7)
  007248  4227                 clr.b     -(a7)
  00724a  a908                 _ShowHide 
  00724c  554f                 subq.w    #$2, a7
  00724e  2f2deee4             move.l    -$111c(a5), -(a7)
  007252  3f3c005b             move.w    #$5b, -(a7)
  007256  a88f                 _trap_a88f 
  007258  301f                 move.w    (a7)+, d0
  00725a  42adeee4             clr.l     -$111c(a5)
  00725e  206dedb6             movea.l   -$124a(a5), a0
  007262  5390                 subq.l    #$1, (a0)
  007264  4aadef14             tst.l     -$10ec(a5)
  007268  6712                 beq.b     $727c
  00726a  2f2def1c             move.l    -$10e4(a5), -(a7)
  00726e  2f2def14             move.l    -$10ec(a5), -(a7)
  007272  4eba0efc             jsr       $8170(pc)
  007276  42adef14             clr.l     -$10ec(a5)
  00727a  504f                 addq.w    #$8, a7
  00727c  4aadef18             tst.l     -$10e8(a5)
  007280  6704                 beq.b     $7286
  007282  42adef18             clr.l     -$10e8(a5)
  007286  4aadef20             tst.l     -$10e0(a5)
  00728a  6704                 beq.b     $7290
  00728c  42adef20             clr.l     -$10e0(a5)
  007290  4aadeeec             tst.l     -$1114(a5)
  007294  670a                 beq.b     $72a0
  007296  206deeec             movea.l   -$1114(a5), a0
  00729a  a023                 _DisposeHandle 
  00729c  42adeeec             clr.l     -$1114(a5)
  0072a0  4aadeee8             tst.l     -$1118(a5)
  0072a4  670a                 beq.b     $72b0
  0072a6  206deee8             movea.l   -$1118(a5), a0
  0072aa  a023                 _DisposeHandle 
  0072ac  42adeee8             clr.l     -$1118(a5)
  0072b0  4e5e                 unlk      a6
  0072b2  4e75                 rts       
  0072b4  4e56fef8             link.w    a6, #$fef8
  0072b8  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0072bc  3e2e0008             move.w    $8(a6), d7
  0072c0  2c2e000a             move.l    $a(a6), d6
  0072c4  7600                 moveq     #$0, d3
  0072c6  700c                 moveq     #$c, d0
  0072c8  a11e                 _NewPtr   
  0072ca  2448                 movea.l   a0, a2
  0072cc  200a                 move.l    a2, d0
  0072ce  6606                 bne.b     $72d6
  0072d0  7694                 moveq     #$94, d3
  0072d2  600001c0             bra.w     $7494
  0072d6  594f                 subq.w    #$4, a7
  0072d8  2f3c54455854         move.l    #$54455854, -(a7)
  0072de  3f07                 move.w    d7, -(a7)
  0072e0  a9a0                 _GetResource 
  0072e2  205f                 movea.l   (a7)+, a0
  0072e4  2648                 movea.l   a0, a3
  0072e6  200b                 move.l    a3, d0
  0072e8  660e                 bne.b     $72f8
  0072ea  204a                 movea.l   a2, a0
  0072ec  a01f                 _DisposePtr 
  0072ee  363cff40             move.w    #$ff40, d3
  0072f2  3003                 move.w    d3, d0
  0072f4  600001a0             bra.w     $7496
  0072f8  204b                 movea.l   a3, a0
  0072fa  a04a                 _HNoPurge 
  0072fc  204b                 movea.l   a3, a0
  0072fe  a064                 _MoveHHi  
  007300  a029                 _HLock    
  007302  594f                 subq.w    #$4, a7
  007304  2f0b                 move.l    a3, -(a7)
  007306  4ead0370             jsr       $370(a5)
  00730a  201f                 move.l    (a7)+, d0
  00730c  2800                 move.l    d0, d4
  00730e  2046                 movea.l   d6, a0
  007310  2d50fff8             move.l    (a0), -$8(a6)
  007314  2d680004fffc         move.l    $4(a0), -$4(a6)
  00731a  486efff8             pea.l     -$8(a6)
  00731e  2f3c75307530         move.l    #$75307530, -(a7)
  007324  a8a8                 _OffsetRect 
  007326  594f                 subq.w    #$4, a7
  007328  486efff8             pea.l     -$8(a6)
  00732c  486efff8             pea.l     -$8(a6)
  007330  a83e                 _TEStyleNew 
  007332  205f                 movea.l   (a7)+, a0
  007334  25480008             move.l    a0, $8(a2)
  007338  200a                 move.l    a2, d0
  00733a  6614                 bne.b     $7350
  00733c  204b                 movea.l   a3, a0
  00733e  a02a                 _HUnlock  
  007340  204b                 movea.l   a3, a0
  007342  a049                 _HPurge   
  007344  204a                 movea.l   a2, a0
  007346  a01f                 _DisposePtr 
  007348  7694                 moveq     #$94, d3
  00734a  3003                 move.w    d3, d0
  00734c  60000148             bra.w     $7496
  007350  594f                 subq.w    #$4, a7
  007352  2f3c7374796c         move.l    #$7374796c, -(a7)
  007358  3f07                 move.w    d7, -(a7)
  00735a  a9a0                 _GetResource 
  00735c  205f                 movea.l   (a7)+, a0
  00735e  2848                 movea.l   a0, a4
  007360  200c                 move.l    a4, d0
  007362  661c                 bne.b     $7380
  007364  2f2a0008             move.l    $8(a2), -(a7)
  007368  a9cd                 _TEDispose 
  00736a  204b                 movea.l   a3, a0
  00736c  a02a                 _HUnlock  
  00736e  204b                 movea.l   a3, a0
  007370  a049                 _HPurge   
  007372  204a                 movea.l   a2, a0
  007374  a01f                 _DisposePtr 
  007376  363cff40             move.w    #$ff40, d3
  00737a  3003                 move.w    d3, d0
  00737c  60000118             bra.w     $7496
  007380  204c                 movea.l   a4, a0
  007382  a04a                 _HNoPurge 
  007384  2f2a0008             move.l    $8(a2), -(a7)
  007388  a9d8                 _TEActivate 
  00738a  2f13                 move.l    (a3), -(a7)
  00738c  2f04                 move.l    d4, -(a7)
  00738e  2f0c                 move.l    a4, -(a7)
  007390  2f2a0008             move.l    $8(a2), -(a7)
  007394  3f3c0007             move.w    #$7, -(a7)
  007398  a83d                 _TEDispatch 
  00739a  2f2a0008             move.l    $8(a2), -(a7)
  00739e  a9d0                 _TECalText 
  0073a0  204c                 movea.l   a4, a0
  0073a2  a049                 _HPurge   
  0073a4  204b                 movea.l   a3, a0
  0073a6  a02a                 _HUnlock  
  0073a8  204b                 movea.l   a3, a0
  0073aa  a049                 _HPurge   
  0073ac  7800                 moveq     #$0, d4
  0073ae  206a0008             movea.l   $8(a2), a0
  0073b2  2050                 movea.l   (a0), a0
  0073b4  2668003e             movea.l   $3e(a0), a3
  0073b8  606a                 bra.b     $7424
  0073ba  2053                 movea.l   (a3), a0
  0073bc  0c30005e4000         cmpi.b    #$5e, (a0, d4.w)
  0073c2  665e                 bne.b     $7422
  0073c4  3004                 move.w    d4, d0
  0073c6  5240                 addq.w    #$1, d0
  0073c8  2053                 movea.l   (a3), a0
  0073ca  1a300000             move.b    (a0, d0.w), d5
  0073ce  0c050030             cmpi.b    #$30, d5
  0073d2  6d4e                 blt.b     $7422
  0073d4  0c050039             cmpi.b    #$39, d5
  0073d8  6e48                 bgt.b     $7422
  0073da  1e05                 move.b    d5, d7
  0073dc  4887                 ext.w     d7
  0073de  0647ffd1             addi.w    #$ffd1, d7
  0073e2  4aae000e             tst.l     $e(a6)
  0073e6  670e                 beq.b     $73f6
  0073e8  3f07                 move.w    d7, -(a7)
  0073ea  486efef8             pea.l     -$108(a6)
  0073ee  206e000e             movea.l   $e(a6), a0
  0073f2  4e90                 jsr       (a0)
  0073f4  5c4f                 addq.w    #$6, a7
  0073f6  3044                 movea.w   d4, a0
  0073f8  2f08                 move.l    a0, -(a7)
  0073fa  3004                 move.w    d4, d0
  0073fc  5440                 addq.w    #$2, d0
  0073fe  48c0                 ext.l     d0
  007400  2f00                 move.l    d0, -(a7)
  007402  2f2a0008             move.l    $8(a2), -(a7)
  007406  a9d1                 _TESetSelect 
  007408  2f2a0008             move.l    $8(a2), -(a7)
  00740c  a9d7                 _trap_a9d7 
  00740e  486efef9             pea.l     -$107(a6)
  007412  7000                 moveq     #$0, d0
  007414  102efef8             move.b    -$108(a6), d0
  007418  2f00                 move.l    d0, -(a7)
  00741a  2f2a0008             move.l    $8(a2), -(a7)
  00741e  a9de                 _TEInsert 
  007420  6002                 bra.b     $7424
  007422  5244                 addq.w    #$1, d4
  007424  206a0008             movea.l   $8(a2), a0
  007428  2050                 movea.l   (a0), a0
  00742a  3028003c             move.w    $3c(a0), d0
  00742e  5340                 subq.w    #$1, d0
  007430  b840                 cmp.w     d0, d4
  007432  6d86                 blt.b     $73ba
  007434  2f2a0008             move.l    $8(a2), -(a7)
  007438  a9d9                 _TEDeactivate 
  00743a  2046                 movea.l   d6, a0
  00743c  226a0008             movea.l   $8(a2), a1
  007440  2251                 movea.l   (a1), a1
  007442  23500008             move.l    (a0), $8(a1)
  007446  23680004000c         move.l    $4(a0), $c(a1)
  00744c  226a0008             movea.l   $8(a2), a1
  007450  2251                 movea.l   (a1), a1
  007452  22d8                 move.l    (a0)+, (a1)+
  007454  22d8                 move.l    (a0)+, (a1)+
  007456  2f2a0008             move.l    $8(a2), -(a7)
  00745a  a9d0                 _TECalText 
  00745c  2f06                 move.l    d6, -(a7)
  00745e  2f2a0008             move.l    $8(a2), -(a7)
  007462  a9d3                 _TEUpdate 
  007464  266df324             movea.l   -$cdc(a5), a3
  007468  200b                 move.l    a3, d0
  00746a  6624                 bne.b     $7490
  00746c  2b4af324             move.l    a2, -$cdc(a5)
  007470  4292                 clr.l     (a2)
  007472  42aa0004             clr.l     $4(a2)
  007476  601c                 bra.b     $7494
  007478  4aab0004             tst.l     $4(a3)
  00747c  660e                 bne.b     $748c
  00747e  274a0004             move.l    a2, $4(a3)
  007482  248b                 move.l    a3, (a2)
  007484  42aa0004             clr.l     $4(a2)
  007488  97cb                 suba.l    a3, a3
  00748a  6004                 bra.b     $7490
  00748c  266b0004             movea.l   $4(a3), a3
  007490  200b                 move.l    a3, d0
  007492  66e4                 bne.b     $7478
  007494  3003                 move.w    d3, d0
  007496  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  00749a  4e5e                 unlk      a6
  00749c  4e75                 rts       
  00749e  4e56fff0             link.w    a6, #$fff0
  0074a2  2f0a                 move.l    a2, -(a7)
  0074a4  486efffc             pea.l     -$4(a6)
  0074a8  a874                 _GetPort  
  0074aa  246df324             movea.l   -$cdc(a5), a2
  0074ae  6030                 bra.b     $74e0
  0074b0  206a0008             movea.l   $8(a2), a0
  0074b4  2050                 movea.l   (a0), a0
  0074b6  2d50fff4             move.l    (a0), -$c(a6)
  0074ba  2d680004fff8         move.l    $4(a0), -$8(a6)
  0074c0  206a0008             movea.l   $8(a2), a0
  0074c4  2050                 movea.l   (a0), a0
  0074c6  2d680052fff0         move.l    $52(a0), -$10(a6)
  0074cc  2f2efff0             move.l    -$10(a6), -(a7)
  0074d0  a873                 _SetPort  
  0074d2  486efff4             pea.l     -$c(a6)
  0074d6  2f2a0008             move.l    $8(a2), -(a7)
  0074da  a9d3                 _TEUpdate 
  0074dc  246a0004             movea.l   $4(a2), a2
  0074e0  200a                 move.l    a2, d0
  0074e2  66cc                 bne.b     $74b0
  0074e4  2f2efffc             move.l    -$4(a6), -(a7)
  0074e8  a873                 _SetPort  
  0074ea  245f                 movea.l   (a7)+, a2
  0074ec  4e5e                 unlk      a6
  0074ee  4e75                 rts       
  0074f0  4e56fff4             link.w    a6, #$fff4
  0074f4  48e70038             movem.l   a2-a4, -(a7)
  0074f8  486efffc             pea.l     -$4(a6)
  0074fc  a874                 _GetPort  
  0074fe  246df324             movea.l   -$cdc(a5), a2
  007502  6034                 bra.b     $7538
  007504  286a0004             movea.l   $4(a2), a4
  007508  206a0008             movea.l   $8(a2), a0
  00750c  2050                 movea.l   (a0), a0
  00750e  2d50fff4             move.l    (a0), -$c(a6)
  007512  2d680004fff8         move.l    $4(a0), -$8(a6)
  007518  206a0008             movea.l   $8(a2), a0
  00751c  2050                 movea.l   (a0), a0
  00751e  26680052             movea.l   $52(a0), a3
  007522  2f0b                 move.l    a3, -(a7)
  007524  a873                 _SetPort  
  007526  486efff4             pea.l     -$c(a6)
  00752a  a928                 _InvalRect 
  00752c  2f2a0008             move.l    $8(a2), -(a7)
  007530  a9cd                 _TEDispose 
  007532  204a                 movea.l   a2, a0
  007534  a01f                 _DisposePtr 
  007536  244c                 movea.l   a4, a2
  007538  200a                 move.l    a2, d0
  00753a  66c8                 bne.b     $7504
  00753c  42adf324             clr.l     -$cdc(a5)
  007540  2f2efffc             move.l    -$4(a6), -(a7)
  007544  a873                 _SetPort  
  007546  4cdf1c00             movem.l   (a7)+, a2-a4
  00754a  4e5e                 unlk      a6
  00754c  4e75                 rts       
  00754e  4e56ff84             link.w    a6, #$ff84
  007552  2d6e0012ff98         move.l    $12(a6), -$68(a6)
  007558  3d6e0010ff9c         move.w    $10(a6), -$64(a6)
  00755e  2d6e000cffa6         move.l    $c(a6), -$5a(a6)
  007564  206e0008             movea.l   $8(a6), a0
  007568  2d50ffaa             move.l    (a0), -$56(a6)
  00756c  41eeff86             lea.l     -$7a(a6), a0
  007570  7030                 moveq     #$30, d0
  007572  a260                 _HFSDispatch 
  007574  3d40ff84             move.w    d0, -$7c(a6)
  007578  206e0008             movea.l   $8(a6), a0
  00757c  20aeffae             move.l    -$52(a6), (a0)
  007580  3f6eff840092         move.w    -$7c(a6), $92(a7)
  007586  4e5e                 unlk      a6
  007588  205f                 movea.l   (a7)+, a0
  00758a  4fef000e             lea.l     $e(a7), a7
  00758e  4ed0                 jmp       (a0)
  007590  4e560000             link.w    a6, #$0
  007594  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  007598  262e000c             move.l    $c(a6), d3
  00759c  266e0008             movea.l   $8(a6), a3
  0075a0  0283fffffc00         andi.l    #$fffffc00, d3
  0075a6  0c8300000400         cmpi.l    #$400, d3
  0075ac  6c06                 bge.b     $75b4
  0075ae  263c00000400         move.l    #$400, d3
  0075b4  2003                 move.l    d3, d0
  0075b6  a11e                 _NewPtr   
  0075b8  2448                 movea.l   a0, a2
  0075ba  200a                 move.l    a2, d0
  0075bc  6638                 bne.b     $75f6
  0075be  0c8300000400         cmpi.l    #$400, d3
  0075c4  6f30                 ble.b     $75f6
  0075c6  a01c                 _FreeMem  
  0075c8  048000008000         subi.l    #$8000, d0
  0075ce  0280fffffc00         andi.l    #$fffffc00, d0
  0075d4  2800                 move.l    d0, d4
  0075d6  a061                 _MaxBlock 
  0075d8  0280fffffc00         andi.l    #$fffffc00, d0
  0075de  2600                 move.l    d0, d3
  0075e0  b684                 cmp.l     d4, d3
  0075e2  6f02                 ble.b     $75e6
  0075e4  2604                 move.l    d4, d3
  0075e6  4a83                 tst.l     d3
  0075e8  6606                 bne.b     $75f0
  0075ea  263c00000400         move.l    #$400, d3
  0075f0  2003                 move.l    d3, d0
  0075f2  a11e                 _NewPtr   
  0075f4  2448                 movea.l   a0, a2
  0075f6  200a                 move.l    a2, d0
  0075f8  6704                 beq.b     $75fe
  0075fa  2683                 move.l    d3, (a3)
  0075fc  6002                 bra.b     $7600
  0075fe  4293                 clr.l     (a3)
  007600  2f4a0020             move.l    a2, $20(a7)
  007604  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  007608  4e5e                 unlk      a6
  00760a  205f                 movea.l   (a7)+, a0
  00760c  504f                 addq.w    #$8, a7
  00760e  4ed0                 jmp       (a0)
  007610  4e56ff00             link.w    a6, #$ff00
  007614  48e71030             movem.l   d3/a2-a3, -(a7)
  007618  266e000e             movea.l   $e(a6), a3
  00761c  246e0008             movea.l   $8(a6), a2
  007620  200a                 move.l    a2, d0
  007622  673e                 beq.b     $7662
  007624  356e000c0016         move.w    $c(a6), $16(a2)
  00762a  200b                 move.l    a3, d0
  00762c  660a                 bne.b     $7638
  00762e  42aa0012             clr.l     $12(a2)
  007632  426a001c             clr.w     $1c(a2)
  007636  601e                 bra.b     $7656
  007638  204b                 movea.l   a3, a0
  00763a  43eeff00             lea.l     -$100(a6), a1
  00763e  7000                 moveq     #$0, d0
  007640  1013                 move.b    (a3), d0
  007642  5240                 addq.w    #$1, d0
  007644  48c0                 ext.l     d0
  007646  a22e                 _BlockMove 
  007648  41eeff00             lea.l     -$100(a6), a0
  00764c  25480012             move.l    a0, $12(a2)
  007650  357cffff001c         move.w    #$ffff, $1c(a2)
  007656  204a                 movea.l   a2, a0
  007658  a207                 _GetVolInfo 
  00765a  3600                 move.w    d0, d3
  00765c  42aa0012             clr.l     $12(a2)
  007660  6002                 bra.b     $7664
  007662  76ce                 moveq     #$ce, d3
  007664  3f43011e             move.w    d3, $11e(a7)
  007668  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  00766c  4e5e                 unlk      a6
  00766e  205f                 movea.l   (a7)+, a0
  007670  4fef000a             lea.l     $a(a7), a7
  007674  4ed0                 jmp       (a0)
  007676  4e56ff84             link.w    a6, #$ff84
  00767a  554f                 subq.w    #$2, a7
  00767c  2f2e000e             move.l    $e(a6), -(a7)
  007680  3f2e000c             move.w    $c(a6), -(a7)
  007684  486eff86             pea.l     -$7a(a6)
  007688  4ebaff86             jsr       $7610(pc)
  00768c  301f                 move.w    (a7)+, d0
  00768e  3d40ff84             move.w    d0, -$7c(a6)
  007692  206e0008             movea.l   $8(a6), a0
  007696  30aeff9c             move.w    -$64(a6), (a0)
  00769a  3f6eff84008e         move.w    -$7c(a6), $8e(a7)
  0076a0  4e5e                 unlk      a6
  0076a2  205f                 movea.l   (a7)+, a0
  0076a4  4fef000a             lea.l     $a(a7), a7
  0076a8  4ed0                 jmp       (a0)
  0076aa  4e56ff86             link.w    a6, #$ff86
  0076ae  2f03                 move.l    d3, -(a7)
  0076b0  554f                 subq.w    #$2, a7
  0076b2  2f2e0008             move.l    $8(a6), -(a7)
  0076b6  3f2e000c             move.w    $c(a6), -(a7)
  0076ba  486eff86             pea.l     -$7a(a6)
  0076be  4ebaff50             jsr       $7610(pc)
  0076c2  301f                 move.w    (a7)+, d0
  0076c4  3600                 move.w    d0, d3
  0076c6  4a43                 tst.w     d3
  0076c8  662a                 bne.b     $76f4
  0076ca  206e000e             movea.l   $e(a6), a0
  0076ce  30aeff9c             move.w    -$64(a6), (a0)
  0076d2  306eff9c             movea.w   -$64(a6), a0
  0076d6  202effa4             move.l    -$5c(a6), d0
  0076da  d088                 add.l     a0, d0
  0076dc  7200                 moveq     #$0, d1
  0076de  322effb4             move.w    -$4c(a6), d1
  0076e2  d280                 add.l     d0, d1
  0076e4  d2aeffb6             add.l     -$4a(a6), d1
  0076e8  306effcc             movea.w   -$34(a6), a0
  0076ec  d288                 add.l     a0, d1
  0076ee  206e0012             movea.l   $12(a6), a0
  0076f2  2081                 move.l    d1, (a0)
  0076f4  3003                 move.w    d3, d0
  0076f6  261f                 move.l    (a7)+, d3
  0076f8  4e5e                 unlk      a6
  0076fa  4e75                 rts       
  0076fc  4e56fffc             link.w    a6, #$fffc
  007700  48e71030             movem.l   d3/a2-a3, -(a7)
  007704  266e000a             movea.l   $a(a6), a3
  007708  246e000e             movea.l   $e(a6), a2
  00770c  302e0008             move.w    $8(a6), d0
  007710  5240                 addq.w    #$1, d0
  007712  7200                 moveq     #$0, d1
  007714  3200                 move.w    d0, d1
  007716  2012                 move.l    (a2), d0
  007718  2d41fffc             move.l    d1, -$4(a6)
  00771c  720a                 moveq     #$a, d1
  00771e  4ead0cde             jsr       $cde(a5)
  007722  b0aefffc             cmp.l     -$4(a6), d0
  007726  6624                 bne.b     $774c
  007728  204b                 movea.l   a3, a0
  00772a  2012                 move.l    (a2), d0
  00772c  0680000000c8         addi.l    #$c8, d0
  007732  a024                 _SetHandleSize 
  007734  554f                 subq.w    #$2, a7
  007736  3eb80220             move.w    $220.w, (a7)
  00773a  301f                 move.w    (a7)+, d0
  00773c  3600                 move.w    d0, d3
  00773e  594f                 subq.w    #$4, a7
  007740  2f0b                 move.l    a3, -(a7)
  007742  4ead0370             jsr       $370(a5)
  007746  201f                 move.l    (a7)+, d0
  007748  2480                 move.l    d0, (a2)
  00774a  6002                 bra.b     $774e
  00774c  7600                 moveq     #$0, d3
  00774e  3003                 move.w    d3, d0
  007750  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  007754  4e5e                 unlk      a6
  007756  4e75                 rts       
  007758  4e560000             link.w    a6, #$0
  00775c  48e70418             movem.l   d5/a3-a4, -(a7)
  007760  226e0008             movea.l   $8(a6), a1
  007764  242e000c             move.l    $c(a6), d2
  007768  286e0010             movea.l   $10(a6), a4
  00776c  2a2e0014             move.l    $14(a6), d5
  007770  26690028             movea.l   $28(a1), a3
  007774  2229002c             move.l    $2c(a1), d1
  007778  4aa90018             tst.l     $18(a1)
  00777c  670000dc             beq.w     $785a
  007780  200b                 move.l    a3, d0
  007782  670000d6             beq.w     $785a
  007786  20290024             move.l    $24(a1), d0
  00778a  02800000bffc         andi.l    #$bffc, d0
  007790  6706                 beq.b     $7798
  007792  4a81                 tst.l     d1
  007794  670000c4             beq.w     $785a
  007798  2042                 movea.l   d2, a0
  00779a  4210                 clr.b     (a0)
  00779c  4214                 clr.b     (a4)
  00779e  2045                 movea.l   d5, a0
  0077a0  4210                 clr.b     (a0)
  0077a2  7003                 moveq     #$3, d0
  0077a4  c0a90024             and.l     $24(a1), d0
  0077a8  6724                 beq.b     $77ce
  0077aa  4aab0012             tst.l     $12(a3)
  0077ae  670000aa             beq.w     $785a
  0077b2  206b0012             movea.l   $12(a3), a0
  0077b6  4a10                 tst.b     (a0)
  0077b8  670000a0             beq.w     $785a
  0077bc  206b0012             movea.l   $12(a3), a0
  0077c0  0c10003f             cmpi.b    #$3f, (a0)
  0077c4  62000094             bhi.w     $785a
  0077c8  2045                 movea.l   d5, a0
  0077ca  10bc0001             move.b    #$1, (a0)
  0077ce  7004                 moveq     #$4, d0
  0077d0  c0a90024             and.l     $24(a1), d0
  0077d4  6740                 beq.b     $7816
  0077d6  2041                 movea.l   d1, a0
  0077d8  1028001e             move.b    $1e(a0), d0
  0077dc  4880                 ext.w     d0
  0077de  0240ffee             andi.w    #$ffee, d0
  0077e2  6676                 bne.b     $785a
  0077e4  1028001e             move.b    $1e(a0), d0
  0077e8  4880                 ext.w     d0
  0077ea  02400010             andi.w    #$10, d0
  0077ee  671a                 beq.b     $780a
  0077f0  102b001e             move.b    $1e(a3), d0
  0077f4  4880                 ext.w     d0
  0077f6  02400010             andi.w    #$10, d0
  0077fa  6706                 beq.b     $7802
  0077fc  18bc0001             move.b    #$1, (a4)
  007800  601e                 bra.b     $7820
  007802  2042                 movea.l   d2, a0
  007804  10bc0001             move.b    #$1, (a0)
  007808  6016                 bra.b     $7820
  00780a  18bc0001             move.b    #$1, (a4)
  00780e  2042                 movea.l   d2, a0
  007810  10bc0001             move.b    #$1, (a0)
  007814  600a                 bra.b     $7820
  007816  18bc0001             move.b    #$1, (a4)
  00781a  2042                 movea.l   d2, a0
  00781c  10bc0001             move.b    #$1, (a0)
  007820  4a14                 tst.b     (a4)
  007822  6714                 beq.b     $7838
  007824  7004                 moveq     #$4, d0
  007826  c0a90024             and.l     $24(a1), d0
  00782a  670c                 beq.b     $7838
  00782c  2041                 movea.l   d1, a0
  00782e  1028001e             move.b    $1e(a0), d0
  007832  02400001             andi.w    #$1, d0
  007836  6622                 bne.b     $785a
  007838  2042                 movea.l   d2, a0
  00783a  4a10                 tst.b     (a0)
  00783c  6708                 beq.b     $7846
  00783e  7010                 moveq     #$10, d0
  007840  c0a90024             and.l     $24(a1), d0
  007844  6614                 bne.b     $785a
  007846  4a14                 tst.b     (a4)
  007848  670c                 beq.b     $7856
  00784a  20290024             move.l    $24(a1), d0
  00784e  0280000001e0         andi.l    #$1e0, d0
  007854  6604                 bne.b     $785a
  007856  7000                 moveq     #$0, d0
  007858  6002                 bra.b     $785c
  00785a  70ce                 moveq     #$ce, d0
  00785c  4cdf1820             movem.l   (a7)+, d5/a3-a4
  007860  4e5e                 unlk      a6
  007862  4e75                 rts       
  007864  4e56fffe             link.w    a6, #$fffe
  007868  48e70700             movem.l   d5-d7, -(a7)
  00786c  226e0008             movea.l   $8(a6), a1
  007870  206e000c             movea.l   $c(a6), a0
  007874  7c00                 moveq     #$0, d6
  007876  7200                 moveq     #$0, d1
  007878  1211                 move.b    (a1), d1
  00787a  7e00                 moveq     #$0, d7
  00787c  1e10                 move.b    (a0), d7
  00787e  be41                 cmp.w     d1, d7
  007880  6e40                 bgt.b     $78c2
  007882  3d7c0001fffe         move.w    #$1, -$2(a6)
  007888  3401                 move.w    d1, d2
  00788a  9447                 sub.w     d7, d2
  00788c  5242                 addq.w    #$1, d2
  00788e  3a2efffe             move.w    -$2(a6), d5
  007892  7201                 moveq     #$1, d1
  007894  600c                 bra.b     $78a2
  007896  b247                 cmp.w     d7, d1
  007898  6604                 bne.b     $789e
  00789a  7c01                 moveq     #$1, d6
  00789c  6004                 bra.b     $78a2
  00789e  5241                 addq.w    #$1, d1
  0078a0  5245                 addq.w    #$1, d5
  0078a2  4a06                 tst.b     d6
  0078a4  660a                 bne.b     $78b0
  0078a6  10315000             move.b    (a1, d5.w), d0
  0078aa  b0301000             cmp.b     (a0, d1.w), d0
  0078ae  67e6                 beq.b     $7896
  0078b0  4a06                 tst.b     d6
  0078b2  6606                 bne.b     $78ba
  0078b4  526efffe             addq.w    #$1, -$2(a6)
  0078b8  5342                 subq.w    #$1, d2
  0078ba  4a42                 tst.w     d2
  0078bc  6704                 beq.b     $78c2
  0078be  4a06                 tst.b     d6
  0078c0  67cc                 beq.b     $788e
  0078c2  1006                 move.b    d6, d0
  0078c4  4cdf00e0             movem.l   (a7)+, d5-d7
  0078c8  4e5e                 unlk      a6
  0078ca  4e75                 rts       
  0078cc  4e560000             link.w    a6, #$0
  0078d0  48e70808             movem.l   d4/a4, -(a7)
  0078d4  286e0008             movea.l   $8(a6), a4
  0078d8  226e000c             movea.l   $c(a6), a1
  0078dc  206e0010             movea.l   $10(a6), a0
  0078e0  382e0014             move.w    $14(a6), d4
  0078e4  7401                 moveq     #$1, d2
  0078e6  6014                 bra.b     $78fc
  0078e8  2014                 move.l    (a4), d0
  0078ea  2211                 move.l    (a1), d1
  0078ec  b380                 eor.l     d1, d0
  0078ee  c090                 and.l     (a0), d0
  0078f0  6702                 beq.b     $78f4
  0078f2  7400                 moveq     #$0, d2
  0078f4  588c                 addq.l    #$4, a4
  0078f6  5889                 addq.l    #$4, a1
  0078f8  5888                 addq.l    #$4, a0
  0078fa  5344                 subq.w    #$1, d4
  0078fc  4a44                 tst.w     d4
  0078fe  6706                 beq.b     $7906
  007900  0c020001             cmpi.b    #$1, d2
  007904  67e2                 beq.b     $78e8
  007906  1002                 move.b    d2, d0
  007908  4cdf1010             movem.l   (a7)+, d4/a4
  00790c  4e5e                 unlk      a6
  00790e  4e75                 rts       
  007910  4e56ffc0             link.w    a6, #$ffc0
  007914  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  007918  246e0008             movea.l   $8(a6), a2
  00791c  282e000c             move.l    $c(a6), d4
  007920  2c2e0010             move.l    $10(a6), d6
  007924  7a00                 moveq     #$0, d5
  007926  2044                 movea.l   d4, a0
  007928  26280024             move.l    $24(a0), d3
  00792c  26680028             movea.l   $28(a0), a3
  007930  2868002c             movea.l   $2c(a0), a4
  007934  102a001e             move.b    $1e(a2), d0
  007938  4880                 ext.w     d0
  00793a  02400010             andi.w    #$10, d0
  00793e  660a                 bne.b     $794a
  007940  4a2e0014             tst.b     $14(a6)
  007944  6700020c             beq.w     $7b52
  007948  6008                 bra.b     $7952
  00794a  4a2e0016             tst.b     $16(a6)
  00794e  67000202             beq.w     $7b52
  007952  7001                 moveq     #$1, d0
  007954  c083                 and.l     d3, d0
  007956  6752                 beq.b     $79aa
  007958  206a0012             movea.l   $12(a2), a0
  00795c  4a10                 tst.b     (a0)
  00795e  670001f2             beq.w     $7b52
  007962  206a0012             movea.l   $12(a2), a0
  007966  0c10003f             cmpi.b    #$3f, (a0)
  00796a  620001e6             bhi.w     $7b52
  00796e  206a0012             movea.l   $12(a2), a0
  007972  7000                 moveq     #$0, d0
  007974  1010                 move.b    (a0), d0
  007976  5240                 addq.w    #$1, d0
  007978  48c0                 ext.l     d0
  00797a  206a0012             movea.l   $12(a2), a0
  00797e  43eeffc0             lea.l     -$40(a6), a1
  007982  a22e                 _BlockMove 
  007984  486effc0             pea.l     -$40(a6)
  007988  1f3c0001             move.b    #$1, -(a7)
  00798c  4ead0388             jsr       $388(a5)
  007990  2f06                 move.l    d6, -(a7)
  007992  486effc0             pea.l     -$40(a6)
  007996  4ebafecc             jsr       $7864(pc)
  00799a  4a00                 tst.b     d0
  00799c  504f                 addq.w    #$8, a7
  00799e  670001b2             beq.w     $7b52
  0079a2  7001                 moveq     #$1, d0
  0079a4  b680                 cmp.l     d0, d3
  0079a6  670001a8             beq.w     $7b50
  0079aa  7002                 moveq     #$2, d0
  0079ac  c083                 and.l     d3, d0
  0079ae  6720                 beq.b     $79d0
  0079b0  554f                 subq.w    #$2, a7
  0079b2  2f2a0012             move.l    $12(a2), -(a7)
  0079b6  2f06                 move.l    d6, -(a7)
  0079b8  4227                 clr.b     -(a7)
  0079ba  1f3c0001             move.b    #$1, -(a7)
  0079be  4ead0380             jsr       $380(a5)
  0079c2  101f                 move.b    (a7)+, d0
  0079c4  6700018c             beq.w     $7b52
  0079c8  7002                 moveq     #$2, d0
  0079ca  b680                 cmp.l     d0, d3
  0079cc  67000182             beq.w     $7b50
  0079d0  2003                 move.l    d3, d0
  0079d2  028000002000         andi.l    #$2000, d0
  0079d8  6718                 beq.b     $79f2
  0079da  202a0064             move.l    $64(a2), d0
  0079de  b0ab0064             cmp.l     $64(a3), d0
  0079e2  6500016e             bcs.w     $7b52
  0079e6  202a0064             move.l    $64(a2), d0
  0079ea  b0ac0064             cmp.l     $64(a4), d0
  0079ee  62000162             bhi.w     $7b52
  0079f2  7004                 moveq     #$4, d0
  0079f4  c083                 and.l     d3, d0
  0079f6  671a                 beq.b     $7a12
  0079f8  102b001e             move.b    $1e(a3), d0
  0079fc  4880                 ext.w     d0
  0079fe  122a001e             move.b    $1e(a2), d1
  007a02  4881                 ext.w     d1
  007a04  b141                 eor.w     d0, d1
  007a06  102c001e             move.b    $1e(a4), d0
  007a0a  4880                 ext.w     d0
  007a0c  c041                 and.w     d1, d0
  007a0e  66000142             bne.w     $7b52
  007a12  7010                 moveq     #$10, d0
  007a14  c083                 and.l     d3, d0
  007a16  6718                 beq.b     $7a30
  007a18  302a0034             move.w    $34(a2), d0
  007a1c  b06b0034             cmp.w     $34(a3), d0
  007a20  65000130             bcs.w     $7b52
  007a24  302a0034             move.w    $34(a2), d0
  007a28  b06c0034             cmp.w     $34(a4), d0
  007a2c  62000124             bhi.w     $7b52
  007a30  7008                 moveq     #$8, d0
  007a32  c083                 and.l     d3, d0
  007a34  671e                 beq.b     $7a54
  007a36  3f3c0004             move.w    #$4, -(a7)
  007a3a  486c0020             pea.l     $20(a4)
  007a3e  486b0020             pea.l     $20(a3)
  007a42  486a0020             pea.l     $20(a2)
  007a46  4ebafe84             jsr       $78cc(pc)
  007a4a  4a00                 tst.b     d0
  007a4c  4fef000e             lea.l     $e(a7), a7
  007a50  67000100             beq.w     $7b52
  007a54  2003                 move.l    d3, d0
  007a56  028000001000         andi.l    #$1000, d0
  007a5c  671e                 beq.b     $7a7c
  007a5e  3f3c0004             move.w    #$4, -(a7)
  007a62  486c0054             pea.l     $54(a4)
  007a66  486b0054             pea.l     $54(a3)
  007a6a  486a0054             pea.l     $54(a2)
  007a6e  4ebafe5c             jsr       $78cc(pc)
  007a72  4a00                 tst.b     d0
  007a74  4fef000e             lea.l     $e(a7), a7
  007a78  670000d8             beq.w     $7b52
  007a7c  7020                 moveq     #$20, d0
  007a7e  c083                 and.l     d3, d0
  007a80  6718                 beq.b     $7a9a
  007a82  202a0036             move.l    $36(a2), d0
  007a86  b0ab0036             cmp.l     $36(a3), d0
  007a8a  650000c6             bcs.w     $7b52
  007a8e  202a0036             move.l    $36(a2), d0
  007a92  b0ac0036             cmp.l     $36(a4), d0
  007a96  620000ba             bhi.w     $7b52
  007a9a  7040                 moveq     #$40, d0
  007a9c  c083                 and.l     d3, d0
  007a9e  6718                 beq.b     $7ab8
  007aa0  202a003a             move.l    $3a(a2), d0
  007aa4  b0ab003a             cmp.l     $3a(a3), d0
  007aa8  650000a8             bcs.w     $7b52
  007aac  202a003a             move.l    $3a(a2), d0
  007ab0  b0ac003a             cmp.l     $3a(a4), d0
  007ab4  6200009c             bhi.w     $7b52
  007ab8  2003                 move.l    d3, d0
  007aba  028000000080         andi.l    #$80, d0
  007ac0  6716                 beq.b     $7ad8
  007ac2  202a0040             move.l    $40(a2), d0
  007ac6  b0ab0040             cmp.l     $40(a3), d0
  007aca  65000086             bcs.w     $7b52
  007ace  202a0040             move.l    $40(a2), d0
  007ad2  b0ac0040             cmp.l     $40(a4), d0
  007ad6  627a                 bhi.b     $7b52
  007ad8  2003                 move.l    d3, d0
  007ada  028000000100         andi.l    #$100, d0
  007ae0  6714                 beq.b     $7af6
  007ae2  202a0044             move.l    $44(a2), d0
  007ae6  b0ab0044             cmp.l     $44(a3), d0
  007aea  6566                 bcs.b     $7b52
  007aec  202a0044             move.l    $44(a2), d0
  007af0  b0ac0044             cmp.l     $44(a4), d0
  007af4  625c                 bhi.b     $7b52
  007af6  2003                 move.l    d3, d0
  007af8  028000000200         andi.l    #$200, d0
  007afe  6714                 beq.b     $7b14
  007b00  202a0048             move.l    $48(a2), d0
  007b04  b0ab0048             cmp.l     $48(a3), d0
  007b08  6548                 bcs.b     $7b52
  007b0a  202a0048             move.l    $48(a2), d0
  007b0e  b0ac0048             cmp.l     $48(a4), d0
  007b12  623e                 bhi.b     $7b52
  007b14  2003                 move.l    d3, d0
  007b16  028000000400         andi.l    #$400, d0
  007b1c  6714                 beq.b     $7b32
  007b1e  202a004c             move.l    $4c(a2), d0
  007b22  b0ab004c             cmp.l     $4c(a3), d0
  007b26  652a                 bcs.b     $7b52
  007b28  202a004c             move.l    $4c(a2), d0
  007b2c  b0ac004c             cmp.l     $4c(a4), d0
  007b30  6220                 bhi.b     $7b52
  007b32  2003                 move.l    d3, d0
  007b34  028000000800         andi.l    #$800, d0
  007b3a  6714                 beq.b     $7b50
  007b3c  202a0050             move.l    $50(a2), d0
  007b40  b0ab0050             cmp.l     $50(a3), d0
  007b44  650c                 bcs.b     $7b52
  007b46  202a0050             move.l    $50(a2), d0
  007b4a  b0ac0050             cmp.l     $50(a4), d0
  007b4e  6202                 bhi.b     $7b52
  007b50  7a01                 moveq     #$1, d5
  007b52  2003                 move.l    d3, d0
  007b54  028000004000         andi.l    #$4000, d0
  007b5a  670a                 beq.b     $7b66
  007b5c  1005                 move.b    d5, d0
  007b5e  57c0                 seq.b     d0
  007b60  4400                 neg.b     d0
  007b62  4880                 ext.w     d0
  007b64  1a00                 move.b    d0, d5
  007b66  4a05                 tst.b     d5
  007b68  676e                 beq.b     $7bd8
  007b6a  2044                 movea.l   d4, a0
  007b6c  20280020             move.l    $20(a0), d0
  007b70  7246                 moveq     #$46, d1
  007b72  4ead0cd8             jsr       $cd8(a5)
  007b76  22680018             movea.l   $18(a0), a1
  007b7a  33aa00160800         move.w    $16(a2), (a1, d0.l)
  007b80  20280020             move.l    $20(a0), d0
  007b84  7246                 moveq     #$46, d1
  007b86  4ead0cd8             jsr       $cd8(a5)
  007b8a  22680018             movea.l   $18(a0), a1
  007b8e  23aa00640802         move.l    $64(a2), $2(a1, d0.l)
  007b94  206a0012             movea.l   $12(a2), a0
  007b98  0c10003f             cmpi.b    #$3f, (a0)
  007b9c  6308                 bls.b     $7ba6
  007b9e  206a0012             movea.l   $12(a2), a0
  007ba2  10bc003f             move.b    #$3f, (a0)
  007ba6  206a0012             movea.l   $12(a2), a0
  007baa  7000                 moveq     #$0, d0
  007bac  1010                 move.b    (a0), d0
  007bae  5240                 addq.w    #$1, d0
  007bb0  48c0                 ext.l     d0
  007bb2  2f00                 move.l    d0, -(a7)
  007bb4  2044                 movea.l   d4, a0
  007bb6  20280020             move.l    $20(a0), d0
  007bba  7246                 moveq     #$46, d1
  007bbc  4ead0cd8             jsr       $cd8(a5)
  007bc0  2044                 movea.l   d4, a0
  007bc2  22680018             movea.l   $18(a0), a1
  007bc6  43f10806             lea.l     $6(a1, d0.l), a1
  007bca  201f                 move.l    (a7)+, d0
  007bcc  206a0012             movea.l   $12(a2), a0
  007bd0  a22e                 _BlockMove 
  007bd2  2044                 movea.l   d4, a0
  007bd4  52a80020             addq.l    #$1, $20(a0)
  007bd8  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  007bdc  4e5e                 unlk      a6
  007bde  4e75                 rts       
  007be0  4e560000             link.w    a6, #$0
  007be4  594f                 subq.w    #$4, a7
  007be6  2e89                 move.l    a1, (a7)
  007be8  205f                 movea.l   (a7)+, a0
  007bea  117c00010016         move.b    #$1, $16(a0)
  007bf0  4e5e                 unlk      a6
  007bf2  4e75                 rts       
  007bf4  4e56ff74             link.w    a6, #$ff74
  007bf8  2f03                 move.l    d3, -(a7)
  007bfa  262e000a             move.l    $a(a6), d3
  007bfe  422eff74             clr.b     -$8c(a6)
  007c02  41eeff74             lea.l     -$8c(a6), a0
  007c06  2d48ffa6             move.l    a0, -$5a(a6)
  007c0a  3d6e0008ffaa         move.w    $8(a6), -$56(a6)
  007c10  2d43ffc4             move.l    d3, -$3c(a6)
  007c14  3d7cffffffb0         move.w    #$ffff, -$50(a6)
  007c1a  41eeff94             lea.l     -$6c(a6), a0
  007c1e  7009                 moveq     #$9, d0
  007c20  a260                 _HFSDispatch 
  007c22  4a40                 tst.w     d0
  007c24  6606                 bne.b     $7c2c
  007c26  262effe0             move.l    -$20(a6), d3
  007c2a  6002                 bra.b     $7c2e
  007c2c  76ff                 moveq     #$ff, d3
  007c2e  2003                 move.l    d3, d0
  007c30  261f                 move.l    (a7)+, d3
  007c32  4e5e                 unlk      a6
  007c34  4e75                 rts       
  007c36  4e56feee             link.w    a6, #$feee
  007c3a  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  007c3e  266e000c             movea.l   $c(a6), a3
  007c42  2a2e0008             move.l    $8(a6), d5
  007c46  422eff90             clr.b     -$70(a6)
  007c4a  4aab0030             tst.l     $30(a3)
  007c4e  6718                 beq.b     $7c68
  007c50  41ed0190             lea.l     $190(a5), a0
  007c54  2d48ff80             move.l    a0, -$80(a6)
  007c58  41eeff7a             lea.l     -$86(a6), a0
  007c5c  a058                 _InsTime  
  007c5e  41eeff7a             lea.l     -$86(a6), a0
  007c62  202b0030             move.l    $30(a3), d0
  007c66  a05a                 _PrimeTime 
  007c68  486eff33             pea.l     -$cd(a6)
  007c6c  486eff38             pea.l     -$c8(a6)
  007c70  486eff39             pea.l     -$c7(a6)
  007c74  2f0b                 move.l    a3, -(a7)
  007c76  4ebafae0             jsr       $7758(pc)
  007c7a  3600                 move.w    d0, d3
  007c7c  4a43                 tst.w     d3
  007c7e  4fef0010             lea.l     $10(a7), a7
  007c82  660002fe             bne.w     $7f82
  007c86  42ab0020             clr.l     $20(a3)
  007c8a  4a2eff33             tst.b     -$cd(a6)
  007c8e  672a                 beq.b     $7cba
  007c90  206b0028             movea.l   $28(a3), a0
  007c94  20680012             movea.l   $12(a0), a0
  007c98  7000                 moveq     #$0, d0
  007c9a  1010                 move.b    (a0), d0
  007c9c  5240                 addq.w    #$1, d0
  007c9e  48c0                 ext.l     d0
  007ca0  206b0028             movea.l   $28(a3), a0
  007ca4  20680012             movea.l   $12(a0), a0
  007ca8  43eeff3a             lea.l     -$c6(a6), a1
  007cac  a22e                 _BlockMove 
  007cae  486eff3a             pea.l     -$c6(a6)
  007cb2  1f3c0001             move.b    #$1, -(a7)
  007cb6  4ead0388             jsr       $388(a5)
  007cba  244b                 movea.l   a3, a2
  007cbc  45ea0034             lea.l     $34(a2), a2
  007cc0  4aadf340             tst.l     -$cc0(a5)
  007cc4  660c                 bne.b     $7cd2
  007cc6  203c000000c8         move.l    #$c8, d0
  007ccc  a122                 _NewHandle 
  007cce  2b48f340             move.l    a0, -$cc0(a5)
  007cd2  4aadf340             tst.l     -$cc0(a5)
  007cd6  670002a8             beq.w     $7f80
  007cda  594f                 subq.w    #$4, a7
  007cdc  2f2df340             move.l    -$cc0(a5), -(a7)
  007ce0  4ead0370             jsr       $370(a5)
  007ce4  201f                 move.l    (a7)+, d0
  007ce6  2b40f33c             move.l    d0, -$cc4(a5)
  007cea  4a92                 tst.l     (a2)
  007cec  6628                 bne.b     $7d16
  007cee  2f0a                 move.l    a2, -(a7)
  007cf0  486eff92             pea.l     -$6e(a6)
  007cf4  3f2b0016             move.w    $16(a3), -(a7)
  007cf8  2f2b0012             move.l    $12(a3), -(a7)
  007cfc  4ebaf9ac             jsr       $76aa(pc)
  007d00  3600                 move.w    d0, d3
  007d02  4a43                 tst.w     d3
  007d04  4fef000e             lea.l     $e(a7), a7
  007d08  6600008e             bne.w     $7d98
  007d0c  426a0004             clr.w     $4(a2)
  007d10  78ff                 moveq     #$ff, d4
  007d12  60000084             bra.w     $7d98
  007d16  486eff34             pea.l     -$cc(a6)
  007d1a  486eff92             pea.l     -$6e(a6)
  007d1e  3f2b0016             move.w    $16(a3), -(a7)
  007d22  2f2b0012             move.l    $12(a3), -(a7)
  007d26  4ebaf982             jsr       $76aa(pc)
  007d2a  3600                 move.w    d0, d3
  007d2c  4a43                 tst.w     d3
  007d2e  4fef000e             lea.l     $e(a7), a7
  007d32  6664                 bne.b     $7d98
  007d34  2012                 move.l    (a2), d0
  007d36  b0aeff34             cmp.l     -$cc(a6), d0
  007d3a  6658                 bne.b     $7d94
  007d3c  4a6a0004             tst.w     $4(a2)
  007d40  674e                 beq.b     $7d90
  007d42  536a0004             subq.w    #$1, $4(a2)
  007d46  7000                 moveq     #$0, d0
  007d48  302a0004             move.w    $4(a2), d0
  007d4c  720a                 moveq     #$a, d1
  007d4e  4ead0cd8             jsr       $cd8(a5)
  007d52  206df340             movea.l   -$cc0(a5), a0
  007d56  2050                 movea.l   (a0), a0
  007d58  d1c0                 adda.l    d0, a0
  007d5a  2848                 movea.l   a0, a4
  007d5c  2a2c0004             move.l    $4(a4), d5
  007d60  382c0008             move.w    $8(a4), d4
  007d64  2f05                 move.l    d5, -(a7)
  007d66  3f2eff92             move.w    -$6e(a6), -(a7)
  007d6a  4ebafe88             jsr       $7bf4(pc)
  007d6e  2c00                 move.l    d0, d6
  007d70  7000                 moveq     #$0, d0
  007d72  302a0004             move.w    $4(a2), d0
  007d76  720a                 moveq     #$a, d1
  007d78  4ead0cd8             jsr       $cd8(a5)
  007d7c  206df340             movea.l   -$cc0(a5), a0
  007d80  2250                 movea.l   (a0), a1
  007d82  bcb10800             cmp.l     (a1, d0.l), d6
  007d86  5c4f                 addq.w    #$6, a7
  007d88  670e                 beq.b     $7d98
  007d8a  363cfae8             move.w    #$fae8, d3
  007d8e  6008                 bra.b     $7d98
  007d90  76ce                 moveq     #$ce, d3
  007d92  6004                 bra.b     $7d98
  007d94  363cfae8             move.w    #$fae8, d3
  007d98  4a43                 tst.w     d3
  007d9a  660001e6             bne.w     $7f82
  007d9e  41eefef2             lea.l     -$10e(a6), a0
  007da2  2d48ffa6             move.l    a0, -$5a(a6)
  007da6  3d6eff92ffaa         move.w    -$6e(a6), -$56(a6)
  007dac  3d44ffb0             move.w    d4, -$50(a6)
  007db0  2d45ffc4             move.l    d5, -$3c(a6)
  007db4  41eeff94             lea.l     -$6c(a6), a0
  007db8  7009                 moveq     #$9, d0
  007dba  a260                 _HFSDispatch 
  007dbc  3600                 move.w    d0, d3
  007dbe  0c44ffff             cmpi.w    #$ffff, d4
  007dc2  6700010e             beq.w     $7ed2
  007dc6  4a43                 tst.w     d3
  007dc8  660000aa             bne.w     $7e74
  007dcc  1f2eff38             move.b    -$c8(a6), -(a7)
  007dd0  1f2eff39             move.b    -$c7(a6), -(a7)
  007dd4  486eff3a             pea.l     -$c6(a6)
  007dd8  2f0b                 move.l    a3, -(a7)
  007dda  486eff94             pea.l     -$6c(a6)
  007dde  4ebafb30             jsr       $7910(pc)
  007de2  5244                 addq.w    #$1, d4
  007de4  102effb2             move.b    -$4e(a6), d0
  007de8  4880                 ext.w     d0
  007dea  02400010             andi.w    #$10, d0
  007dee  4fef0010             lea.l     $10(a7), a7
  007df2  670000fe             beq.w     $7ef2
  007df6  486df33c             pea.l     -$cc4(a5)
  007dfa  2f2df340             move.l    -$cc0(a5), -(a7)
  007dfe  3f2a0004             move.w    $4(a2), -(a7)
  007e02  4ebaf8f8             jsr       $76fc(pc)
  007e06  3600                 move.w    d0, d3
  007e08  4a43                 tst.w     d3
  007e0a  4fef000a             lea.l     $a(a7), a7
  007e0e  660000e2             bne.w     $7ef2
  007e12  7000                 moveq     #$0, d0
  007e14  302a0004             move.w    $4(a2), d0
  007e18  720a                 moveq     #$a, d1
  007e1a  4ead0cd8             jsr       $cd8(a5)
  007e1e  206df340             movea.l   -$cc0(a5), a0
  007e22  2250                 movea.l   (a0), a1
  007e24  23850804             move.l    d5, $4(a1, d0.l)
  007e28  7000                 moveq     #$0, d0
  007e2a  302a0004             move.w    $4(a2), d0
  007e2e  720a                 moveq     #$a, d1
  007e30  4ead0cd8             jsr       $cd8(a5)
  007e34  206df340             movea.l   -$cc0(a5), a0
  007e38  2250                 movea.l   (a0), a1
  007e3a  33840808             move.w    d4, $8(a1, d0.l)
  007e3e  2f05                 move.l    d5, -(a7)
  007e40  3f2eff92             move.w    -$6e(a6), -(a7)
  007e44  4ebafdae             jsr       $7bf4(pc)
  007e48  7200                 moveq     #$0, d1
  007e4a  322a0004             move.w    $4(a2), d1
  007e4e  2d40feee             move.l    d0, -$112(a6)
  007e52  700a                 moveq     #$a, d0
  007e54  4ead0cd8             jsr       $cd8(a5)
  007e58  206df340             movea.l   -$cc0(a5), a0
  007e5c  2250                 movea.l   (a0), a1
  007e5e  23aefeee0800         move.l    -$112(a6), (a1, d0.l)
  007e64  526a0004             addq.w    #$1, $4(a2)
  007e68  2a2effc4             move.l    -$3c(a6), d5
  007e6c  7801                 moveq     #$1, d4
  007e6e  5c4f                 addq.w    #$6, a7
  007e70  60000080             bra.w     $7ef2
  007e74  4a6a0004             tst.w     $4(a2)
  007e78  6754                 beq.b     $7ece
  007e7a  536a0004             subq.w    #$1, $4(a2)
  007e7e  7000                 moveq     #$0, d0
  007e80  302a0004             move.w    $4(a2), d0
  007e84  720a                 moveq     #$a, d1
  007e86  4ead0cd8             jsr       $cd8(a5)
  007e8a  206df340             movea.l   -$cc0(a5), a0
  007e8e  2050                 movea.l   (a0), a0
  007e90  d1c0                 adda.l    d0, a0
  007e92  2e08                 move.l    a0, d7
  007e94  2047                 movea.l   d7, a0
  007e96  2a280004             move.l    $4(a0), d5
  007e9a  38280008             move.w    $8(a0), d4
  007e9e  2f05                 move.l    d5, -(a7)
  007ea0  3f2eff92             move.w    -$6e(a6), -(a7)
  007ea4  4ebafd4e             jsr       $7bf4(pc)
  007ea8  2c00                 move.l    d0, d6
  007eaa  7000                 moveq     #$0, d0
  007eac  302a0004             move.w    $4(a2), d0
  007eb0  720a                 moveq     #$a, d1
  007eb2  4ead0cd8             jsr       $cd8(a5)
  007eb6  206df340             movea.l   -$cc0(a5), a0
  007eba  2250                 movea.l   (a0), a1
  007ebc  bcb10800             cmp.l     (a1, d0.l), d6
  007ec0  5c4f                 addq.w    #$6, a7
  007ec2  6706                 beq.b     $7eca
  007ec4  363cfae8             move.w    #$fae8, d3
  007ec8  6028                 bra.b     $7ef2
  007eca  7600                 moveq     #$0, d3
  007ecc  6024                 bra.b     $7ef2
  007ece  76d9                 moveq     #$d9, d3
  007ed0  6020                 bra.b     $7ef2
  007ed2  4a43                 tst.w     d3
  007ed4  661c                 bne.b     $7ef2
  007ed6  1f2eff38             move.b    -$c8(a6), -(a7)
  007eda  1f2eff39             move.b    -$c7(a6), -(a7)
  007ede  486eff3a             pea.l     -$c6(a6)
  007ee2  2f0b                 move.l    a3, -(a7)
  007ee4  486eff94             pea.l     -$6c(a6)
  007ee8  4ebafa26             jsr       $7910(pc)
  007eec  7801                 moveq     #$1, d4
  007eee  4fef0010             lea.l     $10(a7), a7
  007ef2  4a2eff90             tst.b     -$70(a6)
  007ef6  6610                 bne.b     $7f08
  007ef8  4a43                 tst.w     d3
  007efa  660c                 bne.b     $7f08
  007efc  202b001c             move.l    $1c(a3), d0
  007f00  b0ab0020             cmp.l     $20(a3), d0
  007f04  6e00fea6             bgt.w     $7dac
  007f08  4a43                 tst.w     d3
  007f0a  6676                 bne.b     $7f82
  007f0c  486df33c             pea.l     -$cc4(a5)
  007f10  2f2df340             move.l    -$cc0(a5), -(a7)
  007f14  3f2a0004             move.w    $4(a2), -(a7)
  007f18  4ebaf7e2             jsr       $76fc(pc)
  007f1c  3600                 move.w    d0, d3
  007f1e  4a43                 tst.w     d3
  007f20  4fef000a             lea.l     $a(a7), a7
  007f24  665c                 bne.b     $7f82
  007f26  7000                 moveq     #$0, d0
  007f28  302a0004             move.w    $4(a2), d0
  007f2c  720a                 moveq     #$a, d1
  007f2e  4ead0cd8             jsr       $cd8(a5)
  007f32  206df340             movea.l   -$cc0(a5), a0
  007f36  2250                 movea.l   (a0), a1
  007f38  23850804             move.l    d5, $4(a1, d0.l)
  007f3c  7000                 moveq     #$0, d0
  007f3e  302a0004             move.w    $4(a2), d0
  007f42  720a                 moveq     #$a, d1
  007f44  4ead0cd8             jsr       $cd8(a5)
  007f48  206df340             movea.l   -$cc0(a5), a0
  007f4c  2250                 movea.l   (a0), a1
  007f4e  33840808             move.w    d4, $8(a1, d0.l)
  007f52  2f05                 move.l    d5, -(a7)
  007f54  3f2eff92             move.w    -$6e(a6), -(a7)
  007f58  4ebafc9a             jsr       $7bf4(pc)
  007f5c  7200                 moveq     #$0, d1
  007f5e  322a0004             move.w    $4(a2), d1
  007f62  2d40feee             move.l    d0, -$112(a6)
  007f66  700a                 moveq     #$a, d0
  007f68  4ead0cd8             jsr       $cd8(a5)
  007f6c  206df340             movea.l   -$cc0(a5), a0
  007f70  2250                 movea.l   (a0), a1
  007f72  23aefeee0800         move.l    -$112(a6), (a1, d0.l)
  007f78  526a0004             addq.w    #$1, $4(a2)
  007f7c  5c4f                 addq.w    #$6, a7
  007f7e  6002                 bra.b     $7f82
  007f80  7694                 moveq     #$94, d3
  007f82  4aab0030             tst.l     $30(a3)
  007f86  6706                 beq.b     $7f8e
  007f88  41eeff7a             lea.l     -$86(a6), a0
  007f8c  a059                 _RmvTime  
  007f8e  3f430142             move.w    d3, $142(a7)
  007f92  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  007f96  4e5e                 unlk      a6
  007f98  205f                 movea.l   (a7)+, a0
  007f9a  504f                 addq.w    #$8, a7
  007f9c  4ed0                 jmp       (a0)
  007f9e  4e56ffe4             link.w    a6, #$ffe4
  007fa2  48e71820             movem.l   d3-d4/a2, -(a7)
  007fa6  246e0008             movea.l   $8(a6), a2
  007faa  7600                 moveq     #$0, d3
  007fac  4a2df33b             tst.b     -$cc5(a5)
  007fb0  662c                 bne.b     $7fde
  007fb2  1b7c0001f33b         move.b    #$1, -$cc5(a5)
  007fb8  554f                 subq.w    #$2, a7
  007fba  2f3c66732020         move.l    #$66732020, -(a7)
  007fc0  486efffc             pea.l     -$4(a6)
  007fc4  4ead0368             jsr       $368(a5)
  007fc8  301f                 move.w    (a7)+, d0
  007fca  6612                 bne.b     $7fde
  007fcc  7001                 moveq     #$1, d0
  007fce  c0aefffc             and.l     -$4(a6), d0
  007fd2  4a80                 tst.l     d0
  007fd4  56c0                 sne.b     d0
  007fd6  4400                 neg.b     d0
  007fd8  4880                 ext.w     d0
  007fda  1b40f33a             move.b    d0, -$cc6(a5)
  007fde  7800                 moveq     #$0, d4
  007fe0  4a2df33a             tst.b     -$cc6(a5)
  007fe4  6738                 beq.b     $801e
  007fe6  7014                 moveq     #$14, d0
  007fe8  2d40ffe4             move.l    d0, -$1c(a6)
  007fec  554f                 subq.w    #$2, a7
  007fee  2f2a0012             move.l    $12(a2), -(a7)
  007ff2  3f2a0016             move.w    $16(a2), -(a7)
  007ff6  486effe8             pea.l     -$18(a6)
  007ffa  486effe4             pea.l     -$1c(a6)
  007ffe  4ebaf54e             jsr       $754e(pc)
  008002  301f                 move.w    (a7)+, d0
  008004  3600                 move.w    d0, d3
  008006  4a43                 tst.w     d3
  008008  6614                 bne.b     $801e
  00800a  202effea             move.l    -$16(a6), d0
  00800e  028000000080         andi.l    #$80, d0
  008014  4a80                 tst.l     d0
  008016  56c0                 sne.b     d0
  008018  4400                 neg.b     d0
  00801a  4880                 ext.w     d0
  00801c  1800                 move.b    d0, d4
  00801e  4a43                 tst.w     d3
  008020  6706                 beq.b     $8028
  008022  0c43ffce             cmpi.w    #$ffce, d3
  008026  661e                 bne.b     $8046
  008028  4a04                 tst.b     d4
  00802a  670a                 beq.b     $8036
  00802c  204a                 movea.l   a2, a0
  00802e  7018                 moveq     #$18, d0
  008030  a260                 _HFSDispatch 
  008032  3600                 move.w    d0, d3
  008034  6010                 bra.b     $8046
  008036  554f                 subq.w    #$2, a7
  008038  2f0a                 move.l    a2, -(a7)
  00803a  48780002             pea.l     $2.w
  00803e  4ebafbf6             jsr       $7c36(pc)
  008042  301f                 move.w    (a7)+, d0
  008044  3600                 move.w    d0, d3
  008046  3f430034             move.w    d3, $34(a7)
  00804a  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00804e  4e5e                 unlk      a6
  008050  2e9f                 move.l    (a7)+, (a7)
  008052  4e75                 rts       
  008054  4e56feae             link.w    a6, #$feae
  008058  2f03                 move.l    d3, -(a7)
  00805a  554f                 subq.w    #$2, a7
  00805c  2f2e001e             move.l    $1e(a6), -(a7)
  008060  3f2e001c             move.w    $1c(a6), -(a7)
  008064  486e001c             pea.l     $1c(a6)
  008068  4ebaf60c             jsr       $7676(pc)
  00806c  301f                 move.w    (a7)+, d0
  00806e  3600                 move.w    d0, d3
  008070  4a43                 tst.w     d3
  008072  6708                 beq.b     $807c
  008074  3f430178             move.w    d3, $178(a7)
  008078  600000ea             bra.w     $8164
  00807c  42aeff98             clr.l     -$68(a6)
  008080  3d6e001cff9c         move.w    $1c(a6), -$64(a6)
  008086  2d6e0014ff9e         move.l    $14(a6), -$62(a6)
  00808c  2d6e0010ffa2         move.l    $10(a6), -$5e(a6)
  008092  4a2e0008             tst.b     $8(a6)
  008096  6704                 beq.b     $809c
  008098  7005                 moveq     #$5, d0
  00809a  6002                 bra.b     $809e
  00809c  7006                 moveq     #$6, d0
  00809e  7200                 moveq     #$0, d1
  0080a0  3200                 move.w    d0, d1
  0080a2  2d41ffaa             move.l    d1, -$56(a6)
  0080a6  41eeff1a             lea.l     -$e6(a6), a0
  0080aa  2d48ffae             move.l    a0, -$52(a6)
  0080ae  41eefeae             lea.l     -$152(a6), a0
  0080b2  2d48ffb2             move.l    a0, -$4e(a6)
  0080b6  42aeffb6             clr.l     -$4a(a6)
  0080ba  4a2e000a             tst.b     $a(a6)
  0080be  660a                 bne.b     $80ca
  0080c0  302df328             move.w    -$cd8(a5), d0
  0080c4  b06e001c             cmp.w     $1c(a6), d0
  0080c8  6704                 beq.b     $80ce
  0080ca  42adf32a             clr.l     -$cd6(a5)
  0080ce  41edf32a             lea.l     -$cd6(a5), a0
  0080d2  43eeffba             lea.l     -$46(a6), a1
  0080d6  22d8                 move.l    (a0)+, (a1)+
  0080d8  22d8                 move.l    (a0)+, (a1)+
  0080da  22d8                 move.l    (a0)+, (a1)+
  0080dc  22d8                 move.l    (a0)+, (a1)+
  0080de  594f                 subq.w    #$4, a7
  0080e0  48784000             pea.l     $4000.w
  0080e4  486effce             pea.l     -$32(a6)
  0080e8  4ebaf4a6             jsr       $7590(pc)
  0080ec  205f                 movea.l   (a7)+, a0
  0080ee  2d48ffca             move.l    a0, -$36(a6)
  0080f2  2d6e0018ff2c         move.l    $18(a6), -$d4(a6)
  0080f8  42aefec0             clr.l     -$140(a6)
  0080fc  422eff38             clr.b     -$c8(a6)
  008100  1d7c0010fecc         move.b    #$10, -$134(a6)
  008106  554f                 subq.w    #$2, a7
  008108  486eff86             pea.l     -$7a(a6)
  00810c  4ebafe90             jsr       $7f9e(pc)
  008110  301f                 move.w    (a7)+, d0
  008112  3600                 move.w    d0, d3
  008114  4a43                 tst.w     d3
  008116  6706                 beq.b     $811e
  008118  0c43ffd9             cmpi.w    #$ffd9, d3
  00811c  660a                 bne.b     $8128
  00811e  206e000c             movea.l   $c(a6), a0
  008122  20aeffa6             move.l    -$5a(a6), (a0)
  008126  6006                 bra.b     $812e
  008128  206e000c             movea.l   $c(a6), a0
  00812c  4290                 clr.l     (a0)
  00812e  4a43                 tst.w     d3
  008130  6706                 beq.b     $8138
  008132  0c43fae8             cmpi.w    #$fae8, d3
  008136  6618                 bne.b     $8150
  008138  41eeffba             lea.l     -$46(a6), a0
  00813c  43edf32a             lea.l     -$cd6(a5), a1
  008140  22d8                 move.l    (a0)+, (a1)+
  008142  22d8                 move.l    (a0)+, (a1)+
  008144  22d8                 move.l    (a0)+, (a1)+
  008146  22d8                 move.l    (a0)+, (a1)+
  008148  3b6e001cf328         move.w    $1c(a6), -$cd8(a5)
  00814e  6004                 bra.b     $8154
  008150  42adf32a             clr.l     -$cd6(a5)
  008154  4aaeffca             tst.l     -$36(a6)
  008158  6706                 beq.b     $8160
  00815a  206effca             movea.l   -$36(a6), a0
  00815e  a01f                 _DisposePtr 
  008160  3f430178             move.w    d3, $178(a7)
  008164  261f                 move.l    (a7)+, d3
  008166  4e5e                 unlk      a6
  008168  205f                 movea.l   (a7)+, a0
  00816a  4fef001a             lea.l     $1a(a7), a7
  00816e  4ed0                 jmp       (a0)
  008170  4e560000             link.w    a6, #$0
  008174  226e0008             movea.l   $8(a6), a1
  008178  91c8                 suba.l    a0, a0
  00817a  7200                 moveq     #$0, d1
  00817c  2009                 move.l    a1, d0
  00817e  6708                 beq.b     $8188
  008180  2049                 movea.l   a1, a0
  008182  216e000c0006         move.l    $c(a6), $6(a0)
  008188  3001                 move.w    d1, d0
  00818a  4e5e                 unlk      a6
  00818c  4e75                 rts       
  00818e  48e71c00             movem.l   d3-d5, -(a7)
  008192  5d4f                 subq.w    #$6, a7
  008194  182f0018             move.b    $18(a7), d4
  008198  2a2f001a             move.l    $1a(a7), d5
  00819c  7600                 moveq     #$0, d3
  00819e  4a2df6cf             tst.b     -$931(a5)
  0081a2  670c                 beq.b     $81b0
  0081a4  303cfc17             move.w    #$fc17, d0
  0081a8  5c4f                 addq.w    #$6, a7
  0081aa  4cdf0038             movem.l   (a7)+, d3-d5
  0081ae  4e75                 rts       
  0081b0  554f                 subq.w    #$2, a7
  0081b2  2f3c736e6420         move.l    #$736e6420, -(a7)
  0081b8  486f0008             pea.l     $8(a7)
  0081bc  4eb900000368         jsr       $368.l   ; seg4+494
  0081c2  301f                 move.w    (a7)+, d0
  0081c4  6708                 beq.b     $81ce
  0081c6  363cfaec             move.w    #$faec, d3
  0081ca  6000017a             bra.w     $8346
  0081ce  2b45f39e             move.l    d5, -$c62(a5)
  0081d2  61ff00000e32         bsr.l     $9006
  0081d8  4a00                 tst.b     d0
  0081da  6718                 beq.b     $81f4
  0081dc  4a85                 tst.l     d5
  0081de  6614                 bne.b     $81f4
  0081e0  2b7c56ee8ba3f39e     move.l    #$56ee8ba3, -$c62(a5)
  0081e8  486df39e             pea.l     -$c62(a5)
  0081ec  61ff00000d8a         bsr.l     $8f78
  0081f2  584f                 addq.w    #$4, a7
  0081f4  7001                 moveq     #$1, d0
  0081f6  c0af0002             and.l     $2(a7), d0
  0081fa  6602                 bne.b     $81fe
  0081fc  7800                 moveq     #$0, d4
  0081fe  1b44f379             move.b    d4, -$c87(a5)
  008202  4a04                 tst.b     d4
  008204  670c                 beq.b     $8212
  008206  383c00c0             move.w    #$c0, d4
  00820a  3b7c0002f6ca         move.w    #$2, -$936(a5)
  008210  600a                 bra.b     $821c
  008212  383c0080             move.w    #$80, d4
  008216  3b7c0001f6ca         move.w    #$1, -$936(a5)
  00821c  7000                 moveq     #$0, d0
  00821e  302f0016             move.w    $16(a7), d0
  008222  2b40f6c6             move.l    d0, -$93a(a5)
  008226  7010                 moveq     #$10, d0
  008228  b0adf6c6             cmp.l     -$93a(a5), d0
  00822c  6c06                 bge.b     $8234
  00822e  7010                 moveq     #$10, d0
  008230  2b40f6c6             move.l    d0, -$93a(a5)
  008234  61ff00000b62         bsr.l     $8d98
  00823a  3b6df6caf382         move.w    -$936(a5), -$c7e(a5)
  008240  3b7c0008f384         move.w    #$8, -$c7c(a5)
  008246  426df386             clr.w     -$c7a(a5)
  00824a  426df388             clr.w     -$c78(a5)
  00824e  2b6df39ef38a         move.l    -$c62(a5), -$c76(a5)
  008254  61ff00000be0         bsr.l     $8e36
  00825a  2b48f38e             move.l    a0, -$c72(a5)
  00825e  4aadf38e             tst.l     -$c72(a5)
  008262  6608                 bne.b     $826c
  008264  363cfc18             move.w    #$fc18, d3
  008268  600000dc             bra.w     $8346
  00826c  61ff00000bc8         bsr.l     $8e36
  008272  2b48f392             move.l    a0, -$c6e(a5)
  008276  4aadf38e             tst.l     -$c72(a5)
  00827a  660e                 bne.b     $828a
  00827c  206df38e             movea.l   -$c72(a5), a0
  008280  a01f                 _DisposePtr 
  008282  363cfc18             move.w    #$fc18, d3
  008286  600000be             bra.w     $8346
  00828a  41f9000001e0         lea.l     $1e0.l, a0   ; seg7+8b38
  008290  2b48f396             move.l    a0, -$c6a(a5)
  008294  61ff00000bf8         bsr.l     $8e8e
  00829a  2b48f37e             move.l    a0, -$c82(a5)
  00829e  554f                 subq.w    #$2, a7
  0082a0  486df37e             pea.l     -$c82(a5)
  0082a4  3f3c0005             move.w    #$5, -(a7)
  0082a8  3044                 movea.w   d4, a0
  0082aa  2f08                 move.l    a0, -(a7)
  0082ac  42a7                 clr.l     -(a7)
  0082ae  a807                 _SndNewChannel 
  0082b0  301f                 move.w    (a7)+, d0
  0082b2  6714                 beq.b     $82c8
  0082b4  206df38e             movea.l   -$c72(a5), a0
  0082b8  a01f                 _DisposePtr 
  0082ba  206df392             movea.l   -$c6e(a5), a0
  0082be  a01f                 _DisposePtr 
  0082c0  363cfc18             move.w    #$fc18, d3
  0082c4  60000080             bra.w     $8346
  0082c8  554f                 subq.w    #$2, a7
  0082ca  2f2df37e             move.l    -$c82(a5), -(a7)
  0082ce  486df382             pea.l     -$c7e(a5)
  0082d2  203c04200008         move.l    #$4200008, d0
  0082d8  a800                 _SoundDispatch 
  0082da  301f                 move.w    (a7)+, d0
  0082dc  6722                 beq.b     $8300
  0082de  206df38e             movea.l   -$c72(a5), a0
  0082e2  a01f                 _DisposePtr 
  0082e4  206df392             movea.l   -$c6e(a5), a0
  0082e8  a01f                 _DisposePtr 
  0082ea  554f                 subq.w    #$2, a7
  0082ec  2f2df37e             move.l    -$c82(a5), -(a7)
  0082f0  1f3c0001             move.b    #$1, -(a7)
  0082f4  a801                 _SndDisposeChannel 
  0082f6  301f                 move.w    (a7)+, d0
  0082f8  3600                 move.w    d0, d3
  0082fa  363cfc18             move.w    #$fc18, d3
  0082fe  6046                 bra.b     $8346
  008300  1b7c0001f6cf         move.b    #$1, -$931(a5)
  008306  42a7                 clr.l     -(a7)
  008308  61ff00000350         bsr.l     $865a
  00830e  4a2df378             tst.b     -$c88(a5)
  008312  584f                 addq.w    #$4, a7
  008314  6712                 beq.b     $8328
  008316  554f                 subq.w    #$2, a7
  008318  486df39a             pea.l     -$c66(a5)
  00831c  203c022c0018         move.l    #$22c0018, d0
  008322  a800                 _SoundDispatch 
  008324  301f                 move.w    (a7)+, d0
  008326  600e                 bra.b     $8336
  008328  41d7                 lea.l     (a7), a0
  00832a  4218                 clr.b     (a0)+
  00832c  10b80260             move.b    $260.w, (a0)
  008330  3057                 movea.w   (a7), a0
  008332  2b48f39a             move.l    a0, -$c66(a5)
  008336  61ff000000c4         bsr.l     $83fc
  00833c  3f00                 move.w    d0, -(a7)
  00833e  61ff00000068         bsr.l     $83a8
  008344  544f                 addq.w    #$2, a7
  008346  3003                 move.w    d3, d0
  008348  5c4f                 addq.w    #$6, a7
  00834a  4cdf0038             movem.l   (a7)+, d3-d5
  00834e  4e75                 rts       
  008350  554f                 subq.w    #$2, a7
  008352  4a2df6cf             tst.b     -$931(a5)
  008356  674c                 beq.b     $83a4
  008358  42a7                 clr.l     -(a7)
  00835a  61ff000002fe         bsr.l     $865a
  008360  4a2df378             tst.b     -$c88(a5)
  008364  584f                 addq.w    #$4, a7
  008366  6712                 beq.b     $837a
  008368  554f                 subq.w    #$2, a7
  00836a  2f2df39a             move.l    -$c66(a5), -(a7)
  00836e  203c02300018         move.l    #$2300018, d0
  008374  a800                 _SoundDispatch 
  008376  301f                 move.w    (a7)+, d0
  008378  600a                 bra.b     $8384
  00837a  3f2df39c             move.w    -$c64(a5), -(a7)
  00837e  4eb9000003c0         jsr       $3c0.l   ; seg4+7e6
  008384  554f                 subq.w    #$2, a7
  008386  2f2df37e             move.l    -$c82(a5), -(a7)
  00838a  1f3c0001             move.b    #$1, -(a7)
  00838e  a801                 _SndDisposeChannel 
  008390  301f                 move.w    (a7)+, d0
  008392  3e80                 move.w    d0, (a7)
  008394  206df38e             movea.l   -$c72(a5), a0
  008398  a01f                 _DisposePtr 
  00839a  206df392             movea.l   -$c6e(a5), a0
  00839e  a01f                 _DisposePtr 
  0083a0  422df6cf             clr.b     -$931(a5)
  0083a4  544f                 addq.w    #$2, a7
  0083a6  4e75                 rts       
  0083a8  48e71800             movem.l   d3-d4, -(a7)
  0083ac  362f000c             move.w    $c(a7), d3
  0083b0  4a2df6cf             tst.b     -$931(a5)
  0083b4  6740                 beq.b     $83f6
  0083b6  0c430100             cmpi.w    #$100, d3
  0083ba  6304                 bls.b     $83c0
  0083bc  363c0100             move.w    #$100, d3
  0083c0  3b43f6cc             move.w    d3, -$934(a5)
  0083c4  3003                 move.w    d3, d0
  0083c6  7810                 moveq     #$10, d4
  0083c8  e968                 lsl.w     d4, d0
  0083ca  d043                 add.w     d3, d0
  0083cc  7800                 moveq     #$0, d4
  0083ce  3800                 move.w    d0, d4
  0083d0  4a2df378             tst.b     -$c88(a5)
  0083d4  6710                 beq.b     $83e6
  0083d6  554f                 subq.w    #$2, a7
  0083d8  2f04                 move.l    d4, -(a7)
  0083da  203c02300018         move.l    #$2300018, d0
  0083e0  a800                 _SoundDispatch 
  0083e2  301f                 move.w    (a7)+, d0
  0083e4  6010                 bra.b     $83f6
  0083e6  7800                 moveq     #$0, d4
  0083e8  3803                 move.w    d3, d4
  0083ea  88fc0007             divu.w    #$7, d4
  0083ee  3f04                 move.w    d4, -(a7)
  0083f0  4eb9000003c0         jsr       $3c0.l   ; seg4+7e6
  0083f6  4cdf0018             movem.l   (a7)+, d3-d4
  0083fa  4e75                 rts       
  0083fc  2f03                 move.l    d3, -(a7)
  0083fe  594f                 subq.w    #$4, a7
  008400  7600                 moveq     #$0, d3
  008402  4a2df6cf             tst.b     -$931(a5)
  008406  6746                 beq.b     $844e
  008408  4a2df378             tst.b     -$c88(a5)
  00840c  6734                 beq.b     $8442
  00840e  202df39a             move.l    -$c66(a5), d0
  008412  02800000ffff         andi.l    #$ffff, d0
  008418  222df39a             move.l    -$c66(a5), d1
  00841c  7410                 moveq     #$10, d2
  00841e  e4a1                 asr.l     d2, d1
  008420  d280                 add.l     d0, d1
  008422  2001                 move.l    d1, d0
  008424  e088                 lsr.l     #$8, d0
  008426  e088                 lsr.l     #$8, d0
  008428  e088                 lsr.l     #$8, d0
  00842a  ee88                 lsr.l     #$7, d0
  00842c  d081                 add.l     d1, d0
  00842e  e280                 asr.l     #$1, d0
  008430  2e80                 move.l    d0, (a7)
  008432  362f0002             move.w    $2(a7), d3
  008436  0c430100             cmpi.w    #$100, d3
  00843a  6304                 bls.b     $8440
  00843c  363c0100             move.w    #$100, d3
  008440  600c                 bra.b     $844e
  008442  362df39c             move.w    -$c64(a5), d3
  008446  0c430007             cmpi.w    #$7, d3
  00844a  6302                 bls.b     $844e
  00844c  7607                 moveq     #$7, d3
  00844e  3003                 move.w    d3, d0
  008450  584f                 addq.w    #$4, a7
  008452  261f                 move.l    (a7)+, d3
  008454  4e75                 rts       
  008456  48e71f3a             movem.l   d3-d7/a2-a4/a6, -(a7)
  00845a  4feffff4             lea.l     -$c(a7), a7
  00845e  246f0034             movea.l   $34(a7), a2
  008462  7a00                 moveq     #$0, d5
  008464  7800                 moveq     #$0, d4
  008466  2f520008             move.l    (a2), $8(a7)
  00846a  4a92                 tst.l     (a2)
  00846c  670001e0             beq.w     $864e
  008470  4a2df6cf             tst.b     -$931(a5)
  008474  670001d8             beq.w     $864e
  008478  0c6a00010014         cmpi.w    #$1, $14(a2)
  00847e  6406                 bcc.b     $8486
  008480  357c00010014         move.w    #$1, $14(a2)
  008486  0c6a00800018         cmpi.w    #$80, $18(a2)
  00848c  6306                 bls.b     $8494
  00848e  357c00800018         move.w    #$80, $18(a2)
  008494  0c6a00800016         cmpi.w    #$80, $16(a2)
  00849a  6306                 bls.b     $84a2
  00849c  357c00800016         move.w    #$80, $16(a2)
  0084a2  7600                 moveq     #$0, d3
  0084a4  602e                 bra.b     $84d4
  0084a6  7032                 moveq     #$32, d0
  0084a8  c1c3                 muls.w    d3, d0
  0084aa  47edf3a2             lea.l     -$c5e(a5), a3
  0084ae  d7c0                 adda.l    d0, a3
  0084b0  302a0014             move.w    $14(a2), d0
  0084b4  b06b0030             cmp.w     $30(a3), d0
  0084b8  6518                 bcs.b     $84d2
  0084ba  302b002c             move.w    $2c(a3), d0
  0084be  d06b002e             add.w     $2e(a3), d0
  0084c2  322a0018             move.w    $18(a2), d1
  0084c6  d26a0016             add.w     $16(a2), d1
  0084ca  b240                 cmp.w     d0, d1
  0084cc  6504                 bcs.b     $84d2
  0084ce  7801                 moveq     #$1, d4
  0084d0  6002                 bra.b     $84d4
  0084d2  5243                 addq.w    #$1, d3
  0084d4  7032                 moveq     #$32, d0
  0084d6  c1c3                 muls.w    d3, d0
  0084d8  41edf3a2             lea.l     -$c5e(a5), a0
  0084dc  4ab00804             tst.l     $4(a0, d0.l)
  0084e0  670a                 beq.b     $84ec
  0084e2  0c430010             cmpi.w    #$10, d3
  0084e6  6c04                 bge.b     $84ec
  0084e8  4a04                 tst.b     d4
  0084ea  67ba                 beq.b     $84a6
  0084ec  0c430010             cmpi.w    #$10, d3
  0084f0  6d0c                 blt.b     $84fe
  0084f2  7000                 moveq     #$0, d0
  0084f4  4fef000c             lea.l     $c(a7), a7
  0084f8  4cdf5cf8             movem.l   (a7)+, d3-d7/a2-a4/a6
  0084fc  4e75                 rts       
  0084fe  7032                 moveq     #$32, d0
  008500  c1c3                 muls.w    d3, d0
  008502  41edf3a2             lea.l     -$c5e(a5), a0
  008506  d1c0                 adda.l    d0, a0
  008508  2a08                 move.l    a0, d5
  00850a  3003                 move.w    d3, d0
  00850c  5240                 addq.w    #$1, d0
  00850e  c1fc0032             muls.w    #$32, d0
  008512  41edf3a2             lea.l     -$c5e(a5), a0
  008516  d1c0                 adda.l    d0, a0
  008518  2c08                 move.l    a0, d6
  00851a  3043                 movea.w   d3, a0
  00851c  202df6c2             move.l    -$93e(a5), d0
  008520  9088                 sub.l     a0, d0
  008522  4c3c000000000032     mulu.l    #$32, d0
  00852a  2f400004             move.l    d0, $4(a7)
  00852e  61ff00000b1c         bsr.l     $904c
  008534  2640                 movea.l   d0, a3
  008536  2045                 movea.l   d5, a0
  008538  2246                 movea.l   d6, a1
  00853a  202f0004             move.l    $4(a7), d0
  00853e  a22e                 _BlockMove 
  008540  594f                 subq.w    #$4, a7
  008542  206f000c             movea.l   $c(a7), a0
  008546  20280008             move.l    $8(a0), d0
  00854a  e088                 lsr.l     #$8, d0
  00854c  2f00                 move.l    d0, -(a7)
  00854e  202df39e             move.l    -$c62(a5), d0
  008552  e088                 lsr.l     #$8, d0
  008554  2f00                 move.l    d0, -(a7)
  008556  a84d                 _FixDiv   
  008558  201f                 move.l    (a7)+, d0
  00855a  2c00                 move.l    d0, d6
  00855c  2052                 movea.l   (a2), a0
  00855e  2a280004             move.l    $4(a0), d5
  008562  594f                 subq.w    #$4, a7
  008564  2005                 move.l    d5, d0
  008566  7210                 moveq     #$10, d1
  008568  e3a8                 lsl.l     d1, d0
  00856a  2f00                 move.l    d0, -(a7)
  00856c  594f                 subq.w    #$4, a7
  00856e  2f06                 move.l    d6, -(a7)
  008570  2f2a0008             move.l    $8(a2), -(a7)
  008574  a868                 _FixMul   
  008576  201f                 move.l    (a7)+, d0
  008578  2f00                 move.l    d0, -(a7)
  00857a  a84d                 _FixDiv   
  00857c  201f                 move.l    (a7)+, d0
  00857e  2e80                 move.l    d0, (a7)
  008580  2a00                 move.l    d0, d5
  008582  7210                 moveq     #$10, d1
  008584  e2ad                 lsr.l     d1, d5
  008586  7001                 moveq     #$1, d0
  008588  ba80                 cmp.l     d0, d5
  00858a  6c02                 bge.b     $858e
  00858c  7a01                 moveq     #$1, d5
  00858e  7032                 moveq     #$32, d0
  008590  c1c3                 muls.w    d3, d0
  008592  49edf3a2             lea.l     -$c5e(a5), a4
  008596  d9c0                 adda.l    d0, a4
  008598  29520004             move.l    (a2), $4(a4)
  00859c  2052                 movea.l   (a2), a0
  00859e  5088                 addq.l    #$8, a0
  0085a0  5888                 addq.l    #$4, a0
  0085a2  29480008             move.l    a0, $8(a4)
  0085a6  2052                 movea.l   (a2), a0
  0085a8  5088                 addq.l    #$8, a0
  0085aa  5888                 addq.l    #$4, a0
  0085ac  29480020             move.l    a0, $20(a4)
  0085b0  42ac0024             clr.l     $24(a4)
  0085b4  2945000c             move.l    d5, $c(a4)
  0085b8  2c4c                 movea.l   a4, a6
  0085ba  4dee0014             lea.l     $14(a6), a6
  0085be  2c86                 move.l    d6, (a6)
  0085c0  594f                 subq.w    #$4, a7
  0085c2  2f16                 move.l    (a6), -(a7)
  0085c4  2f2a0008             move.l    $8(a2), -(a7)
  0085c8  a868                 _FixMul   
  0085ca  201f                 move.l    (a7)+, d0
  0085cc  29400010             move.l    d0, $10(a4)
  0085d0  42ac0018             clr.l     $18(a4)
  0085d4  296a000c001c         move.l    $c(a2), $1c(a4)
  0085da  396a00140030         move.w    $14(a2), $30(a4)
  0085e0  396a0016002c         move.w    $16(a2), $2c(a4)
  0085e6  396a0018002e         move.w    $18(a2), $2e(a4)
  0085ec  296a00100028         move.l    $10(a2), $28(a4)
  0085f2  4aaa0004             tst.l     $4(a2)
  0085f6  6710                 beq.b     $8608
  0085f8  7032                 moveq     #$32, d0
  0085fa  c1c3                 muls.w    d3, d0
  0085fc  41edf3a2             lea.l     -$c5e(a5), a0
  008600  21aa00040800         move.l    $4(a2), (a0, d0.l)
  008606  6012                 bra.b     $861a
  008608  7032                 moveq     #$32, d0
  00860a  c1c3                 muls.w    d3, d0
  00860c  41edf3a2             lea.l     -$c5e(a5), a0
  008610  21adf3600800         move.l    -$ca0(a5), (a0, d0.l)
  008616  54adf360             addq.l    #$2, -$ca0(a5)
  00861a  7032                 moveq     #$32, d0
  00861c  c1c3                 muls.w    d3, d0
  00861e  41edf3a2             lea.l     -$c5e(a5), a0
  008622  d1c0                 adda.l    d0, a0
  008624  2e08                 move.l    a0, d7
  008626  2047                 movea.l   d7, a0
  008628  2a10                 move.l    (a0), d5
  00862a  4a2df379             tst.b     -$c87(a5)
  00862e  6610                 bne.b     $8640
  008630  302a0018             move.w    $18(a2), d0
  008634  b06a0016             cmp.w     $16(a2), d0
  008638  6306                 bls.b     $8640
  00863a  316a0018002c         move.w    $18(a2), $2c(a0)
  008640  52adf6c2             addq.l    #$1, -$93e(a5)
  008644  2f0b                 move.l    a3, -(a7)
  008646  61ff00000a1a         bsr.l     $9062
  00864c  584f                 addq.w    #$4, a7
  00864e  2005                 move.l    d5, d0
  008650  4fef000c             lea.l     $c(a7), a7
  008654  4cdf5cf8             movem.l   (a7)+, d3-d7/a2-a4/a6
  008658  4e75                 rts       
  00865a  48e71f3a             movem.l   d3-d7/a2-a4/a6, -(a7)
  00865e  4fefffe4             lea.l     -$1c(a7), a7
  008662  282f0044             move.l    $44(a7), d4
  008666  7e00                 moveq     #$0, d7
  008668  4a2df6cf             tst.b     -$931(a5)
  00866c  67000138             beq.w     $87a6
  008670  7600                 moveq     #$0, d3
  008672  60000124             bra.w     $8798
  008676  7032                 moveq     #$32, d0
  008678  c1c3                 muls.w    d3, d0
  00867a  4dedf3a2             lea.l     -$c5e(a5), a6
  00867e  ddc0                 adda.l    d0, a6
  008680  b896                 cmp.l     (a6), d4
  008682  670c                 beq.b     $8690
  008684  b8ae0004             cmp.l     $4(a6), d4
  008688  6706                 beq.b     $8690
  00868a  4a84                 tst.l     d4
  00868c  66000108             bne.w     $8796
  008690  7032                 moveq     #$32, d0
  008692  c1c3                 muls.w    d3, d0
  008694  41edf3a2             lea.l     -$c5e(a5), a0
  008698  d1c0                 adda.l    d0, a0
  00869a  2f480018             move.l    a0, $18(a7)
  00869e  2468001c             movea.l   $1c(a0), a2
  0086a2  26680004             movea.l   $4(a0), a3
  0086a6  2648                 movea.l   a0, a3
  0086a8  47eb0032             lea.l     $32(a3), a3
  0086ac  2848                 movea.l   a0, a4
  0086ae  3043                 movea.w   d3, a0
  0086b0  2c2df6c2             move.l    -$93e(a5), d6
  0086b4  9c88                 sub.l     a0, d6
  0086b6  4c3c600000000032     mulu.l    #$32, d6
  0086be  61ff0000098c         bsr.l     $904c
  0086c4  2a00                 move.l    d0, d5
  0086c6  204b                 movea.l   a3, a0
  0086c8  224c                 movea.l   a4, a1
  0086ca  2006                 move.l    d6, d0
  0086cc  a22e                 _BlockMove 
  0086ce  7032                 moveq     #$32, d0
  0086d0  4c2d0800f6c2         muls.l    -$93e(a5), d0
  0086d6  41edf3a2             lea.l     -$c5e(a5), a0
  0086da  d1c0                 adda.l    d0, a0
  0086dc  2f480014             move.l    a0, $14(a7)
  0086e0  4290                 clr.l     (a0)
  0086e2  42a80004             clr.l     $4(a0)
  0086e6  7032                 moveq     #$32, d0
  0086e8  4c2d0800f6c2         muls.l    -$93e(a5), d0
  0086ee  41edf3a2             lea.l     -$c5e(a5), a0
  0086f2  d1c0                 adda.l    d0, a0
  0086f4  2f480010             move.l    a0, $10(a7)
  0086f8  42a80008             clr.l     $8(a0)
  0086fc  42a8000c             clr.l     $c(a0)
  008700  7032                 moveq     #$32, d0
  008702  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008708  41edf3a2             lea.l     -$c5e(a5), a0
  00870c  d1c0                 adda.l    d0, a0
  00870e  2f48000c             move.l    a0, $c(a7)
  008712  42a80010             clr.l     $10(a0)
  008716  42a80014             clr.l     $14(a0)
  00871a  7032                 moveq     #$32, d0
  00871c  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008722  41edf3a2             lea.l     -$c5e(a5), a0
  008726  d1c0                 adda.l    d0, a0
  008728  2f480008             move.l    a0, $8(a7)
  00872c  42a80018             clr.l     $18(a0)
  008730  42a80020             clr.l     $20(a0)
  008734  7032                 moveq     #$32, d0
  008736  4c2d0800f6c2         muls.l    -$93e(a5), d0
  00873c  41edf3a2             lea.l     -$c5e(a5), a0
  008740  d1c0                 adda.l    d0, a0
  008742  2f480004             move.l    a0, $4(a7)
  008746  42a8001c             clr.l     $1c(a0)
  00874a  42680030             clr.w     $30(a0)
  00874e  7032                 moveq     #$32, d0
  008750  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008756  41edf3a2             lea.l     -$c5e(a5), a0
  00875a  d1c0                 adda.l    d0, a0
  00875c  2e88                 move.l    a0, (a7)
  00875e  4268002c             clr.w     $2c(a0)
  008762  4268002e             clr.w     $2e(a0)
  008766  7032                 moveq     #$32, d0
  008768  c1c3                 muls.w    d3, d0
  00876a  41edf3a2             lea.l     -$c5e(a5), a0
  00876e  42b00828             clr.l     $28(a0, d0.l)
  008772  53adf6c2             subq.l    #$1, -$93e(a5)
  008776  2f05                 move.l    d5, -(a7)
  008778  61ff000008e8         bsr.l     $9062
  00877e  200a                 move.l    a2, d0
  008780  584f                 addq.w    #$4, a7
  008782  6714                 beq.b     $8798
  008784  486df344             pea.l     -$cbc(a5)
  008788  2f04                 move.l    d4, -(a7)
  00878a  48780002             pea.l     $2.w
  00878e  4e92                 jsr       (a2)
  008790  4fef000c             lea.l     $c(a7), a7
  008794  6002                 bra.b     $8798
  008796  5243                 addq.w    #$1, d3
  008798  3043                 movea.w   d3, a0
  00879a  b1edf6c2             cmpa.l    -$93e(a5), a0
  00879e  6c06                 bge.b     $87a6
  0087a0  4a07                 tst.b     d7
  0087a2  6700fed2             beq.w     $8676
  0087a6  4fef001c             lea.l     $1c(a7), a7
  0087aa  4cdf5cf8             movem.l   (a7)+, d3-d7/a2-a4/a6
  0087ae  4e75                 rts       
  0087b0  2f05                 move.l    d5, -(a7)
  0087b2  242f0008             move.l    $8(a7), d2
  0087b6  7a00                 moveq     #$0, d5
  0087b8  4a2df6cf             tst.b     -$931(a5)
  0087bc  6728                 beq.b     $87e6
  0087be  7200                 moveq     #$0, d1
  0087c0  601c                 bra.b     $87de
  0087c2  7032                 moveq     #$32, d0
  0087c4  c1c1                 muls.w    d1, d0
  0087c6  43edf3a2             lea.l     -$c5e(a5), a1
  0087ca  d3c0                 adda.l    d0, a1
  0087cc  b491                 cmp.l     (a1), d2
  0087ce  670a                 beq.b     $87da
  0087d0  b4a90004             cmp.l     $4(a1), d2
  0087d4  6704                 beq.b     $87da
  0087d6  4a82                 tst.l     d2
  0087d8  6602                 bne.b     $87dc
  0087da  5245                 addq.w    #$1, d5
  0087dc  5241                 addq.w    #$1, d1
  0087de  3041                 movea.w   d1, a0
  0087e0  b1edf6c2             cmpa.l    -$93e(a5), a0
  0087e4  6ddc                 blt.b     $87c2
  0087e6  3005                 move.w    d5, d0
  0087e8  2a1f                 move.l    (a7)+, d5
  0087ea  4e75                 rts       
  0087ec  48e71c3a             movem.l   d3-d5/a2-a4/a6, -(a7)
  0087f0  9dce                 suba.l    a6, a6
  0087f2  594f                 subq.w    #$4, a7
  0087f4  2f3c736e6420         move.l    #$736e6420, -(a7)
  0087fa  3f2f0028             move.w    $28(a7), -(a7)
  0087fe  a9a0                 _GetResource 
  008800  205f                 movea.l   (a7)+, a0
  008802  2448                 movea.l   a0, a2
  008804  200a                 move.l    a2, d0
  008806  670000dc             beq.w     $88e4
  00880a  204a                 movea.l   a2, a0
  00880c  a04a                 _HNoPurge 
  00880e  204a                 movea.l   a2, a0
  008810  a064                 _MoveHHi  
  008812  a029                 _HLock    
  008814  2f0a                 move.l    a2, -(a7)
  008816  61ff000006fe         bsr.l     $8f16
  00881c  2600                 move.l    d0, d3
  00881e  4a83                 tst.l     d3
  008820  584f                 addq.w    #$4, a7
  008822  6f0000b8             ble.w     $88dc
  008826  2652                 movea.l   (a2), a3
  008828  d7c3                 adda.l    d3, a3
  00882a  594f                 subq.w    #$4, a7
  00882c  202b0008             move.l    $8(a3), d0
  008830  e088                 lsr.l     #$8, d0
  008832  2f00                 move.l    d0, -(a7)
  008834  202df39e             move.l    -$c62(a5), d0
  008838  e088                 lsr.l     #$8, d0
  00883a  2f00                 move.l    d0, -(a7)
  00883c  a84d                 _FixDiv   
  00883e  201f                 move.l    (a7)+, d0
  008840  2800                 move.l    d0, d4
  008842  7017                 moveq     #$17, d0
  008844  d680                 add.l     d0, d3
  008846  594f                 subq.w    #$4, a7
  008848  2f0a                 move.l    a2, -(a7)
  00884a  4eb900000370         jsr       $370.l   ; seg4+6a2
  008850  201f                 move.l    (a7)+, d0
  008852  2a00                 move.l    d0, d5
  008854  9a83                 sub.l     d3, d5
  008856  2005                 move.l    d5, d0
  008858  0680000003ff         addi.l    #$3ff, d0
  00885e  2800                 move.l    d0, d4
  008860  e084                 asr.l     #$8, d4
  008862  e284                 asr.l     #$1, d4
  008864  e08c                 lsr.l     #$8, d4
  008866  e08c                 lsr.l     #$8, d4
  008868  ec8c                 lsr.l     #$6, d4
  00886a  d880                 add.l     d0, d4
  00886c  e084                 asr.l     #$8, d4
  00886e  e484                 asr.l     #$2, d4
  008870  700a                 moveq     #$a, d0
  008872  e1ac                 lsl.l     d0, d4
  008874  d884                 add.l     d4, d4
  008876  700c                 moveq     #$c, d0
  008878  d880                 add.l     d0, d4
  00887a  2004                 move.l    d4, d0
  00887c  068000000400         addi.l    #$400, d0
  008882  a31e                 _NewPtr   
  008884  2c48                 movea.l   a0, a6
  008886  200e                 move.l    a6, d0
  008888  6752                 beq.b     $88dc
  00888a  2005                 move.l    d5, d0
  00888c  0680000003ff         addi.l    #$3ff, d0
  008892  2800                 move.l    d0, d4
  008894  e084                 asr.l     #$8, d4
  008896  e284                 asr.l     #$1, d4
  008898  e08c                 lsr.l     #$8, d4
  00889a  e08c                 lsr.l     #$8, d4
  00889c  ec8c                 lsr.l     #$6, d4
  00889e  d880                 add.l     d0, d4
  0088a0  e084                 asr.l     #$8, d4
  0088a2  e484                 asr.l     #$2, d4
  0088a4  7001                 moveq     #$1, d0
  0088a6  b880                 cmp.l     d0, d4
  0088a8  6c02                 bge.b     $88ac
  0088aa  7801                 moveq     #$1, d4
  0088ac  2cbc61736e64         move.l    #$61736e64, (a6)
  0088b2  2d440004             move.l    d4, $4(a6)
  0088b6  2d6b00080008         move.l    $8(a3), $8(a6)
  0088bc  2652                 movea.l   (a2), a3
  0088be  d7c3                 adda.l    d3, a3
  0088c0  284e                 movea.l   a6, a4
  0088c2  508c                 addq.l    #$8, a4
  0088c4  588c                 addq.l    #$4, a4
  0088c6  600c                 bra.b     $88d4
  0088c8  161b                 move.b    (a3)+, d3
  0088ca  7800                 moveq     #$0, d4
  0088cc  1803                 move.b    d3, d4
  0088ce  0644ff80             addi.w    #$ff80, d4
  0088d2  38c4                 move.w    d4, (a4)+
  0088d4  2005                 move.l    d5, d0
  0088d6  5385                 subq.l    #$1, d5
  0088d8  4a80                 tst.l     d0
  0088da  66ec                 bne.b     $88c8
  0088dc  204a                 movea.l   a2, a0
  0088de  a02a                 _HUnlock  
  0088e0  204a                 movea.l   a2, a0
  0088e2  a049                 _HPurge   
  0088e4  204e                 movea.l   a6, a0
  0088e6  4cdf5c38             movem.l   (a7)+, d3-d5/a2-a4/a6
  0088ea  4e75                 rts       
  0088ec  48e71f3a             movem.l   d3-d7/a2-a4/a6, -(a7)
  0088f0  4feffff2             lea.l     -$e(a7), a7
  0088f4  2e2f0036             move.l    $36(a7), d7
  0088f8  246f003a             movea.l   $3a(a7), a2
  0088fc  422f000d             clr.b     $d(a7)
  008900  7a00                 moveq     #$0, d5
  008902  4a2df6cf             tst.b     -$931(a5)
  008906  6700013a             beq.w     $8a42
  00890a  7600                 moveq     #$0, d3
  00890c  60000124             bra.w     $8a32
  008910  7032                 moveq     #$32, d0
  008912  c1c3                 muls.w    d3, d0
  008914  47edf3a2             lea.l     -$c5e(a5), a3
  008918  d7c0                 adda.l    d0, a3
  00891a  be93                 cmp.l     (a3), d7
  00891c  6708                 beq.b     $8926
  00891e  beab0004             cmp.l     $4(a3), d7
  008922  6600010c             bne.w     $8a30
  008926  0c6a00800018         cmpi.w    #$80, $18(a2)
  00892c  6306                 bls.b     $8934
  00892e  357c00800018         move.w    #$80, $18(a2)
  008934  0c6a00800016         cmpi.w    #$80, $16(a2)
  00893a  6306                 bls.b     $8942
  00893c  357c00800016         move.w    #$80, $16(a2)
  008942  4a6a0014             tst.w     $14(a2)
  008946  671c                 beq.b     $8964
  008948  7032                 moveq     #$32, d0
  00894a  c1c3                 muls.w    d3, d0
  00894c  49edf3a2             lea.l     -$c5e(a5), a4
  008950  d9c0                 adda.l    d0, a4
  008952  49ec0030             lea.l     $30(a4), a4
  008956  302a0014             move.w    $14(a2), d0
  00895a  b054                 cmp.w     (a4), d0
  00895c  6706                 beq.b     $8964
  00895e  38aa0014             move.w    $14(a2), (a4)
  008962  7a01                 moveq     #$1, d5
  008964  7032                 moveq     #$32, d0
  008966  c1c3                 muls.w    d3, d0
  008968  4dedf3a2             lea.l     -$c5e(a5), a6
  00896c  ddc0                 adda.l    d0, a6
  00896e  204e                 movea.l   a6, a0
  008970  41e8002c             lea.l     $2c(a0), a0
  008974  2f480008             move.l    a0, $8(a7)
  008978  30aa0016             move.w    $16(a2), (a0)
  00897c  3d6a0018002e         move.w    $18(a2), $2e(a6)
  008982  2caa0004             move.l    $4(a2), (a6)
  008986  4a2df379             tst.b     -$c87(a5)
  00898a  660e                 bne.b     $899a
  00898c  302a0018             move.w    $18(a2), d0
  008990  b06a0016             cmp.w     $16(a2), d0
  008994  6304                 bls.b     $899a
  008996  30aa0018             move.w    $18(a2), (a0)
  00899a  7032                 moveq     #$32, d0
  00899c  c1c3                 muls.w    d3, d0
  00899e  41edf3a2             lea.l     -$c5e(a5), a0
  0089a2  d1c0                 adda.l    d0, a0
  0089a4  2f480004             move.l    a0, $4(a7)
  0089a8  5088                 addq.l    #$8, a0
  0089aa  5088                 addq.l    #$8, a0
  0089ac  2e88                 move.l    a0, (a7)
  0089ae  594f                 subq.w    #$4, a7
  0089b0  206f0008             movea.l   $8(a7), a0
  0089b4  2f280014             move.l    $14(a0), -(a7)
  0089b8  2f2a0008             move.l    $8(a2), -(a7)
  0089bc  a868                 _FixMul   
  0089be  201f                 move.l    (a7)+, d0
  0089c0  2057                 movea.l   (a7), a0
  0089c2  2080                 move.l    d0, (a0)
  0089c4  206f0004             movea.l   $4(a7), a0
  0089c8  20680004             movea.l   $4(a0), a0
  0089cc  28280004             move.l    $4(a0), d4
  0089d0  700a                 moveq     #$a, d0
  0089d2  e1ac                 lsl.l     d0, d4
  0089d4  206f0004             movea.l   $4(a7), a0
  0089d8  2248                 movea.l   a0, a1
  0089da  22690020             movea.l   $20(a1), a1
  0089de  93e80008             suba.l    $8(a0), a1
  0089e2  2009                 move.l    a1, d0
  0089e4  e088                 lsr.l     #$8, d0
  0089e6  e088                 lsr.l     #$8, d0
  0089e8  e088                 lsr.l     #$8, d0
  0089ea  ee88                 lsr.l     #$7, d0
  0089ec  d089                 add.l     a1, d0
  0089ee  e280                 asr.l     #$1, d0
  0089f0  2204                 move.l    d4, d1
  0089f2  9280                 sub.l     d0, d1
  0089f4  2801                 move.l    d1, d4
  0089f6  0684000003ff         addi.l    #$3ff, d4
  0089fc  720a                 moveq     #$a, d1
  0089fe  e2ac                 lsr.l     d1, d4
  008a00  594f                 subq.w    #$4, a7
  008a02  2004                 move.l    d4, d0
  008a04  7210                 moveq     #$10, d1
  008a06  e3a8                 lsl.l     d1, d0
  008a08  2f00                 move.l    d0, -(a7)
  008a0a  206f0008             movea.l   $8(a7), a0
  008a0e  2f10                 move.l    (a0), -(a7)
  008a10  a84d                 _FixDiv   
  008a12  201f                 move.l    (a7)+, d0
  008a14  2c00                 move.l    d0, d6
  008a16  2806                 move.l    d6, d4
  008a18  7210                 moveq     #$10, d1
  008a1a  e2ac                 lsr.l     d1, d4
  008a1c  7001                 moveq     #$1, d0
  008a1e  b880                 cmp.l     d0, d4
  008a20  6402                 bcc.b     $8a24
  008a22  7801                 moveq     #$1, d4
  008a24  7032                 moveq     #$32, d0
  008a26  c1c3                 muls.w    d3, d0
  008a28  41edf3a2             lea.l     -$c5e(a5), a0
  008a2c  2184080c             move.l    d4, $c(a0, d0.l)
  008a30  5243                 addq.w    #$1, d3
  008a32  3043                 movea.w   d3, a0
  008a34  b1edf6c2             cmpa.l    -$93e(a5), a0
  008a38  6c08                 bge.b     $8a42
  008a3a  4a2f000d             tst.b     $d(a7)
  008a3e  6700fed0             beq.w     $8910
  008a42  4fef000e             lea.l     $e(a7), a7
  008a46  4cdf5cf8             movem.l   (a7)+, d3-d7/a2-a4/a6
  008a4a  4e75                 rts       
  008a4c  48e71f3a             movem.l   d3-d7/a2-a4/a6, -(a7)
  008a50  594f                 subq.w    #$4, a7
  008a52  362f002c             move.w    $2c(a7), d3
  008a56  7c00                 moveq     #$0, d6
  008a58  4a2df6cf             tst.b     -$931(a5)
  008a5c  670000d2             beq.w     $8b30
  008a60  3003                 move.w    d3, d0
  008a62  5240                 addq.w    #$1, d0
  008a64  c1fc0032             muls.w    #$32, d0
  008a68  41edf3a2             lea.l     -$c5e(a5), a0
  008a6c  d1c0                 adda.l    d0, a0
  008a6e  2c08                 move.l    a0, d6
  008a70  7032                 moveq     #$32, d0
  008a72  c1c3                 muls.w    d3, d0
  008a74  41edf3a2             lea.l     -$c5e(a5), a0
  008a78  d1c0                 adda.l    d0, a0
  008a7a  2e08                 move.l    a0, d7
  008a7c  3043                 movea.w   d3, a0
  008a7e  202df6c2             move.l    -$93e(a5), d0
  008a82  9088                 sub.l     a0, d0
  008a84  4c3c000000000032     mulu.l    #$32, d0
  008a8c  2e80                 move.l    d0, (a7)
  008a8e  2046                 movea.l   d6, a0
  008a90  2247                 movea.l   d7, a1
  008a92  2017                 move.l    (a7), d0
  008a94  a22e                 _BlockMove 
  008a96  7032                 moveq     #$32, d0
  008a98  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008a9e  45edf3a2             lea.l     -$c5e(a5), a2
  008aa2  d5c0                 adda.l    d0, a2
  008aa4  4292                 clr.l     (a2)
  008aa6  42aa0004             clr.l     $4(a2)
  008aaa  7032                 moveq     #$32, d0
  008aac  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008ab2  47edf3a2             lea.l     -$c5e(a5), a3
  008ab6  d7c0                 adda.l    d0, a3
  008ab8  42ab0008             clr.l     $8(a3)
  008abc  42ab000c             clr.l     $c(a3)
  008ac0  7032                 moveq     #$32, d0
  008ac2  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008ac8  49edf3a2             lea.l     -$c5e(a5), a4
  008acc  d9c0                 adda.l    d0, a4
  008ace  42ac0010             clr.l     $10(a4)
  008ad2  42ac0014             clr.l     $14(a4)
  008ad6  7032                 moveq     #$32, d0
  008ad8  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008ade  4dedf3a2             lea.l     -$c5e(a5), a6
  008ae2  ddc0                 adda.l    d0, a6
  008ae4  42ae0018             clr.l     $18(a6)
  008ae8  42ae0020             clr.l     $20(a6)
  008aec  7032                 moveq     #$32, d0
  008aee  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008af4  41edf3a2             lea.l     -$c5e(a5), a0
  008af8  d1c0                 adda.l    d0, a0
  008afa  2808                 move.l    a0, d4
  008afc  2044                 movea.l   d4, a0
  008afe  42a8001c             clr.l     $1c(a0)
  008b02  42680030             clr.w     $30(a0)
  008b06  7032                 moveq     #$32, d0
  008b08  4c2d0800f6c2         muls.l    -$93e(a5), d0
  008b0e  41edf3a2             lea.l     -$c5e(a5), a0
  008b12  d1c0                 adda.l    d0, a0
  008b14  2a08                 move.l    a0, d5
  008b16  2045                 movea.l   d5, a0
  008b18  4268002c             clr.w     $2c(a0)
  008b1c  4268002e             clr.w     $2e(a0)
  008b20  7032                 moveq     #$32, d0
  008b22  c1c3                 muls.w    d3, d0
  008b24  41edf3a2             lea.l     -$c5e(a5), a0
  008b28  42b00828             clr.l     $28(a0, d0.l)
  008b2c  53adf6c2             subq.l    #$1, -$93e(a5)
  008b30  584f                 addq.w    #$4, a7
  008b32  4cdf5cf8             movem.l   (a7)+, d3-d7/a2-a4/a6
  008b36  4e75                 rts       
  008b38  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  008b3c  246f001c             movea.l   $1c(a7), a2
  008b40  202a0008             move.l    $8(a2), d0
  008b44  c18d                 exg.l     d0, a5
  008b46  2a00                 move.l    d0, d5
  008b48  204a                 movea.l   a2, a0
  008b4a  5088                 addq.l    #$8, a0
  008b4c  5088                 addq.l    #$8, a0
  008b4e  2b48f37a             move.l    a0, -$c86(a5)
  008b52  4a2df379             tst.b     -$c87(a5)
  008b56  670c                 beq.b     $8b64
  008b58  42a7                 clr.l     -(a7)
  008b5a  61ff000000c2         bsr.l     $8c1e
  008b60  584f                 addq.w    #$4, a7
  008b62  600a                 bra.b     $8b6e
  008b64  42a7                 clr.l     -(a7)
  008b66  61ff00000188         bsr.l     $8cf0
  008b6c  584f                 addq.w    #$4, a7
  008b6e  7001                 moveq     #$1, d0
  008b70  25400004             move.l    d0, $4(a2)
  008b74  7600                 moveq     #$0, d3
  008b76  60000092             bra.w     $8c0a
  008b7a  7032                 moveq     #$32, d0
  008b7c  4c030800             muls.l    d3, d0
  008b80  47edf3a2             lea.l     -$c5e(a5), a3
  008b84  d7c0                 adda.l    d0, a3
  008b86  286b001c             movea.l   $1c(a3), a4
  008b8a  244c                 movea.l   a4, a2
  008b8c  2813                 move.l    (a3), d4
  008b8e  200a                 move.l    a2, d0
  008b90  6748                 beq.b     $8bda
  008b92  2b6b0004f344         move.l    $4(a3), -$cbc(a5)
  008b98  3b6b0030f358         move.w    $30(a3), -$ca8(a5)
  008b9e  3b6b002cf35a         move.w    $2c(a3), -$ca6(a5)
  008ba4  3b6b002ef35c         move.w    $2e(a3), -$ca4(a5)
  008baa  2b7c00010000f34c     move.l    #$10000, -$cb4(a5)
  008bb2  2b4cf350             move.l    a4, -$cb0(a5)
  008bb6  7032                 moveq     #$32, d0
  008bb8  4c030800             muls.l    d3, d0
  008bbc  41edf3a2             lea.l     -$c5e(a5), a0
  008bc0  2b700828f354         move.l    $28(a0, d0.l), -$cac(a5)
  008bc6  2b44f348             move.l    d4, -$cb8(a5)
  008bca  486df344             pea.l     -$cbc(a5)
  008bce  2f04                 move.l    d4, -(a7)
  008bd0  48780003             pea.l     $3.w
  008bd4  4e92                 jsr       (a2)
  008bd6  4fef000c             lea.l     $c(a7), a7
  008bda  7032                 moveq     #$32, d0
  008bdc  4c030800             muls.l    d3, d0
  008be0  41edf3a2             lea.l     -$c5e(a5), a0
  008be4  53b0080c             subq.l    #$1, $c(a0, d0.l)
  008be8  661e                 bne.b     $8c08
  008bea  3f03                 move.w    d3, -(a7)
  008bec  4ebafe5e             jsr       $8a4c(pc)
  008bf0  5383                 subq.l    #$1, d3
  008bf2  200a                 move.l    a2, d0
  008bf4  544f                 addq.w    #$2, a7
  008bf6  6710                 beq.b     $8c08
  008bf8  486df344             pea.l     -$cbc(a5)
  008bfc  2f04                 move.l    d4, -(a7)
  008bfe  48780001             pea.l     $1.w
  008c02  4e92                 jsr       (a2)
  008c04  4fef000c             lea.l     $c(a7), a7
  008c08  5283                 addq.l    #$1, d3
  008c0a  b6adf6c2             cmp.l     -$93e(a5), d3
  008c0e  6d00ff6a             blt.w     $8b7a
  008c12  2005                 move.l    d5, d0
  008c14  c18d                 exg.l     d0, a5
  008c16  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  008c1a  4e740008             rtd       #$8
  008c1e  48e70738             movem.l   d5-d7/a2-a4, -(a7)
  008c22  286df37a             movea.l   -$c86(a5), a4
  008c26  97cb                 suba.l    a3, a3
  008c28  600000b8             bra.w     $8ce2
  008c2c  7e00                 moveq     #$0, d7
  008c2e  7a00                 moveq     #$0, d5
  008c30  7400                 moveq     #$0, d2
  008c32  6072                 bra.b     $8ca6
  008c34  7032                 moveq     #$32, d0
  008c36  4c020800             muls.l    d2, d0
  008c3a  45edf3a2             lea.l     -$c5e(a5), a2
  008c3e  d5c0                 adda.l    d0, a2
  008c40  b4adf6c6             cmp.l     -$93a(a5), d2
  008c44  6c42                 bge.b     $8c88
  008c46  206a0020             movea.l   $20(a2), a0
  008c4a  3250                 movea.w   (a0), a1
  008c4c  2209                 move.l    a1, d1
  008c4e  206a0020             movea.l   $20(a2), a0
  008c52  b1ea0024             cmpa.l    $24(a2), a0
  008c56  660e                 bne.b     $8c66
  008c58  206a0020             movea.l   $20(a2), a0
  008c5c  32680002             movea.w   $2(a0), a1
  008c60  2c09                 move.l    a1, d6
  008c62  d286                 add.l     d6, d1
  008c64  e281                 asr.l     #$1, d1
  008c66  256a00200024         move.l    $20(a2), $24(a2)
  008c6c  7000                 moveq     #$0, d0
  008c6e  302a002c             move.w    $2c(a2), d0
  008c72  4c010800             muls.l    d1, d0
  008c76  ee80                 asr.l     #$7, d0
  008c78  de80                 add.l     d0, d7
  008c7a  7000                 moveq     #$0, d0
  008c7c  302a002e             move.w    $2e(a2), d0
  008c80  4c010800             muls.l    d1, d0
  008c84  ee80                 asr.l     #$7, d0
  008c86  da80                 add.l     d0, d5
  008c88  202a0010             move.l    $10(a2), d0
  008c8c  e088                 lsr.l     #$8, d0
  008c8e  d1aa0018             add.l     d0, $18(a2)
  008c92  202a0018             move.l    $18(a2), d0
  008c96  e088                 lsr.l     #$8, d0
  008c98  d080                 add.l     d0, d0
  008c9a  206a0008             movea.l   $8(a2), a0
  008c9e  d1c0                 adda.l    d0, a0
  008ca0  25480020             move.l    a0, $20(a2)
  008ca4  5282                 addq.l    #$1, d2
  008ca6  b4adf6c2             cmp.l     -$93e(a5), d2
  008caa  6d88                 blt.b     $8c34
  008cac  707f                 moveq     #$7f, d0
  008cae  be80                 cmp.l     d0, d7
  008cb0  6f02                 ble.b     $8cb4
  008cb2  7e7f                 moveq     #$7f, d7
  008cb4  7081                 moveq     #$81, d0
  008cb6  be80                 cmp.l     d0, d7
  008cb8  6c02                 bge.b     $8cbc
  008cba  7e81                 moveq     #$81, d7
  008cbc  068700000080         addi.l    #$80, d7
  008cc2  707f                 moveq     #$7f, d0
  008cc4  ba80                 cmp.l     d0, d5
  008cc6  6f02                 ble.b     $8cca
  008cc8  7a7f                 moveq     #$7f, d5
  008cca  7081                 moveq     #$81, d0
  008ccc  ba80                 cmp.l     d0, d5
  008cce  6c02                 bge.b     $8cd2
  008cd0  7a81                 moveq     #$81, d5
  008cd2  068500000080         addi.l    #$80, d5
  008cd8  2007                 move.l    d7, d0
  008cda  e188                 lsl.l     #$8, d0
  008cdc  8a80                 or.l      d0, d5
  008cde  38c5                 move.w    d5, (a4)+
  008ce0  528b                 addq.l    #$1, a3
  008ce2  b6fc0400             cmpa.w    #$400, a3
  008ce6  6d00ff44             blt.w     $8c2c
  008cea  4cdf1ce0             movem.l   (a7)+, d5-d7/a2-a4
  008cee  4e75                 rts       
  008cf0  48e70730             movem.l   d5-d7/a2-a3, -(a7)
  008cf4  266df37a             movea.l   -$c86(a5), a3
  008cf8  7e00                 moveq     #$0, d7
  008cfa  6000008c             bra.w     $8d88
  008cfe  7c00                 moveq     #$0, d6
  008d00  7200                 moveq     #$0, d1
  008d02  6064                 bra.b     $8d68
  008d04  7032                 moveq     #$32, d0
  008d06  4c010800             muls.l    d1, d0
  008d0a  45edf3a2             lea.l     -$c5e(a5), a2
  008d0e  d5c0                 adda.l    d0, a2
  008d10  b2adf6c6             cmp.l     -$93a(a5), d1
  008d14  6c34                 bge.b     $8d4a
  008d16  206a0020             movea.l   $20(a2), a0
  008d1a  3250                 movea.w   (a0), a1
  008d1c  2409                 move.l    a1, d2
  008d1e  206a0020             movea.l   $20(a2), a0
  008d22  b1ea0024             cmpa.l    $24(a2), a0
  008d26  660e                 bne.b     $8d36
  008d28  206a0020             movea.l   $20(a2), a0
  008d2c  32680002             movea.w   $2(a0), a1
  008d30  2a09                 move.l    a1, d5
  008d32  d485                 add.l     d5, d2
  008d34  e282                 asr.l     #$1, d2
  008d36  256a00200024         move.l    $20(a2), $24(a2)
  008d3c  7000                 moveq     #$0, d0
  008d3e  302a002c             move.w    $2c(a2), d0
  008d42  4c020800             muls.l    d2, d0
  008d46  ee80                 asr.l     #$7, d0
  008d48  dc80                 add.l     d0, d6
  008d4a  202a0010             move.l    $10(a2), d0
  008d4e  e088                 lsr.l     #$8, d0
  008d50  d1aa0018             add.l     d0, $18(a2)
  008d54  202a0018             move.l    $18(a2), d0
  008d58  e088                 lsr.l     #$8, d0
  008d5a  d080                 add.l     d0, d0
  008d5c  206a0008             movea.l   $8(a2), a0
  008d60  d1c0                 adda.l    d0, a0
  008d62  25480020             move.l    a0, $20(a2)
  008d66  5281                 addq.l    #$1, d1
  008d68  b2adf6c2             cmp.l     -$93e(a5), d1
  008d6c  6d96                 blt.b     $8d04
  008d6e  707f                 moveq     #$7f, d0
  008d70  bc80                 cmp.l     d0, d6
  008d72  6f02                 ble.b     $8d76
  008d74  7c7f                 moveq     #$7f, d6
  008d76  7081                 moveq     #$81, d0
  008d78  bc80                 cmp.l     d0, d6
  008d7a  6c02                 bge.b     $8d7e
  008d7c  7c81                 moveq     #$81, d6
  008d7e  068600000080         addi.l    #$80, d6
  008d84  16c6                 move.b    d6, (a3)+
  008d86  5287                 addq.l    #$1, d7
  008d88  0c8700000400         cmpi.l    #$400, d7
  008d8e  6d00ff6e             blt.w     $8cfe
  008d92  4cdf0ce0             movem.l   (a7)+, d5-d7/a2-a3
  008d96  4e75                 rts       
  008d98  48e71020             movem.l   d3/a2, -(a7)
  008d9c  42adf364             clr.l     -$c9c(a5)
  008da0  3b7c0007f368         move.w    #$7, -$c98(a5)
  008da6  426df36a             clr.w     -$c96(a5)
  008daa  4a2df379             tst.b     -$c87(a5)
  008dae  670a                 beq.b     $8dba
  008db0  41ed01e8             lea.l     $1e8(a5), a0
  008db4  2b48f36c             move.l    a0, -$c94(a5)
  008db8  6008                 bra.b     $8dc2
  008dba  41ed01f0             lea.l     $1f0(a5), a0
  008dbe  2b48f36c             move.l    a0, -$c94(a5)
  008dc2  42adf370             clr.l     -$c90(a5)
  008dc6  200d                 move.l    a5, d0
  008dc8  2a780904             movea.l   $904.w, a5
  008dcc  2b40f370             move.l    d0, -$c90(a5)
  008dd0  42adf374             clr.l     -$c8c(a5)
  008dd4  7001                 moveq     #$1, d0
  008dd6  2b40f360             move.l    d0, -$ca0(a5)
  008dda  42adf6c2             clr.l     -$93e(a5)
  008dde  7600                 moveq     #$0, d3
  008de0  603e                 bra.b     $8e20
  008de2  7032                 moveq     #$32, d0
  008de4  c1c3                 muls.w    d3, d0
  008de6  45edf3a2             lea.l     -$c5e(a5), a2
  008dea  d5c0                 adda.l    d0, a2
  008dec  4292                 clr.l     (a2)
  008dee  42aa0004             clr.l     $4(a2)
  008df2  42aa0008             clr.l     $8(a2)
  008df6  42aa000c             clr.l     $c(a2)
  008dfa  42aa0010             clr.l     $10(a2)
  008dfe  42aa0014             clr.l     $14(a2)
  008e02  42aa0018             clr.l     $18(a2)
  008e06  42aa0020             clr.l     $20(a2)
  008e0a  42aa001c             clr.l     $1c(a2)
  008e0e  426a0030             clr.w     $30(a2)
  008e12  426a002c             clr.w     $2c(a2)
  008e16  426a002e             clr.w     $2e(a2)
  008e1a  42aa0028             clr.l     $28(a2)
  008e1e  5243                 addq.w    #$1, d3
  008e20  0c430010             cmpi.w    #$10, d3
  008e24  6dbc                 blt.b     $8de2
  008e26  61ff000001a0         bsr.l     $8fc8
  008e2c  1b40f378             move.b    d0, -$c88(a5)
  008e30  4cdf0408             movem.l   (a7)+, d3/a2
  008e34  4e75                 rts       
  008e36  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  008e3a  302df6ca             move.w    -$936(a5), d0
  008e3e  720a                 moveq     #$a, d1
  008e40  e368                 lsl.w     d1, d0
  008e42  48c0                 ext.l     d0
  008e44  7212                 moveq     #$12, d1
  008e46  d081                 add.l     d1, d0
  008e48  a11e                 _NewPtr   
  008e4a  2648                 movea.l   a0, a3
  008e4c  200b                 move.l    a3, d0
  008e4e  6736                 beq.b     $8e86
  008e50  26bc00000400         move.l    #$400, (a3)
  008e56  42ab0008             clr.l     $8(a3)
  008e5a  200d                 move.l    a5, d0
  008e5c  2a780904             movea.l   $904.w, a5
  008e60  27400008             move.l    d0, $8(a3)
  008e64  244b                 movea.l   a3, a2
  008e66  508a                 addq.l    #$8, a2
  008e68  508a                 addq.l    #$8, a2
  008e6a  382df6ca             move.w    -$936(a5), d4
  008e6e  7209                 moveq     #$9, d1
  008e70  e36c                 lsl.w     d1, d4
  008e72  7600                 moveq     #$0, d3
  008e74  6006                 bra.b     $8e7c
  008e76  34fc8080             move.w    #$8080, (a2)+
  008e7a  5243                 addq.w    #$1, d3
  008e7c  b644                 cmp.w     d4, d3
  008e7e  6df6                 blt.b     $8e76
  008e80  7001                 moveq     #$1, d0
  008e82  27400004             move.l    d0, $4(a3)
  008e86  204b                 movea.l   a3, a0
  008e88  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  008e8c  4e75                 rts       
  008e8e  2f0a                 move.l    a2, -(a7)
  008e90  203c00000424         move.l    #$424, d0
  008e96  a31e                 _NewPtr   
  008e98  2448                 movea.l   a0, a2
  008e9a  200a                 move.l    a2, d0
  008e9c  6706                 beq.b     $8ea4
  008e9e  357c0080001e         move.w    #$80, $1e(a2)
  008ea4  204a                 movea.l   a2, a0
  008ea6  245f                 movea.l   (a7)+, a2
  008ea8  4e75                 rts       
  008eaa  48e71c00             movem.l   d3-d5, -(a7)
  008eae  594f                 subq.w    #$4, a7
  008eb0  3a2f0014             move.w    $14(a7), d5
  008eb4  7800                 moveq     #$0, d4
  008eb6  3005                 move.w    d5, d0
  008eb8  02400800             andi.w    #$800, d0
  008ebc  6604                 bne.b     $8ec2
  008ebe  7600                 moveq     #$0, d3
  008ec0  6002                 bra.b     $8ec4
  008ec2  7601                 moveq     #$1, d3
  008ec4  0c030001             cmpi.b    #$1, d3
  008ec8  6622                 bne.b     $8eec
  008eca  3005                 move.w    d5, d0
  008ecc  024003ff             andi.w    #$3ff, d0
  008ed0  0c400200             cmpi.w    #$200, d0
  008ed4  6d16                 blt.b     $8eec
  008ed6  303caa6e             move.w    #$aa6e, d0
  008eda  a746                 _GetTrapAddress 
  008edc  2e88                 move.l    a0, (a7)
  008ede  303ca86e             move.w    #$a86e, d0
  008ee2  a746                 _GetTrapAddress 
  008ee4  b1d7                 cmpa.l    (a7), a0
  008ee6  6604                 bne.b     $8eec
  008ee8  7800                 moveq     #$0, d4
  008eea  6020                 bra.b     $8f0c
  008eec  303ca89f             move.w    #$a89f, d0
  008ef0  a746                 _GetTrapAddress 
  008ef2  2e88                 move.l    a0, (a7)
  008ef4  594f                 subq.w    #$4, a7
  008ef6  3f05                 move.w    d5, -(a7)
  008ef8  1f03                 move.b    d3, -(a7)
  008efa  4eb900000378         jsr       $378.l   ; seg4+6b0
  008f00  205f                 movea.l   (a7)+, a0
  008f02  b1d7                 cmpa.l    (a7), a0
  008f04  56c0                 sne.b     d0
  008f06  4400                 neg.b     d0
  008f08  4880                 ext.w     d0
  008f0a  1800                 move.b    d0, d4
  008f0c  1004                 move.b    d4, d0
  008f0e  584f                 addq.w    #$4, a7
  008f10  4cdf0038             movem.l   (a7)+, d3-d5
  008f14  4e75                 rts       
  008f16  48e71f20             movem.l   d3-d7/a2, -(a7)
  008f1a  7a00                 moveq     #$0, d5
  008f1c  7600                 moveq     #$0, d3
  008f1e  7800                 moveq     #$0, d4
  008f20  3c3c8051             move.w    #$8051, d6
  008f24  3e3c8050             move.w    #$8050, d7
  008f28  206f001c             movea.l   $1c(a7), a0
  008f2c  2450                 movea.l   (a0), a2
  008f2e  3012                 move.w    (a2), d0
  008f30  5340                 subq.w    #$1, d0
  008f32  6706                 beq.b     $8f3a
  008f34  5340                 subq.w    #$1, d0
  008f36  6710                 beq.b     $8f48
  008f38  6012                 bra.b     $8f4c
  008f3a  382a0002             move.w    $2(a2), d4
  008f3e  588a                 addq.l    #$4, a2
  008f40  7006                 moveq     #$6, d0
  008f42  c0c4                 mulu.w    d4, d0
  008f44  d5c0                 adda.l    d0, a2
  008f46  6006                 bra.b     $8f4e
  008f48  588a                 addq.l    #$4, a2
  008f4a  6002                 bra.b     $8f4e
  008f4c  7601                 moveq     #$1, d3
  008f4e  3812                 move.w    (a2), d4
  008f50  548a                 addq.l    #$2, a2
  008f52  6014                 bra.b     $8f68
  008f54  bc52                 cmp.w     (a2), d6
  008f56  6704                 beq.b     $8f5c
  008f58  be52                 cmp.w     (a2), d7
  008f5a  6608                 bne.b     $8f64
  008f5c  2a2a0004             move.l    $4(a2), d5
  008f60  7601                 moveq     #$1, d3
  008f62  6004                 bra.b     $8f68
  008f64  508a                 addq.l    #$8, a2
  008f66  5344                 subq.w    #$1, d4
  008f68  4a44                 tst.w     d4
  008f6a  6f04                 ble.b     $8f70
  008f6c  4a03                 tst.b     d3
  008f6e  67e4                 beq.b     $8f54
  008f70  2005                 move.l    d5, d0
  008f72  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  008f76  4e75                 rts       
  008f78  2f03                 move.l    d3, -(a7)
  008f7a  594f                 subq.w    #$4, a7
  008f7c  4297                 clr.l     (a7)
  008f7e  554f                 subq.w    #$2, a7
  008f80  486f0002             pea.l     $2(a7)
  008f84  3f3c0005             move.w    #$5, -(a7)
  008f88  42a7                 clr.l     -(a7)
  008f8a  42a7                 clr.l     -(a7)
  008f8c  a807                 _SndNewChannel 
  008f8e  301f                 move.w    (a7)+, d0
  008f90  3600                 move.w    d0, d3
  008f92  4a43                 tst.w     d3
  008f94  662a                 bne.b     $8fc0
  008f96  554f                 subq.w    #$2, a7
  008f98  2f2f0002             move.l    $2(a7), -(a7)
  008f9c  2f3c73726174         move.l    #$73726174, -(a7)
  008fa2  2f2f0016             move.l    $16(a7), -(a7)
  008fa6  203c063c0018         move.l    #$63c0018, d0
  008fac  a800                 _SoundDispatch 
  008fae  301f                 move.w    (a7)+, d0
  008fb0  3600                 move.w    d0, d3
  008fb2  554f                 subq.w    #$2, a7
  008fb4  2f2f0002             move.l    $2(a7), -(a7)
  008fb8  1f3c0001             move.b    #$1, -(a7)
  008fbc  a801                 _SndDisposeChannel 
  008fbe  301f                 move.w    (a7)+, d0
  008fc0  3003                 move.w    d3, d0
  008fc2  584f                 addq.w    #$4, a7
  008fc4  261f                 move.l    (a7)+, d3
  008fc6  4e75                 rts       
  008fc8  2f03                 move.l    d3, -(a7)
  008fca  514f                 subq.w    #$8, a7
  008fcc  7600                 moveq     #$0, d3
  008fce  3f3ca800             move.w    #$a800, -(a7)
  008fd2  4ebafed6             jsr       $8eaa(pc)
  008fd6  4a00                 tst.b     d0
  008fd8  544f                 addq.w    #$2, a7
  008fda  6720                 beq.b     $8ffc
  008fdc  594f                 subq.w    #$4, a7
  008fde  203c000c0008         move.l    #$c0008, d0
  008fe4  a800                 _SoundDispatch 
  008fe6  2e9f                 move.l    (a7)+, (a7)
  008fe8  2f570004             move.l    (a7), $4(a7)
  008fec  0c2f00030004         cmpi.b    #$3, $4(a7)
  008ff2  54c0                 scc.b     d0
  008ff4  4400                 neg.b     d0
  008ff6  4880                 ext.w     d0
  008ff8  1600                 move.b    d0, d3
  008ffa  6002                 bra.b     $8ffe
  008ffc  7600                 moveq     #$0, d3
  008ffe  1003                 move.b    d3, d0
  009000  504f                 addq.w    #$8, a7
  009002  261f                 move.l    (a7)+, d3
  009004  4e75                 rts       
  009006  2f03                 move.l    d3, -(a7)
  009008  514f                 subq.w    #$8, a7
  00900a  7600                 moveq     #$0, d3
  00900c  3f3ca800             move.w    #$a800, -(a7)
  009010  4ebafe98             jsr       $8eaa(pc)
  009014  4a00                 tst.b     d0
  009016  544f                 addq.w    #$2, a7
  009018  672a                 beq.b     $9044
  00901a  594f                 subq.w    #$4, a7
  00901c  203c000c0008         move.l    #$c0008, d0
  009022  a800                 _SoundDispatch 
  009024  2e9f                 move.l    (a7)+, (a7)
  009026  2f570004             move.l    (a7), $4(a7)
  00902a  0c2f00030004         cmpi.b    #$3, $4(a7)
  009030  6210                 bhi.b     $9042
  009032  0c2f00030004         cmpi.b    #$3, $4(a7)
  009038  660a                 bne.b     $9044
  00903a  0c2f00100005         cmpi.b    #$10, $5(a7)
  009040  6502                 bcs.b     $9044
  009042  7601                 moveq     #$1, d3
  009044  1003                 move.b    d3, d0
  009046  504f                 addq.w    #$8, a7
  009048  261f                 move.l    (a7)+, d3
  00904a  4e75                 rts       
  00904c  2f03                 move.l    d3, -(a7)
  00904e  7600                 moveq     #$0, d3
  009050  40c0                 move.w    sr, d0
  009052  007c0700             ori.w     #$700, sr
  009056  7200                 moveq     #$0, d1
  009058  3200                 move.w    d0, d1
  00905a  2601                 move.l    d1, d3
  00905c  2003                 move.l    d3, d0
  00905e  261f                 move.l    (a7)+, d3
  009060  4e75                 rts       
  009062  302f0006             move.w    $6(a7), d0
  009066  46c0                 move.w    d0, sr
  009068  4e75                 rts       
  00906a  0000003a             ori.b     #$3a, d0
  00906e  4192                 chk.w     (a2), d0
  009070  4267                 clr.w     -(a7)
  009072  9985                 subx.l    d5, d4
  009074  a2e3                 _trap_a2e3 
  009076  9841                 sub.w     d1, d4
  009078  83da                 divs.w    (a2)+, d1
  00907a  dee0                 adda.w    -(a0), a7
  00907c  40cd                 dc.w      $40cd
  00907e  40ba                 dc.w      $40ba
  009080  4126                 chk.l     -(a6), d0
  009082  42fa                 dc.w      $42fa
  009084  4046                 negx.w    d6
  009086  e8e1                 dc.w      $e8e1
  009088  4194                 chk.w     (a4), d0
  00908a  4282                 clr.l     d2
  00908c  a6f5                 _trap_a6f5 
  00908e  4066                 negx.w    -(a6)
  009090  f742                 dc.w      $f742
  009092  688f                 bvc.b     $9023
  009094  9c8f                 sub.l     a7, d6
  009096  b340                 eor.w     d1, d0
  009098  88f5f5f5f5f5f5f5     divu.w    ([$f5f5f5f5]), d4
  0090a0  f5f5                 dc.w      $f5f5
  0090a2  4581                 chk.w     d1, d2
  0090a4  f447                 dc.w      $f447
  0090a6  2841                 movea.l   d1, a4
  0090a8  d885                 add.l     d5, d4
  0090aa  4a62                 tst.w     -(a2)
  0090ac  f1f9                 dc.w      $f1f9
  0090ae  8f42a3d1             pack      d2, d7, #$a3d1
  0090b2  f3fc                 dc.w      $f3fc
  0090b4  531a                 subq.b    #$1, (a2)+
  0090b6  4067                 negx.w    -(a7)
  0090b8  407a                 dc.w      $407a
  0090ba  b942                 eor.w     d4, d2
  0090bc  2d435800             move.l    d3, $5800(a6)
  0090c0  00001244             ori.b     #$44, d0
  0090c4  44e0                 move.w    -(a0), ccr
  0090c6  9aec4192             suba.w    $4192(a4), a5
  0090ca  dcde                 adda.w    (a6)+, a6
  0090cc  de40                 add.w     d0, d7
  0090ce  6ddc                 blt.b     $90ac
  0090d0  dede                 adda.w    (a6)+, a7
  0090d2  4557                 dc.w      $4557
  0090d4  41e0                 dc.w      $41e0
  0090d6  498c                 dc.w      $498c
  0090d8  427b                 dc.w      $427b
  0090da  41b2409f             chk.w     -$61(a2, d4.w), d0
  0090de  0000005e             ori.b     #$5e, d0
  0090e2  4e13                 dc.w      $4e13
  0090e4  acfb                 _MapRgn   
  0090e6  8fa1                 or.l      d7, -(a1)
  0090e8  4050                 negx.w    (a0)
  0090ea  9e86                 sub.l     d6, d7
  0090ec  4184                 chk.w     d4, d0
  0090ee  4210                 clr.b     (a0)
  0090f0  409e                 negx.l    (a6)+
  0090f2  8841                 or.w      d1, d4
  0090f4  4340                 dc.w      $4340
  0090f6  d1ec4052             adda.l    $4052(a4), a0
  0090fa  91fb4043             suba.l    $913f(pc, d4.w), a0
  0090fe  d540                 addx.w    d0, d2
  009100  5540                 subq.w    #$2, d0
  009102  5289                 addq.l    #$1, a1
  009104  8740bc85             pack      d0, d3, #$bc85
  009108  4060                 negx.w    -(a0)
  00910a  40b6d4e0             negx.l    -$20(a6, a5.w * 4)
  00910e  9940                 subx.w    d0, d4
  009110  c17f                 dc.w      $c17f
  009112  bf40                 eor.w     d7, d0
  009114  faa04049             fbf.w     $d15f
  009118  854085cc             pack      d0, d2, #$85cc
  00911c  40d2                 move.w    sr, (a2)
  00911e  9942                 subx.w    d2, d4
  009120  0a7f                 dc.w      $0a7f
  009122  b4df                 cmpa.w    (a7)+, a2
  009124  eceb                 dc.w      $eceb
  009126  e440                 asr.w     #$2, d0
  009128  e591                 roxl.l    #$2, d1
  00912a  41b84044             chk.w     $4044.w, d0
  00912e  848b                 dc.w      $848b
  009130  40729c95             negx.w    -$6b(a2, a1.l * 4)
  009134  4052                 negx.w    (a2)
  009136  40c5                 move.w    sr, d5
  009138  a540                 _ResrvMem 
  00913a  ba93                 cmp.l     (a3), d5
  00913c  874049f8             pack      d0, d3, #$49f8
  009140  4047                 negx.w    d7
  009142  40e5                 move.w    sr, -(a5)
  009144  b3ab4791             eor.l     d1, $4791(a3)
  009148  b140                 eor.w     d0, d0
  00914a  9240                 sub.w     d0, d1
  00914c  dd7f                 dc.w      $dd7f
  00914e  54e1                 scc.b     -(a1)
  009150  40ce                 dc.w      $40ce
  009152  7f4a                 dc.w      $7f4a
  009154  408b                 dc.w      $408b
  009156  7f88                 dc.w      $7f88
  009158  8a40                 or.w      d0, d5
  00915a  e697                 roxr.l    #$3, d7
  00915c  4061                 negx.w    -(a1)
  00915e  afd5                 _trap_afd5 
  009160  4047                 negx.w    d7
  009162  404e                 dc.w      $404e
  009164  4083                 negx.l    d3
  009166  834047a4             pack      d0, d1, #$47a4
  00916a  83406efb             pack      d0, d1, #$6efb
  00916e  cd                   dc.w      $00cd
