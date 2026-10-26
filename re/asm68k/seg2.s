
;-------------------------------------------------------------
; DrawBlackLines   (seg 2 +00000c, 138 bytes)
  00000c  4e56fffe             link.w    a6, #$fffe
  000010  48e71f20             movem.l   d3-d7/a2, -(a7)
  000014  1d79000045f6ffff     move.b    $45f6.l, -$1(a6)   ; g_45f6
  00001c  4a2effff             tst.b     -$1(a6)
  000020  6706                 beq.b     $28
  000022  61ff00005e84         bsr.l     $5ea8   ; HideCursorSafe
  000028  2a3c000000df         move.l    #$df, d5
  00002e  2c3c000001c0         move.l    #$1c0, d6
  000034  7e11                 moveq     #$11, d7
  000036  2007                 move.l    d7, d0
  000038  4c390800000082f6     muls.l    $82f6.l, d0   ; g_82f6
  000040  2479000082f2         movea.l   $82f2.l, a2   ; g_82f2
  000046  d5c0                 adda.l    d0, a2
  000048  508a                 addq.l    #$8, a2
  00004a  508a                 addq.l    #$8, a2
  00004c  602c                 bra.b     $7a
  00004e  2806                 move.l    d6, d4
  000050  e48c                 lsr.l     #$2, d4
  000052  7600                 moveq     #$0, d3
  000054  6008                 bra.b     $5e
  000056  70ff                 moveq     #$ff, d0
  000058  25803c00             move.l    d0, (a2, d3.l * 4)
  00005c  5283                 addq.l    #$1, d3
  00005e  b684                 cmp.l     d4, d3
  000060  6df4                 blt.b     $56
  000062  5487                 addq.l    #$2, d7
  000064  2007                 move.l    d7, d0
  000066  4c390800000082f6     muls.l    $82f6.l, d0   ; g_82f6
  00006e  2479000082f2         movea.l   $82f2.l, a2   ; g_82f2
  000074  d5c0                 adda.l    d0, a2
  000076  508a                 addq.l    #$8, a2
  000078  508a                 addq.l    #$8, a2
  00007a  2005                 move.l    d5, d0
  00007c  5385                 subq.l    #$1, d5
  00007e  4a80                 tst.l     d0
  000080  66cc                 bne.b     $4e
  000082  4a2effff             tst.b     -$1(a6)
  000086  6706                 beq.b     $8e
  000088  61ff00005df2         bsr.l     $5e7c   ; ShowCursorSafe
  00008e  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  000092  4e5e                 unlk      a6
  000094  4e75                 rts       

;-------------------------------------------------------------
; BuildPosterizationTable   (seg 2 +0000a8, 144 bytes)
  0000a8  4e56fffa             link.w    a6, #$fffa
  0000ac  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  0000b0  594f                 subq.w    #$4, a7
  0000b2  aa32                 _GetGDevice 
  0000b4  205f                 movea.l   (a7)+, a0
  0000b6  2648                 movea.l   a0, a3
  0000b8  2053                 movea.l   (a3), a0
  0000ba  20680016             movea.l   $16(a0), a0
  0000be  2050                 movea.l   (a0), a0
  0000c0  2468002a             movea.l   $2a(a0), a2
  0000c4  7800                 moveq     #$0, d4
  0000c6  6062                 bra.b     $12a
  0000c8  3044                 movea.w   d4, a0
  0000ca  2008                 move.l    a0, d0
  0000cc  e788                 lsl.l     #$3, d0
  0000ce  2052                 movea.l   (a2), a0
  0000d0  d1c0                 adda.l    d0, a0
  0000d2  2d68000afffa         move.l    $a(a0), -$6(a6)
  0000d8  3d68000efffe         move.w    $e(a0), -$2(a6)
  0000de  7a00                 moveq     #$0, d5
  0000e0  3a2efffc             move.w    -$4(a6), d5
  0000e4  7200                 moveq     #$0, d1
  0000e6  322efffa             move.w    -$6(a6), d1
  0000ea  d285                 add.l     d5, d1
  0000ec  7a00                 moveq     #$0, d5
  0000ee  3a2efffe             move.w    -$2(a6), d5
  0000f2  da81                 add.l     d1, d5
  0000f4  4c7c580500000003     divs.l    #$3, d5
  0000fc  2605                 move.l    d5, d3
  0000fe  e083                 asr.l     #$8, d3
  000100  e683                 asr.l     #$3, d3
  000102  e08b                 lsr.l     #$8, d3
  000104  e08b                 lsr.l     #$8, d3
  000106  e88b                 lsr.l     #$4, d3
  000108  d685                 add.l     d5, d3
  00010a  e083                 asr.l     #$8, d3
  00010c  e883                 asr.l     #$4, d3
  00010e  700f                 moveq     #$f, d0
  000110  b680                 cmp.l     d0, d3
  000112  6f04                 ble.b     $118
  000114  760f                 moveq     #$f, d3
  000116  6006                 bra.b     $11e
  000118  4a83                 tst.l     d3
  00011a  6c02                 bge.b     $11e
  00011c  7600                 moveq     #$0, d3
  00011e  41f90000f482         lea.l     $f482.l, a0   ; g_f482
  000124  31834200             move.w    d3, (a0, d4.w * 2)
  000128  5244                 addq.w    #$1, d4
  00012a  0c440100             cmpi.w    #$100, d4
  00012e  6d98                 blt.b     $c8
  000130  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  000134  4e5e                 unlk      a6
  000136  4e75                 rts       

;-------------------------------------------------------------
; BuildTranslucTable   (seg 2 +000152, 328 bytes)
  000152  4e56fff4             link.w    a6, #$fff4
  000156  48e71f30             movem.l   d3-d7/a2-a3, -(a7)
  00015a  594f                 subq.w    #$4, a7
  00015c  aa32                 _GetGDevice 
  00015e  205f                 movea.l   (a7)+, a0
  000160  2648                 movea.l   a0, a3
  000162  2053                 movea.l   (a3), a0
  000164  20680016             movea.l   $16(a0), a0
  000168  2050                 movea.l   (a0), a0
  00016a  2468002a             movea.l   $2a(a0), a2
  00016e  7e00                 moveq     #$0, d7
  000170  60000118             bra.w     $28a
  000174  7600                 moveq     #$0, d3
  000176  60000108             bra.w     $280
  00017a  3043                 movea.w   d3, a0
  00017c  2008                 move.l    a0, d0
  00017e  e788                 lsl.l     #$3, d0
  000180  2052                 movea.l   (a2), a0
  000182  d1c0                 adda.l    d0, a0
  000184  2d68000afffa         move.l    $a(a0), -$6(a6)
  00018a  3d68000efffe         move.w    $e(a0), -$2(a6)
  000190  3007                 move.w    d7, d0
  000192  48c0                 ext.l     d0
  000194  720c                 moveq     #$c, d1
  000196  e3a8                 lsl.l     d1, d0
  000198  3d40fff8             move.w    d0, -$8(a6)
  00019c  3d40fff6             move.w    d0, -$a(a6)
  0001a0  3d40fff4             move.w    d0, -$c(a6)
  0001a4  7800                 moveq     #$0, d4
  0001a6  382efff4             move.w    -$c(a6), d4
  0001aa  2204                 move.l    d4, d1
  0001ac  e089                 lsr.l     #$8, d1
  0001ae  e089                 lsr.l     #$8, d1
  0001b0  e089                 lsr.l     #$8, d1
  0001b2  ee89                 lsr.l     #$7, d1
  0001b4  d284                 add.l     d4, d1
  0001b6  e281                 asr.l     #$1, d1
  0001b8  7800                 moveq     #$0, d4
  0001ba  382efffa             move.w    -$6(a6), d4
  0001be  d881                 add.l     d1, d4
  0001c0  7a00                 moveq     #$0, d5
  0001c2  3a2efff8             move.w    -$8(a6), d5
  0001c6  2205                 move.l    d5, d1
  0001c8  e089                 lsr.l     #$8, d1
  0001ca  e089                 lsr.l     #$8, d1
  0001cc  e089                 lsr.l     #$8, d1
  0001ce  ee89                 lsr.l     #$7, d1
  0001d0  d285                 add.l     d5, d1
  0001d2  e281                 asr.l     #$1, d1
  0001d4  7a00                 moveq     #$0, d5
  0001d6  3a2efffe             move.w    -$2(a6), d5
  0001da  da81                 add.l     d1, d5
  0001dc  7c00                 moveq     #$0, d6
  0001de  3c2efff6             move.w    -$a(a6), d6
  0001e2  2206                 move.l    d6, d1
  0001e4  e089                 lsr.l     #$8, d1
  0001e6  e089                 lsr.l     #$8, d1
  0001e8  e089                 lsr.l     #$8, d1
  0001ea  ee89                 lsr.l     #$7, d1
  0001ec  d286                 add.l     d6, d1
  0001ee  e281                 asr.l     #$1, d1
  0001f0  7c00                 moveq     #$0, d6
  0001f2  3c2efffc             move.w    -$4(a6), d6
  0001f6  dc81                 add.l     d1, d6
  0001f8  0c840000ffff         cmpi.l    #$ffff, d4
  0001fe  6c06                 bge.b     $206
  000200  3d44fffa             move.w    d4, -$6(a6)
  000204  6006                 bra.b     $20c
  000206  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  00020c  0c850000ffff         cmpi.l    #$ffff, d5
  000212  6c06                 bge.b     $21a
  000214  3d45fffc             move.w    d5, -$4(a6)
  000218  6006                 bra.b     $220
  00021a  3d7cfffffffc         move.w    #$ffff, -$4(a6)
  000220  0c860000ffff         cmpi.l    #$ffff, d6
  000226  6c06                 bge.b     $22e
  000228  3d46fffe             move.w    d6, -$2(a6)
  00022c  6006                 bra.b     $234
  00022e  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  000234  7800                 moveq     #$0, d4
  000236  382efffc             move.w    -$4(a6), d4
  00023a  7200                 moveq     #$0, d1
  00023c  322efffa             move.w    -$6(a6), d1
  000240  d284                 add.l     d4, d1
  000242  7800                 moveq     #$0, d4
  000244  382efffe             move.w    -$2(a6), d4
  000248  d881                 add.l     d1, d4
  00024a  4c7c480400000003     divs.l    #$3, d4
  000252  3d44fffe             move.w    d4, -$2(a6)
  000256  3d44fffc             move.w    d4, -$4(a6)
  00025a  3d44fffa             move.w    d4, -$6(a6)
  00025e  594f                 subq.w    #$4, a7
  000260  486efffa             pea.l     -$6(a6)
  000264  aa33                 _Color2Index 
  000266  201f                 move.l    (a7)+, d0
  000268  2800                 move.l    d0, d4
  00026a  3047                 movea.w   d7, a0
  00026c  2008                 move.l    a0, d0
  00026e  7209                 moveq     #$9, d1
  000270  e3a8                 lsl.l     d1, d0
  000272  41f90000a482         lea.l     $a482.l, a0   ; g_a482
  000278  d1c0                 adda.l    d0, a0
  00027a  31843200             move.w    d4, (a0, d3.w * 2)
  00027e  5243                 addq.w    #$1, d3
  000280  0c430100             cmpi.w    #$100, d3
  000284  6d00fef4             blt.w     $17a
  000288  5247                 addq.w    #$1, d7
  00028a  0c470010             cmpi.w    #$10, d7
  00028e  6d00fee4             blt.w     $174
  000292  4cdf0cf8             movem.l   (a7)+, d3-d7/a2-a3
  000296  4e5e                 unlk      a6
  000298  4e75                 rts       

;-------------------------------------------------------------
; BuildReddenTable   (seg 2 +0002b0, 870 bytes)
  0002b0  4e56fff4             link.w    a6, #$fff4
  0002b4  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  0002b8  594f                 subq.w    #$4, a7
  0002ba  aa32                 _GetGDevice 
  0002bc  205f                 movea.l   (a7)+, a0
  0002be  2648                 movea.l   a0, a3
  0002c0  2053                 movea.l   (a3), a0
  0002c2  20680016             movea.l   $16(a0), a0
  0002c6  2050                 movea.l   (a0), a0
  0002c8  2468002a             movea.l   $2a(a0), a2
  0002cc  7600                 moveq     #$0, d3
  0002ce  6000017e             bra.w     $44e
  0002d2  7800                 moveq     #$0, d4
  0002d4  6000016e             bra.w     $444
  0002d8  3044                 movea.w   d4, a0
  0002da  2008                 move.l    a0, d0
  0002dc  e788                 lsl.l     #$3, d0
  0002de  2052                 movea.l   (a2), a0
  0002e0  d1c0                 adda.l    d0, a0
  0002e2  2d68000afffa         move.l    $a(a0), -$6(a6)
  0002e8  3d68000efffe         move.w    $e(a0), -$2(a6)
  0002ee  7a00                 moveq     #$0, d5
  0002f0  3a2efffc             move.w    -$4(a6), d5
  0002f4  7200                 moveq     #$0, d1
  0002f6  322efffa             move.w    -$6(a6), d1
  0002fa  d285                 add.l     d5, d1
  0002fc  7a00                 moveq     #$0, d5
  0002fe  3a2efffe             move.w    -$2(a6), d5
  000302  da81                 add.l     d1, d5
  000304  4c7c580500000003     divs.l    #$3, d5
  00030c  2005                 move.l    d5, d0
  00030e  06800000ffff         addi.l    #$ffff, d0
  000314  2200                 move.l    d0, d1
  000316  e089                 lsr.l     #$8, d1
  000318  e089                 lsr.l     #$8, d1
  00031a  e089                 lsr.l     #$8, d1
  00031c  ee89                 lsr.l     #$7, d1
  00031e  d280                 add.l     d0, d1
  000320  e281                 asr.l     #$1, d1
  000322  3d41fff4             move.w    d1, -$c(a6)
  000326  426efff6             clr.w     -$a(a6)
  00032a  426efff8             clr.w     -$8(a6)
  00032e  7000                 moveq     #$0, d0
  000330  302efffa             move.w    -$6(a6), d0
  000334  3203                 move.w    d3, d1
  000336  48c1                 ext.l     d1
  000338  7407                 moveq     #$7, d2
  00033a  9481                 sub.l     d1, d2
  00033c  4c002800             muls.l    d0, d2
  000340  2002                 move.l    d2, d0
  000342  e480                 asr.l     #$2, d0
  000344  e088                 lsr.l     #$8, d0
  000346  e088                 lsr.l     #$8, d0
  000348  e088                 lsr.l     #$8, d0
  00034a  ea88                 lsr.l     #$5, d0
  00034c  d082                 add.l     d2, d0
  00034e  e680                 asr.l     #$3, d0
  000350  7200                 moveq     #$0, d1
  000352  322efff4             move.w    -$c(a6), d1
  000356  3403                 move.w    d3, d2
  000358  48c2                 ext.l     d2
  00035a  5282                 addq.l    #$1, d2
  00035c  4c012800             muls.l    d1, d2
  000360  2202                 move.l    d2, d1
  000362  e481                 asr.l     #$2, d1
  000364  e089                 lsr.l     #$8, d1
  000366  e089                 lsr.l     #$8, d1
  000368  e089                 lsr.l     #$8, d1
  00036a  ea89                 lsr.l     #$5, d1
  00036c  d282                 add.l     d2, d1
  00036e  e681                 asr.l     #$3, d1
  000370  d280                 add.l     d0, d1
  000372  3d41fffa             move.w    d1, -$6(a6)
  000376  7000                 moveq     #$0, d0
  000378  302efffc             move.w    -$4(a6), d0
  00037c  3203                 move.w    d3, d1
  00037e  48c1                 ext.l     d1
  000380  7407                 moveq     #$7, d2
  000382  9481                 sub.l     d1, d2
  000384  4c002800             muls.l    d0, d2
  000388  2002                 move.l    d2, d0
  00038a  e480                 asr.l     #$2, d0
  00038c  e088                 lsr.l     #$8, d0
  00038e  e088                 lsr.l     #$8, d0
  000390  e088                 lsr.l     #$8, d0
  000392  ea88                 lsr.l     #$5, d0
  000394  d082                 add.l     d2, d0
  000396  e680                 asr.l     #$3, d0
  000398  7200                 moveq     #$0, d1
  00039a  322efff6             move.w    -$a(a6), d1
  00039e  3403                 move.w    d3, d2
  0003a0  48c2                 ext.l     d2
  0003a2  5282                 addq.l    #$1, d2
  0003a4  4c012800             muls.l    d1, d2
  0003a8  2202                 move.l    d2, d1
  0003aa  e481                 asr.l     #$2, d1
  0003ac  e089                 lsr.l     #$8, d1
  0003ae  e089                 lsr.l     #$8, d1
  0003b0  e089                 lsr.l     #$8, d1
  0003b2  ea89                 lsr.l     #$5, d1
  0003b4  d282                 add.l     d2, d1
  0003b6  e681                 asr.l     #$3, d1
  0003b8  d280                 add.l     d0, d1
  0003ba  3d41fffc             move.w    d1, -$4(a6)
  0003be  7000                 moveq     #$0, d0
  0003c0  302efffe             move.w    -$2(a6), d0
  0003c4  3203                 move.w    d3, d1
  0003c6  48c1                 ext.l     d1
  0003c8  7407                 moveq     #$7, d2
  0003ca  9481                 sub.l     d1, d2
  0003cc  4c002800             muls.l    d0, d2
  0003d0  2002                 move.l    d2, d0
  0003d2  e480                 asr.l     #$2, d0
  0003d4  e088                 lsr.l     #$8, d0
  0003d6  e088                 lsr.l     #$8, d0
  0003d8  e088                 lsr.l     #$8, d0
  0003da  ea88                 lsr.l     #$5, d0
  0003dc  d082                 add.l     d2, d0
  0003de  e680                 asr.l     #$3, d0
  0003e0  7200                 moveq     #$0, d1
  0003e2  322efff8             move.w    -$8(a6), d1
  0003e6  3403                 move.w    d3, d2
  0003e8  48c2                 ext.l     d2
  0003ea  5282                 addq.l    #$1, d2
  0003ec  4c012800             muls.l    d1, d2
  0003f0  2202                 move.l    d2, d1
  0003f2  e481                 asr.l     #$2, d1
  0003f4  e089                 lsr.l     #$8, d1
  0003f6  e089                 lsr.l     #$8, d1
  0003f8  e089                 lsr.l     #$8, d1
  0003fa  ea89                 lsr.l     #$5, d1
  0003fc  d282                 add.l     d2, d1
  0003fe  e681                 asr.l     #$3, d1
  000400  d280                 add.l     d0, d1
  000402  3d41fffe             move.w    d1, -$2(a6)
  000406  594f                 subq.w    #$4, a7
  000408  486efffa             pea.l     -$6(a6)
  00040c  aa33                 _Color2Index 
  00040e  201f                 move.l    (a7)+, d0
  000410  2a00                 move.l    d0, d5
  000412  3043                 movea.w   d3, a0
  000414  2008                 move.l    a0, d0
  000416  7209                 moveq     #$9, d1
  000418  e3a8                 lsl.l     d1, d0
  00041a  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  000420  d1c0                 adda.l    d0, a0
  000422  31854200             move.w    d5, (a0, d4.w * 2)
  000426  0c4400ff             cmpi.w    #$ff, d4
  00042a  6616                 bne.b     $442
  00042c  3043                 movea.w   d3, a0
  00042e  2008                 move.l    a0, d0
  000430  7209                 moveq     #$9, d1
  000432  e3a8                 lsl.l     d1, d0
  000434  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  00043a  d1c0                 adda.l    d0, a0
  00043c  31bc00ff4200         move.w    #$ff, (a0, d4.w * 2)
  000442  5244                 addq.w    #$1, d4
  000444  0c440100             cmpi.w    #$100, d4
  000448  6d00fe8e             blt.w     $2d8
  00044c  5243                 addq.w    #$1, d3
  00044e  0c430008             cmpi.w    #$8, d3
  000452  6d00fe7e             blt.w     $2d2
  000456  7600                 moveq     #$0, d3
  000458  600001ac             bra.w     $606
  00045c  7800                 moveq     #$0, d4
  00045e  6000019c             bra.w     $5fc
  000462  3044                 movea.w   d4, a0
  000464  2008                 move.l    a0, d0
  000466  e788                 lsl.l     #$3, d0
  000468  2052                 movea.l   (a2), a0
  00046a  d1c0                 adda.l    d0, a0
  00046c  2d68000afffa         move.l    $a(a0), -$6(a6)
  000472  3d68000efffe         move.w    $e(a0), -$2(a6)
  000478  7a00                 moveq     #$0, d5
  00047a  3a2efffc             move.w    -$4(a6), d5
  00047e  7200                 moveq     #$0, d1
  000480  322efffa             move.w    -$6(a6), d1
  000484  d285                 add.l     d5, d1
  000486  7a00                 moveq     #$0, d5
  000488  3a2efffe             move.w    -$2(a6), d5
  00048c  da81                 add.l     d1, d5
  00048e  4c7c580500000003     divs.l    #$3, d5
  000496  2005                 move.l    d5, d0
  000498  06800000ffff         addi.l    #$ffff, d0
  00049e  2200                 move.l    d0, d1
  0004a0  e089                 lsr.l     #$8, d1
  0004a2  e089                 lsr.l     #$8, d1
  0004a4  e089                 lsr.l     #$8, d1
  0004a6  ee89                 lsr.l     #$7, d1
  0004a8  d280                 add.l     d0, d1
  0004aa  e281                 asr.l     #$1, d1
  0004ac  3d41fff4             move.w    d1, -$c(a6)
  0004b0  2005                 move.l    d5, d0
  0004b2  06800000ffff         addi.l    #$ffff, d0
  0004b8  2200                 move.l    d0, d1
  0004ba  e089                 lsr.l     #$8, d1
  0004bc  e089                 lsr.l     #$8, d1
  0004be  e089                 lsr.l     #$8, d1
  0004c0  ee89                 lsr.l     #$7, d1
  0004c2  d280                 add.l     d0, d1
  0004c4  e281                 asr.l     #$1, d1
  0004c6  3d41fff6             move.w    d1, -$a(a6)
  0004ca  2005                 move.l    d5, d0
  0004cc  06800000ffff         addi.l    #$ffff, d0
  0004d2  2200                 move.l    d0, d1
  0004d4  e281                 asr.l     #$1, d1
  0004d6  e089                 lsr.l     #$8, d1
  0004d8  e089                 lsr.l     #$8, d1
  0004da  e089                 lsr.l     #$8, d1
  0004dc  ec89                 lsr.l     #$6, d1
  0004de  d280                 add.l     d0, d1
  0004e0  e481                 asr.l     #$2, d1
  0004e2  3d41fff8             move.w    d1, -$8(a6)
  0004e6  7000                 moveq     #$0, d0
  0004e8  302efffa             move.w    -$6(a6), d0
  0004ec  3203                 move.w    d3, d1
  0004ee  48c1                 ext.l     d1
  0004f0  740f                 moveq     #$f, d2
  0004f2  9481                 sub.l     d1, d2
  0004f4  4c002800             muls.l    d0, d2
  0004f8  2002                 move.l    d2, d0
  0004fa  e680                 asr.l     #$3, d0
  0004fc  e088                 lsr.l     #$8, d0
  0004fe  e088                 lsr.l     #$8, d0
  000500  e088                 lsr.l     #$8, d0
  000502  e888                 lsr.l     #$4, d0
  000504  d082                 add.l     d2, d0
  000506  e880                 asr.l     #$4, d0
  000508  7200                 moveq     #$0, d1
  00050a  322efff4             move.w    -$c(a6), d1
  00050e  3403                 move.w    d3, d2
  000510  48c2                 ext.l     d2
  000512  5282                 addq.l    #$1, d2
  000514  4c012800             muls.l    d1, d2
  000518  2202                 move.l    d2, d1
  00051a  e681                 asr.l     #$3, d1
  00051c  e089                 lsr.l     #$8, d1
  00051e  e089                 lsr.l     #$8, d1
  000520  e089                 lsr.l     #$8, d1
  000522  e889                 lsr.l     #$4, d1
  000524  d282                 add.l     d2, d1
  000526  e881                 asr.l     #$4, d1
  000528  d280                 add.l     d0, d1
  00052a  3d41fffa             move.w    d1, -$6(a6)
  00052e  7000                 moveq     #$0, d0
  000530  302efffc             move.w    -$4(a6), d0
  000534  3203                 move.w    d3, d1
  000536  48c1                 ext.l     d1
  000538  740f                 moveq     #$f, d2
  00053a  9481                 sub.l     d1, d2
  00053c  4c002800             muls.l    d0, d2
  000540  2002                 move.l    d2, d0
  000542  e680                 asr.l     #$3, d0
  000544  e088                 lsr.l     #$8, d0
  000546  e088                 lsr.l     #$8, d0
  000548  e088                 lsr.l     #$8, d0
  00054a  e888                 lsr.l     #$4, d0
  00054c  d082                 add.l     d2, d0
  00054e  e880                 asr.l     #$4, d0
  000550  7200                 moveq     #$0, d1
  000552  322efff6             move.w    -$a(a6), d1
  000556  3403                 move.w    d3, d2
  000558  48c2                 ext.l     d2
  00055a  5282                 addq.l    #$1, d2
  00055c  4c012800             muls.l    d1, d2
  000560  2202                 move.l    d2, d1
  000562  e681                 asr.l     #$3, d1
  000564  e089                 lsr.l     #$8, d1
  000566  e089                 lsr.l     #$8, d1
  000568  e089                 lsr.l     #$8, d1
  00056a  e889                 lsr.l     #$4, d1
  00056c  d282                 add.l     d2, d1
  00056e  e881                 asr.l     #$4, d1
  000570  d280                 add.l     d0, d1
  000572  3d41fffc             move.w    d1, -$4(a6)
  000576  7000                 moveq     #$0, d0
  000578  302efffe             move.w    -$2(a6), d0
  00057c  3203                 move.w    d3, d1
  00057e  48c1                 ext.l     d1
  000580  740f                 moveq     #$f, d2
  000582  9481                 sub.l     d1, d2
  000584  4c002800             muls.l    d0, d2
  000588  2002                 move.l    d2, d0
  00058a  e680                 asr.l     #$3, d0
  00058c  e088                 lsr.l     #$8, d0
  00058e  e088                 lsr.l     #$8, d0
  000590  e088                 lsr.l     #$8, d0
  000592  e888                 lsr.l     #$4, d0
  000594  d082                 add.l     d2, d0
  000596  e880                 asr.l     #$4, d0
  000598  7200                 moveq     #$0, d1
  00059a  322efff8             move.w    -$8(a6), d1
  00059e  3403                 move.w    d3, d2
  0005a0  48c2                 ext.l     d2
  0005a2  5282                 addq.l    #$1, d2
  0005a4  4c012800             muls.l    d1, d2
  0005a8  2202                 move.l    d2, d1
  0005aa  e681                 asr.l     #$3, d1
  0005ac  e089                 lsr.l     #$8, d1
  0005ae  e089                 lsr.l     #$8, d1
  0005b0  e089                 lsr.l     #$8, d1
  0005b2  e889                 lsr.l     #$4, d1
  0005b4  d282                 add.l     d2, d1
  0005b6  e881                 asr.l     #$4, d1
  0005b8  d280                 add.l     d0, d1
  0005ba  3d41fffe             move.w    d1, -$2(a6)
  0005be  594f                 subq.w    #$4, a7
  0005c0  486efffa             pea.l     -$6(a6)
  0005c4  aa33                 _Color2Index 
  0005c6  201f                 move.l    (a7)+, d0
  0005c8  2a00                 move.l    d0, d5
  0005ca  3043                 movea.w   d3, a0
  0005cc  2008                 move.l    a0, d0
  0005ce  7209                 moveq     #$9, d1
  0005d0  e3a8                 lsl.l     d1, d0
  0005d2  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  0005d8  d1c0                 adda.l    d0, a0
  0005da  31854200             move.w    d5, (a0, d4.w * 2)
  0005de  0c4400ff             cmpi.w    #$ff, d4
  0005e2  6616                 bne.b     $5fa
  0005e4  3043                 movea.w   d3, a0
  0005e6  2008                 move.l    a0, d0
  0005e8  7209                 moveq     #$9, d1
  0005ea  e3a8                 lsl.l     d1, d0
  0005ec  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  0005f2  d1c0                 adda.l    d0, a0
  0005f4  31bc00ff4200         move.w    #$ff, (a0, d4.w * 2)
  0005fa  5244                 addq.w    #$1, d4
  0005fc  0c440100             cmpi.w    #$100, d4
  000600  6d00fe60             blt.w     $462
  000604  5243                 addq.w    #$1, d3
  000606  0c430010             cmpi.w    #$10, d3
  00060a  6d00fe50             blt.w     $45c
  00060e  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  000612  4e5e                 unlk      a6
  000614  4e75                 rts       

;-------------------------------------------------------------
; BuildSineTable   (seg 2 +00062a, 8 bytes)
  00062a  4e560000             link.w    a6, #$0
  00062e  4e5e                 unlk      a6
  000630  4e75                 rts       

;-------------------------------------------------------------
; BuildTintTable   (seg 2 +000644, 2530 bytes)
  000644  4e56ffd4             link.w    a6, #$ffd4
  000648  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  00064c  594f                 subq.w    #$4, a7
  00064e  aa32                 _GetGDevice 
  000650  205f                 movea.l   (a7)+, a0
  000652  2648                 movea.l   a0, a3
  000654  2053                 movea.l   (a3), a0
  000656  20680016             movea.l   $16(a0), a0
  00065a  2050                 movea.l   (a0), a0
  00065c  2468002a             movea.l   $2a(a0), a2
  000660  7800                 moveq     #$0, d4
  000662  6022                 bra.b     $686
  000664  7600                 moveq     #$0, d3
  000666  6016                 bra.b     $67e
  000668  3044                 movea.w   d4, a0
  00066a  2008                 move.l    a0, d0
  00066c  7209                 moveq     #$9, d1
  00066e  e3a8                 lsl.l     d1, d0
  000670  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000676  d1c0                 adda.l    d0, a0
  000678  31833200             move.w    d3, (a0, d3.w * 2)
  00067c  5243                 addq.w    #$1, d3
  00067e  0c430100             cmpi.w    #$100, d3
  000682  6de4                 blt.b     $668
  000684  5244                 addq.w    #$1, d4
  000686  0c440010             cmpi.w    #$10, d4
  00068a  6dd8                 blt.b     $664
  00068c  7600                 moveq     #$0, d3
  00068e  60000082             bra.w     $712
  000692  3043                 movea.w   d3, a0
  000694  2008                 move.l    a0, d0
  000696  e788                 lsl.l     #$3, d0
  000698  2052                 movea.l   (a2), a0
  00069a  d1c0                 adda.l    d0, a0
  00069c  2d68000afffa         move.l    $a(a0), -$6(a6)
  0006a2  3d68000efffe         move.w    $e(a0), -$2(a6)
  0006a8  7800                 moveq     #$0, d4
  0006aa  382efffc             move.w    -$4(a6), d4
  0006ae  7200                 moveq     #$0, d1
  0006b0  322efffa             move.w    -$6(a6), d1
  0006b4  d284                 add.l     d4, d1
  0006b6  7800                 moveq     #$0, d4
  0006b8  382efffe             move.w    -$2(a6), d4
  0006bc  d881                 add.l     d1, d4
  0006be  4c7c480400000003     divs.l    #$3, d4
  0006c6  2004                 move.l    d4, d0
  0006c8  068000002710         addi.l    #$2710, d0
  0006ce  0c800000ffff         cmpi.l    #$ffff, d0
  0006d4  6f08                 ble.b     $6de
  0006d6  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  0006dc  600c                 bra.b     $6ea
  0006de  2004                 move.l    d4, d0
  0006e0  068000002710         addi.l    #$2710, d0
  0006e6  3d40fffa             move.w    d0, -$6(a6)
  0006ea  426efffc             clr.w     -$4(a6)
  0006ee  426efffe             clr.w     -$2(a6)
  0006f2  594f                 subq.w    #$4, a7
  0006f4  486efffa             pea.l     -$6(a6)
  0006f8  aa33                 _Color2Index 
  0006fa  201f                 move.l    (a7)+, d0
  0006fc  2800                 move.l    d0, d4
  0006fe  3043                 movea.w   d3, a0
  000700  2008                 move.l    a0, d0
  000702  d080                 add.l     d0, d0
  000704  41f900008482         lea.l     $8482.l, a0   ; g_8482
  00070a  d1c0                 adda.l    d0, a0
  00070c  31440200             move.w    d4, $200(a0)
  000710  5243                 addq.w    #$1, d3
  000712  0c4300ff             cmpi.w    #$ff, d3
  000716  6d00ff7a             blt.w     $692
  00071a  7600                 moveq     #$0, d3
  00071c  60000090             bra.w     $7ae
  000720  3043                 movea.w   d3, a0
  000722  2008                 move.l    a0, d0
  000724  e788                 lsl.l     #$3, d0
  000726  2052                 movea.l   (a2), a0
  000728  d1c0                 adda.l    d0, a0
  00072a  2d68000afffa         move.l    $a(a0), -$6(a6)
  000730  3d68000efffe         move.w    $e(a0), -$2(a6)
  000736  7800                 moveq     #$0, d4
  000738  382efffc             move.w    -$4(a6), d4
  00073c  7200                 moveq     #$0, d1
  00073e  322efffa             move.w    -$6(a6), d1
  000742  d284                 add.l     d4, d1
  000744  7800                 moveq     #$0, d4
  000746  382efffe             move.w    -$2(a6), d4
  00074a  d881                 add.l     d1, d4
  00074c  4c7c480400000003     divs.l    #$3, d4
  000754  2004                 move.l    d4, d0
  000756  068000002710         addi.l    #$2710, d0
  00075c  0c800000ffff         cmpi.l    #$ffff, d0
  000762  6f0e                 ble.b     $772
  000764  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  00076a  3d7cfffffffc         move.w    #$ffff, -$4(a6)
  000770  6018                 bra.b     $78a
  000772  2004                 move.l    d4, d0
  000774  068000002710         addi.l    #$2710, d0
  00077a  3d40fffa             move.w    d0, -$6(a6)
  00077e  2004                 move.l    d4, d0
  000780  068000002710         addi.l    #$2710, d0
  000786  3d40fffc             move.w    d0, -$4(a6)
  00078a  426efffe             clr.w     -$2(a6)
  00078e  594f                 subq.w    #$4, a7
  000790  486efffa             pea.l     -$6(a6)
  000794  aa33                 _Color2Index 
  000796  201f                 move.l    (a7)+, d0
  000798  2800                 move.l    d0, d4
  00079a  3043                 movea.w   d3, a0
  00079c  2008                 move.l    a0, d0
  00079e  d080                 add.l     d0, d0
  0007a0  41f900008482         lea.l     $8482.l, a0   ; g_8482
  0007a6  d1c0                 adda.l    d0, a0
  0007a8  31440400             move.w    d4, $400(a0)
  0007ac  5243                 addq.w    #$1, d3
  0007ae  0c4300ff             cmpi.w    #$ff, d3
  0007b2  6d00ff6c             blt.w     $720
  0007b6  7600                 moveq     #$0, d3
  0007b8  6060                 bra.b     $81a
  0007ba  3043                 movea.w   d3, a0
  0007bc  2008                 move.l    a0, d0
  0007be  e788                 lsl.l     #$3, d0
  0007c0  2052                 movea.l   (a2), a0
  0007c2  d1c0                 adda.l    d0, a0
  0007c4  2d68000afffa         move.l    $a(a0), -$6(a6)
  0007ca  3d68000efffe         move.w    $e(a0), -$2(a6)
  0007d0  7800                 moveq     #$0, d4
  0007d2  382efffc             move.w    -$4(a6), d4
  0007d6  7200                 moveq     #$0, d1
  0007d8  322efffa             move.w    -$6(a6), d1
  0007dc  d284                 add.l     d4, d1
  0007de  7800                 moveq     #$0, d4
  0007e0  382efffe             move.w    -$2(a6), d4
  0007e4  d881                 add.l     d1, d4
  0007e6  4c7c480400000003     divs.l    #$3, d4
  0007ee  426efffa             clr.w     -$6(a6)
  0007f2  426efffc             clr.w     -$4(a6)
  0007f6  3d44fffe             move.w    d4, -$2(a6)
  0007fa  594f                 subq.w    #$4, a7
  0007fc  486efffa             pea.l     -$6(a6)
  000800  aa33                 _Color2Index 
  000802  201f                 move.l    (a7)+, d0
  000804  2800                 move.l    d0, d4
  000806  3043                 movea.w   d3, a0
  000808  2008                 move.l    a0, d0
  00080a  d080                 add.l     d0, d0
  00080c  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000812  d1c0                 adda.l    d0, a0
  000814  31440600             move.w    d4, $600(a0)
  000818  5243                 addq.w    #$1, d3
  00081a  0c4300ff             cmpi.w    #$ff, d3
  00081e  6d9a                 blt.b     $7ba
  000820  7600                 moveq     #$0, d3
  000822  6062                 bra.b     $886
  000824  3043                 movea.w   d3, a0
  000826  2008                 move.l    a0, d0
  000828  e788                 lsl.l     #$3, d0
  00082a  2052                 movea.l   (a2), a0
  00082c  d1c0                 adda.l    d0, a0
  00082e  2d68000afffa         move.l    $a(a0), -$6(a6)
  000834  3d68000efffe         move.w    $e(a0), -$2(a6)
  00083a  7800                 moveq     #$0, d4
  00083c  382efffc             move.w    -$4(a6), d4
  000840  7200                 moveq     #$0, d1
  000842  322efffa             move.w    -$6(a6), d1
  000846  d284                 add.l     d4, d1
  000848  7800                 moveq     #$0, d4
  00084a  382efffe             move.w    -$2(a6), d4
  00084e  d881                 add.l     d1, d4
  000850  4c7c480400000003     divs.l    #$3, d4
  000858  426efffa             clr.w     -$6(a6)
  00085c  3d44fffc             move.w    d4, -$4(a6)
  000860  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  000866  594f                 subq.w    #$4, a7
  000868  486efffa             pea.l     -$6(a6)
  00086c  aa33                 _Color2Index 
  00086e  201f                 move.l    (a7)+, d0
  000870  2800                 move.l    d0, d4
  000872  3043                 movea.w   d3, a0
  000874  2008                 move.l    a0, d0
  000876  d080                 add.l     d0, d0
  000878  41f900008482         lea.l     $8482.l, a0   ; g_8482
  00087e  d1c0                 adda.l    d0, a0
  000880  31440800             move.w    d4, $800(a0)
  000884  5243                 addq.w    #$1, d3
  000886  0c4300ff             cmpi.w    #$ff, d3
  00088a  6d98                 blt.b     $824
  00088c  7600                 moveq     #$0, d3
  00088e  6074                 bra.b     $904
  000890  3043                 movea.w   d3, a0
  000892  2008                 move.l    a0, d0
  000894  e788                 lsl.l     #$3, d0
  000896  2052                 movea.l   (a2), a0
  000898  d1c0                 adda.l    d0, a0
  00089a  2d68000afffa         move.l    $a(a0), -$6(a6)
  0008a0  3d68000efffe         move.w    $e(a0), -$2(a6)
  0008a6  7800                 moveq     #$0, d4
  0008a8  382efffc             move.w    -$4(a6), d4
  0008ac  7200                 moveq     #$0, d1
  0008ae  322efffa             move.w    -$6(a6), d1
  0008b2  d284                 add.l     d4, d1
  0008b4  7800                 moveq     #$0, d4
  0008b6  382efffe             move.w    -$2(a6), d4
  0008ba  d881                 add.l     d1, d4
  0008bc  4c7c480400000003     divs.l    #$3, d4
  0008c4  068400003e80         addi.l    #$3e80, d4
  0008ca  0c840000ffff         cmpi.l    #$ffff, d4
  0008d0  6f06                 ble.b     $8d8
  0008d2  283c0000ffff         move.l    #$ffff, d4
  0008d8  3d44fffe             move.w    d4, -$2(a6)
  0008dc  3d44fffc             move.w    d4, -$4(a6)
  0008e0  3d44fffa             move.w    d4, -$6(a6)
  0008e4  594f                 subq.w    #$4, a7
  0008e6  486efffa             pea.l     -$6(a6)
  0008ea  aa33                 _Color2Index 
  0008ec  201f                 move.l    (a7)+, d0
  0008ee  2800                 move.l    d0, d4
  0008f0  3043                 movea.w   d3, a0
  0008f2  2008                 move.l    a0, d0
  0008f4  d080                 add.l     d0, d0
  0008f6  41f900008482         lea.l     $8482.l, a0   ; g_8482
  0008fc  d1c0                 adda.l    d0, a0
  0008fe  31440a00             move.w    d4, $a00(a0)
  000902  5243                 addq.w    #$1, d3
  000904  0c4300ff             cmpi.w    #$ff, d3
  000908  6d86                 blt.b     $890
  00090a  7600                 moveq     #$0, d3
  00090c  6054                 bra.b     $962
  00090e  3043                 movea.w   d3, a0
  000910  2008                 move.l    a0, d0
  000912  e788                 lsl.l     #$3, d0
  000914  2052                 movea.l   (a2), a0
  000916  d1c0                 adda.l    d0, a0
  000918  2d68000afffa         move.l    $a(a0), -$6(a6)
  00091e  3d68000efffe         move.w    $e(a0), -$2(a6)
  000924  302efffa             move.w    -$6(a6), d0
  000928  e248                 lsr.w     #$1, d0
  00092a  3d40fffa             move.w    d0, -$6(a6)
  00092e  302efffc             move.w    -$4(a6), d0
  000932  e248                 lsr.w     #$1, d0
  000934  3d40fffc             move.w    d0, -$4(a6)
  000938  302efffe             move.w    -$2(a6), d0
  00093c  e248                 lsr.w     #$1, d0
  00093e  3d40fffe             move.w    d0, -$2(a6)
  000942  594f                 subq.w    #$4, a7
  000944  486efffa             pea.l     -$6(a6)
  000948  aa33                 _Color2Index 
  00094a  201f                 move.l    (a7)+, d0
  00094c  2800                 move.l    d0, d4
  00094e  3043                 movea.w   d3, a0
  000950  2008                 move.l    a0, d0
  000952  d080                 add.l     d0, d0
  000954  41f900008482         lea.l     $8482.l, a0   ; g_8482
  00095a  d1c0                 adda.l    d0, a0
  00095c  31440c00             move.w    d4, $c00(a0)
  000960  5243                 addq.w    #$1, d3
  000962  0c4300ff             cmpi.w    #$ff, d3
  000966  6da6                 blt.b     $90e
  000968  7600                 moveq     #$0, d3
  00096a  6054                 bra.b     $9c0
  00096c  3043                 movea.w   d3, a0
  00096e  2008                 move.l    a0, d0
  000970  e788                 lsl.l     #$3, d0
  000972  2052                 movea.l   (a2), a0
  000974  d1c0                 adda.l    d0, a0
  000976  2d68000afffa         move.l    $a(a0), -$6(a6)
  00097c  3d68000efffe         move.w    $e(a0), -$2(a6)
  000982  302efffa             move.w    -$6(a6), d0
  000986  e448                 lsr.w     #$2, d0
  000988  3d40fffa             move.w    d0, -$6(a6)
  00098c  302efffc             move.w    -$4(a6), d0
  000990  e448                 lsr.w     #$2, d0
  000992  3d40fffc             move.w    d0, -$4(a6)
  000996  302efffe             move.w    -$2(a6), d0
  00099a  e448                 lsr.w     #$2, d0
  00099c  3d40fffe             move.w    d0, -$2(a6)
  0009a0  594f                 subq.w    #$4, a7
  0009a2  486efffa             pea.l     -$6(a6)
  0009a6  aa33                 _Color2Index 
  0009a8  201f                 move.l    (a7)+, d0
  0009aa  2800                 move.l    d0, d4
  0009ac  3043                 movea.w   d3, a0
  0009ae  2008                 move.l    a0, d0
  0009b0  d080                 add.l     d0, d0
  0009b2  41f900008482         lea.l     $8482.l, a0   ; g_8482
  0009b8  d1c0                 adda.l    d0, a0
  0009ba  31440e00             move.w    d4, $e00(a0)
  0009be  5243                 addq.w    #$1, d3
  0009c0  0c4300ff             cmpi.w    #$ff, d3
  0009c4  6da6                 blt.b     $96c
  0009c6  7600                 moveq     #$0, d3
  0009c8  600001e8             bra.w     $bb2
  0009cc  3043                 movea.w   d3, a0
  0009ce  2008                 move.l    a0, d0
  0009d0  e788                 lsl.l     #$3, d0
  0009d2  2052                 movea.l   (a2), a0
  0009d4  d1c0                 adda.l    d0, a0
  0009d6  2d68000afffa         move.l    $a(a0), -$6(a6)
  0009dc  3d68000efffe         move.w    $e(a0), -$2(a6)
  0009e2  7000                 moveq     #$0, d0
  0009e4  302efffa             move.w    -$6(a6), d0
  0009e8  2d40ffd4             move.l    d0, -$2c(a6)
  0009ec  486effd4             pea.l     -$2c(a6)
  0009f0  486effd4             pea.l     -$2c(a6)
  0009f4  3f3c280e             move.w    #$280e, -(a7)
  0009f8  a9eb                 _Pack4_FP 
  0009fa  486effd4             pea.l     -$2c(a6)
  0009fe  486effd4             pea.l     -$2c(a6)
  000a02  3f3c0810             move.w    #$810, -(a7)
  000a06  a9eb                 _Pack4_FP 
  000a08  2d7c3fffc000ffde     move.l    #$3fffc000, -$22(a6)
  000a10  42aeffe2             clr.l     -$1e(a6)
  000a14  426effe6             clr.w     -$1a(a6)
  000a18  486effd4             pea.l     -$2c(a6)
  000a1c  486effde             pea.l     -$22(a6)
  000a20  3f3c0804             move.w    #$804, -(a7)
  000a24  a9eb                 _Pack4_FP 
  000a26  486effde             pea.l     -$22(a6)
  000a2a  486effe8             pea.l     -$18(a6)
  000a2e  3f3c0810             move.w    #$810, -(a7)
  000a32  a9eb                 _Pack4_FP 
  000a34  486effe8             pea.l     -$18(a6)
  000a38  486efff0             pea.l     -$10(a6)
  000a3c  3f3c080e             move.w    #$80e, -(a7)
  000a40  a9eb                 _Pack4_FP 
  000a42  486efff0             pea.l     -$10(a6)
  000a46  3f3c0016             move.w    #$16, -(a7)
  000a4a  a9eb                 _Pack4_FP 
  000a4c  486efff0             pea.l     -$10(a6)
  000a50  486efff0             pea.l     -$10(a6)
  000a54  3f3c2810             move.w    #$2810, -(a7)
  000a58  a9eb                 _Pack4_FP 
  000a5a  282efff0             move.l    -$10(a6), d4
  000a5e  0c840000ffff         cmpi.l    #$ffff, d4
  000a64  6f08                 ble.b     $a6e
  000a66  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  000a6c  6004                 bra.b     $a72
  000a6e  3d44fffa             move.w    d4, -$6(a6)
  000a72  7000                 moveq     #$0, d0
  000a74  302efffc             move.w    -$4(a6), d0
  000a78  2d40fff0             move.l    d0, -$10(a6)
  000a7c  486efff0             pea.l     -$10(a6)
  000a80  486efff0             pea.l     -$10(a6)
  000a84  3f3c280e             move.w    #$280e, -(a7)
  000a88  a9eb                 _Pack4_FP 
  000a8a  486efff0             pea.l     -$10(a6)
  000a8e  486efff0             pea.l     -$10(a6)
  000a92  3f3c0810             move.w    #$810, -(a7)
  000a96  a9eb                 _Pack4_FP 
  000a98  2d7c3fffc000ffde     move.l    #$3fffc000, -$22(a6)
  000aa0  42aeffe2             clr.l     -$1e(a6)
  000aa4  426effe6             clr.w     -$1a(a6)
  000aa8  486efff0             pea.l     -$10(a6)
  000aac  486effde             pea.l     -$22(a6)
  000ab0  3f3c0804             move.w    #$804, -(a7)
  000ab4  a9eb                 _Pack4_FP 
  000ab6  486effde             pea.l     -$22(a6)
  000aba  486effe8             pea.l     -$18(a6)
  000abe  3f3c0810             move.w    #$810, -(a7)
  000ac2  a9eb                 _Pack4_FP 
  000ac4  486effe8             pea.l     -$18(a6)
  000ac8  486effd4             pea.l     -$2c(a6)
  000acc  3f3c080e             move.w    #$80e, -(a7)
  000ad0  a9eb                 _Pack4_FP 
  000ad2  486effd4             pea.l     -$2c(a6)
  000ad6  3f3c0016             move.w    #$16, -(a7)
  000ada  a9eb                 _Pack4_FP 
  000adc  486effd4             pea.l     -$2c(a6)
  000ae0  486effd4             pea.l     -$2c(a6)
  000ae4  3f3c2810             move.w    #$2810, -(a7)
  000ae8  a9eb                 _Pack4_FP 
  000aea  282effd4             move.l    -$2c(a6), d4
  000aee  0c840000ffff         cmpi.l    #$ffff, d4
  000af4  6f08                 ble.b     $afe
  000af6  3d7cfffffffc         move.w    #$ffff, -$4(a6)
  000afc  6004                 bra.b     $b02
  000afe  3d44fffc             move.w    d4, -$4(a6)
  000b02  7000                 moveq     #$0, d0
  000b04  302efffe             move.w    -$2(a6), d0
  000b08  2d40fff0             move.l    d0, -$10(a6)
  000b0c  486efff0             pea.l     -$10(a6)
  000b10  486efff0             pea.l     -$10(a6)
  000b14  3f3c280e             move.w    #$280e, -(a7)
  000b18  a9eb                 _Pack4_FP 
  000b1a  486efff0             pea.l     -$10(a6)
  000b1e  486efff0             pea.l     -$10(a6)
  000b22  3f3c0810             move.w    #$810, -(a7)
  000b26  a9eb                 _Pack4_FP 
  000b28  2d7c3fffc000ffde     move.l    #$3fffc000, -$22(a6)
  000b30  42aeffe2             clr.l     -$1e(a6)
  000b34  426effe6             clr.w     -$1a(a6)
  000b38  486efff0             pea.l     -$10(a6)
  000b3c  486effde             pea.l     -$22(a6)
  000b40  3f3c0804             move.w    #$804, -(a7)
  000b44  a9eb                 _Pack4_FP 
  000b46  486effde             pea.l     -$22(a6)
  000b4a  486effe8             pea.l     -$18(a6)
  000b4e  3f3c0810             move.w    #$810, -(a7)
  000b52  a9eb                 _Pack4_FP 
  000b54  486effe8             pea.l     -$18(a6)
  000b58  486effd4             pea.l     -$2c(a6)
  000b5c  3f3c080e             move.w    #$80e, -(a7)
  000b60  a9eb                 _Pack4_FP 
  000b62  486effd4             pea.l     -$2c(a6)
  000b66  3f3c0016             move.w    #$16, -(a7)
  000b6a  a9eb                 _Pack4_FP 
  000b6c  486effd4             pea.l     -$2c(a6)
  000b70  486effd4             pea.l     -$2c(a6)
  000b74  3f3c2810             move.w    #$2810, -(a7)
  000b78  a9eb                 _Pack4_FP 
  000b7a  282effd4             move.l    -$2c(a6), d4
  000b7e  0c840000ffff         cmpi.l    #$ffff, d4
  000b84  6f08                 ble.b     $b8e
  000b86  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  000b8c  6004                 bra.b     $b92
  000b8e  3d44fffe             move.w    d4, -$2(a6)
  000b92  594f                 subq.w    #$4, a7
  000b94  486efffa             pea.l     -$6(a6)
  000b98  aa33                 _Color2Index 
  000b9a  201f                 move.l    (a7)+, d0
  000b9c  2800                 move.l    d0, d4
  000b9e  3043                 movea.w   d3, a0
  000ba0  2008                 move.l    a0, d0
  000ba2  d080                 add.l     d0, d0
  000ba4  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000baa  d1c0                 adda.l    d0, a0
  000bac  31441000             move.w    d4, $1000(a0)
  000bb0  5243                 addq.w    #$1, d3
  000bb2  0c4300ff             cmpi.w    #$ff, d3
  000bb6  6d00fe14             blt.w     $9cc
  000bba  7600                 moveq     #$0, d3
  000bbc  600001e8             bra.w     $da6
  000bc0  3043                 movea.w   d3, a0
  000bc2  2008                 move.l    a0, d0
  000bc4  e788                 lsl.l     #$3, d0
  000bc6  2052                 movea.l   (a2), a0
  000bc8  d1c0                 adda.l    d0, a0
  000bca  2d68000afffa         move.l    $a(a0), -$6(a6)
  000bd0  3d68000efffe         move.w    $e(a0), -$2(a6)
  000bd6  7000                 moveq     #$0, d0
  000bd8  302efffa             move.w    -$6(a6), d0
  000bdc  2d40fff0             move.l    d0, -$10(a6)
  000be0  486efff0             pea.l     -$10(a6)
  000be4  486efff0             pea.l     -$10(a6)
  000be8  3f3c280e             move.w    #$280e, -(a7)
  000bec  a9eb                 _Pack4_FP 
  000bee  486efff0             pea.l     -$10(a6)
  000bf2  486efff0             pea.l     -$10(a6)
  000bf6  3f3c0810             move.w    #$810, -(a7)
  000bfa  a9eb                 _Pack4_FP 
  000bfc  2d7c4000a000ffde     move.l    #$4000a000, -$22(a6)
  000c04  42aeffe2             clr.l     -$1e(a6)
  000c08  426effe6             clr.w     -$1a(a6)
  000c0c  486efff0             pea.l     -$10(a6)
  000c10  486effde             pea.l     -$22(a6)
  000c14  3f3c0804             move.w    #$804, -(a7)
  000c18  a9eb                 _Pack4_FP 
  000c1a  486effde             pea.l     -$22(a6)
  000c1e  486effe8             pea.l     -$18(a6)
  000c22  3f3c0810             move.w    #$810, -(a7)
  000c26  a9eb                 _Pack4_FP 
  000c28  486effe8             pea.l     -$18(a6)
  000c2c  486effd4             pea.l     -$2c(a6)
  000c30  3f3c080e             move.w    #$80e, -(a7)
  000c34  a9eb                 _Pack4_FP 
  000c36  486effd4             pea.l     -$2c(a6)
  000c3a  3f3c0016             move.w    #$16, -(a7)
  000c3e  a9eb                 _Pack4_FP 
  000c40  486effd4             pea.l     -$2c(a6)
  000c44  486effd4             pea.l     -$2c(a6)
  000c48  3f3c2810             move.w    #$2810, -(a7)
  000c4c  a9eb                 _Pack4_FP 
  000c4e  282effd4             move.l    -$2c(a6), d4
  000c52  0c840000ffff         cmpi.l    #$ffff, d4
  000c58  6f08                 ble.b     $c62
  000c5a  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  000c60  6004                 bra.b     $c66
  000c62  3d44fffa             move.w    d4, -$6(a6)
  000c66  7000                 moveq     #$0, d0
  000c68  302efffc             move.w    -$4(a6), d0
  000c6c  2d40fff0             move.l    d0, -$10(a6)
  000c70  486efff0             pea.l     -$10(a6)
  000c74  486efff0             pea.l     -$10(a6)
  000c78  3f3c280e             move.w    #$280e, -(a7)
  000c7c  a9eb                 _Pack4_FP 
  000c7e  486efff0             pea.l     -$10(a6)
  000c82  486efff0             pea.l     -$10(a6)
  000c86  3f3c0810             move.w    #$810, -(a7)
  000c8a  a9eb                 _Pack4_FP 
  000c8c  2d7c4000a000ffde     move.l    #$4000a000, -$22(a6)
  000c94  42aeffe2             clr.l     -$1e(a6)
  000c98  426effe6             clr.w     -$1a(a6)
  000c9c  486efff0             pea.l     -$10(a6)
  000ca0  486effde             pea.l     -$22(a6)
  000ca4  3f3c0804             move.w    #$804, -(a7)
  000ca8  a9eb                 _Pack4_FP 
  000caa  486effde             pea.l     -$22(a6)
  000cae  486effe8             pea.l     -$18(a6)
  000cb2  3f3c0810             move.w    #$810, -(a7)
  000cb6  a9eb                 _Pack4_FP 
  000cb8  486effe8             pea.l     -$18(a6)
  000cbc  486effd4             pea.l     -$2c(a6)
  000cc0  3f3c080e             move.w    #$80e, -(a7)
  000cc4  a9eb                 _Pack4_FP 
  000cc6  486effd4             pea.l     -$2c(a6)
  000cca  3f3c0016             move.w    #$16, -(a7)
  000cce  a9eb                 _Pack4_FP 
  000cd0  486effd4             pea.l     -$2c(a6)
  000cd4  486effd4             pea.l     -$2c(a6)
  000cd8  3f3c2810             move.w    #$2810, -(a7)
  000cdc  a9eb                 _Pack4_FP 
  000cde  282effd4             move.l    -$2c(a6), d4
  000ce2  0c840000ffff         cmpi.l    #$ffff, d4
  000ce8  6f08                 ble.b     $cf2
  000cea  3d7cfffffffc         move.w    #$ffff, -$4(a6)
  000cf0  6004                 bra.b     $cf6
  000cf2  3d44fffc             move.w    d4, -$4(a6)
  000cf6  7000                 moveq     #$0, d0
  000cf8  302efffe             move.w    -$2(a6), d0
  000cfc  2d40fff0             move.l    d0, -$10(a6)
  000d00  486efff0             pea.l     -$10(a6)
  000d04  486efff0             pea.l     -$10(a6)
  000d08  3f3c280e             move.w    #$280e, -(a7)
  000d0c  a9eb                 _Pack4_FP 
  000d0e  486efff0             pea.l     -$10(a6)
  000d12  486efff0             pea.l     -$10(a6)
  000d16  3f3c0810             move.w    #$810, -(a7)
  000d1a  a9eb                 _Pack4_FP 
  000d1c  2d7c4000a000ffde     move.l    #$4000a000, -$22(a6)
  000d24  42aeffe2             clr.l     -$1e(a6)
  000d28  426effe6             clr.w     -$1a(a6)
  000d2c  486efff0             pea.l     -$10(a6)
  000d30  486effde             pea.l     -$22(a6)
  000d34  3f3c0804             move.w    #$804, -(a7)
  000d38  a9eb                 _Pack4_FP 
  000d3a  486effde             pea.l     -$22(a6)
  000d3e  486effe8             pea.l     -$18(a6)
  000d42  3f3c0810             move.w    #$810, -(a7)
  000d46  a9eb                 _Pack4_FP 
  000d48  486effe8             pea.l     -$18(a6)
  000d4c  486effd4             pea.l     -$2c(a6)
  000d50  3f3c080e             move.w    #$80e, -(a7)
  000d54  a9eb                 _Pack4_FP 
  000d56  486effd4             pea.l     -$2c(a6)
  000d5a  3f3c0016             move.w    #$16, -(a7)
  000d5e  a9eb                 _Pack4_FP 
  000d60  486effd4             pea.l     -$2c(a6)
  000d64  486effd4             pea.l     -$2c(a6)
  000d68  3f3c2810             move.w    #$2810, -(a7)
  000d6c  a9eb                 _Pack4_FP 
  000d6e  282effd4             move.l    -$2c(a6), d4
  000d72  0c840000ffff         cmpi.l    #$ffff, d4
  000d78  6f08                 ble.b     $d82
  000d7a  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  000d80  6004                 bra.b     $d86
  000d82  3d44fffe             move.w    d4, -$2(a6)
  000d86  594f                 subq.w    #$4, a7
  000d88  486efffa             pea.l     -$6(a6)
  000d8c  aa33                 _Color2Index 
  000d8e  201f                 move.l    (a7)+, d0
  000d90  2800                 move.l    d0, d4
  000d92  3043                 movea.w   d3, a0
  000d94  2008                 move.l    a0, d0
  000d96  d080                 add.l     d0, d0
  000d98  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000d9e  d1c0                 adda.l    d0, a0
  000da0  31441200             move.w    d4, $1200(a0)
  000da4  5243                 addq.w    #$1, d3
  000da6  0c4300ff             cmpi.w    #$ff, d3
  000daa  6d00fe14             blt.w     $bc0
  000dae  7600                 moveq     #$0, d3
  000db0  607c                 bra.b     $e2e
  000db2  3043                 movea.w   d3, a0
  000db4  2008                 move.l    a0, d0
  000db6  e788                 lsl.l     #$3, d0
  000db8  2052                 movea.l   (a2), a0
  000dba  d1c0                 adda.l    d0, a0
  000dbc  2d68000afffa         move.l    $a(a0), -$6(a6)
  000dc2  3d68000efffe         move.w    $e(a0), -$2(a6)
  000dc8  7800                 moveq     #$0, d4
  000dca  382efffc             move.w    -$4(a6), d4
  000dce  7200                 moveq     #$0, d1
  000dd0  322efffa             move.w    -$6(a6), d1
  000dd4  d284                 add.l     d4, d1
  000dd6  7800                 moveq     #$0, d4
  000dd8  382efffe             move.w    -$2(a6), d4
  000ddc  d881                 add.l     d1, d4
  000dde  4c7c480400000003     divs.l    #$3, d4
  000de6  3d44fffc             move.w    d4, -$4(a6)
  000dea  554f                 subq.w    #$2, a7
  000dec  3f3c1388             move.w    #$1388, -(a7)
  000df0  4eb900000058         jsr       $58.l   ; SATRAND
  000df6  301f                 move.w    (a7)+, d0
  000df8  3d40fffe             move.w    d0, -$2(a6)
  000dfc  554f                 subq.w    #$2, a7
  000dfe  3f3c1388             move.w    #$1388, -(a7)
  000e02  4eb900000058         jsr       $58.l   ; SATRAND
  000e08  301f                 move.w    (a7)+, d0
  000e0a  3d40fffa             move.w    d0, -$6(a6)
  000e0e  594f                 subq.w    #$4, a7
  000e10  486efffa             pea.l     -$6(a6)
  000e14  aa33                 _Color2Index 
  000e16  201f                 move.l    (a7)+, d0
  000e18  2800                 move.l    d0, d4
  000e1a  3043                 movea.w   d3, a0
  000e1c  2008                 move.l    a0, d0
  000e1e  d080                 add.l     d0, d0
  000e20  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000e26  d1c0                 adda.l    d0, a0
  000e28  31441400             move.w    d4, $1400(a0)
  000e2c  5243                 addq.w    #$1, d3
  000e2e  0c4300ff             cmpi.w    #$ff, d3
  000e32  6d00ff7e             blt.w     $db2
  000e36  7600                 moveq     #$0, d3
  000e38  6060                 bra.b     $e9a
  000e3a  3043                 movea.w   d3, a0
  000e3c  2008                 move.l    a0, d0
  000e3e  e788                 lsl.l     #$3, d0
  000e40  2052                 movea.l   (a2), a0
  000e42  d1c0                 adda.l    d0, a0
  000e44  2d68000afffa         move.l    $a(a0), -$6(a6)
  000e4a  3d68000efffe         move.w    $e(a0), -$2(a6)
  000e50  7800                 moveq     #$0, d4
  000e52  382efffc             move.w    -$4(a6), d4
  000e56  7200                 moveq     #$0, d1
  000e58  322efffa             move.w    -$6(a6), d1
  000e5c  d284                 add.l     d4, d1
  000e5e  7800                 moveq     #$0, d4
  000e60  382efffe             move.w    -$2(a6), d4
  000e64  d881                 add.l     d1, d4
  000e66  4c7c480400000003     divs.l    #$3, d4
  000e6e  3d44fffe             move.w    d4, -$2(a6)
  000e72  3d44fffc             move.w    d4, -$4(a6)
  000e76  3d44fffa             move.w    d4, -$6(a6)
  000e7a  594f                 subq.w    #$4, a7
  000e7c  486efffa             pea.l     -$6(a6)
  000e80  aa33                 _Color2Index 
  000e82  201f                 move.l    (a7)+, d0
  000e84  2800                 move.l    d0, d4
  000e86  3043                 movea.w   d3, a0
  000e88  2008                 move.l    a0, d0
  000e8a  d080                 add.l     d0, d0
  000e8c  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000e92  d1c0                 adda.l    d0, a0
  000e94  31441600             move.w    d4, $1600(a0)
  000e98  5243                 addq.w    #$1, d3
  000e9a  0c4300ff             cmpi.w    #$ff, d3
  000e9e  6d9a                 blt.b     $e3a
  000ea0  7600                 moveq     #$0, d3
  000ea2  6062                 bra.b     $f06
  000ea4  3043                 movea.w   d3, a0
  000ea6  2008                 move.l    a0, d0
  000ea8  e788                 lsl.l     #$3, d0
  000eaa  2052                 movea.l   (a2), a0
  000eac  d1c0                 adda.l    d0, a0
  000eae  2d68000afffa         move.l    $a(a0), -$6(a6)
  000eb4  3d68000efffe         move.w    $e(a0), -$2(a6)
  000eba  7800                 moveq     #$0, d4
  000ebc  382efffc             move.w    -$4(a6), d4
  000ec0  7200                 moveq     #$0, d1
  000ec2  322efffa             move.w    -$6(a6), d1
  000ec6  d284                 add.l     d4, d1
  000ec8  7800                 moveq     #$0, d4
  000eca  382efffe             move.w    -$2(a6), d4
  000ece  d881                 add.l     d1, d4
  000ed0  4c7c480400000003     divs.l    #$3, d4
  000ed8  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  000ede  3d44fffc             move.w    d4, -$4(a6)
  000ee2  426efffe             clr.w     -$2(a6)
  000ee6  594f                 subq.w    #$4, a7
  000ee8  486efffa             pea.l     -$6(a6)
  000eec  aa33                 _Color2Index 
  000eee  201f                 move.l    (a7)+, d0
  000ef0  2800                 move.l    d0, d4
  000ef2  3043                 movea.w   d3, a0
  000ef4  2008                 move.l    a0, d0
  000ef6  d080                 add.l     d0, d0
  000ef8  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000efe  d1c0                 adda.l    d0, a0
  000f00  31441800             move.w    d4, $1800(a0)
  000f04  5243                 addq.w    #$1, d3
  000f06  0c4300ff             cmpi.w    #$ff, d3
  000f0a  6d98                 blt.b     $ea4
  000f0c  7600                 moveq     #$0, d3
  000f0e  6078                 bra.b     $f88
  000f10  3043                 movea.w   d3, a0
  000f12  2008                 move.l    a0, d0
  000f14  e788                 lsl.l     #$3, d0
  000f16  2052                 movea.l   (a2), a0
  000f18  d1c0                 adda.l    d0, a0
  000f1a  2d68000afffa         move.l    $a(a0), -$6(a6)
  000f20  3d68000efffe         move.w    $e(a0), -$2(a6)
  000f26  7800                 moveq     #$0, d4
  000f28  382efffc             move.w    -$4(a6), d4
  000f2c  7200                 moveq     #$0, d1
  000f2e  322efffa             move.w    -$6(a6), d1
  000f32  d284                 add.l     d4, d1
  000f34  7800                 moveq     #$0, d4
  000f36  382efffe             move.w    -$2(a6), d4
  000f3a  d881                 add.l     d1, d4
  000f3c  4c7c480400000003     divs.l    #$3, d4
  000f44  7000                 moveq     #$0, d0
  000f46  302efffc             move.w    -$4(a6), d0
  000f4a  06800000ffff         addi.l    #$ffff, d0
  000f50  e280                 asr.l     #$1, d0
  000f52  3d40fffc             move.w    d0, -$4(a6)
  000f56  7000                 moveq     #$0, d0
  000f58  302efffe             move.w    -$2(a6), d0
  000f5c  06800000ffff         addi.l    #$ffff, d0
  000f62  e280                 asr.l     #$1, d0
  000f64  3d40fffe             move.w    d0, -$2(a6)
  000f68  594f                 subq.w    #$4, a7
  000f6a  486efffa             pea.l     -$6(a6)
  000f6e  aa33                 _Color2Index 
  000f70  201f                 move.l    (a7)+, d0
  000f72  2800                 move.l    d0, d4
  000f74  3043                 movea.w   d3, a0
  000f76  2008                 move.l    a0, d0
  000f78  d080                 add.l     d0, d0
  000f7a  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000f80  d1c0                 adda.l    d0, a0
  000f82  31441a00             move.w    d4, $1a00(a0)
  000f86  5243                 addq.w    #$1, d3
  000f88  0c430100             cmpi.w    #$100, d3
  000f8c  6d82                 blt.b     $f10
  000f8e  7600                 moveq     #$0, d3
  000f90  6074                 bra.b     $1006
  000f92  3043                 movea.w   d3, a0
  000f94  2008                 move.l    a0, d0
  000f96  e788                 lsl.l     #$3, d0
  000f98  2052                 movea.l   (a2), a0
  000f9a  d1c0                 adda.l    d0, a0
  000f9c  2d68000afffa         move.l    $a(a0), -$6(a6)
  000fa2  3d68000efffe         move.w    $e(a0), -$2(a6)
  000fa8  7800                 moveq     #$0, d4
  000faa  382efffc             move.w    -$4(a6), d4
  000fae  7200                 moveq     #$0, d1
  000fb0  322efffa             move.w    -$6(a6), d1
  000fb4  d284                 add.l     d4, d1
  000fb6  7800                 moveq     #$0, d4
  000fb8  382efffe             move.w    -$2(a6), d4
  000fbc  d881                 add.l     d1, d4
  000fbe  4c7c480400000003     divs.l    #$3, d4
  000fc6  2004                 move.l    d4, d0
  000fc8  e280                 asr.l     #$1, d0
  000fca  d084                 add.l     d4, d0
  000fcc  e280                 asr.l     #$1, d0
  000fce  3d40fffa             move.w    d0, -$6(a6)
  000fd2  2004                 move.l    d4, d0
  000fd4  e480                 asr.l     #$2, d0
  000fd6  2204                 move.l    d4, d1
  000fd8  e281                 asr.l     #$1, d1
  000fda  d280                 add.l     d0, d1
  000fdc  e281                 asr.l     #$1, d1
  000fde  3d41fffc             move.w    d1, -$4(a6)
  000fe2  426efffe             clr.w     -$2(a6)
  000fe6  594f                 subq.w    #$4, a7
  000fe8  486efffa             pea.l     -$6(a6)
  000fec  aa33                 _Color2Index 
  000fee  201f                 move.l    (a7)+, d0
  000ff0  2800                 move.l    d0, d4
  000ff2  3043                 movea.w   d3, a0
  000ff4  2008                 move.l    a0, d0
  000ff6  d080                 add.l     d0, d0
  000ff8  41f900008482         lea.l     $8482.l, a0   ; g_8482
  000ffe  d1c0                 adda.l    d0, a0
  001000  31441c00             move.w    d4, $1c00(a0)
  001004  5243                 addq.w    #$1, d3
  001006  0c430100             cmpi.w    #$100, d3
  00100a  6d86                 blt.b     $f92
  00100c  61fffffff144         bsr.l     $152   ; BuildTranslucTable
  001012  61fffffff094         bsr.l     $a8   ; BuildPosterizationTable
  001018  61fffffff296         bsr.l     $2b0   ; BuildReddenTable
  00101e  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  001022  4e5e                 unlk      a6
  001024  4e75                 rts       

;-------------------------------------------------------------
; LineBlitter   (seg 2 +001038, 298 bytes)
  001038  4e560000             link.w    a6, #$0
  00103c  48e7fefc             movem.l   d0-d6/a0-a5, -(a7)
  001040  206e0008             movea.l   $8(a6), a0
  001044  226e000c             movea.l   $c(a6), a1
  001048  246e0010             movea.l   $10(a6), a2
  00104c  202e0014             move.l    $14(a6), d0
  001050  282e0018             move.l    $18(a6), d4
  001054  222e001c             move.l    $1c(a6), d1
  001058  242e0020             move.l    $20(a6), d2
  00105c  286e0024             movea.l   $24(a6), a4
  001060  2a6e0028             movea.l   $28(a6), a5
  001064  2a2e0030             move.l    $30(a6), d5
  001068  2c2e002c             move.l    $2c(a6), d6
  00106c  600000e8             bra.w     $1156
  001070  202e0014             move.l    $14(a6), d0
  001074  2600                 move.l    d0, d3
  001076  02830000000f         andi.l    #$f, d3
  00107c  e880                 asr.l     #$4, d0
  00107e  6020                 bra.b     $10a0
  001080  22d8                 move.l    (a0)+, (a1)+
  001082  22d8                 move.l    (a0)+, (a1)+
  001084  22d8                 move.l    (a0)+, (a1)+
  001086  22d8                 move.l    (a0)+, (a1)+
  001088  22d8                 move.l    (a0)+, (a1)+
  00108a  22d8                 move.l    (a0)+, (a1)+
  00108c  22d8                 move.l    (a0)+, (a1)+
  00108e  22d8                 move.l    (a0)+, (a1)+
  001090  22d8                 move.l    (a0)+, (a1)+
  001092  22d8                 move.l    (a0)+, (a1)+
  001094  22d8                 move.l    (a0)+, (a1)+
  001096  22d8                 move.l    (a0)+, (a1)+
  001098  22d8                 move.l    (a0)+, (a1)+
  00109a  22d8                 move.l    (a0)+, (a1)+
  00109c  22d8                 move.l    (a0)+, (a1)+
  00109e  22d8                 move.l    (a0)+, (a1)+
  0010a0  51c8ffde             dbra      d0, $1080
  0010a4  47fa0026             lea.l     $10cc(pc), a3
  0010a8  e383                 asl.l     #$1, d3
  0010aa  97c3                 suba.l    d3, a3
  0010ac  4ed3                 jmp       (a3)
  0010ae  22d8                 move.l    (a0)+, (a1)+
  0010b0  22d8                 move.l    (a0)+, (a1)+
  0010b2  22d8                 move.l    (a0)+, (a1)+
  0010b4  22d8                 move.l    (a0)+, (a1)+
  0010b6  22d8                 move.l    (a0)+, (a1)+
  0010b8  22d8                 move.l    (a0)+, (a1)+
  0010ba  22d8                 move.l    (a0)+, (a1)+
  0010bc  22d8                 move.l    (a0)+, (a1)+
  0010be  22d8                 move.l    (a0)+, (a1)+
  0010c0  22d8                 move.l    (a0)+, (a1)+
  0010c2  22d8                 move.l    (a0)+, (a1)+
  0010c4  22d8                 move.l    (a0)+, (a1)+
  0010c6  22d8                 move.l    (a0)+, (a1)+
  0010c8  22d8                 move.l    (a0)+, (a1)+
  0010ca  22d8                 move.l    (a0)+, (a1)+
  0010cc  08010001             btst.b    #$1, d1
  0010d0  6702                 beq.b     $10d4
  0010d2  32d8                 move.w    (a0)+, (a1)+
  0010d4  08010000             btst.b    #$0, d1
  0010d8  6702                 beq.b     $10dc
  0010da  12d8                 move.b    (a0)+, (a1)+
  0010dc  b5fc00000000         cmpa.l    #$0, a2
  0010e2  676c                 beq.b     $1150
  0010e4  08020001             btst.b    #$1, d2
  0010e8  6702                 beq.b     $10ec
  0010ea  32da                 move.w    (a2)+, (a1)+
  0010ec  08020000             btst.b    #$0, d2
  0010f0  6702                 beq.b     $10f4
  0010f2  12da                 move.b    (a2)+, (a1)+
  0010f4  282e0018             move.l    $18(a6), d4
  0010f8  2604                 move.l    d4, d3
  0010fa  02830000000f         andi.l    #$f, d3
  001100  e884                 asr.l     #$4, d4
  001102  6020                 bra.b     $1124
  001104  22da                 move.l    (a2)+, (a1)+
  001106  22da                 move.l    (a2)+, (a1)+
  001108  22da                 move.l    (a2)+, (a1)+
  00110a  22da                 move.l    (a2)+, (a1)+
  00110c  22da                 move.l    (a2)+, (a1)+
  00110e  22da                 move.l    (a2)+, (a1)+
  001110  22da                 move.l    (a2)+, (a1)+
  001112  22da                 move.l    (a2)+, (a1)+
  001114  22da                 move.l    (a2)+, (a1)+
  001116  22da                 move.l    (a2)+, (a1)+
  001118  22da                 move.l    (a2)+, (a1)+
  00111a  22da                 move.l    (a2)+, (a1)+
  00111c  22da                 move.l    (a2)+, (a1)+
  00111e  22da                 move.l    (a2)+, (a1)+
  001120  22da                 move.l    (a2)+, (a1)+
  001122  22da                 move.l    (a2)+, (a1)+
  001124  51ccffde             dbra      d4, $1104
  001128  47fa0026             lea.l     $1150(pc), a3
  00112c  e383                 asl.l     #$1, d3
  00112e  97c3                 suba.l    d3, a3
  001130  4ed3                 jmp       (a3)
  001132  22da                 move.l    (a2)+, (a1)+
  001134  22da                 move.l    (a2)+, (a1)+
  001136  22da                 move.l    (a2)+, (a1)+
  001138  22da                 move.l    (a2)+, (a1)+
  00113a  22da                 move.l    (a2)+, (a1)+
  00113c  22da                 move.l    (a2)+, (a1)+
  00113e  22da                 move.l    (a2)+, (a1)+
  001140  22da                 move.l    (a2)+, (a1)+
  001142  22da                 move.l    (a2)+, (a1)+
  001144  22da                 move.l    (a2)+, (a1)+
  001146  22da                 move.l    (a2)+, (a1)+
  001148  22da                 move.l    (a2)+, (a1)+
  00114a  22da                 move.l    (a2)+, (a1)+
  00114c  22da                 move.l    (a2)+, (a1)+
  00114e  22da                 move.l    (a2)+, (a1)+
  001150  d1cc                 adda.l    a4, a0
  001152  d3cd                 adda.l    a5, a1
  001154  d5c6                 adda.l    d6, a2
  001156  51cdff18             dbra      d5, $1070
  00115a  4cdf3f7f             movem.l   (a7)+, d0-d6/a0-a5
  00115e  4e5e                 unlk      a6
  001160  4e75                 rts       

;-------------------------------------------------------------
; DoubleBlit68K   (seg 2 +001170, 658 bytes)
  001170  4e56ffec             link.w    a6, #$ffec
  001174  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  001178  2e2e0008             move.l    $8(a6), d7
  00117c  2a2e0010             move.l    $10(a6), d5
  001180  246e0014             movea.l   $14(a6), a2
  001184  2045                 movea.l   d5, a0
  001186  3c10                 move.w    (a0), d6
  001188  7201                 moveq     #$1, d1
  00118a  cc81                 and.l     d1, d6
  00118c  2045                 movea.l   d5, a0
  00118e  4a50                 tst.w     (a0)
  001190  6c0a                 bge.b     $119c
  001192  2045                 movea.l   d5, a0
  001194  4250                 clr.w     (a0)
  001196  200a                 move.l    a2, d0
  001198  6702                 beq.b     $119c
  00119a  4252                 clr.w     (a2)
  00119c  2045                 movea.l   d5, a0
  00119e  30280004             move.w    $4(a0), d0
  0011a2  b079ffffe80a         cmp.w     $ffffe80a.l, d0   ; g_-17f6
  0011a8  6f16                 ble.b     $11c0
  0011aa  2045                 movea.l   d5, a0
  0011ac  3179ffffe80a0004     move.w    $ffffe80a.l, $4(a0)   ; g_-17f6
  0011b4  200a                 move.l    a2, d0
  0011b6  6708                 beq.b     $11c0
  0011b8  3579ffffe80a0004     move.w    $ffffe80a.l, $4(a2)   ; g_-17f6
  0011c0  2047                 movea.l   d7, a0
  0011c2  30280002             move.w    $2(a0), d0
  0011c6  48c0                 ext.l     d0
  0011c8  2047                 movea.l   d7, a0
  0011ca  38280006             move.w    $6(a0), d4
  0011ce  48c4                 ext.l     d4
  0011d0  9880                 sub.l     d0, d4
  0011d2  4aae000c             tst.l     $c(a6)
  0011d6  6716                 beq.b     $11ee
  0011d8  206e000c             movea.l   $c(a6), a0
  0011dc  30280002             move.w    $2(a0), d0
  0011e0  48c0                 ext.l     d0
  0011e2  206e000c             movea.l   $c(a6), a0
  0011e6  36280006             move.w    $6(a0), d3
  0011ea  48c3                 ext.l     d3
  0011ec  9680                 sub.l     d0, d3
  0011ee  2004                 move.l    d4, d0
  0011f0  e480                 asr.l     #$2, d0
  0011f2  2d40fffc             move.l    d0, -$4(a6)
  0011f6  4aae000c             tst.l     $c(a6)
  0011fa  6708                 beq.b     $1204
  0011fc  2003                 move.l    d3, d0
  0011fe  e480                 asr.l     #$2, d0
  001200  2d40fff8             move.l    d0, -$8(a6)
  001204  2047                 movea.l   d7, a0
  001206  30280002             move.w    $2(a0), d0
  00120a  48c0                 ext.l     d0
  00120c  2047                 movea.l   d7, a0
  00120e  32280006             move.w    $6(a0), d1
  001212  48c1                 ext.l     d1
  001214  9280                 sub.l     d0, d1
  001216  202efffc             move.l    -$4(a6), d0
  00121a  e588                 lsl.l     #$2, d0
  00121c  9280                 sub.l     d0, d1
  00121e  2d41fff4             move.l    d1, -$c(a6)
  001222  4aae000c             tst.l     $c(a6)
  001226  670e                 beq.b     $1236
  001228  202efff8             move.l    -$8(a6), d0
  00122c  e588                 lsl.l     #$2, d0
  00122e  2203                 move.l    d3, d1
  001230  9280                 sub.l     d0, d1
  001232  2d41fff0             move.l    d1, -$10(a6)
  001236  4a2e0018             tst.b     $18(a6)
  00123a  6772                 beq.b     $12ae
  00123c  4a2e001a             tst.b     $1a(a6)
  001240  6764                 beq.b     $12a6
  001242  4a3900006ab4         tst.b     $6ab4.l   ; g_6ab4
  001248  6726                 beq.b     $1270
  00124a  7000                 moveq     #$0, d0
  00124c  1006                 move.b    d6, d0
  00124e  2047                 movea.l   d7, a0
  001250  d150                 add.w     d0, (a0)
  001252  7000                 moveq     #$0, d0
  001254  1006                 move.b    d6, d0
  001256  2045                 movea.l   d5, a0
  001258  d150                 add.w     d0, (a0)
  00125a  7000                 moveq     #$0, d0
  00125c  1006                 move.b    d6, d0
  00125e  2047                 movea.l   d7, a0
  001260  d1680004             add.w     d0, $4(a0)
  001264  7000                 moveq     #$0, d0
  001266  1006                 move.b    d6, d0
  001268  2045                 movea.l   d5, a0
  00126a  d1680004             add.w     d0, $4(a0)
  00126e  603e                 bra.b     $12ae
  001270  1006                 move.b    d6, d0
  001272  57c0                 seq.b     d0
  001274  4400                 neg.b     d0
  001276  49c0                 extb.l    d0
  001278  2047                 movea.l   d7, a0
  00127a  d150                 add.w     d0, (a0)
  00127c  1006                 move.b    d6, d0
  00127e  57c0                 seq.b     d0
  001280  4400                 neg.b     d0
  001282  49c0                 extb.l    d0
  001284  2045                 movea.l   d5, a0
  001286  d150                 add.w     d0, (a0)
  001288  1006                 move.b    d6, d0
  00128a  57c0                 seq.b     d0
  00128c  4400                 neg.b     d0
  00128e  49c0                 extb.l    d0
  001290  2047                 movea.l   d7, a0
  001292  d1680004             add.w     d0, $4(a0)
  001296  1006                 move.b    d6, d0
  001298  57c0                 seq.b     d0
  00129a  4400                 neg.b     d0
  00129c  49c0                 extb.l    d0
  00129e  2045                 movea.l   d5, a0
  0012a0  d1680004             add.w     d0, $4(a0)
  0012a4  6008                 bra.b     $12ae
  0012a6  7000                 moveq     #$0, d0
  0012a8  1006                 move.b    d6, d0
  0012aa  2045                 movea.l   d5, a0
  0012ac  d150                 add.w     d0, (a0)
  0012ae  2045                 movea.l   d5, a0
  0012b0  3250                 movea.w   (a0), a1
  0012b2  2809                 move.l    a1, d4
  0012b4  2045                 movea.l   d5, a0
  0012b6  3610                 move.w    (a0), d3
  0012b8  48c3                 ext.l     d3
  0012ba  2204                 move.l    d4, d1
  0012bc  9283                 sub.l     d3, d1
  0012be  2047                 movea.l   d7, a0
  0012c0  3610                 move.w    (a0), d3
  0012c2  48c3                 ext.l     d3
  0012c4  d681                 add.l     d1, d3
  0012c6  2047                 movea.l   d7, a0
  0012c8  2679ffffe814         movea.l   $ffffe814.l, a3   ; g_-17ec
  0012ce  26733c00             movea.l   (a3, d3.l * 4), a3
  0012d2  d6e80002             adda.w    $2(a0), a3
  0012d6  2045                 movea.l   d5, a0
  0012d8  2004                 move.l    d4, d0
  0012da  4c390800000082f6     muls.l    $82f6.l, d0   ; g_82f6
  0012e2  2879000082f2         movea.l   $82f2.l, a4   ; g_82f2
  0012e8  d9c0                 adda.l    d0, a4
  0012ea  d8e80002             adda.w    $2(a0), a4
  0012ee  2047                 movea.l   d7, a0
  0012f0  30280002             move.w    $2(a0), d0
  0012f4  48c0                 ext.l     d0
  0012f6  2047                 movea.l   d7, a0
  0012f8  32280006             move.w    $6(a0), d1
  0012fc  48c1                 ext.l     d1
  0012fe  9280                 sub.l     d0, d1
  001300  7000                 moveq     #$0, d0
  001302  102e0018             move.b    $18(a6), d0
  001306  3839ffffe824         move.w    $ffffe824.l, d4   ; g_-17dc
  00130c  48c4                 ext.l     d4
  00130e  e1ac                 lsl.l     d0, d4
  001310  9881                 sub.l     d1, d4
  001312  7000                 moveq     #$0, d0
  001314  102e0018             move.b    $18(a6), d0
  001318  2239000082f6         move.l    $82f6.l, d1   ; g_82f6
  00131e  e1a9                 lsl.l     d0, d1
  001320  0681fffffe40         addi.l    #$fffffe40, d1
  001326  2d41ffec             move.l    d1, -$14(a6)
  00132a  4aae000c             tst.l     $c(a6)
  00132e  673c                 beq.b     $136c
  001330  206e000c             movea.l   $c(a6), a0
  001334  2479ffffe814         movea.l   $ffffe814.l, a2   ; g_-17ec
  00133a  24723c00             movea.l   (a2, d3.l * 4), a2
  00133e  d4e80002             adda.w    $2(a0), a2
  001342  206e000c             movea.l   $c(a6), a0
  001346  30280002             move.w    $2(a0), d0
  00134a  48c0                 ext.l     d0
  00134c  206e000c             movea.l   $c(a6), a0
  001350  32280006             move.w    $6(a0), d1
  001354  48c1                 ext.l     d1
  001356  9280                 sub.l     d0, d1
  001358  7000                 moveq     #$0, d0
  00135a  102e0018             move.b    $18(a6), d0
  00135e  3639ffffe824         move.w    $ffffe824.l, d3   ; g_-17dc
  001364  48c3                 ext.l     d3
  001366  e1ab                 lsl.l     d0, d3
  001368  9681                 sub.l     d1, d3
  00136a  6004                 bra.b     $1370
  00136c  95ca                 suba.l    a2, a2
  00136e  7600                 moveq     #$0, d3
  001370  7000                 moveq     #$0, d0
  001372  102e0018             move.b    $18(a6), d0
  001376  2045                 movea.l   d5, a0
  001378  3210                 move.w    (a0), d1
  00137a  48c1                 ext.l     d1
  00137c  2045                 movea.l   d5, a0
  00137e  34280004             move.w    $4(a0), d2
  001382  48c2                 ext.l     d2
  001384  9481                 sub.l     d1, d2
  001386  e0a2                 asr.l     d0, d2
  001388  2f02                 move.l    d2, -(a7)
  00138a  2f03                 move.l    d3, -(a7)
  00138c  2f2effec             move.l    -$14(a6), -(a7)
  001390  2f04                 move.l    d4, -(a7)
  001392  2f2efff0             move.l    -$10(a6), -(a7)
  001396  2f2efff4             move.l    -$c(a6), -(a7)
  00139a  2f2efff8             move.l    -$8(a6), -(a7)
  00139e  2f2efffc             move.l    -$4(a6), -(a7)
  0013a2  2f0a                 move.l    a2, -(a7)
  0013a4  2f0c                 move.l    a4, -(a7)
  0013a6  2f0b                 move.l    a3, -(a7)
  0013a8  61fffffffc8e         bsr.l     $1038   ; LineBlitter
  0013ae  4a2e0018             tst.b     $18(a6)
  0013b2  4fef002c             lea.l     $2c(a7), a7
  0013b6  6742                 beq.b     $13fa
  0013b8  4a2e001a             tst.b     $1a(a6)
  0013bc  6734                 beq.b     $13f2
  0013be  4a3900006ab4         tst.b     $6ab4.l   ; g_6ab4
  0013c4  6712                 beq.b     $13d8
  0013c6  7000                 moveq     #$0, d0
  0013c8  1006                 move.b    d6, d0
  0013ca  2047                 movea.l   d7, a0
  0013cc  9150                 sub.w     d0, (a0)
  0013ce  7000                 moveq     #$0, d0
  0013d0  1006                 move.b    d6, d0
  0013d2  2045                 movea.l   d5, a0
  0013d4  9150                 sub.w     d0, (a0)
  0013d6  6022                 bra.b     $13fa
  0013d8  1006                 move.b    d6, d0
  0013da  57c0                 seq.b     d0
  0013dc  4400                 neg.b     d0
  0013de  49c0                 extb.l    d0
  0013e0  2047                 movea.l   d7, a0
  0013e2  9150                 sub.w     d0, (a0)
  0013e4  1006                 move.b    d6, d0
  0013e6  57c0                 seq.b     d0
  0013e8  4400                 neg.b     d0
  0013ea  49c0                 extb.l    d0
  0013ec  2045                 movea.l   d5, a0
  0013ee  9150                 sub.w     d0, (a0)
  0013f0  6008                 bra.b     $13fa
  0013f2  7000                 moveq     #$0, d0
  0013f4  1006                 move.b    d6, d0
  0013f6  2045                 movea.l   d5, a0
  0013f8  9150                 sub.w     d0, (a0)
  0013fa  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0013fe  4e5e                 unlk      a6
  001400  4e75                 rts       

;-------------------------------------------------------------
; DOUBLEBLITUNIVERSAL   (seg 2 +001412, 244 bytes)
  001412  4e560000             link.w    a6, #$0
  001416  48e71038             movem.l   d3/a2-a4, -(a7)
  00141a  262e0018             move.l    $18(a6), d3
  00141e  266e0014             movea.l   $14(a6), a3
  001422  286e0010             movea.l   $10(a6), a4
  001426  246e000c             movea.l   $c(a6), a2
  00142a  2043                 movea.l   d3, a0
  00142c  4a680002             tst.w     $2(a0)
  001430  6d1a                 blt.b     $144c
  001432  200b                 move.l    a3, d0
  001434  6706                 beq.b     $143c
  001436  4a6b0002             tst.w     $2(a3)
  00143a  6d10                 blt.b     $144c
  00143c  4a6c0002             tst.w     $2(a4)
  001440  6d0a                 blt.b     $144c
  001442  200a                 move.l    a2, d0
  001444  670a                 beq.b     $1450
  001446  4a6a0002             tst.w     $2(a2)
  00144a  6c04                 bge.b     $1450
  00144c  600000ae             bra.w     $14fc
  001450  2043                 movea.l   d3, a0
  001452  4a50                 tst.w     (a0)
  001454  6d14                 blt.b     $146a
  001456  200b                 move.l    a3, d0
  001458  6704                 beq.b     $145e
  00145a  4a53                 tst.w     (a3)
  00145c  6d0c                 blt.b     $146a
  00145e  4a54                 tst.w     (a4)
  001460  6d08                 blt.b     $146a
  001462  200a                 move.l    a2, d0
  001464  6708                 beq.b     $146e
  001466  4a52                 tst.w     (a2)
  001468  6c04                 bge.b     $146e
  00146a  60000090             bra.w     $14fc
  00146e  2043                 movea.l   d3, a0
  001470  4a680004             tst.w     $4(a0)
  001474  6d1a                 blt.b     $1490
  001476  200b                 move.l    a3, d0
  001478  6706                 beq.b     $1480
  00147a  4a6b0004             tst.w     $4(a3)
  00147e  6d10                 blt.b     $1490
  001480  4a6c0004             tst.w     $4(a4)
  001484  6d0a                 blt.b     $1490
  001486  200a                 move.l    a2, d0
  001488  6708                 beq.b     $1492
  00148a  4a6a0004             tst.w     $4(a2)
  00148e  6c02                 bge.b     $1492
  001490  606a                 bra.b     $14fc
  001492  2043                 movea.l   d3, a0
  001494  0c6801e00004         cmpi.w    #$1e0, $4(a0)
  00149a  6e20                 bgt.b     $14bc
  00149c  200b                 move.l    a3, d0
  00149e  6708                 beq.b     $14a8
  0014a0  0c6b01e00004         cmpi.w    #$1e0, $4(a3)
  0014a6  6e14                 bgt.b     $14bc
  0014a8  0c6c01e00004         cmpi.w    #$1e0, $4(a4)
  0014ae  6e0c                 bgt.b     $14bc
  0014b0  200a                 move.l    a2, d0
  0014b2  670a                 beq.b     $14be
  0014b4  0c6a01e00004         cmpi.w    #$1e0, $4(a2)
  0014ba  6f02                 ble.b     $14be
  0014bc  603e                 bra.b     $14fc
  0014be  2043                 movea.l   d3, a0
  0014c0  4a680004             tst.w     $4(a0)
  0014c4  6d1a                 blt.b     $14e0
  0014c6  200b                 move.l    a3, d0
  0014c8  6706                 beq.b     $14d0
  0014ca  4a6b0004             tst.w     $4(a3)
  0014ce  6d10                 blt.b     $14e0
  0014d0  4a6c0004             tst.w     $4(a4)
  0014d4  6d0a                 blt.b     $14e0
  0014d6  200a                 move.l    a2, d0
  0014d8  6708                 beq.b     $14e2
  0014da  4a6a0004             tst.w     $4(a2)
  0014de  6c02                 bge.b     $14e2
  0014e0  601a                 bra.b     $14fc
  0014e2  1f2e0008             move.b    $8(a6), -(a7)
  0014e6  1f2e000a             move.b    $a(a6), -(a7)
  0014ea  2f0a                 move.l    a2, -(a7)
  0014ec  2f0c                 move.l    a4, -(a7)
  0014ee  2f0b                 move.l    a3, -(a7)
  0014f0  2f03                 move.l    d3, -(a7)
  0014f2  61fffffffc7c         bsr.l     $1170   ; DoubleBlit68K
  0014f8  4fef0014             lea.l     $14(a7), a7
  0014fc  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  001500  4e5e                 unlk      a6
  001502  4e740014             rtd       #$14

;-------------------------------------------------------------
; BLITENCFACETOPIXMAP   (seg 2 +00151c, 258 bytes)
  00151c  4e56fff4             link.w    a6, #$fff4
  001520  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  001524  246e0014             movea.l   $14(a6), a2
  001528  3639000046b2         move.w    $46b2.l, d3   ; g_46b2
  00152e  554f                 subq.w    #$2, a7
  001530  2f0a                 move.l    a2, -(a7)
  001532  203c00040001         move.l    #$40001, d0
  001538  ab1d                 _QDExtensions 
  00153a  101f                 move.b    (a7)+, d0
  00153c  2052                 movea.l   (a2), a0
  00153e  3e280004             move.w    $4(a0), d7
  001542  028700003fff         andi.l    #$3fff, d7
  001548  42aefffc             clr.l     -$4(a6)
  00154c  302e000c             move.w    $c(a6), d0
  001550  48c0                 ext.l     d0
  001552  4c070000             mulu.l    d7, d0
  001556  2d40fff4             move.l    d0, -$c(a6)
  00155a  594f                 subq.w    #$4, a7
  00155c  2f0a                 move.l    a2, -(a7)
  00155e  203c0004000f         move.l    #$4000f, d0
  001564  ab1d                 _QDExtensions 
  001566  205f                 movea.l   (a7)+, a0
  001568  d1eefff4             adda.l    -$c(a6), a0
  00156c  d0ee000e             adda.w    $e(a6), a0
  001570  2848                 movea.l   a0, a4
  001572  246e0018             movea.l   $18(a6), a2
  001576  246a0010             movea.l   $10(a2), a2
  00157a  2452                 movea.l   (a2), a2
  00157c  508a                 addq.l    #$8, a2
  00157e  508a                 addq.l    #$8, a2
  001580  7c00                 moveq     #$0, d6
  001582  6000008a             bra.w     $160e
  001586  2612                 move.l    (a2), d3
  001588  7218                 moveq     #$18, d1
  00158a  e2ab                 lsr.l     d1, d3
  00158c  2812                 move.l    (a2), d4
  00158e  028400ffffff         andi.l    #$ffffff, d4
  001594  588a                 addq.l    #$4, a2
  001596  2003                 move.l    d3, d0
  001598  676e                 beq.b     $1608
  00159a  5380                 subq.l    #$1, d0
  00159c  675e                 beq.b     $15fc
  00159e  5380                 subq.l    #$1, d0
  0015a0  6706                 beq.b     $15a8
  0015a2  5380                 subq.l    #$1, d0
  0015a4  6750                 beq.b     $15f6
  0015a6  6064                 bra.b     $160c
  0015a8  2604                 move.l    d4, d3
  0015aa  42aefff8             clr.l     -$8(a6)
  0015ae  da83                 add.l     d3, d5
  0015b0  6008                 bra.b     $15ba
  0015b2  2692                 move.l    (a2), (a3)
  0015b4  588b                 addq.l    #$4, a3
  0015b6  588a                 addq.l    #$4, a2
  0015b8  5983                 subq.l    #$4, d3
  0015ba  7004                 moveq     #$4, d0
  0015bc  b680                 cmp.l     d0, d3
  0015be  64f2                 bcc.b     $15b2
  0015c0  7002                 moveq     #$2, d0
  0015c2  b680                 cmp.l     d0, d3
  0015c4  6508                 bcs.b     $15ce
  0015c6  3692                 move.w    (a2), (a3)
  0015c8  548b                 addq.l    #$2, a3
  0015ca  548a                 addq.l    #$2, a2
  0015cc  5583                 subq.l    #$2, d3
  0015ce  7001                 moveq     #$1, d0
  0015d0  b680                 cmp.l     d0, d3
  0015d2  6508                 bcs.b     $15dc
  0015d4  1692                 move.b    (a2), (a3)
  0015d6  528b                 addq.l    #$1, a3
  0015d8  528a                 addq.l    #$1, a2
  0015da  5383                 subq.l    #$1, d3
  0015dc  7003                 moveq     #$3, d0
  0015de  c084                 and.l     d4, d0
  0015e0  4a80                 tst.l     d0
  0015e2  6604                 bne.b     $15e8
  0015e4  7000                 moveq     #$0, d0
  0015e6  600a                 bra.b     $15f2
  0015e8  7003                 moveq     #$3, d0
  0015ea  c084                 and.l     d4, d0
  0015ec  7204                 moveq     #$4, d1
  0015ee  9280                 sub.l     d0, d1
  0015f0  2001                 move.l    d1, d0
  0015f2  d5c0                 adda.l    d0, a2
  0015f4  6018                 bra.b     $160e
  0015f6  d7c4                 adda.l    d4, a3
  0015f8  da84                 add.l     d4, d5
  0015fa  6012                 bra.b     $160e
  0015fc  264c                 movea.l   a4, a3
  0015fe  d9c7                 adda.l    d7, a4
  001600  52aefffc             addq.l    #$1, -$4(a6)
  001604  7a00                 moveq     #$0, d5
  001606  6006                 bra.b     $160e
  001608  7c01                 moveq     #$1, d6
  00160a  6002                 bra.b     $160e
  00160c  a9ff                 _Debugger 
  00160e  4a06                 tst.b     d6
  001610  6700ff74             beq.w     $1586
  001614  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001618  4e5e                 unlk      a6
  00161a  4e740014             rtd       #$14

;-------------------------------------------------------------
; BLITENCFACECLIP   (seg 2 +001634, 676 bytes)
  001634  4e56fff0             link.w    a6, #$fff0
  001638  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  00163c  246e0014             movea.l   $14(a6), a2
  001640  3a2e000a             move.w    $a(a6), d5
  001644  362e0008             move.w    $8(a6), d3
  001648  306a0018             movea.w   $18(a2), a0
  00164c  2d48fff4             move.l    a0, -$c(a6)
  001650  3c39000046b2         move.w    $46b2.l, d6   ; g_46b2
  001656  4a6e000e             tst.w     $e(a6)
  00165a  6c24                 bge.b     $1680
  00165c  302e000e             move.w    $e(a6), d0
  001660  48c0                 ext.l     d0
  001662  322e0012             move.w    $12(a6), d1
  001666  48c1                 ext.l     d1
  001668  9280                 sub.l     d0, d1
  00166a  3d410012             move.w    d1, $12(a6)
  00166e  302e000e             move.w    $e(a6), d0
  001672  48c0                 ext.l     d0
  001674  3205                 move.w    d5, d1
  001676  48c1                 ext.l     d1
  001678  d280                 add.l     d0, d1
  00167a  3a01                 move.w    d1, d5
  00167c  426e000e             clr.w     $e(a6)
  001680  4a6e000c             tst.w     $c(a6)
  001684  6c24                 bge.b     $16aa
  001686  302e000c             move.w    $c(a6), d0
  00168a  48c0                 ext.l     d0
  00168c  322e0010             move.w    $10(a6), d1
  001690  48c1                 ext.l     d1
  001692  9280                 sub.l     d0, d1
  001694  3d410010             move.w    d1, $10(a6)
  001698  302e000c             move.w    $c(a6), d0
  00169c  48c0                 ext.l     d0
  00169e  3203                 move.w    d3, d1
  0016a0  48c1                 ext.l     d1
  0016a2  d280                 add.l     d0, d1
  0016a4  3601                 move.w    d1, d3
  0016a6  426e000c             clr.w     $c(a6)
  0016aa  302a0012             move.w    $12(a2), d0
  0016ae  48c0                 ext.l     d0
  0016b0  3205                 move.w    d5, d1
  0016b2  48c1                 ext.l     d1
  0016b4  342e000e             move.w    $e(a6), d2
  0016b8  48c2                 ext.l     d2
  0016ba  d481                 add.l     d1, d2
  0016bc  b480                 cmp.l     d0, d2
  0016be  6d0e                 blt.b     $16ce
  0016c0  302e000e             move.w    $e(a6), d0
  0016c4  48c0                 ext.l     d0
  0016c6  3a2a0012             move.w    $12(a2), d5
  0016ca  48c5                 ext.l     d5
  0016cc  9a80                 sub.l     d0, d5
  0016ce  302a0010             move.w    $10(a2), d0
  0016d2  48c0                 ext.l     d0
  0016d4  3203                 move.w    d3, d1
  0016d6  48c1                 ext.l     d1
  0016d8  342e000c             move.w    $c(a6), d2
  0016dc  48c2                 ext.l     d2
  0016de  d481                 add.l     d1, d2
  0016e0  b480                 cmp.l     d0, d2
  0016e2  6d0e                 blt.b     $16f2
  0016e4  302e000c             move.w    $c(a6), d0
  0016e8  48c0                 ext.l     d0
  0016ea  362a0010             move.w    $10(a2), d3
  0016ee  48c3                 ext.l     d3
  0016f0  9680                 sub.l     d0, d3
  0016f2  3c2e0012             move.w    $12(a6), d6
  0016f6  3005                 move.w    d5, d0
  0016f8  48c0                 ext.l     d0
  0016fa  322e0012             move.w    $12(a6), d1
  0016fe  48c1                 ext.l     d1
  001700  d280                 add.l     d0, d1
  001702  3d41fffc             move.w    d1, -$4(a6)
  001706  3d6e0010fff2         move.w    $10(a6), -$e(a6)
  00170c  3003                 move.w    d3, d0
  00170e  48c0                 ext.l     d0
  001710  322e0010             move.w    $10(a6), d1
  001714  48c1                 ext.l     d1
  001716  d280                 add.l     d0, d1
  001718  3d41fff0             move.w    d1, -$10(a6)
  00171c  99cc                 suba.l    a4, a4
  00171e  4a6e0012             tst.w     $12(a6)
  001722  6f08                 ble.b     $172c
  001724  302e0012             move.w    $12(a6), d0
  001728  916e000e             sub.w     d0, $e(a6)
  00172c  4a6e0010             tst.w     $10(a6)
  001730  6f08                 ble.b     $173a
  001732  302e0010             move.w    $10(a6), d0
  001736  916e000c             sub.w     d0, $c(a6)
  00173a  302e000c             move.w    $c(a6), d0
  00173e  48c0                 ext.l     d0
  001740  4c2e0000fff4         mulu.l    -$c(a6), d0
  001746  d0aa0014             add.l     $14(a2), d0
  00174a  322e000e             move.w    $e(a6), d1
  00174e  48c1                 ext.l     d1
  001750  d280                 add.l     d0, d1
  001752  2d41fff8             move.l    d1, -$8(a6)
  001756  246e0018             movea.l   $18(a6), a2
  00175a  246a0010             movea.l   $10(a2), a2
  00175e  2452                 movea.l   (a2), a2
  001760  508a                 addq.l    #$8, a2
  001762  508a                 addq.l    #$8, a2
  001764  422effff             clr.b     -$1(a6)
  001768  6000015c             bra.w     $18c6
  00176c  2612                 move.l    (a2), d3
  00176e  7218                 moveq     #$18, d1
  001770  e2ab                 lsr.l     d1, d3
  001772  2a12                 move.l    (a2), d5
  001774  028500ffffff         andi.l    #$ffffff, d5
  00177a  588a                 addq.l    #$4, a2
  00177c  2003                 move.l    d3, d0
  00177e  6700013c             beq.w     $18bc
  001782  5380                 subq.l    #$1, d0
  001784  67000108             beq.w     $188e
  001788  5380                 subq.l    #$1, d0
  00178a  670a                 beq.b     $1796
  00178c  5380                 subq.l    #$1, d0
  00178e  670000f8             beq.w     $1888
  001792  60000130             bra.w     $18c4
  001796  2605                 move.l    d5, d3
  001798  7e00                 moveq     #$0, d7
  00179a  7000                 moveq     #$0, d0
  00179c  3006                 move.w    d6, d0
  00179e  b880                 cmp.l     d0, d4
  0017a0  644c                 bcc.b     $17ee
  0017a2  7000                 moveq     #$0, d0
  0017a4  3006                 move.w    d6, d0
  0017a6  9084                 sub.l     d4, d0
  0017a8  b680                 cmp.l     d0, d3
  0017aa  6422                 bcc.b     $17ce
  0017ac  d7c3                 adda.l    d3, a3
  0017ae  d5c3                 adda.l    d3, a2
  0017b0  7003                 moveq     #$3, d0
  0017b2  c085                 and.l     d5, d0
  0017b4  4a80                 tst.l     d0
  0017b6  6604                 bne.b     $17bc
  0017b8  7000                 moveq     #$0, d0
  0017ba  600a                 bra.b     $17c6
  0017bc  7003                 moveq     #$3, d0
  0017be  c085                 and.l     d5, d0
  0017c0  7204                 moveq     #$4, d1
  0017c2  9280                 sub.l     d0, d1
  0017c4  2001                 move.l    d1, d0
  0017c6  d5c0                 adda.l    d0, a2
  0017c8  d883                 add.l     d3, d4
  0017ca  600000fa             bra.w     $18c6
  0017ce  7000                 moveq     #$0, d0
  0017d0  3006                 move.w    d6, d0
  0017d2  9084                 sub.l     d4, d0
  0017d4  9680                 sub.l     d0, d3
  0017d6  7000                 moveq     #$0, d0
  0017d8  3006                 move.w    d6, d0
  0017da  9084                 sub.l     d4, d0
  0017dc  d7c0                 adda.l    d0, a3
  0017de  7000                 moveq     #$0, d0
  0017e0  3006                 move.w    d6, d0
  0017e2  9084                 sub.l     d4, d0
  0017e4  d5c0                 adda.l    d0, a2
  0017e6  7000                 moveq     #$0, d0
  0017e8  3006                 move.w    d6, d0
  0017ea  9084                 sub.l     d4, d0
  0017ec  d880                 add.l     d0, d4
  0017ee  7000                 moveq     #$0, d0
  0017f0  302efffc             move.w    -$4(a6), d0
  0017f4  2204                 move.l    d4, d1
  0017f6  d283                 add.l     d3, d1
  0017f8  b280                 cmp.l     d0, d1
  0017fa  633e                 bls.b     $183a
  0017fc  7000                 moveq     #$0, d0
  0017fe  302efffc             move.w    -$4(a6), d0
  001802  b880                 cmp.l     d0, d4
  001804  6322                 bls.b     $1828
  001806  d7c3                 adda.l    d3, a3
  001808  d5c3                 adda.l    d3, a2
  00180a  7003                 moveq     #$3, d0
  00180c  c085                 and.l     d5, d0
  00180e  4a80                 tst.l     d0
  001810  6604                 bne.b     $1816
  001812  7000                 moveq     #$0, d0
  001814  600a                 bra.b     $1820
  001816  7003                 moveq     #$3, d0
  001818  c085                 and.l     d5, d0
  00181a  7204                 moveq     #$4, d1
  00181c  9280                 sub.l     d0, d1
  00181e  2001                 move.l    d1, d0
  001820  d5c0                 adda.l    d0, a2
  001822  d883                 add.l     d3, d4
  001824  600000a0             bra.w     $18c6
  001828  2e03                 move.l    d3, d7
  00182a  2004                 move.l    d4, d0
  00182c  d083                 add.l     d3, d0
  00182e  7200                 moveq     #$0, d1
  001830  322efffc             move.w    -$4(a6), d1
  001834  9081                 sub.l     d1, d0
  001836  9680                 sub.l     d0, d3
  001838  9e83                 sub.l     d3, d7
  00183a  d883                 add.l     d3, d4
  00183c  6008                 bra.b     $1846
  00183e  2692                 move.l    (a2), (a3)
  001840  588b                 addq.l    #$4, a3
  001842  588a                 addq.l    #$4, a2
  001844  5983                 subq.l    #$4, d3
  001846  7004                 moveq     #$4, d0
  001848  b680                 cmp.l     d0, d3
  00184a  64f2                 bcc.b     $183e
  00184c  7002                 moveq     #$2, d0
  00184e  b680                 cmp.l     d0, d3
  001850  6508                 bcs.b     $185a
  001852  3692                 move.w    (a2), (a3)
  001854  548b                 addq.l    #$2, a3
  001856  548a                 addq.l    #$2, a2
  001858  5583                 subq.l    #$2, d3
  00185a  7001                 moveq     #$1, d0
  00185c  b680                 cmp.l     d0, d3
  00185e  6508                 bcs.b     $1868
  001860  1692                 move.b    (a2), (a3)
  001862  528b                 addq.l    #$1, a3
  001864  528a                 addq.l    #$1, a2
  001866  5383                 subq.l    #$1, d3
  001868  d7c7                 adda.l    d7, a3
  00186a  d5c7                 adda.l    d7, a2
  00186c  d887                 add.l     d7, d4
  00186e  7003                 moveq     #$3, d0
  001870  c085                 and.l     d5, d0
  001872  4a80                 tst.l     d0
  001874  6604                 bne.b     $187a
  001876  7000                 moveq     #$0, d0
  001878  600a                 bra.b     $1884
  00187a  7003                 moveq     #$3, d0
  00187c  c085                 and.l     d5, d0
  00187e  7204                 moveq     #$4, d1
  001880  9280                 sub.l     d0, d1
  001882  2001                 move.l    d1, d0
  001884  d5c0                 adda.l    d0, a2
  001886  603e                 bra.b     $18c6
  001888  d7c5                 adda.l    d5, a3
  00188a  d885                 add.l     d5, d4
  00188c  6038                 bra.b     $18c6
  00188e  7000                 moveq     #$0, d0
  001890  302efff2             move.w    -$e(a6), d0
  001894  b9c0                 cmpa.l    d0, a4
  001896  6402                 bcc.b     $189a
  001898  d5c5                 adda.l    d5, a2
  00189a  266efff8             movea.l   -$8(a6), a3
  00189e  202efff4             move.l    -$c(a6), d0
  0018a2  d1aefff8             add.l     d0, -$8(a6)
  0018a6  528c                 addq.l    #$1, a4
  0018a8  7800                 moveq     #$0, d4
  0018aa  7000                 moveq     #$0, d0
  0018ac  302efff0             move.w    -$10(a6), d0
  0018b0  b9c0                 cmpa.l    d0, a4
  0018b2  6312                 bls.b     $18c6
  0018b4  1d7c0001ffff         move.b    #$1, -$1(a6)
  0018ba  600a                 bra.b     $18c6
  0018bc  1d7c0001ffff         move.b    #$1, -$1(a6)
  0018c2  6002                 bra.b     $18c6
  0018c4  a9ff                 _Debugger 
  0018c6  4a2effff             tst.b     -$1(a6)
  0018ca  6700fea0             beq.w     $176c
  0018ce  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0018d2  4e5e                 unlk      a6
  0018d4  4e740014             rtd       #$14

;-------------------------------------------------------------
; BLITENCFACENOCLIP   (seg 2 +0018ea, 224 bytes)
  0018ea  4e56fff8             link.w    a6, #$fff8
  0018ee  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0018f2  246e0014             movea.l   $14(a6), a2
  0018f6  306a0018             movea.w   $18(a2), a0
  0018fa  2e08                 move.l    a0, d7
  0018fc  3639000046b2         move.w    $46b2.l, d3   ; g_46b2
  001902  42aefffc             clr.l     -$4(a6)
  001906  302e000c             move.w    $c(a6), d0
  00190a  48c0                 ext.l     d0
  00190c  4c070000             mulu.l    d7, d0
  001910  d0aa0014             add.l     $14(a2), d0
  001914  322e000e             move.w    $e(a6), d1
  001918  48c1                 ext.l     d1
  00191a  d280                 add.l     d0, d1
  00191c  2841                 movea.l   d1, a4
  00191e  246e0018             movea.l   $18(a6), a2
  001922  246a0010             movea.l   $10(a2), a2
  001926  2452                 movea.l   (a2), a2
  001928  508a                 addq.l    #$8, a2
  00192a  508a                 addq.l    #$8, a2
  00192c  7c00                 moveq     #$0, d6
  00192e  6000008a             bra.w     $19ba
  001932  2612                 move.l    (a2), d3
  001934  7218                 moveq     #$18, d1
  001936  e2ab                 lsr.l     d1, d3
  001938  2812                 move.l    (a2), d4
  00193a  028400ffffff         andi.l    #$ffffff, d4
  001940  588a                 addq.l    #$4, a2
  001942  2003                 move.l    d3, d0
  001944  676e                 beq.b     $19b4
  001946  5380                 subq.l    #$1, d0
  001948  675e                 beq.b     $19a8
  00194a  5380                 subq.l    #$1, d0
  00194c  6706                 beq.b     $1954
  00194e  5380                 subq.l    #$1, d0
  001950  6750                 beq.b     $19a2
  001952  6064                 bra.b     $19b8
  001954  2604                 move.l    d4, d3
  001956  42aefff8             clr.l     -$8(a6)
  00195a  da83                 add.l     d3, d5
  00195c  6008                 bra.b     $1966
  00195e  2692                 move.l    (a2), (a3)
  001960  588b                 addq.l    #$4, a3
  001962  588a                 addq.l    #$4, a2
  001964  5983                 subq.l    #$4, d3
  001966  7004                 moveq     #$4, d0
  001968  b680                 cmp.l     d0, d3
  00196a  64f2                 bcc.b     $195e
  00196c  7002                 moveq     #$2, d0
  00196e  b680                 cmp.l     d0, d3
  001970  6508                 bcs.b     $197a
  001972  3692                 move.w    (a2), (a3)
  001974  548b                 addq.l    #$2, a3
  001976  548a                 addq.l    #$2, a2
  001978  5583                 subq.l    #$2, d3
  00197a  7001                 moveq     #$1, d0
  00197c  b680                 cmp.l     d0, d3
  00197e  6508                 bcs.b     $1988
  001980  1692                 move.b    (a2), (a3)
  001982  528b                 addq.l    #$1, a3
  001984  528a                 addq.l    #$1, a2
  001986  5383                 subq.l    #$1, d3
  001988  7003                 moveq     #$3, d0
  00198a  c084                 and.l     d4, d0
  00198c  4a80                 tst.l     d0
  00198e  6604                 bne.b     $1994
  001990  7000                 moveq     #$0, d0
  001992  600a                 bra.b     $199e
  001994  7003                 moveq     #$3, d0
  001996  c084                 and.l     d4, d0
  001998  7204                 moveq     #$4, d1
  00199a  9280                 sub.l     d0, d1
  00199c  2001                 move.l    d1, d0
  00199e  d5c0                 adda.l    d0, a2
  0019a0  6018                 bra.b     $19ba
  0019a2  d7c4                 adda.l    d4, a3
  0019a4  da84                 add.l     d4, d5
  0019a6  6012                 bra.b     $19ba
  0019a8  264c                 movea.l   a4, a3
  0019aa  d9c7                 adda.l    d7, a4
  0019ac  52aefffc             addq.l    #$1, -$4(a6)
  0019b0  7a00                 moveq     #$0, d5
  0019b2  6006                 bra.b     $19ba
  0019b4  7c01                 moveq     #$1, d6
  0019b6  6002                 bra.b     $19ba
  0019b8  a9ff                 _Debugger 
  0019ba  4a06                 tst.b     d6
  0019bc  6700ff74             beq.w     $1932
  0019c0  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0019c4  4e5e                 unlk      a6
  0019c6  4e740014             rtd       #$14

;-------------------------------------------------------------
; BLITENCFACESPECIALCLIP   (seg 2 +0019de, 890 bytes)
  0019de  4e56ffe6             link.w    a6, #$ffe6
  0019e2  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0019e6  266e0018             movea.l   $18(a6), a3
  0019ea  382e000e             move.w    $e(a6), d4
  0019ee  362e000c             move.w    $c(a6), d3
  0019f2  3c2e0008             move.w    $8(a6), d6
  0019f6  306b0018             movea.w   $18(a3), a0
  0019fa  2d48ffea             move.l    a0, -$16(a6)
  0019fe  3a39000046b2         move.w    $46b2.l, d5   ; g_46b2
  001a04  4a6e0012             tst.w     $12(a6)
  001a08  6c24                 bge.b     $1a2e
  001a0a  302e0012             move.w    $12(a6), d0
  001a0e  48c0                 ext.l     d0
  001a10  322e0016             move.w    $16(a6), d1
  001a14  48c1                 ext.l     d1
  001a16  9280                 sub.l     d0, d1
  001a18  3d410016             move.w    d1, $16(a6)
  001a1c  302e0012             move.w    $12(a6), d0
  001a20  48c0                 ext.l     d0
  001a22  3204                 move.w    d4, d1
  001a24  48c1                 ext.l     d1
  001a26  d280                 add.l     d0, d1
  001a28  3801                 move.w    d1, d4
  001a2a  426e0012             clr.w     $12(a6)
  001a2e  4a6e0010             tst.w     $10(a6)
  001a32  6c24                 bge.b     $1a58
  001a34  302e0010             move.w    $10(a6), d0
  001a38  48c0                 ext.l     d0
  001a3a  322e0014             move.w    $14(a6), d1
  001a3e  48c1                 ext.l     d1
  001a40  9280                 sub.l     d0, d1
  001a42  3d410014             move.w    d1, $14(a6)
  001a46  302e0010             move.w    $10(a6), d0
  001a4a  48c0                 ext.l     d0
  001a4c  3203                 move.w    d3, d1
  001a4e  48c1                 ext.l     d1
  001a50  d280                 add.l     d0, d1
  001a52  3601                 move.w    d1, d3
  001a54  426e0010             clr.w     $10(a6)
  001a58  302b0012             move.w    $12(a3), d0
  001a5c  48c0                 ext.l     d0
  001a5e  3204                 move.w    d4, d1
  001a60  48c1                 ext.l     d1
  001a62  342e0012             move.w    $12(a6), d2
  001a66  48c2                 ext.l     d2
  001a68  d481                 add.l     d1, d2
  001a6a  b480                 cmp.l     d0, d2
  001a6c  6d0e                 blt.b     $1a7c
  001a6e  302e0012             move.w    $12(a6), d0
  001a72  48c0                 ext.l     d0
  001a74  382b0012             move.w    $12(a3), d4
  001a78  48c4                 ext.l     d4
  001a7a  9880                 sub.l     d0, d4
  001a7c  302b0010             move.w    $10(a3), d0
  001a80  48c0                 ext.l     d0
  001a82  3203                 move.w    d3, d1
  001a84  48c1                 ext.l     d1
  001a86  342e0010             move.w    $10(a6), d2
  001a8a  48c2                 ext.l     d2
  001a8c  d481                 add.l     d1, d2
  001a8e  b480                 cmp.l     d0, d2
  001a90  6d0e                 blt.b     $1aa0
  001a92  302e0010             move.w    $10(a6), d0
  001a96  48c0                 ext.l     d0
  001a98  362b0010             move.w    $10(a3), d3
  001a9c  48c3                 ext.l     d3
  001a9e  9680                 sub.l     d0, d3
  001aa0  3d6e0016fffe         move.w    $16(a6), -$2(a6)
  001aa6  3004                 move.w    d4, d0
  001aa8  48c0                 ext.l     d0
  001aaa  322e0016             move.w    $16(a6), d1
  001aae  48c1                 ext.l     d1
  001ab0  d280                 add.l     d0, d1
  001ab2  3d41fff2             move.w    d1, -$e(a6)
  001ab6  3d6e0014ffe8         move.w    $14(a6), -$18(a6)
  001abc  3003                 move.w    d3, d0
  001abe  48c0                 ext.l     d0
  001ac0  322e0014             move.w    $14(a6), d1
  001ac4  48c1                 ext.l     d1
  001ac6  d280                 add.l     d0, d1
  001ac8  3d41ffe6             move.w    d1, -$1a(a6)
  001acc  42aefff4             clr.l     -$c(a6)
  001ad0  4a6e0016             tst.w     $16(a6)
  001ad4  6f08                 ble.b     $1ade
  001ad6  302e0016             move.w    $16(a6), d0
  001ada  916e0012             sub.w     d0, $12(a6)
  001ade  4a6e0014             tst.w     $14(a6)
  001ae2  6f08                 ble.b     $1aec
  001ae4  302e0014             move.w    $14(a6), d0
  001ae8  916e0010             sub.w     d0, $10(a6)
  001aec  302e0010             move.w    $10(a6), d0
  001af0  48c0                 ext.l     d0
  001af2  4c2e0000ffea         mulu.l    -$16(a6), d0
  001af8  d0ab0014             add.l     $14(a3), d0
  001afc  322e0012             move.w    $12(a6), d1
  001b00  48c1                 ext.l     d1
  001b02  d280                 add.l     d0, d1
  001b04  2d41ffee             move.l    d1, -$12(a6)
  001b08  266e001c             movea.l   $1c(a6), a3
  001b0c  266b0010             movea.l   $10(a3), a3
  001b10  2653                 movea.l   (a3), a3
  001b12  508b                 addq.l    #$8, a3
  001b14  508b                 addq.l    #$8, a3
  001b16  422efff9             clr.b     -$7(a6)
  001b1a  6000022a             bra.w     $1d46
  001b1e  2613                 move.l    (a3), d3
  001b20  7218                 moveq     #$18, d1
  001b22  e2ab                 lsr.l     d1, d3
  001b24  2013                 move.l    (a3), d0
  001b26  028000ffffff         andi.l    #$ffffff, d0
  001b2c  2840                 movea.l   d0, a4
  001b2e  588b                 addq.l    #$4, a3
  001b30  2003                 move.l    d3, d0
  001b32  67000208             beq.w     $1d3c
  001b36  5380                 subq.l    #$1, d0
  001b38  670001ce             beq.w     $1d08
  001b3c  5380                 subq.l    #$1, d0
  001b3e  670a                 beq.b     $1b4a
  001b40  5380                 subq.l    #$1, d0
  001b42  670001be             beq.w     $1d02
  001b46  600001fc             bra.w     $1d44
  001b4a  260c                 move.l    a4, d3
  001b4c  42aefffa             clr.l     -$6(a6)
  001b50  7000                 moveq     #$0, d0
  001b52  302efffe             move.w    -$2(a6), d0
  001b56  be80                 cmp.l     d0, d7
  001b58  6458                 bcc.b     $1bb2
  001b5a  7000                 moveq     #$0, d0
  001b5c  302efffe             move.w    -$2(a6), d0
  001b60  9087                 sub.l     d7, d0
  001b62  b680                 cmp.l     d0, d3
  001b64  6424                 bcc.b     $1b8a
  001b66  d5c3                 adda.l    d3, a2
  001b68  d7c3                 adda.l    d3, a3
  001b6a  7003                 moveq     #$3, d0
  001b6c  220c                 move.l    a4, d1
  001b6e  c280                 and.l     d0, d1
  001b70  4a81                 tst.l     d1
  001b72  6604                 bne.b     $1b78
  001b74  7000                 moveq     #$0, d0
  001b76  600a                 bra.b     $1b82
  001b78  7003                 moveq     #$3, d0
  001b7a  220c                 move.l    a4, d1
  001b7c  c280                 and.l     d0, d1
  001b7e  7004                 moveq     #$4, d0
  001b80  9081                 sub.l     d1, d0
  001b82  d7c0                 adda.l    d0, a3
  001b84  de83                 add.l     d3, d7
  001b86  600001be             bra.w     $1d46
  001b8a  7000                 moveq     #$0, d0
  001b8c  302efffe             move.w    -$2(a6), d0
  001b90  9087                 sub.l     d7, d0
  001b92  9680                 sub.l     d0, d3
  001b94  7000                 moveq     #$0, d0
  001b96  302efffe             move.w    -$2(a6), d0
  001b9a  9087                 sub.l     d7, d0
  001b9c  d5c0                 adda.l    d0, a2
  001b9e  7000                 moveq     #$0, d0
  001ba0  302efffe             move.w    -$2(a6), d0
  001ba4  9087                 sub.l     d7, d0
  001ba6  d7c0                 adda.l    d0, a3
  001ba8  7000                 moveq     #$0, d0
  001baa  302efffe             move.w    -$2(a6), d0
  001bae  9087                 sub.l     d7, d0
  001bb0  de80                 add.l     d0, d7
  001bb2  7000                 moveq     #$0, d0
  001bb4  302efff2             move.w    -$e(a6), d0
  001bb8  2207                 move.l    d7, d1
  001bba  d283                 add.l     d3, d1
  001bbc  b280                 cmp.l     d0, d1
  001bbe  6344                 bls.b     $1c04
  001bc0  7000                 moveq     #$0, d0
  001bc2  302efff2             move.w    -$e(a6), d0
  001bc6  be80                 cmp.l     d0, d7
  001bc8  6324                 bls.b     $1bee
  001bca  d5c3                 adda.l    d3, a2
  001bcc  d7c3                 adda.l    d3, a3
  001bce  7003                 moveq     #$3, d0
  001bd0  220c                 move.l    a4, d1
  001bd2  c280                 and.l     d0, d1
  001bd4  4a81                 tst.l     d1
  001bd6  6604                 bne.b     $1bdc
  001bd8  7000                 moveq     #$0, d0
  001bda  600a                 bra.b     $1be6
  001bdc  7003                 moveq     #$3, d0
  001bde  220c                 move.l    a4, d1
  001be0  c280                 and.l     d0, d1
  001be2  7004                 moveq     #$4, d0
  001be4  9081                 sub.l     d1, d0
  001be6  d7c0                 adda.l    d0, a3
  001be8  de83                 add.l     d3, d7
  001bea  6000015a             bra.w     $1d46
  001bee  2d43fffa             move.l    d3, -$6(a6)
  001bf2  2007                 move.l    d7, d0
  001bf4  d083                 add.l     d3, d0
  001bf6  7200                 moveq     #$0, d1
  001bf8  322efff2             move.w    -$e(a6), d1
  001bfc  9081                 sub.l     d1, d0
  001bfe  9680                 sub.l     d0, d3
  001c00  97aefffa             sub.l     d3, -$6(a6)
  001c04  de83                 add.l     d3, d7
  001c06  302e000a             move.w    $a(a6), d0
  001c0a  48c0                 ext.l     d0
  001c0c  5380                 subq.l    #$1, d0
  001c0e  6736                 beq.b     $1c46
  001c10  5380                 subq.l    #$1, d0
  001c12  676c                 beq.b     $1c80
  001c14  5380                 subq.l    #$1, d0
  001c16  67000092             beq.w     $1caa
  001c1a  5380                 subq.l    #$1, d0
  001c1c  670000b6             beq.w     $1cd4
  001c20  600000b8             bra.w     $1cda
  001c24  1813                 move.b    (a3), d4
  001c26  3046                 movea.w   d6, a0
  001c28  2008                 move.l    a0, d0
  001c2a  7209                 moveq     #$9, d1
  001c2c  e3a8                 lsl.l     d1, d0
  001c2e  41f900008482         lea.l     $8482.l, a0   ; g_8482
  001c34  d1c0                 adda.l    d0, a0
  001c36  7000                 moveq     #$0, d0
  001c38  1004                 move.b    d4, d0
  001c3a  30300a00             move.w    (a0, d0.l * 2), d0
  001c3e  1480                 move.b    d0, (a2)
  001c40  528a                 addq.l    #$1, a2
  001c42  528b                 addq.l    #$1, a3
  001c44  5383                 subq.l    #$1, d3
  001c46  7001                 moveq     #$1, d0
  001c48  b680                 cmp.l     d0, d3
  001c4a  64d8                 bcc.b     $1c24
  001c4c  6000008c             bra.w     $1cda
  001c50  1813                 move.b    (a3), d4
  001c52  1a12                 move.b    (a2), d5
  001c54  7000                 moveq     #$0, d0
  001c56  1004                 move.b    d4, d0
  001c58  41f90000f482         lea.l     $f482.l, a0   ; g_f482
  001c5e  32700a00             movea.w   (a0, d0.l * 2), a1
  001c62  2009                 move.l    a1, d0
  001c64  7209                 moveq     #$9, d1
  001c66  e3a8                 lsl.l     d1, d0
  001c68  41f90000a482         lea.l     $a482.l, a0   ; g_a482
  001c6e  d1c0                 adda.l    d0, a0
  001c70  7000                 moveq     #$0, d0
  001c72  1005                 move.b    d5, d0
  001c74  30300a00             move.w    (a0, d0.l * 2), d0
  001c78  1480                 move.b    d0, (a2)
  001c7a  528a                 addq.l    #$1, a2
  001c7c  528b                 addq.l    #$1, a3
  001c7e  5383                 subq.l    #$1, d3
  001c80  7001                 moveq     #$1, d0
  001c82  b680                 cmp.l     d0, d3
  001c84  64ca                 bcc.b     $1c50
  001c86  6052                 bra.b     $1cda
  001c88  1813                 move.b    (a3), d4
  001c8a  3046                 movea.w   d6, a0
  001c8c  2008                 move.l    a0, d0
  001c8e  7209                 moveq     #$9, d1
  001c90  e3a8                 lsl.l     d1, d0
  001c92  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  001c98  d1c0                 adda.l    d0, a0
  001c9a  7000                 moveq     #$0, d0
  001c9c  1004                 move.b    d4, d0
  001c9e  30300a00             move.w    (a0, d0.l * 2), d0
  001ca2  1480                 move.b    d0, (a2)
  001ca4  528a                 addq.l    #$1, a2
  001ca6  528b                 addq.l    #$1, a3
  001ca8  5383                 subq.l    #$1, d3
  001caa  7001                 moveq     #$1, d0
  001cac  b680                 cmp.l     d0, d3
  001cae  64d8                 bcc.b     $1c88
  001cb0  6028                 bra.b     $1cda
  001cb2  1813                 move.b    (a3), d4
  001cb4  3046                 movea.w   d6, a0
  001cb6  2008                 move.l    a0, d0
  001cb8  7209                 moveq     #$9, d1
  001cba  e3a8                 lsl.l     d1, d0
  001cbc  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  001cc2  d1c0                 adda.l    d0, a0
  001cc4  7000                 moveq     #$0, d0
  001cc6  1004                 move.b    d4, d0
  001cc8  30300a00             move.w    (a0, d0.l * 2), d0
  001ccc  1480                 move.b    d0, (a2)
  001cce  528a                 addq.l    #$1, a2
  001cd0  528b                 addq.l    #$1, a3
  001cd2  5383                 subq.l    #$1, d3
  001cd4  7001                 moveq     #$1, d0
  001cd6  b680                 cmp.l     d0, d3
  001cd8  64d8                 bcc.b     $1cb2
  001cda  d5eefffa             adda.l    -$6(a6), a2
  001cde  d7eefffa             adda.l    -$6(a6), a3
  001ce2  deaefffa             add.l     -$6(a6), d7
  001ce6  7003                 moveq     #$3, d0
  001ce8  220c                 move.l    a4, d1
  001cea  c280                 and.l     d0, d1
  001cec  4a81                 tst.l     d1
  001cee  6604                 bne.b     $1cf4
  001cf0  7000                 moveq     #$0, d0
  001cf2  600a                 bra.b     $1cfe
  001cf4  7003                 moveq     #$3, d0
  001cf6  220c                 move.l    a4, d1
  001cf8  c280                 and.l     d0, d1
  001cfa  7004                 moveq     #$4, d0
  001cfc  9081                 sub.l     d1, d0
  001cfe  d7c0                 adda.l    d0, a3
  001d00  6044                 bra.b     $1d46
  001d02  d5cc                 adda.l    a4, a2
  001d04  de8c                 add.l     a4, d7
  001d06  603e                 bra.b     $1d46
  001d08  7000                 moveq     #$0, d0
  001d0a  302effe8             move.w    -$18(a6), d0
  001d0e  b0aefff4             cmp.l     -$c(a6), d0
  001d12  6302                 bls.b     $1d16
  001d14  d7cc                 adda.l    a4, a3
  001d16  246effee             movea.l   -$12(a6), a2
  001d1a  202effea             move.l    -$16(a6), d0
  001d1e  d1aeffee             add.l     d0, -$12(a6)
  001d22  52aefff4             addq.l    #$1, -$c(a6)
  001d26  7e00                 moveq     #$0, d7
  001d28  7000                 moveq     #$0, d0
  001d2a  302effe6             move.w    -$1a(a6), d0
  001d2e  b0aefff4             cmp.l     -$c(a6), d0
  001d32  6412                 bcc.b     $1d46
  001d34  1d7c0001fff9         move.b    #$1, -$7(a6)
  001d3a  600a                 bra.b     $1d46
  001d3c  1d7c0001fff9         move.b    #$1, -$7(a6)
  001d42  6002                 bra.b     $1d46
  001d44  a9ff                 _Debugger 
  001d46  4a2efff9             tst.b     -$7(a6)
  001d4a  6700fdd2             beq.w     $1b1e
  001d4e  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001d52  4e5e                 unlk      a6
  001d54  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACESPECIALNOCLIP   (seg 2 +001d72, 424 bytes)
  001d72  4e56fff2             link.w    a6, #$fff2
  001d76  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  001d7a  266e0018             movea.l   $18(a6), a3
  001d7e  3c2e0008             move.w    $8(a6), d6
  001d82  306b0018             movea.w   $18(a3), a0
  001d86  2d48fff6             move.l    a0, -$a(a6)
  001d8a  3639000046b2         move.w    $46b2.l, d3   ; g_46b2
  001d90  42aefff2             clr.l     -$e(a6)
  001d94  302e0010             move.w    $10(a6), d0
  001d98  48c0                 ext.l     d0
  001d9a  4c2e0000fff6         mulu.l    -$a(a6), d0
  001da0  d0ab0014             add.l     $14(a3), d0
  001da4  322e0012             move.w    $12(a6), d1
  001da8  48c1                 ext.l     d1
  001daa  d280                 add.l     d0, d1
  001dac  2d41fffc             move.l    d1, -$4(a6)
  001db0  266e001c             movea.l   $1c(a6), a3
  001db4  266b0010             movea.l   $10(a3), a3
  001db8  2653                 movea.l   (a3), a3
  001dba  508b                 addq.l    #$8, a3
  001dbc  508b                 addq.l    #$8, a3
  001dbe  422efffb             clr.b     -$5(a6)
  001dc2  60000144             bra.w     $1f08
  001dc6  2613                 move.l    (a3), d3
  001dc8  7218                 moveq     #$18, d1
  001dca  e2ab                 lsr.l     d1, d3
  001dcc  2e13                 move.l    (a3), d7
  001dce  028700ffffff         andi.l    #$ffffff, d7
  001dd4  588b                 addq.l    #$4, a3
  001dd6  2003                 move.l    d3, d0
  001dd8  67000124             beq.w     $1efe
  001ddc  5380                 subq.l    #$1, d0
  001dde  6700010a             beq.w     $1eea
  001de2  5380                 subq.l    #$1, d0
  001de4  670a                 beq.b     $1df0
  001de6  5380                 subq.l    #$1, d0
  001de8  670000fa             beq.w     $1ee4
  001dec  60000118             bra.w     $1f06
  001df0  2607                 move.l    d7, d3
  001df2  7800                 moveq     #$0, d4
  001df4  d9c3                 adda.l    d3, a4
  001df6  302e000a             move.w    $a(a6), d0
  001dfa  48c0                 ext.l     d0
  001dfc  5380                 subq.l    #$1, d0
  001dfe  6736                 beq.b     $1e36
  001e00  5380                 subq.l    #$1, d0
  001e02  676c                 beq.b     $1e70
  001e04  5380                 subq.l    #$1, d0
  001e06  67000092             beq.w     $1e9a
  001e0a  5380                 subq.l    #$1, d0
  001e0c  670000b6             beq.w     $1ec4
  001e10  600000b8             bra.w     $1eca
  001e14  1813                 move.b    (a3), d4
  001e16  3046                 movea.w   d6, a0
  001e18  2008                 move.l    a0, d0
  001e1a  7209                 moveq     #$9, d1
  001e1c  e3a8                 lsl.l     d1, d0
  001e1e  41f900008482         lea.l     $8482.l, a0   ; g_8482
  001e24  d1c0                 adda.l    d0, a0
  001e26  7000                 moveq     #$0, d0
  001e28  1004                 move.b    d4, d0
  001e2a  30300a00             move.w    (a0, d0.l * 2), d0
  001e2e  1480                 move.b    d0, (a2)
  001e30  528a                 addq.l    #$1, a2
  001e32  528b                 addq.l    #$1, a3
  001e34  5383                 subq.l    #$1, d3
  001e36  7001                 moveq     #$1, d0
  001e38  b680                 cmp.l     d0, d3
  001e3a  64d8                 bcc.b     $1e14
  001e3c  6000008c             bra.w     $1eca
  001e40  1813                 move.b    (a3), d4
  001e42  1a12                 move.b    (a2), d5
  001e44  7000                 moveq     #$0, d0
  001e46  1004                 move.b    d4, d0
  001e48  41f90000f482         lea.l     $f482.l, a0   ; g_f482
  001e4e  32700a00             movea.w   (a0, d0.l * 2), a1
  001e52  2009                 move.l    a1, d0
  001e54  7209                 moveq     #$9, d1
  001e56  e3a8                 lsl.l     d1, d0
  001e58  41f90000a482         lea.l     $a482.l, a0   ; g_a482
  001e5e  d1c0                 adda.l    d0, a0
  001e60  7000                 moveq     #$0, d0
  001e62  1005                 move.b    d5, d0
  001e64  30300a00             move.w    (a0, d0.l * 2), d0
  001e68  1480                 move.b    d0, (a2)
  001e6a  528a                 addq.l    #$1, a2
  001e6c  528b                 addq.l    #$1, a3
  001e6e  5383                 subq.l    #$1, d3
  001e70  7001                 moveq     #$1, d0
  001e72  b680                 cmp.l     d0, d3
  001e74  64ca                 bcc.b     $1e40
  001e76  6052                 bra.b     $1eca
  001e78  1813                 move.b    (a3), d4
  001e7a  3046                 movea.w   d6, a0
  001e7c  2008                 move.l    a0, d0
  001e7e  7209                 moveq     #$9, d1
  001e80  e3a8                 lsl.l     d1, d0
  001e82  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  001e88  d1c0                 adda.l    d0, a0
  001e8a  7000                 moveq     #$0, d0
  001e8c  1004                 move.b    d4, d0
  001e8e  30300a00             move.w    (a0, d0.l * 2), d0
  001e92  1480                 move.b    d0, (a2)
  001e94  528a                 addq.l    #$1, a2
  001e96  528b                 addq.l    #$1, a3
  001e98  5383                 subq.l    #$1, d3
  001e9a  7001                 moveq     #$1, d0
  001e9c  b680                 cmp.l     d0, d3
  001e9e  64d8                 bcc.b     $1e78
  001ea0  6028                 bra.b     $1eca
  001ea2  1813                 move.b    (a3), d4
  001ea4  3046                 movea.w   d6, a0
  001ea6  2008                 move.l    a0, d0
  001ea8  7209                 moveq     #$9, d1
  001eaa  e3a8                 lsl.l     d1, d0
  001eac  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  001eb2  d1c0                 adda.l    d0, a0
  001eb4  7000                 moveq     #$0, d0
  001eb6  1004                 move.b    d4, d0
  001eb8  30300a00             move.w    (a0, d0.l * 2), d0
  001ebc  1480                 move.b    d0, (a2)
  001ebe  528a                 addq.l    #$1, a2
  001ec0  528b                 addq.l    #$1, a3
  001ec2  5383                 subq.l    #$1, d3
  001ec4  7001                 moveq     #$1, d0
  001ec6  b680                 cmp.l     d0, d3
  001ec8  64d8                 bcc.b     $1ea2
  001eca  7003                 moveq     #$3, d0
  001ecc  c087                 and.l     d7, d0
  001ece  4a80                 tst.l     d0
  001ed0  6604                 bne.b     $1ed6
  001ed2  7000                 moveq     #$0, d0
  001ed4  600a                 bra.b     $1ee0
  001ed6  7003                 moveq     #$3, d0
  001ed8  c087                 and.l     d7, d0
  001eda  7204                 moveq     #$4, d1
  001edc  9280                 sub.l     d0, d1
  001ede  2001                 move.l    d1, d0
  001ee0  d7c0                 adda.l    d0, a3
  001ee2  6024                 bra.b     $1f08
  001ee4  d5c7                 adda.l    d7, a2
  001ee6  d9c7                 adda.l    d7, a4
  001ee8  601e                 bra.b     $1f08
  001eea  246efffc             movea.l   -$4(a6), a2
  001eee  202efff6             move.l    -$a(a6), d0
  001ef2  d1aefffc             add.l     d0, -$4(a6)
  001ef6  52aefff2             addq.l    #$1, -$e(a6)
  001efa  99cc                 suba.l    a4, a4
  001efc  600a                 bra.b     $1f08
  001efe  1d7c0001fffb         move.b    #$1, -$5(a6)
  001f04  6002                 bra.b     $1f08
  001f06  a9ff                 _Debugger 
  001f08  4a2efffb             tst.b     -$5(a6)
  001f0c  6700feb8             beq.w     $1dc6
  001f10  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001f14  4e5e                 unlk      a6
  001f16  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACESCALEDOWNCLIP   (seg 2 +001f36, 760 bytes)
  001f36  4e56ffe2             link.w    a6, #$ffe2
  001f3a  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  001f3e  266e0018             movea.l   $18(a6), a3
  001f42  3c2e000e             move.w    $e(a6), d6
  001f46  382e000c             move.w    $c(a6), d4
  001f4a  3e2e0008             move.w    $8(a6), d7
  001f4e  306b0018             movea.w   $18(a3), a0
  001f52  2d48ffec             move.l    a0, -$14(a6)
  001f56  7600                 moveq     #$0, d3
  001f58  426effe6             clr.w     -$1a(a6)
  001f5c  426efff0             clr.w     -$10(a6)
  001f60  426effe4             clr.w     -$1c(a6)
  001f64  3d79000046b2ffe2     move.w    $46b2.l, -$1e(a6)   ; g_46b2
  001f6c  ea47                 asr.w     #$5, d7
  001f6e  4a6e0012             tst.w     $12(a6)
  001f72  6c24                 bge.b     $1f98
  001f74  302e0012             move.w    $12(a6), d0
  001f78  48c0                 ext.l     d0
  001f7a  322e0016             move.w    $16(a6), d1
  001f7e  48c1                 ext.l     d1
  001f80  9280                 sub.l     d0, d1
  001f82  3d410016             move.w    d1, $16(a6)
  001f86  302e0012             move.w    $12(a6), d0
  001f8a  48c0                 ext.l     d0
  001f8c  3206                 move.w    d6, d1
  001f8e  48c1                 ext.l     d1
  001f90  d280                 add.l     d0, d1
  001f92  3c01                 move.w    d1, d6
  001f94  426e0012             clr.w     $12(a6)
  001f98  4a6e0010             tst.w     $10(a6)
  001f9c  6c24                 bge.b     $1fc2
  001f9e  302e0010             move.w    $10(a6), d0
  001fa2  48c0                 ext.l     d0
  001fa4  322e0014             move.w    $14(a6), d1
  001fa8  48c1                 ext.l     d1
  001faa  9280                 sub.l     d0, d1
  001fac  3d410014             move.w    d1, $14(a6)
  001fb0  302e0010             move.w    $10(a6), d0
  001fb4  48c0                 ext.l     d0
  001fb6  3204                 move.w    d4, d1
  001fb8  48c1                 ext.l     d1
  001fba  d280                 add.l     d0, d1
  001fbc  3801                 move.w    d1, d4
  001fbe  426e0010             clr.w     $10(a6)
  001fc2  302b0012             move.w    $12(a3), d0
  001fc6  48c0                 ext.l     d0
  001fc8  3206                 move.w    d6, d1
  001fca  48c1                 ext.l     d1
  001fcc  342e0012             move.w    $12(a6), d2
  001fd0  48c2                 ext.l     d2
  001fd2  d481                 add.l     d1, d2
  001fd4  b480                 cmp.l     d0, d2
  001fd6  6d0e                 blt.b     $1fe6
  001fd8  302e0012             move.w    $12(a6), d0
  001fdc  48c0                 ext.l     d0
  001fde  3c2b0012             move.w    $12(a3), d6
  001fe2  48c6                 ext.l     d6
  001fe4  9c80                 sub.l     d0, d6
  001fe6  302b0010             move.w    $10(a3), d0
  001fea  48c0                 ext.l     d0
  001fec  3204                 move.w    d4, d1
  001fee  48c1                 ext.l     d1
  001ff0  342e0010             move.w    $10(a6), d2
  001ff4  48c2                 ext.l     d2
  001ff6  d481                 add.l     d1, d2
  001ff8  b480                 cmp.l     d0, d2
  001ffa  6d0e                 blt.b     $200a
  001ffc  302e0010             move.w    $10(a6), d0
  002000  48c0                 ext.l     d0
  002002  382b0010             move.w    $10(a3), d4
  002006  48c4                 ext.l     d4
  002008  9880                 sub.l     d0, d4
  00200a  3d6e0016fffe         move.w    $16(a6), -$2(a6)
  002010  3006                 move.w    d6, d0
  002012  48c0                 ext.l     d0
  002014  322e0016             move.w    $16(a6), d1
  002018  48c1                 ext.l     d1
  00201a  d280                 add.l     d0, d1
  00201c  3d41fff2             move.w    d1, -$e(a6)
  002020  3d6e0014ffea         move.w    $14(a6), -$16(a6)
  002026  3004                 move.w    d4, d0
  002028  48c0                 ext.l     d0
  00202a  322e0014             move.w    $14(a6), d1
  00202e  48c1                 ext.l     d1
  002030  d280                 add.l     d0, d1
  002032  3d41ffe8             move.w    d1, -$18(a6)
  002036  42aefff4             clr.l     -$c(a6)
  00203a  4a6e0016             tst.w     $16(a6)
  00203e  6f08                 ble.b     $2048
  002040  302e0016             move.w    $16(a6), d0
  002044  916e0012             sub.w     d0, $12(a6)
  002048  4a6e0014             tst.w     $14(a6)
  00204c  6f08                 ble.b     $2056
  00204e  302e0014             move.w    $14(a6), d0
  002052  916e0010             sub.w     d0, $10(a6)
  002056  302e0010             move.w    $10(a6), d0
  00205a  48c0                 ext.l     d0
  00205c  4c2e0000ffec         mulu.l    -$14(a6), d0
  002062  d0ab0014             add.l     $14(a3), d0
  002066  322e0012             move.w    $12(a6), d1
  00206a  48c1                 ext.l     d1
  00206c  d280                 add.l     d0, d1
  00206e  2d41fffa             move.l    d1, -$6(a6)
  002072  266e001c             movea.l   $1c(a6), a3
  002076  266b0010             movea.l   $10(a3), a3
  00207a  2653                 movea.l   (a3), a3
  00207c  508b                 addq.l    #$8, a3
  00207e  508b                 addq.l    #$8, a3
  002080  422efff9             clr.b     -$7(a6)
  002084  60000196             bra.w     $221c
  002088  2813                 move.l    (a3), d4
  00208a  7218                 moveq     #$18, d1
  00208c  e2ac                 lsr.l     d1, d4
  00208e  2c13                 move.l    (a3), d6
  002090  028600ffffff         andi.l    #$ffffff, d6
  002096  588b                 addq.l    #$4, a3
  002098  2004                 move.l    d4, d0
  00209a  67000176             beq.w     $2212
  00209e  5380                 subq.l    #$1, d0
  0020a0  6700011a             beq.w     $21bc
  0020a4  5380                 subq.l    #$1, d0
  0020a6  670a                 beq.b     $20b2
  0020a8  5380                 subq.l    #$1, d0
  0020aa  670000f4             beq.w     $21a0
  0020ae  6000016a             bra.w     $221a
  0020b2  2806                 move.l    d6, d4
  0020b4  99cc                 suba.l    a4, a4
  0020b6  7000                 moveq     #$0, d0
  0020b8  302efffe             move.w    -$2(a6), d0
  0020bc  ba80                 cmp.l     d0, d5
  0020be  6456                 bcc.b     $2116
  0020c0  7000                 moveq     #$0, d0
  0020c2  302efffe             move.w    -$2(a6), d0
  0020c6  9085                 sub.l     d5, d0
  0020c8  b880                 cmp.l     d0, d4
  0020ca  6422                 bcc.b     $20ee
  0020cc  d5c4                 adda.l    d4, a2
  0020ce  d7c4                 adda.l    d4, a3
  0020d0  7003                 moveq     #$3, d0
  0020d2  c086                 and.l     d6, d0
  0020d4  4a80                 tst.l     d0
  0020d6  6604                 bne.b     $20dc
  0020d8  7000                 moveq     #$0, d0
  0020da  600a                 bra.b     $20e6
  0020dc  7003                 moveq     #$3, d0
  0020de  c086                 and.l     d6, d0
  0020e0  7204                 moveq     #$4, d1
  0020e2  9280                 sub.l     d0, d1
  0020e4  2001                 move.l    d1, d0
  0020e6  d7c0                 adda.l    d0, a3
  0020e8  da84                 add.l     d4, d5
  0020ea  60000130             bra.w     $221c
  0020ee  7000                 moveq     #$0, d0
  0020f0  302efffe             move.w    -$2(a6), d0
  0020f4  9085                 sub.l     d5, d0
  0020f6  9880                 sub.l     d0, d4
  0020f8  7000                 moveq     #$0, d0
  0020fa  302efffe             move.w    -$2(a6), d0
  0020fe  9085                 sub.l     d5, d0
  002100  d5c0                 adda.l    d0, a2
  002102  7000                 moveq     #$0, d0
  002104  302efffe             move.w    -$2(a6), d0
  002108  9085                 sub.l     d5, d0
  00210a  d7c0                 adda.l    d0, a3
  00210c  7000                 moveq     #$0, d0
  00210e  302efffe             move.w    -$2(a6), d0
  002112  9085                 sub.l     d5, d0
  002114  da80                 add.l     d0, d5
  002116  7000                 moveq     #$0, d0
  002118  302efff2             move.w    -$e(a6), d0
  00211c  2205                 move.l    d5, d1
  00211e  d284                 add.l     d4, d1
  002120  b280                 cmp.l     d0, d1
  002122  633e                 bls.b     $2162
  002124  7000                 moveq     #$0, d0
  002126  302efff2             move.w    -$e(a6), d0
  00212a  ba80                 cmp.l     d0, d5
  00212c  6322                 bls.b     $2150
  00212e  d5c4                 adda.l    d4, a2
  002130  d7c4                 adda.l    d4, a3
  002132  7003                 moveq     #$3, d0
  002134  c086                 and.l     d6, d0
  002136  4a80                 tst.l     d0
  002138  6604                 bne.b     $213e
  00213a  7000                 moveq     #$0, d0
  00213c  600a                 bra.b     $2148
  00213e  7003                 moveq     #$3, d0
  002140  c086                 and.l     d6, d0
  002142  7204                 moveq     #$4, d1
  002144  9280                 sub.l     d0, d1
  002146  2001                 move.l    d1, d0
  002148  d7c0                 adda.l    d0, a3
  00214a  da84                 add.l     d4, d5
  00214c  600000ce             bra.w     $221c
  002150  2844                 movea.l   d4, a4
  002152  2005                 move.l    d5, d0
  002154  d084                 add.l     d4, d0
  002156  7200                 moveq     #$0, d1
  002158  322efff2             move.w    -$e(a6), d1
  00215c  9081                 sub.l     d1, d0
  00215e  9880                 sub.l     d0, d4
  002160  99c4                 suba.l    d4, a4
  002162  da84                 add.l     d4, d5
  002164  6014                 bra.b     $217a
  002166  1493                 move.b    (a3), (a2)
  002168  d647                 add.w     d7, d3
  00216a  0c430100             cmpi.w    #$100, d3
  00216e  6d06                 blt.b     $2176
  002170  528a                 addq.l    #$1, a2
  002172  04430100             subi.w    #$100, d3
  002176  528b                 addq.l    #$1, a3
  002178  5384                 subq.l    #$1, d4
  00217a  7001                 moveq     #$1, d0
  00217c  b880                 cmp.l     d0, d4
  00217e  64e6                 bcc.b     $2166
  002180  d5cc                 adda.l    a4, a2
  002182  d7cc                 adda.l    a4, a3
  002184  da8c                 add.l     a4, d5
  002186  7003                 moveq     #$3, d0
  002188  c086                 and.l     d6, d0
  00218a  4a80                 tst.l     d0
  00218c  6604                 bne.b     $2192
  00218e  7000                 moveq     #$0, d0
  002190  600a                 bra.b     $219c
  002192  7003                 moveq     #$3, d0
  002194  c086                 and.l     d6, d0
  002196  7204                 moveq     #$4, d1
  002198  9280                 sub.l     d0, d1
  00219a  2001                 move.l    d1, d0
  00219c  d7c0                 adda.l    d0, a3
  00219e  607c                 bra.b     $221c
  0021a0  3007                 move.w    d7, d0
  0021a2  48c0                 ext.l     d0
  0021a4  4c060000             mulu.l    d6, d0
  0021a8  d640                 add.w     d0, d3
  0021aa  6006                 bra.b     $21b2
  0021ac  528a                 addq.l    #$1, a2
  0021ae  04430100             subi.w    #$100, d3
  0021b2  0c430100             cmpi.w    #$100, d3
  0021b6  6cf4                 bge.b     $21ac
  0021b8  da86                 add.l     d6, d5
  0021ba  6060                 bra.b     $221c
  0021bc  7000                 moveq     #$0, d0
  0021be  302effea             move.w    -$16(a6), d0
  0021c2  b0aefff4             cmp.l     -$c(a6), d0
  0021c6  6310                 bls.b     $21d8
  0021c8  d7c6                 adda.l    d6, a3
  0021ca  246efffa             movea.l   -$6(a6), a2
  0021ce  202effec             move.l    -$14(a6), d0
  0021d2  d1aefffa             add.l     d0, -$6(a6)
  0021d6  601e                 bra.b     $21f6
  0021d8  df6efff0             add.w     d7, -$10(a6)
  0021dc  246efffa             movea.l   -$6(a6), a2
  0021e0  0c6e0100fff0         cmpi.w    #$100, -$10(a6)
  0021e6  6d0e                 blt.b     $21f6
  0021e8  202effec             move.l    -$14(a6), d0
  0021ec  d1aefffa             add.l     d0, -$6(a6)
  0021f0  046e0100fff0         subi.w    #$100, -$10(a6)
  0021f6  7600                 moveq     #$0, d3
  0021f8  52aefff4             addq.l    #$1, -$c(a6)
  0021fc  7a00                 moveq     #$0, d5
  0021fe  7000                 moveq     #$0, d0
  002200  302effe8             move.w    -$18(a6), d0
  002204  b0aefff4             cmp.l     -$c(a6), d0
  002208  6412                 bcc.b     $221c
  00220a  1d7c0001fff9         move.b    #$1, -$7(a6)
  002210  600a                 bra.b     $221c
  002212  1d7c0001fff9         move.b    #$1, -$7(a6)
  002218  6002                 bra.b     $221c
  00221a  a9ff                 _Debugger 
  00221c  4a2efff9             tst.b     -$7(a6)
  002220  6700fe66             beq.w     $2088
  002224  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  002228  4e5e                 unlk      a6
  00222a  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACESCALEUPCLIP   (seg 2 +00224a, 1040 bytes)
  00224a  4e56ffaa             link.w    a6, #$ffaa
  00224e  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  002252  246e0018             movea.l   $18(a6), a2
  002256  3e2e000e             move.w    $e(a6), d7
  00225a  362e000c             move.w    $c(a6), d3
  00225e  3a2e0008             move.w    $8(a6), d5
  002262  306a0018             movea.w   $18(a2), a0
  002266  2d48ffea             move.l    a0, -$16(a6)
  00226a  7800                 moveq     #$0, d4
  00226c  426effce             clr.w     -$32(a6)
  002270  3005                 move.w    d5, d0
  002272  48c0                 ext.l     d0
  002274  ea80                 asr.l     #$5, d0
  002276  3d40fff0             move.w    d0, -$10(a6)
  00227a  426effe6             clr.w     -$1a(a6)
  00227e  3d79000046b2ffcc     move.w    $46b2.l, -$34(a6)   ; g_46b2
  002286  1d7c0001ffef         move.b    #$1, -$11(a6)
  00228c  ea45                 asr.w     #$5, d5
  00228e  4a6e0012             tst.w     $12(a6)
  002292  6c24                 bge.b     $22b8
  002294  302e0012             move.w    $12(a6), d0
  002298  48c0                 ext.l     d0
  00229a  322e0016             move.w    $16(a6), d1
  00229e  48c1                 ext.l     d1
  0022a0  9280                 sub.l     d0, d1
  0022a2  3d410016             move.w    d1, $16(a6)
  0022a6  302e0012             move.w    $12(a6), d0
  0022aa  48c0                 ext.l     d0
  0022ac  3207                 move.w    d7, d1
  0022ae  48c1                 ext.l     d1
  0022b0  d280                 add.l     d0, d1
  0022b2  3e01                 move.w    d1, d7
  0022b4  426e0012             clr.w     $12(a6)
  0022b8  4a6e0010             tst.w     $10(a6)
  0022bc  6c24                 bge.b     $22e2
  0022be  302e0010             move.w    $10(a6), d0
  0022c2  48c0                 ext.l     d0
  0022c4  322e0014             move.w    $14(a6), d1
  0022c8  48c1                 ext.l     d1
  0022ca  9280                 sub.l     d0, d1
  0022cc  3d410014             move.w    d1, $14(a6)
  0022d0  302e0010             move.w    $10(a6), d0
  0022d4  48c0                 ext.l     d0
  0022d6  3203                 move.w    d3, d1
  0022d8  48c1                 ext.l     d1
  0022da  d280                 add.l     d0, d1
  0022dc  3601                 move.w    d1, d3
  0022de  426e0010             clr.w     $10(a6)
  0022e2  302a0012             move.w    $12(a2), d0
  0022e6  48c0                 ext.l     d0
  0022e8  3207                 move.w    d7, d1
  0022ea  48c1                 ext.l     d1
  0022ec  342e0012             move.w    $12(a6), d2
  0022f0  48c2                 ext.l     d2
  0022f2  d481                 add.l     d1, d2
  0022f4  b480                 cmp.l     d0, d2
  0022f6  6d0e                 blt.b     $2306
  0022f8  302e0012             move.w    $12(a6), d0
  0022fc  48c0                 ext.l     d0
  0022fe  3e2a0012             move.w    $12(a2), d7
  002302  48c7                 ext.l     d7
  002304  9e80                 sub.l     d0, d7
  002306  302a0010             move.w    $10(a2), d0
  00230a  48c0                 ext.l     d0
  00230c  3203                 move.w    d3, d1
  00230e  48c1                 ext.l     d1
  002310  342e0010             move.w    $10(a6), d2
  002314  48c2                 ext.l     d2
  002316  d481                 add.l     d1, d2
  002318  b480                 cmp.l     d0, d2
  00231a  6d0e                 blt.b     $232a
  00231c  302e0010             move.w    $10(a6), d0
  002320  48c0                 ext.l     d0
  002322  362a0010             move.w    $10(a2), d3
  002326  48c3                 ext.l     d3
  002328  9680                 sub.l     d0, d3
  00232a  3d6e0016fffe         move.w    $16(a6), -$2(a6)
  002330  3007                 move.w    d7, d0
  002332  48c0                 ext.l     d0
  002334  322e0016             move.w    $16(a6), d1
  002338  48c1                 ext.l     d1
  00233a  d280                 add.l     d0, d1
  00233c  3d41fff2             move.w    d1, -$e(a6)
  002340  4a6e0014             tst.w     $14(a6)
  002344  660a                 bne.b     $2350
  002346  3d6e0014ffe8         move.w    $14(a6), -$18(a6)
  00234c  6000010a             bra.w     $2458
  002350  3d45ffaa             move.w    d5, -$56(a6)
  002354  486effaa             pea.l     -$56(a6)
  002358  486effaa             pea.l     -$56(a6)
  00235c  3f3c200e             move.w    #$200e, -(a7)
  002360  a9eb                 _Pack4_FP 
  002362  486effaa             pea.l     -$56(a6)
  002366  486effaa             pea.l     -$56(a6)
  00236a  3f3c1010             move.w    #$1010, -(a7)
  00236e  a9eb                 _Pack4_FP 
  002370  2d6effaaffdc         move.l    -$56(a6), -$24(a6)
  002376  2d7c40078000ffaa     move.l    #$40078000, -$56(a6)
  00237e  42aeffae             clr.l     -$52(a6)
  002382  426effb2             clr.w     -$4e(a6)
  002386  486effdc             pea.l     -$24(a6)
  00238a  486effb4             pea.l     -$4c(a6)
  00238e  3f3c100e             move.w    #$100e, -(a7)
  002392  a9eb                 _Pack4_FP 
  002394  486effaa             pea.l     -$56(a6)
  002398  486effb4             pea.l     -$4c(a6)
  00239c  3f3c0006             move.w    #$6, -(a7)
  0023a0  a9eb                 _Pack4_FP 
  0023a2  2d7c3fff8000ffbe     move.l    #$3fff8000, -$42(a6)
  0023aa  42aeffc2             clr.l     -$3e(a6)
  0023ae  426effc6             clr.w     -$3a(a6)
  0023b2  486effb4             pea.l     -$4c(a6)
  0023b6  486effbe             pea.l     -$42(a6)
  0023ba  3f3c0006             move.w    #$6, -(a7)
  0023be  a9eb                 _Pack4_FP 
  0023c0  486effbe             pea.l     -$42(a6)
  0023c4  486effc8             pea.l     -$38(a6)
  0023c8  3f3c1010             move.w    #$1010, -(a7)
  0023cc  a9eb                 _Pack4_FP 
  0023ce  2d6effc8ffd8         move.l    -$38(a6), -$28(a6)
  0023d4  3d6e0014ffbe         move.w    $14(a6), -$42(a6)
  0023da  486effbe             pea.l     -$42(a6)
  0023de  486effbe             pea.l     -$42(a6)
  0023e2  3f3c200e             move.w    #$200e, -(a7)
  0023e6  a9eb                 _Pack4_FP 
  0023e8  486effbe             pea.l     -$42(a6)
  0023ec  486effbe             pea.l     -$42(a6)
  0023f0  3f3c1010             move.w    #$1010, -(a7)
  0023f4  a9eb                 _Pack4_FP 
  0023f6  2d6effbeffd4         move.l    -$42(a6), -$2c(a6)
  0023fc  486effd4             pea.l     -$2c(a6)
  002400  486effbe             pea.l     -$42(a6)
  002404  3f3c100e             move.w    #$100e, -(a7)
  002408  a9eb                 _Pack4_FP 
  00240a  486effd8             pea.l     -$28(a6)
  00240e  486effbe             pea.l     -$42(a6)
  002412  3f3c1004             move.w    #$1004, -(a7)
  002416  a9eb                 _Pack4_FP 
  002418  486effbe             pea.l     -$42(a6)
  00241c  486effc8             pea.l     -$38(a6)
  002420  3f3c1010             move.w    #$1010, -(a7)
  002424  a9eb                 _Pack4_FP 
  002426  2d6effc8ffd0         move.l    -$38(a6), -$30(a6)
  00242c  486effd0             pea.l     -$30(a6)
  002430  486effbe             pea.l     -$42(a6)
  002434  3f3c100e             move.w    #$100e, -(a7)
  002438  a9eb                 _Pack4_FP 
  00243a  486effbe             pea.l     -$42(a6)
  00243e  3f3c0016             move.w    #$16, -(a7)
  002442  a9eb                 _Pack4_FP 
  002444  486effbe             pea.l     -$42(a6)
  002448  486effbe             pea.l     -$42(a6)
  00244c  3f3c2810             move.w    #$2810, -(a7)
  002450  a9eb                 _Pack4_FP 
  002452  3d6effc0ffe8         move.w    -$40(a6), -$18(a6)
  002458  3003                 move.w    d3, d0
  00245a  48c0                 ext.l     d0
  00245c  322e0014             move.w    $14(a6), d1
  002460  48c1                 ext.l     d1
  002462  d280                 add.l     d0, d1
  002464  3d41ffe0             move.w    d1, -$20(a6)
  002468  42aefff4             clr.l     -$c(a6)
  00246c  302e0010             move.w    $10(a6), d0
  002470  48c0                 ext.l     d0
  002472  4c2e0000ffea         mulu.l    -$16(a6), d0
  002478  d0aa0014             add.l     $14(a2), d0
  00247c  322e0012             move.w    $12(a6), d1
  002480  48c1                 ext.l     d1
  002482  d280                 add.l     d0, d1
  002484  2d41fffa             move.l    d1, -$6(a6)
  002488  246e001c             movea.l   $1c(a6), a2
  00248c  246a0010             movea.l   $10(a2), a2
  002490  2452                 movea.l   (a2), a2
  002492  508a                 addq.l    #$8, a2
  002494  508a                 addq.l    #$8, a2
  002496  422efff9             clr.b     -$7(a6)
  00249a  600001ac             bra.w     $2648
  00249e  2612                 move.l    (a2), d3
  0024a0  7218                 moveq     #$18, d1
  0024a2  e2ab                 lsr.l     d1, d3
  0024a4  2e12                 move.l    (a2), d7
  0024a6  028700ffffff         andi.l    #$ffffff, d7
  0024ac  588a                 addq.l    #$4, a2
  0024ae  2003                 move.l    d3, d0
  0024b0  6700018c             beq.w     $263e
  0024b4  5380                 subq.l    #$1, d0
  0024b6  67000102             beq.w     $25ba
  0024ba  5380                 subq.l    #$1, d0
  0024bc  670a                 beq.b     $24c8
  0024be  5380                 subq.l    #$1, d0
  0024c0  670000e6             beq.w     $25a8
  0024c4  60000180             bra.w     $2646
  0024c8  2607                 move.l    d7, d3
  0024ca  99cc                 suba.l    a4, a4
  0024cc  7000                 moveq     #$0, d0
  0024ce  302efffe             move.w    -$2(a6), d0
  0024d2  bc80                 cmp.l     d0, d6
  0024d4  644a                 bcc.b     $2520
  0024d6  7000                 moveq     #$0, d0
  0024d8  302efffe             move.w    -$2(a6), d0
  0024dc  9086                 sub.l     d6, d0
  0024de  b680                 cmp.l     d0, d3
  0024e0  6420                 bcc.b     $2502
  0024e2  d5c3                 adda.l    d3, a2
  0024e4  7003                 moveq     #$3, d0
  0024e6  c087                 and.l     d7, d0
  0024e8  4a80                 tst.l     d0
  0024ea  6604                 bne.b     $24f0
  0024ec  7000                 moveq     #$0, d0
  0024ee  600a                 bra.b     $24fa
  0024f0  7003                 moveq     #$3, d0
  0024f2  c087                 and.l     d7, d0
  0024f4  7204                 moveq     #$4, d1
  0024f6  9280                 sub.l     d0, d1
  0024f8  2001                 move.l    d1, d0
  0024fa  d5c0                 adda.l    d0, a2
  0024fc  dc83                 add.l     d3, d6
  0024fe  60000148             bra.w     $2648
  002502  7000                 moveq     #$0, d0
  002504  302efffe             move.w    -$2(a6), d0
  002508  9086                 sub.l     d6, d0
  00250a  9680                 sub.l     d0, d3
  00250c  7000                 moveq     #$0, d0
  00250e  302efffe             move.w    -$2(a6), d0
  002512  9086                 sub.l     d6, d0
  002514  d5c0                 adda.l    d0, a2
  002516  7000                 moveq     #$0, d0
  002518  302efffe             move.w    -$2(a6), d0
  00251c  9086                 sub.l     d6, d0
  00251e  dc80                 add.l     d0, d6
  002520  7000                 moveq     #$0, d0
  002522  302efff2             move.w    -$e(a6), d0
  002526  2206                 move.l    d6, d1
  002528  d283                 add.l     d3, d1
  00252a  b280                 cmp.l     d0, d1
  00252c  633c                 bls.b     $256a
  00252e  7000                 moveq     #$0, d0
  002530  302efff2             move.w    -$e(a6), d0
  002534  bc80                 cmp.l     d0, d6
  002536  6320                 bls.b     $2558
  002538  d5c3                 adda.l    d3, a2
  00253a  7003                 moveq     #$3, d0
  00253c  c087                 and.l     d7, d0
  00253e  4a80                 tst.l     d0
  002540  6604                 bne.b     $2546
  002542  7000                 moveq     #$0, d0
  002544  600a                 bra.b     $2550
  002546  7003                 moveq     #$3, d0
  002548  c087                 and.l     d7, d0
  00254a  7204                 moveq     #$4, d1
  00254c  9280                 sub.l     d0, d1
  00254e  2001                 move.l    d1, d0
  002550  d5c0                 adda.l    d0, a2
  002552  dc83                 add.l     d3, d6
  002554  600000f2             bra.w     $2648
  002558  2843                 movea.l   d3, a4
  00255a  2006                 move.l    d6, d0
  00255c  d083                 add.l     d3, d0
  00255e  7200                 moveq     #$0, d1
  002560  322efff2             move.w    -$e(a6), d1
  002564  9081                 sub.l     d1, d0
  002566  9680                 sub.l     d0, d3
  002568  99c3                 suba.l    d3, a4
  00256a  dc83                 add.l     d3, d6
  00256c  6012                 bra.b     $2580
  00256e  1692                 move.b    (a2), (a3)
  002570  06440100             addi.w    #$100, d4
  002574  b845                 cmp.w     d5, d4
  002576  6d06                 blt.b     $257e
  002578  528a                 addq.l    #$1, a2
  00257a  5383                 subq.l    #$1, d3
  00257c  9845                 sub.w     d5, d4
  00257e  528b                 addq.l    #$1, a3
  002580  7001                 moveq     #$1, d0
  002582  b680                 cmp.l     d0, d3
  002584  64e8                 bcc.b     $256e
  002586  d7cc                 adda.l    a4, a3
  002588  d5cc                 adda.l    a4, a2
  00258a  dc8c                 add.l     a4, d6
  00258c  7003                 moveq     #$3, d0
  00258e  c087                 and.l     d7, d0
  002590  4a80                 tst.l     d0
  002592  6604                 bne.b     $2598
  002594  7000                 moveq     #$0, d0
  002596  600a                 bra.b     $25a2
  002598  7003                 moveq     #$3, d0
  00259a  c087                 and.l     d7, d0
  00259c  7204                 moveq     #$4, d1
  00259e  9280                 sub.l     d0, d1
  0025a0  2001                 move.l    d1, d0
  0025a2  d5c0                 adda.l    d0, a2
  0025a4  600000a2             bra.w     $2648
  0025a8  3005                 move.w    d5, d0
  0025aa  48c0                 ext.l     d0
  0025ac  4c070000             mulu.l    d7, d0
  0025b0  e088                 lsr.l     #$8, d0
  0025b2  d7c0                 adda.l    d0, a3
  0025b4  dc87                 add.l     d7, d6
  0025b6  60000090             bra.w     $2648
  0025ba  7000                 moveq     #$0, d0
  0025bc  302effe8             move.w    -$18(a6), d0
  0025c0  b0aefff4             cmp.l     -$c(a6), d0
  0025c4  6308                 bls.b     $25ce
  0025c6  422effef             clr.b     -$11(a6)
  0025ca  d5c7                 adda.l    d7, a2
  0025cc  6044                 bra.b     $2612
  0025ce  4a2effef             tst.b     -$11(a6)
  0025d2  672c                 beq.b     $2600
  0025d4  066e0100fff0         addi.w    #$100, -$10(a6)
  0025da  266efffa             movea.l   -$6(a6), a3
  0025de  202effea             move.l    -$16(a6), d0
  0025e2  d1aefffa             add.l     d0, -$6(a6)
  0025e6  526effe6             addq.w    #$1, -$1a(a6)
  0025ea  ba6efff0             cmp.w     -$10(a6), d5
  0025ee  6f0a                 ble.b     $25fa
  0025f0  246effe2             movea.l   -$1e(a6), a2
  0025f4  53aefff4             subq.l    #$1, -$c(a6)
  0025f8  6018                 bra.b     $2612
  0025fa  9b6efff0             sub.w     d5, -$10(a6)
  0025fe  6012                 bra.b     $2612
  002600  1d7c0001ffef         move.b    #$1, -$11(a6)
  002606  266efffa             movea.l   -$6(a6), a3
  00260a  202effea             move.l    -$16(a6), d0
  00260e  d1aefffa             add.l     d0, -$6(a6)
  002612  2d4affe2             move.l    a2, -$1e(a6)
  002616  7800                 moveq     #$0, d4
  002618  52aefff4             addq.l    #$1, -$c(a6)
  00261c  7c00                 moveq     #$0, d6
  00261e  7000                 moveq     #$0, d0
  002620  302effe8             move.w    -$18(a6), d0
  002624  7200                 moveq     #$0, d1
  002626  322effe0             move.w    -$20(a6), d1
  00262a  9280                 sub.l     d0, d1
  00262c  302effe6             move.w    -$1a(a6), d0
  002630  48c0                 ext.l     d0
  002632  b081                 cmp.l     d1, d0
  002634  6f12                 ble.b     $2648
  002636  1d7c0001fff9         move.b    #$1, -$7(a6)
  00263c  600a                 bra.b     $2648
  00263e  1d7c0001fff9         move.b    #$1, -$7(a6)
  002644  6002                 bra.b     $2648
  002646  a9ff                 _Debugger 
  002648  4a2efff9             tst.b     -$7(a6)
  00264c  6700fe50             beq.w     $249e
  002650  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  002654  4e5e                 unlk      a6
  002656  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACESCALEDOWNSPECIALCLIP   (seg 2 +002674, 1004 bytes)
  002674  4e56ffde             link.w    a6, #$ffde
  002678  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  00267c  266e0018             movea.l   $18(a6), a3
  002680  3a2e000e             move.w    $e(a6), d5
  002684  382e000c             move.w    $c(a6), d4
  002688  3c2e0008             move.w    $8(a6), d6
  00268c  306b0018             movea.w   $18(a3), a0
  002690  2d48ffe2             move.l    a0, -$1e(a6)
  002694  7600                 moveq     #$0, d3
  002696  7e00                 moveq     #$0, d7
  002698  426effe6             clr.w     -$1a(a6)
  00269c  7e00                 moveq     #$0, d7
  00269e  3e39000046b2         move.w    $46b2.l, d7   ; g_46b2
  0026a4  3006                 move.w    d6, d0
  0026a6  48c0                 ext.l     d0
  0026a8  ea80                 asr.l     #$5, d0
  0026aa  3d40fffa             move.w    d0, -$6(a6)
  0026ae  302efffa             move.w    -$6(a6), d0
  0026b2  48c0                 ext.l     d0
  0026b4  eb88                 lsl.l     #$5, d0
  0026b6  3e06                 move.w    d6, d7
  0026b8  48c7                 ext.l     d7
  0026ba  9e80                 sub.l     d0, d7
  0026bc  0c6e0001000a         cmpi.w    #$1, $a(a6)
  0026c2  660c                 bne.b     $26d0
  0026c4  0c47ffff             cmpi.w    #$ffff, d7
  0026c8  6606                 bne.b     $26d0
  0026ca  3d7c0002000a         move.w    #$2, $a(a6)
  0026d0  4a6e0012             tst.w     $12(a6)
  0026d4  6c24                 bge.b     $26fa
  0026d6  302e0012             move.w    $12(a6), d0
  0026da  48c0                 ext.l     d0
  0026dc  322e0016             move.w    $16(a6), d1
  0026e0  48c1                 ext.l     d1
  0026e2  9280                 sub.l     d0, d1
  0026e4  3d410016             move.w    d1, $16(a6)
  0026e8  302e0012             move.w    $12(a6), d0
  0026ec  48c0                 ext.l     d0
  0026ee  3205                 move.w    d5, d1
  0026f0  48c1                 ext.l     d1
  0026f2  d280                 add.l     d0, d1
  0026f4  3a01                 move.w    d1, d5
  0026f6  426e0012             clr.w     $12(a6)
  0026fa  4a6e0010             tst.w     $10(a6)
  0026fe  6c24                 bge.b     $2724
  002700  302e0010             move.w    $10(a6), d0
  002704  48c0                 ext.l     d0
  002706  322e0014             move.w    $14(a6), d1
  00270a  48c1                 ext.l     d1
  00270c  9280                 sub.l     d0, d1
  00270e  3d410014             move.w    d1, $14(a6)
  002712  302e0010             move.w    $10(a6), d0
  002716  48c0                 ext.l     d0
  002718  3204                 move.w    d4, d1
  00271a  48c1                 ext.l     d1
  00271c  d280                 add.l     d0, d1
  00271e  3801                 move.w    d1, d4
  002720  426e0010             clr.w     $10(a6)
  002724  302b0012             move.w    $12(a3), d0
  002728  48c0                 ext.l     d0
  00272a  3205                 move.w    d5, d1
  00272c  48c1                 ext.l     d1
  00272e  342e0012             move.w    $12(a6), d2
  002732  48c2                 ext.l     d2
  002734  d481                 add.l     d1, d2
  002736  b480                 cmp.l     d0, d2
  002738  6d0e                 blt.b     $2748
  00273a  302e0012             move.w    $12(a6), d0
  00273e  48c0                 ext.l     d0
  002740  3a2b0012             move.w    $12(a3), d5
  002744  48c5                 ext.l     d5
  002746  9a80                 sub.l     d0, d5
  002748  302b0010             move.w    $10(a3), d0
  00274c  48c0                 ext.l     d0
  00274e  3204                 move.w    d4, d1
  002750  48c1                 ext.l     d1
  002752  342e0010             move.w    $10(a6), d2
  002756  48c2                 ext.l     d2
  002758  d481                 add.l     d1, d2
  00275a  b480                 cmp.l     d0, d2
  00275c  6d0e                 blt.b     $276c
  00275e  302e0010             move.w    $10(a6), d0
  002762  48c0                 ext.l     d0
  002764  382b0010             move.w    $10(a3), d4
  002768  48c4                 ext.l     d4
  00276a  9880                 sub.l     d0, d4
  00276c  3d6e0016fff8         move.w    $16(a6), -$8(a6)
  002772  3005                 move.w    d5, d0
  002774  48c0                 ext.l     d0
  002776  322e0016             move.w    $16(a6), d1
  00277a  48c1                 ext.l     d1
  00277c  d280                 add.l     d0, d1
  00277e  3d41ffe8             move.w    d1, -$18(a6)
  002782  3d6e0014ffe0         move.w    $14(a6), -$20(a6)
  002788  3004                 move.w    d4, d0
  00278a  48c0                 ext.l     d0
  00278c  322e0014             move.w    $14(a6), d1
  002790  48c1                 ext.l     d1
  002792  d280                 add.l     d0, d1
  002794  3d41ffde             move.w    d1, -$22(a6)
  002798  42aeffea             clr.l     -$16(a6)
  00279c  4a6e0016             tst.w     $16(a6)
  0027a0  6f08                 ble.b     $27aa
  0027a2  302e0016             move.w    $16(a6), d0
  0027a6  916e0012             sub.w     d0, $12(a6)
  0027aa  4a6e0014             tst.w     $14(a6)
  0027ae  6f08                 ble.b     $27b8
  0027b0  302e0014             move.w    $14(a6), d0
  0027b4  916e0010             sub.w     d0, $10(a6)
  0027b8  302e0010             move.w    $10(a6), d0
  0027bc  48c0                 ext.l     d0
  0027be  4c2e0000ffe2         mulu.l    -$1e(a6), d0
  0027c4  d0ab0014             add.l     $14(a3), d0
  0027c8  322e0012             move.w    $12(a6), d1
  0027cc  48c1                 ext.l     d1
  0027ce  d280                 add.l     d0, d1
  0027d0  2d41fff0             move.l    d1, -$10(a6)
  0027d4  266e001c             movea.l   $1c(a6), a3
  0027d8  266b0010             movea.l   $10(a3), a3
  0027dc  2653                 movea.l   (a3), a3
  0027de  508b                 addq.l    #$8, a3
  0027e0  508b                 addq.l    #$8, a3
  0027e2  422effef             clr.b     -$11(a6)
  0027e6  60000266             bra.w     $2a4e
  0027ea  2813                 move.l    (a3), d4
  0027ec  7218                 moveq     #$18, d1
  0027ee  e2ac                 lsr.l     d1, d4
  0027f0  2013                 move.l    (a3), d0
  0027f2  028000ffffff         andi.l    #$ffffff, d0
  0027f8  2d40fffc             move.l    d0, -$4(a6)
  0027fc  588b                 addq.l    #$4, a3
  0027fe  2004                 move.l    d4, d0
  002800  67000242             beq.w     $2a44
  002804  5380                 subq.l    #$1, d0
  002806  670001e0             beq.w     $29e8
  00280a  5380                 subq.l    #$1, d0
  00280c  670a                 beq.b     $2818
  00280e  5380                 subq.l    #$1, d0
  002810  670001b4             beq.w     $29c6
  002814  60000236             bra.w     $2a4c
  002818  282efffc             move.l    -$4(a6), d4
  00281c  42aefff4             clr.l     -$c(a6)
  002820  7000                 moveq     #$0, d0
  002822  302efff8             move.w    -$8(a6), d0
  002826  b9c0                 cmpa.l    d0, a4
  002828  645a                 bcc.b     $2884
  00282a  7000                 moveq     #$0, d0
  00282c  302efff8             move.w    -$8(a6), d0
  002830  908c                 sub.l     a4, d0
  002832  b880                 cmp.l     d0, d4
  002834  6426                 bcc.b     $285c
  002836  d5c4                 adda.l    d4, a2
  002838  d7c4                 adda.l    d4, a3
  00283a  7003                 moveq     #$3, d0
  00283c  c0aefffc             and.l     -$4(a6), d0
  002840  4a80                 tst.l     d0
  002842  6604                 bne.b     $2848
  002844  7000                 moveq     #$0, d0
  002846  600c                 bra.b     $2854
  002848  7003                 moveq     #$3, d0
  00284a  c0aefffc             and.l     -$4(a6), d0
  00284e  7204                 moveq     #$4, d1
  002850  9280                 sub.l     d0, d1
  002852  2001                 move.l    d1, d0
  002854  d7c0                 adda.l    d0, a3
  002856  d9c4                 adda.l    d4, a4
  002858  600001f4             bra.w     $2a4e
  00285c  7000                 moveq     #$0, d0
  00285e  302efff8             move.w    -$8(a6), d0
  002862  908c                 sub.l     a4, d0
  002864  9880                 sub.l     d0, d4
  002866  7000                 moveq     #$0, d0
  002868  302efff8             move.w    -$8(a6), d0
  00286c  908c                 sub.l     a4, d0
  00286e  d5c0                 adda.l    d0, a2
  002870  7000                 moveq     #$0, d0
  002872  302efff8             move.w    -$8(a6), d0
  002876  908c                 sub.l     a4, d0
  002878  d7c0                 adda.l    d0, a3
  00287a  7000                 moveq     #$0, d0
  00287c  302efff8             move.w    -$8(a6), d0
  002880  908c                 sub.l     a4, d0
  002882  d9c0                 adda.l    d0, a4
  002884  7000                 moveq     #$0, d0
  002886  302effe8             move.w    -$18(a6), d0
  00288a  220c                 move.l    a4, d1
  00288c  d284                 add.l     d4, d1
  00288e  b280                 cmp.l     d0, d1
  002890  6346                 bls.b     $28d8
  002892  7000                 moveq     #$0, d0
  002894  302effe8             move.w    -$18(a6), d0
  002898  b9c0                 cmpa.l    d0, a4
  00289a  6326                 bls.b     $28c2
  00289c  d5c4                 adda.l    d4, a2
  00289e  d7c4                 adda.l    d4, a3
  0028a0  7003                 moveq     #$3, d0
  0028a2  c0aefffc             and.l     -$4(a6), d0
  0028a6  4a80                 tst.l     d0
  0028a8  6604                 bne.b     $28ae
  0028aa  7000                 moveq     #$0, d0
  0028ac  600c                 bra.b     $28ba
  0028ae  7003                 moveq     #$3, d0
  0028b0  c0aefffc             and.l     -$4(a6), d0
  0028b4  7204                 moveq     #$4, d1
  0028b6  9280                 sub.l     d0, d1
  0028b8  2001                 move.l    d1, d0
  0028ba  d7c0                 adda.l    d0, a3
  0028bc  d9c4                 adda.l    d4, a4
  0028be  6000018e             bra.w     $2a4e
  0028c2  2d44fff4             move.l    d4, -$c(a6)
  0028c6  200c                 move.l    a4, d0
  0028c8  d084                 add.l     d4, d0
  0028ca  7200                 moveq     #$0, d1
  0028cc  322effe8             move.w    -$18(a6), d1
  0028d0  9081                 sub.l     d1, d0
  0028d2  9880                 sub.l     d0, d4
  0028d4  99aefff4             sub.l     d4, -$c(a6)
  0028d8  d9c4                 adda.l    d4, a4
  0028da  600000b6             bra.w     $2992
  0028de  302e000a             move.w    $a(a6), d0
  0028e2  48c0                 ext.l     d0
  0028e4  5380                 subq.l    #$1, d0
  0028e6  6710                 beq.b     $28f8
  0028e8  5380                 subq.l    #$1, d0
  0028ea  672c                 beq.b     $2918
  0028ec  5380                 subq.l    #$1, d0
  0028ee  6754                 beq.b     $2944
  0028f0  5380                 subq.l    #$1, d0
  0028f2  676e                 beq.b     $2962
  0028f4  60000088             bra.w     $297e
  0028f8  1a13                 move.b    (a3), d5
  0028fa  1493                 move.b    (a3), (a2)
  0028fc  3047                 movea.w   d7, a0
  0028fe  2008                 move.l    a0, d0
  002900  7209                 moveq     #$9, d1
  002902  e3a8                 lsl.l     d1, d0
  002904  41f900008482         lea.l     $8482.l, a0   ; g_8482
  00290a  d1c0                 adda.l    d0, a0
  00290c  7000                 moveq     #$0, d0
  00290e  1005                 move.b    d5, d0
  002910  30300a00             move.w    (a0, d0.l * 2), d0
  002914  1480                 move.b    d0, (a2)
  002916  6066                 bra.b     $297e
  002918  1a13                 move.b    (a3), d5
  00291a  1c12                 move.b    (a2), d6
  00291c  7000                 moveq     #$0, d0
  00291e  1005                 move.b    d5, d0
  002920  41f90000f482         lea.l     $f482.l, a0   ; g_f482
  002926  32700a00             movea.w   (a0, d0.l * 2), a1
  00292a  2009                 move.l    a1, d0
  00292c  7209                 moveq     #$9, d1
  00292e  e3a8                 lsl.l     d1, d0
  002930  41f90000a482         lea.l     $a482.l, a0   ; g_a482
  002936  d1c0                 adda.l    d0, a0
  002938  7000                 moveq     #$0, d0
  00293a  1006                 move.b    d6, d0
  00293c  30300a00             move.w    (a0, d0.l * 2), d0
  002940  1480                 move.b    d0, (a2)
  002942  603a                 bra.b     $297e
  002944  1a13                 move.b    (a3), d5
  002946  3047                 movea.w   d7, a0
  002948  2008                 move.l    a0, d0
  00294a  7209                 moveq     #$9, d1
  00294c  e3a8                 lsl.l     d1, d0
  00294e  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  002954  d1c0                 adda.l    d0, a0
  002956  7000                 moveq     #$0, d0
  002958  1005                 move.b    d5, d0
  00295a  30300a00             move.w    (a0, d0.l * 2), d0
  00295e  1480                 move.b    d0, (a2)
  002960  601c                 bra.b     $297e
  002962  1a13                 move.b    (a3), d5
  002964  3047                 movea.w   d7, a0
  002966  2008                 move.l    a0, d0
  002968  7209                 moveq     #$9, d1
  00296a  e3a8                 lsl.l     d1, d0
  00296c  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  002972  d1c0                 adda.l    d0, a0
  002974  7000                 moveq     #$0, d0
  002976  1005                 move.b    d5, d0
  002978  30300a00             move.w    (a0, d0.l * 2), d0
  00297c  1480                 move.b    d0, (a2)
  00297e  d66efffa             add.w     -$6(a6), d3
  002982  0c430100             cmpi.w    #$100, d3
  002986  6d06                 blt.b     $298e
  002988  528a                 addq.l    #$1, a2
  00298a  04430100             subi.w    #$100, d3
  00298e  528b                 addq.l    #$1, a3
  002990  5384                 subq.l    #$1, d4
  002992  7001                 moveq     #$1, d0
  002994  b880                 cmp.l     d0, d4
  002996  6400ff46             bcc.w     $28de
  00299a  d5eefff4             adda.l    -$c(a6), a2
  00299e  d7eefff4             adda.l    -$c(a6), a3
  0029a2  d9eefff4             adda.l    -$c(a6), a4
  0029a6  7003                 moveq     #$3, d0
  0029a8  c0aefffc             and.l     -$4(a6), d0
  0029ac  4a80                 tst.l     d0
  0029ae  6604                 bne.b     $29b4
  0029b0  7000                 moveq     #$0, d0
  0029b2  600c                 bra.b     $29c0
  0029b4  7003                 moveq     #$3, d0
  0029b6  c0aefffc             and.l     -$4(a6), d0
  0029ba  7204                 moveq     #$4, d1
  0029bc  9280                 sub.l     d0, d1
  0029be  2001                 move.l    d1, d0
  0029c0  d7c0                 adda.l    d0, a3
  0029c2  6000008a             bra.w     $2a4e
  0029c6  302efffa             move.w    -$6(a6), d0
  0029ca  48c0                 ext.l     d0
  0029cc  4c2e0000fffc         mulu.l    -$4(a6), d0
  0029d2  d640                 add.w     d0, d3
  0029d4  6006                 bra.b     $29dc
  0029d6  528a                 addq.l    #$1, a2
  0029d8  04430100             subi.w    #$100, d3
  0029dc  0c430100             cmpi.w    #$100, d3
  0029e0  6cf4                 bge.b     $29d6
  0029e2  d9eefffc             adda.l    -$4(a6), a4
  0029e6  6066                 bra.b     $2a4e
  0029e8  7000                 moveq     #$0, d0
  0029ea  302effe0             move.w    -$20(a6), d0
  0029ee  b0aeffea             cmp.l     -$16(a6), d0
  0029f2  6312                 bls.b     $2a06
  0029f4  d7eefffc             adda.l    -$4(a6), a3
  0029f8  246efff0             movea.l   -$10(a6), a2
  0029fc  202effe2             move.l    -$1e(a6), d0
  002a00  d1aefff0             add.l     d0, -$10(a6)
  002a04  6022                 bra.b     $2a28
  002a06  302efffa             move.w    -$6(a6), d0
  002a0a  d16effe6             add.w     d0, -$1a(a6)
  002a0e  246efff0             movea.l   -$10(a6), a2
  002a12  0c6e0100ffe6         cmpi.w    #$100, -$1a(a6)
  002a18  6d0e                 blt.b     $2a28
  002a1a  202effe2             move.l    -$1e(a6), d0
  002a1e  d1aefff0             add.l     d0, -$10(a6)
  002a22  046e0100ffe6         subi.w    #$100, -$1a(a6)
  002a28  7600                 moveq     #$0, d3
  002a2a  52aeffea             addq.l    #$1, -$16(a6)
  002a2e  99cc                 suba.l    a4, a4
  002a30  7000                 moveq     #$0, d0
  002a32  302effde             move.w    -$22(a6), d0
  002a36  b0aeffea             cmp.l     -$16(a6), d0
  002a3a  6412                 bcc.b     $2a4e
  002a3c  1d7c0001ffef         move.b    #$1, -$11(a6)
  002a42  600a                 bra.b     $2a4e
  002a44  1d7c0001ffef         move.b    #$1, -$11(a6)
  002a4a  6002                 bra.b     $2a4e
  002a4c  a9ff                 _Debugger 
  002a4e  4a2effef             tst.b     -$11(a6)
  002a52  6700fd96             beq.w     $27ea
  002a56  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  002a5a  4e5e                 unlk      a6
  002a5c  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACESCALEUPSPECIALCLIP   (seg 2 +002a82, 1286 bytes)
  002a82  4e56ffa4             link.w    a6, #$ffa4
  002a86  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  002a8a  246e0018             movea.l   $18(a6), a2
  002a8e  382e000e             move.w    $e(a6), d4
  002a92  362e000c             move.w    $c(a6), d3
  002a96  3a2e0008             move.w    $8(a6), d5
  002a9a  306a0018             movea.w   $18(a2), a0
  002a9e  2d48ffe0             move.l    a0, -$20(a6)
  002aa2  3005                 move.w    d5, d0
  002aa4  48c0                 ext.l     d0
  002aa6  ea80                 asr.l     #$5, d0
  002aa8  3d40fffe             move.w    d0, -$2(a6)
  002aac  302efffe             move.w    -$2(a6), d0
  002ab0  48c0                 ext.l     d0
  002ab2  eb88                 lsl.l     #$5, d0
  002ab4  3e05                 move.w    d5, d7
  002ab6  48c7                 ext.l     d7
  002ab8  9e80                 sub.l     d0, d7
  002aba  7c00                 moveq     #$0, d6
  002abc  7a00                 moveq     #$0, d5
  002abe  3d6efffeffe6         move.w    -$2(a6), -$1a(a6)
  002ac4  426effdc             clr.w     -$24(a6)
  002ac8  3a39000046b2         move.w    $46b2.l, d5   ; g_46b2
  002ace  1d7c0001ffe5         move.b    #$1, -$1b(a6)
  002ad4  0c6e0001000a         cmpi.w    #$1, $a(a6)
  002ada  660c                 bne.b     $2ae8
  002adc  0c47ffff             cmpi.w    #$ffff, d7
  002ae0  6606                 bne.b     $2ae8
  002ae2  3d7c0002000a         move.w    #$2, $a(a6)
  002ae8  4a6e0012             tst.w     $12(a6)
  002aec  6c24                 bge.b     $2b12
  002aee  302e0012             move.w    $12(a6), d0
  002af2  48c0                 ext.l     d0
  002af4  322e0016             move.w    $16(a6), d1
  002af8  48c1                 ext.l     d1
  002afa  9280                 sub.l     d0, d1
  002afc  3d410016             move.w    d1, $16(a6)
  002b00  302e0012             move.w    $12(a6), d0
  002b04  48c0                 ext.l     d0
  002b06  3204                 move.w    d4, d1
  002b08  48c1                 ext.l     d1
  002b0a  d280                 add.l     d0, d1
  002b0c  3801                 move.w    d1, d4
  002b0e  426e0012             clr.w     $12(a6)
  002b12  4a6e0010             tst.w     $10(a6)
  002b16  6c24                 bge.b     $2b3c
  002b18  302e0010             move.w    $10(a6), d0
  002b1c  48c0                 ext.l     d0
  002b1e  322e0014             move.w    $14(a6), d1
  002b22  48c1                 ext.l     d1
  002b24  9280                 sub.l     d0, d1
  002b26  3d410014             move.w    d1, $14(a6)
  002b2a  302e0010             move.w    $10(a6), d0
  002b2e  48c0                 ext.l     d0
  002b30  3203                 move.w    d3, d1
  002b32  48c1                 ext.l     d1
  002b34  d280                 add.l     d0, d1
  002b36  3601                 move.w    d1, d3
  002b38  426e0010             clr.w     $10(a6)
  002b3c  302a0012             move.w    $12(a2), d0
  002b40  48c0                 ext.l     d0
  002b42  3204                 move.w    d4, d1
  002b44  48c1                 ext.l     d1
  002b46  342e0012             move.w    $12(a6), d2
  002b4a  48c2                 ext.l     d2
  002b4c  d481                 add.l     d1, d2
  002b4e  b480                 cmp.l     d0, d2
  002b50  6d0e                 blt.b     $2b60
  002b52  302e0012             move.w    $12(a6), d0
  002b56  48c0                 ext.l     d0
  002b58  382a0012             move.w    $12(a2), d4
  002b5c  48c4                 ext.l     d4
  002b5e  9880                 sub.l     d0, d4
  002b60  302a0010             move.w    $10(a2), d0
  002b64  48c0                 ext.l     d0
  002b66  3203                 move.w    d3, d1
  002b68  48c1                 ext.l     d1
  002b6a  342e0010             move.w    $10(a6), d2
  002b6e  48c2                 ext.l     d2
  002b70  d481                 add.l     d1, d2
  002b72  b480                 cmp.l     d0, d2
  002b74  6d0e                 blt.b     $2b84
  002b76  302e0010             move.w    $10(a6), d0
  002b7a  48c0                 ext.l     d0
  002b7c  362a0010             move.w    $10(a2), d3
  002b80  48c3                 ext.l     d3
  002b82  9680                 sub.l     d0, d3
  002b84  3d6e0016fff4         move.w    $16(a6), -$c(a6)
  002b8a  3004                 move.w    d4, d0
  002b8c  48c0                 ext.l     d0
  002b8e  322e0016             move.w    $16(a6), d1
  002b92  48c1                 ext.l     d1
  002b94  d280                 add.l     d0, d1
  002b96  3d41ffe8             move.w    d1, -$18(a6)
  002b9a  4a6e0014             tst.w     $14(a6)
  002b9e  660a                 bne.b     $2baa
  002ba0  3d6e0014ffde         move.w    $14(a6), -$22(a6)
  002ba6  6000010c             bra.w     $2cb4
  002baa  3d6efffeffa4         move.w    -$2(a6), -$5c(a6)
  002bb0  486effa4             pea.l     -$5c(a6)
  002bb4  486effa4             pea.l     -$5c(a6)
  002bb8  3f3c200e             move.w    #$200e, -(a7)
  002bbc  a9eb                 _Pack4_FP 
  002bbe  486effa4             pea.l     -$5c(a6)
  002bc2  486effa4             pea.l     -$5c(a6)
  002bc6  3f3c1010             move.w    #$1010, -(a7)
  002bca  a9eb                 _Pack4_FP 
  002bcc  2d6effa4ffd2         move.l    -$5c(a6), -$2e(a6)
  002bd2  2d7c40078000ffa4     move.l    #$40078000, -$5c(a6)
  002bda  42aeffa8             clr.l     -$58(a6)
  002bde  426effac             clr.w     -$54(a6)
  002be2  486effd2             pea.l     -$2e(a6)
  002be6  486effae             pea.l     -$52(a6)
  002bea  3f3c100e             move.w    #$100e, -(a7)
  002bee  a9eb                 _Pack4_FP 
  002bf0  486effa4             pea.l     -$5c(a6)
  002bf4  486effae             pea.l     -$52(a6)
  002bf8  3f3c0006             move.w    #$6, -(a7)
  002bfc  a9eb                 _Pack4_FP 
  002bfe  2d7c3fff8000ffb8     move.l    #$3fff8000, -$48(a6)
  002c06  42aeffbc             clr.l     -$44(a6)
  002c0a  426effc0             clr.w     -$40(a6)
  002c0e  486effae             pea.l     -$52(a6)
  002c12  486effb8             pea.l     -$48(a6)
  002c16  3f3c0006             move.w    #$6, -(a7)
  002c1a  a9eb                 _Pack4_FP 
  002c1c  486effb8             pea.l     -$48(a6)
  002c20  486effc2             pea.l     -$3e(a6)
  002c24  3f3c1010             move.w    #$1010, -(a7)
  002c28  a9eb                 _Pack4_FP 
  002c2a  2d6effc2ffce         move.l    -$3e(a6), -$32(a6)
  002c30  3d6e0014ffb8         move.w    $14(a6), -$48(a6)
  002c36  486effb8             pea.l     -$48(a6)
  002c3a  486effb8             pea.l     -$48(a6)
  002c3e  3f3c200e             move.w    #$200e, -(a7)
  002c42  a9eb                 _Pack4_FP 
  002c44  486effb8             pea.l     -$48(a6)
  002c48  486effb8             pea.l     -$48(a6)
  002c4c  3f3c1010             move.w    #$1010, -(a7)
  002c50  a9eb                 _Pack4_FP 
  002c52  2d6effb8ffca         move.l    -$48(a6), -$36(a6)
  002c58  486effca             pea.l     -$36(a6)
  002c5c  486effb8             pea.l     -$48(a6)
  002c60  3f3c100e             move.w    #$100e, -(a7)
  002c64  a9eb                 _Pack4_FP 
  002c66  486effce             pea.l     -$32(a6)
  002c6a  486effb8             pea.l     -$48(a6)
  002c6e  3f3c1004             move.w    #$1004, -(a7)
  002c72  a9eb                 _Pack4_FP 
  002c74  486effb8             pea.l     -$48(a6)
  002c78  486effc2             pea.l     -$3e(a6)
  002c7c  3f3c1010             move.w    #$1010, -(a7)
  002c80  a9eb                 _Pack4_FP 
  002c82  2d6effc2ffc6         move.l    -$3e(a6), -$3a(a6)
  002c88  486effc6             pea.l     -$3a(a6)
  002c8c  486effb8             pea.l     -$48(a6)
  002c90  3f3c100e             move.w    #$100e, -(a7)
  002c94  a9eb                 _Pack4_FP 
  002c96  486effb8             pea.l     -$48(a6)
  002c9a  3f3c0016             move.w    #$16, -(a7)
  002c9e  a9eb                 _Pack4_FP 
  002ca0  486effb8             pea.l     -$48(a6)
  002ca4  486effb8             pea.l     -$48(a6)
  002ca8  3f3c2810             move.w    #$2810, -(a7)
  002cac  a9eb                 _Pack4_FP 
  002cae  3d6effbaffde         move.w    -$46(a6), -$22(a6)
  002cb4  3003                 move.w    d3, d0
  002cb6  48c0                 ext.l     d0
  002cb8  322e0014             move.w    $14(a6), d1
  002cbc  48c1                 ext.l     d1
  002cbe  d280                 add.l     d0, d1
  002cc0  3d41ffd6             move.w    d1, -$2a(a6)
  002cc4  42aeffea             clr.l     -$16(a6)
  002cc8  302e0010             move.w    $10(a6), d0
  002ccc  48c0                 ext.l     d0
  002cce  4c2e0000ffe0         mulu.l    -$20(a6), d0
  002cd4  d0aa0014             add.l     $14(a2), d0
  002cd8  322e0012             move.w    $12(a6), d1
  002cdc  48c1                 ext.l     d1
  002cde  d280                 add.l     d0, d1
  002ce0  2d41fff0             move.l    d1, -$10(a6)
  002ce4  246e001c             movea.l   $1c(a6), a2
  002ce8  246a0010             movea.l   $10(a2), a2
  002cec  2452                 movea.l   (a2), a2
  002cee  508a                 addq.l    #$8, a2
  002cf0  508a                 addq.l    #$8, a2
  002cf2  422effef             clr.b     -$11(a6)
  002cf6  6000027e             bra.w     $2f76
  002cfa  2612                 move.l    (a2), d3
  002cfc  7218                 moveq     #$18, d1
  002cfe  e2ab                 lsr.l     d1, d3
  002d00  2012                 move.l    (a2), d0
  002d02  028000ffffff         andi.l    #$ffffff, d0
  002d08  2d40fffa             move.l    d0, -$6(a6)
  002d0c  588a                 addq.l    #$4, a2
  002d0e  2003                 move.l    d3, d0
  002d10  6700025a             beq.w     $2f6c
  002d14  5380                 subq.l    #$1, d0
  002d16  670001c6             beq.w     $2ede
  002d1a  5380                 subq.l    #$1, d0
  002d1c  670a                 beq.b     $2d28
  002d1e  5380                 subq.l    #$1, d0
  002d20  670001a4             beq.w     $2ec6
  002d24  6000024e             bra.w     $2f74
  002d28  262efffa             move.l    -$6(a6), d3
  002d2c  42aefff6             clr.l     -$a(a6)
  002d30  7000                 moveq     #$0, d0
  002d32  302efff4             move.w    -$c(a6), d0
  002d36  b9c0                 cmpa.l    d0, a4
  002d38  644e                 bcc.b     $2d88
  002d3a  7000                 moveq     #$0, d0
  002d3c  302efff4             move.w    -$c(a6), d0
  002d40  908c                 sub.l     a4, d0
  002d42  b680                 cmp.l     d0, d3
  002d44  6424                 bcc.b     $2d6a
  002d46  d5c3                 adda.l    d3, a2
  002d48  7003                 moveq     #$3, d0
  002d4a  c0aefffa             and.l     -$6(a6), d0
  002d4e  4a80                 tst.l     d0
  002d50  6604                 bne.b     $2d56
  002d52  7000                 moveq     #$0, d0
  002d54  600c                 bra.b     $2d62
  002d56  7003                 moveq     #$3, d0
  002d58  c0aefffa             and.l     -$6(a6), d0
  002d5c  7204                 moveq     #$4, d1
  002d5e  9280                 sub.l     d0, d1
  002d60  2001                 move.l    d1, d0
  002d62  d5c0                 adda.l    d0, a2
  002d64  d9c3                 adda.l    d3, a4
  002d66  6000020e             bra.w     $2f76
  002d6a  7000                 moveq     #$0, d0
  002d6c  302efff4             move.w    -$c(a6), d0
  002d70  908c                 sub.l     a4, d0
  002d72  9680                 sub.l     d0, d3
  002d74  7000                 moveq     #$0, d0
  002d76  302efff4             move.w    -$c(a6), d0
  002d7a  908c                 sub.l     a4, d0
  002d7c  d5c0                 adda.l    d0, a2
  002d7e  7000                 moveq     #$0, d0
  002d80  302efff4             move.w    -$c(a6), d0
  002d84  908c                 sub.l     a4, d0
  002d86  d9c0                 adda.l    d0, a4
  002d88  7000                 moveq     #$0, d0
  002d8a  302effe8             move.w    -$18(a6), d0
  002d8e  220c                 move.l    a4, d1
  002d90  d283                 add.l     d3, d1
  002d92  b280                 cmp.l     d0, d1
  002d94  6344                 bls.b     $2dda
  002d96  7000                 moveq     #$0, d0
  002d98  302effe8             move.w    -$18(a6), d0
  002d9c  b9c0                 cmpa.l    d0, a4
  002d9e  6324                 bls.b     $2dc4
  002da0  d5c3                 adda.l    d3, a2
  002da2  7003                 moveq     #$3, d0
  002da4  c0aefffa             and.l     -$6(a6), d0
  002da8  4a80                 tst.l     d0
  002daa  6604                 bne.b     $2db0
  002dac  7000                 moveq     #$0, d0
  002dae  600c                 bra.b     $2dbc
  002db0  7003                 moveq     #$3, d0
  002db2  c0aefffa             and.l     -$6(a6), d0
  002db6  7204                 moveq     #$4, d1
  002db8  9280                 sub.l     d0, d1
  002dba  2001                 move.l    d1, d0
  002dbc  d5c0                 adda.l    d0, a2
  002dbe  d9c3                 adda.l    d3, a4
  002dc0  600001b4             bra.w     $2f76
  002dc4  2d43fff6             move.l    d3, -$a(a6)
  002dc8  200c                 move.l    a4, d0
  002dca  d083                 add.l     d3, d0
  002dcc  7200                 moveq     #$0, d1
  002dce  322effe8             move.w    -$18(a6), d1
  002dd2  9081                 sub.l     d1, d0
  002dd4  9680                 sub.l     d0, d3
  002dd6  97aefff6             sub.l     d3, -$a(a6)
  002dda  d9c3                 adda.l    d3, a4
  002ddc  600000b4             bra.w     $2e92
  002de0  302e000a             move.w    $a(a6), d0
  002de4  48c0                 ext.l     d0
  002de6  5380                 subq.l    #$1, d0
  002de8  6710                 beq.b     $2dfa
  002dea  5380                 subq.l    #$1, d0
  002dec  672a                 beq.b     $2e18
  002dee  5380                 subq.l    #$1, d0
  002df0  6752                 beq.b     $2e44
  002df2  5380                 subq.l    #$1, d0
  002df4  676c                 beq.b     $2e62
  002df6  60000086             bra.w     $2e7e
  002dfa  1812                 move.b    (a2), d4
  002dfc  3047                 movea.w   d7, a0
  002dfe  2008                 move.l    a0, d0
  002e00  7209                 moveq     #$9, d1
  002e02  e3a8                 lsl.l     d1, d0
  002e04  41f900008482         lea.l     $8482.l, a0   ; g_8482
  002e0a  d1c0                 adda.l    d0, a0
  002e0c  7000                 moveq     #$0, d0
  002e0e  1004                 move.b    d4, d0
  002e10  30300a00             move.w    (a0, d0.l * 2), d0
  002e14  1680                 move.b    d0, (a3)
  002e16  6066                 bra.b     $2e7e
  002e18  1812                 move.b    (a2), d4
  002e1a  1a13                 move.b    (a3), d5
  002e1c  7000                 moveq     #$0, d0
  002e1e  1004                 move.b    d4, d0
  002e20  41f90000f482         lea.l     $f482.l, a0   ; g_f482
  002e26  32700a00             movea.w   (a0, d0.l * 2), a1
  002e2a  2009                 move.l    a1, d0
  002e2c  7209                 moveq     #$9, d1
  002e2e  e3a8                 lsl.l     d1, d0
  002e30  41f90000a482         lea.l     $a482.l, a0   ; g_a482
  002e36  d1c0                 adda.l    d0, a0
  002e38  7000                 moveq     #$0, d0
  002e3a  1005                 move.b    d5, d0
  002e3c  30300a00             move.w    (a0, d0.l * 2), d0
  002e40  1680                 move.b    d0, (a3)
  002e42  603a                 bra.b     $2e7e
  002e44  1812                 move.b    (a2), d4
  002e46  3047                 movea.w   d7, a0
  002e48  2008                 move.l    a0, d0
  002e4a  7209                 moveq     #$9, d1
  002e4c  e3a8                 lsl.l     d1, d0
  002e4e  41f90000c482         lea.l     $c482.l, a0   ; g_c482
  002e54  d1c0                 adda.l    d0, a0
  002e56  7000                 moveq     #$0, d0
  002e58  1004                 move.b    d4, d0
  002e5a  30300a00             move.w    (a0, d0.l * 2), d0
  002e5e  1680                 move.b    d0, (a3)
  002e60  601c                 bra.b     $2e7e
  002e62  1812                 move.b    (a2), d4
  002e64  3047                 movea.w   d7, a0
  002e66  2008                 move.l    a0, d0
  002e68  7209                 moveq     #$9, d1
  002e6a  e3a8                 lsl.l     d1, d0
  002e6c  41f90000d482         lea.l     $d482.l, a0   ; g_d482
  002e72  d1c0                 adda.l    d0, a0
  002e74  7000                 moveq     #$0, d0
  002e76  1004                 move.b    d4, d0
  002e78  30300a00             move.w    (a0, d0.l * 2), d0
  002e7c  1680                 move.b    d0, (a3)
  002e7e  06460100             addi.w    #$100, d6
  002e82  bc6efffe             cmp.w     -$2(a6), d6
  002e86  6d08                 blt.b     $2e90
  002e88  528a                 addq.l    #$1, a2
  002e8a  5383                 subq.l    #$1, d3
  002e8c  9c6efffe             sub.w     -$2(a6), d6
  002e90  528b                 addq.l    #$1, a3
  002e92  7001                 moveq     #$1, d0
  002e94  b680                 cmp.l     d0, d3
  002e96  6400ff48             bcc.w     $2de0
  002e9a  d7eefff6             adda.l    -$a(a6), a3
  002e9e  d5eefff6             adda.l    -$a(a6), a2
  002ea2  d9eefff6             adda.l    -$a(a6), a4
  002ea6  7003                 moveq     #$3, d0
  002ea8  c0aefffa             and.l     -$6(a6), d0
  002eac  4a80                 tst.l     d0
  002eae  6604                 bne.b     $2eb4
  002eb0  7000                 moveq     #$0, d0
  002eb2  600c                 bra.b     $2ec0
  002eb4  7003                 moveq     #$3, d0
  002eb6  c0aefffa             and.l     -$6(a6), d0
  002eba  7204                 moveq     #$4, d1
  002ebc  9280                 sub.l     d0, d1
  002ebe  2001                 move.l    d1, d0
  002ec0  d5c0                 adda.l    d0, a2
  002ec2  600000b2             bra.w     $2f76
  002ec6  302efffe             move.w    -$2(a6), d0
  002eca  48c0                 ext.l     d0
  002ecc  4c2e0000fffa         mulu.l    -$6(a6), d0
  002ed2  e088                 lsr.l     #$8, d0
  002ed4  d7c0                 adda.l    d0, a3
  002ed6  d9eefffa             adda.l    -$6(a6), a4
  002eda  6000009a             bra.w     $2f76
  002ede  7000                 moveq     #$0, d0
  002ee0  302effde             move.w    -$22(a6), d0
  002ee4  b0aeffea             cmp.l     -$16(a6), d0
  002ee8  630a                 bls.b     $2ef4
  002eea  422effe5             clr.b     -$1b(a6)
  002eee  d5eefffa             adda.l    -$6(a6), a2
  002ef2  604c                 bra.b     $2f40
  002ef4  4a2effe5             tst.b     -$1b(a6)
  002ef8  6734                 beq.b     $2f2e
  002efa  066e0100ffe6         addi.w    #$100, -$1a(a6)
  002f00  266efff0             movea.l   -$10(a6), a3
  002f04  202effe0             move.l    -$20(a6), d0
  002f08  d1aefff0             add.l     d0, -$10(a6)
  002f0c  526effdc             addq.w    #$1, -$24(a6)
  002f10  302effe6             move.w    -$1a(a6), d0
  002f14  b06efffe             cmp.w     -$2(a6), d0
  002f18  6c0a                 bge.b     $2f24
  002f1a  246effd8             movea.l   -$28(a6), a2
  002f1e  53aeffea             subq.l    #$1, -$16(a6)
  002f22  601c                 bra.b     $2f40
  002f24  302efffe             move.w    -$2(a6), d0
  002f28  916effe6             sub.w     d0, -$1a(a6)
  002f2c  6012                 bra.b     $2f40
  002f2e  1d7c0001ffe5         move.b    #$1, -$1b(a6)
  002f34  266efff0             movea.l   -$10(a6), a3
  002f38  202effe0             move.l    -$20(a6), d0
  002f3c  d1aefff0             add.l     d0, -$10(a6)
  002f40  2d4affd8             move.l    a2, -$28(a6)
  002f44  7c00                 moveq     #$0, d6
  002f46  52aeffea             addq.l    #$1, -$16(a6)
  002f4a  99cc                 suba.l    a4, a4
  002f4c  7000                 moveq     #$0, d0
  002f4e  302effde             move.w    -$22(a6), d0
  002f52  7200                 moveq     #$0, d1
  002f54  322effd6             move.w    -$2a(a6), d1
  002f58  9280                 sub.l     d0, d1
  002f5a  302effdc             move.w    -$24(a6), d0
  002f5e  48c0                 ext.l     d0
  002f60  b081                 cmp.l     d1, d0
  002f62  6f12                 ble.b     $2f76
  002f64  1d7c0001ffef         move.b    #$1, -$11(a6)
  002f6a  600a                 bra.b     $2f76
  002f6c  1d7c0001ffef         move.b    #$1, -$11(a6)
  002f72  6002                 bra.b     $2f76
  002f74  a9ff                 _Debugger 
  002f76  4a2effef             tst.b     -$11(a6)
  002f7a  6700fd7e             beq.w     $2cfa
  002f7e  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  002f82  4e5e                 unlk      a6
  002f84  4e740018             rtd       #$18

;-------------------------------------------------------------
; COPYTOSCALEPORT   (seg 2 +002fa8, 304 bytes)
  002fa8  4e56fff0             link.w    a6, #$fff0
  002fac  48e71e00             movem.l   d3-d6, -(a7)
  002fb0  382e000a             move.w    $a(a6), d4
  002fb4  362e0008             move.w    $8(a6), d3
  002fb8  302e0012             move.w    $12(a6), d0
  002fbc  48c0                 ext.l     d0
  002fbe  3a04                 move.w    d4, d5
  002fc0  48c5                 ext.l     d5
  002fc2  9a80                 sub.l     d0, d5
  002fc4  302e0010             move.w    $10(a6), d0
  002fc8  48c0                 ext.l     d0
  002fca  3c03                 move.w    d3, d6
  002fcc  48c6                 ext.l     d6
  002fce  9c80                 sub.l     d0, d6
  002fd0  b845                 cmp.w     d5, d4
  002fd2  6f02                 ble.b     $2fd6
  002fd4  3805                 move.w    d5, d4
  002fd6  b646                 cmp.w     d6, d3
  002fd8  6f02                 ble.b     $2fdc
  002fda  3606                 move.w    d6, d3
  002fdc  3004                 move.w    d4, d0
  002fde  48c0                 ext.l     d0
  002fe0  322e000e             move.w    $e(a6), d1
  002fe4  48c1                 ext.l     d1
  002fe6  d280                 add.l     d0, d1
  002fe8  0c81000001e0         cmpi.l    #$1e0, d1
  002fee  6f14                 ble.b     $3004
  002ff0  3004                 move.w    d4, d0
  002ff2  48c0                 ext.l     d0
  002ff4  322e000e             move.w    $e(a6), d1
  002ff8  48c1                 ext.l     d1
  002ffa  d280                 add.l     d0, d1
  002ffc  0681fffffe20         addi.l    #$fffffe20, d1
  003002  9841                 sub.w     d1, d4
  003004  3003                 move.w    d3, d0
  003006  48c0                 ext.l     d0
  003008  322e000c             move.w    $c(a6), d1
  00300c  48c1                 ext.l     d1
  00300e  d280                 add.l     d0, d1
  003010  0c81000001e0         cmpi.l    #$1e0, d1
  003016  6f14                 ble.b     $302c
  003018  3003                 move.w    d3, d0
  00301a  48c0                 ext.l     d0
  00301c  322e000c             move.w    $c(a6), d1
  003020  48c1                 ext.l     d1
  003022  d280                 add.l     d0, d1
  003024  0681fffffe20         addi.l    #$fffffe20, d1
  00302a  9641                 sub.w     d1, d3
  00302c  4a6e000e             tst.w     $e(a6)
  003030  6c10                 bge.b     $3042
  003032  d86e000e             add.w     $e(a6), d4
  003036  302e000e             move.w    $e(a6), d0
  00303a  916e0012             sub.w     d0, $12(a6)
  00303e  426e000e             clr.w     $e(a6)
  003042  4a6e000c             tst.w     $c(a6)
  003046  6c10                 bge.b     $3058
  003048  d66e000c             add.w     $c(a6), d3
  00304c  302e000c             move.w    $c(a6), d0
  003050  916e0010             sub.w     d0, $10(a6)
  003054  426e000c             clr.w     $c(a6)
  003058  3d6e0012fff2         move.w    $12(a6), -$e(a6)
  00305e  3d6e0010fff0         move.w    $10(a6), -$10(a6)
  003064  3004                 move.w    d4, d0
  003066  48c0                 ext.l     d0
  003068  322e0012             move.w    $12(a6), d1
  00306c  48c1                 ext.l     d1
  00306e  d280                 add.l     d0, d1
  003070  3d41fff6             move.w    d1, -$a(a6)
  003074  3003                 move.w    d3, d0
  003076  48c0                 ext.l     d0
  003078  322e0010             move.w    $10(a6), d1
  00307c  48c1                 ext.l     d1
  00307e  d280                 add.l     d0, d1
  003080  3d41fff4             move.w    d1, -$c(a6)
  003084  3d6e000efffa         move.w    $e(a6), -$6(a6)
  00308a  3d6e000cfff8         move.w    $c(a6), -$8(a6)
  003090  3004                 move.w    d4, d0
  003092  48c0                 ext.l     d0
  003094  322e000e             move.w    $e(a6), d1
  003098  48c1                 ext.l     d1
  00309a  d280                 add.l     d0, d1
  00309c  3d41fffe             move.w    d1, -$2(a6)
  0030a0  3003                 move.w    d3, d0
  0030a2  48c0                 ext.l     d0
  0030a4  322e000c             move.w    $c(a6), d1
  0030a8  48c1                 ext.l     d1
  0030aa  d280                 add.l     d0, d1
  0030ac  3d41fffc             move.w    d1, -$4(a6)
  0030b0  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  0030b6  48790000f688         pea.l     $f688.l   ; g_f688
  0030bc  486efff8             pea.l     -$8(a6)
  0030c0  486efff0             pea.l     -$10(a6)
  0030c4  1f3c0001             move.b    #$1, -(a7)
  0030c8  4eb900000120         jsr       $120.l   ; SATCOPYBITS
  0030ce  4cdf0078             movem.l   (a7)+, d3-d6
  0030d2  4e5e                 unlk      a6
  0030d4  4e740010             rtd       #$10

;-------------------------------------------------------------
; ComboRectBlit   (seg 2 +0030ea, 532 bytes)
  0030ea  4e56fff6             link.w    a6, #$fff6
  0030ee  48e70f18             movem.l   d4-d7/a3-a4, -(a7)
  0030f2  286e0010             movea.l   $10(a6), a4
  0030f6  422efff7             clr.b     -$9(a6)
  0030fa  4a54                 tst.w     (a4)
  0030fc  6c0e                 bge.b     $310c
  0030fe  4254                 clr.w     (a4)
  003100  4aae0014             tst.l     $14(a6)
  003104  6706                 beq.b     $310c
  003106  206e0014             movea.l   $14(a6), a0
  00310a  4250                 clr.w     (a0)
  00310c  302c0004             move.w    $4(a4), d0
  003110  b079ffffe80a         cmp.w     $ffffe80a.l, d0   ; g_-17f6
  003116  6f1a                 ble.b     $3132
  003118  3979ffffe80a0004     move.w    $ffffe80a.l, $4(a4)   ; g_-17f6
  003120  4aae0014             tst.l     $14(a6)
  003124  670c                 beq.b     $3132
  003126  206e0014             movea.l   $14(a6), a0
  00312a  3179ffffe80a0004     move.w    $ffffe80a.l, $4(a0)   ; g_-17f6
  003132  206e0008             movea.l   $8(a6), a0
  003136  30280002             move.w    $2(a0), d0
  00313a  48c0                 ext.l     d0
  00313c  206e0008             movea.l   $8(a6), a0
  003140  38280006             move.w    $6(a0), d4
  003144  48c4                 ext.l     d4
  003146  9880                 sub.l     d0, d4
  003148  4aae000c             tst.l     $c(a6)
  00314c  6716                 beq.b     $3164
  00314e  206e000c             movea.l   $c(a6), a0
  003152  30280002             move.w    $2(a0), d0
  003156  48c0                 ext.l     d0
  003158  206e000c             movea.l   $c(a6), a0
  00315c  34280006             move.w    $6(a0), d2
  003160  48c2                 ext.l     d2
  003162  9480                 sub.l     d0, d2
  003164  2c04                 move.l    d4, d6
  003166  e486                 asr.l     #$2, d6
  003168  4aae000c             tst.l     $c(a6)
  00316c  6704                 beq.b     $3172
  00316e  2e02                 move.l    d2, d7
  003170  e487                 asr.l     #$2, d7
  003172  206e0008             movea.l   $8(a6), a0
  003176  30280002             move.w    $2(a0), d0
  00317a  48c0                 ext.l     d0
  00317c  206e0008             movea.l   $8(a6), a0
  003180  32280006             move.w    $6(a0), d1
  003184  48c1                 ext.l     d1
  003186  9280                 sub.l     d0, d1
  003188  2006                 move.l    d6, d0
  00318a  e588                 lsl.l     #$2, d0
  00318c  9280                 sub.l     d0, d1
  00318e  2d41fffc             move.l    d1, -$4(a6)
  003192  4aae000c             tst.l     $c(a6)
  003196  670c                 beq.b     $31a4
  003198  2007                 move.l    d7, d0
  00319a  e588                 lsl.l     #$2, d0
  00319c  2202                 move.l    d2, d1
  00319e  9280                 sub.l     d0, d1
  0031a0  2d41fff8             move.l    d1, -$8(a6)
  0031a4  4a2e0018             tst.b     $18(a6)
  0031a8  6754                 beq.b     $31fe
  0031aa  4a2e001a             tst.b     $1a(a6)
  0031ae  6738                 beq.b     $31e8
  0031b0  4a3900006ab4         tst.b     $6ab4.l   ; g_6ab4
  0031b6  6718                 beq.b     $31d0
  0031b8  3014                 move.w    (a4), d0
  0031ba  7201                 moveq     #$1, d1
  0031bc  c081                 and.l     d1, d0
  0031be  673e                 beq.b     $31fe
  0031c0  1d7c0001fff7         move.b    #$1, -$9(a6)
  0031c6  5254                 addq.w    #$1, (a4)
  0031c8  206e0008             movea.l   $8(a6), a0
  0031cc  5250                 addq.w    #$1, (a0)
  0031ce  602e                 bra.b     $31fe
  0031d0  3014                 move.w    (a4), d0
  0031d2  7201                 moveq     #$1, d1
  0031d4  c081                 and.l     d1, d0
  0031d6  6626                 bne.b     $31fe
  0031d8  1d7c0001fff7         move.b    #$1, -$9(a6)
  0031de  5254                 addq.w    #$1, (a4)
  0031e0  206e0008             movea.l   $8(a6), a0
  0031e4  5250                 addq.w    #$1, (a0)
  0031e6  6016                 bra.b     $31fe
  0031e8  3014                 move.w    (a4), d0
  0031ea  7201                 moveq     #$1, d1
  0031ec  c081                 and.l     d1, d0
  0031ee  670e                 beq.b     $31fe
  0031f0  1d7c0001fff7         move.b    #$1, -$9(a6)
  0031f6  5254                 addq.w    #$1, (a4)
  0031f8  206e0008             movea.l   $8(a6), a0
  0031fc  5250                 addq.w    #$1, (a0)
  0031fe  3054                 movea.w   (a4), a0
  003200  2808                 move.l    a0, d4
  003202  600000bc             bra.w     $32c0
  003206  3a14                 move.w    (a4), d5
  003208  48c5                 ext.l     d5
  00320a  2204                 move.l    d4, d1
  00320c  9285                 sub.l     d5, d1
  00320e  206e0008             movea.l   $8(a6), a0
  003212  3a10                 move.w    (a0), d5
  003214  48c5                 ext.l     d5
  003216  da81                 add.l     d1, d5
  003218  206e0008             movea.l   $8(a6), a0
  00321c  2279ffffe814         movea.l   $ffffe814.l, a1   ; g_-17ec
  003222  22715c00             movea.l   (a1, d5.l * 4), a1
  003226  d2e80002             adda.w    $2(a0), a1
  00322a  2679ffffe7f6         movea.l   $ffffe7f6.l, a3   ; g_-180a
  003230  26734c00             movea.l   (a3, d4.l * 4), a3
  003234  d6ec0002             adda.w    $2(a4), a3
  003238  7400                 moveq     #$0, d2
  00323a  6008                 bra.b     $3244
  00323c  27b12c002c00         move.l    (a1, d2.l * 4), (a3, d2.l * 4)
  003242  5282                 addq.l    #$1, d2
  003244  b486                 cmp.l     d6, d2
  003246  6df4                 blt.b     $323c
  003248  2006                 move.l    d6, d0
  00324a  e588                 lsl.l     #$2, d0
  00324c  d3c0                 adda.l    d0, a1
  00324e  2006                 move.l    d6, d0
  003250  e588                 lsl.l     #$2, d0
  003252  d7c0                 adda.l    d0, a3
  003254  7002                 moveq     #$2, d0
  003256  c0aefffc             and.l     -$4(a6), d0
  00325a  6702                 beq.b     $325e
  00325c  36d9                 move.w    (a1)+, (a3)+
  00325e  7001                 moveq     #$1, d0
  003260  c0aefffc             and.l     -$4(a6), d0
  003264  6702                 beq.b     $3268
  003266  16d9                 move.b    (a1)+, (a3)+
  003268  4aae000c             tst.l     $c(a6)
  00326c  6748                 beq.b     $32b6
  00326e  206e000c             movea.l   $c(a6), a0
  003272  2279ffffe814         movea.l   $ffffe814.l, a1   ; g_-17ec
  003278  22715c00             movea.l   (a1, d5.l * 4), a1
  00327c  d2e80002             adda.w    $2(a0), a1
  003280  206e0014             movea.l   $14(a6), a0
  003284  2679ffffe7f6         movea.l   $ffffe7f6.l, a3   ; g_-180a
  00328a  26734c00             movea.l   (a3, d4.l * 4), a3
  00328e  d6e80002             adda.w    $2(a0), a3
  003292  7002                 moveq     #$2, d0
  003294  c0aefff8             and.l     -$8(a6), d0
  003298  6702                 beq.b     $329c
  00329a  36d9                 move.w    (a1)+, (a3)+
  00329c  7001                 moveq     #$1, d0
  00329e  c0aefff8             and.l     -$8(a6), d0
  0032a2  6702                 beq.b     $32a6
  0032a4  16d9                 move.b    (a1)+, (a3)+
  0032a6  7400                 moveq     #$0, d2
  0032a8  6008                 bra.b     $32b2
  0032aa  27b12c002c00         move.l    (a1, d2.l * 4), (a3, d2.l * 4)
  0032b0  5282                 addq.l    #$1, d2
  0032b2  b487                 cmp.l     d7, d2
  0032b4  6df4                 blt.b     $32aa
  0032b6  7000                 moveq     #$0, d0
  0032b8  102e0018             move.b    $18(a6), d0
  0032bc  5280                 addq.l    #$1, d0
  0032be  d880                 add.l     d0, d4
  0032c0  302c0004             move.w    $4(a4), d0
  0032c4  48c0                 ext.l     d0
  0032c6  b880                 cmp.l     d0, d4
  0032c8  6d00ff3c             blt.w     $3206
  0032cc  4a2e0018             tst.b     $18(a6)
  0032d0  6724                 beq.b     $32f6
  0032d2  4a2e001a             tst.b     $1a(a6)
  0032d6  6710                 beq.b     $32e8
  0032d8  4a2efff7             tst.b     -$9(a6)
  0032dc  6718                 beq.b     $32f6
  0032de  206e0008             movea.l   $8(a6), a0
  0032e2  5350                 subq.w    #$1, (a0)
  0032e4  5354                 subq.w    #$1, (a4)
  0032e6  600e                 bra.b     $32f6
  0032e8  4a2efff7             tst.b     -$9(a6)
  0032ec  6708                 beq.b     $32f6
  0032ee  5354                 subq.w    #$1, (a4)
  0032f0  206e0008             movea.l   $8(a6), a0
  0032f4  5350                 subq.w    #$1, (a0)
  0032f6  4cdf18f0             movem.l   (a7)+, d4-d7/a3-a4
  0032fa  4e5e                 unlk      a6
  0032fc  4e75                 rts       

;-------------------------------------------------------------
; COPYDIRTYRECT   (seg 2 +00330e, 546 bytes)
  00330e  4e56fff0             link.w    a6, #$fff0
  003312  48e71c00             movem.l   d3-d5, -(a7)
  003316  382e000a             move.w    $a(a6), d4
  00331a  362e0008             move.w    $8(a6), d3
  00331e  302e0012             move.w    $12(a6), d0
  003322  48c0                 ext.l     d0
  003324  3a04                 move.w    d4, d5
  003326  48c5                 ext.l     d5
  003328  9a80                 sub.l     d0, d5
  00332a  302e0010             move.w    $10(a6), d0
  00332e  48c0                 ext.l     d0
  003330  3a03                 move.w    d3, d5
  003332  48c5                 ext.l     d5
  003334  9a80                 sub.l     d0, d5
  003336  0c440096             cmpi.w    #$96, d4
  00333a  6e06                 bgt.b     $3342
  00333c  0c430096             cmpi.w    #$96, d3
  003340  6f02                 ble.b     $3344
  003342  7a00                 moveq     #$0, d5
  003344  3004                 move.w    d4, d0
  003346  48c0                 ext.l     d0
  003348  322e000e             move.w    $e(a6), d1
  00334c  48c1                 ext.l     d1
  00334e  d280                 add.l     d0, d1
  003350  0c81000001e0         cmpi.l    #$1e0, d1
  003356  6f14                 ble.b     $336c
  003358  3004                 move.w    d4, d0
  00335a  48c0                 ext.l     d0
  00335c  322e000e             move.w    $e(a6), d1
  003360  48c1                 ext.l     d1
  003362  d280                 add.l     d0, d1
  003364  0681fffffe20         addi.l    #$fffffe20, d1
  00336a  9841                 sub.w     d1, d4
  00336c  3003                 move.w    d3, d0
  00336e  48c0                 ext.l     d0
  003370  322e000c             move.w    $c(a6), d1
  003374  48c1                 ext.l     d1
  003376  d280                 add.l     d0, d1
  003378  0c81000001e0         cmpi.l    #$1e0, d1
  00337e  6f14                 ble.b     $3394
  003380  3003                 move.w    d3, d0
  003382  48c0                 ext.l     d0
  003384  322e000c             move.w    $c(a6), d1
  003388  48c1                 ext.l     d1
  00338a  d280                 add.l     d0, d1
  00338c  0681fffffe20         addi.l    #$fffffe20, d1
  003392  9641                 sub.w     d1, d3
  003394  4a6e000e             tst.w     $e(a6)
  003398  6c10                 bge.b     $33aa
  00339a  d86e000e             add.w     $e(a6), d4
  00339e  302e000e             move.w    $e(a6), d0
  0033a2  916e0012             sub.w     d0, $12(a6)
  0033a6  426e000e             clr.w     $e(a6)
  0033aa  4a6e000c             tst.w     $c(a6)
  0033ae  6c10                 bge.b     $33c0
  0033b0  d66e000c             add.w     $c(a6), d3
  0033b4  302e000c             move.w    $c(a6), d0
  0033b8  916e0010             sub.w     d0, $10(a6)
  0033bc  426e000c             clr.w     $c(a6)
  0033c0  0c6e00100012         cmpi.w    #$10, $12(a6)
  0033c6  6c22                 bge.b     $33ea
  0033c8  3d7c00100012         move.w    #$10, $12(a6)
  0033ce  302e0012             move.w    $12(a6), d0
  0033d2  48c0                 ext.l     d0
  0033d4  7210                 moveq     #$10, d1
  0033d6  9280                 sub.l     d0, d1
  0033d8  d36e000e             add.w     d1, $e(a6)
  0033dc  302e0012             move.w    $12(a6), d0
  0033e0  48c0                 ext.l     d0
  0033e2  7210                 moveq     #$10, d1
  0033e4  9280                 sub.l     d0, d1
  0033e6  9841                 sub.w     d1, d4
  0033e8  6032                 bra.b     $341c
  0033ea  3004                 move.w    d4, d0
  0033ec  48c0                 ext.l     d0
  0033ee  322e0012             move.w    $12(a6), d1
  0033f2  48c1                 ext.l     d1
  0033f4  d280                 add.l     d0, d1
  0033f6  0c81000001d0         cmpi.l    #$1d0, d1
  0033fc  6f1e                 ble.b     $341c
  0033fe  0c6e01d00012         cmpi.w    #$1d0, $12(a6)
  003404  6e000120             bgt.w     $3526
  003408  3004                 move.w    d4, d0
  00340a  48c0                 ext.l     d0
  00340c  322e0012             move.w    $12(a6), d1
  003410  48c1                 ext.l     d1
  003412  d280                 add.l     d0, d1
  003414  0681fffffe30         addi.l    #$fffffe30, d1
  00341a  9841                 sub.w     d1, d4
  00341c  0c6e00100010         cmpi.w    #$10, $10(a6)
  003422  6c22                 bge.b     $3446
  003424  3d7c00100010         move.w    #$10, $10(a6)
  00342a  302e0010             move.w    $10(a6), d0
  00342e  48c0                 ext.l     d0
  003430  7210                 moveq     #$10, d1
  003432  9280                 sub.l     d0, d1
  003434  d36e000c             add.w     d1, $c(a6)
  003438  302e0010             move.w    $10(a6), d0
  00343c  48c0                 ext.l     d0
  00343e  7210                 moveq     #$10, d1
  003440  9280                 sub.l     d0, d1
  003442  9641                 sub.w     d1, d3
  003444  6032                 bra.b     $3478
  003446  3003                 move.w    d3, d0
  003448  48c0                 ext.l     d0
  00344a  322e0010             move.w    $10(a6), d1
  00344e  48c1                 ext.l     d1
  003450  d280                 add.l     d0, d1
  003452  0c81000001d0         cmpi.l    #$1d0, d1
  003458  6f1e                 ble.b     $3478
  00345a  0c6e01d00010         cmpi.w    #$1d0, $10(a6)
  003460  6e0000c4             bgt.w     $3526
  003464  3003                 move.w    d3, d0
  003466  48c0                 ext.l     d0
  003468  322e0010             move.w    $10(a6), d1
  00346c  48c1                 ext.l     d1
  00346e  d280                 add.l     d0, d1
  003470  0681fffffe30         addi.l    #$fffffe30, d1
  003476  9641                 sub.w     d1, d3
  003478  3d6e0012fff2         move.w    $12(a6), -$e(a6)
  00347e  3d6e0010fff0         move.w    $10(a6), -$10(a6)
  003484  3004                 move.w    d4, d0
  003486  48c0                 ext.l     d0
  003488  322e0012             move.w    $12(a6), d1
  00348c  48c1                 ext.l     d1
  00348e  d280                 add.l     d0, d1
  003490  3d41fff6             move.w    d1, -$a(a6)
  003494  3003                 move.w    d3, d0
  003496  48c0                 ext.l     d0
  003498  322e0010             move.w    $10(a6), d1
  00349c  48c1                 ext.l     d1
  00349e  d280                 add.l     d0, d1
  0034a0  3d41fff4             move.w    d1, -$c(a6)
  0034a4  3d6e000efffa         move.w    $e(a6), -$6(a6)
  0034aa  3d6e000cfff8         move.w    $c(a6), -$8(a6)
  0034b0  3004                 move.w    d4, d0
  0034b2  48c0                 ext.l     d0
  0034b4  322e000e             move.w    $e(a6), d1
  0034b8  48c1                 ext.l     d1
  0034ba  d280                 add.l     d0, d1
  0034bc  3d41fffe             move.w    d1, -$2(a6)
  0034c0  3003                 move.w    d3, d0
  0034c2  48c0                 ext.l     d0
  0034c4  322e000c             move.w    $c(a6), d1
  0034c8  48c1                 ext.l     d1
  0034ca  d280                 add.l     d0, d1
  0034cc  3d41fffc             move.w    d1, -$4(a6)
  0034d0  4a39000046cd         tst.b     $46cd.l   ; g_46cd
  0034d6  6734                 beq.b     $350c
  0034d8  4a3900006174         tst.b     $6174.l   ; prefInterlace
  0034de  672c                 beq.b     $350c
  0034e0  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  0034e6  6624                 bne.b     $350c
  0034e8  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  0034ee  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  0034f4  42a7                 clr.l     -(a7)
  0034f6  486efff0             pea.l     -$10(a6)
  0034fa  42a7                 clr.l     -(a7)
  0034fc  486efff8             pea.l     -$8(a6)
  003500  61fffffffbe8         bsr.l     $30ea   ; ComboRectBlit
  003506  4fef0014             lea.l     $14(a7), a7
  00350a  601a                 bra.b     $3526
  00350c  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  003512  486efff8             pea.l     -$8(a6)
  003516  486efff0             pea.l     -$10(a6)
  00351a  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  003520  4eb900000128         jsr       $128.l   ; SATCOPYBITSTOSCREEN
  003526  4cdf0038             movem.l   (a7)+, d3-d5
  00352a  4e5e                 unlk      a6
  00352c  4e740010             rtd       #$10

;-------------------------------------------------------------
; DEBUGHOOK   (seg 2 +003540, 28 bytes)
  003540  4e56fffe             link.w    a6, #$fffe
  003544  3f3c0071             move.w    #$71, -(a7)
  003548  61ff00002ab8         bsr.l     $6002   ; IsPressed
  00354e  4a00                 tst.b     d0
  003550  544f                 addq.w    #$2, a7
  003552  6704                 beq.b     $3558
  003554  426efffe             clr.w     -$2(a6)
  003558  4e5e                 unlk      a6
  00355a  4e75                 rts       

;-------------------------------------------------------------
; COPYSCALEPORTBACK   (seg 2 +003568, 284 bytes)
  003568  4e56fff0             link.w    a6, #$fff0
  00356c  48e71e00             movem.l   d3-d6, -(a7)
  003570  382e000a             move.w    $a(a6), d4
  003574  362e0008             move.w    $8(a6), d3
  003578  302e0012             move.w    $12(a6), d0
  00357c  48c0                 ext.l     d0
  00357e  3a04                 move.w    d4, d5
  003580  48c5                 ext.l     d5
  003582  9a80                 sub.l     d0, d5
  003584  302e0010             move.w    $10(a6), d0
  003588  48c0                 ext.l     d0
  00358a  3c03                 move.w    d3, d6
  00358c  48c6                 ext.l     d6
  00358e  9c80                 sub.l     d0, d6
  003590  b845                 cmp.w     d5, d4
  003592  6f02                 ble.b     $3596
  003594  3805                 move.w    d5, d4
  003596  b646                 cmp.w     d6, d3
  003598  6f02                 ble.b     $359c
  00359a  3606                 move.w    d6, d3
  00359c  3004                 move.w    d4, d0
  00359e  48c0                 ext.l     d0
  0035a0  322e0012             move.w    $12(a6), d1
  0035a4  48c1                 ext.l     d1
  0035a6  d280                 add.l     d0, d1
  0035a8  0c8100000080         cmpi.l    #$80, d1
  0035ae  6f12                 ble.b     $35c2
  0035b0  3004                 move.w    d4, d0
  0035b2  48c0                 ext.l     d0
  0035b4  322e0012             move.w    $12(a6), d1
  0035b8  48c1                 ext.l     d1
  0035ba  d280                 add.l     d0, d1
  0035bc  7080                 moveq     #$80, d0
  0035be  d280                 add.l     d0, d1
  0035c0  9841                 sub.w     d1, d4
  0035c2  3003                 move.w    d3, d0
  0035c4  48c0                 ext.l     d0
  0035c6  322e0010             move.w    $10(a6), d1
  0035ca  48c1                 ext.l     d1
  0035cc  d280                 add.l     d0, d1
  0035ce  0c8100000080         cmpi.l    #$80, d1
  0035d4  6f12                 ble.b     $35e8
  0035d6  3003                 move.w    d3, d0
  0035d8  48c0                 ext.l     d0
  0035da  322e0010             move.w    $10(a6), d1
  0035de  48c1                 ext.l     d1
  0035e0  d280                 add.l     d0, d1
  0035e2  7080                 moveq     #$80, d0
  0035e4  d280                 add.l     d0, d1
  0035e6  9641                 sub.w     d1, d3
  0035e8  4a6e0012             tst.w     $12(a6)
  0035ec  6c08                 bge.b     $35f6
  0035ee  d86e0012             add.w     $12(a6), d4
  0035f2  426e0012             clr.w     $12(a6)
  0035f6  4a6e0010             tst.w     $10(a6)
  0035fa  6c08                 bge.b     $3604
  0035fc  d66e0010             add.w     $10(a6), d3
  003600  426e0010             clr.w     $10(a6)
  003604  3d6e0012fffa         move.w    $12(a6), -$6(a6)
  00360a  3d6e0010fff8         move.w    $10(a6), -$8(a6)
  003610  3004                 move.w    d4, d0
  003612  48c0                 ext.l     d0
  003614  322e0012             move.w    $12(a6), d1
  003618  48c1                 ext.l     d1
  00361a  d280                 add.l     d0, d1
  00361c  3d41fffe             move.w    d1, -$2(a6)
  003620  3003                 move.w    d3, d0
  003622  48c0                 ext.l     d0
  003624  322e0010             move.w    $10(a6), d1
  003628  48c1                 ext.l     d1
  00362a  d280                 add.l     d0, d1
  00362c  3d41fffc             move.w    d1, -$4(a6)
  003630  3d6e000efff2         move.w    $e(a6), -$e(a6)
  003636  3d6e000cfff0         move.w    $c(a6), -$10(a6)
  00363c  3004                 move.w    d4, d0
  00363e  48c0                 ext.l     d0
  003640  322e000e             move.w    $e(a6), d1
  003644  48c1                 ext.l     d1
  003646  d280                 add.l     d0, d1
  003648  3d41fff6             move.w    d1, -$a(a6)
  00364c  3003                 move.w    d3, d0
  00364e  48c0                 ext.l     d0
  003650  322e000c             move.w    $c(a6), d1
  003654  48c1                 ext.l     d1
  003656  d280                 add.l     d0, d1
  003658  3d41fff4             move.w    d1, -$c(a6)
  00365c  48790000f688         pea.l     $f688.l   ; g_f688
  003662  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  003668  486efff8             pea.l     -$8(a6)
  00366c  486efff0             pea.l     -$10(a6)
  003670  1f3c0001             move.b    #$1, -(a7)
  003674  4eb900000120         jsr       $120.l   ; SATCOPYBITS
  00367a  4cdf0078             movem.l   (a7)+, d3-d6
  00367e  4e5e                 unlk      a6
  003680  4e740010             rtd       #$10

;-------------------------------------------------------------
; GETSCALEPORT   (seg 2 +003698, 22 bytes)
  003698  4e560000             link.w    a6, #$0
  00369c  41f90000f688         lea.l     $f688.l, a0   ; g_f688
  0036a2  226e0008             movea.l   $8(a6), a1
  0036a6  2288                 move.l    a0, (a1)
  0036a8  4e5e                 unlk      a6
  0036aa  4e740004             rtd       #$4

;-------------------------------------------------------------
; SHOULDSCALE   (seg 2 +0036be, 46 bytes)
  0036be  4e560000             link.w    a6, #$0
  0036c2  206e0008             movea.l   $8(a6), a0
  0036c6  0c6801000052         cmpi.w    #$100, $52(a0)
  0036cc  6614                 bne.b     $36e2
  0036ce  206e0008             movea.l   $8(a6), a0
  0036d2  0c6801000054         cmpi.w    #$100, $54(a0)
  0036d8  6608                 bne.b     $36e2
  0036da  1f7c0001000c         move.b    #$1, $c(a7)
  0036e0  6004                 bra.b     $36e6
  0036e2  422f000c             clr.b     $c(a7)
  0036e6  4e5e                 unlk      a6
  0036e8  4e740004             rtd       #$4

;-------------------------------------------------------------
; BLITENCFACE   (seg 2 +0036fa, 528 bytes)
  0036fa  4e56fffe             link.w    a6, #$fffe
  0036fe  48e71f30             movem.l   d3-d7/a2-a3, -(a7)
  003702  246e001c             movea.l   $1c(a6), a2
  003706  266e0018             movea.l   $18(a6), a3
  00370a  382e000e             move.w    $e(a6), d4
  00370e  362e000c             move.w    $c(a6), d3
  003712  3c2e000a             move.w    $a(a6), d6
  003716  3a2e0008             move.w    $8(a6), d5
  00371a  7e00                 moveq     #$0, d7
  00371c  200a                 move.l    a2, d0
  00371e  670001e0             beq.w     $3900
  003722  4aaa0010             tst.l     $10(a2)
  003726  670001d8             beq.w     $3900
  00372a  206a0010             movea.l   $10(a2), a0
  00372e  4a90                 tst.l     (a0)
  003730  670001ce             beq.w     $3900
  003734  4a46                 tst.w     d6
  003736  6600008c             bne.w     $37c4
  00373a  4a45                 tst.w     d5
  00373c  66000086             bne.w     $37c4
  003740  4a6e0016             tst.w     $16(a6)
  003744  6664                 bne.b     $37aa
  003746  4a6e0014             tst.w     $14(a6)
  00374a  665e                 bne.b     $37aa
  00374c  4a6e0012             tst.w     $12(a6)
  003750  6d58                 blt.b     $37aa
  003752  4a6e0010             tst.w     $10(a6)
  003756  6d52                 blt.b     $37aa
  003758  b86a0006             cmp.w     $6(a2), d4
  00375c  664c                 bne.b     $37aa
  00375e  b66a0004             cmp.w     $4(a2), d3
  003762  6646                 bne.b     $37aa
  003764  302b0012             move.w    $12(a3), d0
  003768  48c0                 ext.l     d0
  00376a  3204                 move.w    d4, d1
  00376c  48c1                 ext.l     d1
  00376e  342e0012             move.w    $12(a6), d2
  003772  48c2                 ext.l     d2
  003774  d481                 add.l     d1, d2
  003776  b480                 cmp.l     d0, d2
  003778  6e30                 bgt.b     $37aa
  00377a  302b0010             move.w    $10(a3), d0
  00377e  48c0                 ext.l     d0
  003780  3203                 move.w    d3, d1
  003782  48c1                 ext.l     d1
  003784  342e0010             move.w    $10(a6), d2
  003788  48c2                 ext.l     d2
  00378a  d481                 add.l     d1, d2
  00378c  b480                 cmp.l     d0, d2
  00378e  6e1a                 bgt.b     $37aa
  003790  2f0a                 move.l    a2, -(a7)
  003792  2f0b                 move.l    a3, -(a7)
  003794  2f2e0014             move.l    $14(a6), -(a7)
  003798  2f2e0010             move.l    $10(a6), -(a7)
  00379c  3f04                 move.w    d4, -(a7)
  00379e  3f03                 move.w    d3, -(a7)
  0037a0  61ffffffe148         bsr.l     $18ea   ; BLITENCFACENOCLIP
  0037a6  60000158             bra.w     $3900
  0037aa  2f0a                 move.l    a2, -(a7)
  0037ac  2f0b                 move.l    a3, -(a7)
  0037ae  2f2e0014             move.l    $14(a6), -(a7)
  0037b2  2f2e0010             move.l    $10(a6), -(a7)
  0037b6  3f04                 move.w    d4, -(a7)
  0037b8  3f03                 move.w    d3, -(a7)
  0037ba  61ffffffde78         bsr.l     $1634   ; BLITENCFACECLIP
  0037c0  6000013e             bra.w     $3900
  0037c4  0c450020             cmpi.w    #$20, d5
  0037c8  6c00009c             bge.w     $3866
  0037cc  0c460001             cmpi.w    #$1, d6
  0037d0  6608                 bne.b     $37da
  0037d2  0c45ffff             cmpi.w    #$ffff, d5
  0037d6  6602                 bne.b     $37da
  0037d8  7c02                 moveq     #$2, d6
  0037da  4a6e0016             tst.w     $16(a6)
  0037de  6668                 bne.b     $3848
  0037e0  4a6e0014             tst.w     $14(a6)
  0037e4  6662                 bne.b     $3848
  0037e6  4a6e0012             tst.w     $12(a6)
  0037ea  6d5c                 blt.b     $3848
  0037ec  4a6e0010             tst.w     $10(a6)
  0037f0  6d56                 blt.b     $3848
  0037f2  b86a0006             cmp.w     $6(a2), d4
  0037f6  6650                 bne.b     $3848
  0037f8  b66a0004             cmp.w     $4(a2), d3
  0037fc  664a                 bne.b     $3848
  0037fe  302b0012             move.w    $12(a3), d0
  003802  48c0                 ext.l     d0
  003804  3204                 move.w    d4, d1
  003806  48c1                 ext.l     d1
  003808  342e0012             move.w    $12(a6), d2
  00380c  48c2                 ext.l     d2
  00380e  d481                 add.l     d1, d2
  003810  b480                 cmp.l     d0, d2
  003812  6e34                 bgt.b     $3848
  003814  302b0010             move.w    $10(a3), d0
  003818  48c0                 ext.l     d0
  00381a  3203                 move.w    d3, d1
  00381c  48c1                 ext.l     d1
  00381e  342e0010             move.w    $10(a6), d2
  003822  48c2                 ext.l     d2
  003824  d481                 add.l     d1, d2
  003826  b480                 cmp.l     d0, d2
  003828  6e1e                 bgt.b     $3848
  00382a  2f0a                 move.l    a2, -(a7)
  00382c  2f0b                 move.l    a3, -(a7)
  00382e  2f2e0014             move.l    $14(a6), -(a7)
  003832  2f2e0010             move.l    $10(a6), -(a7)
  003836  3f04                 move.w    d4, -(a7)
  003838  3f03                 move.w    d3, -(a7)
  00383a  3f06                 move.w    d6, -(a7)
  00383c  3f05                 move.w    d5, -(a7)
  00383e  61ffffffe532         bsr.l     $1d72   ; BLITENCFACESPECIALNOCLIP
  003844  600000ba             bra.w     $3900
  003848  2f0a                 move.l    a2, -(a7)
  00384a  2f0b                 move.l    a3, -(a7)
  00384c  2f2e0014             move.l    $14(a6), -(a7)
  003850  2f2e0010             move.l    $10(a6), -(a7)
  003854  3f04                 move.w    d4, -(a7)
  003856  3f03                 move.w    d3, -(a7)
  003858  3f06                 move.w    d6, -(a7)
  00385a  3f05                 move.w    d5, -(a7)
  00385c  61ffffffe180         bsr.l     $19de   ; BLITENCFACESPECIALCLIP
  003862  6000009c             bra.w     $3900
  003866  3e05                 move.w    d5, d7
  003868  48c7                 ext.l     d7
  00386a  ea87                 asr.l     #$5, d7
  00386c  3007                 move.w    d7, d0
  00386e  48c0                 ext.l     d0
  003870  eb88                 lsl.l     #$5, d0
  003872  3205                 move.w    d5, d1
  003874  48c1                 ext.l     d1
  003876  9280                 sub.l     d0, d1
  003878  3d41fffe             move.w    d1, -$2(a6)
  00387c  4a6efffe             tst.w     -$2(a6)
  003880  6704                 beq.b     $3886
  003882  4a46                 tst.w     d6
  003884  663e                 bne.b     $38c4
  003886  0c470100             cmpi.w    #$100, d7
  00388a  6e1c                 bgt.b     $38a8
  00388c  2f0a                 move.l    a2, -(a7)
  00388e  2f0b                 move.l    a3, -(a7)
  003890  2f2e0014             move.l    $14(a6), -(a7)
  003894  2f2e0010             move.l    $10(a6), -(a7)
  003898  3f04                 move.w    d4, -(a7)
  00389a  3f03                 move.w    d3, -(a7)
  00389c  3f06                 move.w    d6, -(a7)
  00389e  3f05                 move.w    d5, -(a7)
  0038a0  61ffffffe694         bsr.l     $1f36   ; BLITENCFACESCALEDOWNCLIP
  0038a6  6058                 bra.b     $3900
  0038a8  2f0a                 move.l    a2, -(a7)
  0038aa  2f0b                 move.l    a3, -(a7)
  0038ac  2f2e0014             move.l    $14(a6), -(a7)
  0038b0  2f2e0010             move.l    $10(a6), -(a7)
  0038b4  3f04                 move.w    d4, -(a7)
  0038b6  3f03                 move.w    d3, -(a7)
  0038b8  3f06                 move.w    d6, -(a7)
  0038ba  3f05                 move.w    d5, -(a7)
  0038bc  61ffffffe98c         bsr.l     $224a   ; BLITENCFACESCALEUPCLIP
  0038c2  603c                 bra.b     $3900
  0038c4  0c470100             cmpi.w    #$100, d7
  0038c8  6e1c                 bgt.b     $38e6
  0038ca  2f0a                 move.l    a2, -(a7)
  0038cc  2f0b                 move.l    a3, -(a7)
  0038ce  2f2e0014             move.l    $14(a6), -(a7)
  0038d2  2f2e0010             move.l    $10(a6), -(a7)
  0038d6  3f04                 move.w    d4, -(a7)
  0038d8  3f03                 move.w    d3, -(a7)
  0038da  3f06                 move.w    d6, -(a7)
  0038dc  3f05                 move.w    d5, -(a7)
  0038de  61ffffffed94         bsr.l     $2674   ; BLITENCFACESCALEDOWNSPECIALCLIP
  0038e4  601a                 bra.b     $3900
  0038e6  2f0a                 move.l    a2, -(a7)
  0038e8  2f0b                 move.l    a3, -(a7)
  0038ea  2f2e0014             move.l    $14(a6), -(a7)
  0038ee  2f2e0010             move.l    $10(a6), -(a7)
  0038f2  3f04                 move.w    d4, -(a7)
  0038f4  3f03                 move.w    d3, -(a7)
  0038f6  3f06                 move.w    d6, -(a7)
  0038f8  3f05                 move.w    d5, -(a7)
  0038fa  61fffffff186         bsr.l     $2a82   ; BLITENCFACESCALEUPSPECIALCLIP
  003900  4cdf0cf8             movem.l   (a7)+, d3-d7/a2-a3
  003904  4e5e                 unlk      a6
  003906  4e740018             rtd       #$18

;-------------------------------------------------------------
; BLITENCFACEPROC   (seg 2 +003918, 118 bytes)
  003918  4e560000             link.w    a6, #$0
  00391c  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  003920  286e001c             movea.l   $1c(a6), a4
  003924  246e0018             movea.l   $18(a6), a2
  003928  266e0014             movea.l   $14(a6), a3
  00392c  382e000a             move.w    $a(a6), d4
  003930  362e0008             move.w    $8(a6), d3
  003934  200a                 move.l    a2, d0
  003936  6710                 beq.b     $3948
  003938  0c6a01000052         cmpi.w    #$100, $52(a2)
  00393e  6622                 bne.b     $3962
  003940  0c6a01000054         cmpi.w    #$100, $54(a2)
  003946  661a                 bne.b     $3962
  003948  2f0c                 move.l    a4, -(a7)
  00394a  2f0b                 move.l    a3, -(a7)
  00394c  2f2e0010             move.l    $10(a6), -(a7)
  003950  2f2e000c             move.l    $c(a6), -(a7)
  003954  3f04                 move.w    d4, -(a7)
  003956  3f03                 move.w    d3, -(a7)
  003958  42a7                 clr.l     -(a7)
  00395a  61fffffffd9e         bsr.l     $36fa   ; BLITENCFACE
  003960  6022                 bra.b     $3984
  003962  2f0c                 move.l    a4, -(a7)
  003964  2f0b                 move.l    a3, -(a7)
  003966  2f2e0010             move.l    $10(a6), -(a7)
  00396a  2f2e000c             move.l    $c(a6), -(a7)
  00396e  3f04                 move.w    d4, -(a7)
  003970  3f03                 move.w    d3, -(a7)
  003972  4267                 clr.w     -(a7)
  003974  302a0052             move.w    $52(a2), d0
  003978  48c0                 ext.l     d0
  00397a  eb88                 lsl.l     #$5, d0
  00397c  3f00                 move.w    d0, -(a7)
  00397e  61fffffffd7a         bsr.l     $36fa   ; BLITENCFACE
  003984  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  003988  4e5e                 unlk      a6
  00398a  4e740018             rtd       #$18

;-------------------------------------------------------------
; PLOTENCFACE   (seg 2 +0039a0, 80 bytes)
  0039a0  4e56fffc             link.w    a6, #$fffc
  0039a4  2f0a                 move.l    a2, -(a7)
  0039a6  246e0010             movea.l   $10(a6), a2
  0039aa  3d6a0002fffe         move.w    $2(a2), -$2(a6)
  0039b0  3d52fffc             move.w    (a2), -$4(a6)
  0039b4  2f0a                 move.l    a2, -(a7)
  0039b6  2f2e000c             move.l    $c(a6), -(a7)
  0039ba  2f2efffc             move.l    -$4(a6), -(a7)
  0039be  2f2e0008             move.l    $8(a6), -(a7)
  0039c2  302a0002             move.w    $2(a2), d0
  0039c6  48c0                 ext.l     d0
  0039c8  322a0006             move.w    $6(a2), d1
  0039cc  48c1                 ext.l     d1
  0039ce  9280                 sub.l     d0, d1
  0039d0  3f01                 move.w    d1, -(a7)
  0039d2  3012                 move.w    (a2), d0
  0039d4  48c0                 ext.l     d0
  0039d6  322a0004             move.w    $4(a2), d1
  0039da  48c1                 ext.l     d1
  0039dc  9280                 sub.l     d0, d1
  0039de  3f01                 move.w    d1, -(a7)
  0039e0  42a7                 clr.l     -(a7)
  0039e2  61fffffffd16         bsr.l     $36fa   ; BLITENCFACE
  0039e8  245f                 movea.l   (a7)+, a2
  0039ea  4e5e                 unlk      a6
  0039ec  4e74000c             rtd       #$c

;-------------------------------------------------------------
; EncodeRect   (seg 2 +0039fe, 670 bytes)
  0039fe  4e56ffd4             link.w    a6, #$ffd4
  003a02  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  003a06  266e0008             movea.l   $8(a6), a3
  003a0a  2a2e000c             move.l    $c(a6), d5
  003a0e  286e0010             movea.l   $10(a6), a4
  003a12  42aeffe4             clr.l     -$1c(a6)
  003a16  422efff5             clr.b     -$b(a6)
  003a1a  422effff             clr.b     -$1(a6)
  003a1e  3d7c7ffffff8         move.w    #$7fff, -$8(a6)
  003a24  426efff6             clr.w     -$a(a6)
  003a28  2d53ffd8             move.l    (a3), -$28(a6)
  003a2c  2d6b0004ffdc         move.l    $4(a3), -$24(a6)
  003a32  486effd8             pea.l     -$28(a6)
  003a36  302effda             move.w    -$26(a6), d0
  003a3a  48c0                 ext.l     d0
  003a3c  4480                 neg.l     d0
  003a3e  3f00                 move.w    d0, -(a7)
  003a40  302effd8             move.w    -$28(a6), d0
  003a44  48c0                 ext.l     d0
  003a46  4480                 neg.l     d0
  003a48  3f00                 move.w    d0, -(a7)
  003a4a  a8a8                 _OffsetRect 
  003a4c  3013                 move.w    (a3), d0
  003a4e  48c0                 ext.l     d0
  003a50  322b0004             move.w    $4(a3), d1
  003a54  48c1                 ext.l     d1
  003a56  9280                 sub.l     d0, d1
  003a58  3d41ffe8             move.w    d1, -$18(a6)
  003a5c  302b0002             move.w    $2(a3), d0
  003a60  48c0                 ext.l     d0
  003a62  322b0006             move.w    $6(a3), d1
  003a66  48c1                 ext.l     d1
  003a68  9280                 sub.l     d0, d1
  003a6a  3d41fff2             move.w    d1, -$e(a6)
  003a6e  7000                 moveq     #$0, d0
  003a70  302effe8             move.w    -$18(a6), d0
  003a74  e788                 lsl.l     #$3, d0
  003a76  7200                 moveq     #$0, d1
  003a78  322efff2             move.w    -$e(a6), d1
  003a7c  4c001800             muls.l    d0, d1
  003a80  7000                 moveq     #$0, d0
  003a82  302effe8             move.w    -$18(a6), d0
  003a86  e588                 lsl.l     #$2, d0
  003a88  d081                 add.l     d1, d0
  003a8a  5880                 addq.l    #$4, d0
  003a8c  7210                 moveq     #$10, d1
  003a8e  d081                 add.l     d1, d0
  003a90  a122                 _NewHandle 
  003a92  2d48ffe4             move.l    a0, -$1c(a6)
  003a96  4aaeffe4             tst.l     -$1c(a6)
  003a9a  6616                 bne.b     $3ab2
  003a9c  48790000499e         pea.l     $499e.l   ; g_499e
  003aa2  61ff00001992         bsr.l     $5436   ; SafeReportStr
  003aa8  206effe4             movea.l   -$1c(a6), a0
  003aac  584f                 addq.w    #$4, a7
  003aae  600001e4             bra.w     $3c94
  003ab2  206effe4             movea.l   -$1c(a6), a0
  003ab6  a029                 _HLock    
  003ab8  206effe4             movea.l   -$1c(a6), a0
  003abc  2d50ffd4             move.l    (a0), -$2c(a6)
  003ac0  2450                 movea.l   (a0), a2
  003ac2  508a                 addq.l    #$8, a2
  003ac4  508a                 addq.l    #$8, a2
  003ac6  594f                 subq.w    #$4, a7
  003ac8  2f05                 move.l    d5, -(a7)
  003aca  203c0004000f         move.l    #$4000f, d0
  003ad0  ab1d                 _QDExtensions 
  003ad2  205f                 movea.l   (a7)+, a0
  003ad4  2808                 move.l    a0, d4
  003ad6  2045                 movea.l   d5, a0
  003ad8  2050                 movea.l   (a0), a0
  003ada  30280004             move.w    $4(a0), d0
  003ade  028000003fff         andi.l    #$3fff, d0
  003ae4  2d40ffe0             move.l    d0, -$20(a6)
  003ae8  3013                 move.w    (a3), d0
  003aea  48c0                 ext.l     d0
  003aec  4c2e0000ffe0         mulu.l    -$20(a6), d0
  003af2  2044                 movea.l   d4, a0
  003af4  d1c0                 adda.l    d0, a0
  003af6  d0eb0002             adda.w    $2(a3), a0
  003afa  2d48ffea             move.l    a0, -$16(a6)
  003afe  7e00                 moveq     #$0, d7
  003b00  6000011c             bra.w     $3c1e
  003b04  2d4affee             move.l    a2, -$12(a6)
  003b08  588a                 addq.l    #$4, a2
  003b0a  7a00                 moveq     #$0, d5
  003b0c  7c00                 moveq     #$0, d6
  003b0e  266effea             movea.l   -$16(a6), a3
  003b12  422effff             clr.b     -$1(a6)
  003b16  7800                 moveq     #$0, d4
  003b18  600000ac             bra.w     $3bc6
  003b1c  4a13                 tst.b     (a3)
  003b1e  663c                 bne.b     $3b5c
  003b20  4a05                 tst.b     d5
  003b22  672a                 beq.b     $3b4e
  003b24  7a00                 moveq     #$0, d5
  003b26  2003                 move.l    d3, d0
  003b28  068002000000         addi.l    #$2000000, d0
  003b2e  206efffa             movea.l   -$6(a6), a0
  003b32  2080                 move.l    d0, (a0)
  003b34  4292                 clr.l     (a2)
  003b36  7003                 moveq     #$3, d0
  003b38  c083                 and.l     d3, d0
  003b3a  4a80                 tst.l     d0
  003b3c  6604                 bne.b     $3b42
  003b3e  7000                 moveq     #$0, d0
  003b40  600a                 bra.b     $3b4c
  003b42  7003                 moveq     #$3, d0
  003b44  c083                 and.l     d3, d0
  003b46  7204                 moveq     #$4, d1
  003b48  9280                 sub.l     d0, d1
  003b4a  2001                 move.l    d1, d0
  003b4c  d5c0                 adda.l    d0, a2
  003b4e  4a06                 tst.b     d6
  003b50  6704                 beq.b     $3b56
  003b52  5283                 addq.l    #$1, d3
  003b54  606c                 bra.b     $3bc2
  003b56  7c01                 moveq     #$1, d6
  003b58  7601                 moveq     #$1, d3
  003b5a  6066                 bra.b     $3bc2
  003b5c  4a2efff5             tst.b     -$b(a6)
  003b60  6608                 bne.b     $3b6a
  003b62  3887                 move.w    d7, (a4)
  003b64  1d7c0001fff5         move.b    #$1, -$b(a6)
  003b6a  39470004             move.w    d7, $4(a4)
  003b6e  4a2effff             tst.b     -$1(a6)
  003b72  6614                 bne.b     $3b88
  003b74  302efff8             move.w    -$8(a6), d0
  003b78  48c0                 ext.l     d0
  003b7a  b880                 cmp.l     d0, d4
  003b7c  6404                 bcc.b     $3b82
  003b7e  3d44fff8             move.w    d4, -$8(a6)
  003b82  1d7c0001ffff         move.b    #$1, -$1(a6)
  003b88  302efff6             move.w    -$a(a6), d0
  003b8c  48c0                 ext.l     d0
  003b8e  b880                 cmp.l     d0, d4
  003b90  6304                 bls.b     $3b96
  003b92  3d44fff6             move.w    d4, -$a(a6)
  003b96  4a06                 tst.b     d6
  003b98  670e                 beq.b     $3ba8
  003b9a  7c00                 moveq     #$0, d6
  003b9c  2003                 move.l    d3, d0
  003b9e  068003000000         addi.l    #$3000000, d0
  003ba4  2480                 move.l    d0, (a2)
  003ba6  588a                 addq.l    #$4, a2
  003ba8  4a05                 tst.b     d5
  003baa  6708                 beq.b     $3bb4
  003bac  5283                 addq.l    #$1, d3
  003bae  1493                 move.b    (a3), (a2)
  003bb0  528a                 addq.l    #$1, a2
  003bb2  600e                 bra.b     $3bc2
  003bb4  7a01                 moveq     #$1, d5
  003bb6  7601                 moveq     #$1, d3
  003bb8  2d4afffa             move.l    a2, -$6(a6)
  003bbc  588a                 addq.l    #$4, a2
  003bbe  1493                 move.b    (a3), (a2)
  003bc0  528a                 addq.l    #$1, a2
  003bc2  528b                 addq.l    #$1, a3
  003bc4  5284                 addq.l    #$1, d4
  003bc6  7000                 moveq     #$0, d0
  003bc8  302efff2             move.w    -$e(a6), d0
  003bcc  b880                 cmp.l     d0, d4
  003bce  6500ff4c             bcs.w     $3b1c
  003bd2  4a05                 tst.b     d5
  003bd4  672a                 beq.b     $3c00
  003bd6  7a00                 moveq     #$0, d5
  003bd8  2003                 move.l    d3, d0
  003bda  068002000000         addi.l    #$2000000, d0
  003be0  206efffa             movea.l   -$6(a6), a0
  003be4  2080                 move.l    d0, (a0)
  003be6  4292                 clr.l     (a2)
  003be8  7003                 moveq     #$3, d0
  003bea  c083                 and.l     d3, d0
  003bec  4a80                 tst.l     d0
  003bee  6604                 bne.b     $3bf4
  003bf0  7000                 moveq     #$0, d0
  003bf2  600a                 bra.b     $3bfe
  003bf4  7003                 moveq     #$3, d0
  003bf6  c083                 and.l     d3, d0
  003bf8  7204                 moveq     #$4, d1
  003bfa  9280                 sub.l     d0, d1
  003bfc  2001                 move.l    d1, d0
  003bfe  d5c0                 adda.l    d0, a2
  003c00  206effee             movea.l   -$12(a6), a0
  003c04  d1fcff000004         adda.l    #$ff000004, a0
  003c0a  224a                 movea.l   a2, a1
  003c0c  93c8                 suba.l    a0, a1
  003c0e  206effee             movea.l   -$12(a6), a0
  003c12  2089                 move.l    a1, (a0)
  003c14  202effe0             move.l    -$20(a6), d0
  003c18  d1aeffea             add.l     d0, -$16(a6)
  003c1c  5287                 addq.l    #$1, d7
  003c1e  7000                 moveq     #$0, d0
  003c20  302effe8             move.w    -$18(a6), d0
  003c24  be80                 cmp.l     d0, d7
  003c26  6500fedc             bcs.w     $3b04
  003c2a  4292                 clr.l     (a2)
  003c2c  588a                 addq.l    #$4, a2
  003c2e  302efff8             move.w    -$8(a6), d0
  003c32  48c0                 ext.l     d0
  003c34  5380                 subq.l    #$1, d0
  003c36  39400002             move.w    d0, $2(a4)
  003c3a  302efff6             move.w    -$a(a6), d0
  003c3e  48c0                 ext.l     d0
  003c40  5280                 addq.l    #$1, d0
  003c42  39400006             move.w    d0, $6(a4)
  003c46  5354                 subq.w    #$1, (a4)
  003c48  526c0004             addq.w    #$1, $4(a4)
  003c4c  4a6c0002             tst.w     $2(a4)
  003c50  6c04                 bge.b     $3c56
  003c52  426c0002             clr.w     $2(a4)
  003c56  4a54                 tst.w     (a4)
  003c58  6c02                 bge.b     $3c5c
  003c5a  4254                 clr.w     (a4)
  003c5c  206effd4             movea.l   -$2c(a6), a0
  003c60  20aeffd8             move.l    -$28(a6), (a0)
  003c64  216effdc0004         move.l    -$24(a6), $4(a0)
  003c6a  50aeffd4             addq.l    #$8, -$2c(a6)
  003c6e  206effd4             movea.l   -$2c(a6), a0
  003c72  2094                 move.l    (a4), (a0)
  003c74  216c00040004         move.l    $4(a4), $4(a0)
  003c7a  206effe4             movea.l   -$1c(a6), a0
  003c7e  a02a                 _HUnlock  
  003c80  206effe4             movea.l   -$1c(a6), a0
  003c84  224a                 movea.l   a2, a1
  003c86  93d0                 suba.l    (a0), a1
  003c88  2009                 move.l    a1, d0
  003c8a  206effe4             movea.l   -$1c(a6), a0
  003c8e  a024                 _SetHandleSize 
  003c90  206effe4             movea.l   -$1c(a6), a0
  003c94  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  003c98  4e5e                 unlk      a6
  003c9a  4e75                 rts       

;-------------------------------------------------------------
; Threshold255Blit   (seg 2 +003caa, 254 bytes)
  003caa  4e56fff4             link.w    a6, #$fff4
  003cae  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  003cb2  266e0008             movea.l   $8(a6), a3
  003cb6  246e000c             movea.l   $c(a6), a2
  003cba  2053                 movea.l   (a3), a0
  003cbc  3e280004             move.w    $4(a0), d7
  003cc0  028700007fff         andi.l    #$7fff, d7
  003cc6  2052                 movea.l   (a2), a0
  003cc8  30280004             move.w    $4(a0), d0
  003ccc  028000007fff         andi.l    #$7fff, d0
  003cd2  2d40fff8             move.l    d0, -$8(a6)
  003cd6  554f                 subq.w    #$2, a7
  003cd8  2f0b                 move.l    a3, -(a7)
  003cda  203c00040001         move.l    #$40001, d0
  003ce0  ab1d                 _QDExtensions 
  003ce2  101f                 move.b    (a7)+, d0
  003ce4  554f                 subq.w    #$2, a7
  003ce6  2f0a                 move.l    a2, -(a7)
  003ce8  203c00040001         move.l    #$40001, d0
  003cee  ab1d                 _QDExtensions 
  003cf0  101f                 move.b    (a7)+, d0
  003cf2  594f                 subq.w    #$4, a7
  003cf4  2f0b                 move.l    a3, -(a7)
  003cf6  203c0004000f         move.l    #$4000f, d0
  003cfc  ab1d                 _QDExtensions 
  003cfe  205f                 movea.l   (a7)+, a0
  003d00  2848                 movea.l   a0, a4
  003d02  594f                 subq.w    #$4, a7
  003d04  2f0a                 move.l    a2, -(a7)
  003d06  203c0004000f         move.l    #$4000f, d0
  003d0c  ab1d                 _QDExtensions 
  003d0e  205f                 movea.l   (a7)+, a0
  003d10  2d48fffc             move.l    a0, -$4(a6)
  003d14  302e0012             move.w    $12(a6), d0
  003d18  48c0                 ext.l     d0
  003d1a  4c070800             muls.l    d7, d0
  003d1e  204c                 movea.l   a4, a0
  003d20  d0ee0010             adda.w    $10(a6), a0
  003d24  d1c0                 adda.l    d0, a0
  003d26  2848                 movea.l   a0, a4
  003d28  7c00                 moveq     #$0, d6
  003d2a  606e                 bra.b     $3d9a
  003d2c  3006                 move.w    d6, d0
  003d2e  48c0                 ext.l     d0
  003d30  4c070800             muls.l    d7, d0
  003d34  244c                 movea.l   a4, a2
  003d36  d5c0                 adda.l    d0, a2
  003d38  3006                 move.w    d6, d0
  003d3a  48c0                 ext.l     d0
  003d3c  4c2e0800fff8         muls.l    -$8(a6), d0
  003d42  266efffc             movea.l   -$4(a6), a3
  003d46  d7c0                 adda.l    d0, a3
  003d48  382e0014             move.w    $14(a6), d4
  003d4c  6046                 bra.b     $3d94
  003d4e  7a00                 moveq     #$0, d5
  003d50  7600                 moveq     #$0, d3
  003d52  6024                 bra.b     $3d78
  003d54  3003                 move.w    d3, d0
  003d56  48c0                 ext.l     d0
  003d58  2d40fff4             move.l    d0, -$c(a6)
  003d5c  4a12                 tst.b     (a2)
  003d5e  6604                 bne.b     $3d64
  003d60  7000                 moveq     #$0, d0
  003d62  6002                 bra.b     $3d66
  003d64  7001                 moveq     #$1, d0
  003d66  222efff4             move.l    -$c(a6), d1
  003d6a  e3a8                 lsl.l     d1, d0
  003d6c  7200                 moveq     #$0, d1
  003d6e  1205                 move.b    d5, d1
  003d70  8280                 or.l      d0, d1
  003d72  1a01                 move.b    d1, d5
  003d74  528a                 addq.l    #$1, a2
  003d76  5243                 addq.w    #$1, d3
  003d78  0c440008             cmpi.w    #$8, d4
  003d7c  6c06                 bge.b     $3d84
  003d7e  3004                 move.w    d4, d0
  003d80  48c0                 ext.l     d0
  003d82  6002                 bra.b     $3d86
  003d84  7008                 moveq     #$8, d0
  003d86  3203                 move.w    d3, d1
  003d88  48c1                 ext.l     d1
  003d8a  b280                 cmp.l     d0, d1
  003d8c  6dc6                 blt.b     $3d54
  003d8e  1685                 move.b    d5, (a3)
  003d90  5144                 subq.w    #$8, d4
  003d92  528b                 addq.l    #$1, a3
  003d94  4a44                 tst.w     d4
  003d96  6eb6                 bgt.b     $3d4e
  003d98  5246                 addq.w    #$1, d6
  003d9a  bc6e0016             cmp.w     $16(a6), d6
  003d9e  6d8c                 blt.b     $3d2c
  003da0  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  003da4  4e5e                 unlk      a6
  003da6  4e75                 rts       

;-------------------------------------------------------------
; BuildMaskRegion   (seg 2 +003dbc, 510 bytes)
  003dbc  4e56ffe0             link.w    a6, #$ffe0
  003dc0  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  003dc4  246e0008             movea.l   $8(a6), a2
  003dc8  7600                 moveq     #$0, d3
  003dca  42aefff4             clr.l     -$c(a6)
  003dce  42aefff0             clr.l     -$10(a6)
  003dd2  97cb                 suba.l    a3, a3
  003dd4  99cc                 suba.l    a4, a4
  003dd6  2d790000f6a2ffec     move.l    $f6a2.l, -$14(a6)   ; g_f6a2
  003dde  4aaa0010             tst.l     $10(a2)
  003de2  6606                 bne.b     $3dea
  003de4  91c8                 suba.l    a0, a0
  003de6  600001ca             bra.w     $3fb2
  003dea  486effe4             pea.l     -$1c(a6)
  003dee  486effe0             pea.l     -$20(a6)
  003df2  203c00080005         move.l    #$80005, d0
  003df8  ab1d                 _QDExtensions 
  003dfa  426efff8             clr.w     -$8(a6)
  003dfe  426efffa             clr.w     -$6(a6)
  003e02  302a0002             move.w    $2(a2), d0
  003e06  48c0                 ext.l     d0
  003e08  322a0006             move.w    $6(a2), d1
  003e0c  48c1                 ext.l     d1
  003e0e  9280                 sub.l     d0, d1
  003e10  3d41fffe             move.w    d1, -$2(a6)
  003e14  3012                 move.w    (a2), d0
  003e16  48c0                 ext.l     d0
  003e18  322a0004             move.w    $4(a2), d1
  003e1c  48c1                 ext.l     d1
  003e1e  9280                 sub.l     d0, d1
  003e20  3d41fffc             move.w    d1, -$4(a6)
  003e24  554f                 subq.w    #$2, a7
  003e26  486efff4             pea.l     -$c(a6)
  003e2a  3f3c0001             move.w    #$1, -(a7)
  003e2e  486efff8             pea.l     -$8(a6)
  003e32  42a7                 clr.l     -(a7)
  003e34  42a7                 clr.l     -(a7)
  003e36  42a7                 clr.l     -(a7)
  003e38  203c00160000         move.l    #$160000, d0
  003e3e  ab1d                 _QDExtensions 
  003e40  301f                 move.w    (a7)+, d0
  003e42  3800                 move.w    d0, d4
  003e44  554f                 subq.w    #$2, a7
  003e46  486efff0             pea.l     -$10(a6)
  003e4a  3f3c0008             move.w    #$8, -(a7)
  003e4e  486efff8             pea.l     -$8(a6)
  003e52  42a7                 clr.l     -(a7)
  003e54  42a7                 clr.l     -(a7)
  003e56  42a7                 clr.l     -(a7)
  003e58  203c00160000         move.l    #$160000, d0
  003e5e  ab1d                 _QDExtensions 
  003e60  301f                 move.w    (a7)+, d0
  003e62  3a00                 move.w    d0, d5
  003e64  3004                 move.w    d4, d0
  003e66  48c0                 ext.l     d0
  003e68  66000146             bne.w     $3fb0
  003e6c  3005                 move.w    d5, d0
  003e6e  48c0                 ext.l     d0
  003e70  6600013e             bne.w     $3fb0
  003e74  4aaefff4             tst.l     -$c(a6)
  003e78  67000136             beq.w     $3fb0
  003e7c  4aaefff0             tst.l     -$10(a6)
  003e80  6700012e             beq.w     $3fb0
  003e84  594f                 subq.w    #$4, a7
  003e86  2f2efff4             move.l    -$c(a6), -(a7)
  003e8a  203c00040017         move.l    #$40017, d0
  003e90  ab1d                 _QDExtensions 
  003e92  205f                 movea.l   (a7)+, a0
  003e94  2648                 movea.l   a0, a3
  003e96  594f                 subq.w    #$4, a7
  003e98  2f2efff0             move.l    -$10(a6), -(a7)
  003e9c  203c00040017         move.l    #$40017, d0
  003ea2  ab1d                 _QDExtensions 
  003ea4  205f                 movea.l   (a7)+, a0
  003ea6  2848                 movea.l   a0, a4
  003ea8  302a0002             move.w    $2(a2), d0
  003eac  48c0                 ext.l     d0
  003eae  322a000a             move.w    $a(a2), d1
  003eb2  48c1                 ext.l     d1
  003eb4  9280                 sub.l     d0, d1
  003eb6  3d41ffea             move.w    d1, -$16(a6)
  003eba  3012                 move.w    (a2), d0
  003ebc  48c0                 ext.l     d0
  003ebe  322a0008             move.w    $8(a2), d1
  003ec2  48c1                 ext.l     d1
  003ec4  9280                 sub.l     d0, d1
  003ec6  3d41ffe8             move.w    d1, -$18(a6)
  003eca  200b                 move.l    a3, d0
  003ecc  670000e2             beq.w     $3fb0
  003ed0  200c                 move.l    a4, d0
  003ed2  670000dc             beq.w     $3fb0
  003ed6  554f                 subq.w    #$2, a7
  003ed8  2f0b                 move.l    a3, -(a7)
  003eda  203c00040001         move.l    #$40001, d0
  003ee0  ab1d                 _QDExtensions 
  003ee2  101f                 move.b    (a7)+, d0
  003ee4  554f                 subq.w    #$2, a7
  003ee6  2f0c                 move.l    a4, -(a7)
  003ee8  203c00040001         move.l    #$40001, d0
  003eee  ab1d                 _QDExtensions 
  003ef0  101f                 move.b    (a7)+, d0
  003ef2  2053                 movea.l   (a3), a0
  003ef4  0c6800010020         cmpi.w    #$1, $20(a0)
  003efa  6708                 beq.b     $3f04
  003efc  487900004938         pea.l     $4938.l   ; g_4938
  003f02  abff                 _DebugStr 
  003f04  2054                 movea.l   (a4), a0
  003f06  0c6800080020         cmpi.w    #$8, $20(a0)
  003f0c  6708                 beq.b     $3f16
  003f0e  4879000048cc         pea.l     $48cc.l   ; g_48cc
  003f14  abff                 _DebugStr 
  003f16  2f2efff4             move.l    -$c(a6), -(a7)
  003f1a  42a7                 clr.l     -(a7)
  003f1c  203c00080006         move.l    #$80006, d0
  003f22  ab1d                 _QDExtensions 
  003f24  486efff8             pea.l     -$8(a6)
  003f28  a8a3                 _EraseRect 
  003f2a  2f2efff0             move.l    -$10(a6), -(a7)
  003f2e  42a7                 clr.l     -(a7)
  003f30  203c00080006         move.l    #$80006, d0
  003f36  ab1d                 _QDExtensions 
  003f38  486efff8             pea.l     -$8(a6)
  003f3c  a8a3                 _EraseRect 
  003f3e  2f0a                 move.l    a2, -(a7)
  003f40  2f0c                 move.l    a4, -(a7)
  003f42  2f2effec             move.l    -$14(a6), -(a7)
  003f46  2f2effec             move.l    -$14(a6), -(a7)
  003f4a  3f2efffe             move.w    -$2(a6), -(a7)
  003f4e  3f2efffc             move.w    -$4(a6), -(a7)
  003f52  61ffffffd5c8         bsr.l     $151c   ; BLITENCFACETOPIXMAP
  003f58  3f2efffc             move.w    -$4(a6), -(a7)
  003f5c  3f2efffe             move.w    -$2(a6), -(a7)
  003f60  42a7                 clr.l     -(a7)
  003f62  2f0b                 move.l    a3, -(a7)
  003f64  2f0c                 move.l    a4, -(a7)
  003f66  61fffffffd42         bsr.l     $3caa   ; Threshold255Blit
  003f6c  a8d8                 _NewRgn   
  003f6e  205f                 movea.l   (a7)+, a0
  003f70  2608                 move.l    a0, d3
  003f72  4a83                 tst.l     d3
  003f74  4fef000c             lea.l     $c(a7), a7
  003f78  670a                 beq.b     $3f84
  003f7a  554f                 subq.w    #$2, a7
  003f7c  2f03                 move.l    d3, -(a7)
  003f7e  2f13                 move.l    (a3), -(a7)
  003f80  a8d7                 _BitMapToRegion 
  003f82  301f                 move.w    (a7)+, d0
  003f84  2f0b                 move.l    a3, -(a7)
  003f86  203c00040002         move.l    #$40002, d0
  003f8c  ab1d                 _QDExtensions 
  003f8e  2f0c                 move.l    a4, -(a7)
  003f90  203c00040002         move.l    #$40002, d0
  003f96  ab1d                 _QDExtensions 
  003f98  2f2efff4             move.l    -$c(a6), -(a7)
  003f9c  203c00040004         move.l    #$40004, d0
  003fa2  ab1d                 _QDExtensions 
  003fa4  2f2efff0             move.l    -$10(a6), -(a7)
  003fa8  203c00040004         move.l    #$40004, d0
  003fae  ab1d                 _QDExtensions 
  003fb0  2043                 movea.l   d3, a0
  003fb2  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  003fb6  4e5e                 unlk      a6
  003fb8  4e75                 rts       

;-------------------------------------------------------------
; Load1EncFaceFromPICT   (seg 2 +003fcc, 632 bytes)
  003fcc  4e56ffec             link.w    a6, #$ffec
  003fd0  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  003fd4  3a2e000c             move.w    $c(a6), d5
  003fd8  97cb                 suba.l    a3, a3
  003fda  42aefffc             clr.l     -$4(a6)
  003fde  99cc                 suba.l    a4, a4
  003fe0  95ca                 suba.l    a2, a2
  003fe2  7800                 moveq     #$0, d4
  003fe4  486efff0             pea.l     -$10(a6)
  003fe8  486effec             pea.l     -$14(a6)
  003fec  203c00080005         move.l    #$80005, d0
  003ff2  ab1d                 _QDExtensions 
  003ff4  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  003ffa  a998                 _UseResFile 
  003ffc  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  004002  67000164             beq.w     $4168
  004006  594f                 subq.w    #$4, a7
  004008  3f2e0008             move.w    $8(a6), -(a7)
  00400c  a9bc                 _GetPicture 
  00400e  205f                 movea.l   (a7)+, a0
  004010  2648                 movea.l   a0, a3
  004012  200b                 move.l    a3, d0
  004014  67000214             beq.w     $422a
  004018  4a93                 tst.l     (a3)
  00401a  6700020e             beq.w     $422a
  00401e  204b                 movea.l   a3, a0
  004020  a064                 _MoveHHi  
  004022  a029                 _HLock    
  004024  2053                 movea.l   (a3), a0
  004026  2d680002fff4         move.l    $2(a0), -$c(a6)
  00402c  2d680006fff8         move.l    $6(a0), -$8(a6)
  004032  554f                 subq.w    #$2, a7
  004034  486efffc             pea.l     -$4(a6)
  004038  3f3c0008             move.w    #$8, -(a7)
  00403c  486efff4             pea.l     -$c(a6)
  004040  42a7                 clr.l     -(a7)
  004042  42a7                 clr.l     -(a7)
  004044  42a7                 clr.l     -(a7)
  004046  203c00160000         move.l    #$160000, d0
  00404c  ab1d                 _QDExtensions 
  00404e  301f                 move.w    (a7)+, d0
  004050  3600                 move.w    d0, d3
  004052  701c                 moveq     #$1c, d0
  004054  a11e                 _NewPtr   
  004056  2448                 movea.l   a0, a2
  004058  3003                 move.w    d3, d0
  00405a  48c0                 ext.l     d0
  00405c  660000f0             bne.w     $414e
  004060  200a                 move.l    a2, d0
  004062  670000ea             beq.w     $414e
  004066  594f                 subq.w    #$4, a7
  004068  2f2efffc             move.l    -$4(a6), -(a7)
  00406c  203c00040017         move.l    #$40017, d0
  004072  ab1d                 _QDExtensions 
  004074  205f                 movea.l   (a7)+, a0
  004076  2848                 movea.l   a0, a4
  004078  200c                 move.l    a4, d0
  00407a  670000c4             beq.w     $4140
  00407e  554f                 subq.w    #$2, a7
  004080  2f0c                 move.l    a4, -(a7)
  004082  203c00040001         move.l    #$40001, d0
  004088  ab1d                 _QDExtensions 
  00408a  101f                 move.b    (a7)+, d0
  00408c  2054                 movea.l   (a4), a0
  00408e  0c6800080020         cmpi.w    #$8, $20(a0)
  004094  6708                 beq.b     $409e
  004096  487900004868         pea.l     $4868.l   ; g_4868
  00409c  abff                 _DebugStr 
  00409e  2f2efffc             move.l    -$4(a6), -(a7)
  0040a2  42a7                 clr.l     -(a7)
  0040a4  203c00080006         move.l    #$80006, d0
  0040aa  ab1d                 _QDExtensions 
  0040ac  2f0b                 move.l    a3, -(a7)
  0040ae  486efff4             pea.l     -$c(a6)
  0040b2  a8f6                 _DrawPicture 
  0040b4  24aefff4             move.l    -$c(a6), (a2)
  0040b8  256efff80004         move.l    -$8(a6), $4(a2)
  0040be  486a0008             pea.l     $8(a2)
  0040c2  2f0c                 move.l    a4, -(a7)
  0040c4  486efff4             pea.l     -$c(a6)
  0040c8  61fffffff934         bsr.l     $39fe   ; EncodeRect
  0040ce  25480010             move.l    a0, $10(a2)
  0040d2  2608                 move.l    a0, d3
  0040d4  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  0040da  25480018             move.l    a0, $18(a2)
  0040de  42aa0014             clr.l     $14(a2)
  0040e2  4a83                 tst.l     d3
  0040e4  4fef000c             lea.l     $c(a7), a7
  0040e8  673a                 beq.b     $4124
  0040ea  594f                 subq.w    #$4, a7
  0040ec  2f3c48725370         move.l    #$48725370, -(a7)
  0040f2  3f05                 move.w    d5, -(a7)
  0040f4  a9a0                 _GetResource 
  0040f6  205f                 movea.l   (a7)+, a0
  0040f8  2808                 move.l    a0, d4
  0040fa  4a84                 tst.l     d4
  0040fc  670c                 beq.b     $410a
  0040fe  2f04                 move.l    d4, -(a7)
  004100  a9ad                 _RemoveResource 
  004102  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  004108  a999                 _UpdateResFile 
  00410a  2f03                 move.l    d3, -(a7)
  00410c  2f3c48725370         move.l    #$48725370, -(a7)
  004112  3f05                 move.w    d5, -(a7)
  004114  487900004856         pea.l     $4856.l   ; g_4856
  00411a  a9ab                 _AddResource 
  00411c  2f03                 move.l    d3, -(a7)
  00411e  a9b0                 _WriteResource 
  004120  2f03                 move.l    d3, -(a7)
  004122  a9a3                 _ReleaseResource 
  004124  7048                 moveq     #$48, d0
  004126  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  00412c  2f00                 move.l    d0, -(a7)
  00412e  61ff00001552         bsr.l     $5682   ; Update3DProgBar
  004134  2f0c                 move.l    a4, -(a7)
  004136  203c00040002         move.l    #$40002, d0
  00413c  ab1d                 _QDExtensions 
  00413e  584f                 addq.w    #$4, a7
  004140  2f2efffc             move.l    -$4(a6), -(a7)
  004144  203c00040004         move.l    #$40004, d0
  00414a  ab1d                 _QDExtensions 
  00414c  600e                 bra.b     $415c
  00414e  48790000480a         pea.l     $480a.l   ; g_480a
  004154  61ff00005184         bsr.l     $92da   ; ReportDialog
  00415a  584f                 addq.w    #$4, a7
  00415c  204b                 movea.l   a3, a0
  00415e  a02a                 _HUnlock  
  004160  2f0b                 move.l    a3, -(a7)
  004162  a9a3                 _ReleaseResource 
  004164  600000c4             bra.w     $422a
  004168  701c                 moveq     #$1c, d0
  00416a  a11e                 _NewPtr   
  00416c  2448                 movea.l   a0, a2
  00416e  200a                 move.l    a2, d0
  004170  6606                 bne.b     $4178
  004172  91c8                 suba.l    a0, a0
  004174  600000c6             bra.w     $423c
  004178  42aa0010             clr.l     $10(a2)
  00417c  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  004182  25480018             move.l    a0, $18(a2)
  004186  42aa0014             clr.l     $14(a2)
  00418a  594f                 subq.w    #$4, a7
  00418c  2f3c48725370         move.l    #$48725370, -(a7)
  004192  3f05                 move.w    d5, -(a7)
  004194  a9a0                 _GetResource 
  004196  205f                 movea.l   (a7)+, a0
  004198  25480010             move.l    a0, $10(a2)
  00419c  4aaa0010             tst.l     $10(a2)
  0041a0  6756                 beq.b     $41f8
  0041a2  206a0010             movea.l   $10(a2), a0
  0041a6  a04a                 _HNoPurge 
  0041a8  206a0010             movea.l   $10(a2), a0
  0041ac  a064                 _MoveHHi  
  0041ae  a029                 _HLock    
  0041b0  206a0010             movea.l   $10(a2), a0
  0041b4  2650                 movea.l   (a0), a3
  0041b6  2493                 move.l    (a3), (a2)
  0041b8  256b00040004         move.l    $4(a3), $4(a2)
  0041be  508b                 addq.l    #$8, a3
  0041c0  25530008             move.l    (a3), $8(a2)
  0041c4  256b0004000c         move.l    $4(a3), $c(a2)
  0041ca  4a2e000a             tst.b     $a(a6)
  0041ce  6710                 beq.b     $41e0
  0041d0  2f0a                 move.l    a2, -(a7)
  0041d2  61fffffffbe8         bsr.l     $3dbc   ; BuildMaskRegion
  0041d8  25480014             move.l    a0, $14(a2)
  0041dc  584f                 addq.w    #$4, a7
  0041de  6004                 bra.b     $41e4
  0041e0  42aa0014             clr.l     $14(a2)
  0041e4  206a0010             movea.l   $10(a2), a0
  0041e8  a064                 _MoveHHi  
  0041ea  a029                 _HLock    
  0041ec  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  0041f2  25480018             move.l    a0, $18(a2)
  0041f6  6020                 bra.b     $4218
  0041f8  2f2efff0             move.l    -$10(a6), -(a7)
  0041fc  2f2effec             move.l    -$14(a6), -(a7)
  004200  203c00080006         move.l    #$80006, d0
  004206  ab1d                 _QDExtensions 
  004208  3f05                 move.w    d5, -(a7)
  00420a  4879000047be         pea.l     $47be.l   ; g_47be
  004210  61ff00005080         bsr.l     $9292   ; ReportError
  004216  5c4f                 addq.w    #$6, a7
  004218  7048                 moveq     #$48, d0
  00421a  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  004220  2f00                 move.l    d0, -(a7)
  004222  61ff0000145e         bsr.l     $5682   ; Update3DProgBar
  004228  584f                 addq.w    #$4, a7
  00422a  2f2efff0             move.l    -$10(a6), -(a7)
  00422e  2f2effec             move.l    -$14(a6), -(a7)
  004232  203c00080006         move.l    #$80006, d0
  004238  ab1d                 _QDExtensions 
  00423a  204a                 movea.l   a2, a0
  00423c  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  004240  4e5e                 unlk      a6
  004242  4e75                 rts       

;-------------------------------------------------------------
; Load1EncFaceFromCicn   (seg 2 +00425c, 652 bytes)
  00425c  4e56ffec             link.w    a6, #$ffec
  004260  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  004264  382e000c             move.w    $c(a6), d4
  004268  97cb                 suba.l    a3, a3
  00426a  42aefffc             clr.l     -$4(a6)
  00426e  99cc                 suba.l    a4, a4
  004270  95ca                 suba.l    a2, a2
  004272  7600                 moveq     #$0, d3
  004274  486efff0             pea.l     -$10(a6)
  004278  486effec             pea.l     -$14(a6)
  00427c  203c00080005         move.l    #$80005, d0
  004282  ab1d                 _QDExtensions 
  004284  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  00428a  67000180             beq.w     $440c
  00428e  594f                 subq.w    #$4, a7
  004290  3f2e0008             move.w    $8(a6), -(a7)
  004294  aa1e                 _GetCIcon 
  004296  205f                 movea.l   (a7)+, a0
  004298  2648                 movea.l   a0, a3
  00429a  200b                 move.l    a3, d0
  00429c  67000230             beq.w     $44ce
  0042a0  4a93                 tst.l     (a3)
  0042a2  6700022a             beq.w     $44ce
  0042a6  204b                 movea.l   a3, a0
  0042a8  a029                 _HLock    
  0042aa  2053                 movea.l   (a3), a0
  0042ac  2d680006fff4         move.l    $6(a0), -$c(a6)
  0042b2  2d68000afff8         move.l    $a(a0), -$8(a6)
  0042b8  554f                 subq.w    #$2, a7
  0042ba  486efffc             pea.l     -$4(a6)
  0042be  3f3c0008             move.w    #$8, -(a7)
  0042c2  486efff4             pea.l     -$c(a6)
  0042c6  42a7                 clr.l     -(a7)
  0042c8  42a7                 clr.l     -(a7)
  0042ca  42a7                 clr.l     -(a7)
  0042cc  203c00160000         move.l    #$160000, d0
  0042d2  ab1d                 _QDExtensions 
  0042d4  301f                 move.w    (a7)+, d0
  0042d6  3600                 move.w    d0, d3
  0042d8  701c                 moveq     #$1c, d0
  0042da  a11e                 _NewPtr   
  0042dc  2448                 movea.l   a0, a2
  0042de  3003                 move.w    d3, d0
  0042e0  48c0                 ext.l     d0
  0042e2  6600010e             bne.w     $43f2
  0042e6  200a                 move.l    a2, d0
  0042e8  67000108             beq.w     $43f2
  0042ec  4aaefffc             tst.l     -$4(a6)
  0042f0  67000100             beq.w     $43f2
  0042f4  594f                 subq.w    #$4, a7
  0042f6  2f2efffc             move.l    -$4(a6), -(a7)
  0042fa  203c00040017         move.l    #$40017, d0
  004300  ab1d                 _QDExtensions 
  004302  205f                 movea.l   (a7)+, a0
  004304  2848                 movea.l   a0, a4
  004306  554f                 subq.w    #$2, a7
  004308  2f0c                 move.l    a4, -(a7)
  00430a  203c00040001         move.l    #$40001, d0
  004310  ab1d                 _QDExtensions 
  004312  101f                 move.b    (a7)+, d0
  004314  200c                 move.l    a4, d0
  004316  670000c6             beq.w     $43de
  00431a  2054                 movea.l   (a4), a0
  00431c  0c6800080020         cmpi.w    #$8, $20(a0)
  004322  6708                 beq.b     $432c
  004324  48790000475b         pea.l     $475b.l   ; g_475b
  00432a  abff                 _DebugStr 
  00432c  2f2efffc             move.l    -$4(a6), -(a7)
  004330  42a7                 clr.l     -(a7)
  004332  203c00080006         move.l    #$80006, d0
  004338  ab1d                 _QDExtensions 
  00433a  486efff4             pea.l     -$c(a6)
  00433e  a8a3                 _EraseRect 
  004340  486efff4             pea.l     -$c(a6)
  004344  2f0b                 move.l    a3, -(a7)
  004346  aa1f                 _PlotCIcon 
  004348  24aefff4             move.l    -$c(a6), (a2)
  00434c  256efff80004         move.l    -$8(a6), $4(a2)
  004352  486a0008             pea.l     $8(a2)
  004356  2f0c                 move.l    a4, -(a7)
  004358  486efff4             pea.l     -$c(a6)
  00435c  61fffffff6a0         bsr.l     $39fe   ; EncodeRect
  004362  25480010             move.l    a0, $10(a2)
  004366  2608                 move.l    a0, d3
  004368  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  00436e  25480018             move.l    a0, $18(a2)
  004372  42aa0014             clr.l     $14(a2)
  004376  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  00437c  a998                 _UseResFile 
  00437e  4a83                 tst.l     d3
  004380  4fef000c             lea.l     $c(a7), a7
  004384  673a                 beq.b     $43c0
  004386  594f                 subq.w    #$4, a7
  004388  2f3c48725370         move.l    #$48725370, -(a7)
  00438e  3f04                 move.w    d4, -(a7)
  004390  a9a0                 _GetResource 
  004392  205f                 movea.l   (a7)+, a0
  004394  2a08                 move.l    a0, d5
  004396  4a85                 tst.l     d5
  004398  670c                 beq.b     $43a6
  00439a  2f05                 move.l    d5, -(a7)
  00439c  a9ad                 _RemoveResource 
  00439e  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  0043a4  a999                 _UpdateResFile 
  0043a6  2f03                 move.l    d3, -(a7)
  0043a8  2f3c48725370         move.l    #$48725370, -(a7)
  0043ae  3f04                 move.w    d4, -(a7)
  0043b0  487900004856         pea.l     $4856.l   ; g_4856
  0043b6  a9ab                 _AddResource 
  0043b8  2f03                 move.l    d3, -(a7)
  0043ba  a9b0                 _WriteResource 
  0043bc  2f03                 move.l    d3, -(a7)
  0043be  a9a3                 _ReleaseResource 
  0043c0  2f0c                 move.l    a4, -(a7)
  0043c2  203c00040002         move.l    #$40002, d0
  0043c8  ab1d                 _QDExtensions 
  0043ca  7048                 moveq     #$48, d0
  0043cc  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  0043d2  2f00                 move.l    d0, -(a7)
  0043d4  61ff000012ac         bsr.l     $5682   ; Update3DProgBar
  0043da  584f                 addq.w    #$4, a7
  0043dc  6006                 bra.b     $43e4
  0043de  204a                 movea.l   a2, a0
  0043e0  a01f                 _DisposePtr 
  0043e2  95ca                 suba.l    a2, a2
  0043e4  2f2efffc             move.l    -$4(a6), -(a7)
  0043e8  203c00040004         move.l    #$40004, d0
  0043ee  ab1d                 _QDExtensions 
  0043f0  600e                 bra.b     $4400
  0043f2  48790000480a         pea.l     $480a.l   ; g_480a
  0043f8  61ff00004ee0         bsr.l     $92da   ; ReportDialog
  0043fe  584f                 addq.w    #$4, a7
  004400  204b                 movea.l   a3, a0
  004402  a02a                 _HUnlock  
  004404  2f0b                 move.l    a3, -(a7)
  004406  aa25                 _DisposeCIcon 
  004408  600000c4             bra.w     $44ce
  00440c  701c                 moveq     #$1c, d0
  00440e  a11e                 _NewPtr   
  004410  2448                 movea.l   a0, a2
  004412  200a                 move.l    a2, d0
  004414  6606                 bne.b     $441c
  004416  91c8                 suba.l    a0, a0
  004418  600000c6             bra.w     $44e0
  00441c  42aa0010             clr.l     $10(a2)
  004420  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  004426  25480018             move.l    a0, $18(a2)
  00442a  42aa0014             clr.l     $14(a2)
  00442e  594f                 subq.w    #$4, a7
  004430  2f3c48725370         move.l    #$48725370, -(a7)
  004436  3f04                 move.w    d4, -(a7)
  004438  a9a0                 _GetResource 
  00443a  205f                 movea.l   (a7)+, a0
  00443c  25480010             move.l    a0, $10(a2)
  004440  4aaa0010             tst.l     $10(a2)
  004444  6756                 beq.b     $449c
  004446  206a0010             movea.l   $10(a2), a0
  00444a  a04a                 _HNoPurge 
  00444c  206a0010             movea.l   $10(a2), a0
  004450  a064                 _MoveHHi  
  004452  a029                 _HLock    
  004454  206a0010             movea.l   $10(a2), a0
  004458  2650                 movea.l   (a0), a3
  00445a  2493                 move.l    (a3), (a2)
  00445c  256b00040004         move.l    $4(a3), $4(a2)
  004462  508b                 addq.l    #$8, a3
  004464  25530008             move.l    (a3), $8(a2)
  004468  256b0004000c         move.l    $4(a3), $c(a2)
  00446e  206a0010             movea.l   $10(a2), a0
  004472  a064                 _MoveHHi  
  004474  a029                 _HLock    
  004476  4a2e000a             tst.b     $a(a6)
  00447a  6710                 beq.b     $448c
  00447c  2f0a                 move.l    a2, -(a7)
  00447e  61fffffff93c         bsr.l     $3dbc   ; BuildMaskRegion
  004484  25480014             move.l    a0, $14(a2)
  004488  584f                 addq.w    #$4, a7
  00448a  6004                 bra.b     $4490
  00448c  42aa0014             clr.l     $14(a2)
  004490  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  004496  25480018             move.l    a0, $18(a2)
  00449a  6020                 bra.b     $44bc
  00449c  2f2efff0             move.l    -$10(a6), -(a7)
  0044a0  2f2effec             move.l    -$14(a6), -(a7)
  0044a4  203c00080006         move.l    #$80006, d0
  0044aa  ab1d                 _QDExtensions 
  0044ac  3f04                 move.w    d4, -(a7)
  0044ae  4879000047be         pea.l     $47be.l   ; g_47be
  0044b4  61ff00004ddc         bsr.l     $9292   ; ReportError
  0044ba  5c4f                 addq.w    #$6, a7
  0044bc  7048                 moveq     #$48, d0
  0044be  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  0044c4  2f00                 move.l    d0, -(a7)
  0044c6  61ff000011ba         bsr.l     $5682   ; Update3DProgBar
  0044cc  584f                 addq.w    #$4, a7
  0044ce  2f2efff0             move.l    -$10(a6), -(a7)
  0044d2  2f2effec             move.l    -$14(a6), -(a7)
  0044d6  203c00080006         move.l    #$80006, d0
  0044dc  ab1d                 _QDExtensions 
  0044de  204a                 movea.l   a2, a0
  0044e0  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  0044e4  4e5e                 unlk      a6
  0044e6  4e75                 rts       

;-------------------------------------------------------------
; LoadEncFaceSetFromPICT   (seg 2 +004500, 1030 bytes)
  004500  4e56ffda             link.w    a6, #$ffda
  004504  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  004508  3e2e000e             move.w    $e(a6), d7
  00450c  382e0016             move.w    $16(a6), d4
  004510  42aeffe8             clr.l     -$18(a6)
  004514  42aeffe4             clr.l     -$1c(a6)
  004518  42aefff4             clr.l     -$c(a6)
  00451c  99cc                 suba.l    a4, a4
  00451e  7601                 moveq     #$1, d3
  004520  95ca                 suba.l    a2, a2
  004522  302e000a             move.w    $a(a6), d0
  004526  48c0                 ext.l     d0
  004528  4c3c00000000001c     mulu.l    #$1c, d0
  004530  a11e                 _NewPtr   
  004532  2848                 movea.l   a0, a4
  004534  200c                 move.l    a4, d0
  004536  6606                 bne.b     $453e
  004538  91c8                 suba.l    a0, a0
  00453a  600003c2             bra.w     $48fe
  00453e  486efff0             pea.l     -$10(a6)
  004542  486effec             pea.l     -$14(a6)
  004546  203c00080005         move.l    #$80005, d0
  00454c  ab1d                 _QDExtensions 
  00454e  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  004554  6606                 bne.b     $455c
  004556  4a44                 tst.w     d4
  004558  660002ae             bne.w     $4808
  00455c  554f                 subq.w    #$2, a7
  00455e  a994                 _CurResFile 
  004560  301f                 move.w    (a7)+, d0
  004562  3d40ffda             move.w    d0, -$26(a6)
  004566  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  00456c  6708                 beq.b     $4576
  00456e  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  004574  a998                 _UseResFile 
  004576  594f                 subq.w    #$4, a7
  004578  3f2e0008             move.w    $8(a6), -(a7)
  00457c  a9bc                 _GetPicture 
  00457e  205f                 movea.l   (a7)+, a0
  004580  2d48ffe8             move.l    a0, -$18(a6)
  004584  4a6e0012             tst.w     $12(a6)
  004588  6612                 bne.b     $459c
  00458a  4a6e0014             tst.w     $14(a6)
  00458e  660c                 bne.b     $459c
  004590  3d7cffff0014         move.w    #$ffff, $14(a6)
  004596  3d7cffff0012         move.w    #$ffff, $12(a6)
  00459c  4aaeffe8             tst.l     -$18(a6)
  0045a0  6700023e             beq.w     $47e0
  0045a4  206effe8             movea.l   -$18(a6), a0
  0045a8  4a90                 tst.l     (a0)
  0045aa  67000234             beq.w     $47e0
  0045ae  206effe8             movea.l   -$18(a6), a0
  0045b2  a064                 _MoveHHi  
  0045b4  a029                 _HLock    
  0045b6  206effe8             movea.l   -$18(a6), a0
  0045ba  2050                 movea.l   (a0), a0
  0045bc  2d680002ffdc         move.l    $2(a0), -$24(a6)
  0045c2  2d680006ffe0         move.l    $6(a0), -$20(a6)
  0045c8  486effdc             pea.l     -$24(a6)
  0045cc  302effde             move.w    -$22(a6), d0
  0045d0  48c0                 ext.l     d0
  0045d2  4480                 neg.l     d0
  0045d4  3f00                 move.w    d0, -(a7)
  0045d6  302effdc             move.w    -$24(a6), d0
  0045da  48c0                 ext.l     d0
  0045dc  4480                 neg.l     d0
  0045de  3f00                 move.w    d0, -(a7)
  0045e0  a8a8                 _OffsetRect 
  0045e2  554f                 subq.w    #$2, a7
  0045e4  486effe4             pea.l     -$1c(a6)
  0045e8  3f3c0008             move.w    #$8, -(a7)
  0045ec  486effdc             pea.l     -$24(a6)
  0045f0  42a7                 clr.l     -(a7)
  0045f2  42a7                 clr.l     -(a7)
  0045f4  42a7                 clr.l     -(a7)
  0045f6  203c00160000         move.l    #$160000, d0
  0045fc  ab1d                 _QDExtensions 
  0045fe  301f                 move.w    (a7)+, d0
  004600  3600                 move.w    d0, d3
  004602  3003                 move.w    d3, d0
  004604  48c0                 ext.l     d0
  004606  6712                 beq.b     $461a
  004608  42aeffe4             clr.l     -$1c(a6)
  00460c  48790000470a         pea.l     $470a.l   ; g_470a
  004612  61ff00004cc6         bsr.l     $92da   ; ReportDialog
  004618  584f                 addq.w    #$4, a7
  00461a  4aaeffe4             tst.l     -$1c(a6)
  00461e  670001b2             beq.w     $47d2
  004622  594f                 subq.w    #$4, a7
  004624  2f2effe4             move.l    -$1c(a6), -(a7)
  004628  203c00040017         move.l    #$40017, d0
  00462e  ab1d                 _QDExtensions 
  004630  205f                 movea.l   (a7)+, a0
  004632  2d48fff4             move.l    a0, -$c(a6)
  004636  4aaefff4             tst.l     -$c(a6)
  00463a  6700018a             beq.w     $47c6
  00463e  554f                 subq.w    #$2, a7
  004640  2f2efff4             move.l    -$c(a6), -(a7)
  004644  203c00040001         move.l    #$40001, d0
  00464a  ab1d                 _QDExtensions 
  00464c  101f                 move.b    (a7)+, d0
  00464e  206efff4             movea.l   -$c(a6), a0
  004652  2050                 movea.l   (a0), a0
  004654  0c6800080020         cmpi.w    #$8, $20(a0)
  00465a  6708                 beq.b     $4664
  00465c  487900004868         pea.l     $4868.l   ; g_4868
  004662  abff                 _DebugStr 
  004664  2f2effe4             move.l    -$1c(a6), -(a7)
  004668  42a7                 clr.l     -(a7)
  00466a  203c00080006         move.l    #$80006, d0
  004670  ab1d                 _QDExtensions 
  004672  2f2effe8             move.l    -$18(a6), -(a7)
  004676  486effdc             pea.l     -$24(a6)
  00467a  a8f6                 _DrawPicture 
  00467c  7600                 moveq     #$0, d3
  00467e  60000132             bra.w     $47b2
  004682  302e0010             move.w    $10(a6), d0
  004686  48c0                 ext.l     d0
  004688  3203                 move.w    d3, d1
  00468a  48c1                 ext.l     d1
  00468c  4c401800             divsl.l   d0, d0:d1
  004690  3a00                 move.w    d0, d5
  004692  302e0010             move.w    $10(a6), d0
  004696  48c0                 ext.l     d0
  004698  3c03                 move.w    d3, d6
  00469a  48c6                 ext.l     d6
  00469c  4c406806             divs.l    d0, d6
  0046a0  486efff8             pea.l     -$8(a6)
  0046a4  3005                 move.w    d5, d0
  0046a6  c1ee000c             muls.w    $c(a6), d0
  0046aa  3f00                 move.w    d0, -(a7)
  0046ac  3006                 move.w    d6, d0
  0046ae  c1c7                 muls.w    d7, d0
  0046b0  3f00                 move.w    d0, -(a7)
  0046b2  302e000c             move.w    $c(a6), d0
  0046b6  48c0                 ext.l     d0
  0046b8  3205                 move.w    d5, d1
  0046ba  48c1                 ext.l     d1
  0046bc  5281                 addq.l    #$1, d1
  0046be  4c001800             muls.l    d0, d1
  0046c2  3f01                 move.w    d1, -(a7)
  0046c4  3007                 move.w    d7, d0
  0046c6  48c0                 ext.l     d0
  0046c8  3206                 move.w    d6, d1
  0046ca  48c1                 ext.l     d1
  0046cc  5281                 addq.l    #$1, d1
  0046ce  4c001800             muls.l    d0, d1
  0046d2  3f01                 move.w    d1, -(a7)
  0046d4  a8a7                 _SetRect  
  0046d6  701c                 moveq     #$1c, d0
  0046d8  c1c3                 muls.w    d3, d0
  0046da  244c                 movea.l   a4, a2
  0046dc  d5c0                 adda.l    d0, a2
  0046de  426a0002             clr.w     $2(a2)
  0046e2  4252                 clr.w     (a2)
  0046e4  356e000c0006         move.w    $c(a6), $6(a2)
  0046ea  35470004             move.w    d7, $4(a2)
  0046ee  42aa0010             clr.l     $10(a2)
  0046f2  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  0046f8  25480018             move.l    a0, $18(a2)
  0046fc  486a0008             pea.l     $8(a2)
  004700  2f2efff4             move.l    -$c(a6), -(a7)
  004704  486efff8             pea.l     -$8(a6)
  004708  61fffffff2f4         bsr.l     $39fe   ; EncodeRect
  00470e  25480010             move.l    a0, $10(a2)
  004712  2648                 movea.l   a0, a3
  004714  b66e0012             cmp.w     $12(a6), d3
  004718  4fef000c             lea.l     $c(a7), a7
  00471c  6d16                 blt.b     $4734
  00471e  b66e0014             cmp.w     $14(a6), d3
  004722  6e10                 bgt.b     $4734
  004724  2f0a                 move.l    a2, -(a7)
  004726  61fffffff694         bsr.l     $3dbc   ; BuildMaskRegion
  00472c  25480014             move.l    a0, $14(a2)
  004730  584f                 addq.w    #$4, a7
  004732  6004                 bra.b     $4738
  004734  42aa0014             clr.l     $14(a2)
  004738  4a44                 tst.w     d4
  00473a  6754                 beq.b     $4790
  00473c  200b                 move.l    a3, d0
  00473e  675e                 beq.b     $479e
  004740  594f                 subq.w    #$4, a7
  004742  2f3c48725370         move.l    #$48725370, -(a7)
  004748  3003                 move.w    d3, d0
  00474a  48c0                 ext.l     d0
  00474c  3204                 move.w    d4, d1
  00474e  48c1                 ext.l     d1
  004750  d280                 add.l     d0, d1
  004752  3f01                 move.w    d1, -(a7)
  004754  a9a0                 _GetResource 
  004756  205f                 movea.l   (a7)+, a0
  004758  2448                 movea.l   a0, a2
  00475a  200a                 move.l    a2, d0
  00475c  670c                 beq.b     $476a
  00475e  2f0a                 move.l    a2, -(a7)
  004760  a9ad                 _RemoveResource 
  004762  3f39000080cc         move.w    $80cc.l, -(a7)   ; g_80cc
  004768  a999                 _UpdateResFile 
  00476a  2f0b                 move.l    a3, -(a7)
  00476c  2f3c48725370         move.l    #$48725370, -(a7)
  004772  3003                 move.w    d3, d0
  004774  48c0                 ext.l     d0
  004776  3204                 move.w    d4, d1
  004778  48c1                 ext.l     d1
  00477a  d280                 add.l     d0, d1
  00477c  3f01                 move.w    d1, -(a7)
  00477e  487900004856         pea.l     $4856.l   ; g_4856
  004784  a9ab                 _AddResource 
  004786  2f0b                 move.l    a3, -(a7)
  004788  a9b0                 _WriteResource 
  00478a  2f0b                 move.l    a3, -(a7)
  00478c  a9a3                 _ReleaseResource 
  00478e  600e                 bra.b     $479e
  004790  206a0010             movea.l   $10(a2), a0
  004794  a04a                 _HNoPurge 
  004796  206a0010             movea.l   $10(a2), a0
  00479a  a064                 _MoveHHi  
  00479c  a029                 _HLock    
  00479e  7048                 moveq     #$48, d0
  0047a0  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  0047a6  2f00                 move.l    d0, -(a7)
  0047a8  61ff00000ed8         bsr.l     $5682   ; Update3DProgBar
  0047ae  5243                 addq.w    #$1, d3
  0047b0  584f                 addq.w    #$4, a7
  0047b2  b66e000a             cmp.w     $a(a6), d3
  0047b6  6d00feca             blt.w     $4682
  0047ba  2f2efff4             move.l    -$c(a6), -(a7)
  0047be  203c00040002         move.l    #$40002, d0
  0047c4  ab1d                 _QDExtensions 
  0047c6  2f2effe4             move.l    -$1c(a6), -(a7)
  0047ca  203c00040004         move.l    #$40004, d0
  0047d0  ab1d                 _QDExtensions 
  0047d2  206effe8             movea.l   -$18(a6), a0
  0047d6  a02a                 _HUnlock  
  0047d8  2f2effe8             move.l    -$18(a6), -(a7)
  0047dc  a9a3                 _ReleaseResource 
  0047de  6014                 bra.b     $47f4
  0047e0  4879000046cf         pea.l     $46cf.l   ; g_46cf
  0047e6  61ff00004af2         bsr.l     $92da   ; ReportDialog
  0047ec  204c                 movea.l   a4, a0
  0047ee  a01f                 _DisposePtr 
  0047f0  99cc                 suba.l    a4, a4
  0047f2  584f                 addq.w    #$4, a7
  0047f4  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  0047fa  670000f0             beq.w     $48ec
  0047fe  3f2effda             move.w    -$26(a6), -(a7)
  004802  a998                 _UseResFile 
  004804  600000e6             bra.w     $48ec
  004808  7600                 moveq     #$0, d3
  00480a  600000d8             bra.w     $48e4
  00480e  701c                 moveq     #$1c, d0
  004810  c1c3                 muls.w    d3, d0
  004812  244c                 movea.l   a4, a2
  004814  d5c0                 adda.l    d0, a2
  004816  42aa0010             clr.l     $10(a2)
  00481a  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  004820  25480018             move.l    a0, $18(a2)
  004824  42aa0014             clr.l     $14(a2)
  004828  594f                 subq.w    #$4, a7
  00482a  2f3c48725370         move.l    #$48725370, -(a7)
  004830  3003                 move.w    d3, d0
  004832  48c0                 ext.l     d0
  004834  3204                 move.w    d4, d1
  004836  48c1                 ext.l     d1
  004838  d280                 add.l     d0, d1
  00483a  3f01                 move.w    d1, -(a7)
  00483c  a9a0                 _GetResource 
  00483e  205f                 movea.l   (a7)+, a0
  004840  25480010             move.l    a0, $10(a2)
  004844  4aaa0010             tst.l     $10(a2)
  004848  676e                 beq.b     $48b8
  00484a  206a0010             movea.l   $10(a2), a0
  00484e  a04a                 _HNoPurge 
  004850  206a0010             movea.l   $10(a2), a0
  004854  a064                 _MoveHHi  
  004856  a029                 _HLock    
  004858  206a0010             movea.l   $10(a2), a0
  00485c  2650                 movea.l   (a0), a3
  00485e  2493                 move.l    (a3), (a2)
  004860  256b00040004         move.l    $4(a3), $4(a2)
  004866  508b                 addq.l    #$8, a3
  004868  25530008             move.l    (a3), $8(a2)
  00486c  256b0004000c         move.l    $4(a3), $c(a2)
  004872  b66e0012             cmp.w     $12(a6), d3
  004876  6d16                 blt.b     $488e
  004878  b66e0014             cmp.w     $14(a6), d3
  00487c  6e10                 bgt.b     $488e
  00487e  2f0a                 move.l    a2, -(a7)
  004880  61fffffff53a         bsr.l     $3dbc   ; BuildMaskRegion
  004886  25480014             move.l    a0, $14(a2)
  00488a  584f                 addq.w    #$4, a7
  00488c  6004                 bra.b     $4892
  00488e  42aa0014             clr.l     $14(a2)
  004892  206a0010             movea.l   $10(a2), a0
  004896  a064                 _MoveHHi  
  004898  a029                 _HLock    
  00489a  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  0048a0  25480018             move.l    a0, $18(a2)
  0048a4  7048                 moveq     #$48, d0
  0048a6  d0b9000080c6         add.l     $80c6.l, d0   ; g_80c6
  0048ac  2f00                 move.l    d0, -(a7)
  0048ae  61ff00000dd2         bsr.l     $5682   ; Update3DProgBar
  0048b4  584f                 addq.w    #$4, a7
  0048b6  602a                 bra.b     $48e2
  0048b8  2f2efff0             move.l    -$10(a6), -(a7)
  0048bc  2f2effec             move.l    -$14(a6), -(a7)
  0048c0  203c00080006         move.l    #$80006, d0
  0048c6  ab1d                 _QDExtensions 
  0048c8  3003                 move.w    d3, d0
  0048ca  48c0                 ext.l     d0
  0048cc  3204                 move.w    d4, d1
  0048ce  48c1                 ext.l     d1
  0048d0  d280                 add.l     d0, d1
  0048d2  3f01                 move.w    d1, -(a7)
  0048d4  4879000047be         pea.l     $47be.l   ; g_47be
  0048da  61ff000049b6         bsr.l     $9292   ; ReportError
  0048e0  5c4f                 addq.w    #$6, a7
  0048e2  5243                 addq.w    #$1, d3
  0048e4  b66e000a             cmp.w     $a(a6), d3
  0048e8  6d00ff24             blt.w     $480e
  0048ec  2f2efff0             move.l    -$10(a6), -(a7)
  0048f0  2f2effec             move.l    -$14(a6), -(a7)
  0048f4  203c00080006         move.l    #$80006, d0
  0048fa  ab1d                 _QDExtensions 
  0048fc  204c                 movea.l   a4, a0
  0048fe  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  004902  4e5e                 unlk      a6
  004904  4e75                 rts       

;-------------------------------------------------------------
; DisposeEncFace   (seg 2 +004920, 62 bytes)
  004920  4e560000             link.w    a6, #$0
  004924  2f0a                 move.l    a2, -(a7)
  004926  246e0008             movea.l   $8(a6), a2
  00492a  200a                 move.l    a2, d0
  00492c  672a                 beq.b     $4958
  00492e  4aaa0010             tst.l     $10(a2)
  004932  6714                 beq.b     $4948
  004934  206a0010             movea.l   $10(a2), a0
  004938  4a90                 tst.l     (a0)
  00493a  670c                 beq.b     $4948
  00493c  206a0010             movea.l   $10(a2), a0
  004940  a02a                 _HUnlock  
  004942  206a0010             movea.l   $10(a2), a0
  004946  a023                 _DisposeHandle 
  004948  4aaa0014             tst.l     $14(a2)
  00494c  6706                 beq.b     $4954
  00494e  2f2a0014             move.l    $14(a2), -(a7)
  004952  a8d9                 _DisposeRgn 
  004954  204a                 movea.l   a2, a0
  004956  a01f                 _DisposePtr 
  004958  245f                 movea.l   (a7)+, a2
  00495a  4e5e                 unlk      a6
  00495c  4e75                 rts       

;-------------------------------------------------------------
; LoadMenuBar   (seg 2 +004970, 136 bytes)
  004970  4e560000             link.w    a6, #$0
  004974  2f03                 move.l    d3, -(a7)
  004976  7601                 moveq     #$1, d3
  004978  594f                 subq.w    #$4, a7
  00497a  3f3c0080             move.w    #$80, -(a7)
  00497e  a9c0                 _GetNewMBar 
  004980  205f                 movea.l   (a7)+, a0
  004982  23c800007458         move.l    a0, $7458.l   ; g_7458
  004988  4ab900007458         tst.l     $7458.l   ; g_7458
  00498e  6760                 beq.b     $49f0
  004990  2f3900007458         move.l    $7458.l, -(a7)   ; g_7458
  004996  a93c                 _SetMenuBar 
  004998  594f                 subq.w    #$4, a7
  00499a  3f3c0080             move.w    #$80, -(a7)
  00499e  a949                 _GetMenuHandle 
  0049a0  205f                 movea.l   (a7)+, a0
  0049a2  23c80000745c         move.l    a0, $745c.l   ; g_745c
  0049a8  594f                 subq.w    #$4, a7
  0049aa  3f3c0081             move.w    #$81, -(a7)
  0049ae  a949                 _GetMenuHandle 
  0049b0  205f                 movea.l   (a7)+, a0
  0049b2  23c800007460         move.l    a0, $7460.l   ; g_7460
  0049b8  594f                 subq.w    #$4, a7
  0049ba  3f3c0082             move.w    #$82, -(a7)
  0049be  a949                 _GetMenuHandle 
  0049c0  205f                 movea.l   (a7)+, a0
  0049c2  23c800007464         move.l    a0, $7464.l   ; g_7464
  0049c8  4ab90000745c         tst.l     $745c.l   ; g_745c
  0049ce  6720                 beq.b     $49f0
  0049d0  4ab900007460         tst.l     $7460.l   ; g_7460
  0049d6  6718                 beq.b     $49f0
  0049d8  4ab900007464         tst.l     $7464.l   ; g_7464
  0049de  6710                 beq.b     $49f0
  0049e0  7600                 moveq     #$0, d3
  0049e2  2f390000745c         move.l    $745c.l, -(a7)   ; g_745c
  0049e8  2f3c44525652         move.l    #$44525652, -(a7)
  0049ee  a94d                 _AppendResMenu 
  0049f0  1003                 move.b    d3, d0
  0049f2  261f                 move.l    (a7)+, d3
  0049f4  4e5e                 unlk      a6
  0049f6  4e75                 rts       

;-------------------------------------------------------------
; UpdateMenus   (seg 2 +004a06, 200 bytes)
  004a06  4e560000             link.w    a6, #$0
  004a0a  4a3900007f1d         tst.b     $7f1d.l   ; g_7f1d
  004a10  673e                 beq.b     $4a50
  004a12  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a18  3f3c0001             move.w    #$1, -(a7)
  004a1c  a93a                 _DisableItem 
  004a1e  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a24  3f3c0002             move.w    #$2, -(a7)
  004a28  a93a                 _DisableItem 
  004a2a  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a30  3f3c0004             move.w    #$4, -(a7)
  004a34  a939                 _EnableItem 
  004a36  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a3c  3f3c0006             move.w    #$6, -(a7)
  004a40  a939                 _EnableItem 
  004a42  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a48  3f3c0007             move.w    #$7, -(a7)
  004a4c  a93a                 _DisableItem 
  004a4e  603c                 bra.b     $4a8c
  004a50  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a56  3f3c0001             move.w    #$1, -(a7)
  004a5a  a939                 _EnableItem 
  004a5c  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a62  3f3c0002             move.w    #$2, -(a7)
  004a66  a939                 _EnableItem 
  004a68  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a6e  3f3c0004             move.w    #$4, -(a7)
  004a72  a93a                 _DisableItem 
  004a74  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a7a  3f3c0006             move.w    #$6, -(a7)
  004a7e  a93a                 _DisableItem 
  004a80  2f3900007460         move.l    $7460.l, -(a7)   ; g_7460
  004a86  3f3c0007             move.w    #$7, -(a7)
  004a8a  a939                 _EnableItem 
  004a8c  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  004a92  6612                 bne.b     $4aa6
  004a94  42390000617d         clr.b     $617d.l   ; g_617d
  004a9a  2f3900007464         move.l    $7464.l, -(a7)   ; g_7464
  004aa0  3f3c0001             move.w    #$1, -(a7)
  004aa4  a93a                 _DisableItem 
  004aa6  2f3900007464         move.l    $7464.l, -(a7)   ; g_7464
  004aac  3f3c0001             move.w    #$1, -(a7)
  004ab0  1f390000617d         move.b    $617d.l, -(a7)   ; g_617d
  004ab6  a945                 _CheckItem 
  004ab8  2f3900007464         move.l    $7464.l, -(a7)   ; g_7464
  004abe  3f3c0002             move.w    #$2, -(a7)
  004ac2  1f390000617c         move.b    $617c.l, -(a7)   ; g_617c
  004ac8  a945                 _CheckItem 
  004aca  4e5e                 unlk      a6
  004acc  4e75                 rts       

;-------------------------------------------------------------
; HandleMenuSelection   (seg 2 +004adc, 88 bytes)
  004adc  4e560000             link.w    a6, #$0
  004ae0  48e71c00             movem.l   d3-d5, -(a7)
  004ae4  2a2e0008             move.l    $8(a6), d5
  004ae8  2805                 move.l    d5, d4
  004aea  7210                 moveq     #$10, d1
  004aec  e2a4                 asr.l     d1, d4
  004aee  3605                 move.w    d5, d3
  004af0  3004                 move.w    d4, d0
  004af2  48c0                 ext.l     d0
  004af4  048000000080         subi.l    #$80, d0
  004afa  670a                 beq.b     $4b06
  004afc  5380                 subq.l    #$1, d0
  004afe  6712                 beq.b     $4b12
  004b00  5380                 subq.l    #$1, d0
  004b02  671a                 beq.b     $4b1e
  004b04  6022                 bra.b     $4b28
  004b06  3f03                 move.w    d3, -(a7)
  004b08  61ff00000040         bsr.l     $4b4a   ; HandleAppleMenuSelection
  004b0e  544f                 addq.w    #$2, a7
  004b10  6016                 bra.b     $4b28
  004b12  3f03                 move.w    d3, -(a7)
  004b14  61ff00000108         bsr.l     $4c1e   ; HandleFileMenuSelection
  004b1a  544f                 addq.w    #$2, a7
  004b1c  600a                 bra.b     $4b28
  004b1e  3f03                 move.w    d3, -(a7)
  004b20  61ff00000188         bsr.l     $4caa   ; HandleGameMenuSelection
  004b26  544f                 addq.w    #$2, a7
  004b28  4267                 clr.w     -(a7)
  004b2a  a938                 _HiliteMenu 
  004b2c  4cdf0038             movem.l   (a7)+, d3-d5
  004b30  4e5e                 unlk      a6
  004b32  4e75                 rts       

;-------------------------------------------------------------
; HandleAppleMenuSelection   (seg 2 +004b4a, 184 bytes)
  004b4a  4e56fefa             link.w    a6, #$fefa
  004b4e  2f03                 move.l    d3, -(a7)
  004b50  362e0008             move.w    $8(a6), d3
  004b54  3003                 move.w    d3, d0
  004b56  48c0                 ext.l     d0
  004b58  5380                 subq.l    #$1, d0
  004b5a  670a                 beq.b     $4b66
  004b5c  5380                 subq.l    #$1, d0
  004b5e  6710                 beq.b     $4b70
  004b60  5380                 subq.l    #$1, d0
  004b62  676c                 beq.b     $4bd0
  004b64  6072                 bra.b     $4bd8
  004b66  4eb90000b462         jsr       $b462.l   ; Credits
  004b6c  6000008e             bra.w     $4bfc
  004b70  486efefb             pea.l     -$105(a6)
  004b74  4eb900000150         jsr       $150.l   ; seg7+609a
  004b7a  3600                 move.w    d0, d3
  004b7c  3003                 move.w    d3, d0
  004b7e  48c0                 ext.l     d0
  004b80  584f                 addq.w    #$4, a7
  004b82  663a                 bne.b     $4bbe
  004b84  4a2efefb             tst.b     -$105(a6)
  004b88  6624                 bne.b     $4bae
  004b8a  1f3c0001             move.b    #$1, -(a7)
  004b8e  4eb900000158         jsr       $158.l   ; seg7+6114
  004b94  3600                 move.w    d0, d3
  004b96  4a43                 tst.w     d3
  004b98  544f                 addq.w    #$2, a7
  004b9a  6760                 beq.b     $4bfc
  004b9c  3f03                 move.w    d3, -(a7)
  004b9e  48790000467a         pea.l     $467a.l   ; g_467a
  004ba4  61ff000046ec         bsr.l     $9292   ; ReportError
  004baa  5c4f                 addq.w    #$6, a7
  004bac  604e                 bra.b     $4bfc
  004bae  487900004651         pea.l     $4651.l   ; g_4651
  004bb4  61ff00004724         bsr.l     $92da   ; ReportDialog
  004bba  584f                 addq.w    #$4, a7
  004bbc  603e                 bra.b     $4bfc
  004bbe  3f03                 move.w    d3, -(a7)
  004bc0  487900004600         pea.l     $4600.l   ; g_4600
  004bc6  61ff000046ca         bsr.l     $9292   ; ReportError
  004bcc  5c4f                 addq.w    #$6, a7
  004bce  602c                 bra.b     $4bfc
  004bd0  4eb90000ae3e         jsr       $ae3e.l   ; Instructions
  004bd6  6024                 bra.b     $4bfc
  004bd8  486efefc             pea.l     -$104(a6)
  004bdc  a874                 _GetPort  
  004bde  2f390000745c         move.l    $745c.l, -(a7)   ; g_745c
  004be4  3f03                 move.w    d3, -(a7)
  004be6  486eff00             pea.l     -$100(a6)
  004bea  a946                 _GetMenuItemText 
  004bec  554f                 subq.w    #$2, a7
  004bee  486eff00             pea.l     -$100(a6)
  004bf2  a9b6                 _OpenDeskAcc 
  004bf4  301f                 move.w    (a7)+, d0
  004bf6  2f2efefc             move.l    -$104(a6), -(a7)
  004bfa  a873                 _SetPort  
  004bfc  261f                 move.l    (a7)+, d3
  004bfe  4e5e                 unlk      a6
  004c00  4e75                 rts       

;-------------------------------------------------------------
; HandleFileMenuSelection   (seg 2 +004c1e, 114 bytes)
  004c1e  4e560000             link.w    a6, #$0
  004c22  302e0008             move.w    $8(a6), d0
  004c26  48c0                 ext.l     d0
  004c28  0c8000000009         cmpi.l    #$9, d0
  004c2e  625c                 bhi.b     $4c8c
  004c30  303b0206             move.w    $4c38(pc, d0.w * 2), d0
  004c34  4efb0002             jmp       $4c38(pc, d0.w)
  004c38  005400140024005400320054003a0042 cases     0:$4c8c 1:$4c4c 2:$4c5c 3:$4c8c 4:$4c6a 5:$4c8c 6:$4c72 7:$4c7a
  004c48  0054004e             cases     8:$4c8c 9:$4c86
  004c4c  13fc000100007f22     move.b    #$1, $7f22.l   ; g_7f22
  004c54  4eb900007a3e         jsr       $7a3e.l   ; NewGame
  004c5a  6030                 bra.b     $4c8c
  004c5c  423900007f22         clr.b     $7f22.l   ; g_7f22
  004c62  4eb900007a3e         jsr       $7a3e.l   ; NewGame
  004c68  6022                 bra.b     $4c8c
  004c6a  4eb90000a0a2         jsr       $a0a2.l   ; AbortGame
  004c70  601a                 bra.b     $4c8c
  004c72  4eb90000a112         jsr       $a112.l   ; DoSaveGame
  004c78  6012                 bra.b     $4c8c
  004c7a  42a7                 clr.l     -(a7)
  004c7c  4eb90000a64c         jsr       $a64c.l   ; ContinueGame
  004c82  584f                 addq.w    #$4, a7
  004c84  6006                 bra.b     $4c8c
  004c86  4eb90000b8a2         jsr       $b8a2.l   ; Quit
  004c8c  4e5e                 unlk      a6
  004c8e  4e75                 rts       

;-------------------------------------------------------------
; HandleGameMenuSelection   (seg 2 +004caa, 50 bytes)
  004caa  4e560000             link.w    a6, #$0
  004cae  302e0008             move.w    $8(a6), d0
  004cb2  48c0                 ext.l     d0
  004cb4  5380                 subq.l    #$1, d0
  004cb6  670a                 beq.b     $4cc2
  004cb8  5380                 subq.l    #$1, d0
  004cba  670e                 beq.b     $4cca
  004cbc  5580                 subq.l    #$2, d0
  004cbe  6712                 beq.b     $4cd2
  004cc0  6016                 bra.b     $4cd8
  004cc2  4eb90000af2e         jsr       $af2e.l   ; ToggleMusic
  004cc8  600e                 bra.b     $4cd8
  004cca  4eb90000b0d6         jsr       $b0d6.l   ; ToggleSound
  004cd0  6006                 bra.b     $4cd8
  004cd2  4eb90000b35e         jsr       $b35e.l   ; Options
  004cd8  4e5e                 unlk      a6
  004cda  4e75                 rts       

;-------------------------------------------------------------
; MyGotRequiredParams   (seg 2 +004cf6, 60 bytes)
  004cf6  4e56fff8             link.w    a6, #$fff8
  004cfa  554f                 subq.w    #$2, a7
  004cfc  2f2e0008             move.l    $8(a6), -(a7)
  004d00  2f3c6d697373         move.l    #$6d697373, -(a7)
  004d06  2f3c2a2a2a2a         move.l    #$2a2a2a2a, -(a7)
  004d0c  486efffc             pea.l     -$4(a6)
  004d10  42a7                 clr.l     -(a7)
  004d12  42a7                 clr.l     -(a7)
  004d14  486efff8             pea.l     -$8(a6)
  004d18  303c0e15             move.w    #$e15, d0
  004d1c  a816                 _trap_a816 
  004d1e  301f                 move.w    (a7)+, d0
  004d20  0c40f95b             cmpi.w    #$f95b, d0
  004d24  6604                 bne.b     $4d2a
  004d26  7000                 moveq     #$0, d0
  004d28  6004                 bra.b     $4d2e
  004d2a  303cf94d             move.w    #$f94d, d0
  004d2e  4e5e                 unlk      a6
  004d30  4e75                 rts       

;-------------------------------------------------------------
; DOOPENAPPAE   (seg 2 +004d48, 16 bytes)
  004d48  4e560000             link.w    a6, #$0
  004d4c  3f7cf9540014         move.w    #$f954, $14(a7)
  004d52  4e5e                 unlk      a6
  004d54  4e74000c             rtd       #$c

;-------------------------------------------------------------
; DOOPENDOCAE   (seg 2 +004d66, 214 bytes)
  004d66  4e56ff4a             link.w    a6, #$ff4a
  004d6a  48e71820             movem.l   d3-d4/a2, -(a7)
  004d6e  246e0010             movea.l   $10(a6), a2
  004d72  554f                 subq.w    #$2, a7
  004d74  2f0a                 move.l    a2, -(a7)
  004d76  2f3c2d2d2d2d         move.l    #$2d2d2d2d, -(a7)
  004d7c  2f3c6c697374         move.l    #$6c697374, -(a7)
  004d82  486eff5a             pea.l     -$a6(a6)
  004d86  303c0812             move.w    #$812, d0
  004d8a  a816                 _trap_a816 
  004d8c  301f                 move.w    (a7)+, d0
  004d8e  3800                 move.w    d0, d4
  004d90  554f                 subq.w    #$2, a7
  004d92  486eff5a             pea.l     -$a6(a6)
  004d96  486eff56             pea.l     -$aa(a6)
  004d9a  303c0407             move.w    #$407, d0
  004d9e  a816                 _trap_a816 
  004da0  301f                 move.w    (a7)+, d0
  004da2  3800                 move.w    d0, d4
  004da4  7601                 moveq     #$1, d3
  004da6  6072                 bra.b     $4e1a
  004da8  554f                 subq.w    #$2, a7
  004daa  486eff5a             pea.l     -$a6(a6)
  004dae  3043                 movea.w   d3, a0
  004db0  2f08                 move.l    a0, -(a7)
  004db2  2f3c66737320         move.l    #$66737320, -(a7)
  004db8  486eff4e             pea.l     -$b2(a6)
  004dbc  486eff4a             pea.l     -$b6(a6)
  004dc0  486eff62             pea.l     -$9e(a6)
  004dc4  48780046             pea.l     $46.w
  004dc8  486eff52             pea.l     -$ae(a6)
  004dcc  303c100a             move.w    #$100a, d0
  004dd0  a816                 _trap_a816 
  004dd2  301f                 move.w    (a7)+, d0
  004dd4  3800                 move.w    d0, d4
  004dd6  3004                 move.w    d4, d0
  004dd8  48c0                 ext.l     d0
  004dda  663c                 bne.b     $4e18
  004ddc  41eeff62             lea.l     -$9e(a6), a0
  004de0  43eeffae             lea.l     -$52(a6), a1
  004de4  7010                 moveq     #$10, d0
  004de6  22d8                 move.l    (a0)+, (a1)+
  004de8  51c8fffc             dbra      d0, $4de6
  004dec  32d8                 move.w    (a0)+, (a1)+
  004dee  1d7c0001ffa8         move.b    #$1, -$58(a6)
  004df4  4a39000046ce         tst.b     $46ce.l   ; levelDone
  004dfa  670c                 beq.b     $4e08
  004dfc  486effa8             pea.l     -$58(a6)
  004e00  4eb90000a64c         jsr       $a64c.l   ; ContinueGame
  004e06  584f                 addq.w    #$4, a7
  004e08  2f0a                 move.l    a2, -(a7)
  004e0a  61fffffffeea         bsr.l     $4cf6   ; MyGotRequiredParams
  004e10  3f4000da             move.w    d0, $da(a7)
  004e14  584f                 addq.w    #$4, a7
  004e16  601a                 bra.b     $4e32
  004e18  5243                 addq.w    #$1, d3
  004e1a  3003                 move.w    d3, d0
  004e1c  48c0                 ext.l     d0
  004e1e  b0aeff56             cmp.l     -$aa(a6), d0
  004e22  6f84                 ble.b     $4da8
  004e24  2f0a                 move.l    a2, -(a7)
  004e26  61fffffffece         bsr.l     $4cf6   ; MyGotRequiredParams
  004e2c  3f4000da             move.w    d0, $da(a7)
  004e30  584f                 addq.w    #$4, a7
  004e32  4cdf0418             movem.l   (a7)+, d3-d4/a2
  004e36  4e5e                 unlk      a6
  004e38  4e74000c             rtd       #$c

;-------------------------------------------------------------
; DOPRINTDOCAE   (seg 2 +004e4a, 16 bytes)
  004e4a  4e560000             link.w    a6, #$0
  004e4e  3f7cf9540014         move.w    #$f954, $14(a7)
  004e54  4e5e                 unlk      a6
  004e56  4e74000c             rtd       #$c

;-------------------------------------------------------------
; DOQUITAPPAE   (seg 2 +004e6a, 30 bytes)
  004e6a  4e560000             link.w    a6, #$0
  004e6e  4eb90000b8a2         jsr       $b8a2.l   ; Quit
  004e74  2f2e0010             move.l    $10(a6), -(a7)
  004e78  61fffffffe7c         bsr.l     $4cf6   ; MyGotRequiredParams
  004e7e  3f400018             move.w    d0, $18(a7)
  004e82  4e5e                 unlk      a6
  004e84  4e74000c             rtd       #$c

;-------------------------------------------------------------
; InstallAppleEvents   (seg 2 +004e96, 148 bytes)
  004e96  4e560000             link.w    a6, #$0
  004e9a  2f03                 move.l    d3, -(a7)
  004e9c  554f                 subq.w    #$2, a7
  004e9e  2f3c61657674         move.l    #$61657674, -(a7)
  004ea4  2f3c6f617070         move.l    #$6f617070, -(a7)
  004eaa  487900000a50         pea.l     $a50.l   ; DOOPENAPPAE
  004eb0  42a7                 clr.l     -(a7)
  004eb2  4227                 clr.b     -(a7)
  004eb4  303c091f             move.w    #$91f, d0
  004eb8  a816                 _trap_a816 
  004eba  301f                 move.w    (a7)+, d0
  004ebc  3600                 move.w    d0, d3
  004ebe  554f                 subq.w    #$2, a7
  004ec0  2f3c61657674         move.l    #$61657674, -(a7)
  004ec6  2f3c6f646f63         move.l    #$6f646f63, -(a7)
  004ecc  487900000a58         pea.l     $a58.l   ; DOOPENDOCAE
  004ed2  42a7                 clr.l     -(a7)
  004ed4  4227                 clr.b     -(a7)
  004ed6  303c091f             move.w    #$91f, d0
  004eda  a816                 _trap_a816 
  004edc  301f                 move.w    (a7)+, d0
  004ede  3600                 move.w    d0, d3
  004ee0  554f                 subq.w    #$2, a7
  004ee2  2f3c61657674         move.l    #$61657674, -(a7)
  004ee8  2f3c70646f63         move.l    #$70646f63, -(a7)
  004eee  487900000a60         pea.l     $a60.l   ; DOPRINTDOCAE
  004ef4  42a7                 clr.l     -(a7)
  004ef6  4227                 clr.b     -(a7)
  004ef8  303c091f             move.w    #$91f, d0
  004efc  a816                 _trap_a816 
  004efe  301f                 move.w    (a7)+, d0
  004f00  3600                 move.w    d0, d3
  004f02  554f                 subq.w    #$2, a7
  004f04  2f3c61657674         move.l    #$61657674, -(a7)
  004f0a  2f3c71756974         move.l    #$71756974, -(a7)
  004f10  487900000a68         pea.l     $a68.l   ; DOQUITAPPAE
  004f16  42a7                 clr.l     -(a7)
  004f18  4227                 clr.b     -(a7)
  004f1a  303c091f             move.w    #$91f, d0
  004f1e  a816                 _trap_a816 
  004f20  301f                 move.w    (a7)+, d0
  004f22  3600                 move.w    d0, d3
  004f24  261f                 move.l    (a7)+, d3
  004f26  4e5e                 unlk      a6
  004f28  4e75                 rts       

;-------------------------------------------------------------
; IsAnyKeyDown   (seg 2 +004f40, 72 bytes)
  004f40  4e56ffec             link.w    a6, #$ffec
  004f44  2f03                 move.l    d3, -(a7)
  004f46  486efff0             pea.l     -$10(a6)
  004f4a  a976                 _GetKeys  
  004f4c  7601                 moveq     #$1, d3
  004f4e  602a                 bra.b     $4f7a
  004f50  7001                 moveq     #$1, d0
  004f52  3203                 move.w    d3, d1
  004f54  7407                 moveq     #$7, d2
  004f56  c282                 and.l     d2, d1
  004f58  3403                 move.w    d3, d2
  004f5a  48c2                 ext.l     d2
  004f5c  e682                 asr.l     #$3, d2
  004f5e  41eefff0             lea.l     -$10(a6), a0
  004f62  2d40ffec             move.l    d0, -$14(a6)
  004f66  7000                 moveq     #$0, d0
  004f68  10302800             move.b    (a0, d2.l), d0
  004f6c  e2a0                 asr.l     d1, d0
  004f6e  c0aeffec             and.l     -$14(a6), d0
  004f72  6704                 beq.b     $4f78
  004f74  7001                 moveq     #$1, d0
  004f76  600a                 bra.b     $4f82
  004f78  5243                 addq.w    #$1, d3
  004f7a  0c430080             cmpi.w    #$80, d3
  004f7e  6dd0                 blt.b     $4f50
  004f80  7000                 moveq     #$0, d0
  004f82  261f                 move.l    (a7)+, d3
  004f84  4e5e                 unlk      a6
  004f86  4e75                 rts       

;-------------------------------------------------------------
; PressAnyKey   (seg 2 +004f98, 38 bytes)
  004f98  4e560000             link.w    a6, #$0
  004f9c  2f03                 move.l    d3, -(a7)
  004f9e  7600                 moveq     #$0, d3
  004fa0  6012                 bra.b     $4fb4
  004fa2  61ffffffff9c         bsr.l     $4f40   ; IsAnyKeyDown
  004fa8  1600                 move.b    d0, d3
  004faa  554f                 subq.w    #$2, a7
  004fac  a974                 _Button   
  004fae  101f                 move.b    (a7)+, d0
  004fb0  6702                 beq.b     $4fb4
  004fb2  7601                 moveq     #$1, d3
  004fb4  4a03                 tst.b     d3
  004fb6  67ea                 beq.b     $4fa2
  004fb8  261f                 move.l    (a7)+, d3
  004fba  4e5e                 unlk      a6
  004fbc  4e75                 rts       

;-------------------------------------------------------------
; CopyPString   (seg 2 +004fcc, 40 bytes)
  004fcc  4e560000             link.w    a6, #$0
  004fd0  206e0008             movea.l   $8(a6), a0
  004fd4  226e000c             movea.l   $c(a6), a1
  004fd8  7400                 moveq     #$0, d2
  004fda  6008                 bra.b     $4fe4
  004fdc  13b020002000         move.b    (a0, d2.w), (a1, d2.w)
  004fe2  5242                 addq.w    #$1, d2
  004fe4  7000                 moveq     #$0, d0
  004fe6  1010                 move.b    (a0), d0
  004fe8  3202                 move.w    d2, d1
  004fea  48c1                 ext.l     d1
  004fec  b280                 cmp.l     d0, d1
  004fee  6fec                 ble.b     $4fdc
  004ff0  4e5e                 unlk      a6
  004ff2  4e75                 rts       

;-------------------------------------------------------------
; ConcatPString   (seg 2 +005002, 72 bytes)
  005002  4e560000             link.w    a6, #$0
  005006  2f04                 move.l    d4, -(a7)
  005008  226e0008             movea.l   $8(a6), a1
  00500c  206e000c             movea.l   $c(a6), a0
  005010  7800                 moveq     #$0, d4
  005012  1811                 move.b    (a1), d4
  005014  1010                 move.b    (a0), d0
  005016  d111                 add.b     d0, (a1)
  005018  0c1100ff             cmpi.b    #$ff, (a1)
  00501c  6304                 bls.b     $5022
  00501e  12bc00ff             move.b    #$ff, (a1)
  005022  7401                 moveq     #$1, d2
  005024  6012                 bra.b     $5038
  005026  3002                 move.w    d2, d0
  005028  48c0                 ext.l     d0
  00502a  3204                 move.w    d4, d1
  00502c  48c1                 ext.l     d1
  00502e  d280                 add.l     d0, d1
  005030  13b020001800         move.b    (a0, d2.w), (a1, d1.l)
  005036  5242                 addq.w    #$1, d2
  005038  7000                 moveq     #$0, d0
  00503a  1010                 move.b    (a0), d0
  00503c  3202                 move.w    d2, d1
  00503e  48c1                 ext.l     d1
  005040  b280                 cmp.l     d0, d1
  005042  6fe2                 ble.b     $5026
  005044  281f                 move.l    (a7)+, d4
  005046  4e5e                 unlk      a6
  005048  4e75                 rts       

;-------------------------------------------------------------
; StringsEqual   (seg 2 +00505a, 64 bytes)
  00505a  4e560000             link.w    a6, #$0
  00505e  2f04                 move.l    d4, -(a7)
  005060  206e0008             movea.l   $8(a6), a0
  005064  226e000c             movea.l   $c(a6), a1
  005068  7801                 moveq     #$1, d4
  00506a  1010                 move.b    (a0), d0
  00506c  b011                 cmp.b     (a1), d0
  00506e  6704                 beq.b     $5074
  005070  7800                 moveq     #$0, d4
  005072  601e                 bra.b     $5092
  005074  7400                 moveq     #$0, d2
  005076  600e                 bra.b     $5086
  005078  10302000             move.b    (a0, d2.w), d0
  00507c  b0312000             cmp.b     (a1, d2.w), d0
  005080  6702                 beq.b     $5084
  005082  7800                 moveq     #$0, d4
  005084  5242                 addq.w    #$1, d2
  005086  7000                 moveq     #$0, d0
  005088  1010                 move.b    (a0), d0
  00508a  3202                 move.w    d2, d1
  00508c  48c1                 ext.l     d1
  00508e  b280                 cmp.l     d0, d1
  005090  6de6                 blt.b     $5078
  005092  1004                 move.b    d4, d0
  005094  281f                 move.l    (a7)+, d4
  005096  4e5e                 unlk      a6
  005098  4e75                 rts       

;-------------------------------------------------------------
; ExpandRect   (seg 2 +0050aa, 30 bytes)
  0050aa  4e560000             link.w    a6, #$0
  0050ae  206e0008             movea.l   $8(a6), a0
  0050b2  302e000c             move.w    $c(a6), d0
  0050b6  91680002             sub.w     d0, $2(a0)
  0050ba  9150                 sub.w     d0, (a0)
  0050bc  d1680006             add.w     d0, $6(a0)
  0050c0  d1680004             add.w     d0, $4(a0)
  0050c4  4e5e                 unlk      a6
  0050c6  4e75                 rts       

;-------------------------------------------------------------
; KillAllSprites   (seg 2 +0050d6, 42 bytes)
  0050d6  4e560000             link.w    a6, #$0
  0050da  48e70030             movem.l   a2-a3, -(a7)
  0050de  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  0050e4  600e                 bra.b     $50f4
  0050e6  266a002e             movea.l   $2e(a2), a3
  0050ea  2f0a                 move.l    a2, -(a7)
  0050ec  4eb900000068         jsr       $68.l   ; SATKILLSPRITE
  0050f2  244b                 movea.l   a3, a2
  0050f4  200a                 move.l    a2, d0
  0050f6  66ee                 bne.b     $50e6
  0050f8  4cdf0c00             movem.l   (a7)+, a2-a3
  0050fc  4e5e                 unlk      a6
  0050fe  4e75                 rts       

;-------------------------------------------------------------
; DrawPICTToBackScreen   (seg 2 +005112, 68 bytes)
  005112  4e560000             link.w    a6, #$0
  005116  4ab9ffffe866         tst.l     $ffffe866.l   ; g_-179a
  00511c  6706                 beq.b     $5124
  00511e  61ffffffffb6         bsr.l     $50d6   ; KillAllSprites
  005124  4eb9000000d8         jsr       $d8.l   ; SATSETPORTBACKSCREEN
  00512a  3f2e0008             move.w    $8(a6), -(a7)
  00512e  2f2e000a             move.l    $a(a6), -(a7)
  005132  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  005138  2f2e000a             move.l    $a(a6), -(a7)
  00513c  4eb9000000f0         jsr       $f0.l   ; SATBACKCHANGED
  005142  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005148  1f3c0001             move.b    #$1, -(a7)
  00514c  4eb900000108         jsr       $108.l   ; SATRUN
  005152  4e5e                 unlk      a6
  005154  4e75                 rts       

;-------------------------------------------------------------
; GammaFadeOut   (seg 2 +00516e, 208 bytes)
  00516e  4e560000             link.w    a6, #$0
  005172  48e71c00             movem.l   d3-d5, -(a7)
  005176  3a2e0008             move.w    $8(a6), d5
  00517a  4a39000045f7         tst.b     $45f7.l   ; g_45f7
  005180  670000b4             beq.w     $5236
  005184  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  00518a  660000aa             bne.w     $5236
  00518e  61ff00000d18         bsr.l     $5ea8   ; HideCursorSafe
  005194  554f                 subq.w    #$2, a7
  005196  4879000072c2         pea.l     $72c2.l   ; g_72c2
  00519c  4eb900000218         jsr       $218.l   ; STARTFADING
  0051a2  301f                 move.w    (a7)+, d0
  0051a4  594f                 subq.w    #$4, a7
  0051a6  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0051ac  4879000072ca         pea.l     $72ca.l   ; g_72ca
  0051b2  2f3c00100010         move.l    #$100010, -(a7)
  0051b8  4eb900000240         jsr       $240.l   ; CALCFADETOCOLOR
  0051be  205f                 movea.l   (a7)+, a0
  0051c0  23c8000072c6         move.l    a0, $72c6.l   ; g_72c6
  0051c6  7800                 moveq     #$0, d4
  0051c8  6042                 bra.b     $520c
  0051ca  594f                 subq.w    #$4, a7
  0051cc  a975                 _TickCount 
  0051ce  201f                 move.l    (a7)+, d0
  0051d0  2600                 move.l    d0, d3
  0051d2  554f                 subq.w    #$2, a7
  0051d4  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0051da  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  0051e0  3f04                 move.w    d4, -(a7)
  0051e2  3f3c0100             move.w    #$100, -(a7)
  0051e6  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  0051ec  301f                 move.w    (a7)+, d0
  0051ee  594f                 subq.w    #$4, a7
  0051f0  a975                 _TickCount 
  0051f2  201f                 move.l    (a7)+, d0
  0051f4  5380                 subq.l    #$1, d0
  0051f6  b680                 cmp.l     d0, d3
  0051f8  62f4                 bhi.b     $51ee
  0051fa  3005                 move.w    d5, d0
  0051fc  48c0                 ext.l     d0
  0051fe  223c00000100         move.l    #$100, d1
  005204  4c401801             divs.l    d0, d1
  005208  e281                 asr.l     #$1, d1
  00520a  d841                 add.w     d1, d4
  00520c  0c440100             cmpi.w    #$100, d4
  005210  6fb8                 ble.b     $51ca
  005212  554f                 subq.w    #$2, a7
  005214  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  00521a  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  005220  2f3c01000100         move.l    #$1000100, -(a7)
  005226  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  00522c  301f                 move.w    (a7)+, d0
  00522e  13fc000100007f1b     move.b    #$1, $7f1b.l   ; g_7f1b
  005236  4cdf0038             movem.l   (a7)+, d3-d5
  00523a  4e5e                 unlk      a6
  00523c  4e75                 rts       

;-------------------------------------------------------------
; GammaFadeIn   (seg 2 +00524e, 192 bytes)
  00524e  4e560000             link.w    a6, #$0
  005252  48e71c00             movem.l   d3-d5, -(a7)
  005256  3a2e0008             move.w    $8(a6), d5
  00525a  4a39000045f7         tst.b     $45f7.l   ; g_45f7
  005260  6700009e             beq.w     $5300
  005264  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  00526a  67000094             beq.w     $5300
  00526e  7800                 moveq     #$0, d4
  005270  6040                 bra.b     $52b2
  005272  594f                 subq.w    #$4, a7
  005274  a975                 _TickCount 
  005276  201f                 move.l    (a7)+, d0
  005278  2600                 move.l    d0, d3
  00527a  554f                 subq.w    #$2, a7
  00527c  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  005282  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  005288  3f04                 move.w    d4, -(a7)
  00528a  3f3c0100             move.w    #$100, -(a7)
  00528e  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  005294  301f                 move.w    (a7)+, d0
  005296  594f                 subq.w    #$4, a7
  005298  a975                 _TickCount 
  00529a  201f                 move.l    (a7)+, d0
  00529c  5380                 subq.l    #$1, d0
  00529e  b680                 cmp.l     d0, d3
  0052a0  62f4                 bhi.b     $5296
  0052a2  3005                 move.w    d5, d0
  0052a4  48c0                 ext.l     d0
  0052a6  223c00000100         move.l    #$100, d1
  0052ac  4c401801             divs.l    d0, d1
  0052b0  d841                 add.w     d1, d4
  0052b2  0c440100             cmpi.w    #$100, d4
  0052b6  6fba                 ble.b     $5272
  0052b8  554f                 subq.w    #$2, a7
  0052ba  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  0052c0  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0052c6  2f3c01000100         move.l    #$1000100, -(a7)
  0052cc  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  0052d2  301f                 move.w    (a7)+, d0
  0052d4  554f                 subq.w    #$2, a7
  0052d6  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  0052dc  4eb900000228         jsr       $228.l   ; DISPOSEGAMMAREF
  0052e2  301f                 move.w    (a7)+, d0
  0052e4  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0052ea  1f3c0001             move.b    #$1, -(a7)
  0052ee  4eb900000220         jsr       $220.l   ; STOPFADING
  0052f4  61ff00000b86         bsr.l     $5e7c   ; ShowCursorSafe
  0052fa  423900007f1b         clr.b     $7f1b.l   ; g_7f1b
  005300  61ff00000bd6         bsr.l     $5ed8   ; ResetCursor
  005306  4cdf0038             movem.l   (a7)+, d3-d5
  00530a  4e5e                 unlk      a6
  00530c  4e75                 rts       

;-------------------------------------------------------------
; FinalGammaFadeIn   (seg 2 +00531c, 176 bytes)
  00531c  4e560000             link.w    a6, #$0
  005320  48e71800             movem.l   d3-d4, -(a7)
  005324  4a39000045f7         tst.b     $45f7.l   ; g_45f7
  00532a  67000092             beq.w     $53be
  00532e  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  005334  67000088             beq.w     $53be
  005338  7800                 moveq     #$0, d4
  00533a  6034                 bra.b     $5370
  00533c  594f                 subq.w    #$4, a7
  00533e  a975                 _TickCount 
  005340  201f                 move.l    (a7)+, d0
  005342  2600                 move.l    d0, d3
  005344  554f                 subq.w    #$2, a7
  005346  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  00534c  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  005352  3f04                 move.w    d4, -(a7)
  005354  3f3c0100             move.w    #$100, -(a7)
  005358  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  00535e  301f                 move.w    (a7)+, d0
  005360  594f                 subq.w    #$4, a7
  005362  a975                 _TickCount 
  005364  201f                 move.l    (a7)+, d0
  005366  5380                 subq.l    #$1, d0
  005368  b680                 cmp.l     d0, d3
  00536a  62f4                 bhi.b     $5360
  00536c  06440010             addi.w    #$10, d4
  005370  0c440100             cmpi.w    #$100, d4
  005374  6fc6                 ble.b     $533c
  005376  554f                 subq.w    #$2, a7
  005378  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  00537e  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  005384  2f3c01000100         move.l    #$1000100, -(a7)
  00538a  4eb900000238         jsr       $238.l   ; FADEFROMGAMMATOGAMMA
  005390  301f                 move.w    (a7)+, d0
  005392  554f                 subq.w    #$2, a7
  005394  2f39000072c6         move.l    $72c6.l, -(a7)   ; g_72c6
  00539a  4eb900000228         jsr       $228.l   ; DISPOSEGAMMAREF
  0053a0  301f                 move.w    (a7)+, d0
  0053a2  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0053a8  1f3c0001             move.b    #$1, -(a7)
  0053ac  4eb900000220         jsr       $220.l   ; STOPFADING
  0053b2  61ff00000ac8         bsr.l     $5e7c   ; ShowCursorSafe
  0053b8  423900007f1b         clr.b     $7f1b.l   ; g_7f1b
  0053be  61ff00000b18         bsr.l     $5ed8   ; ResetCursor
  0053c4  4cdf0018             movem.l   (a7)+, d3-d4
  0053c8  4e5e                 unlk      a6
  0053ca  4e75                 rts       

;-------------------------------------------------------------
; FinalGammaRestore   (seg 2 +0053e0, 66 bytes)
  0053e0  4e560000             link.w    a6, #$0
  0053e4  4a39000045f7         tst.b     $45f7.l   ; g_45f7
  0053ea  672c                 beq.b     $5418
  0053ec  554f                 subq.w    #$2, a7
  0053ee  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  0053f4  2f3c00020001         move.l    #$20001, -(a7)
  0053fa  4eb900000230         jsr       $230.l   ; FADETOGAMMA
  005400  301f                 move.w    (a7)+, d0
  005402  2f39000072c2         move.l    $72c2.l, -(a7)   ; g_72c2
  005408  1f3c0001             move.b    #$1, -(a7)
  00540c  4eb900000220         jsr       $220.l   ; STOPFADING
  005412  423900007f1b         clr.b     $7f1b.l   ; g_7f1b
  005418  61ff00000abe         bsr.l     $5ed8   ; ResetCursor
  00541e  4e5e                 unlk      a6
  005420  4e75                 rts       

;-------------------------------------------------------------
; SafeReportStr   (seg 2 +005436, 32 bytes)
  005436  4e560000             link.w    a6, #$0
  00543a  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  005440  6706                 beq.b     $5448
  005442  61fffffffed8         bsr.l     $531c   ; FinalGammaFadeIn
  005448  2f2e0008             move.l    $8(a6), -(a7)
  00544c  4eb900000030         jsr       $30.l   ; SATREPORTSTR
  005452  4e5e                 unlk      a6
  005454  4e75                 rts       

;-------------------------------------------------------------
; PointInRect   (seg 2 +005466, 44 bytes)
  005466  4e56fff8             link.w    a6, #$fff8
  00546a  486efff8             pea.l     -$8(a6)
  00546e  3f2e000c             move.w    $c(a6), -(a7)
  005472  3f2e000e             move.w    $e(a6), -(a7)
  005476  3f2e0010             move.w    $10(a6), -(a7)
  00547a  3f2e0012             move.w    $12(a6), -(a7)
  00547e  a8a7                 _SetRect  
  005480  554f                 subq.w    #$2, a7
  005482  2f2e0008             move.l    $8(a6), -(a7)
  005486  486efff8             pea.l     -$8(a6)
  00548a  a8ad                 _PtInRect 
  00548c  101f                 move.b    (a7)+, d0
  00548e  4e5e                 unlk      a6
  005490  4e75                 rts       

;-------------------------------------------------------------
; SetColorPerc   (seg 2 +0054a0, 88 bytes)
  0054a0  4e560000             link.w    a6, #$0
  0054a4  206e0008             movea.l   $8(a6), a0
  0054a8  302e000c             move.w    $c(a6), d0
  0054ac  48c0                 ext.l     d0
  0054ae  4c3c08000000ffff     muls.l    #$ffff, d0
  0054b6  4c7c080000000064     divs.l    #$64, d0
  0054be  3080                 move.w    d0, (a0)
  0054c0  302e000e             move.w    $e(a6), d0
  0054c4  48c0                 ext.l     d0
  0054c6  4c3c08000000ffff     muls.l    #$ffff, d0
  0054ce  4c7c080000000064     divs.l    #$64, d0
  0054d6  31400002             move.w    d0, $2(a0)
  0054da  302e0010             move.w    $10(a6), d0
  0054de  48c0                 ext.l     d0
  0054e0  4c3c08000000ffff     muls.l    #$ffff, d0
  0054e8  4c7c080000000064     divs.l    #$64, d0
  0054f0  31400004             move.w    d0, $4(a0)
  0054f4  4e5e                 unlk      a6
  0054f6  4e75                 rts       

;-------------------------------------------------------------
; PlotColoredPoint   (seg 2 +005508, 34 bytes)
  005508  4e560000             link.w    a6, #$0
  00550c  2f2e0008             move.l    $8(a6), -(a7)
  005510  aa14                 _RGBForeColor 
  005512  3f2e000c             move.w    $c(a6), -(a7)
  005516  3f2e000e             move.w    $e(a6), -(a7)
  00551a  a893                 _MoveTo   
  00551c  3f2e000c             move.w    $c(a6), -(a7)
  005520  3f2e000e             move.w    $e(a6), -(a7)
  005524  a891                 _LineTo   
  005526  4e5e                 unlk      a6
  005528  4e75                 rts       

;-------------------------------------------------------------
; PlotColoredHLine   (seg 2 +00553e, 46 bytes)
  00553e  4e560000             link.w    a6, #$0
  005542  2f2e0008             move.l    $8(a6), -(a7)
  005546  aa14                 _RGBForeColor 
  005548  3f2e000c             move.w    $c(a6), -(a7)
  00554c  3f2e000e             move.w    $e(a6), -(a7)
  005550  a893                 _MoveTo   
  005552  302e0010             move.w    $10(a6), d0
  005556  48c0                 ext.l     d0
  005558  322e000c             move.w    $c(a6), d1
  00555c  48c1                 ext.l     d1
  00555e  d280                 add.l     d0, d1
  005560  3f01                 move.w    d1, -(a7)
  005562  3f2e000e             move.w    $e(a6), -(a7)
  005566  a891                 _LineTo   
  005568  4e5e                 unlk      a6
  00556a  4e75                 rts       

;-------------------------------------------------------------
; Init3DProgBar   (seg 2 +005580, 242 bytes)
  005580  4e560000             link.w    a6, #$0
  005584  33ee0008000045fe     move.w    $8(a6), $45fe.l   ; g_45fe
  00558c  33ee000a000045fc     move.w    $a(a6), $45fc.l   ; g_45fc
  005594  33ee000c000045fa     move.w    $c(a6), $45fa.l   ; g_45fa
  00559c  4267                 clr.w     -(a7)
  00559e  42a7                 clr.l     -(a7)
  0055a0  487900007286         pea.l     $7286.l   ; g_7286
  0055a6  61fffffffef8         bsr.l     $54a0   ; SetColorPerc
  0055ac  3f3c0037             move.w    #$37, -(a7)
  0055b0  42a7                 clr.l     -(a7)
  0055b2  48790000728c         pea.l     $728c.l   ; g_728c
  0055b8  61fffffffee6         bsr.l     $54a0   ; SetColorPerc
  0055be  3f3c003d             move.w    #$3d, -(a7)
  0055c2  2f3c00130013         move.l    #$130013, -(a7)
  0055c8  487900007292         pea.l     $7292.l   ; g_7292
  0055ce  61fffffffed0         bsr.l     $54a0   ; SetColorPerc
  0055d4  3f3c0051             move.w    #$51, -(a7)
  0055d8  2f3c00270027         move.l    #$270027, -(a7)
  0055de  487900007298         pea.l     $7298.l   ; g_7298
  0055e4  61fffffffeba         bsr.l     $54a0   ; SetColorPerc
  0055ea  3f3c0064             move.w    #$64, -(a7)
  0055ee  2f3c003d003d         move.l    #$3d003d, -(a7)
  0055f4  48790000729e         pea.l     $729e.l   ; g_729e
  0055fa  61fffffffea4         bsr.l     $54a0   ; SetColorPerc
  005600  3f3c0064             move.w    #$64, -(a7)
  005604  2f3c00510051         move.l    #$510051, -(a7)
  00560a  4879000072a4         pea.l     $72a4.l   ; g_72a4
  005610  61fffffffe8e         bsr.l     $54a0   ; SetColorPerc
  005616  3f3c0064             move.w    #$64, -(a7)
  00561a  2f3c00640064         move.l    #$640064, -(a7)
  005620  4879000072aa         pea.l     $72aa.l   ; g_72aa
  005626  61fffffffe78         bsr.l     $54a0   ; SetColorPerc
  00562c  3f3c0020             move.w    #$20, -(a7)
  005630  2f3c00200020         move.l    #$200020, -(a7)
  005636  4879000072b0         pea.l     $72b0.l   ; g_72b0
  00563c  61fffffffe62         bsr.l     $54a0   ; SetColorPerc
  005642  3f3c0037             move.w    #$37, -(a7)
  005646  2f3c00370037         move.l    #$370037, -(a7)
  00564c  4879000072b6         pea.l     $72b6.l   ; g_72b6
  005652  61fffffffe4c         bsr.l     $54a0   ; SetColorPerc
  005658  3f3c0050             move.w    #$50, -(a7)
  00565c  2f3c00280028         move.l    #$280028, -(a7)
  005662  4879000072bc         pea.l     $72bc.l   ; g_72bc
  005668  61fffffffe36         bsr.l     $54a0   ; SetColorPerc
  00566e  4e5e                 unlk      a6
  005670  4e75                 rts       

;-------------------------------------------------------------
; Update3DProgBar   (seg 2 +005682, 1494 bytes)
  005682  4e56fff8             link.w    a6, #$fff8
  005686  48e71e00             movem.l   d3-d6, -(a7)
  00568a  2a2e0008             move.l    $8(a6), d5
  00568e  0c8500010000         cmpi.l    #$10000, d5
  005694  6f06                 ble.b     $569c
  005696  2a3c00010000         move.l    #$10000, d5
  00569c  23c5000080c6         move.l    d5, $80c6.l   ; g_80c6
  0056a2  3639000045fa         move.w    $45fa.l, d3   ; g_45fa
  0056a8  48c3                 ext.l     d3
  0056aa  4c053800             muls.l    d5, d3
  0056ae  7210                 moveq     #$10, d1
  0056b0  e2a3                 asr.l     d1, d3
  0056b2  3039000045f8         move.w    $45f8.l, d0   ; g_45f8
  0056b8  48c0                 ext.l     d0
  0056ba  b680                 cmp.l     d0, d3
  0056bc  67000592             beq.w     $5c50
  0056c0  3839000045fe         move.w    $45fe.l, d4   ; g_45fe
  0056c6  4eb9000000d8         jsr       $d8.l   ; SATSETPORTBACKSCREEN
  0056cc  3039000045f8         move.w    $45f8.l, d0   ; g_45f8
  0056d2  48c0                 ext.l     d0
  0056d4  2203                 move.l    d3, d1
  0056d6  9280                 sub.l     d0, d1
  0056d8  4a81                 tst.l     d1
  0056da  6f10                 ble.b     $56ec
  0056dc  3039000045f8         move.w    $45f8.l, d0   ; g_45f8
  0056e2  48c0                 ext.l     d0
  0056e4  2203                 move.l    d3, d1
  0056e6  9280                 sub.l     d0, d1
  0056e8  2001                 move.l    d1, d0
  0056ea  6010                 bra.b     $56fc
  0056ec  3039000045f8         move.w    $45f8.l, d0   ; g_45f8
  0056f2  48c0                 ext.l     d0
  0056f4  2203                 move.l    d3, d1
  0056f6  9280                 sub.l     d0, d1
  0056f8  4481                 neg.l     d1
  0056fa  2001                 move.l    d1, d0
  0056fc  5a80                 addq.l    #$5, d0
  0056fe  2c00                 move.l    d0, d6
  005700  7008                 moveq     #$8, d0
  005702  bc80                 cmp.l     d0, d6
  005704  6c12                 bge.b     $5718
  005706  0c850000e290         cmpi.l    #$e290, d5
  00570c  6c0a                 bge.b     $5718
  00570e  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005714  6000053a             bra.w     $5c50
  005718  0c790008000045f8     cmpi.w    #$8, $45f8.l   ; g_45f8
  005720  6e0e                 bgt.b     $5730
  005722  7008                 moveq     #$8, d0
  005724  b680                 cmp.l     d0, d3
  005726  6f08                 ble.b     $5730
  005728  7c10                 moveq     #$10, d6
  00572a  3839000045fe         move.w    $45fe.l, d4   ; g_45fe
  005730  33c3000045f8         move.w    d3, $45f8.l   ; g_45f8
  005736  7008                 moveq     #$8, d0
  005738  b680                 cmp.l     d0, d3
  00573a  6f00039e             ble.w     $5ada
  00573e  3f39000045fe         move.w    $45fe.l, -(a7)   ; g_45fe
  005744  3f39000045fc         move.w    $45fc.l, -(a7)   ; g_45fc
  00574a  a893                 _MoveTo   
  00574c  487900007298         pea.l     $7298.l   ; g_7298
  005752  aa14                 _RGBForeColor 
  005754  3f39000045fe         move.w    $45fe.l, -(a7)   ; g_45fe
  00575a  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005760  48c0                 ext.l     d0
  005762  7209                 moveq     #$9, d1
  005764  d081                 add.l     d1, d0
  005766  3f00                 move.w    d0, -(a7)
  005768  a891                 _LineTo   
  00576a  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005770  48c0                 ext.l     d0
  005772  3f00                 move.w    d0, -(a7)
  005774  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  00577a  48c0                 ext.l     d0
  00577c  5280                 addq.l    #$1, d0
  00577e  3f00                 move.w    d0, -(a7)
  005780  48790000729e         pea.l     $729e.l   ; g_729e
  005786  61fffffffd80         bsr.l     $5508   ; PlotColoredPoint
  00578c  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005792  48c0                 ext.l     d0
  005794  5280                 addq.l    #$1, d0
  005796  3f00                 move.w    d0, -(a7)
  005798  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  00579e  48c0                 ext.l     d0
  0057a0  5280                 addq.l    #$1, d0
  0057a2  3f00                 move.w    d0, -(a7)
  0057a4  4879000072a4         pea.l     $72a4.l   ; g_72a4
  0057aa  61fffffffd5c         bsr.l     $5508   ; PlotColoredPoint
  0057b0  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0057b6  48c0                 ext.l     d0
  0057b8  5480                 addq.l    #$2, d0
  0057ba  3f00                 move.w    d0, -(a7)
  0057bc  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  0057c2  48c0                 ext.l     d0
  0057c4  5280                 addq.l    #$1, d0
  0057c6  3f00                 move.w    d0, -(a7)
  0057c8  4879000072aa         pea.l     $72aa.l   ; g_72aa
  0057ce  61fffffffd38         bsr.l     $5508   ; PlotColoredPoint
  0057d4  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0057da  48c0                 ext.l     d0
  0057dc  5680                 addq.l    #$3, d0
  0057de  3f00                 move.w    d0, -(a7)
  0057e0  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  0057e6  48c0                 ext.l     d0
  0057e8  5280                 addq.l    #$1, d0
  0057ea  3f00                 move.w    d0, -(a7)
  0057ec  4879000072aa         pea.l     $72aa.l   ; g_72aa
  0057f2  61fffffffd14         bsr.l     $5508   ; PlotColoredPoint
  0057f8  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0057fe  48c0                 ext.l     d0
  005800  5880                 addq.l    #$4, d0
  005802  3f00                 move.w    d0, -(a7)
  005804  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  00580a  48c0                 ext.l     d0
  00580c  5280                 addq.l    #$1, d0
  00580e  3f00                 move.w    d0, -(a7)
  005810  4879000072aa         pea.l     $72aa.l   ; g_72aa
  005816  61fffffffcf0         bsr.l     $5508   ; PlotColoredPoint
  00581c  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005822  48c0                 ext.l     d0
  005824  5a80                 addq.l    #$5, d0
  005826  3f00                 move.w    d0, -(a7)
  005828  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  00582e  48c0                 ext.l     d0
  005830  5280                 addq.l    #$1, d0
  005832  3f00                 move.w    d0, -(a7)
  005834  4879000072a4         pea.l     $72a4.l   ; g_72a4
  00583a  61fffffffccc         bsr.l     $5508   ; PlotColoredPoint
  005840  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005846  48c0                 ext.l     d0
  005848  5c80                 addq.l    #$6, d0
  00584a  3f00                 move.w    d0, -(a7)
  00584c  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005852  48c0                 ext.l     d0
  005854  5280                 addq.l    #$1, d0
  005856  3f00                 move.w    d0, -(a7)
  005858  48790000729e         pea.l     $729e.l   ; g_729e
  00585e  61fffffffca8         bsr.l     $5508   ; PlotColoredPoint
  005864  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  00586a  48c0                 ext.l     d0
  00586c  5e80                 addq.l    #$7, d0
  00586e  3f00                 move.w    d0, -(a7)
  005870  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005876  48c0                 ext.l     d0
  005878  5280                 addq.l    #$1, d0
  00587a  3f00                 move.w    d0, -(a7)
  00587c  487900007298         pea.l     $7298.l   ; g_7298
  005882  61fffffffc84         bsr.l     $5508   ; PlotColoredPoint
  005888  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  00588e  48c0                 ext.l     d0
  005890  5080                 addq.l    #$8, d0
  005892  3f00                 move.w    d0, -(a7)
  005894  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  00589a  48c0                 ext.l     d0
  00589c  5280                 addq.l    #$1, d0
  00589e  3f00                 move.w    d0, -(a7)
  0058a0  487900007292         pea.l     $7292.l   ; g_7292
  0058a6  61fffffffc60         bsr.l     $5508   ; PlotColoredPoint
  0058ac  2003                 move.l    d3, d0
  0058ae  5980                 subq.l    #$4, d0
  0058b0  3f00                 move.w    d0, -(a7)
  0058b2  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0058b8  48c0                 ext.l     d0
  0058ba  3f00                 move.w    d0, -(a7)
  0058bc  3004                 move.w    d4, d0
  0058be  48c0                 ext.l     d0
  0058c0  5480                 addq.l    #$2, d0
  0058c2  3f00                 move.w    d0, -(a7)
  0058c4  487900007298         pea.l     $7298.l   ; g_7298
  0058ca  61fffffffc72         bsr.l     $553e   ; PlotColoredHLine
  0058d0  2003                 move.l    d3, d0
  0058d2  5980                 subq.l    #$4, d0
  0058d4  3f00                 move.w    d0, -(a7)
  0058d6  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0058dc  48c0                 ext.l     d0
  0058de  5280                 addq.l    #$1, d0
  0058e0  3f00                 move.w    d0, -(a7)
  0058e2  3004                 move.w    d4, d0
  0058e4  48c0                 ext.l     d0
  0058e6  5480                 addq.l    #$2, d0
  0058e8  3f00                 move.w    d0, -(a7)
  0058ea  48790000729e         pea.l     $729e.l   ; g_729e
  0058f0  61fffffffc4c         bsr.l     $553e   ; PlotColoredHLine
  0058f6  2003                 move.l    d3, d0
  0058f8  5980                 subq.l    #$4, d0
  0058fa  3f00                 move.w    d0, -(a7)
  0058fc  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005902  48c0                 ext.l     d0
  005904  5480                 addq.l    #$2, d0
  005906  3f00                 move.w    d0, -(a7)
  005908  3004                 move.w    d4, d0
  00590a  48c0                 ext.l     d0
  00590c  5480                 addq.l    #$2, d0
  00590e  3f00                 move.w    d0, -(a7)
  005910  4879000072a4         pea.l     $72a4.l   ; g_72a4
  005916  61fffffffc26         bsr.l     $553e   ; PlotColoredHLine
  00591c  2003                 move.l    d3, d0
  00591e  5980                 subq.l    #$4, d0
  005920  3f00                 move.w    d0, -(a7)
  005922  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005928  48c0                 ext.l     d0
  00592a  5680                 addq.l    #$3, d0
  00592c  3f00                 move.w    d0, -(a7)
  00592e  3004                 move.w    d4, d0
  005930  48c0                 ext.l     d0
  005932  5480                 addq.l    #$2, d0
  005934  3f00                 move.w    d0, -(a7)
  005936  4879000072aa         pea.l     $72aa.l   ; g_72aa
  00593c  61fffffffc00         bsr.l     $553e   ; PlotColoredHLine
  005942  2003                 move.l    d3, d0
  005944  5980                 subq.l    #$4, d0
  005946  3f00                 move.w    d0, -(a7)
  005948  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  00594e  48c0                 ext.l     d0
  005950  5880                 addq.l    #$4, d0
  005952  3f00                 move.w    d0, -(a7)
  005954  3004                 move.w    d4, d0
  005956  48c0                 ext.l     d0
  005958  5480                 addq.l    #$2, d0
  00595a  3f00                 move.w    d0, -(a7)
  00595c  4879000072a4         pea.l     $72a4.l   ; g_72a4
  005962  61fffffffbda         bsr.l     $553e   ; PlotColoredHLine
  005968  2003                 move.l    d3, d0
  00596a  5980                 subq.l    #$4, d0
  00596c  3f00                 move.w    d0, -(a7)
  00596e  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005974  48c0                 ext.l     d0
  005976  5a80                 addq.l    #$5, d0
  005978  3f00                 move.w    d0, -(a7)
  00597a  3004                 move.w    d4, d0
  00597c  48c0                 ext.l     d0
  00597e  5480                 addq.l    #$2, d0
  005980  3f00                 move.w    d0, -(a7)
  005982  48790000729e         pea.l     $729e.l   ; g_729e
  005988  61fffffffbb4         bsr.l     $553e   ; PlotColoredHLine
  00598e  2003                 move.l    d3, d0
  005990  5980                 subq.l    #$4, d0
  005992  3f00                 move.w    d0, -(a7)
  005994  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  00599a  48c0                 ext.l     d0
  00599c  5c80                 addq.l    #$6, d0
  00599e  3f00                 move.w    d0, -(a7)
  0059a0  3004                 move.w    d4, d0
  0059a2  48c0                 ext.l     d0
  0059a4  5480                 addq.l    #$2, d0
  0059a6  3f00                 move.w    d0, -(a7)
  0059a8  487900007298         pea.l     $7298.l   ; g_7298
  0059ae  61fffffffb8e         bsr.l     $553e   ; PlotColoredHLine
  0059b4  2003                 move.l    d3, d0
  0059b6  5980                 subq.l    #$4, d0
  0059b8  3f00                 move.w    d0, -(a7)
  0059ba  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0059c0  48c0                 ext.l     d0
  0059c2  5e80                 addq.l    #$7, d0
  0059c4  3f00                 move.w    d0, -(a7)
  0059c6  3004                 move.w    d4, d0
  0059c8  48c0                 ext.l     d0
  0059ca  5480                 addq.l    #$2, d0
  0059cc  3f00                 move.w    d0, -(a7)
  0059ce  487900007292         pea.l     $7292.l   ; g_7292
  0059d4  61fffffffb68         bsr.l     $553e   ; PlotColoredHLine
  0059da  2003                 move.l    d3, d0
  0059dc  5980                 subq.l    #$4, d0
  0059de  3f00                 move.w    d0, -(a7)
  0059e0  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  0059e6  48c0                 ext.l     d0
  0059e8  5080                 addq.l    #$8, d0
  0059ea  3f00                 move.w    d0, -(a7)
  0059ec  3004                 move.w    d4, d0
  0059ee  48c0                 ext.l     d0
  0059f0  5480                 addq.l    #$2, d0
  0059f2  3f00                 move.w    d0, -(a7)
  0059f4  48790000728c         pea.l     $728c.l   ; g_728c
  0059fa  61fffffffb42         bsr.l     $553e   ; PlotColoredHLine
  005a00  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005a06  48c0                 ext.l     d0
  005a08  3f00                 move.w    d0, -(a7)
  005a0a  2003                 move.l    d3, d0
  005a0c  5580                 subq.l    #$2, d0
  005a0e  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005a14  48c1                 ext.l     d1
  005a16  d280                 add.l     d0, d1
  005a18  3f01                 move.w    d1, -(a7)
  005a1a  487900007298         pea.l     $7298.l   ; g_7298
  005a20  61fffffffae6         bsr.l     $5508   ; PlotColoredPoint
  005a26  487900007292         pea.l     $7292.l   ; g_7292
  005a2c  aa14                 _RGBForeColor 
  005a2e  2003                 move.l    d3, d0
  005a30  5580                 subq.l    #$2, d0
  005a32  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005a38  48c1                 ext.l     d1
  005a3a  d280                 add.l     d0, d1
  005a3c  3f01                 move.w    d1, -(a7)
  005a3e  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005a44  48c0                 ext.l     d0
  005a46  5280                 addq.l    #$1, d0
  005a48  3f00                 move.w    d0, -(a7)
  005a4a  a893                 _MoveTo   
  005a4c  2003                 move.l    d3, d0
  005a4e  5580                 subq.l    #$2, d0
  005a50  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005a56  48c1                 ext.l     d1
  005a58  d280                 add.l     d0, d1
  005a5a  3f01                 move.w    d1, -(a7)
  005a5c  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005a62  48c0                 ext.l     d0
  005a64  5e80                 addq.l    #$7, d0
  005a66  3f00                 move.w    d0, -(a7)
  005a68  a891                 _LineTo   
  005a6a  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005a70  48c0                 ext.l     d0
  005a72  5080                 addq.l    #$8, d0
  005a74  3f00                 move.w    d0, -(a7)
  005a76  2003                 move.l    d3, d0
  005a78  5580                 subq.l    #$2, d0
  005a7a  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005a80  48c1                 ext.l     d1
  005a82  d280                 add.l     d0, d1
  005a84  3f01                 move.w    d1, -(a7)
  005a86  48790000728c         pea.l     $728c.l   ; g_728c
  005a8c  61fffffffa7a         bsr.l     $5508   ; PlotColoredPoint
  005a92  48790000728c         pea.l     $728c.l   ; g_728c
  005a98  aa14                 _RGBForeColor 
  005a9a  2003                 move.l    d3, d0
  005a9c  5380                 subq.l    #$1, d0
  005a9e  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005aa4  48c1                 ext.l     d1
  005aa6  d280                 add.l     d0, d1
  005aa8  3f01                 move.w    d1, -(a7)
  005aaa  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005ab0  48c0                 ext.l     d0
  005ab2  3f00                 move.w    d0, -(a7)
  005ab4  a893                 _MoveTo   
  005ab6  2003                 move.l    d3, d0
  005ab8  5380                 subq.l    #$1, d0
  005aba  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005ac0  48c1                 ext.l     d1
  005ac2  d280                 add.l     d0, d1
  005ac4  3f01                 move.w    d1, -(a7)
  005ac6  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005acc  48c0                 ext.l     d0
  005ace  5080                 addq.l    #$8, d0
  005ad0  3f00                 move.w    d0, -(a7)
  005ad2  a891                 _LineTo   
  005ad4  4fef00b2             lea.l     $b2(a7), a7
  005ad8  603c                 bra.b     $5b16
  005ada  4879000072bc         pea.l     $72bc.l   ; g_72bc
  005ae0  aa14                 _RGBForeColor 
  005ae2  486efff8             pea.l     -$8(a6)
  005ae6  3f39000045fe         move.w    $45fe.l, -(a7)   ; g_45fe
  005aec  3f39000045fc         move.w    $45fc.l, -(a7)   ; g_45fc
  005af2  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005af8  48c0                 ext.l     d0
  005afa  d083                 add.l     d3, d0
  005afc  5280                 addq.l    #$1, d0
  005afe  3f00                 move.w    d0, -(a7)
  005b00  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005b06  48c0                 ext.l     d0
  005b08  7209                 moveq     #$9, d1
  005b0a  d081                 add.l     d1, d0
  005b0c  3f00                 move.w    d0, -(a7)
  005b0e  a8a7                 _SetRect  
  005b10  486efff8             pea.l     -$8(a6)
  005b14  a8a2                 _PaintRect 
  005b16  487900007286         pea.l     $7286.l   ; g_7286
  005b1c  aa14                 _RGBForeColor 
  005b1e  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005b24  48c0                 ext.l     d0
  005b26  d083                 add.l     d3, d0
  005b28  3f00                 move.w    d0, -(a7)
  005b2a  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005b30  48c0                 ext.l     d0
  005b32  3f00                 move.w    d0, -(a7)
  005b34  a893                 _MoveTo   
  005b36  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005b3c  48c0                 ext.l     d0
  005b3e  d083                 add.l     d3, d0
  005b40  3f00                 move.w    d0, -(a7)
  005b42  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005b48  48c0                 ext.l     d0
  005b4a  5080                 addq.l    #$8, d0
  005b4c  3f00                 move.w    d0, -(a7)
  005b4e  a891                 _LineTo   
  005b50  3039000045fa         move.w    $45fa.l, d0   ; g_45fa
  005b56  48c0                 ext.l     d0
  005b58  9083                 sub.l     d3, d0
  005b5a  7202                 moveq     #$2, d1
  005b5c  b081                 cmp.l     d1, d0
  005b5e  6f42                 ble.b     $5ba2
  005b60  4879000072b0         pea.l     $72b0.l   ; g_72b0
  005b66  aa14                 _RGBForeColor 
  005b68  2003                 move.l    d3, d0
  005b6a  5280                 addq.l    #$1, d0
  005b6c  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005b72  48c1                 ext.l     d1
  005b74  d280                 add.l     d0, d1
  005b76  3f01                 move.w    d1, -(a7)
  005b78  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005b7e  48c0                 ext.l     d0
  005b80  3f00                 move.w    d0, -(a7)
  005b82  a893                 _MoveTo   
  005b84  2003                 move.l    d3, d0
  005b86  5280                 addq.l    #$1, d0
  005b88  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005b8e  48c1                 ext.l     d1
  005b90  d280                 add.l     d0, d1
  005b92  3f01                 move.w    d1, -(a7)
  005b94  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005b9a  48c0                 ext.l     d0
  005b9c  5080                 addq.l    #$8, d0
  005b9e  3f00                 move.w    d0, -(a7)
  005ba0  a891                 _LineTo   
  005ba2  3039000045fa         move.w    $45fa.l, d0   ; g_45fa
  005ba8  48c0                 ext.l     d0
  005baa  9083                 sub.l     d3, d0
  005bac  7203                 moveq     #$3, d1
  005bae  b081                 cmp.l     d1, d0
  005bb0  6f42                 ble.b     $5bf4
  005bb2  4879000072b6         pea.l     $72b6.l   ; g_72b6
  005bb8  aa14                 _RGBForeColor 
  005bba  2003                 move.l    d3, d0
  005bbc  5480                 addq.l    #$2, d0
  005bbe  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005bc4  48c1                 ext.l     d1
  005bc6  d280                 add.l     d0, d1
  005bc8  3f01                 move.w    d1, -(a7)
  005bca  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005bd0  48c0                 ext.l     d0
  005bd2  3f00                 move.w    d0, -(a7)
  005bd4  a893                 _MoveTo   
  005bd6  2003                 move.l    d3, d0
  005bd8  5480                 addq.l    #$2, d0
  005bda  3239000045fe         move.w    $45fe.l, d1   ; g_45fe
  005be0  48c1                 ext.l     d1
  005be2  d280                 add.l     d0, d1
  005be4  3f01                 move.w    d1, -(a7)
  005be6  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005bec  48c0                 ext.l     d0
  005bee  5080                 addq.l    #$8, d0
  005bf0  3f00                 move.w    d0, -(a7)
  005bf2  a891                 _LineTo   
  005bf4  486efff8             pea.l     -$8(a6)
  005bf8  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005bfe  48c0                 ext.l     d0
  005c00  d083                 add.l     d3, d0
  005c02  9086                 sub.l     d6, d0
  005c04  3f00                 move.w    d0, -(a7)
  005c06  3f39000045fc         move.w    $45fc.l, -(a7)   ; g_45fc
  005c0c  3039000045fe         move.w    $45fe.l, d0   ; g_45fe
  005c12  48c0                 ext.l     d0
  005c14  d083                 add.l     d3, d0
  005c16  5880                 addq.l    #$4, d0
  005c18  3f00                 move.w    d0, -(a7)
  005c1a  3039000045fc         move.w    $45fc.l, d0   ; g_45fc
  005c20  48c0                 ext.l     d0
  005c22  7209                 moveq     #$9, d1
  005c24  d081                 add.l     d1, d0
  005c26  3f00                 move.w    d0, -(a7)
  005c28  a8a7                 _SetRect  
  005c2a  486efff8             pea.l     -$8(a6)
  005c2e  4eb9000000f0         jsr       $f0.l   ; SATBACKCHANGED
  005c34  48780021             pea.l     $21.w
  005c38  a862                 _ForeColor 
  005c3a  4878001e             pea.l     $1e.w
  005c3e  a863                 _BackColor 
  005c40  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005c46  1f3c0001             move.b    #$1, -(a7)
  005c4a  4eb900000108         jsr       $108.l   ; SATRUN
  005c50  4cdf0078             movem.l   (a7)+, d3-d6
  005c54  4e5e                 unlk      a6
  005c56  4e75                 rts       

;-------------------------------------------------------------
; GetBitDepth   (seg 2 +005c6a, 30 bytes)
  005c6a  4e56fffe             link.w    a6, #$fffe
  005c6e  206e0008             movea.l   $8(a6), a0
  005c72  2050                 movea.l   (a0), a0
  005c74  20680016             movea.l   $16(a0), a0
  005c78  2050                 movea.l   (a0), a0
  005c7a  3d680020fffe         move.w    $20(a0), -$2(a6)
  005c80  302efffe             move.w    -$2(a6), d0
  005c84  4e5e                 unlk      a6
  005c86  4e75                 rts       

;-------------------------------------------------------------
; FatalError   (seg 2 +005c96, 104 bytes)
  005c96  4e56ff00             link.w    a6, #$ff00
  005c9a  2f03                 move.l    d3, -(a7)
  005c9c  362e0008             move.w    $8(a6), d3
  005ca0  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  005ca6  6708                 beq.b     $5cb0
  005ca8  61fffffff672         bsr.l     $531c   ; FinalGammaFadeIn
  005cae  6006                 bra.b     $5cb6
  005cb0  61fffffff72e         bsr.l     $53e0   ; FinalGammaRestore
  005cb6  4eb900000298         jsr       $298.l   ; DisposeGammaTools
  005cbc  3f3c000a             move.w    #$a, -(a7)
  005cc0  a9c8                 _SysBeep  
  005cc2  486eff00             pea.l     -$100(a6)
  005cc6  3f3c0190             move.w    #$190, -(a7)
  005cca  3f03                 move.w    d3, -(a7)
  005ccc  4eb900000408         jsr       $408.l   ; seg4+a50
  005cd2  6002                 bra.b     $5cd6
  005cd4  a9f4                 _ExitToShell 
  005cd6  486eff00             pea.l     -$100(a6)
  005cda  42a7                 clr.l     -(a7)
  005cdc  42a7                 clr.l     -(a7)
  005cde  42a7                 clr.l     -(a7)
  005ce0  a98b                 _ParamText 
  005ce2  554f                 subq.w    #$2, a7
  005ce4  3f3c01f4             move.w    #$1f4, -(a7)
  005ce8  42a7                 clr.l     -(a7)
  005cea  a986                 _StopAlert 
  005cec  301f                 move.w    (a7)+, d0
  005cee  3600                 move.w    d0, d3
  005cf0  4eb900000040         jsr       $40.l   ; SATSOUNDSHUTUP
  005cf6  a9f4                 _ExitToShell 
  005cf8  261f                 move.l    (a7)+, d3
  005cfa  4e5e                 unlk      a6
  005cfc  4e75                 rts       

;-------------------------------------------------------------
; InitDepthSwitch   (seg 2 +005d0c, 34 bytes)
  005d0c  4e56fffc             link.w    a6, #$fffc
  005d10  594f                 subq.w    #$4, a7
  005d12  aa32                 _GetGDevice 
  005d14  205f                 movea.l   (a7)+, a0
  005d16  2d48fffc             move.l    a0, -$4(a6)
  005d1a  2f2efffc             move.l    -$4(a6), -(a7)
  005d1e  61ffffffff4a         bsr.l     $5c6a   ; GetBitDepth
  005d24  33c0000045f4         move.w    d0, $45f4.l   ; g_45f4
  005d2a  4e5e                 unlk      a6
  005d2c  4e75                 rts       

;-------------------------------------------------------------
; SwitchTo8BitColor   (seg 2 +005d40, 114 bytes)
  005d40  4e560000             link.w    a6, #$0
  005d44  48e71e20             movem.l   d3-d6/a2, -(a7)
  005d48  594f                 subq.w    #$4, a7
  005d4a  aa32                 _GetGDevice 
  005d4c  205f                 movea.l   (a7)+, a0
  005d4e  2448                 movea.l   a0, a2
  005d50  2f0a                 move.l    a2, -(a7)
  005d52  61ffffffff16         bsr.l     $5c6a   ; GetBitDepth
  005d58  3600                 move.w    d0, d3
  005d5a  0c430008             cmpi.w    #$8, d3
  005d5e  584f                 addq.w    #$4, a7
  005d60  6748                 beq.b     $5daa
  005d62  7801                 moveq     #$1, d4
  005d64  7a01                 moveq     #$1, d5
  005d66  7608                 moveq     #$8, d3
  005d68  554f                 subq.w    #$2, a7
  005d6a  2f0a                 move.l    a2, -(a7)
  005d6c  3f03                 move.w    d3, -(a7)
  005d6e  3f04                 move.w    d4, -(a7)
  005d70  3f05                 move.w    d5, -(a7)
  005d72  303c0a14             move.w    #$a14, d0
  005d76  aaa2                 _PaletteDispatch 
  005d78  301f                 move.w    (a7)+, d0
  005d7a  3c00                 move.w    d0, d6
  005d7c  4a46                 tst.w     d6
  005d7e  6716                 beq.b     $5d96
  005d80  554f                 subq.w    #$2, a7
  005d82  2f0a                 move.l    a2, -(a7)
  005d84  3f03                 move.w    d3, -(a7)
  005d86  3f04                 move.w    d4, -(a7)
  005d88  3f05                 move.w    d5, -(a7)
  005d8a  303c0a13             move.w    #$a13, d0
  005d8e  aaa2                 _PaletteDispatch 
  005d90  301f                 move.w    (a7)+, d0
  005d92  3c00                 move.w    d0, d6
  005d94  6014                 bra.b     $5daa
  005d96  3f3c0002             move.w    #$2, -(a7)
  005d9a  61fffffffefa         bsr.l     $5c96   ; FatalError
  005da0  4eb900000040         jsr       $40.l   ; SATSOUNDSHUTUP
  005da6  a9f4                 _ExitToShell 
  005da8  544f                 addq.w    #$2, a7
  005daa  4cdf0478             movem.l   (a7)+, d3-d6/a2
  005dae  4e5e                 unlk      a6
  005db0  4e75                 rts       

;-------------------------------------------------------------
; SwitchToOldDepth   (seg 2 +005dc6, 88 bytes)
  005dc6  4e560000             link.w    a6, #$0
  005dca  48e71e20             movem.l   d3-d6/a2, -(a7)
  005dce  0c790008000045f4     cmpi.w    #$8, $45f4.l   ; g_45f4
  005dd6  673e                 beq.b     $5e16
  005dd8  594f                 subq.w    #$4, a7
  005dda  aa32                 _GetGDevice 
  005ddc  205f                 movea.l   (a7)+, a0
  005dde  2448                 movea.l   a0, a2
  005de0  7801                 moveq     #$1, d4
  005de2  7a01                 moveq     #$1, d5
  005de4  3639000045f4         move.w    $45f4.l, d3   ; g_45f4
  005dea  554f                 subq.w    #$2, a7
  005dec  2f0a                 move.l    a2, -(a7)
  005dee  3f03                 move.w    d3, -(a7)
  005df0  3f04                 move.w    d4, -(a7)
  005df2  3f05                 move.w    d5, -(a7)
  005df4  303c0a14             move.w    #$a14, d0
  005df8  aaa2                 _PaletteDispatch 
  005dfa  301f                 move.w    (a7)+, d0
  005dfc  3c00                 move.w    d0, d6
  005dfe  4a46                 tst.w     d6
  005e00  6714                 beq.b     $5e16
  005e02  554f                 subq.w    #$2, a7
  005e04  2f0a                 move.l    a2, -(a7)
  005e06  3f03                 move.w    d3, -(a7)
  005e08  3f04                 move.w    d4, -(a7)
  005e0a  3f05                 move.w    d5, -(a7)
  005e0c  303c0a13             move.w    #$a13, d0
  005e10  aaa2                 _PaletteDispatch 
  005e12  301f                 move.w    (a7)+, d0
  005e14  3c00                 move.w    d0, d6
  005e16  4cdf0478             movem.l   (a7)+, d3-d6/a2
  005e1a  4e5e                 unlk      a6
  005e1c  4e75                 rts       

;-------------------------------------------------------------
; InitCursorUtils   (seg 2 +005e32, 56 bytes)
  005e32  4e560000             link.w    a6, #$0
  005e36  594f                 subq.w    #$4, a7
  005e38  3f3c0004             move.w    #$4, -(a7)
  005e3c  a9b9                 _GetCursor 
  005e3e  205f                 movea.l   (a7)+, a0
  005e40  23c8000072d0         move.l    a0, $72d0.l   ; g_72d0
  005e46  2079000072d0         movea.l   $72d0.l, a0   ; g_72d0
  005e4c  a029                 _HLock    
  005e4e  594f                 subq.w    #$4, a7
  005e50  3f3c0002             move.w    #$2, -(a7)
  005e54  a9b9                 _GetCursor 
  005e56  205f                 movea.l   (a7)+, a0
  005e58  23c8000072d4         move.l    a0, $72d4.l   ; g_72d4
  005e5e  2079000072d4         movea.l   $72d4.l, a0   ; g_72d4
  005e64  a029                 _HLock    
  005e66  4e5e                 unlk      a6
  005e68  4e75                 rts       

;-------------------------------------------------------------
; ShowCursorSafe   (seg 2 +005e7c, 26 bytes)
  005e7c  4e560000             link.w    a6, #$0
  005e80  4a39000045f6         tst.b     $45f6.l   ; g_45f6
  005e86  660a                 bne.b     $5e92
  005e88  a853                 _ShowCursor 
  005e8a  13fc0001000045f6     move.b    #$1, $45f6.l   ; g_45f6
  005e92  4e5e                 unlk      a6
  005e94  4e75                 rts       

;-------------------------------------------------------------
; HideCursorSafe   (seg 2 +005ea8, 30 bytes)
  005ea8  4e560000             link.w    a6, #$0
  005eac  4a39000045f6         tst.b     $45f6.l   ; g_45f6
  005eb2  670e                 beq.b     $5ec2
  005eb4  61ff00000022         bsr.l     $5ed8   ; ResetCursor
  005eba  a852                 _HideCursor 
  005ebc  4239000045f6         clr.b     $45f6.l   ; g_45f6
  005ec2  4e5e                 unlk      a6
  005ec4  4e75                 rts       

;-------------------------------------------------------------
; ResetCursor   (seg 2 +005ed8, 46 bytes)
  005ed8  4e560000             link.w    a6, #$0
  005edc  4a39000045f6         tst.b     $45f6.l   ; g_45f6
  005ee2  671e                 beq.b     $5f02
  005ee4  4ab9000072d0         tst.l     $72d0.l   ; g_72d0
  005eea  6714                 beq.b     $5f00
  005eec  2079000072d0         movea.l   $72d0.l, a0   ; g_72d0
  005ef2  4a90                 tst.l     (a0)
  005ef4  670a                 beq.b     $5f00
  005ef6  2079000072d0         movea.l   $72d0.l, a0   ; g_72d0
  005efc  2f10                 move.l    (a0), -(a7)
  005efe  a851                 _SetCursor 
  005f00  a850                 _InitCursor 
  005f02  4e5e                 unlk      a6
  005f04  4e75                 rts       

;-------------------------------------------------------------
; SetWatchCursor   (seg 2 +005f14, 44 bytes)
  005f14  4e560000             link.w    a6, #$0
  005f18  4a39000045f6         tst.b     $45f6.l   ; g_45f6
  005f1e  671c                 beq.b     $5f3c
  005f20  4ab9000072d0         tst.l     $72d0.l   ; g_72d0
  005f26  6714                 beq.b     $5f3c
  005f28  2079000072d0         movea.l   $72d0.l, a0   ; g_72d0
  005f2e  4a90                 tst.l     (a0)
  005f30  670a                 beq.b     $5f3c
  005f32  2079000072d0         movea.l   $72d0.l, a0   ; g_72d0
  005f38  2f10                 move.l    (a0), -(a7)
  005f3a  a851                 _SetCursor 
  005f3c  4e5e                 unlk      a6
  005f3e  4e75                 rts       

;-------------------------------------------------------------
; CleanUpCursors   (seg 2 +005f52, 8 bytes)
  005f52  4e560000             link.w    a6, #$0
  005f56  4e5e                 unlk      a6
  005f58  4e75                 rts       

;-------------------------------------------------------------
; ShowMenuBar   (seg 2 +005f6c, 34 bytes)
  005f6c  4e560000             link.w    a6, #$0
  005f70  4a3900007f1c         tst.b     $7f1c.l   ; g_7f1c
  005f76  6712                 beq.b     $5f8a
  005f78  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  005f7e  4eb900000130         jsr       $130.l   ; SATSHOWMBAR
  005f84  423900007f1c         clr.b     $7f1c.l   ; g_7f1c
  005f8a  4e5e                 unlk      a6
  005f8c  4e75                 rts       

;-------------------------------------------------------------
; HideMenuBar   (seg 2 +005f9c, 42 bytes)
  005f9c  4e560000             link.w    a6, #$0
  005fa0  4a3900007f1c         tst.b     $7f1c.l   ; g_7f1c
  005fa6  661a                 bne.b     $5fc2
  005fa8  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  005fae  4eb900000138         jsr       $138.l   ; SATHIDEMBAR
  005fb4  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  005fba  13fc000100007f1c     move.b    #$1, $7f1c.l   ; g_7f1c
  005fc2  4e5e                 unlk      a6
  005fc4  4e75                 rts       

;-------------------------------------------------------------
; IsOptionPressed   (seg 2 +005fd4, 28 bytes)
  005fd4  4e56fff0             link.w    a6, #$fff0
  005fd8  486efff0             pea.l     -$10(a6)
  005fdc  a976                 _GetKeys  
  005fde  7004                 moveq     #$4, d0
  005fe0  c0aefff4             and.l     -$c(a6), d0
  005fe4  4a80                 tst.l     d0
  005fe6  56c0                 sne.b     d0
  005fe8  4400                 neg.b     d0
  005fea  49c0                 extb.l    d0
  005fec  4e5e                 unlk      a6
  005fee  4e75                 rts       

;-------------------------------------------------------------
; IsPressed   (seg 2 +006002, 52 bytes)
  006002  4e56ffec             link.w    a6, #$ffec
  006006  486efff0             pea.l     -$10(a6)
  00600a  a976                 _GetKeys  
  00600c  7001                 moveq     #$1, d0
  00600e  322e0008             move.w    $8(a6), d1
  006012  7407                 moveq     #$7, d2
  006014  c282                 and.l     d2, d1
  006016  7400                 moveq     #$0, d2
  006018  342e0008             move.w    $8(a6), d2
  00601c  e682                 asr.l     #$3, d2
  00601e  41eefff0             lea.l     -$10(a6), a0
  006022  2d40ffec             move.l    d0, -$14(a6)
  006026  7000                 moveq     #$0, d0
  006028  10302800             move.b    (a0, d2.l), d0
  00602c  e2a0                 asr.l     d1, d0
  00602e  c0aeffec             and.l     -$14(a6), d0
  006032  4e5e                 unlk      a6
  006034  4e75                 rts       

;-------------------------------------------------------------
; EasyExplosion   (seg 2 +006042, 72 bytes)
  006042  4e560000             link.w    a6, #$0
  006046  2f0a                 move.l    a2, -(a7)
  006048  95ca                 suba.l    a2, a2
  00604a  594f                 subq.w    #$4, a7
  00604c  3f2e0010             move.w    $10(a6), -(a7)
  006050  3f2e0008             move.w    $8(a6), -(a7)
  006054  3f2e000a             move.w    $a(a6), -(a7)
  006058  4879000006b8         pea.l     $6b8.l   ; SETUPEFFECTSPRITE
  00605e  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  006064  205f                 movea.l   (a7)+, a0
  006066  2448                 movea.l   a0, a2
  006068  200a                 move.l    a2, d0
  00606a  6716                 beq.b     $6082
  00606c  356e000c0050         move.w    $c(a6), $50(a2)
  006072  356e000e004e         move.w    $e(a6), $4e(a2)
  006078  356e00120066         move.w    $12(a6), $66(a2)
  00607e  34ae0010             move.w    $10(a6), (a2)
  006082  204a                 movea.l   a2, a0
  006084  245f                 movea.l   (a7)+, a2
  006086  4e5e                 unlk      a6
  006088  4e75                 rts       

;-------------------------------------------------------------
; WallBounce   (seg 2 +00609a, 4006 bytes)
  00609a  4e56ffd2             link.w    a6, #$ffd2
  00609e  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0060a2  246e0008             movea.l   $8(a6), a2
  0060a6  3e2e000c             move.w    $c(a6), d7
  0060aa  266e000e             movea.l   $e(a6), a3
  0060ae  362e0014             move.w    $14(a6), d3
  0060b2  286e0016             movea.l   $16(a6), a4
  0060b6  7c00                 moveq     #$0, d6
  0060b8  7803                 moveq     #$3, d4
  0060ba  3a07                 move.w    d7, d5
  0060bc  4a47                 tst.w     d7
  0060be  6d06                 blt.b     $60c6
  0060c0  0c470038             cmpi.w    #$38, d7
  0060c4  6d04                 blt.b     $60ca
  0060c6  60000f70             bra.w     $7038
  0060ca  486effea             pea.l     -$16(a6)
  0060ce  302a005c             move.w    $5c(a2), d0
  0060d2  48c0                 ext.l     d0
  0060d4  322c0002             move.w    $2(a4), d1
  0060d8  48c1                 ext.l     d1
  0060da  d280                 add.l     d0, d1
  0060dc  3f01                 move.w    d1, -(a7)
  0060de  302a005a             move.w    $5a(a2), d0
  0060e2  48c0                 ext.l     d0
  0060e4  3214                 move.w    (a4), d1
  0060e6  48c1                 ext.l     d1
  0060e8  d280                 add.l     d0, d1
  0060ea  3f01                 move.w    d1, -(a7)
  0060ec  302a005c             move.w    $5c(a2), d0
  0060f0  48c0                 ext.l     d0
  0060f2  322c0006             move.w    $6(a4), d1
  0060f6  48c1                 ext.l     d1
  0060f8  d280                 add.l     d0, d1
  0060fa  3f01                 move.w    d1, -(a7)
  0060fc  302a005a             move.w    $5a(a2), d0
  006100  48c0                 ext.l     d0
  006102  322c0004             move.w    $4(a4), d1
  006106  48c1                 ext.l     d1
  006108  d280                 add.l     d0, d1
  00610a  3f01                 move.w    d1, -(a7)
  00610c  a8a7                 _SetRect  
  00610e  486effe2             pea.l     -$1e(a6)
  006112  7014                 moveq     #$14, d0
  006114  c1c7                 muls.w    d7, d0
  006116  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  00611c  30300806             move.w    $6(a0, d0.l), d0
  006120  48c0                 ext.l     d0
  006122  322b0002             move.w    $2(a3), d1
  006126  48c1                 ext.l     d1
  006128  d280                 add.l     d0, d1
  00612a  3f01                 move.w    d1, -(a7)
  00612c  7014                 moveq     #$14, d0
  00612e  c1c7                 muls.w    d7, d0
  006130  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  006136  30300804             move.w    $4(a0, d0.l), d0
  00613a  48c0                 ext.l     d0
  00613c  3213                 move.w    (a3), d1
  00613e  48c1                 ext.l     d1
  006140  d280                 add.l     d0, d1
  006142  3f01                 move.w    d1, -(a7)
  006144  7014                 moveq     #$14, d0
  006146  c1c7                 muls.w    d7, d0
  006148  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  00614e  3030080a             move.w    $a(a0, d0.l), d0
  006152  48c0                 ext.l     d0
  006154  322b0002             move.w    $2(a3), d1
  006158  48c1                 ext.l     d1
  00615a  d280                 add.l     d0, d1
  00615c  3f01                 move.w    d1, -(a7)
  00615e  7014                 moveq     #$14, d0
  006160  c1c7                 muls.w    d7, d0
  006162  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  006168  30300808             move.w    $8(a0, d0.l), d0
  00616c  48c0                 ext.l     d0
  00616e  3213                 move.w    (a3), d1
  006170  48c1                 ext.l     d1
  006172  d280                 add.l     d0, d1
  006174  3f01                 move.w    d1, -(a7)
  006176  a8a7                 _SetRect  
  006178  302b0002             move.w    $2(a3), d0
  00617c  48c0                 ext.l     d0
  00617e  7210                 moveq     #$10, d1
  006180  d081                 add.l     d1, d0
  006182  3d40fff6             move.w    d0, -$a(a6)
  006186  3013                 move.w    (a3), d0
  006188  48c0                 ext.l     d0
  00618a  7210                 moveq     #$10, d1
  00618c  d081                 add.l     d1, d0
  00618e  3d40fff4             move.w    d0, -$c(a6)
  006192  302e0012             move.w    $12(a6), d0
  006196  48c0                 ext.l     d0
  006198  322a005c             move.w    $5c(a2), d1
  00619c  48c1                 ext.l     d1
  00619e  d280                 add.l     d0, d1
  0061a0  3d41fffe             move.w    d1, -$2(a6)
  0061a4  302e0012             move.w    $12(a6), d0
  0061a8  48c0                 ext.l     d0
  0061aa  322a005a             move.w    $5a(a2), d1
  0061ae  48c1                 ext.l     d1
  0061b0  d280                 add.l     d0, d1
  0061b2  3d41fffc             move.w    d1, -$4(a6)
  0061b6  3007                 move.w    d7, d0
  0061b8  48c0                 ext.l     d0
  0061ba  0c800000000b         cmpi.l    #$b, d0
  0061c0  62000b96             bhi.w     $6d58
  0061c4  303b0206             move.w    $61cc(pc, d0.w * 2), d0
  0061c8  4efb0002             jmp       $61cc(pc, d0.w)
  0061cc  0018005a009200ce010802120306040e cases     0:$61e4 1:$6226 2:$625e 3:$629a 4:$62d4 5:$63de 6:$64d2 7:$65da
  0061dc  084609de052006be     cases     8:$6a12 9:$6baa 10:$66ec 11:$688a
  0061e4  4a6a0050             tst.w     $50(a2)
  0061e8  6c20                 bge.b     $620a
  0061ea  4a2e001e             tst.b     $1e(a6)
  0061ee  671a                 beq.b     $620a
  0061f0  302a0050             move.w    $50(a2), d0
  0061f4  c1c3                 muls.w    d3, d0
  0061f6  e080                 asr.l     #$8, d0
  0061f8  4480                 neg.l     d0
  0061fa  35400050             move.w    d0, $50(a2)
  0061fe  302a004e             move.w    $4e(a2), d0
  006202  c1c3                 muls.w    d3, d0
  006204  e080                 asr.l     #$8, d0
  006206  3540004e             move.w    d0, $4e(a2)
  00620a  302c0002             move.w    $2(a4), d0
  00620e  48c0                 ext.l     d0
  006210  322b0002             move.w    $2(a3), d1
  006214  48c1                 ext.l     d1
  006216  7410                 moveq     #$10, d2
  006218  d282                 add.l     d2, d1
  00621a  9280                 sub.l     d0, d1
  00621c  3541005c             move.w    d1, $5c(a2)
  006220  7c01                 moveq     #$1, d6
  006222  60000df6             bra.w     $701a
  006226  4a6a004e             tst.w     $4e(a2)
  00622a  6c1a                 bge.b     $6246
  00622c  302a0050             move.w    $50(a2), d0
  006230  c1c3                 muls.w    d3, d0
  006232  e080                 asr.l     #$8, d0
  006234  35400050             move.w    d0, $50(a2)
  006238  302a004e             move.w    $4e(a2), d0
  00623c  c1c3                 muls.w    d3, d0
  00623e  e080                 asr.l     #$8, d0
  006240  4480                 neg.l     d0
  006242  3540004e             move.w    d0, $4e(a2)
  006246  3014                 move.w    (a4), d0
  006248  48c0                 ext.l     d0
  00624a  3213                 move.w    (a3), d1
  00624c  48c1                 ext.l     d1
  00624e  7410                 moveq     #$10, d2
  006250  d282                 add.l     d2, d1
  006252  9280                 sub.l     d0, d1
  006254  3541005a             move.w    d1, $5a(a2)
  006258  7c01                 moveq     #$1, d6
  00625a  60000dbe             bra.w     $701a
  00625e  4a6a0050             tst.w     $50(a2)
  006262  6f1a                 ble.b     $627e
  006264  302a0050             move.w    $50(a2), d0
  006268  c1c3                 muls.w    d3, d0
  00626a  e080                 asr.l     #$8, d0
  00626c  4480                 neg.l     d0
  00626e  35400050             move.w    d0, $50(a2)
  006272  302a004e             move.w    $4e(a2), d0
  006276  c1c3                 muls.w    d3, d0
  006278  e080                 asr.l     #$8, d0
  00627a  3540004e             move.w    d0, $4e(a2)
  00627e  302c0006             move.w    $6(a4), d0
  006282  48c0                 ext.l     d0
  006284  322b0002             move.w    $2(a3), d1
  006288  48c1                 ext.l     d1
  00628a  7410                 moveq     #$10, d2
  00628c  d282                 add.l     d2, d1
  00628e  9280                 sub.l     d0, d1
  006290  3541005c             move.w    d1, $5c(a2)
  006294  7c01                 moveq     #$1, d6
  006296  60000d82             bra.w     $701a
  00629a  4a6a004e             tst.w     $4e(a2)
  00629e  6f1a                 ble.b     $62ba
  0062a0  302a0050             move.w    $50(a2), d0
  0062a4  c1c3                 muls.w    d3, d0
  0062a6  e080                 asr.l     #$8, d0
  0062a8  35400050             move.w    d0, $50(a2)
  0062ac  302a004e             move.w    $4e(a2), d0
  0062b0  c1c3                 muls.w    d3, d0
  0062b2  e080                 asr.l     #$8, d0
  0062b4  4480                 neg.l     d0
  0062b6  3540004e             move.w    d0, $4e(a2)
  0062ba  302c0004             move.w    $4(a4), d0
  0062be  48c0                 ext.l     d0
  0062c0  3213                 move.w    (a3), d1
  0062c2  48c1                 ext.l     d1
  0062c4  7410                 moveq     #$10, d2
  0062c6  d282                 add.l     d2, d1
  0062c8  9280                 sub.l     d0, d1
  0062ca  3541005a             move.w    d1, $5a(a2)
  0062ce  7c01                 moveq     #$1, d6
  0062d0  60000d48             bra.w     $701a
  0062d4  554f                 subq.w    #$2, a7
  0062d6  2f0a                 move.l    a2, -(a7)
  0062d8  2f13                 move.l    (a3), -(a7)
  0062da  3f3c0028             move.w    #$28, -(a7)
  0062de  2f2e001a             move.l    $1a(a6), -(a7)
  0062e2  702e                 moveq     #$2e, d0
  0062e4  c1c7                 muls.w    d7, d0
  0062e6  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0062ec  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0062f0  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0062f6  101f                 move.b    (a7)+, d0
  0062f8  1d40fff3             move.b    d0, -$d(a6)
  0062fc  4a2efff3             tst.b     -$d(a6)
  006300  67000d36             beq.w     $7038
  006304  7c01                 moveq     #$1, d6
  006306  356a0004005c         move.w    $4(a2), $5c(a2)
  00630c  356a0002005a         move.w    $2(a2), $5a(a2)
  006312  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  006318  3013                 move.w    (a3), d0
  00631a  48c0                 ext.l     d0
  00631c  7220                 moveq     #$20, d1
  00631e  d081                 add.l     d1, d0
  006320  3d40fff8             move.w    d0, -$8(a6)
  006324  302efffa             move.w    -$6(a6), d0
  006328  48c0                 ext.l     d0
  00632a  382efffe             move.w    -$2(a6), d4
  00632e  48c4                 ext.l     d4
  006330  9880                 sub.l     d0, d4
  006332  302efffc             move.w    -$4(a6), d0
  006336  48c0                 ext.l     d0
  006338  3a2efff8             move.w    -$8(a6), d5
  00633c  48c5                 ext.l     d5
  00633e  9a80                 sub.l     d0, d5
  006340  b845                 cmp.w     d5, d4
  006342  6f4c                 ble.b     $6390
  006344  0c450008             cmpi.w    #$8, d5
  006348  6f0e                 ble.b     $6358
  00634a  4a6a0050             tst.w     $50(a2)
  00634e  6c08                 bge.b     $6358
  006350  7803                 moveq     #$3, d4
  006352  7a0c                 moveq     #$c, d5
  006354  60000c1a             bra.w     $6f70
  006358  4a6a0050             tst.w     $50(a2)
  00635c  6c1a                 bge.b     $6378
  00635e  302a0050             move.w    $50(a2), d0
  006362  c1c3                 muls.w    d3, d0
  006364  e080                 asr.l     #$8, d0
  006366  4480                 neg.l     d0
  006368  35400050             move.w    d0, $50(a2)
  00636c  302a004e             move.w    $4e(a2), d0
  006370  c1c3                 muls.w    d3, d0
  006372  e080                 asr.l     #$8, d0
  006374  3540004e             move.w    d0, $4e(a2)
  006378  302c0002             move.w    $2(a4), d0
  00637c  48c0                 ext.l     d0
  00637e  322b0002             move.w    $2(a3), d1
  006382  48c1                 ext.l     d1
  006384  7410                 moveq     #$10, d2
  006386  d282                 add.l     d2, d1
  006388  9280                 sub.l     d0, d1
  00638a  3541005c             move.w    d1, $5c(a2)
  00638e  6048                 bra.b     $63d8
  006390  0c440008             cmpi.w    #$8, d4
  006394  6f0e                 ble.b     $63a4
  006396  4a6a004e             tst.w     $4e(a2)
  00639a  6f08                 ble.b     $63a4
  00639c  7803                 moveq     #$3, d4
  00639e  7a0c                 moveq     #$c, d5
  0063a0  60000bce             bra.w     $6f70
  0063a4  4a6a004e             tst.w     $4e(a2)
  0063a8  6f1a                 ble.b     $63c4
  0063aa  302a0050             move.w    $50(a2), d0
  0063ae  c1c3                 muls.w    d3, d0
  0063b0  e080                 asr.l     #$8, d0
  0063b2  35400050             move.w    d0, $50(a2)
  0063b6  302a004e             move.w    $4e(a2), d0
  0063ba  c1c3                 muls.w    d3, d0
  0063bc  e080                 asr.l     #$8, d0
  0063be  4480                 neg.l     d0
  0063c0  3540004e             move.w    d0, $4e(a2)
  0063c4  302c0004             move.w    $4(a4), d0
  0063c8  48c0                 ext.l     d0
  0063ca  3213                 move.w    (a3), d1
  0063cc  48c1                 ext.l     d1
  0063ce  7410                 moveq     #$10, d2
  0063d0  d282                 add.l     d2, d1
  0063d2  9280                 sub.l     d0, d1
  0063d4  3541005a             move.w    d1, $5a(a2)
  0063d8  7c01                 moveq     #$1, d6
  0063da  60000c3e             bra.w     $701a
  0063de  554f                 subq.w    #$2, a7
  0063e0  2f0a                 move.l    a2, -(a7)
  0063e2  2f13                 move.l    (a3), -(a7)
  0063e4  3f3c0028             move.w    #$28, -(a7)
  0063e8  2f2e001a             move.l    $1a(a6), -(a7)
  0063ec  702e                 moveq     #$2e, d0
  0063ee  c1c7                 muls.w    d7, d0
  0063f0  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0063f6  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0063fa  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  006400  101f                 move.b    (a7)+, d0
  006402  1d40fff3             move.b    d0, -$d(a6)
  006406  4a2efff3             tst.b     -$d(a6)
  00640a  67000c2c             beq.w     $7038
  00640e  7c01                 moveq     #$1, d6
  006410  356a0004005c         move.w    $4(a2), $5c(a2)
  006416  356a0002005a         move.w    $2(a2), $5a(a2)
  00641c  302b0002             move.w    $2(a3), d0
  006420  48c0                 ext.l     d0
  006422  382efffe             move.w    -$2(a6), d4
  006426  48c4                 ext.l     d4
  006428  9880                 sub.l     d0, d4
  00642a  3013                 move.w    (a3), d0
  00642c  48c0                 ext.l     d0
  00642e  3a2efffc             move.w    -$4(a6), d5
  006432  48c5                 ext.l     d5
  006434  9a80                 sub.l     d0, d5
  006436  b845                 cmp.w     d5, d4
  006438  6f4c                 ble.b     $6486
  00643a  0c450008             cmpi.w    #$8, d5
  00643e  6f0e                 ble.b     $644e
  006440  4a6a0050             tst.w     $50(a2)
  006444  6c08                 bge.b     $644e
  006446  7803                 moveq     #$3, d4
  006448  7a0d                 moveq     #$d, d5
  00644a  60000b24             bra.w     $6f70
  00644e  4a6a0050             tst.w     $50(a2)
  006452  6c1a                 bge.b     $646e
  006454  302a0050             move.w    $50(a2), d0
  006458  c1c3                 muls.w    d3, d0
  00645a  e080                 asr.l     #$8, d0
  00645c  4480                 neg.l     d0
  00645e  35400050             move.w    d0, $50(a2)
  006462  302a004e             move.w    $4e(a2), d0
  006466  c1c3                 muls.w    d3, d0
  006468  e080                 asr.l     #$8, d0
  00646a  3540004e             move.w    d0, $4e(a2)
  00646e  302c0002             move.w    $2(a4), d0
  006472  48c0                 ext.l     d0
  006474  322b0002             move.w    $2(a3), d1
  006478  48c1                 ext.l     d1
  00647a  7410                 moveq     #$10, d2
  00647c  d282                 add.l     d2, d1
  00647e  9280                 sub.l     d0, d1
  006480  3541005c             move.w    d1, $5c(a2)
  006484  6046                 bra.b     $64cc
  006486  0c440008             cmpi.w    #$8, d4
  00648a  6f0e                 ble.b     $649a
  00648c  4a6a004e             tst.w     $4e(a2)
  006490  6c08                 bge.b     $649a
  006492  7803                 moveq     #$3, d4
  006494  7a0d                 moveq     #$d, d5
  006496  60000ad8             bra.w     $6f70
  00649a  4a6a004e             tst.w     $4e(a2)
  00649e  6c1a                 bge.b     $64ba
  0064a0  302a0050             move.w    $50(a2), d0
  0064a4  c1c3                 muls.w    d3, d0
  0064a6  e080                 asr.l     #$8, d0
  0064a8  35400050             move.w    d0, $50(a2)
  0064ac  302a004e             move.w    $4e(a2), d0
  0064b0  c1c3                 muls.w    d3, d0
  0064b2  e080                 asr.l     #$8, d0
  0064b4  4480                 neg.l     d0
  0064b6  3540004e             move.w    d0, $4e(a2)
  0064ba  3014                 move.w    (a4), d0
  0064bc  48c0                 ext.l     d0
  0064be  3213                 move.w    (a3), d1
  0064c0  48c1                 ext.l     d1
  0064c2  7410                 moveq     #$10, d2
  0064c4  d282                 add.l     d2, d1
  0064c6  9280                 sub.l     d0, d1
  0064c8  3541005a             move.w    d1, $5a(a2)
  0064cc  7c01                 moveq     #$1, d6
  0064ce  60000b4a             bra.w     $701a
  0064d2  554f                 subq.w    #$2, a7
  0064d4  2f0a                 move.l    a2, -(a7)
  0064d6  2f13                 move.l    (a3), -(a7)
  0064d8  3f3c0028             move.w    #$28, -(a7)
  0064dc  2f2e001a             move.l    $1a(a6), -(a7)
  0064e0  702e                 moveq     #$2e, d0
  0064e2  c1c7                 muls.w    d7, d0
  0064e4  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0064ea  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0064ee  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0064f4  101f                 move.b    (a7)+, d0
  0064f6  1d40fff3             move.b    d0, -$d(a6)
  0064fa  4a2efff3             tst.b     -$d(a6)
  0064fe  67000b38             beq.w     $7038
  006502  7c01                 moveq     #$1, d6
  006504  356a0004005c         move.w    $4(a2), $5c(a2)
  00650a  356a0002005a         move.w    $2(a2), $5a(a2)
  006510  302b0002             move.w    $2(a3), d0
  006514  48c0                 ext.l     d0
  006516  7220                 moveq     #$20, d1
  006518  d081                 add.l     d1, d0
  00651a  3d40fffa             move.w    d0, -$6(a6)
  00651e  3d53fff8             move.w    (a3), -$8(a6)
  006522  302efffe             move.w    -$2(a6), d0
  006526  48c0                 ext.l     d0
  006528  382efffa             move.w    -$6(a6), d4
  00652c  48c4                 ext.l     d4
  00652e  9880                 sub.l     d0, d4
  006530  302efff8             move.w    -$8(a6), d0
  006534  48c0                 ext.l     d0
  006536  3a2efffc             move.w    -$4(a6), d5
  00653a  48c5                 ext.l     d5
  00653c  9a80                 sub.l     d0, d5
  00653e  b845                 cmp.w     d5, d4
  006540  6f4c                 ble.b     $658e
  006542  0c450008             cmpi.w    #$8, d5
  006546  6f0e                 ble.b     $6556
  006548  4a6a0050             tst.w     $50(a2)
  00654c  6f08                 ble.b     $6556
  00654e  7803                 moveq     #$3, d4
  006550  7a0e                 moveq     #$e, d5
  006552  60000a1c             bra.w     $6f70
  006556  4a6a0050             tst.w     $50(a2)
  00655a  6f1a                 ble.b     $6576
  00655c  302a0050             move.w    $50(a2), d0
  006560  c1c3                 muls.w    d3, d0
  006562  e080                 asr.l     #$8, d0
  006564  4480                 neg.l     d0
  006566  35400050             move.w    d0, $50(a2)
  00656a  302a004e             move.w    $4e(a2), d0
  00656e  c1c3                 muls.w    d3, d0
  006570  e080                 asr.l     #$8, d0
  006572  3540004e             move.w    d0, $4e(a2)
  006576  302c0006             move.w    $6(a4), d0
  00657a  48c0                 ext.l     d0
  00657c  322b0002             move.w    $2(a3), d1
  006580  48c1                 ext.l     d1
  006582  7410                 moveq     #$10, d2
  006584  d282                 add.l     d2, d1
  006586  9280                 sub.l     d0, d1
  006588  3541005c             move.w    d1, $5c(a2)
  00658c  6046                 bra.b     $65d4
  00658e  0c440008             cmpi.w    #$8, d4
  006592  6f0e                 ble.b     $65a2
  006594  4a6a004e             tst.w     $4e(a2)
  006598  6c08                 bge.b     $65a2
  00659a  7803                 moveq     #$3, d4
  00659c  7a0e                 moveq     #$e, d5
  00659e  600009d0             bra.w     $6f70
  0065a2  4a6a004e             tst.w     $4e(a2)
  0065a6  6c1a                 bge.b     $65c2
  0065a8  302a0050             move.w    $50(a2), d0
  0065ac  c1c3                 muls.w    d3, d0
  0065ae  e080                 asr.l     #$8, d0
  0065b0  35400050             move.w    d0, $50(a2)
  0065b4  302a004e             move.w    $4e(a2), d0
  0065b8  c1c3                 muls.w    d3, d0
  0065ba  e080                 asr.l     #$8, d0
  0065bc  4480                 neg.l     d0
  0065be  3540004e             move.w    d0, $4e(a2)
  0065c2  3014                 move.w    (a4), d0
  0065c4  48c0                 ext.l     d0
  0065c6  3213                 move.w    (a3), d1
  0065c8  48c1                 ext.l     d1
  0065ca  7410                 moveq     #$10, d2
  0065cc  d282                 add.l     d2, d1
  0065ce  9280                 sub.l     d0, d1
  0065d0  3541005a             move.w    d1, $5a(a2)
  0065d4  7c01                 moveq     #$1, d6
  0065d6  60000a42             bra.w     $701a
  0065da  554f                 subq.w    #$2, a7
  0065dc  2f0a                 move.l    a2, -(a7)
  0065de  2f13                 move.l    (a3), -(a7)
  0065e0  3f3c0028             move.w    #$28, -(a7)
  0065e4  2f2e001a             move.l    $1a(a6), -(a7)
  0065e8  702e                 moveq     #$2e, d0
  0065ea  c1c7                 muls.w    d7, d0
  0065ec  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0065f2  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0065f6  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0065fc  101f                 move.b    (a7)+, d0
  0065fe  1d40fff3             move.b    d0, -$d(a6)
  006602  4a2efff3             tst.b     -$d(a6)
  006606  67000a30             beq.w     $7038
  00660a  7c01                 moveq     #$1, d6
  00660c  356a0004005c         move.w    $4(a2), $5c(a2)
  006612  356a0002005a         move.w    $2(a2), $5a(a2)
  006618  302b0002             move.w    $2(a3), d0
  00661c  48c0                 ext.l     d0
  00661e  7220                 moveq     #$20, d1
  006620  d081                 add.l     d1, d0
  006622  3d40fffa             move.w    d0, -$6(a6)
  006626  3013                 move.w    (a3), d0
  006628  48c0                 ext.l     d0
  00662a  7220                 moveq     #$20, d1
  00662c  d081                 add.l     d1, d0
  00662e  3d40fff8             move.w    d0, -$8(a6)
  006632  302efffe             move.w    -$2(a6), d0
  006636  48c0                 ext.l     d0
  006638  382efffa             move.w    -$6(a6), d4
  00663c  48c4                 ext.l     d4
  00663e  9880                 sub.l     d0, d4
  006640  302efffc             move.w    -$4(a6), d0
  006644  48c0                 ext.l     d0
  006646  3a2efff8             move.w    -$8(a6), d5
  00664a  48c5                 ext.l     d5
  00664c  9a80                 sub.l     d0, d5
  00664e  b845                 cmp.w     d5, d4
  006650  6f4c                 ble.b     $669e
  006652  0c450008             cmpi.w    #$8, d5
  006656  6f0e                 ble.b     $6666
  006658  4a6a0050             tst.w     $50(a2)
  00665c  6f08                 ble.b     $6666
  00665e  7803                 moveq     #$3, d4
  006660  7a0f                 moveq     #$f, d5
  006662  6000090c             bra.w     $6f70
  006666  4a6a0050             tst.w     $50(a2)
  00666a  6f1a                 ble.b     $6686
  00666c  302a0050             move.w    $50(a2), d0
  006670  c1c3                 muls.w    d3, d0
  006672  e080                 asr.l     #$8, d0
  006674  4480                 neg.l     d0
  006676  35400050             move.w    d0, $50(a2)
  00667a  302a004e             move.w    $4e(a2), d0
  00667e  c1c3                 muls.w    d3, d0
  006680  e080                 asr.l     #$8, d0
  006682  3540004e             move.w    d0, $4e(a2)
  006686  302c0006             move.w    $6(a4), d0
  00668a  48c0                 ext.l     d0
  00668c  322b0002             move.w    $2(a3), d1
  006690  48c1                 ext.l     d1
  006692  7410                 moveq     #$10, d2
  006694  d282                 add.l     d2, d1
  006696  9280                 sub.l     d0, d1
  006698  3541005c             move.w    d1, $5c(a2)
  00669c  6048                 bra.b     $66e6
  00669e  0c440008             cmpi.w    #$8, d4
  0066a2  6f0e                 ble.b     $66b2
  0066a4  4a6a004e             tst.w     $4e(a2)
  0066a8  6f08                 ble.b     $66b2
  0066aa  7803                 moveq     #$3, d4
  0066ac  7a0f                 moveq     #$f, d5
  0066ae  600008c0             bra.w     $6f70
  0066b2  4a6a004e             tst.w     $4e(a2)
  0066b6  6f1a                 ble.b     $66d2
  0066b8  302a0050             move.w    $50(a2), d0
  0066bc  c1c3                 muls.w    d3, d0
  0066be  e080                 asr.l     #$8, d0
  0066c0  35400050             move.w    d0, $50(a2)
  0066c4  302a004e             move.w    $4e(a2), d0
  0066c8  c1c3                 muls.w    d3, d0
  0066ca  e080                 asr.l     #$8, d0
  0066cc  4480                 neg.l     d0
  0066ce  3540004e             move.w    d0, $4e(a2)
  0066d2  302c0004             move.w    $4(a4), d0
  0066d6  48c0                 ext.l     d0
  0066d8  3213                 move.w    (a3), d1
  0066da  48c1                 ext.l     d1
  0066dc  7410                 moveq     #$10, d2
  0066de  d282                 add.l     d2, d1
  0066e0  9280                 sub.l     d0, d1
  0066e2  3541005a             move.w    d1, $5a(a2)
  0066e6  7c01                 moveq     #$1, d6
  0066e8  60000930             bra.w     $701a
  0066ec  486effe2             pea.l     -$1e(a6)
  0066f0  3f2b0002             move.w    $2(a3), -(a7)
  0066f4  3f13                 move.w    (a3), -(a7)
  0066f6  302b0002             move.w    $2(a3), d0
  0066fa  48c0                 ext.l     d0
  0066fc  7210                 moveq     #$10, d1
  0066fe  d081                 add.l     d1, d0
  006700  3f00                 move.w    d0, -(a7)
  006702  3013                 move.w    (a3), d0
  006704  48c0                 ext.l     d0
  006706  7220                 moveq     #$20, d1
  006708  d081                 add.l     d1, d0
  00670a  3f00                 move.w    d0, -(a7)
  00670c  a8a7                 _SetRect  
  00670e  486effd2             pea.l     -$2e(a6)
  006712  3f2b0002             move.w    $2(a3), -(a7)
  006716  3013                 move.w    (a3), d0
  006718  48c0                 ext.l     d0
  00671a  7210                 moveq     #$10, d1
  00671c  d081                 add.l     d1, d0
  00671e  3f00                 move.w    d0, -(a7)
  006720  302b0002             move.w    $2(a3), d0
  006724  48c0                 ext.l     d0
  006726  7220                 moveq     #$20, d1
  006728  d081                 add.l     d1, d0
  00672a  3f00                 move.w    d0, -(a7)
  00672c  3013                 move.w    (a3), d0
  00672e  48c0                 ext.l     d0
  006730  7220                 moveq     #$20, d1
  006732  d081                 add.l     d1, d0
  006734  3f00                 move.w    d0, -(a7)
  006736  a8a7                 _SetRect  
  006738  554f                 subq.w    #$2, a7
  00673a  486effea             pea.l     -$16(a6)
  00673e  486effe2             pea.l     -$1e(a6)
  006742  486effda             pea.l     -$26(a6)
  006746  a8aa                 _SectRect 
  006748  101f                 move.b    (a7)+, d0
  00674a  6616                 bne.b     $6762
  00674c  554f                 subq.w    #$2, a7
  00674e  486effea             pea.l     -$16(a6)
  006752  486effd2             pea.l     -$2e(a6)
  006756  486effda             pea.l     -$26(a6)
  00675a  a8aa                 _SectRect 
  00675c  101f                 move.b    (a7)+, d0
  00675e  670008ba             beq.w     $701a
  006762  302e0012             move.w    $12(a6), d0
  006766  48c0                 ext.l     d0
  006768  322a005c             move.w    $5c(a2), d1
  00676c  48c1                 ext.l     d1
  00676e  d280                 add.l     d0, d1
  006770  3d41fffe             move.w    d1, -$2(a6)
  006774  302e0012             move.w    $12(a6), d0
  006778  48c0                 ext.l     d0
  00677a  322a005a             move.w    $5a(a2), d1
  00677e  48c1                 ext.l     d1
  006780  d280                 add.l     d0, d1
  006782  3d41fffc             move.w    d1, -$4(a6)
  006786  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  00678c  3013                 move.w    (a3), d0
  00678e  48c0                 ext.l     d0
  006790  7220                 moveq     #$20, d1
  006792  d081                 add.l     d1, d0
  006794  3d40fff8             move.w    d0, -$8(a6)
  006798  302efffa             move.w    -$6(a6), d0
  00679c  48c0                 ext.l     d0
  00679e  382efffe             move.w    -$2(a6), d4
  0067a2  48c4                 ext.l     d4
  0067a4  9880                 sub.l     d0, d4
  0067a6  302efffc             move.w    -$4(a6), d0
  0067aa  48c0                 ext.l     d0
  0067ac  3a2efff8             move.w    -$8(a6), d5
  0067b0  48c5                 ext.l     d5
  0067b2  9a80                 sub.l     d0, d5
  0067b4  b845                 cmp.w     d5, d4
  0067b6  6c38                 bge.b     $67f0
  0067b8  4a6a0050             tst.w     $50(a2)
  0067bc  6c1a                 bge.b     $67d8
  0067be  302a0050             move.w    $50(a2), d0
  0067c2  c1c3                 muls.w    d3, d0
  0067c4  e080                 asr.l     #$8, d0
  0067c6  4480                 neg.l     d0
  0067c8  35400050             move.w    d0, $50(a2)
  0067cc  302a004e             move.w    $4e(a2), d0
  0067d0  c1c3                 muls.w    d3, d0
  0067d2  e080                 asr.l     #$8, d0
  0067d4  3540004e             move.w    d0, $4e(a2)
  0067d8  302c0002             move.w    $2(a4), d0
  0067dc  48c0                 ext.l     d0
  0067de  322b0002             move.w    $2(a3), d1
  0067e2  48c1                 ext.l     d1
  0067e4  7410                 moveq     #$10, d2
  0067e6  d282                 add.l     d2, d1
  0067e8  9280                 sub.l     d0, d1
  0067ea  3541005c             move.w    d1, $5c(a2)
  0067ee  6034                 bra.b     $6824
  0067f0  4a6a004e             tst.w     $4e(a2)
  0067f4  6f1a                 ble.b     $6810
  0067f6  302a0050             move.w    $50(a2), d0
  0067fa  c1c3                 muls.w    d3, d0
  0067fc  e080                 asr.l     #$8, d0
  0067fe  35400050             move.w    d0, $50(a2)
  006802  302a004e             move.w    $4e(a2), d0
  006806  c1c3                 muls.w    d3, d0
  006808  e080                 asr.l     #$8, d0
  00680a  4480                 neg.l     d0
  00680c  3540004e             move.w    d0, $4e(a2)
  006810  302c0004             move.w    $4(a4), d0
  006814  48c0                 ext.l     d0
  006816  3213                 move.w    (a3), d1
  006818  48c1                 ext.l     d1
  00681a  7410                 moveq     #$10, d2
  00681c  d282                 add.l     d2, d1
  00681e  9280                 sub.l     d0, d1
  006820  3541005a             move.w    d1, $5a(a2)
  006824  302c0002             move.w    $2(a4), d0
  006828  48c0                 ext.l     d0
  00682a  322b0002             move.w    $2(a3), d1
  00682e  48c1                 ext.l     d1
  006830  7410                 moveq     #$10, d2
  006832  d282                 add.l     d2, d1
  006834  9280                 sub.l     d0, d1
  006836  302a005c             move.w    $5c(a2), d0
  00683a  48c0                 ext.l     d0
  00683c  b081                 cmp.l     d1, d0
  00683e  6c16                 bge.b     $6856
  006840  302c0002             move.w    $2(a4), d0
  006844  48c0                 ext.l     d0
  006846  322b0002             move.w    $2(a3), d1
  00684a  48c1                 ext.l     d1
  00684c  7410                 moveq     #$10, d2
  00684e  d282                 add.l     d2, d1
  006850  9280                 sub.l     d0, d1
  006852  3541005c             move.w    d1, $5c(a2)
  006856  302c0004             move.w    $4(a4), d0
  00685a  48c0                 ext.l     d0
  00685c  3213                 move.w    (a3), d1
  00685e  48c1                 ext.l     d1
  006860  7410                 moveq     #$10, d2
  006862  d282                 add.l     d2, d1
  006864  9280                 sub.l     d0, d1
  006866  302a005a             move.w    $5a(a2), d0
  00686a  48c0                 ext.l     d0
  00686c  b081                 cmp.l     d1, d0
  00686e  6f14                 ble.b     $6884
  006870  302c0004             move.w    $4(a4), d0
  006874  48c0                 ext.l     d0
  006876  3213                 move.w    (a3), d1
  006878  48c1                 ext.l     d1
  00687a  7410                 moveq     #$10, d2
  00687c  d282                 add.l     d2, d1
  00687e  9280                 sub.l     d0, d1
  006880  3541005a             move.w    d1, $5a(a2)
  006884  7c01                 moveq     #$1, d6
  006886  60000792             bra.w     $701a
  00688a  486effe2             pea.l     -$1e(a6)
  00688e  3f2b0002             move.w    $2(a3), -(a7)
  006892  3f13                 move.w    (a3), -(a7)
  006894  302b0002             move.w    $2(a3), d0
  006898  48c0                 ext.l     d0
  00689a  7220                 moveq     #$20, d1
  00689c  d081                 add.l     d1, d0
  00689e  3f00                 move.w    d0, -(a7)
  0068a0  3013                 move.w    (a3), d0
  0068a2  48c0                 ext.l     d0
  0068a4  7210                 moveq     #$10, d1
  0068a6  d081                 add.l     d1, d0
  0068a8  3f00                 move.w    d0, -(a7)
  0068aa  a8a7                 _SetRect  
  0068ac  486effd2             pea.l     -$2e(a6)
  0068b0  3f2b0002             move.w    $2(a3), -(a7)
  0068b4  3f13                 move.w    (a3), -(a7)
  0068b6  302b0002             move.w    $2(a3), d0
  0068ba  48c0                 ext.l     d0
  0068bc  7210                 moveq     #$10, d1
  0068be  d081                 add.l     d1, d0
  0068c0  3f00                 move.w    d0, -(a7)
  0068c2  3013                 move.w    (a3), d0
  0068c4  48c0                 ext.l     d0
  0068c6  7220                 moveq     #$20, d1
  0068c8  d081                 add.l     d1, d0
  0068ca  3f00                 move.w    d0, -(a7)
  0068cc  a8a7                 _SetRect  
  0068ce  554f                 subq.w    #$2, a7
  0068d0  486effea             pea.l     -$16(a6)
  0068d4  486effe2             pea.l     -$1e(a6)
  0068d8  486effda             pea.l     -$26(a6)
  0068dc  a8aa                 _SectRect 
  0068de  101f                 move.b    (a7)+, d0
  0068e0  6616                 bne.b     $68f8
  0068e2  554f                 subq.w    #$2, a7
  0068e4  486effea             pea.l     -$16(a6)
  0068e8  486effd2             pea.l     -$2e(a6)
  0068ec  486effda             pea.l     -$26(a6)
  0068f0  a8aa                 _SectRect 
  0068f2  101f                 move.b    (a7)+, d0
  0068f4  67000724             beq.w     $701a
  0068f8  302e0012             move.w    $12(a6), d0
  0068fc  48c0                 ext.l     d0
  0068fe  322a005c             move.w    $5c(a2), d1
  006902  48c1                 ext.l     d1
  006904  d280                 add.l     d0, d1
  006906  3d41fffe             move.w    d1, -$2(a6)
  00690a  302e0012             move.w    $12(a6), d0
  00690e  48c0                 ext.l     d0
  006910  322a005a             move.w    $5a(a2), d1
  006914  48c1                 ext.l     d1
  006916  d280                 add.l     d0, d1
  006918  3d41fffc             move.w    d1, -$4(a6)
  00691c  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  006922  3d53fff8             move.w    (a3), -$8(a6)
  006926  302efffa             move.w    -$6(a6), d0
  00692a  48c0                 ext.l     d0
  00692c  382efffe             move.w    -$2(a6), d4
  006930  48c4                 ext.l     d4
  006932  9880                 sub.l     d0, d4
  006934  302efff8             move.w    -$8(a6), d0
  006938  48c0                 ext.l     d0
  00693a  3a2efffc             move.w    -$4(a6), d5
  00693e  48c5                 ext.l     d5
  006940  9a80                 sub.l     d0, d5
  006942  b845                 cmp.w     d5, d4
  006944  6c38                 bge.b     $697e
  006946  4a6a0050             tst.w     $50(a2)
  00694a  6c1a                 bge.b     $6966
  00694c  302a0050             move.w    $50(a2), d0
  006950  c1c3                 muls.w    d3, d0
  006952  e080                 asr.l     #$8, d0
  006954  4480                 neg.l     d0
  006956  35400050             move.w    d0, $50(a2)
  00695a  302a004e             move.w    $4e(a2), d0
  00695e  c1c3                 muls.w    d3, d0
  006960  e080                 asr.l     #$8, d0
  006962  3540004e             move.w    d0, $4e(a2)
  006966  302c0002             move.w    $2(a4), d0
  00696a  48c0                 ext.l     d0
  00696c  322b0002             move.w    $2(a3), d1
  006970  48c1                 ext.l     d1
  006972  7410                 moveq     #$10, d2
  006974  d282                 add.l     d2, d1
  006976  9280                 sub.l     d0, d1
  006978  3541005c             move.w    d1, $5c(a2)
  00697c  6032                 bra.b     $69b0
  00697e  4a6a004e             tst.w     $4e(a2)
  006982  6c1a                 bge.b     $699e
  006984  302a0050             move.w    $50(a2), d0
  006988  c1c3                 muls.w    d3, d0
  00698a  e080                 asr.l     #$8, d0
  00698c  35400050             move.w    d0, $50(a2)
  006990  302a004e             move.w    $4e(a2), d0
  006994  c1c3                 muls.w    d3, d0
  006996  e080                 asr.l     #$8, d0
  006998  4480                 neg.l     d0
  00699a  3540004e             move.w    d0, $4e(a2)
  00699e  3014                 move.w    (a4), d0
  0069a0  48c0                 ext.l     d0
  0069a2  3213                 move.w    (a3), d1
  0069a4  48c1                 ext.l     d1
  0069a6  7410                 moveq     #$10, d2
  0069a8  d282                 add.l     d2, d1
  0069aa  9280                 sub.l     d0, d1
  0069ac  3541005a             move.w    d1, $5a(a2)
  0069b0  302c0002             move.w    $2(a4), d0
  0069b4  48c0                 ext.l     d0
  0069b6  322b0002             move.w    $2(a3), d1
  0069ba  48c1                 ext.l     d1
  0069bc  7410                 moveq     #$10, d2
  0069be  d282                 add.l     d2, d1
  0069c0  9280                 sub.l     d0, d1
  0069c2  302a005c             move.w    $5c(a2), d0
  0069c6  48c0                 ext.l     d0
  0069c8  b081                 cmp.l     d1, d0
  0069ca  6c16                 bge.b     $69e2
  0069cc  302c0002             move.w    $2(a4), d0
  0069d0  48c0                 ext.l     d0
  0069d2  322b0002             move.w    $2(a3), d1
  0069d6  48c1                 ext.l     d1
  0069d8  7410                 moveq     #$10, d2
  0069da  d282                 add.l     d2, d1
  0069dc  9280                 sub.l     d0, d1
  0069de  3541005c             move.w    d1, $5c(a2)
  0069e2  3014                 move.w    (a4), d0
  0069e4  48c0                 ext.l     d0
  0069e6  3213                 move.w    (a3), d1
  0069e8  48c1                 ext.l     d1
  0069ea  7410                 moveq     #$10, d2
  0069ec  d282                 add.l     d2, d1
  0069ee  9280                 sub.l     d0, d1
  0069f0  302a005a             move.w    $5a(a2), d0
  0069f4  48c0                 ext.l     d0
  0069f6  b081                 cmp.l     d1, d0
  0069f8  6c12                 bge.b     $6a0c
  0069fa  3014                 move.w    (a4), d0
  0069fc  48c0                 ext.l     d0
  0069fe  3213                 move.w    (a3), d1
  006a00  48c1                 ext.l     d1
  006a02  7410                 moveq     #$10, d2
  006a04  d282                 add.l     d2, d1
  006a06  9280                 sub.l     d0, d1
  006a08  3541005a             move.w    d1, $5a(a2)
  006a0c  7c01                 moveq     #$1, d6
  006a0e  6000060a             bra.w     $701a
  006a12  486effe2             pea.l     -$1e(a6)
  006a16  3f2b0002             move.w    $2(a3), -(a7)
  006a1a  3f13                 move.w    (a3), -(a7)
  006a1c  302b0002             move.w    $2(a3), d0
  006a20  48c0                 ext.l     d0
  006a22  7220                 moveq     #$20, d1
  006a24  d081                 add.l     d1, d0
  006a26  3f00                 move.w    d0, -(a7)
  006a28  3013                 move.w    (a3), d0
  006a2a  48c0                 ext.l     d0
  006a2c  7210                 moveq     #$10, d1
  006a2e  d081                 add.l     d1, d0
  006a30  3f00                 move.w    d0, -(a7)
  006a32  a8a7                 _SetRect  
  006a34  486effd2             pea.l     -$2e(a6)
  006a38  302b0002             move.w    $2(a3), d0
  006a3c  48c0                 ext.l     d0
  006a3e  7210                 moveq     #$10, d1
  006a40  d081                 add.l     d1, d0
  006a42  3f00                 move.w    d0, -(a7)
  006a44  3f13                 move.w    (a3), -(a7)
  006a46  302b0002             move.w    $2(a3), d0
  006a4a  48c0                 ext.l     d0
  006a4c  7220                 moveq     #$20, d1
  006a4e  d081                 add.l     d1, d0
  006a50  3f00                 move.w    d0, -(a7)
  006a52  3013                 move.w    (a3), d0
  006a54  48c0                 ext.l     d0
  006a56  7220                 moveq     #$20, d1
  006a58  d081                 add.l     d1, d0
  006a5a  3f00                 move.w    d0, -(a7)
  006a5c  a8a7                 _SetRect  
  006a5e  554f                 subq.w    #$2, a7
  006a60  486effea             pea.l     -$16(a6)
  006a64  486effe2             pea.l     -$1e(a6)
  006a68  486effda             pea.l     -$26(a6)
  006a6c  a8aa                 _SectRect 
  006a6e  101f                 move.b    (a7)+, d0
  006a70  6616                 bne.b     $6a88
  006a72  554f                 subq.w    #$2, a7
  006a74  486effea             pea.l     -$16(a6)
  006a78  486effd2             pea.l     -$2e(a6)
  006a7c  486effda             pea.l     -$26(a6)
  006a80  a8aa                 _SectRect 
  006a82  101f                 move.b    (a7)+, d0
  006a84  67000594             beq.w     $701a
  006a88  302e0012             move.w    $12(a6), d0
  006a8c  48c0                 ext.l     d0
  006a8e  322a005c             move.w    $5c(a2), d1
  006a92  48c1                 ext.l     d1
  006a94  d280                 add.l     d0, d1
  006a96  3d41fffe             move.w    d1, -$2(a6)
  006a9a  302e0012             move.w    $12(a6), d0
  006a9e  48c0                 ext.l     d0
  006aa0  322a005a             move.w    $5a(a2), d1
  006aa4  48c1                 ext.l     d1
  006aa6  d280                 add.l     d0, d1
  006aa8  3d41fffc             move.w    d1, -$4(a6)
  006aac  302b0002             move.w    $2(a3), d0
  006ab0  48c0                 ext.l     d0
  006ab2  7220                 moveq     #$20, d1
  006ab4  d081                 add.l     d1, d0
  006ab6  3d40fffa             move.w    d0, -$6(a6)
  006aba  3d53fff8             move.w    (a3), -$8(a6)
  006abe  302efffe             move.w    -$2(a6), d0
  006ac2  48c0                 ext.l     d0
  006ac4  382efffa             move.w    -$6(a6), d4
  006ac8  48c4                 ext.l     d4
  006aca  9880                 sub.l     d0, d4
  006acc  302efff8             move.w    -$8(a6), d0
  006ad0  48c0                 ext.l     d0
  006ad2  3a2efffc             move.w    -$4(a6), d5
  006ad6  48c5                 ext.l     d5
  006ad8  9a80                 sub.l     d0, d5
  006ada  b845                 cmp.w     d5, d4
  006adc  6c38                 bge.b     $6b16
  006ade  4a6a0050             tst.w     $50(a2)
  006ae2  6f1a                 ble.b     $6afe
  006ae4  302a0050             move.w    $50(a2), d0
  006ae8  c1c3                 muls.w    d3, d0
  006aea  e080                 asr.l     #$8, d0
  006aec  4480                 neg.l     d0
  006aee  35400050             move.w    d0, $50(a2)
  006af2  302a004e             move.w    $4e(a2), d0
  006af6  c1c3                 muls.w    d3, d0
  006af8  e080                 asr.l     #$8, d0
  006afa  3540004e             move.w    d0, $4e(a2)
  006afe  302c0006             move.w    $6(a4), d0
  006b02  48c0                 ext.l     d0
  006b04  322b0002             move.w    $2(a3), d1
  006b08  48c1                 ext.l     d1
  006b0a  7410                 moveq     #$10, d2
  006b0c  d282                 add.l     d2, d1
  006b0e  9280                 sub.l     d0, d1
  006b10  3541005c             move.w    d1, $5c(a2)
  006b14  6032                 bra.b     $6b48
  006b16  4a6a004e             tst.w     $4e(a2)
  006b1a  6c1a                 bge.b     $6b36
  006b1c  302a0050             move.w    $50(a2), d0
  006b20  c1c3                 muls.w    d3, d0
  006b22  e080                 asr.l     #$8, d0
  006b24  35400050             move.w    d0, $50(a2)
  006b28  302a004e             move.w    $4e(a2), d0
  006b2c  c1c3                 muls.w    d3, d0
  006b2e  e080                 asr.l     #$8, d0
  006b30  4480                 neg.l     d0
  006b32  3540004e             move.w    d0, $4e(a2)
  006b36  3014                 move.w    (a4), d0
  006b38  48c0                 ext.l     d0
  006b3a  3213                 move.w    (a3), d1
  006b3c  48c1                 ext.l     d1
  006b3e  7410                 moveq     #$10, d2
  006b40  d282                 add.l     d2, d1
  006b42  9280                 sub.l     d0, d1
  006b44  3541005a             move.w    d1, $5a(a2)
  006b48  302c0006             move.w    $6(a4), d0
  006b4c  48c0                 ext.l     d0
  006b4e  322b0002             move.w    $2(a3), d1
  006b52  48c1                 ext.l     d1
  006b54  7410                 moveq     #$10, d2
  006b56  d282                 add.l     d2, d1
  006b58  9280                 sub.l     d0, d1
  006b5a  302a005c             move.w    $5c(a2), d0
  006b5e  48c0                 ext.l     d0
  006b60  b081                 cmp.l     d1, d0
  006b62  6f16                 ble.b     $6b7a
  006b64  302c0006             move.w    $6(a4), d0
  006b68  48c0                 ext.l     d0
  006b6a  322b0002             move.w    $2(a3), d1
  006b6e  48c1                 ext.l     d1
  006b70  7410                 moveq     #$10, d2
  006b72  d282                 add.l     d2, d1
  006b74  9280                 sub.l     d0, d1
  006b76  3541005c             move.w    d1, $5c(a2)
  006b7a  3014                 move.w    (a4), d0
  006b7c  48c0                 ext.l     d0
  006b7e  3213                 move.w    (a3), d1
  006b80  48c1                 ext.l     d1
  006b82  7410                 moveq     #$10, d2
  006b84  d282                 add.l     d2, d1
  006b86  9280                 sub.l     d0, d1
  006b88  302a005a             move.w    $5a(a2), d0
  006b8c  48c0                 ext.l     d0
  006b8e  b081                 cmp.l     d1, d0
  006b90  6c12                 bge.b     $6ba4
  006b92  3014                 move.w    (a4), d0
  006b94  48c0                 ext.l     d0
  006b96  3213                 move.w    (a3), d1
  006b98  48c1                 ext.l     d1
  006b9a  7410                 moveq     #$10, d2
  006b9c  d282                 add.l     d2, d1
  006b9e  9280                 sub.l     d0, d1
  006ba0  3541005a             move.w    d1, $5a(a2)
  006ba4  7c01                 moveq     #$1, d6
  006ba6  60000472             bra.w     $701a
  006baa  486effe2             pea.l     -$1e(a6)
  006bae  3f2b0002             move.w    $2(a3), -(a7)
  006bb2  3013                 move.w    (a3), d0
  006bb4  48c0                 ext.l     d0
  006bb6  7210                 moveq     #$10, d1
  006bb8  d081                 add.l     d1, d0
  006bba  3f00                 move.w    d0, -(a7)
  006bbc  302b0002             move.w    $2(a3), d0
  006bc0  48c0                 ext.l     d0
  006bc2  7220                 moveq     #$20, d1
  006bc4  d081                 add.l     d1, d0
  006bc6  3f00                 move.w    d0, -(a7)
  006bc8  3013                 move.w    (a3), d0
  006bca  48c0                 ext.l     d0
  006bcc  7220                 moveq     #$20, d1
  006bce  d081                 add.l     d1, d0
  006bd0  3f00                 move.w    d0, -(a7)
  006bd2  a8a7                 _SetRect  
  006bd4  486effd2             pea.l     -$2e(a6)
  006bd8  302b0002             move.w    $2(a3), d0
  006bdc  48c0                 ext.l     d0
  006bde  7210                 moveq     #$10, d1
  006be0  d081                 add.l     d1, d0
  006be2  3f00                 move.w    d0, -(a7)
  006be4  3f13                 move.w    (a3), -(a7)
  006be6  302b0002             move.w    $2(a3), d0
  006bea  48c0                 ext.l     d0
  006bec  7220                 moveq     #$20, d1
  006bee  d081                 add.l     d1, d0
  006bf0  3f00                 move.w    d0, -(a7)
  006bf2  3013                 move.w    (a3), d0
  006bf4  48c0                 ext.l     d0
  006bf6  7220                 moveq     #$20, d1
  006bf8  d081                 add.l     d1, d0
  006bfa  3f00                 move.w    d0, -(a7)
  006bfc  a8a7                 _SetRect  
  006bfe  554f                 subq.w    #$2, a7
  006c00  486effea             pea.l     -$16(a6)
  006c04  486effe2             pea.l     -$1e(a6)
  006c08  486effda             pea.l     -$26(a6)
  006c0c  a8aa                 _SectRect 
  006c0e  101f                 move.b    (a7)+, d0
  006c10  6616                 bne.b     $6c28
  006c12  554f                 subq.w    #$2, a7
  006c14  486effea             pea.l     -$16(a6)
  006c18  486effd2             pea.l     -$2e(a6)
  006c1c  486effda             pea.l     -$26(a6)
  006c20  a8aa                 _SectRect 
  006c22  101f                 move.b    (a7)+, d0
  006c24  670003f4             beq.w     $701a
  006c28  302e0012             move.w    $12(a6), d0
  006c2c  48c0                 ext.l     d0
  006c2e  322a005c             move.w    $5c(a2), d1
  006c32  48c1                 ext.l     d1
  006c34  d280                 add.l     d0, d1
  006c36  3d41fffe             move.w    d1, -$2(a6)
  006c3a  302e0012             move.w    $12(a6), d0
  006c3e  48c0                 ext.l     d0
  006c40  322a005a             move.w    $5a(a2), d1
  006c44  48c1                 ext.l     d1
  006c46  d280                 add.l     d0, d1
  006c48  3d41fffc             move.w    d1, -$4(a6)
  006c4c  302b0002             move.w    $2(a3), d0
  006c50  48c0                 ext.l     d0
  006c52  7220                 moveq     #$20, d1
  006c54  d081                 add.l     d1, d0
  006c56  3d40fffa             move.w    d0, -$6(a6)
  006c5a  3013                 move.w    (a3), d0
  006c5c  48c0                 ext.l     d0
  006c5e  7220                 moveq     #$20, d1
  006c60  d081                 add.l     d1, d0
  006c62  3d40fff8             move.w    d0, -$8(a6)
  006c66  302efffe             move.w    -$2(a6), d0
  006c6a  48c0                 ext.l     d0
  006c6c  382efffa             move.w    -$6(a6), d4
  006c70  48c4                 ext.l     d4
  006c72  9880                 sub.l     d0, d4
  006c74  302efffc             move.w    -$4(a6), d0
  006c78  48c0                 ext.l     d0
  006c7a  3a2efff8             move.w    -$8(a6), d5
  006c7e  48c5                 ext.l     d5
  006c80  9a80                 sub.l     d0, d5
  006c82  b845                 cmp.w     d5, d4
  006c84  6c38                 bge.b     $6cbe
  006c86  4a6a0050             tst.w     $50(a2)
  006c8a  6f1a                 ble.b     $6ca6
  006c8c  302a0050             move.w    $50(a2), d0
  006c90  c1c3                 muls.w    d3, d0
  006c92  e080                 asr.l     #$8, d0
  006c94  4480                 neg.l     d0
  006c96  35400050             move.w    d0, $50(a2)
  006c9a  302a004e             move.w    $4e(a2), d0
  006c9e  c1c3                 muls.w    d3, d0
  006ca0  e080                 asr.l     #$8, d0
  006ca2  3540004e             move.w    d0, $4e(a2)
  006ca6  302c0006             move.w    $6(a4), d0
  006caa  48c0                 ext.l     d0
  006cac  322b0002             move.w    $2(a3), d1
  006cb0  48c1                 ext.l     d1
  006cb2  7410                 moveq     #$10, d2
  006cb4  d282                 add.l     d2, d1
  006cb6  9280                 sub.l     d0, d1
  006cb8  3541005c             move.w    d1, $5c(a2)
  006cbc  6034                 bra.b     $6cf2
  006cbe  4a6a004e             tst.w     $4e(a2)
  006cc2  6f1a                 ble.b     $6cde
  006cc4  302a0050             move.w    $50(a2), d0
  006cc8  c1c3                 muls.w    d3, d0
  006cca  e080                 asr.l     #$8, d0
  006ccc  35400050             move.w    d0, $50(a2)
  006cd0  302a004e             move.w    $4e(a2), d0
  006cd4  c1c3                 muls.w    d3, d0
  006cd6  e080                 asr.l     #$8, d0
  006cd8  4480                 neg.l     d0
  006cda  3540004e             move.w    d0, $4e(a2)
  006cde  302c0004             move.w    $4(a4), d0
  006ce2  48c0                 ext.l     d0
  006ce4  3213                 move.w    (a3), d1
  006ce6  48c1                 ext.l     d1
  006ce8  7410                 moveq     #$10, d2
  006cea  d282                 add.l     d2, d1
  006cec  9280                 sub.l     d0, d1
  006cee  3541005a             move.w    d1, $5a(a2)
  006cf2  302c0006             move.w    $6(a4), d0
  006cf6  48c0                 ext.l     d0
  006cf8  322b0002             move.w    $2(a3), d1
  006cfc  48c1                 ext.l     d1
  006cfe  7410                 moveq     #$10, d2
  006d00  d282                 add.l     d2, d1
  006d02  9280                 sub.l     d0, d1
  006d04  302a005c             move.w    $5c(a2), d0
  006d08  48c0                 ext.l     d0
  006d0a  b081                 cmp.l     d1, d0
  006d0c  6f16                 ble.b     $6d24
  006d0e  302c0006             move.w    $6(a4), d0
  006d12  48c0                 ext.l     d0
  006d14  322b0002             move.w    $2(a3), d1
  006d18  48c1                 ext.l     d1
  006d1a  7410                 moveq     #$10, d2
  006d1c  d282                 add.l     d2, d1
  006d1e  9280                 sub.l     d0, d1
  006d20  3541005c             move.w    d1, $5c(a2)
  006d24  302c0004             move.w    $4(a4), d0
  006d28  48c0                 ext.l     d0
  006d2a  3213                 move.w    (a3), d1
  006d2c  48c1                 ext.l     d1
  006d2e  7410                 moveq     #$10, d2
  006d30  d282                 add.l     d2, d1
  006d32  9280                 sub.l     d0, d1
  006d34  302a005a             move.w    $5a(a2), d0
  006d38  48c0                 ext.l     d0
  006d3a  b081                 cmp.l     d1, d0
  006d3c  6f14                 ble.b     $6d52
  006d3e  302c0004             move.w    $4(a4), d0
  006d42  48c0                 ext.l     d0
  006d44  3213                 move.w    (a3), d1
  006d46  48c1                 ext.l     d1
  006d48  7410                 moveq     #$10, d2
  006d4a  d282                 add.l     d2, d1
  006d4c  9280                 sub.l     d0, d1
  006d4e  3541005a             move.w    d1, $5a(a2)
  006d52  7c01                 moveq     #$1, d6
  006d54  600002c4             bra.w     $701a
  006d58  0c47000c             cmpi.w    #$c, d7
  006d5c  6d0002bc             blt.w     $701a
  006d60  0c470020             cmpi.w    #$20, d7
  006d64  6c0002b4             bge.w     $701a
  006d68  356a005c0004         move.w    $5c(a2), $4(a2)
  006d6e  356a005a0002         move.w    $5a(a2), $2(a2)
  006d74  554f                 subq.w    #$2, a7
  006d76  2f0a                 move.l    a2, -(a7)
  006d78  2f13                 move.l    (a3), -(a7)
  006d7a  3f3c0028             move.w    #$28, -(a7)
  006d7e  2f2e001a             move.l    $1a(a6), -(a7)
  006d82  702e                 moveq     #$2e, d0
  006d84  c1c7                 muls.w    d7, d0
  006d86  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  006d8c  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  006d90  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  006d96  101f                 move.b    (a7)+, d0
  006d98  1d40fff3             move.b    d0, -$d(a6)
  006d9c  4a2efff3             tst.b     -$d(a6)
  006da0  67000278             beq.w     $701a
  006da4  356a0004005c         move.w    $4(a2), $5c(a2)
  006daa  356a0002005a         move.w    $2(a2), $5a(a2)
  006db0  302e0012             move.w    $12(a6), d0
  006db4  48c0                 ext.l     d0
  006db6  322a005c             move.w    $5c(a2), d1
  006dba  48c1                 ext.l     d1
  006dbc  d280                 add.l     d0, d1
  006dbe  3d41fffe             move.w    d1, -$2(a6)
  006dc2  302e0012             move.w    $12(a6), d0
  006dc6  48c0                 ext.l     d0
  006dc8  322a005a             move.w    $5a(a2), d1
  006dcc  48c1                 ext.l     d1
  006dce  d280                 add.l     d0, d1
  006dd0  3d41fffc             move.w    d1, -$4(a6)
  006dd4  7c01                 moveq     #$1, d6
  006dd6  3007                 move.w    d7, d0
  006dd8  48c0                 ext.l     d0
  006dda  5180                 subq.l    #$8, d0
  006ddc  5180                 subq.l    #$8, d0
  006dde  0c800000000f         cmpi.l    #$f, d0
  006de4  6200018a             bhi.w     $6f70
  006de8  303b0206             move.w    $6df0(pc, d0.w * 2), d0
  006dec  4efb0002             jmp       $6df0(pc, d0.w)
  006df0  00200038005000680080009800b000c6 cases     0:$6e10 1:$6e28 2:$6e40 3:$6e58 4:$6e70 5:$6e88 6:$6ea0 7:$6eb6
  006e00  00de00f6010a011e01320146015a016e cases     8:$6ece 9:$6ee6 10:$6efa 11:$6f0e 12:$6f22 13:$6f36 14:$6f4a 15:$6f5e
  006e10  302efffe             move.w    -$2(a6), d0
  006e14  b06efff6             cmp.w     -$a(a6), d0
  006e18  6c06                 bge.b     $6e20
  006e1a  7802                 moveq     #$2, d4
  006e1c  60000152             bra.w     $6f70
  006e20  7803                 moveq     #$3, d4
  006e22  7a0c                 moveq     #$c, d5
  006e24  6000014a             bra.w     $6f70
  006e28  302efffc             move.w    -$4(a6), d0
  006e2c  b06efff4             cmp.w     -$c(a6), d0
  006e30  6c06                 bge.b     $6e38
  006e32  7801                 moveq     #$1, d4
  006e34  6000013a             bra.w     $6f70
  006e38  7803                 moveq     #$3, d4
  006e3a  7a0d                 moveq     #$d, d5
  006e3c  60000132             bra.w     $6f70
  006e40  302efffe             move.w    -$2(a6), d0
  006e44  b06efff6             cmp.w     -$a(a6), d0
  006e48  6c08                 bge.b     $6e52
  006e4a  7803                 moveq     #$3, d4
  006e4c  7a0e                 moveq     #$e, d5
  006e4e  60000120             bra.w     $6f70
  006e52  7802                 moveq     #$2, d4
  006e54  6000011a             bra.w     $6f70
  006e58  302efffc             move.w    -$4(a6), d0
  006e5c  b06efff4             cmp.w     -$c(a6), d0
  006e60  6c08                 bge.b     $6e6a
  006e62  7803                 moveq     #$3, d4
  006e64  7a0f                 moveq     #$f, d5
  006e66  60000108             bra.w     $6f70
  006e6a  7801                 moveq     #$1, d4
  006e6c  60000102             bra.w     $6f70
  006e70  302efffc             move.w    -$4(a6), d0
  006e74  b06efff4             cmp.w     -$c(a6), d0
  006e78  6c08                 bge.b     $6e82
  006e7a  7803                 moveq     #$3, d4
  006e7c  7a0c                 moveq     #$c, d5
  006e7e  600000f0             bra.w     $6f70
  006e82  7801                 moveq     #$1, d4
  006e84  600000ea             bra.w     $6f70
  006e88  302efffe             move.w    -$2(a6), d0
  006e8c  b06efff6             cmp.w     -$a(a6), d0
  006e90  6c06                 bge.b     $6e98
  006e92  7802                 moveq     #$2, d4
  006e94  600000da             bra.w     $6f70
  006e98  7803                 moveq     #$3, d4
  006e9a  7a0d                 moveq     #$d, d5
  006e9c  600000d2             bra.w     $6f70
  006ea0  302efffc             move.w    -$4(a6), d0
  006ea4  b06efff4             cmp.w     -$c(a6), d0
  006ea8  6c04                 bge.b     $6eae
  006eaa  7801                 moveq     #$1, d4
  006eac  6002                 bra.b     $6eb0
  006eae  7803                 moveq     #$3, d4
  006eb0  7a0e                 moveq     #$e, d5
  006eb2  600000bc             bra.w     $6f70
  006eb6  302efffe             move.w    -$2(a6), d0
  006eba  b06efff6             cmp.w     -$a(a6), d0
  006ebe  6c08                 bge.b     $6ec8
  006ec0  7803                 moveq     #$3, d4
  006ec2  7a0f                 moveq     #$f, d5
  006ec4  600000aa             bra.w     $6f70
  006ec8  7802                 moveq     #$2, d4
  006eca  600000a4             bra.w     $6f70
  006ece  302efffe             move.w    -$2(a6), d0
  006ed2  b06efff6             cmp.w     -$a(a6), d0
  006ed6  6c08                 bge.b     $6ee0
  006ed8  7803                 moveq     #$3, d4
  006eda  7a0c                 moveq     #$c, d5
  006edc  60000092             bra.w     $6f70
  006ee0  7802                 moveq     #$2, d4
  006ee2  6000008c             bra.w     $6f70
  006ee6  302efffc             move.w    -$4(a6), d0
  006eea  b06efff4             cmp.w     -$c(a6), d0
  006eee  6c04                 bge.b     $6ef4
  006ef0  7801                 moveq     #$1, d4
  006ef2  607c                 bra.b     $6f70
  006ef4  7803                 moveq     #$3, d4
  006ef6  7a0d                 moveq     #$d, d5
  006ef8  6076                 bra.b     $6f70
  006efa  302efffe             move.w    -$2(a6), d0
  006efe  b06efff6             cmp.w     -$a(a6), d0
  006f02  6c04                 bge.b     $6f08
  006f04  7802                 moveq     #$2, d4
  006f06  6068                 bra.b     $6f70
  006f08  7803                 moveq     #$3, d4
  006f0a  7a0e                 moveq     #$e, d5
  006f0c  6062                 bra.b     $6f70
  006f0e  302efffc             move.w    -$4(a6), d0
  006f12  b06efff4             cmp.w     -$c(a6), d0
  006f16  6c04                 bge.b     $6f1c
  006f18  7801                 moveq     #$1, d4
  006f1a  6054                 bra.b     $6f70
  006f1c  7803                 moveq     #$3, d4
  006f1e  7a0f                 moveq     #$f, d5
  006f20  604e                 bra.b     $6f70
  006f22  302efffc             move.w    -$4(a6), d0
  006f26  b06efff4             cmp.w     -$c(a6), d0
  006f2a  6c04                 bge.b     $6f30
  006f2c  7801                 moveq     #$1, d4
  006f2e  6040                 bra.b     $6f70
  006f30  7803                 moveq     #$3, d4
  006f32  7a0c                 moveq     #$c, d5
  006f34  603a                 bra.b     $6f70
  006f36  302efffe             move.w    -$2(a6), d0
  006f3a  b06efff6             cmp.w     -$a(a6), d0
  006f3e  6c06                 bge.b     $6f46
  006f40  7803                 moveq     #$3, d4
  006f42  7a0d                 moveq     #$d, d5
  006f44  602a                 bra.b     $6f70
  006f46  7802                 moveq     #$2, d4
  006f48  6026                 bra.b     $6f70
  006f4a  302efffc             move.w    -$4(a6), d0
  006f4e  b06efff4             cmp.w     -$c(a6), d0
  006f52  6c06                 bge.b     $6f5a
  006f54  7803                 moveq     #$3, d4
  006f56  7a0e                 moveq     #$e, d5
  006f58  6016                 bra.b     $6f70
  006f5a  7801                 moveq     #$1, d4
  006f5c  6012                 bra.b     $6f70
  006f5e  302efffe             move.w    -$2(a6), d0
  006f62  b06efff6             cmp.w     -$a(a6), d0
  006f66  6c04                 bge.b     $6f6c
  006f68  7802                 moveq     #$2, d4
  006f6a  6004                 bra.b     $6f70
  006f6c  7803                 moveq     #$3, d4
  006f6e  7a0f                 moveq     #$f, d5
  006f70  3004                 move.w    d4, d0
  006f72  48c0                 ext.l     d0
  006f74  5380                 subq.l    #$1, d0
  006f76  670c                 beq.b     $6f84
  006f78  5380                 subq.l    #$1, d0
  006f7a  6724                 beq.b     $6fa0
  006f7c  5380                 subq.l    #$1, d0
  006f7e  673c                 beq.b     $6fbc
  006f80  60000098             bra.w     $701a
  006f84  302a0050             move.w    $50(a2), d0
  006f88  c1c3                 muls.w    d3, d0
  006f8a  e080                 asr.l     #$8, d0
  006f8c  4480                 neg.l     d0
  006f8e  35400050             move.w    d0, $50(a2)
  006f92  302a004e             move.w    $4e(a2), d0
  006f96  c1c3                 muls.w    d3, d0
  006f98  e080                 asr.l     #$8, d0
  006f9a  3540004e             move.w    d0, $4e(a2)
  006f9e  607a                 bra.b     $701a
  006fa0  302a0050             move.w    $50(a2), d0
  006fa4  c1c3                 muls.w    d3, d0
  006fa6  e080                 asr.l     #$8, d0
  006fa8  35400050             move.w    d0, $50(a2)
  006fac  302a004e             move.w    $4e(a2), d0
  006fb0  c1c3                 muls.w    d3, d0
  006fb2  e080                 asr.l     #$8, d0
  006fb4  4480                 neg.l     d0
  006fb6  3540004e             move.w    d0, $4e(a2)
  006fba  605e                 bra.b     $701a
  006fbc  0c45000c             cmpi.w    #$c, d5
  006fc0  6d3c                 blt.b     $6ffe
  006fc2  0c45000f             cmpi.w    #$f, d5
  006fc6  6e36                 bgt.b     $6ffe
  006fc8  0c45000d             cmpi.w    #$d, d5
  006fcc  6706                 beq.b     $6fd4
  006fce  0c45000f             cmpi.w    #$f, d5
  006fd2  6610                 bne.b     $6fe4
  006fd4  382a004e             move.w    $4e(a2), d4
  006fd8  356a0050004e         move.w    $50(a2), $4e(a2)
  006fde  35440050             move.w    d4, $50(a2)
  006fe2  601a                 bra.b     $6ffe
  006fe4  382a004e             move.w    $4e(a2), d4
  006fe8  302a0050             move.w    $50(a2), d0
  006fec  48c0                 ext.l     d0
  006fee  4480                 neg.l     d0
  006ff0  3540004e             move.w    d0, $4e(a2)
  006ff4  3004                 move.w    d4, d0
  006ff6  48c0                 ext.l     d0
  006ff8  4480                 neg.l     d0
  006ffa  35400050             move.w    d0, $50(a2)
  006ffe  302a0050             move.w    $50(a2), d0
  007002  c1c3                 muls.w    d3, d0
  007004  e080                 asr.l     #$8, d0
  007006  4480                 neg.l     d0
  007008  35400050             move.w    d0, $50(a2)
  00700c  302a004e             move.w    $4e(a2), d0
  007010  c1c3                 muls.w    d3, d0
  007012  e080                 asr.l     #$8, d0
  007014  4480                 neg.l     d0
  007016  3540004e             move.w    d0, $4e(a2)
  00701a  4a06                 tst.b     d6
  00701c  6718                 beq.b     $7036
  00701e  302a005c             move.w    $5c(a2), d0
  007022  48c0                 ext.l     d0
  007024  e188                 lsl.l     #$8, d0
  007026  2540005e             move.l    d0, $5e(a2)
  00702a  302a005a             move.w    $5a(a2), d0
  00702e  48c0                 ext.l     d0
  007030  e188                 lsl.l     #$8, d0
  007032  25400062             move.l    d0, $62(a2)
  007036  1006                 move.b    d6, d0
  007038  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  00703c  4e5e                 unlk      a6
  00703e  4e75                 rts       

;-------------------------------------------------------------
; WallBounce2   (seg 2 +00704e, 4042 bytes)
  00704e  4e56ffd2             link.w    a6, #$ffd2
  007052  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  007056  246e0008             movea.l   $8(a6), a2
  00705a  3e2e000c             move.w    $c(a6), d7
  00705e  266e000e             movea.l   $e(a6), a3
  007062  362e0016             move.w    $16(a6), d3
  007066  286e0018             movea.l   $18(a6), a4
  00706a  7c00                 moveq     #$0, d6
  00706c  7803                 moveq     #$3, d4
  00706e  3a07                 move.w    d7, d5
  007070  4a47                 tst.w     d7
  007072  6d06                 blt.b     $707a
  007074  0c470038             cmpi.w    #$38, d7
  007078  6d04                 blt.b     $707e
  00707a  60000f94             bra.w     $8010
  00707e  486effea             pea.l     -$16(a6)
  007082  302a005c             move.w    $5c(a2), d0
  007086  48c0                 ext.l     d0
  007088  322c0002             move.w    $2(a4), d1
  00708c  48c1                 ext.l     d1
  00708e  d280                 add.l     d0, d1
  007090  3f01                 move.w    d1, -(a7)
  007092  302a005a             move.w    $5a(a2), d0
  007096  48c0                 ext.l     d0
  007098  3214                 move.w    (a4), d1
  00709a  48c1                 ext.l     d1
  00709c  d280                 add.l     d0, d1
  00709e  3f01                 move.w    d1, -(a7)
  0070a0  302a005c             move.w    $5c(a2), d0
  0070a4  48c0                 ext.l     d0
  0070a6  322c0006             move.w    $6(a4), d1
  0070aa  48c1                 ext.l     d1
  0070ac  d280                 add.l     d0, d1
  0070ae  3f01                 move.w    d1, -(a7)
  0070b0  302a005a             move.w    $5a(a2), d0
  0070b4  48c0                 ext.l     d0
  0070b6  322c0004             move.w    $4(a4), d1
  0070ba  48c1                 ext.l     d1
  0070bc  d280                 add.l     d0, d1
  0070be  3f01                 move.w    d1, -(a7)
  0070c0  a8a7                 _SetRect  
  0070c2  486effe2             pea.l     -$1e(a6)
  0070c6  7014                 moveq     #$14, d0
  0070c8  c1c7                 muls.w    d7, d0
  0070ca  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  0070d0  30300806             move.w    $6(a0, d0.l), d0
  0070d4  48c0                 ext.l     d0
  0070d6  322b0002             move.w    $2(a3), d1
  0070da  48c1                 ext.l     d1
  0070dc  d280                 add.l     d0, d1
  0070de  3f01                 move.w    d1, -(a7)
  0070e0  7014                 moveq     #$14, d0
  0070e2  c1c7                 muls.w    d7, d0
  0070e4  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  0070ea  30300804             move.w    $4(a0, d0.l), d0
  0070ee  48c0                 ext.l     d0
  0070f0  3213                 move.w    (a3), d1
  0070f2  48c1                 ext.l     d1
  0070f4  d280                 add.l     d0, d1
  0070f6  3f01                 move.w    d1, -(a7)
  0070f8  7014                 moveq     #$14, d0
  0070fa  c1c7                 muls.w    d7, d0
  0070fc  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  007102  3030080a             move.w    $a(a0, d0.l), d0
  007106  48c0                 ext.l     d0
  007108  322b0002             move.w    $2(a3), d1
  00710c  48c1                 ext.l     d1
  00710e  d280                 add.l     d0, d1
  007110  3f01                 move.w    d1, -(a7)
  007112  7014                 moveq     #$14, d0
  007114  c1c7                 muls.w    d7, d0
  007116  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  00711c  30300808             move.w    $8(a0, d0.l), d0
  007120  48c0                 ext.l     d0
  007122  3213                 move.w    (a3), d1
  007124  48c1                 ext.l     d1
  007126  d280                 add.l     d0, d1
  007128  3f01                 move.w    d1, -(a7)
  00712a  a8a7                 _SetRect  
  00712c  302b0002             move.w    $2(a3), d0
  007130  48c0                 ext.l     d0
  007132  7210                 moveq     #$10, d1
  007134  d081                 add.l     d1, d0
  007136  3d40fff6             move.w    d0, -$a(a6)
  00713a  3013                 move.w    (a3), d0
  00713c  48c0                 ext.l     d0
  00713e  7210                 moveq     #$10, d1
  007140  d081                 add.l     d1, d0
  007142  3d40fff4             move.w    d0, -$c(a6)
  007146  206e0012             movea.l   $12(a6), a0
  00714a  30280002             move.w    $2(a0), d0
  00714e  48c0                 ext.l     d0
  007150  322a005c             move.w    $5c(a2), d1
  007154  48c1                 ext.l     d1
  007156  d280                 add.l     d0, d1
  007158  3d41fffe             move.w    d1, -$2(a6)
  00715c  206e0012             movea.l   $12(a6), a0
  007160  3010                 move.w    (a0), d0
  007162  48c0                 ext.l     d0
  007164  322a005a             move.w    $5a(a2), d1
  007168  48c1                 ext.l     d1
  00716a  d280                 add.l     d0, d1
  00716c  3d41fffc             move.w    d1, -$4(a6)
  007170  3007                 move.w    d7, d0
  007172  48c0                 ext.l     d0
  007174  0c800000000b         cmpi.l    #$b, d0
  00717a  62000bae             bhi.w     $7d2a
  00717e  303b0206             move.w    $7186(pc, d0.w * 2), d0
  007182  4efb0002             jmp       $7186(pc, d0.w)
  007186  0018005a009200ce010802120306040e cases     0:$719e 1:$71e0 2:$7218 3:$7254 4:$728e 5:$7398 6:$748c 7:$7594
  007196  085209f0052006c4     cases     8:$79d8 9:$7b76 10:$76a6 11:$784a
  00719e  4a6a0050             tst.w     $50(a2)
  0071a2  6c20                 bge.b     $71c4
  0071a4  4a2e0020             tst.b     $20(a6)
  0071a8  671a                 beq.b     $71c4
  0071aa  302a0050             move.w    $50(a2), d0
  0071ae  c1c3                 muls.w    d3, d0
  0071b0  e080                 asr.l     #$8, d0
  0071b2  4480                 neg.l     d0
  0071b4  35400050             move.w    d0, $50(a2)
  0071b8  302a004e             move.w    $4e(a2), d0
  0071bc  c1c3                 muls.w    d3, d0
  0071be  e080                 asr.l     #$8, d0
  0071c0  3540004e             move.w    d0, $4e(a2)
  0071c4  302c0002             move.w    $2(a4), d0
  0071c8  48c0                 ext.l     d0
  0071ca  322b0002             move.w    $2(a3), d1
  0071ce  48c1                 ext.l     d1
  0071d0  7410                 moveq     #$10, d2
  0071d2  d282                 add.l     d2, d1
  0071d4  9280                 sub.l     d0, d1
  0071d6  3541005c             move.w    d1, $5c(a2)
  0071da  7c01                 moveq     #$1, d6
  0071dc  60000e14             bra.w     $7ff2
  0071e0  4a6a004e             tst.w     $4e(a2)
  0071e4  6c1a                 bge.b     $7200
  0071e6  302a0050             move.w    $50(a2), d0
  0071ea  c1c3                 muls.w    d3, d0
  0071ec  e080                 asr.l     #$8, d0
  0071ee  35400050             move.w    d0, $50(a2)
  0071f2  302a004e             move.w    $4e(a2), d0
  0071f6  c1c3                 muls.w    d3, d0
  0071f8  e080                 asr.l     #$8, d0
  0071fa  4480                 neg.l     d0
  0071fc  3540004e             move.w    d0, $4e(a2)
  007200  3014                 move.w    (a4), d0
  007202  48c0                 ext.l     d0
  007204  3213                 move.w    (a3), d1
  007206  48c1                 ext.l     d1
  007208  7410                 moveq     #$10, d2
  00720a  d282                 add.l     d2, d1
  00720c  9280                 sub.l     d0, d1
  00720e  3541005a             move.w    d1, $5a(a2)
  007212  7c01                 moveq     #$1, d6
  007214  60000ddc             bra.w     $7ff2
  007218  4a6a0050             tst.w     $50(a2)
  00721c  6f1a                 ble.b     $7238
  00721e  302a0050             move.w    $50(a2), d0
  007222  c1c3                 muls.w    d3, d0
  007224  e080                 asr.l     #$8, d0
  007226  4480                 neg.l     d0
  007228  35400050             move.w    d0, $50(a2)
  00722c  302a004e             move.w    $4e(a2), d0
  007230  c1c3                 muls.w    d3, d0
  007232  e080                 asr.l     #$8, d0
  007234  3540004e             move.w    d0, $4e(a2)
  007238  302c0006             move.w    $6(a4), d0
  00723c  48c0                 ext.l     d0
  00723e  322b0002             move.w    $2(a3), d1
  007242  48c1                 ext.l     d1
  007244  7410                 moveq     #$10, d2
  007246  d282                 add.l     d2, d1
  007248  9280                 sub.l     d0, d1
  00724a  3541005c             move.w    d1, $5c(a2)
  00724e  7c01                 moveq     #$1, d6
  007250  60000da0             bra.w     $7ff2
  007254  4a6a004e             tst.w     $4e(a2)
  007258  6f1a                 ble.b     $7274
  00725a  302a0050             move.w    $50(a2), d0
  00725e  c1c3                 muls.w    d3, d0
  007260  e080                 asr.l     #$8, d0
  007262  35400050             move.w    d0, $50(a2)
  007266  302a004e             move.w    $4e(a2), d0
  00726a  c1c3                 muls.w    d3, d0
  00726c  e080                 asr.l     #$8, d0
  00726e  4480                 neg.l     d0
  007270  3540004e             move.w    d0, $4e(a2)
  007274  302c0004             move.w    $4(a4), d0
  007278  48c0                 ext.l     d0
  00727a  3213                 move.w    (a3), d1
  00727c  48c1                 ext.l     d1
  00727e  7410                 moveq     #$10, d2
  007280  d282                 add.l     d2, d1
  007282  9280                 sub.l     d0, d1
  007284  3541005a             move.w    d1, $5a(a2)
  007288  7c01                 moveq     #$1, d6
  00728a  60000d66             bra.w     $7ff2
  00728e  554f                 subq.w    #$2, a7
  007290  2f0a                 move.l    a2, -(a7)
  007292  2f13                 move.l    (a3), -(a7)
  007294  3f3c0028             move.w    #$28, -(a7)
  007298  2f2e001c             move.l    $1c(a6), -(a7)
  00729c  702e                 moveq     #$2e, d0
  00729e  c1c7                 muls.w    d7, d0
  0072a0  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0072a6  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0072aa  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0072b0  101f                 move.b    (a7)+, d0
  0072b2  1d40fff3             move.b    d0, -$d(a6)
  0072b6  4a2efff3             tst.b     -$d(a6)
  0072ba  67000d54             beq.w     $8010
  0072be  7c01                 moveq     #$1, d6
  0072c0  356a0004005c         move.w    $4(a2), $5c(a2)
  0072c6  356a0002005a         move.w    $2(a2), $5a(a2)
  0072cc  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  0072d2  3013                 move.w    (a3), d0
  0072d4  48c0                 ext.l     d0
  0072d6  7220                 moveq     #$20, d1
  0072d8  d081                 add.l     d1, d0
  0072da  3d40fff8             move.w    d0, -$8(a6)
  0072de  302efffa             move.w    -$6(a6), d0
  0072e2  48c0                 ext.l     d0
  0072e4  382efffe             move.w    -$2(a6), d4
  0072e8  48c4                 ext.l     d4
  0072ea  9880                 sub.l     d0, d4
  0072ec  302efffc             move.w    -$4(a6), d0
  0072f0  48c0                 ext.l     d0
  0072f2  3a2efff8             move.w    -$8(a6), d5
  0072f6  48c5                 ext.l     d5
  0072f8  9a80                 sub.l     d0, d5
  0072fa  b845                 cmp.w     d5, d4
  0072fc  6f4c                 ble.b     $734a
  0072fe  0c450008             cmpi.w    #$8, d5
  007302  6f0e                 ble.b     $7312
  007304  4a6a0050             tst.w     $50(a2)
  007308  6c08                 bge.b     $7312
  00730a  7803                 moveq     #$3, d4
  00730c  7a0c                 moveq     #$c, d5
  00730e  60000c38             bra.w     $7f48
  007312  4a6a0050             tst.w     $50(a2)
  007316  6c1a                 bge.b     $7332
  007318  302a0050             move.w    $50(a2), d0
  00731c  c1c3                 muls.w    d3, d0
  00731e  e080                 asr.l     #$8, d0
  007320  4480                 neg.l     d0
  007322  35400050             move.w    d0, $50(a2)
  007326  302a004e             move.w    $4e(a2), d0
  00732a  c1c3                 muls.w    d3, d0
  00732c  e080                 asr.l     #$8, d0
  00732e  3540004e             move.w    d0, $4e(a2)
  007332  302c0002             move.w    $2(a4), d0
  007336  48c0                 ext.l     d0
  007338  322b0002             move.w    $2(a3), d1
  00733c  48c1                 ext.l     d1
  00733e  7410                 moveq     #$10, d2
  007340  d282                 add.l     d2, d1
  007342  9280                 sub.l     d0, d1
  007344  3541005c             move.w    d1, $5c(a2)
  007348  6048                 bra.b     $7392
  00734a  0c440008             cmpi.w    #$8, d4
  00734e  6f0e                 ble.b     $735e
  007350  4a6a004e             tst.w     $4e(a2)
  007354  6f08                 ble.b     $735e
  007356  7803                 moveq     #$3, d4
  007358  7a0c                 moveq     #$c, d5
  00735a  60000bec             bra.w     $7f48
  00735e  4a6a004e             tst.w     $4e(a2)
  007362  6f1a                 ble.b     $737e
  007364  302a0050             move.w    $50(a2), d0
  007368  c1c3                 muls.w    d3, d0
  00736a  e080                 asr.l     #$8, d0
  00736c  35400050             move.w    d0, $50(a2)
  007370  302a004e             move.w    $4e(a2), d0
  007374  c1c3                 muls.w    d3, d0
  007376  e080                 asr.l     #$8, d0
  007378  4480                 neg.l     d0
  00737a  3540004e             move.w    d0, $4e(a2)
  00737e  302c0004             move.w    $4(a4), d0
  007382  48c0                 ext.l     d0
  007384  3213                 move.w    (a3), d1
  007386  48c1                 ext.l     d1
  007388  7410                 moveq     #$10, d2
  00738a  d282                 add.l     d2, d1
  00738c  9280                 sub.l     d0, d1
  00738e  3541005a             move.w    d1, $5a(a2)
  007392  7c01                 moveq     #$1, d6
  007394  60000c5c             bra.w     $7ff2
  007398  554f                 subq.w    #$2, a7
  00739a  2f0a                 move.l    a2, -(a7)
  00739c  2f13                 move.l    (a3), -(a7)
  00739e  3f3c0028             move.w    #$28, -(a7)
  0073a2  2f2e001c             move.l    $1c(a6), -(a7)
  0073a6  702e                 moveq     #$2e, d0
  0073a8  c1c7                 muls.w    d7, d0
  0073aa  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0073b0  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0073b4  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0073ba  101f                 move.b    (a7)+, d0
  0073bc  1d40fff3             move.b    d0, -$d(a6)
  0073c0  4a2efff3             tst.b     -$d(a6)
  0073c4  67000c4a             beq.w     $8010
  0073c8  7c01                 moveq     #$1, d6
  0073ca  356a0004005c         move.w    $4(a2), $5c(a2)
  0073d0  356a0002005a         move.w    $2(a2), $5a(a2)
  0073d6  302b0002             move.w    $2(a3), d0
  0073da  48c0                 ext.l     d0
  0073dc  382efffe             move.w    -$2(a6), d4
  0073e0  48c4                 ext.l     d4
  0073e2  9880                 sub.l     d0, d4
  0073e4  3013                 move.w    (a3), d0
  0073e6  48c0                 ext.l     d0
  0073e8  3a2efffc             move.w    -$4(a6), d5
  0073ec  48c5                 ext.l     d5
  0073ee  9a80                 sub.l     d0, d5
  0073f0  b845                 cmp.w     d5, d4
  0073f2  6f4c                 ble.b     $7440
  0073f4  0c450008             cmpi.w    #$8, d5
  0073f8  6f0e                 ble.b     $7408
  0073fa  4a6a0050             tst.w     $50(a2)
  0073fe  6c08                 bge.b     $7408
  007400  7803                 moveq     #$3, d4
  007402  7a0d                 moveq     #$d, d5
  007404  60000b42             bra.w     $7f48
  007408  4a6a0050             tst.w     $50(a2)
  00740c  6c1a                 bge.b     $7428
  00740e  302a0050             move.w    $50(a2), d0
  007412  c1c3                 muls.w    d3, d0
  007414  e080                 asr.l     #$8, d0
  007416  4480                 neg.l     d0
  007418  35400050             move.w    d0, $50(a2)
  00741c  302a004e             move.w    $4e(a2), d0
  007420  c1c3                 muls.w    d3, d0
  007422  e080                 asr.l     #$8, d0
  007424  3540004e             move.w    d0, $4e(a2)
  007428  302c0002             move.w    $2(a4), d0
  00742c  48c0                 ext.l     d0
  00742e  322b0002             move.w    $2(a3), d1
  007432  48c1                 ext.l     d1
  007434  7410                 moveq     #$10, d2
  007436  d282                 add.l     d2, d1
  007438  9280                 sub.l     d0, d1
  00743a  3541005c             move.w    d1, $5c(a2)
  00743e  6046                 bra.b     $7486
  007440  0c440008             cmpi.w    #$8, d4
  007444  6f0e                 ble.b     $7454
  007446  4a6a004e             tst.w     $4e(a2)
  00744a  6c08                 bge.b     $7454
  00744c  7803                 moveq     #$3, d4
  00744e  7a0d                 moveq     #$d, d5
  007450  60000af6             bra.w     $7f48
  007454  4a6a004e             tst.w     $4e(a2)
  007458  6c1a                 bge.b     $7474
  00745a  302a0050             move.w    $50(a2), d0
  00745e  c1c3                 muls.w    d3, d0
  007460  e080                 asr.l     #$8, d0
  007462  35400050             move.w    d0, $50(a2)
  007466  302a004e             move.w    $4e(a2), d0
  00746a  c1c3                 muls.w    d3, d0
  00746c  e080                 asr.l     #$8, d0
  00746e  4480                 neg.l     d0
  007470  3540004e             move.w    d0, $4e(a2)
  007474  3014                 move.w    (a4), d0
  007476  48c0                 ext.l     d0
  007478  3213                 move.w    (a3), d1
  00747a  48c1                 ext.l     d1
  00747c  7410                 moveq     #$10, d2
  00747e  d282                 add.l     d2, d1
  007480  9280                 sub.l     d0, d1
  007482  3541005a             move.w    d1, $5a(a2)
  007486  7c01                 moveq     #$1, d6
  007488  60000b68             bra.w     $7ff2
  00748c  554f                 subq.w    #$2, a7
  00748e  2f0a                 move.l    a2, -(a7)
  007490  2f13                 move.l    (a3), -(a7)
  007492  3f3c0028             move.w    #$28, -(a7)
  007496  2f2e001c             move.l    $1c(a6), -(a7)
  00749a  702e                 moveq     #$2e, d0
  00749c  c1c7                 muls.w    d7, d0
  00749e  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0074a4  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0074a8  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0074ae  101f                 move.b    (a7)+, d0
  0074b0  1d40fff3             move.b    d0, -$d(a6)
  0074b4  4a2efff3             tst.b     -$d(a6)
  0074b8  67000b56             beq.w     $8010
  0074bc  7c01                 moveq     #$1, d6
  0074be  356a0004005c         move.w    $4(a2), $5c(a2)
  0074c4  356a0002005a         move.w    $2(a2), $5a(a2)
  0074ca  302b0002             move.w    $2(a3), d0
  0074ce  48c0                 ext.l     d0
  0074d0  7220                 moveq     #$20, d1
  0074d2  d081                 add.l     d1, d0
  0074d4  3d40fffa             move.w    d0, -$6(a6)
  0074d8  3d53fff8             move.w    (a3), -$8(a6)
  0074dc  302efffe             move.w    -$2(a6), d0
  0074e0  48c0                 ext.l     d0
  0074e2  382efffa             move.w    -$6(a6), d4
  0074e6  48c4                 ext.l     d4
  0074e8  9880                 sub.l     d0, d4
  0074ea  302efff8             move.w    -$8(a6), d0
  0074ee  48c0                 ext.l     d0
  0074f0  3a2efffc             move.w    -$4(a6), d5
  0074f4  48c5                 ext.l     d5
  0074f6  9a80                 sub.l     d0, d5
  0074f8  b845                 cmp.w     d5, d4
  0074fa  6f4c                 ble.b     $7548
  0074fc  0c450008             cmpi.w    #$8, d5
  007500  6f0e                 ble.b     $7510
  007502  4a6a0050             tst.w     $50(a2)
  007506  6f08                 ble.b     $7510
  007508  7803                 moveq     #$3, d4
  00750a  7a0e                 moveq     #$e, d5
  00750c  60000a3a             bra.w     $7f48
  007510  4a6a0050             tst.w     $50(a2)
  007514  6f1a                 ble.b     $7530
  007516  302a0050             move.w    $50(a2), d0
  00751a  c1c3                 muls.w    d3, d0
  00751c  e080                 asr.l     #$8, d0
  00751e  4480                 neg.l     d0
  007520  35400050             move.w    d0, $50(a2)
  007524  302a004e             move.w    $4e(a2), d0
  007528  c1c3                 muls.w    d3, d0
  00752a  e080                 asr.l     #$8, d0
  00752c  3540004e             move.w    d0, $4e(a2)
  007530  302c0006             move.w    $6(a4), d0
  007534  48c0                 ext.l     d0
  007536  322b0002             move.w    $2(a3), d1
  00753a  48c1                 ext.l     d1
  00753c  7410                 moveq     #$10, d2
  00753e  d282                 add.l     d2, d1
  007540  9280                 sub.l     d0, d1
  007542  3541005c             move.w    d1, $5c(a2)
  007546  6046                 bra.b     $758e
  007548  0c440008             cmpi.w    #$8, d4
  00754c  6f0e                 ble.b     $755c
  00754e  4a6a004e             tst.w     $4e(a2)
  007552  6c08                 bge.b     $755c
  007554  7803                 moveq     #$3, d4
  007556  7a0e                 moveq     #$e, d5
  007558  600009ee             bra.w     $7f48
  00755c  4a6a004e             tst.w     $4e(a2)
  007560  6c1a                 bge.b     $757c
  007562  302a0050             move.w    $50(a2), d0
  007566  c1c3                 muls.w    d3, d0
  007568  e080                 asr.l     #$8, d0
  00756a  35400050             move.w    d0, $50(a2)
  00756e  302a004e             move.w    $4e(a2), d0
  007572  c1c3                 muls.w    d3, d0
  007574  e080                 asr.l     #$8, d0
  007576  4480                 neg.l     d0
  007578  3540004e             move.w    d0, $4e(a2)
  00757c  3014                 move.w    (a4), d0
  00757e  48c0                 ext.l     d0
  007580  3213                 move.w    (a3), d1
  007582  48c1                 ext.l     d1
  007584  7410                 moveq     #$10, d2
  007586  d282                 add.l     d2, d1
  007588  9280                 sub.l     d0, d1
  00758a  3541005a             move.w    d1, $5a(a2)
  00758e  7c01                 moveq     #$1, d6
  007590  60000a60             bra.w     $7ff2
  007594  554f                 subq.w    #$2, a7
  007596  2f0a                 move.l    a2, -(a7)
  007598  2f13                 move.l    (a3), -(a7)
  00759a  3f3c0028             move.w    #$28, -(a7)
  00759e  2f2e001c             move.l    $1c(a6), -(a7)
  0075a2  702e                 moveq     #$2e, d0
  0075a4  c1c7                 muls.w    d7, d0
  0075a6  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  0075ac  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  0075b0  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0075b6  101f                 move.b    (a7)+, d0
  0075b8  1d40fff3             move.b    d0, -$d(a6)
  0075bc  4a2efff3             tst.b     -$d(a6)
  0075c0  67000a4e             beq.w     $8010
  0075c4  7c01                 moveq     #$1, d6
  0075c6  356a0004005c         move.w    $4(a2), $5c(a2)
  0075cc  356a0002005a         move.w    $2(a2), $5a(a2)
  0075d2  302b0002             move.w    $2(a3), d0
  0075d6  48c0                 ext.l     d0
  0075d8  7220                 moveq     #$20, d1
  0075da  d081                 add.l     d1, d0
  0075dc  3d40fffa             move.w    d0, -$6(a6)
  0075e0  3013                 move.w    (a3), d0
  0075e2  48c0                 ext.l     d0
  0075e4  7220                 moveq     #$20, d1
  0075e6  d081                 add.l     d1, d0
  0075e8  3d40fff8             move.w    d0, -$8(a6)
  0075ec  302efffe             move.w    -$2(a6), d0
  0075f0  48c0                 ext.l     d0
  0075f2  382efffa             move.w    -$6(a6), d4
  0075f6  48c4                 ext.l     d4
  0075f8  9880                 sub.l     d0, d4
  0075fa  302efffc             move.w    -$4(a6), d0
  0075fe  48c0                 ext.l     d0
  007600  3a2efff8             move.w    -$8(a6), d5
  007604  48c5                 ext.l     d5
  007606  9a80                 sub.l     d0, d5
  007608  b845                 cmp.w     d5, d4
  00760a  6f4c                 ble.b     $7658
  00760c  0c450008             cmpi.w    #$8, d5
  007610  6f0e                 ble.b     $7620
  007612  4a6a0050             tst.w     $50(a2)
  007616  6f08                 ble.b     $7620
  007618  7803                 moveq     #$3, d4
  00761a  7a0f                 moveq     #$f, d5
  00761c  6000092a             bra.w     $7f48
  007620  4a6a0050             tst.w     $50(a2)
  007624  6f1a                 ble.b     $7640
  007626  302a0050             move.w    $50(a2), d0
  00762a  c1c3                 muls.w    d3, d0
  00762c  e080                 asr.l     #$8, d0
  00762e  4480                 neg.l     d0
  007630  35400050             move.w    d0, $50(a2)
  007634  302a004e             move.w    $4e(a2), d0
  007638  c1c3                 muls.w    d3, d0
  00763a  e080                 asr.l     #$8, d0
  00763c  3540004e             move.w    d0, $4e(a2)
  007640  302c0006             move.w    $6(a4), d0
  007644  48c0                 ext.l     d0
  007646  322b0002             move.w    $2(a3), d1
  00764a  48c1                 ext.l     d1
  00764c  7410                 moveq     #$10, d2
  00764e  d282                 add.l     d2, d1
  007650  9280                 sub.l     d0, d1
  007652  3541005c             move.w    d1, $5c(a2)
  007656  6048                 bra.b     $76a0
  007658  0c440008             cmpi.w    #$8, d4
  00765c  6f0e                 ble.b     $766c
  00765e  4a6a004e             tst.w     $4e(a2)
  007662  6f08                 ble.b     $766c
  007664  7803                 moveq     #$3, d4
  007666  7a0f                 moveq     #$f, d5
  007668  600008de             bra.w     $7f48
  00766c  4a6a004e             tst.w     $4e(a2)
  007670  6f1a                 ble.b     $768c
  007672  302a0050             move.w    $50(a2), d0
  007676  c1c3                 muls.w    d3, d0
  007678  e080                 asr.l     #$8, d0
  00767a  35400050             move.w    d0, $50(a2)
  00767e  302a004e             move.w    $4e(a2), d0
  007682  c1c3                 muls.w    d3, d0
  007684  e080                 asr.l     #$8, d0
  007686  4480                 neg.l     d0
  007688  3540004e             move.w    d0, $4e(a2)
  00768c  302c0004             move.w    $4(a4), d0
  007690  48c0                 ext.l     d0
  007692  3213                 move.w    (a3), d1
  007694  48c1                 ext.l     d1
  007696  7410                 moveq     #$10, d2
  007698  d282                 add.l     d2, d1
  00769a  9280                 sub.l     d0, d1
  00769c  3541005a             move.w    d1, $5a(a2)
  0076a0  7c01                 moveq     #$1, d6
  0076a2  6000094e             bra.w     $7ff2
  0076a6  486effe2             pea.l     -$1e(a6)
  0076aa  3f2b0002             move.w    $2(a3), -(a7)
  0076ae  3f13                 move.w    (a3), -(a7)
  0076b0  302b0002             move.w    $2(a3), d0
  0076b4  48c0                 ext.l     d0
  0076b6  7210                 moveq     #$10, d1
  0076b8  d081                 add.l     d1, d0
  0076ba  3f00                 move.w    d0, -(a7)
  0076bc  3013                 move.w    (a3), d0
  0076be  48c0                 ext.l     d0
  0076c0  7220                 moveq     #$20, d1
  0076c2  d081                 add.l     d1, d0
  0076c4  3f00                 move.w    d0, -(a7)
  0076c6  a8a7                 _SetRect  
  0076c8  486effd2             pea.l     -$2e(a6)
  0076cc  3f2b0002             move.w    $2(a3), -(a7)
  0076d0  3013                 move.w    (a3), d0
  0076d2  48c0                 ext.l     d0
  0076d4  7210                 moveq     #$10, d1
  0076d6  d081                 add.l     d1, d0
  0076d8  3f00                 move.w    d0, -(a7)
  0076da  302b0002             move.w    $2(a3), d0
  0076de  48c0                 ext.l     d0
  0076e0  7220                 moveq     #$20, d1
  0076e2  d081                 add.l     d1, d0
  0076e4  3f00                 move.w    d0, -(a7)
  0076e6  3013                 move.w    (a3), d0
  0076e8  48c0                 ext.l     d0
  0076ea  7220                 moveq     #$20, d1
  0076ec  d081                 add.l     d1, d0
  0076ee  3f00                 move.w    d0, -(a7)
  0076f0  a8a7                 _SetRect  
  0076f2  554f                 subq.w    #$2, a7
  0076f4  486effea             pea.l     -$16(a6)
  0076f8  486effe2             pea.l     -$1e(a6)
  0076fc  486effda             pea.l     -$26(a6)
  007700  a8aa                 _SectRect 
  007702  101f                 move.b    (a7)+, d0
  007704  6616                 bne.b     $771c
  007706  554f                 subq.w    #$2, a7
  007708  486effea             pea.l     -$16(a6)
  00770c  486effd2             pea.l     -$2e(a6)
  007710  486effda             pea.l     -$26(a6)
  007714  a8aa                 _SectRect 
  007716  101f                 move.b    (a7)+, d0
  007718  670008d8             beq.w     $7ff2
  00771c  206e0012             movea.l   $12(a6), a0
  007720  30280002             move.w    $2(a0), d0
  007724  48c0                 ext.l     d0
  007726  322a005c             move.w    $5c(a2), d1
  00772a  48c1                 ext.l     d1
  00772c  d280                 add.l     d0, d1
  00772e  3d41fffe             move.w    d1, -$2(a6)
  007732  206e0012             movea.l   $12(a6), a0
  007736  3010                 move.w    (a0), d0
  007738  48c0                 ext.l     d0
  00773a  322a005a             move.w    $5a(a2), d1
  00773e  48c1                 ext.l     d1
  007740  d280                 add.l     d0, d1
  007742  3d41fffc             move.w    d1, -$4(a6)
  007746  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  00774c  3013                 move.w    (a3), d0
  00774e  48c0                 ext.l     d0
  007750  7220                 moveq     #$20, d1
  007752  d081                 add.l     d1, d0
  007754  3d40fff8             move.w    d0, -$8(a6)
  007758  302efffa             move.w    -$6(a6), d0
  00775c  48c0                 ext.l     d0
  00775e  382efffe             move.w    -$2(a6), d4
  007762  48c4                 ext.l     d4
  007764  9880                 sub.l     d0, d4
  007766  302efffc             move.w    -$4(a6), d0
  00776a  48c0                 ext.l     d0
  00776c  3a2efff8             move.w    -$8(a6), d5
  007770  48c5                 ext.l     d5
  007772  9a80                 sub.l     d0, d5
  007774  b845                 cmp.w     d5, d4
  007776  6c38                 bge.b     $77b0
  007778  4a6a0050             tst.w     $50(a2)
  00777c  6c1a                 bge.b     $7798
  00777e  302a0050             move.w    $50(a2), d0
  007782  c1c3                 muls.w    d3, d0
  007784  e080                 asr.l     #$8, d0
  007786  4480                 neg.l     d0
  007788  35400050             move.w    d0, $50(a2)
  00778c  302a004e             move.w    $4e(a2), d0
  007790  c1c3                 muls.w    d3, d0
  007792  e080                 asr.l     #$8, d0
  007794  3540004e             move.w    d0, $4e(a2)
  007798  302c0002             move.w    $2(a4), d0
  00779c  48c0                 ext.l     d0
  00779e  322b0002             move.w    $2(a3), d1
  0077a2  48c1                 ext.l     d1
  0077a4  7410                 moveq     #$10, d2
  0077a6  d282                 add.l     d2, d1
  0077a8  9280                 sub.l     d0, d1
  0077aa  3541005c             move.w    d1, $5c(a2)
  0077ae  6034                 bra.b     $77e4
  0077b0  4a6a004e             tst.w     $4e(a2)
  0077b4  6f1a                 ble.b     $77d0
  0077b6  302a0050             move.w    $50(a2), d0
  0077ba  c1c3                 muls.w    d3, d0
  0077bc  e080                 asr.l     #$8, d0
  0077be  35400050             move.w    d0, $50(a2)
  0077c2  302a004e             move.w    $4e(a2), d0
  0077c6  c1c3                 muls.w    d3, d0
  0077c8  e080                 asr.l     #$8, d0
  0077ca  4480                 neg.l     d0
  0077cc  3540004e             move.w    d0, $4e(a2)
  0077d0  302c0004             move.w    $4(a4), d0
  0077d4  48c0                 ext.l     d0
  0077d6  3213                 move.w    (a3), d1
  0077d8  48c1                 ext.l     d1
  0077da  7410                 moveq     #$10, d2
  0077dc  d282                 add.l     d2, d1
  0077de  9280                 sub.l     d0, d1
  0077e0  3541005a             move.w    d1, $5a(a2)
  0077e4  302c0002             move.w    $2(a4), d0
  0077e8  48c0                 ext.l     d0
  0077ea  322b0002             move.w    $2(a3), d1
  0077ee  48c1                 ext.l     d1
  0077f0  7410                 moveq     #$10, d2
  0077f2  d282                 add.l     d2, d1
  0077f4  9280                 sub.l     d0, d1
  0077f6  302a005c             move.w    $5c(a2), d0
  0077fa  48c0                 ext.l     d0
  0077fc  b081                 cmp.l     d1, d0
  0077fe  6c16                 bge.b     $7816
  007800  302c0002             move.w    $2(a4), d0
  007804  48c0                 ext.l     d0
  007806  322b0002             move.w    $2(a3), d1
  00780a  48c1                 ext.l     d1
  00780c  7410                 moveq     #$10, d2
  00780e  d282                 add.l     d2, d1
  007810  9280                 sub.l     d0, d1
  007812  3541005c             move.w    d1, $5c(a2)
  007816  302c0004             move.w    $4(a4), d0
  00781a  48c0                 ext.l     d0
  00781c  3213                 move.w    (a3), d1
  00781e  48c1                 ext.l     d1
  007820  7410                 moveq     #$10, d2
  007822  d282                 add.l     d2, d1
  007824  9280                 sub.l     d0, d1
  007826  302a005a             move.w    $5a(a2), d0
  00782a  48c0                 ext.l     d0
  00782c  b081                 cmp.l     d1, d0
  00782e  6f14                 ble.b     $7844
  007830  302c0004             move.w    $4(a4), d0
  007834  48c0                 ext.l     d0
  007836  3213                 move.w    (a3), d1
  007838  48c1                 ext.l     d1
  00783a  7410                 moveq     #$10, d2
  00783c  d282                 add.l     d2, d1
  00783e  9280                 sub.l     d0, d1
  007840  3541005a             move.w    d1, $5a(a2)
  007844  7c01                 moveq     #$1, d6
  007846  600007aa             bra.w     $7ff2
  00784a  486effe2             pea.l     -$1e(a6)
  00784e  3f2b0002             move.w    $2(a3), -(a7)
  007852  3f13                 move.w    (a3), -(a7)
  007854  302b0002             move.w    $2(a3), d0
  007858  48c0                 ext.l     d0
  00785a  7220                 moveq     #$20, d1
  00785c  d081                 add.l     d1, d0
  00785e  3f00                 move.w    d0, -(a7)
  007860  3013                 move.w    (a3), d0
  007862  48c0                 ext.l     d0
  007864  7210                 moveq     #$10, d1
  007866  d081                 add.l     d1, d0
  007868  3f00                 move.w    d0, -(a7)
  00786a  a8a7                 _SetRect  
  00786c  486effd2             pea.l     -$2e(a6)
  007870  3f2b0002             move.w    $2(a3), -(a7)
  007874  3f13                 move.w    (a3), -(a7)
  007876  302b0002             move.w    $2(a3), d0
  00787a  48c0                 ext.l     d0
  00787c  7210                 moveq     #$10, d1
  00787e  d081                 add.l     d1, d0
  007880  3f00                 move.w    d0, -(a7)
  007882  3013                 move.w    (a3), d0
  007884  48c0                 ext.l     d0
  007886  7220                 moveq     #$20, d1
  007888  d081                 add.l     d1, d0
  00788a  3f00                 move.w    d0, -(a7)
  00788c  a8a7                 _SetRect  
  00788e  554f                 subq.w    #$2, a7
  007890  486effea             pea.l     -$16(a6)
  007894  486effe2             pea.l     -$1e(a6)
  007898  486effda             pea.l     -$26(a6)
  00789c  a8aa                 _SectRect 
  00789e  101f                 move.b    (a7)+, d0
  0078a0  6616                 bne.b     $78b8
  0078a2  554f                 subq.w    #$2, a7
  0078a4  486effea             pea.l     -$16(a6)
  0078a8  486effd2             pea.l     -$2e(a6)
  0078ac  486effda             pea.l     -$26(a6)
  0078b0  a8aa                 _SectRect 
  0078b2  101f                 move.b    (a7)+, d0
  0078b4  6700073c             beq.w     $7ff2
  0078b8  206e0012             movea.l   $12(a6), a0
  0078bc  30280002             move.w    $2(a0), d0
  0078c0  48c0                 ext.l     d0
  0078c2  322a005c             move.w    $5c(a2), d1
  0078c6  48c1                 ext.l     d1
  0078c8  d280                 add.l     d0, d1
  0078ca  3d41fffe             move.w    d1, -$2(a6)
  0078ce  206e0012             movea.l   $12(a6), a0
  0078d2  3010                 move.w    (a0), d0
  0078d4  48c0                 ext.l     d0
  0078d6  322a005a             move.w    $5a(a2), d1
  0078da  48c1                 ext.l     d1
  0078dc  d280                 add.l     d0, d1
  0078de  3d41fffc             move.w    d1, -$4(a6)
  0078e2  3d6b0002fffa         move.w    $2(a3), -$6(a6)
  0078e8  3d53fff8             move.w    (a3), -$8(a6)
  0078ec  302efffa             move.w    -$6(a6), d0
  0078f0  48c0                 ext.l     d0
  0078f2  382efffe             move.w    -$2(a6), d4
  0078f6  48c4                 ext.l     d4
  0078f8  9880                 sub.l     d0, d4
  0078fa  302efff8             move.w    -$8(a6), d0
  0078fe  48c0                 ext.l     d0
  007900  3a2efffc             move.w    -$4(a6), d5
  007904  48c5                 ext.l     d5
  007906  9a80                 sub.l     d0, d5
  007908  b845                 cmp.w     d5, d4
  00790a  6c38                 bge.b     $7944
  00790c  4a6a0050             tst.w     $50(a2)
  007910  6c1a                 bge.b     $792c
  007912  302a0050             move.w    $50(a2), d0
  007916  c1c3                 muls.w    d3, d0
  007918  e080                 asr.l     #$8, d0
  00791a  4480                 neg.l     d0
  00791c  35400050             move.w    d0, $50(a2)
  007920  302a004e             move.w    $4e(a2), d0
  007924  c1c3                 muls.w    d3, d0
  007926  e080                 asr.l     #$8, d0
  007928  3540004e             move.w    d0, $4e(a2)
  00792c  302c0002             move.w    $2(a4), d0
  007930  48c0                 ext.l     d0
  007932  322b0002             move.w    $2(a3), d1
  007936  48c1                 ext.l     d1
  007938  7410                 moveq     #$10, d2
  00793a  d282                 add.l     d2, d1
  00793c  9280                 sub.l     d0, d1
  00793e  3541005c             move.w    d1, $5c(a2)
  007942  6032                 bra.b     $7976
  007944  4a6a004e             tst.w     $4e(a2)
  007948  6c1a                 bge.b     $7964
  00794a  302a0050             move.w    $50(a2), d0
  00794e  c1c3                 muls.w    d3, d0
  007950  e080                 asr.l     #$8, d0
  007952  35400050             move.w    d0, $50(a2)
  007956  302a004e             move.w    $4e(a2), d0
  00795a  c1c3                 muls.w    d3, d0
  00795c  e080                 asr.l     #$8, d0
  00795e  4480                 neg.l     d0
  007960  3540004e             move.w    d0, $4e(a2)
  007964  3014                 move.w    (a4), d0
  007966  48c0                 ext.l     d0
  007968  3213                 move.w    (a3), d1
  00796a  48c1                 ext.l     d1
  00796c  7410                 moveq     #$10, d2
  00796e  d282                 add.l     d2, d1
  007970  9280                 sub.l     d0, d1
  007972  3541005a             move.w    d1, $5a(a2)
  007976  302c0002             move.w    $2(a4), d0
  00797a  48c0                 ext.l     d0
  00797c  322b0002             move.w    $2(a3), d1
  007980  48c1                 ext.l     d1
  007982  7410                 moveq     #$10, d2
  007984  d282                 add.l     d2, d1
  007986  9280                 sub.l     d0, d1
  007988  302a005c             move.w    $5c(a2), d0
  00798c  48c0                 ext.l     d0
  00798e  b081                 cmp.l     d1, d0
  007990  6c16                 bge.b     $79a8
  007992  302c0002             move.w    $2(a4), d0
  007996  48c0                 ext.l     d0
  007998  322b0002             move.w    $2(a3), d1
  00799c  48c1                 ext.l     d1
  00799e  7410                 moveq     #$10, d2
  0079a0  d282                 add.l     d2, d1
  0079a2  9280                 sub.l     d0, d1
  0079a4  3541005c             move.w    d1, $5c(a2)
  0079a8  3014                 move.w    (a4), d0
  0079aa  48c0                 ext.l     d0
  0079ac  3213                 move.w    (a3), d1
  0079ae  48c1                 ext.l     d1
  0079b0  7410                 moveq     #$10, d2
  0079b2  d282                 add.l     d2, d1
  0079b4  9280                 sub.l     d0, d1
  0079b6  302a005a             move.w    $5a(a2), d0
  0079ba  48c0                 ext.l     d0
  0079bc  b081                 cmp.l     d1, d0
  0079be  6c12                 bge.b     $79d2
  0079c0  3014                 move.w    (a4), d0
  0079c2  48c0                 ext.l     d0
  0079c4  3213                 move.w    (a3), d1
  0079c6  48c1                 ext.l     d1
  0079c8  7410                 moveq     #$10, d2
  0079ca  d282                 add.l     d2, d1
  0079cc  9280                 sub.l     d0, d1
  0079ce  3541005a             move.w    d1, $5a(a2)
  0079d2  7c01                 moveq     #$1, d6
  0079d4  6000061c             bra.w     $7ff2
  0079d8  486effe2             pea.l     -$1e(a6)
  0079dc  3f2b0002             move.w    $2(a3), -(a7)
  0079e0  3f13                 move.w    (a3), -(a7)
  0079e2  302b0002             move.w    $2(a3), d0
  0079e6  48c0                 ext.l     d0
  0079e8  7220                 moveq     #$20, d1
  0079ea  d081                 add.l     d1, d0
  0079ec  3f00                 move.w    d0, -(a7)
  0079ee  3013                 move.w    (a3), d0
  0079f0  48c0                 ext.l     d0
  0079f2  7210                 moveq     #$10, d1
  0079f4  d081                 add.l     d1, d0
  0079f6  3f00                 move.w    d0, -(a7)
  0079f8  a8a7                 _SetRect  
  0079fa  486effd2             pea.l     -$2e(a6)
  0079fe  302b0002             move.w    $2(a3), d0
  007a02  48c0                 ext.l     d0
  007a04  7210                 moveq     #$10, d1
  007a06  d081                 add.l     d1, d0
  007a08  3f00                 move.w    d0, -(a7)
  007a0a  3f13                 move.w    (a3), -(a7)
  007a0c  302b0002             move.w    $2(a3), d0
  007a10  48c0                 ext.l     d0
  007a12  7220                 moveq     #$20, d1
  007a14  d081                 add.l     d1, d0
  007a16  3f00                 move.w    d0, -(a7)
  007a18  3013                 move.w    (a3), d0
  007a1a  48c0                 ext.l     d0
  007a1c  7220                 moveq     #$20, d1
  007a1e  d081                 add.l     d1, d0
  007a20  3f00                 move.w    d0, -(a7)
  007a22  a8a7                 _SetRect  
  007a24  554f                 subq.w    #$2, a7
  007a26  486effea             pea.l     -$16(a6)
  007a2a  486effe2             pea.l     -$1e(a6)
  007a2e  486effda             pea.l     -$26(a6)
  007a32  a8aa                 _SectRect 
  007a34  101f                 move.b    (a7)+, d0
  007a36  6616                 bne.b     $7a4e
  007a38  554f                 subq.w    #$2, a7
  007a3a  486effea             pea.l     -$16(a6)
  007a3e  486effd2             pea.l     -$2e(a6)
  007a42  486effda             pea.l     -$26(a6)
  007a46  a8aa                 _SectRect 
  007a48  101f                 move.b    (a7)+, d0
  007a4a  670005a6             beq.w     $7ff2
  007a4e  206e0012             movea.l   $12(a6), a0
  007a52  30280002             move.w    $2(a0), d0
  007a56  48c0                 ext.l     d0
  007a58  322a005c             move.w    $5c(a2), d1
  007a5c  48c1                 ext.l     d1
  007a5e  d280                 add.l     d0, d1
  007a60  3d41fffe             move.w    d1, -$2(a6)
  007a64  206e0012             movea.l   $12(a6), a0
  007a68  3010                 move.w    (a0), d0
  007a6a  48c0                 ext.l     d0
  007a6c  322a005a             move.w    $5a(a2), d1
  007a70  48c1                 ext.l     d1
  007a72  d280                 add.l     d0, d1
  007a74  3d41fffc             move.w    d1, -$4(a6)
  007a78  302b0002             move.w    $2(a3), d0
  007a7c  48c0                 ext.l     d0
  007a7e  7220                 moveq     #$20, d1
  007a80  d081                 add.l     d1, d0
  007a82  3d40fffa             move.w    d0, -$6(a6)
  007a86  3d53fff8             move.w    (a3), -$8(a6)
  007a8a  302efffe             move.w    -$2(a6), d0
  007a8e  48c0                 ext.l     d0
  007a90  382efffa             move.w    -$6(a6), d4
  007a94  48c4                 ext.l     d4
  007a96  9880                 sub.l     d0, d4
  007a98  302efff8             move.w    -$8(a6), d0
  007a9c  48c0                 ext.l     d0
  007a9e  3a2efffc             move.w    -$4(a6), d5
  007aa2  48c5                 ext.l     d5
  007aa4  9a80                 sub.l     d0, d5
  007aa6  b845                 cmp.w     d5, d4
  007aa8  6c38                 bge.b     $7ae2
  007aaa  4a6a0050             tst.w     $50(a2)
  007aae  6f1a                 ble.b     $7aca
  007ab0  302a0050             move.w    $50(a2), d0
  007ab4  c1c3                 muls.w    d3, d0
  007ab6  e080                 asr.l     #$8, d0
  007ab8  4480                 neg.l     d0
  007aba  35400050             move.w    d0, $50(a2)
  007abe  302a004e             move.w    $4e(a2), d0
  007ac2  c1c3                 muls.w    d3, d0
  007ac4  e080                 asr.l     #$8, d0
  007ac6  3540004e             move.w    d0, $4e(a2)
  007aca  302c0006             move.w    $6(a4), d0
  007ace  48c0                 ext.l     d0
  007ad0  322b0002             move.w    $2(a3), d1
  007ad4  48c1                 ext.l     d1
  007ad6  7410                 moveq     #$10, d2
  007ad8  d282                 add.l     d2, d1
  007ada  9280                 sub.l     d0, d1
  007adc  3541005c             move.w    d1, $5c(a2)
  007ae0  6032                 bra.b     $7b14
  007ae2  4a6a004e             tst.w     $4e(a2)
  007ae6  6c1a                 bge.b     $7b02
  007ae8  302a0050             move.w    $50(a2), d0
  007aec  c1c3                 muls.w    d3, d0
  007aee  e080                 asr.l     #$8, d0
  007af0  35400050             move.w    d0, $50(a2)
  007af4  302a004e             move.w    $4e(a2), d0
  007af8  c1c3                 muls.w    d3, d0
  007afa  e080                 asr.l     #$8, d0
  007afc  4480                 neg.l     d0
  007afe  3540004e             move.w    d0, $4e(a2)
  007b02  3014                 move.w    (a4), d0
  007b04  48c0                 ext.l     d0
  007b06  3213                 move.w    (a3), d1
  007b08  48c1                 ext.l     d1
  007b0a  7410                 moveq     #$10, d2
  007b0c  d282                 add.l     d2, d1
  007b0e  9280                 sub.l     d0, d1
  007b10  3541005a             move.w    d1, $5a(a2)
  007b14  302c0006             move.w    $6(a4), d0
  007b18  48c0                 ext.l     d0
  007b1a  322b0002             move.w    $2(a3), d1
  007b1e  48c1                 ext.l     d1
  007b20  7410                 moveq     #$10, d2
  007b22  d282                 add.l     d2, d1
  007b24  9280                 sub.l     d0, d1
  007b26  302a005c             move.w    $5c(a2), d0
  007b2a  48c0                 ext.l     d0
  007b2c  b081                 cmp.l     d1, d0
  007b2e  6f16                 ble.b     $7b46
  007b30  302c0006             move.w    $6(a4), d0
  007b34  48c0                 ext.l     d0
  007b36  322b0002             move.w    $2(a3), d1
  007b3a  48c1                 ext.l     d1
  007b3c  7410                 moveq     #$10, d2
  007b3e  d282                 add.l     d2, d1
  007b40  9280                 sub.l     d0, d1
  007b42  3541005c             move.w    d1, $5c(a2)
  007b46  3014                 move.w    (a4), d0
  007b48  48c0                 ext.l     d0
  007b4a  3213                 move.w    (a3), d1
  007b4c  48c1                 ext.l     d1
  007b4e  7410                 moveq     #$10, d2
  007b50  d282                 add.l     d2, d1
  007b52  9280                 sub.l     d0, d1
  007b54  302a005a             move.w    $5a(a2), d0
  007b58  48c0                 ext.l     d0
  007b5a  b081                 cmp.l     d1, d0
  007b5c  6c12                 bge.b     $7b70
  007b5e  3014                 move.w    (a4), d0
  007b60  48c0                 ext.l     d0
  007b62  3213                 move.w    (a3), d1
  007b64  48c1                 ext.l     d1
  007b66  7410                 moveq     #$10, d2
  007b68  d282                 add.l     d2, d1
  007b6a  9280                 sub.l     d0, d1
  007b6c  3541005a             move.w    d1, $5a(a2)
  007b70  7c01                 moveq     #$1, d6
  007b72  6000047e             bra.w     $7ff2
  007b76  486effe2             pea.l     -$1e(a6)
  007b7a  3f2b0002             move.w    $2(a3), -(a7)
  007b7e  3013                 move.w    (a3), d0
  007b80  48c0                 ext.l     d0
  007b82  7210                 moveq     #$10, d1
  007b84  d081                 add.l     d1, d0
  007b86  3f00                 move.w    d0, -(a7)
  007b88  302b0002             move.w    $2(a3), d0
  007b8c  48c0                 ext.l     d0
  007b8e  7220                 moveq     #$20, d1
  007b90  d081                 add.l     d1, d0
  007b92  3f00                 move.w    d0, -(a7)
  007b94  3013                 move.w    (a3), d0
  007b96  48c0                 ext.l     d0
  007b98  7220                 moveq     #$20, d1
  007b9a  d081                 add.l     d1, d0
  007b9c  3f00                 move.w    d0, -(a7)
  007b9e  a8a7                 _SetRect  
  007ba0  486effd2             pea.l     -$2e(a6)
  007ba4  302b0002             move.w    $2(a3), d0
  007ba8  48c0                 ext.l     d0
  007baa  7210                 moveq     #$10, d1
  007bac  d081                 add.l     d1, d0
  007bae  3f00                 move.w    d0, -(a7)
  007bb0  3f13                 move.w    (a3), -(a7)
  007bb2  302b0002             move.w    $2(a3), d0
  007bb6  48c0                 ext.l     d0
  007bb8  7220                 moveq     #$20, d1
  007bba  d081                 add.l     d1, d0
  007bbc  3f00                 move.w    d0, -(a7)
  007bbe  3013                 move.w    (a3), d0
  007bc0  48c0                 ext.l     d0
  007bc2  7220                 moveq     #$20, d1
  007bc4  d081                 add.l     d1, d0
  007bc6  3f00                 move.w    d0, -(a7)
  007bc8  a8a7                 _SetRect  
  007bca  554f                 subq.w    #$2, a7
  007bcc  486effea             pea.l     -$16(a6)
  007bd0  486effe2             pea.l     -$1e(a6)
  007bd4  486effda             pea.l     -$26(a6)
  007bd8  a8aa                 _SectRect 
  007bda  101f                 move.b    (a7)+, d0
  007bdc  6616                 bne.b     $7bf4
  007bde  554f                 subq.w    #$2, a7
  007be0  486effea             pea.l     -$16(a6)
  007be4  486effd2             pea.l     -$2e(a6)
  007be8  486effda             pea.l     -$26(a6)
  007bec  a8aa                 _SectRect 
  007bee  101f                 move.b    (a7)+, d0
  007bf0  67000400             beq.w     $7ff2
  007bf4  206e0012             movea.l   $12(a6), a0
  007bf8  30280002             move.w    $2(a0), d0
  007bfc  48c0                 ext.l     d0
  007bfe  322a005c             move.w    $5c(a2), d1
  007c02  48c1                 ext.l     d1
  007c04  d280                 add.l     d0, d1
  007c06  3d41fffe             move.w    d1, -$2(a6)
  007c0a  206e0012             movea.l   $12(a6), a0
  007c0e  3010                 move.w    (a0), d0
  007c10  48c0                 ext.l     d0
  007c12  322a005a             move.w    $5a(a2), d1
  007c16  48c1                 ext.l     d1
  007c18  d280                 add.l     d0, d1
  007c1a  3d41fffc             move.w    d1, -$4(a6)
  007c1e  302b0002             move.w    $2(a3), d0
  007c22  48c0                 ext.l     d0
  007c24  7220                 moveq     #$20, d1
  007c26  d081                 add.l     d1, d0
  007c28  3d40fffa             move.w    d0, -$6(a6)
  007c2c  3013                 move.w    (a3), d0
  007c2e  48c0                 ext.l     d0
  007c30  7220                 moveq     #$20, d1
  007c32  d081                 add.l     d1, d0
  007c34  3d40fff8             move.w    d0, -$8(a6)
  007c38  302efffe             move.w    -$2(a6), d0
  007c3c  48c0                 ext.l     d0
  007c3e  382efffa             move.w    -$6(a6), d4
  007c42  48c4                 ext.l     d4
  007c44  9880                 sub.l     d0, d4
  007c46  302efffc             move.w    -$4(a6), d0
  007c4a  48c0                 ext.l     d0
  007c4c  3a2efff8             move.w    -$8(a6), d5
  007c50  48c5                 ext.l     d5
  007c52  9a80                 sub.l     d0, d5
  007c54  b845                 cmp.w     d5, d4
  007c56  6c38                 bge.b     $7c90
  007c58  4a6a0050             tst.w     $50(a2)
  007c5c  6f1a                 ble.b     $7c78
  007c5e  302a0050             move.w    $50(a2), d0
  007c62  c1c3                 muls.w    d3, d0
  007c64  e080                 asr.l     #$8, d0
  007c66  4480                 neg.l     d0
  007c68  35400050             move.w    d0, $50(a2)
  007c6c  302a004e             move.w    $4e(a2), d0
  007c70  c1c3                 muls.w    d3, d0
  007c72  e080                 asr.l     #$8, d0
  007c74  3540004e             move.w    d0, $4e(a2)
  007c78  302c0006             move.w    $6(a4), d0
  007c7c  48c0                 ext.l     d0
  007c7e  322b0002             move.w    $2(a3), d1
  007c82  48c1                 ext.l     d1
  007c84  7410                 moveq     #$10, d2
  007c86  d282                 add.l     d2, d1
  007c88  9280                 sub.l     d0, d1
  007c8a  3541005c             move.w    d1, $5c(a2)
  007c8e  6034                 bra.b     $7cc4
  007c90  4a6a004e             tst.w     $4e(a2)
  007c94  6f1a                 ble.b     $7cb0
  007c96  302a0050             move.w    $50(a2), d0
  007c9a  c1c3                 muls.w    d3, d0
  007c9c  e080                 asr.l     #$8, d0
  007c9e  35400050             move.w    d0, $50(a2)
  007ca2  302a004e             move.w    $4e(a2), d0
  007ca6  c1c3                 muls.w    d3, d0
  007ca8  e080                 asr.l     #$8, d0
  007caa  4480                 neg.l     d0
  007cac  3540004e             move.w    d0, $4e(a2)
  007cb0  302c0004             move.w    $4(a4), d0
  007cb4  48c0                 ext.l     d0
  007cb6  3213                 move.w    (a3), d1
  007cb8  48c1                 ext.l     d1
  007cba  7410                 moveq     #$10, d2
  007cbc  d282                 add.l     d2, d1
  007cbe  9280                 sub.l     d0, d1
  007cc0  3541005a             move.w    d1, $5a(a2)
  007cc4  302c0006             move.w    $6(a4), d0
  007cc8  48c0                 ext.l     d0
  007cca  322b0002             move.w    $2(a3), d1
  007cce  48c1                 ext.l     d1
  007cd0  7410                 moveq     #$10, d2
  007cd2  d282                 add.l     d2, d1
  007cd4  9280                 sub.l     d0, d1
  007cd6  302a005c             move.w    $5c(a2), d0
  007cda  48c0                 ext.l     d0
  007cdc  b081                 cmp.l     d1, d0
  007cde  6f16                 ble.b     $7cf6
  007ce0  302c0006             move.w    $6(a4), d0
  007ce4  48c0                 ext.l     d0
  007ce6  322b0002             move.w    $2(a3), d1
  007cea  48c1                 ext.l     d1
  007cec  7410                 moveq     #$10, d2
  007cee  d282                 add.l     d2, d1
  007cf0  9280                 sub.l     d0, d1
  007cf2  3541005c             move.w    d1, $5c(a2)
  007cf6  302c0004             move.w    $4(a4), d0
  007cfa  48c0                 ext.l     d0
  007cfc  3213                 move.w    (a3), d1
  007cfe  48c1                 ext.l     d1
  007d00  7410                 moveq     #$10, d2
  007d02  d282                 add.l     d2, d1
  007d04  9280                 sub.l     d0, d1
  007d06  302a005a             move.w    $5a(a2), d0
  007d0a  48c0                 ext.l     d0
  007d0c  b081                 cmp.l     d1, d0
  007d0e  6f14                 ble.b     $7d24
  007d10  302c0004             move.w    $4(a4), d0
  007d14  48c0                 ext.l     d0
  007d16  3213                 move.w    (a3), d1
  007d18  48c1                 ext.l     d1
  007d1a  7410                 moveq     #$10, d2
  007d1c  d282                 add.l     d2, d1
  007d1e  9280                 sub.l     d0, d1
  007d20  3541005a             move.w    d1, $5a(a2)
  007d24  7c01                 moveq     #$1, d6
  007d26  600002ca             bra.w     $7ff2
  007d2a  0c47000c             cmpi.w    #$c, d7
  007d2e  6d0002c2             blt.w     $7ff2
  007d32  0c470020             cmpi.w    #$20, d7
  007d36  6c0002ba             bge.w     $7ff2
  007d3a  356a005c0004         move.w    $5c(a2), $4(a2)
  007d40  356a005a0002         move.w    $5a(a2), $2(a2)
  007d46  554f                 subq.w    #$2, a7
  007d48  2f0a                 move.l    a2, -(a7)
  007d4a  2f13                 move.l    (a3), -(a7)
  007d4c  3f3c0028             move.w    #$28, -(a7)
  007d50  2f2e001c             move.l    $1c(a6), -(a7)
  007d54  702e                 moveq     #$2e, d0
  007d56  c1c7                 muls.w    d7, d0
  007d58  207900007e16         movea.l   $7e16.l, a0   ; g_7e16
  007d5e  2f30081a             move.l    $1a(a0, d0.l), -(a7)
  007d62  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  007d68  101f                 move.b    (a7)+, d0
  007d6a  1d40fff3             move.b    d0, -$d(a6)
  007d6e  4a2efff3             tst.b     -$d(a6)
  007d72  6700027e             beq.w     $7ff2
  007d76  356a0004005c         move.w    $4(a2), $5c(a2)
  007d7c  356a0002005a         move.w    $2(a2), $5a(a2)
  007d82  206e0012             movea.l   $12(a6), a0
  007d86  30280002             move.w    $2(a0), d0
  007d8a  48c0                 ext.l     d0
  007d8c  322a005c             move.w    $5c(a2), d1
  007d90  48c1                 ext.l     d1
  007d92  d280                 add.l     d0, d1
  007d94  3d41fffe             move.w    d1, -$2(a6)
  007d98  206e0012             movea.l   $12(a6), a0
  007d9c  3010                 move.w    (a0), d0
  007d9e  48c0                 ext.l     d0
  007da0  322a005a             move.w    $5a(a2), d1
  007da4  48c1                 ext.l     d1
  007da6  d280                 add.l     d0, d1
  007da8  3d41fffc             move.w    d1, -$4(a6)
  007dac  7c01                 moveq     #$1, d6
  007dae  3007                 move.w    d7, d0
  007db0  48c0                 ext.l     d0
  007db2  5180                 subq.l    #$8, d0
  007db4  5180                 subq.l    #$8, d0
  007db6  0c800000000f         cmpi.l    #$f, d0
  007dbc  6200018a             bhi.w     $7f48
  007dc0  303b0206             move.w    $7dc8(pc, d0.w * 2), d0
  007dc4  4efb0002             jmp       $7dc8(pc, d0.w)
  007dc8  00200038005000680080009800b000c6 cases     0:$7de8 1:$7e00 2:$7e18 3:$7e30 4:$7e48 5:$7e60 6:$7e78 7:$7e8e
  007dd8  00de00f6010a011e01320146015a016e cases     8:$7ea6 9:$7ebe 10:$7ed2 11:$7ee6 12:$7efa 13:$7f0e 14:$7f22 15:$7f36
  007de8  302efffe             move.w    -$2(a6), d0
  007dec  b06efff6             cmp.w     -$a(a6), d0
  007df0  6c06                 bge.b     $7df8
  007df2  7802                 moveq     #$2, d4
  007df4  60000152             bra.w     $7f48
  007df8  7803                 moveq     #$3, d4
  007dfa  7a0c                 moveq     #$c, d5
  007dfc  6000014a             bra.w     $7f48
  007e00  302efffc             move.w    -$4(a6), d0
  007e04  b06efff4             cmp.w     -$c(a6), d0
  007e08  6c06                 bge.b     $7e10
  007e0a  7801                 moveq     #$1, d4
  007e0c  6000013a             bra.w     $7f48
  007e10  7803                 moveq     #$3, d4
  007e12  7a0d                 moveq     #$d, d5
  007e14  60000132             bra.w     $7f48
  007e18  302efffe             move.w    -$2(a6), d0
  007e1c  b06efff6             cmp.w     -$a(a6), d0
  007e20  6c08                 bge.b     $7e2a
  007e22  7803                 moveq     #$3, d4
  007e24  7a0e                 moveq     #$e, d5
  007e26  60000120             bra.w     $7f48
  007e2a  7802                 moveq     #$2, d4
  007e2c  6000011a             bra.w     $7f48
  007e30  302efffc             move.w    -$4(a6), d0
  007e34  b06efff4             cmp.w     -$c(a6), d0
  007e38  6c08                 bge.b     $7e42
  007e3a  7803                 moveq     #$3, d4
  007e3c  7a0f                 moveq     #$f, d5
  007e3e  60000108             bra.w     $7f48
  007e42  7801                 moveq     #$1, d4
  007e44  60000102             bra.w     $7f48
  007e48  302efffc             move.w    -$4(a6), d0
  007e4c  b06efff4             cmp.w     -$c(a6), d0
  007e50  6c08                 bge.b     $7e5a
  007e52  7803                 moveq     #$3, d4
  007e54  7a0c                 moveq     #$c, d5
  007e56  600000f0             bra.w     $7f48
  007e5a  7801                 moveq     #$1, d4
  007e5c  600000ea             bra.w     $7f48
  007e60  302efffe             move.w    -$2(a6), d0
  007e64  b06efff6             cmp.w     -$a(a6), d0
  007e68  6c06                 bge.b     $7e70
  007e6a  7802                 moveq     #$2, d4
  007e6c  600000da             bra.w     $7f48
  007e70  7803                 moveq     #$3, d4
  007e72  7a0d                 moveq     #$d, d5
  007e74  600000d2             bra.w     $7f48
  007e78  302efffc             move.w    -$4(a6), d0
  007e7c  b06efff4             cmp.w     -$c(a6), d0
  007e80  6c04                 bge.b     $7e86
  007e82  7801                 moveq     #$1, d4
  007e84  6002                 bra.b     $7e88
  007e86  7803                 moveq     #$3, d4
  007e88  7a0e                 moveq     #$e, d5
  007e8a  600000bc             bra.w     $7f48
  007e8e  302efffe             move.w    -$2(a6), d0
  007e92  b06efff6             cmp.w     -$a(a6), d0
  007e96  6c08                 bge.b     $7ea0
  007e98  7803                 moveq     #$3, d4
  007e9a  7a0f                 moveq     #$f, d5
  007e9c  600000aa             bra.w     $7f48
  007ea0  7802                 moveq     #$2, d4
  007ea2  600000a4             bra.w     $7f48
  007ea6  302efffe             move.w    -$2(a6), d0
  007eaa  b06efff6             cmp.w     -$a(a6), d0
  007eae  6c08                 bge.b     $7eb8
  007eb0  7803                 moveq     #$3, d4
  007eb2  7a0c                 moveq     #$c, d5
  007eb4  60000092             bra.w     $7f48
  007eb8  7802                 moveq     #$2, d4
  007eba  6000008c             bra.w     $7f48
  007ebe  302efffc             move.w    -$4(a6), d0
  007ec2  b06efff4             cmp.w     -$c(a6), d0
  007ec6  6c04                 bge.b     $7ecc
  007ec8  7801                 moveq     #$1, d4
  007eca  607c                 bra.b     $7f48
  007ecc  7803                 moveq     #$3, d4
  007ece  7a0d                 moveq     #$d, d5
  007ed0  6076                 bra.b     $7f48
  007ed2  302efffe             move.w    -$2(a6), d0
  007ed6  b06efff6             cmp.w     -$a(a6), d0
  007eda  6c04                 bge.b     $7ee0
  007edc  7802                 moveq     #$2, d4
  007ede  6068                 bra.b     $7f48
  007ee0  7803                 moveq     #$3, d4
  007ee2  7a0e                 moveq     #$e, d5
  007ee4  6062                 bra.b     $7f48
  007ee6  302efffc             move.w    -$4(a6), d0
  007eea  b06efff4             cmp.w     -$c(a6), d0
  007eee  6c04                 bge.b     $7ef4
  007ef0  7801                 moveq     #$1, d4
  007ef2  6054                 bra.b     $7f48
  007ef4  7803                 moveq     #$3, d4
  007ef6  7a0f                 moveq     #$f, d5
  007ef8  604e                 bra.b     $7f48
  007efa  302efffc             move.w    -$4(a6), d0
  007efe  b06efff4             cmp.w     -$c(a6), d0
  007f02  6c04                 bge.b     $7f08
  007f04  7801                 moveq     #$1, d4
  007f06  6040                 bra.b     $7f48
  007f08  7803                 moveq     #$3, d4
  007f0a  7a0c                 moveq     #$c, d5
  007f0c  603a                 bra.b     $7f48
  007f0e  302efffe             move.w    -$2(a6), d0
  007f12  b06efff6             cmp.w     -$a(a6), d0
  007f16  6c06                 bge.b     $7f1e
  007f18  7803                 moveq     #$3, d4
  007f1a  7a0d                 moveq     #$d, d5
  007f1c  602a                 bra.b     $7f48
  007f1e  7802                 moveq     #$2, d4
  007f20  6026                 bra.b     $7f48
  007f22  302efffc             move.w    -$4(a6), d0
  007f26  b06efff4             cmp.w     -$c(a6), d0
  007f2a  6c06                 bge.b     $7f32
  007f2c  7803                 moveq     #$3, d4
  007f2e  7a0e                 moveq     #$e, d5
  007f30  6016                 bra.b     $7f48
  007f32  7801                 moveq     #$1, d4
  007f34  6012                 bra.b     $7f48
  007f36  302efffe             move.w    -$2(a6), d0
  007f3a  b06efff6             cmp.w     -$a(a6), d0
  007f3e  6c04                 bge.b     $7f44
  007f40  7802                 moveq     #$2, d4
  007f42  6004                 bra.b     $7f48
  007f44  7803                 moveq     #$3, d4
  007f46  7a0f                 moveq     #$f, d5
  007f48  3004                 move.w    d4, d0
  007f4a  48c0                 ext.l     d0
  007f4c  5380                 subq.l    #$1, d0
  007f4e  670c                 beq.b     $7f5c
  007f50  5380                 subq.l    #$1, d0
  007f52  6724                 beq.b     $7f78
  007f54  5380                 subq.l    #$1, d0
  007f56  673c                 beq.b     $7f94
  007f58  60000098             bra.w     $7ff2
  007f5c  302a0050             move.w    $50(a2), d0
  007f60  c1c3                 muls.w    d3, d0
  007f62  e080                 asr.l     #$8, d0
  007f64  4480                 neg.l     d0
  007f66  35400050             move.w    d0, $50(a2)
  007f6a  302a004e             move.w    $4e(a2), d0
  007f6e  c1c3                 muls.w    d3, d0
  007f70  e080                 asr.l     #$8, d0
  007f72  3540004e             move.w    d0, $4e(a2)
  007f76  607a                 bra.b     $7ff2
  007f78  302a0050             move.w    $50(a2), d0
  007f7c  c1c3                 muls.w    d3, d0
  007f7e  e080                 asr.l     #$8, d0
  007f80  35400050             move.w    d0, $50(a2)
  007f84  302a004e             move.w    $4e(a2), d0
  007f88  c1c3                 muls.w    d3, d0
  007f8a  e080                 asr.l     #$8, d0
  007f8c  4480                 neg.l     d0
  007f8e  3540004e             move.w    d0, $4e(a2)
  007f92  605e                 bra.b     $7ff2
  007f94  0c45000c             cmpi.w    #$c, d5
  007f98  6d3c                 blt.b     $7fd6
  007f9a  0c45000f             cmpi.w    #$f, d5
  007f9e  6e36                 bgt.b     $7fd6
  007fa0  0c45000d             cmpi.w    #$d, d5
  007fa4  6706                 beq.b     $7fac
  007fa6  0c45000f             cmpi.w    #$f, d5
  007faa  6610                 bne.b     $7fbc
  007fac  382a004e             move.w    $4e(a2), d4
  007fb0  356a0050004e         move.w    $50(a2), $4e(a2)
  007fb6  35440050             move.w    d4, $50(a2)
  007fba  601a                 bra.b     $7fd6
  007fbc  382a004e             move.w    $4e(a2), d4
  007fc0  302a0050             move.w    $50(a2), d0
  007fc4  48c0                 ext.l     d0
  007fc6  4480                 neg.l     d0
  007fc8  3540004e             move.w    d0, $4e(a2)
  007fcc  3004                 move.w    d4, d0
  007fce  48c0                 ext.l     d0
  007fd0  4480                 neg.l     d0
  007fd2  35400050             move.w    d0, $50(a2)
  007fd6  302a0050             move.w    $50(a2), d0
  007fda  c1c3                 muls.w    d3, d0
  007fdc  e080                 asr.l     #$8, d0
  007fde  4480                 neg.l     d0
  007fe0  35400050             move.w    d0, $50(a2)
  007fe4  302a004e             move.w    $4e(a2), d0
  007fe8  c1c3                 muls.w    d3, d0
  007fea  e080                 asr.l     #$8, d0
  007fec  4480                 neg.l     d0
  007fee  3540004e             move.w    d0, $4e(a2)
  007ff2  4a06                 tst.b     d6
  007ff4  6718                 beq.b     $800e
  007ff6  302a005c             move.w    $5c(a2), d0
  007ffa  48c0                 ext.l     d0
  007ffc  e188                 lsl.l     #$8, d0
  007ffe  2540005e             move.l    d0, $5e(a2)
  008002  302a005a             move.w    $5a(a2), d0
  008006  48c0                 ext.l     d0
  008008  e188                 lsl.l     #$8, d0
  00800a  25400062             move.l    d0, $62(a2)
  00800e  1006                 move.b    d6, d0
  008010  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  008014  4e5e                 unlk      a6
  008016  4e75                 rts       

;-------------------------------------------------------------
; GetFGTile   (seg 2 +008026, 98 bytes)
  008026  4e560000             link.w    a6, #$0
  00802a  48e70c00             movem.l   d4-d5, -(a7)
  00802e  382e0008             move.w    $8(a6), d4
  008032  3a2e000a             move.w    $a(a6), d5
  008036  4a44                 tst.w     d4
  008038  6c04                 bge.b     $803e
  00803a  7400                 moveq     #$0, d2
  00803c  600c                 bra.b     $804a
  00803e  0c44007f             cmpi.w    #$7f, d4
  008042  6f04                 ble.b     $8048
  008044  747f                 moveq     #$7f, d2
  008046  6002                 bra.b     $804a
  008048  3404                 move.w    d4, d2
  00804a  4a45                 tst.w     d5
  00804c  6c04                 bge.b     $8052
  00804e  7800                 moveq     #$0, d4
  008050  600c                 bra.b     $805e
  008052  0c45007f             cmpi.w    #$7f, d5
  008056  6f04                 ble.b     $805c
  008058  787f                 moveq     #$7f, d4
  00805a  6002                 bra.b     $805e
  00805c  3805                 move.w    d5, d4
  00805e  3044                 movea.w   d4, a0
  008060  2008                 move.l    a0, d0
  008062  d080                 add.l     d0, d0
  008064  3042                 movea.w   d2, a0
  008066  2208                 move.l    a0, d1
  008068  e189                 lsl.l     #$8, d1
  00806a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  008070  2050                 movea.l   (a0), a0
  008072  d1c1                 adda.l    d1, a0
  008074  d1c0                 adda.l    d0, a0
  008076  203c00008000         move.l    #$8000, d0
  00807c  30300800             move.w    (a0, d0.l), d0
  008080  4cdf0030             movem.l   (a7)+, d4-d5
  008084  4e5e                 unlk      a6
  008086  4e75                 rts       

;-------------------------------------------------------------
; GetBGTile   (seg 2 +008094, 80 bytes)
  008094  4e560000             link.w    a6, #$0
  008098  2f05                 move.l    d5, -(a7)
  00809a  342e0008             move.w    $8(a6), d2
  00809e  3a2e000a             move.w    $a(a6), d5
  0080a2  4a42                 tst.w     d2
  0080a4  6c04                 bge.b     $80aa
  0080a6  7200                 moveq     #$0, d1
  0080a8  600c                 bra.b     $80b6
  0080aa  0c42007f             cmpi.w    #$7f, d2
  0080ae  6f04                 ble.b     $80b4
  0080b0  727f                 moveq     #$7f, d1
  0080b2  6002                 bra.b     $80b6
  0080b4  3202                 move.w    d2, d1
  0080b6  4a45                 tst.w     d5
  0080b8  6c04                 bge.b     $80be
  0080ba  7400                 moveq     #$0, d2
  0080bc  600c                 bra.b     $80ca
  0080be  0c45007f             cmpi.w    #$7f, d5
  0080c2  6f04                 ble.b     $80c8
  0080c4  747f                 moveq     #$7f, d2
  0080c6  6002                 bra.b     $80ca
  0080c8  3405                 move.w    d5, d2
  0080ca  3041                 movea.w   d1, a0
  0080cc  2008                 move.l    a0, d0
  0080ce  e188                 lsl.l     #$8, d0
  0080d0  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0080d6  2050                 movea.l   (a0), a0
  0080d8  d1c0                 adda.l    d0, a0
  0080da  30302200             move.w    (a0, d2.w * 2), d0
  0080de  2a1f                 move.l    (a7)+, d5
  0080e0  4e5e                 unlk      a6
  0080e2  4e75                 rts       

;-------------------------------------------------------------
; BGTileBounce   (seg 2 +0080f0, 1234 bytes)
  0080f0  4e56ffe6             link.w    a6, #$ffe6
  0080f4  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0080f8  246e0008             movea.l   $8(a6), a2
  0080fc  362e000c             move.w    $c(a6), d3
  008100  286e000e             movea.l   $e(a6), a4
  008104  382e0012             move.w    $12(a6), d4
  008108  3a2e0014             move.w    $14(a6), d5
  00810c  266e0016             movea.l   $16(a6), a3
  008110  422efff7             clr.b     -$9(a6)
  008114  302c0002             move.w    $2(a4), d0
  008118  48c0                 ext.l     d0
  00811a  7210                 moveq     #$10, d1
  00811c  d081                 add.l     d1, d0
  00811e  3d40fffe             move.w    d0, -$2(a6)
  008122  3014                 move.w    (a4), d0
  008124  48c0                 ext.l     d0
  008126  7210                 moveq     #$10, d1
  008128  d081                 add.l     d1, d0
  00812a  3d40fffc             move.w    d0, -$4(a6)
  00812e  486effee             pea.l     -$12(a6)
  008132  302a005c             move.w    $5c(a2), d0
  008136  48c0                 ext.l     d0
  008138  322b0002             move.w    $2(a3), d1
  00813c  48c1                 ext.l     d1
  00813e  d280                 add.l     d0, d1
  008140  3f01                 move.w    d1, -(a7)
  008142  302a005a             move.w    $5a(a2), d0
  008146  48c0                 ext.l     d0
  008148  3213                 move.w    (a3), d1
  00814a  48c1                 ext.l     d1
  00814c  d280                 add.l     d0, d1
  00814e  3f01                 move.w    d1, -(a7)
  008150  302a005c             move.w    $5c(a2), d0
  008154  48c0                 ext.l     d0
  008156  322b0006             move.w    $6(a3), d1
  00815a  48c1                 ext.l     d1
  00815c  d280                 add.l     d0, d1
  00815e  3f01                 move.w    d1, -(a7)
  008160  302a005a             move.w    $5a(a2), d0
  008164  48c0                 ext.l     d0
  008166  322b0004             move.w    $4(a3), d1
  00816a  48c1                 ext.l     d1
  00816c  d280                 add.l     d0, d1
  00816e  3f01                 move.w    d1, -(a7)
  008170  a8a7                 _SetRect  
  008172  486effe6             pea.l     -$1a(a6)
  008176  700c                 moveq     #$c, d0
  008178  c1c3                 muls.w    d3, d0
  00817a  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  008180  30300806             move.w    $6(a0, d0.l), d0
  008184  48c0                 ext.l     d0
  008186  322c0002             move.w    $2(a4), d1
  00818a  48c1                 ext.l     d1
  00818c  d280                 add.l     d0, d1
  00818e  3f01                 move.w    d1, -(a7)
  008190  700c                 moveq     #$c, d0
  008192  c1c3                 muls.w    d3, d0
  008194  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  00819a  30300804             move.w    $4(a0, d0.l), d0
  00819e  48c0                 ext.l     d0
  0081a0  3214                 move.w    (a4), d1
  0081a2  48c1                 ext.l     d1
  0081a4  d280                 add.l     d0, d1
  0081a6  3f01                 move.w    d1, -(a7)
  0081a8  700c                 moveq     #$c, d0
  0081aa  c1c3                 muls.w    d3, d0
  0081ac  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  0081b2  3030080a             move.w    $a(a0, d0.l), d0
  0081b6  48c0                 ext.l     d0
  0081b8  322c0002             move.w    $2(a4), d1
  0081bc  48c1                 ext.l     d1
  0081be  d280                 add.l     d0, d1
  0081c0  3f01                 move.w    d1, -(a7)
  0081c2  700c                 moveq     #$c, d0
  0081c4  c1c3                 muls.w    d3, d0
  0081c6  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  0081cc  30300808             move.w    $8(a0, d0.l), d0
  0081d0  48c0                 ext.l     d0
  0081d2  3214                 move.w    (a4), d1
  0081d4  48c1                 ext.l     d1
  0081d6  d280                 add.l     d0, d1
  0081d8  3f01                 move.w    d1, -(a7)
  0081da  a8a7                 _SetRect  
  0081dc  554f                 subq.w    #$2, a7
  0081de  2f0a                 move.l    a2, -(a7)
  0081e0  2f14                 move.l    (a4), -(a7)
  0081e2  3f3c0028             move.w    #$28, -(a7)
  0081e6  2f2e001a             move.l    $1a(a6), -(a7)
  0081ea  207900007e1a         movea.l   $7e1a.l, a0   ; g_7e1a
  0081f0  2f28001a             move.l    $1a(a0), -(a7)
  0081f4  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0081fa  101f                 move.b    (a7)+, d0
  0081fc  1600                 move.b    d0, d3
  0081fe  4a03                 tst.b     d3
  008200  67000396             beq.w     $8598
  008204  3004                 move.w    d4, d0
  008206  48c0                 ext.l     d0
  008208  322a005c             move.w    $5c(a2), d1
  00820c  48c1                 ext.l     d1
  00820e  d280                 add.l     d0, d1
  008210  3d41fffa             move.w    d1, -$6(a6)
  008214  3004                 move.w    d4, d0
  008216  48c0                 ext.l     d0
  008218  322a005a             move.w    $5a(a2), d1
  00821c  48c1                 ext.l     d1
  00821e  d280                 add.l     d0, d1
  008220  3d41fff8             move.w    d1, -$8(a6)
  008224  302efffa             move.w    -$6(a6), d0
  008228  48c0                 ext.l     d0
  00822a  362efffe             move.w    -$2(a6), d3
  00822e  48c3                 ext.l     d3
  008230  9680                 sub.l     d0, d3
  008232  302efff8             move.w    -$8(a6), d0
  008236  48c0                 ext.l     d0
  008238  382efffc             move.w    -$4(a6), d4
  00823c  48c4                 ext.l     d4
  00823e  9880                 sub.l     d0, d4
  008240  4a43                 tst.w     d3
  008242  6c04                 bge.b     $8248
  008244  48c3                 ext.l     d3
  008246  4483                 neg.l     d3
  008248  4a44                 tst.w     d4
  00824a  6c04                 bge.b     $8250
  00824c  48c4                 ext.l     d4
  00824e  4484                 neg.l     d4
  008250  b644                 cmp.w     d4, d3
  008252  6f2c                 ble.b     $8280
  008254  302a0050             move.w    $50(a2), d0
  008258  c1c5                 muls.w    d5, d0
  00825a  e080                 asr.l     #$8, d0
  00825c  4480                 neg.l     d0
  00825e  35400050             move.w    d0, $50(a2)
  008262  302a004e             move.w    $4e(a2), d0
  008266  c1c5                 muls.w    d5, d0
  008268  e080                 asr.l     #$8, d0
  00826a  3540004e             move.w    d0, $4e(a2)
  00826e  302efffa             move.w    -$6(a6), d0
  008272  b06efffe             cmp.w     -$2(a6), d0
  008276  6f04                 ble.b     $827c
  008278  7801                 moveq     #$1, d4
  00827a  602c                 bra.b     $82a8
  00827c  7802                 moveq     #$2, d4
  00827e  6028                 bra.b     $82a8
  008280  302a0050             move.w    $50(a2), d0
  008284  c1c5                 muls.w    d5, d0
  008286  e080                 asr.l     #$8, d0
  008288  35400050             move.w    d0, $50(a2)
  00828c  302a004e             move.w    $4e(a2), d0
  008290  c1c5                 muls.w    d5, d0
  008292  e080                 asr.l     #$8, d0
  008294  3540004e             move.w    d0, $4e(a2)
  008298  302efff8             move.w    -$8(a6), d0
  00829c  b06efffc             cmp.w     -$4(a6), d0
  0082a0  6f04                 ble.b     $82a6
  0082a2  7804                 moveq     #$4, d4
  0082a4  6002                 bra.b     $82a8
  0082a6  7803                 moveq     #$3, d4
  0082a8  1d7c0001fff7         move.b    #$1, -$9(a6)
  0082ae  3c2c0002             move.w    $2(a4), d6
  0082b2  48c6                 ext.l     d6
  0082b4  ea86                 asr.l     #$5, d6
  0082b6  3e14                 move.w    (a4), d7
  0082b8  48c7                 ext.l     d7
  0082ba  ea87                 asr.l     #$5, d7
  0082bc  3004                 move.w    d4, d0
  0082be  48c0                 ext.l     d0
  0082c0  5380                 subq.l    #$1, d0
  0082c2  6714                 beq.b     $82d8
  0082c4  5380                 subq.l    #$1, d0
  0082c6  6758                 beq.b     $8320
  0082c8  5380                 subq.l    #$1, d0
  0082ca  6700009a             beq.w     $8366
  0082ce  5380                 subq.l    #$1, d0
  0082d0  670000d6             beq.w     $83a8
  0082d4  60000112             bra.w     $83e8
  0082d8  3f07                 move.w    d7, -(a7)
  0082da  3006                 move.w    d6, d0
  0082dc  48c0                 ext.l     d0
  0082de  5280                 addq.l    #$1, d0
  0082e0  3f00                 move.w    d0, -(a7)
  0082e2  61fffffffd42         bsr.l     $8026   ; GetFGTile
  0082e8  584f                 addq.w    #$4, a7
  0082ea  3f00                 move.w    d0, -(a7)
  0082ec  61ff0000417e         bsr.l     $c46c   ; LookupFGTileKind
  0082f2  3600                 move.w    d0, d3
  0082f4  0c430002             cmpi.w    #$2, d3
  0082f8  544f                 addq.w    #$2, a7
  0082fa  670e                 beq.b     $830a
  0082fc  0c430007             cmpi.w    #$7, d3
  008300  6708                 beq.b     $830a
  008302  0c430006             cmpi.w    #$6, d3
  008306  660000e0             bne.w     $83e8
  00830a  302efff8             move.w    -$8(a6), d0
  00830e  b06efffc             cmp.w     -$4(a6), d0
  008312  6f06                 ble.b     $831a
  008314  7804                 moveq     #$4, d4
  008316  600000d0             bra.w     $83e8
  00831a  7803                 moveq     #$3, d4
  00831c  600000ca             bra.w     $83e8
  008320  3f07                 move.w    d7, -(a7)
  008322  3006                 move.w    d6, d0
  008324  48c0                 ext.l     d0
  008326  5380                 subq.l    #$1, d0
  008328  3f00                 move.w    d0, -(a7)
  00832a  61fffffffcfa         bsr.l     $8026   ; GetFGTile
  008330  584f                 addq.w    #$4, a7
  008332  3f00                 move.w    d0, -(a7)
  008334  61ff00004136         bsr.l     $c46c   ; LookupFGTileKind
  00833a  3600                 move.w    d0, d3
  00833c  4a43                 tst.w     d3
  00833e  544f                 addq.w    #$2, a7
  008340  670e                 beq.b     $8350
  008342  0c430004             cmpi.w    #$4, d3
  008346  6708                 beq.b     $8350
  008348  0c430005             cmpi.w    #$5, d3
  00834c  6600009a             bne.w     $83e8
  008350  302efff8             move.w    -$8(a6), d0
  008354  b06efffc             cmp.w     -$4(a6), d0
  008358  6f06                 ble.b     $8360
  00835a  7804                 moveq     #$4, d4
  00835c  6000008a             bra.w     $83e8
  008360  7803                 moveq     #$3, d4
  008362  60000084             bra.w     $83e8
  008366  3007                 move.w    d7, d0
  008368  48c0                 ext.l     d0
  00836a  5380                 subq.l    #$1, d0
  00836c  3f00                 move.w    d0, -(a7)
  00836e  3f06                 move.w    d6, -(a7)
  008370  61fffffffcb4         bsr.l     $8026   ; GetFGTile
  008376  584f                 addq.w    #$4, a7
  008378  3f00                 move.w    d0, -(a7)
  00837a  61ff000040f0         bsr.l     $c46c   ; LookupFGTileKind
  008380  3600                 move.w    d0, d3
  008382  0c430001             cmpi.w    #$1, d3
  008386  544f                 addq.w    #$2, a7
  008388  670c                 beq.b     $8396
  00838a  0c430006             cmpi.w    #$6, d3
  00838e  6706                 beq.b     $8396
  008390  0c430005             cmpi.w    #$5, d3
  008394  6652                 bne.b     $83e8
  008396  302efffa             move.w    -$6(a6), d0
  00839a  b06efffe             cmp.w     -$2(a6), d0
  00839e  6f04                 ble.b     $83a4
  0083a0  7801                 moveq     #$1, d4
  0083a2  6044                 bra.b     $83e8
  0083a4  7802                 moveq     #$2, d4
  0083a6  6040                 bra.b     $83e8
  0083a8  3007                 move.w    d7, d0
  0083aa  48c0                 ext.l     d0
  0083ac  5280                 addq.l    #$1, d0
  0083ae  3f00                 move.w    d0, -(a7)
  0083b0  3f06                 move.w    d6, -(a7)
  0083b2  61fffffffc72         bsr.l     $8026   ; GetFGTile
  0083b8  584f                 addq.w    #$4, a7
  0083ba  3f00                 move.w    d0, -(a7)
  0083bc  61ff000040ae         bsr.l     $c46c   ; LookupFGTileKind
  0083c2  3600                 move.w    d0, d3
  0083c4  0c430003             cmpi.w    #$3, d3
  0083c8  544f                 addq.w    #$2, a7
  0083ca  670c                 beq.b     $83d8
  0083cc  0c430007             cmpi.w    #$7, d3
  0083d0  6706                 beq.b     $83d8
  0083d2  0c430004             cmpi.w    #$4, d3
  0083d6  6610                 bne.b     $83e8
  0083d8  302efffa             move.w    -$6(a6), d0
  0083dc  b06efffe             cmp.w     -$2(a6), d0
  0083e0  6f04                 ble.b     $83e6
  0083e2  7801                 moveq     #$1, d4
  0083e4  6002                 bra.b     $83e8
  0083e6  7802                 moveq     #$2, d4
  0083e8  3004                 move.w    d4, d0
  0083ea  48c0                 ext.l     d0
  0083ec  5380                 subq.l    #$1, d0
  0083ee  6714                 beq.b     $8404
  0083f0  5380                 subq.l    #$1, d0
  0083f2  6778                 beq.b     $846c
  0083f4  5380                 subq.l    #$1, d0
  0083f6  6700013e             beq.w     $8536
  0083fa  5380                 subq.l    #$1, d0
  0083fc  670000d6             beq.w     $84d4
  008400  60000196             bra.w     $8598
  008404  4a2e001e             tst.b     $1e(a6)
  008408  672a                 beq.b     $8434
  00840a  302a0050             move.w    $50(a2), d0
  00840e  c1c5                 muls.w    d5, d0
  008410  e080                 asr.l     #$8, d0
  008412  35400050             move.w    d0, $50(a2)
  008416  302a004e             move.w    $4e(a2), d0
  00841a  c1c5                 muls.w    d5, d0
  00841c  e080                 asr.l     #$8, d0
  00841e  3540004e             move.w    d0, $4e(a2)
  008422  4a6a0050             tst.w     $50(a2)
  008426  6c0c                 bge.b     $8434
  008428  302a0050             move.w    $50(a2), d0
  00842c  48c0                 ext.l     d0
  00842e  4480                 neg.l     d0
  008430  35400050             move.w    d0, $50(a2)
  008434  302b0002             move.w    $2(a3), d0
  008438  48c0                 ext.l     d0
  00843a  322efffe             move.w    -$2(a6), d1
  00843e  48c1                 ext.l     d1
  008440  740e                 moveq     #$e, d2
  008442  d282                 add.l     d2, d1
  008444  9280                 sub.l     d0, d1
  008446  302a005c             move.w    $5c(a2), d0
  00844a  48c0                 ext.l     d0
  00844c  b081                 cmp.l     d1, d0
  00844e  6c000148             bge.w     $8598
  008452  302b0002             move.w    $2(a3), d0
  008456  48c0                 ext.l     d0
  008458  322efffe             move.w    -$2(a6), d1
  00845c  48c1                 ext.l     d1
  00845e  740e                 moveq     #$e, d2
  008460  d282                 add.l     d2, d1
  008462  9280                 sub.l     d0, d1
  008464  3541005c             move.w    d1, $5c(a2)
  008468  6000012e             bra.w     $8598
  00846c  4a2e001e             tst.b     $1e(a6)
  008470  672a                 beq.b     $849c
  008472  302a0050             move.w    $50(a2), d0
  008476  c1c5                 muls.w    d5, d0
  008478  e080                 asr.l     #$8, d0
  00847a  35400050             move.w    d0, $50(a2)
  00847e  302a004e             move.w    $4e(a2), d0
  008482  c1c5                 muls.w    d5, d0
  008484  e080                 asr.l     #$8, d0
  008486  3540004e             move.w    d0, $4e(a2)
  00848a  4a6a0050             tst.w     $50(a2)
  00848e  6f0c                 ble.b     $849c
  008490  302a0050             move.w    $50(a2), d0
  008494  48c0                 ext.l     d0
  008496  4480                 neg.l     d0
  008498  35400050             move.w    d0, $50(a2)
  00849c  302b0006             move.w    $6(a3), d0
  0084a0  48c0                 ext.l     d0
  0084a2  322efffe             move.w    -$2(a6), d1
  0084a6  48c1                 ext.l     d1
  0084a8  74f2                 moveq     #$f2, d2
  0084aa  d282                 add.l     d2, d1
  0084ac  9280                 sub.l     d0, d1
  0084ae  302a005c             move.w    $5c(a2), d0
  0084b2  48c0                 ext.l     d0
  0084b4  b081                 cmp.l     d1, d0
  0084b6  6f0000e0             ble.w     $8598
  0084ba  302b0006             move.w    $6(a3), d0
  0084be  48c0                 ext.l     d0
  0084c0  322efffe             move.w    -$2(a6), d1
  0084c4  48c1                 ext.l     d1
  0084c6  74f2                 moveq     #$f2, d2
  0084c8  d282                 add.l     d2, d1
  0084ca  9280                 sub.l     d0, d1
  0084cc  3541005c             move.w    d1, $5c(a2)
  0084d0  600000c6             bra.w     $8598
  0084d4  4a2e001e             tst.b     $1e(a6)
  0084d8  672c                 beq.b     $8506
  0084da  302a0050             move.w    $50(a2), d0
  0084de  c1c5                 muls.w    d5, d0
  0084e0  e080                 asr.l     #$8, d0
  0084e2  35400050             move.w    d0, $50(a2)
  0084e6  302a004e             move.w    $4e(a2), d0
  0084ea  c1c5                 muls.w    d5, d0
  0084ec  e080                 asr.l     #$8, d0
  0084ee  4480                 neg.l     d0
  0084f0  3540004e             move.w    d0, $4e(a2)
  0084f4  4a6a004e             tst.w     $4e(a2)
  0084f8  6c0c                 bge.b     $8506
  0084fa  302a004e             move.w    $4e(a2), d0
  0084fe  48c0                 ext.l     d0
  008500  4480                 neg.l     d0
  008502  3540004e             move.w    d0, $4e(a2)
  008506  3013                 move.w    (a3), d0
  008508  48c0                 ext.l     d0
  00850a  322efffc             move.w    -$4(a6), d1
  00850e  48c1                 ext.l     d1
  008510  740e                 moveq     #$e, d2
  008512  d282                 add.l     d2, d1
  008514  9280                 sub.l     d0, d1
  008516  302a005a             move.w    $5a(a2), d0
  00851a  48c0                 ext.l     d0
  00851c  b081                 cmp.l     d1, d0
  00851e  6c78                 bge.b     $8598
  008520  3013                 move.w    (a3), d0
  008522  48c0                 ext.l     d0
  008524  322efffc             move.w    -$4(a6), d1
  008528  48c1                 ext.l     d1
  00852a  740e                 moveq     #$e, d2
  00852c  d282                 add.l     d2, d1
  00852e  9280                 sub.l     d0, d1
  008530  3541005a             move.w    d1, $5a(a2)
  008534  6062                 bra.b     $8598
  008536  4a2e001e             tst.b     $1e(a6)
  00853a  672a                 beq.b     $8566
  00853c  302a0050             move.w    $50(a2), d0
  008540  c1c5                 muls.w    d5, d0
  008542  e080                 asr.l     #$8, d0
  008544  35400050             move.w    d0, $50(a2)
  008548  302a004e             move.w    $4e(a2), d0
  00854c  c1c5                 muls.w    d5, d0
  00854e  e080                 asr.l     #$8, d0
  008550  3540004e             move.w    d0, $4e(a2)
  008554  4a6a004e             tst.w     $4e(a2)
  008558  6f0c                 ble.b     $8566
  00855a  302a004e             move.w    $4e(a2), d0
  00855e  48c0                 ext.l     d0
  008560  4480                 neg.l     d0
  008562  3540004e             move.w    d0, $4e(a2)
  008566  302b0004             move.w    $4(a3), d0
  00856a  48c0                 ext.l     d0
  00856c  322efffc             move.w    -$4(a6), d1
  008570  48c1                 ext.l     d1
  008572  74f2                 moveq     #$f2, d2
  008574  d282                 add.l     d2, d1
  008576  9280                 sub.l     d0, d1
  008578  302a005a             move.w    $5a(a2), d0
  00857c  48c0                 ext.l     d0
  00857e  b081                 cmp.l     d1, d0
  008580  6f16                 ble.b     $8598
  008582  302b0004             move.w    $4(a3), d0
  008586  48c0                 ext.l     d0
  008588  322efffc             move.w    -$4(a6), d1
  00858c  48c1                 ext.l     d1
  00858e  74f2                 moveq     #$f2, d2
  008590  d282                 add.l     d2, d1
  008592  9280                 sub.l     d0, d1
  008594  3541005a             move.w    d1, $5a(a2)
  008598  4a2efff7             tst.b     -$9(a6)
  00859c  6718                 beq.b     $85b6
  00859e  302a005c             move.w    $5c(a2), d0
  0085a2  48c0                 ext.l     d0
  0085a4  e188                 lsl.l     #$8, d0
  0085a6  2540005e             move.l    d0, $5e(a2)
  0085aa  302a005a             move.w    $5a(a2), d0
  0085ae  48c0                 ext.l     d0
  0085b0  e188                 lsl.l     #$8, d0
  0085b2  25400062             move.l    d0, $62(a2)
  0085b6  102efff7             move.b    -$9(a6), d0
  0085ba  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0085be  4e5e                 unlk      a6
  0085c0  4e75                 rts       

;-------------------------------------------------------------
; BGTileBounce2   (seg 2 +0085d2, 1160 bytes)
  0085d2  4e56ffe8             link.w    a6, #$ffe8
  0085d6  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0085da  246e0008             movea.l   $8(a6), a2
  0085de  362e000c             move.w    $c(a6), d3
  0085e2  286e000e             movea.l   $e(a6), a4
  0085e6  2a2e0012             move.l    $12(a6), d5
  0085ea  382e0016             move.w    $16(a6), d4
  0085ee  266e0018             movea.l   $18(a6), a3
  0085f2  7e00                 moveq     #$0, d7
  0085f4  302c0002             move.w    $2(a4), d0
  0085f8  48c0                 ext.l     d0
  0085fa  7210                 moveq     #$10, d1
  0085fc  d081                 add.l     d1, d0
  0085fe  3d40fffe             move.w    d0, -$2(a6)
  008602  3014                 move.w    (a4), d0
  008604  48c0                 ext.l     d0
  008606  7210                 moveq     #$10, d1
  008608  d081                 add.l     d1, d0
  00860a  3d40fffc             move.w    d0, -$4(a6)
  00860e  486efff0             pea.l     -$10(a6)
  008612  302a005c             move.w    $5c(a2), d0
  008616  48c0                 ext.l     d0
  008618  322b0002             move.w    $2(a3), d1
  00861c  48c1                 ext.l     d1
  00861e  d280                 add.l     d0, d1
  008620  3f01                 move.w    d1, -(a7)
  008622  302a005a             move.w    $5a(a2), d0
  008626  48c0                 ext.l     d0
  008628  3213                 move.w    (a3), d1
  00862a  48c1                 ext.l     d1
  00862c  d280                 add.l     d0, d1
  00862e  3f01                 move.w    d1, -(a7)
  008630  302a005c             move.w    $5c(a2), d0
  008634  48c0                 ext.l     d0
  008636  322b0006             move.w    $6(a3), d1
  00863a  48c1                 ext.l     d1
  00863c  d280                 add.l     d0, d1
  00863e  3f01                 move.w    d1, -(a7)
  008640  302a005a             move.w    $5a(a2), d0
  008644  48c0                 ext.l     d0
  008646  322b0004             move.w    $4(a3), d1
  00864a  48c1                 ext.l     d1
  00864c  d280                 add.l     d0, d1
  00864e  3f01                 move.w    d1, -(a7)
  008650  a8a7                 _SetRect  
  008652  486effe8             pea.l     -$18(a6)
  008656  700c                 moveq     #$c, d0
  008658  c1c3                 muls.w    d3, d0
  00865a  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  008660  30300806             move.w    $6(a0, d0.l), d0
  008664  48c0                 ext.l     d0
  008666  322c0002             move.w    $2(a4), d1
  00866a  48c1                 ext.l     d1
  00866c  d280                 add.l     d0, d1
  00866e  3f01                 move.w    d1, -(a7)
  008670  700c                 moveq     #$c, d0
  008672  c1c3                 muls.w    d3, d0
  008674  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  00867a  30300804             move.w    $4(a0, d0.l), d0
  00867e  48c0                 ext.l     d0
  008680  3214                 move.w    (a4), d1
  008682  48c1                 ext.l     d1
  008684  d280                 add.l     d0, d1
  008686  3f01                 move.w    d1, -(a7)
  008688  700c                 moveq     #$c, d0
  00868a  c1c3                 muls.w    d3, d0
  00868c  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  008692  3030080a             move.w    $a(a0, d0.l), d0
  008696  48c0                 ext.l     d0
  008698  322c0002             move.w    $2(a4), d1
  00869c  48c1                 ext.l     d1
  00869e  d280                 add.l     d0, d1
  0086a0  3f01                 move.w    d1, -(a7)
  0086a2  700c                 moveq     #$c, d0
  0086a4  c1c3                 muls.w    d3, d0
  0086a6  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  0086ac  30300808             move.w    $8(a0, d0.l), d0
  0086b0  48c0                 ext.l     d0
  0086b2  3214                 move.w    (a4), d1
  0086b4  48c1                 ext.l     d1
  0086b6  d280                 add.l     d0, d1
  0086b8  3f01                 move.w    d1, -(a7)
  0086ba  a8a7                 _SetRect  
  0086bc  554f                 subq.w    #$2, a7
  0086be  2f0a                 move.l    a2, -(a7)
  0086c0  2f14                 move.l    (a4), -(a7)
  0086c2  3f3c0028             move.w    #$28, -(a7)
  0086c6  2f2e001c             move.l    $1c(a6), -(a7)
  0086ca  207900007e1a         movea.l   $7e1a.l, a0   ; g_7e1a
  0086d0  2f28001a             move.l    $1a(a0), -(a7)
  0086d4  4eb9000002b0         jsr       $2b0.l   ; REGIONBOUNCE
  0086da  101f                 move.b    (a7)+, d0
  0086dc  1600                 move.b    d0, d3
  0086de  4a03                 tst.b     d3
  0086e0  67000352             beq.w     $8a34
  0086e4  2045                 movea.l   d5, a0
  0086e6  30280002             move.w    $2(a0), d0
  0086ea  48c0                 ext.l     d0
  0086ec  322a005c             move.w    $5c(a2), d1
  0086f0  48c1                 ext.l     d1
  0086f2  d280                 add.l     d0, d1
  0086f4  3d41fffa             move.w    d1, -$6(a6)
  0086f8  2045                 movea.l   d5, a0
  0086fa  3010                 move.w    (a0), d0
  0086fc  48c0                 ext.l     d0
  0086fe  322a005a             move.w    $5a(a2), d1
  008702  48c1                 ext.l     d1
  008704  d280                 add.l     d0, d1
  008706  3d41fff8             move.w    d1, -$8(a6)
  00870a  302efffa             move.w    -$6(a6), d0
  00870e  48c0                 ext.l     d0
  008710  362efffe             move.w    -$2(a6), d3
  008714  48c3                 ext.l     d3
  008716  9680                 sub.l     d0, d3
  008718  302efff8             move.w    -$8(a6), d0
  00871c  48c0                 ext.l     d0
  00871e  3a2efffc             move.w    -$4(a6), d5
  008722  48c5                 ext.l     d5
  008724  9a80                 sub.l     d0, d5
  008726  4a43                 tst.w     d3
  008728  6c04                 bge.b     $872e
  00872a  48c3                 ext.l     d3
  00872c  4483                 neg.l     d3
  00872e  4a45                 tst.w     d5
  008730  6c04                 bge.b     $8736
  008732  48c5                 ext.l     d5
  008734  4485                 neg.l     d5
  008736  b645                 cmp.w     d5, d3
  008738  6f2c                 ble.b     $8766
  00873a  302a0050             move.w    $50(a2), d0
  00873e  c1c4                 muls.w    d4, d0
  008740  e080                 asr.l     #$8, d0
  008742  4480                 neg.l     d0
  008744  35400050             move.w    d0, $50(a2)
  008748  302a004e             move.w    $4e(a2), d0
  00874c  c1c4                 muls.w    d4, d0
  00874e  e080                 asr.l     #$8, d0
  008750  3540004e             move.w    d0, $4e(a2)
  008754  302efffa             move.w    -$6(a6), d0
  008758  b06efffe             cmp.w     -$2(a6), d0
  00875c  6f04                 ble.b     $8762
  00875e  7601                 moveq     #$1, d3
  008760  602c                 bra.b     $878e
  008762  7602                 moveq     #$2, d3
  008764  6028                 bra.b     $878e
  008766  302a0050             move.w    $50(a2), d0
  00876a  c1c4                 muls.w    d4, d0
  00876c  e080                 asr.l     #$8, d0
  00876e  35400050             move.w    d0, $50(a2)
  008772  302a004e             move.w    $4e(a2), d0
  008776  c1c4                 muls.w    d4, d0
  008778  e080                 asr.l     #$8, d0
  00877a  3540004e             move.w    d0, $4e(a2)
  00877e  302efff8             move.w    -$8(a6), d0
  008782  b06efffc             cmp.w     -$4(a6), d0
  008786  6f04                 ble.b     $878c
  008788  7604                 moveq     #$4, d3
  00878a  6002                 bra.b     $878e
  00878c  7603                 moveq     #$3, d3
  00878e  7e01                 moveq     #$1, d7
  008790  3a2c0002             move.w    $2(a4), d5
  008794  48c5                 ext.l     d5
  008796  ea85                 asr.l     #$5, d5
  008798  3c14                 move.w    (a4), d6
  00879a  48c6                 ext.l     d6
  00879c  ea86                 asr.l     #$5, d6
  00879e  3003                 move.w    d3, d0
  0087a0  48c0                 ext.l     d0
  0087a2  5380                 subq.l    #$1, d0
  0087a4  6712                 beq.b     $87b8
  0087a6  5380                 subq.l    #$1, d0
  0087a8  6746                 beq.b     $87f0
  0087aa  5380                 subq.l    #$1, d0
  0087ac  6774                 beq.b     $8822
  0087ae  5380                 subq.l    #$1, d0
  0087b0  670000a2             beq.w     $8854
  0087b4  600000ce             bra.w     $8884
  0087b8  3f06                 move.w    d6, -(a7)
  0087ba  3005                 move.w    d5, d0
  0087bc  48c0                 ext.l     d0
  0087be  5280                 addq.l    #$1, d0
  0087c0  3f00                 move.w    d0, -(a7)
  0087c2  61fffffff862         bsr.l     $8026   ; GetFGTile
  0087c8  584f                 addq.w    #$4, a7
  0087ca  3f00                 move.w    d0, -(a7)
  0087cc  61ff00003c9e         bsr.l     $c46c   ; LookupFGTileKind
  0087d2  5540                 subq.w    #$2, d0
  0087d4  544f                 addq.w    #$2, a7
  0087d6  660000ac             bne.w     $8884
  0087da  302efff8             move.w    -$8(a6), d0
  0087de  b06efffc             cmp.w     -$4(a6), d0
  0087e2  6f06                 ble.b     $87ea
  0087e4  7604                 moveq     #$4, d3
  0087e6  6000009c             bra.w     $8884
  0087ea  7603                 moveq     #$3, d3
  0087ec  60000096             bra.w     $8884
  0087f0  3f06                 move.w    d6, -(a7)
  0087f2  3005                 move.w    d5, d0
  0087f4  48c0                 ext.l     d0
  0087f6  5380                 subq.l    #$1, d0
  0087f8  3f00                 move.w    d0, -(a7)
  0087fa  61fffffff82a         bsr.l     $8026   ; GetFGTile
  008800  584f                 addq.w    #$4, a7
  008802  3f00                 move.w    d0, -(a7)
  008804  61ff00003c66         bsr.l     $c46c   ; LookupFGTileKind
  00880a  4a40                 tst.w     d0
  00880c  544f                 addq.w    #$2, a7
  00880e  6674                 bne.b     $8884
  008810  302efff8             move.w    -$8(a6), d0
  008814  b06efffc             cmp.w     -$4(a6), d0
  008818  6f04                 ble.b     $881e
  00881a  7604                 moveq     #$4, d3
  00881c  6066                 bra.b     $8884
  00881e  7603                 moveq     #$3, d3
  008820  6062                 bra.b     $8884
  008822  3006                 move.w    d6, d0
  008824  48c0                 ext.l     d0
  008826  5380                 subq.l    #$1, d0
  008828  3f00                 move.w    d0, -(a7)
  00882a  3f05                 move.w    d5, -(a7)
  00882c  61fffffff7f8         bsr.l     $8026   ; GetFGTile
  008832  584f                 addq.w    #$4, a7
  008834  3f00                 move.w    d0, -(a7)
  008836  61ff00003c34         bsr.l     $c46c   ; LookupFGTileKind
  00883c  5340                 subq.w    #$1, d0
  00883e  544f                 addq.w    #$2, a7
  008840  6642                 bne.b     $8884
  008842  302efffa             move.w    -$6(a6), d0
  008846  b06efffe             cmp.w     -$2(a6), d0
  00884a  6f04                 ble.b     $8850
  00884c  7601                 moveq     #$1, d3
  00884e  6034                 bra.b     $8884
  008850  7602                 moveq     #$2, d3
  008852  6030                 bra.b     $8884
  008854  3006                 move.w    d6, d0
  008856  48c0                 ext.l     d0
  008858  5280                 addq.l    #$1, d0
  00885a  3f00                 move.w    d0, -(a7)
  00885c  3f05                 move.w    d5, -(a7)
  00885e  61fffffff7c6         bsr.l     $8026   ; GetFGTile
  008864  584f                 addq.w    #$4, a7
  008866  3f00                 move.w    d0, -(a7)
  008868  61ff00003c02         bsr.l     $c46c   ; LookupFGTileKind
  00886e  5740                 subq.w    #$3, d0
  008870  544f                 addq.w    #$2, a7
  008872  6610                 bne.b     $8884
  008874  302efffa             move.w    -$6(a6), d0
  008878  b06efffe             cmp.w     -$2(a6), d0
  00887c  6f04                 ble.b     $8882
  00887e  7601                 moveq     #$1, d3
  008880  6002                 bra.b     $8884
  008882  7602                 moveq     #$2, d3
  008884  3003                 move.w    d3, d0
  008886  48c0                 ext.l     d0
  008888  5380                 subq.l    #$1, d0
  00888a  6714                 beq.b     $88a0
  00888c  5380                 subq.l    #$1, d0
  00888e  6778                 beq.b     $8908
  008890  5380                 subq.l    #$1, d0
  008892  6700013e             beq.w     $89d2
  008896  5380                 subq.l    #$1, d0
  008898  670000d6             beq.w     $8970
  00889c  60000196             bra.w     $8a34
  0088a0  4a2e0020             tst.b     $20(a6)
  0088a4  672a                 beq.b     $88d0
  0088a6  302a0050             move.w    $50(a2), d0
  0088aa  c1c4                 muls.w    d4, d0
  0088ac  e080                 asr.l     #$8, d0
  0088ae  35400050             move.w    d0, $50(a2)
  0088b2  302a004e             move.w    $4e(a2), d0
  0088b6  c1c4                 muls.w    d4, d0
  0088b8  e080                 asr.l     #$8, d0
  0088ba  3540004e             move.w    d0, $4e(a2)
  0088be  4a6a0050             tst.w     $50(a2)
  0088c2  6c0c                 bge.b     $88d0
  0088c4  302a0050             move.w    $50(a2), d0
  0088c8  48c0                 ext.l     d0
  0088ca  4480                 neg.l     d0
  0088cc  35400050             move.w    d0, $50(a2)
  0088d0  302b0002             move.w    $2(a3), d0
  0088d4  48c0                 ext.l     d0
  0088d6  322efffe             move.w    -$2(a6), d1
  0088da  48c1                 ext.l     d1
  0088dc  740e                 moveq     #$e, d2
  0088de  d282                 add.l     d2, d1
  0088e0  9280                 sub.l     d0, d1
  0088e2  302a005c             move.w    $5c(a2), d0
  0088e6  48c0                 ext.l     d0
  0088e8  b081                 cmp.l     d1, d0
  0088ea  6c000148             bge.w     $8a34
  0088ee  302b0002             move.w    $2(a3), d0
  0088f2  48c0                 ext.l     d0
  0088f4  322efffe             move.w    -$2(a6), d1
  0088f8  48c1                 ext.l     d1
  0088fa  740e                 moveq     #$e, d2
  0088fc  d282                 add.l     d2, d1
  0088fe  9280                 sub.l     d0, d1
  008900  3541005c             move.w    d1, $5c(a2)
  008904  6000012e             bra.w     $8a34
  008908  4a2e0020             tst.b     $20(a6)
  00890c  672a                 beq.b     $8938
  00890e  302a0050             move.w    $50(a2), d0
  008912  c1c4                 muls.w    d4, d0
  008914  e080                 asr.l     #$8, d0
  008916  35400050             move.w    d0, $50(a2)
  00891a  302a004e             move.w    $4e(a2), d0
  00891e  c1c4                 muls.w    d4, d0
  008920  e080                 asr.l     #$8, d0
  008922  3540004e             move.w    d0, $4e(a2)
  008926  4a6a0050             tst.w     $50(a2)
  00892a  6f0c                 ble.b     $8938
  00892c  302a0050             move.w    $50(a2), d0
  008930  48c0                 ext.l     d0
  008932  4480                 neg.l     d0
  008934  35400050             move.w    d0, $50(a2)
  008938  302b0006             move.w    $6(a3), d0
  00893c  48c0                 ext.l     d0
  00893e  322efffe             move.w    -$2(a6), d1
  008942  48c1                 ext.l     d1
  008944  74f2                 moveq     #$f2, d2
  008946  d282                 add.l     d2, d1
  008948  9280                 sub.l     d0, d1
  00894a  302a005c             move.w    $5c(a2), d0
  00894e  48c0                 ext.l     d0
  008950  b081                 cmp.l     d1, d0
  008952  6f0000e0             ble.w     $8a34
  008956  302b0006             move.w    $6(a3), d0
  00895a  48c0                 ext.l     d0
  00895c  322efffe             move.w    -$2(a6), d1
  008960  48c1                 ext.l     d1
  008962  74f2                 moveq     #$f2, d2
  008964  d282                 add.l     d2, d1
  008966  9280                 sub.l     d0, d1
  008968  3541005c             move.w    d1, $5c(a2)
  00896c  600000c6             bra.w     $8a34
  008970  4a2e0020             tst.b     $20(a6)
  008974  672c                 beq.b     $89a2
  008976  302a0050             move.w    $50(a2), d0
  00897a  c1c4                 muls.w    d4, d0
  00897c  e080                 asr.l     #$8, d0
  00897e  35400050             move.w    d0, $50(a2)
  008982  302a004e             move.w    $4e(a2), d0
  008986  c1c4                 muls.w    d4, d0
  008988  e080                 asr.l     #$8, d0
  00898a  4480                 neg.l     d0
  00898c  3540004e             move.w    d0, $4e(a2)
  008990  4a6a004e             tst.w     $4e(a2)
  008994  6c0c                 bge.b     $89a2
  008996  302a004e             move.w    $4e(a2), d0
  00899a  48c0                 ext.l     d0
  00899c  4480                 neg.l     d0
  00899e  3540004e             move.w    d0, $4e(a2)
  0089a2  3013                 move.w    (a3), d0
  0089a4  48c0                 ext.l     d0
  0089a6  322efffc             move.w    -$4(a6), d1
  0089aa  48c1                 ext.l     d1
  0089ac  740e                 moveq     #$e, d2
  0089ae  d282                 add.l     d2, d1
  0089b0  9280                 sub.l     d0, d1
  0089b2  302a005a             move.w    $5a(a2), d0
  0089b6  48c0                 ext.l     d0
  0089b8  b081                 cmp.l     d1, d0
  0089ba  6c78                 bge.b     $8a34
  0089bc  3013                 move.w    (a3), d0
  0089be  48c0                 ext.l     d0
  0089c0  322efffc             move.w    -$4(a6), d1
  0089c4  48c1                 ext.l     d1
  0089c6  740e                 moveq     #$e, d2
  0089c8  d282                 add.l     d2, d1
  0089ca  9280                 sub.l     d0, d1
  0089cc  3541005a             move.w    d1, $5a(a2)
  0089d0  6062                 bra.b     $8a34
  0089d2  4a2e0020             tst.b     $20(a6)
  0089d6  672a                 beq.b     $8a02
  0089d8  302a0050             move.w    $50(a2), d0
  0089dc  c1c4                 muls.w    d4, d0
  0089de  e080                 asr.l     #$8, d0
  0089e0  35400050             move.w    d0, $50(a2)
  0089e4  302a004e             move.w    $4e(a2), d0
  0089e8  c1c4                 muls.w    d4, d0
  0089ea  e080                 asr.l     #$8, d0
  0089ec  3540004e             move.w    d0, $4e(a2)
  0089f0  4a6a004e             tst.w     $4e(a2)
  0089f4  6f0c                 ble.b     $8a02
  0089f6  302a004e             move.w    $4e(a2), d0
  0089fa  48c0                 ext.l     d0
  0089fc  4480                 neg.l     d0
  0089fe  3540004e             move.w    d0, $4e(a2)
  008a02  302b0004             move.w    $4(a3), d0
  008a06  48c0                 ext.l     d0
  008a08  322efffc             move.w    -$4(a6), d1
  008a0c  48c1                 ext.l     d1
  008a0e  74f2                 moveq     #$f2, d2
  008a10  d282                 add.l     d2, d1
  008a12  9280                 sub.l     d0, d1
  008a14  302a005a             move.w    $5a(a2), d0
  008a18  48c0                 ext.l     d0
  008a1a  b081                 cmp.l     d1, d0
  008a1c  6f16                 ble.b     $8a34
  008a1e  302b0004             move.w    $4(a3), d0
  008a22  48c0                 ext.l     d0
  008a24  322efffc             move.w    -$4(a6), d1
  008a28  48c1                 ext.l     d1
  008a2a  74f2                 moveq     #$f2, d2
  008a2c  d282                 add.l     d2, d1
  008a2e  9280                 sub.l     d0, d1
  008a30  3541005a             move.w    d1, $5a(a2)
  008a34  4a07                 tst.b     d7
  008a36  6718                 beq.b     $8a50
  008a38  302a005c             move.w    $5c(a2), d0
  008a3c  48c0                 ext.l     d0
  008a3e  e188                 lsl.l     #$8, d0
  008a40  2540005e             move.l    d0, $5e(a2)
  008a44  302a005a             move.w    $5a(a2), d0
  008a48  48c0                 ext.l     d0
  008a4a  e188                 lsl.l     #$8, d0
  008a4c  25400062             move.l    d0, $62(a2)
  008a50  1007                 move.b    d7, d0
  008a52  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  008a56  4e5e                 unlk      a6
  008a58  4e75                 rts       

;-------------------------------------------------------------
; STPlayRegSound   (seg 2 +008a6a, 100 bytes)
  008a6a  4e56ffe4             link.w    a6, #$ffe4
  008a6e  2f03                 move.l    d3, -(a7)
  008a70  76ff                 moveq     #$ff, d3
  008a72  4a390000617c         tst.b     $617c.l   ; g_617c
  008a78  674c                 beq.b     $8ac6
  008a7a  4aae0008             tst.l     $8(a6)
  008a7e  6746                 beq.b     $8ac6
  008a80  2d6e0008ffe4         move.l    $8(a6), -$1c(a6)
  008a86  2d7c00010000ffec     move.l    #$10000, -$14(a6)
  008a8e  42aefff0             clr.l     -$10(a6)
  008a92  42aefff4             clr.l     -$c(a6)
  008a96  3d6e000cfff8         move.w    $c(a6), -$8(a6)
  008a9c  302e000e             move.w    $e(a6), d0
  008aa0  48c0                 ext.l     d0
  008aa2  4c390800000046c8     muls.l    $46c8.l, d0   ; g_46c8
  008aaa  e080                 asr.l     #$8, d0
  008aac  3d40fffc             move.w    d0, -$4(a6)
  008ab0  3d40fffa             move.w    d0, -$6(a6)
  008ab4  42aeffe8             clr.l     -$18(a6)
  008ab8  486effe4             pea.l     -$1c(a6)
  008abc  4eb9000001b8         jsr       $1b8.l   ; seg7+8456
  008ac2  2600                 move.l    d0, d3
  008ac4  584f                 addq.w    #$4, a7
  008ac6  2003                 move.l    d3, d0
  008ac8  261f                 move.l    (a7)+, d3
  008aca  4e5e                 unlk      a6
  008acc  4e75                 rts       

;-------------------------------------------------------------
; PEDistance   (seg 2 +008ae0, 356 bytes)
  008ae0  4e56fff2             link.w    a6, #$fff2
  008ae4  48e71800             movem.l   d3-d4, -(a7)
  008ae8  382e0008             move.w    $8(a6), d4
  008aec  362e000a             move.w    $a(a6), d3
  008af0  4a43                 tst.w     d3
  008af2  6f06                 ble.b     $8afa
  008af4  3003                 move.w    d3, d0
  008af6  48c0                 ext.l     d0
  008af8  6006                 bra.b     $8b00
  008afa  3003                 move.w    d3, d0
  008afc  48c0                 ext.l     d0
  008afe  4480                 neg.l     d0
  008b00  2d40fff2             move.l    d0, -$e(a6)
  008b04  4a44                 tst.w     d4
  008b06  6f06                 ble.b     $8b0e
  008b08  3004                 move.w    d4, d0
  008b0a  48c0                 ext.l     d0
  008b0c  6006                 bra.b     $8b14
  008b0e  3004                 move.w    d4, d0
  008b10  48c0                 ext.l     d0
  008b12  4480                 neg.l     d0
  008b14  b0aefff2             cmp.l     -$e(a6), d0
  008b18  6c12                 bge.b     $8b2c
  008b1a  4a44                 tst.w     d4
  008b1c  6f06                 ble.b     $8b24
  008b1e  3004                 move.w    d4, d0
  008b20  48c0                 ext.l     d0
  008b22  6006                 bra.b     $8b2a
  008b24  3004                 move.w    d4, d0
  008b26  48c0                 ext.l     d0
  008b28  4480                 neg.l     d0
  008b2a  6010                 bra.b     $8b3c
  008b2c  4a43                 tst.w     d3
  008b2e  6f06                 ble.b     $8b36
  008b30  3003                 move.w    d3, d0
  008b32  48c0                 ext.l     d0
  008b34  6006                 bra.b     $8b3c
  008b36  3003                 move.w    d3, d0
  008b38  48c0                 ext.l     d0
  008b3a  4480                 neg.l     d0
  008b3c  2d40fff6             move.l    d0, -$a(a6)
  008b40  4a43                 tst.w     d3
  008b42  6f06                 ble.b     $8b4a
  008b44  3003                 move.w    d3, d0
  008b46  48c0                 ext.l     d0
  008b48  6006                 bra.b     $8b50
  008b4a  3003                 move.w    d3, d0
  008b4c  48c0                 ext.l     d0
  008b4e  4480                 neg.l     d0
  008b50  2d40fffa             move.l    d0, -$6(a6)
  008b54  4a44                 tst.w     d4
  008b56  6f06                 ble.b     $8b5e
  008b58  3004                 move.w    d4, d0
  008b5a  48c0                 ext.l     d0
  008b5c  6006                 bra.b     $8b64
  008b5e  3004                 move.w    d4, d0
  008b60  48c0                 ext.l     d0
  008b62  4480                 neg.l     d0
  008b64  b0aefffa             cmp.l     -$6(a6), d0
  008b68  6f12                 ble.b     $8b7c
  008b6a  4a44                 tst.w     d4
  008b6c  6f06                 ble.b     $8b74
  008b6e  3004                 move.w    d4, d0
  008b70  48c0                 ext.l     d0
  008b72  6006                 bra.b     $8b7a
  008b74  3004                 move.w    d4, d0
  008b76  48c0                 ext.l     d0
  008b78  4480                 neg.l     d0
  008b7a  6010                 bra.b     $8b8c
  008b7c  4a43                 tst.w     d3
  008b7e  6f06                 ble.b     $8b86
  008b80  3003                 move.w    d3, d0
  008b82  48c0                 ext.l     d0
  008b84  6006                 bra.b     $8b8c
  008b86  3003                 move.w    d3, d0
  008b88  48c0                 ext.l     d0
  008b8a  4480                 neg.l     d0
  008b8c  d0aefff6             add.l     -$a(a6), d0
  008b90  3d40fffe             move.w    d0, -$2(a6)
  008b94  4a43                 tst.w     d3
  008b96  6f06                 ble.b     $8b9e
  008b98  3003                 move.w    d3, d0
  008b9a  48c0                 ext.l     d0
  008b9c  6006                 bra.b     $8ba4
  008b9e  3003                 move.w    d3, d0
  008ba0  48c0                 ext.l     d0
  008ba2  4480                 neg.l     d0
  008ba4  2d40fffa             move.l    d0, -$6(a6)
  008ba8  4a44                 tst.w     d4
  008baa  6f06                 ble.b     $8bb2
  008bac  3004                 move.w    d4, d0
  008bae  48c0                 ext.l     d0
  008bb0  6006                 bra.b     $8bb8
  008bb2  3004                 move.w    d4, d0
  008bb4  48c0                 ext.l     d0
  008bb6  4480                 neg.l     d0
  008bb8  b0aefffa             cmp.l     -$6(a6), d0
  008bbc  6c12                 bge.b     $8bd0
  008bbe  4a44                 tst.w     d4
  008bc0  6f06                 ble.b     $8bc8
  008bc2  3004                 move.w    d4, d0
  008bc4  48c0                 ext.l     d0
  008bc6  6006                 bra.b     $8bce
  008bc8  3004                 move.w    d4, d0
  008bca  48c0                 ext.l     d0
  008bcc  4480                 neg.l     d0
  008bce  6010                 bra.b     $8be0
  008bd0  4a43                 tst.w     d3
  008bd2  6f06                 ble.b     $8bda
  008bd4  3003                 move.w    d3, d0
  008bd6  48c0                 ext.l     d0
  008bd8  6006                 bra.b     $8be0
  008bda  3003                 move.w    d3, d0
  008bdc  48c0                 ext.l     d0
  008bde  4480                 neg.l     d0
  008be0  4c7c080000000003     divs.l    #$3, d0
  008be8  2d40fff6             move.l    d0, -$a(a6)
  008bec  4a43                 tst.w     d3
  008bee  6f06                 ble.b     $8bf6
  008bf0  3003                 move.w    d3, d0
  008bf2  48c0                 ext.l     d0
  008bf4  6006                 bra.b     $8bfc
  008bf6  3003                 move.w    d3, d0
  008bf8  48c0                 ext.l     d0
  008bfa  4480                 neg.l     d0
  008bfc  2d40fff2             move.l    d0, -$e(a6)
  008c00  4a44                 tst.w     d4
  008c02  6f06                 ble.b     $8c0a
  008c04  3004                 move.w    d4, d0
  008c06  48c0                 ext.l     d0
  008c08  6006                 bra.b     $8c10
  008c0a  3004                 move.w    d4, d0
  008c0c  48c0                 ext.l     d0
  008c0e  4480                 neg.l     d0
  008c10  b0aefff2             cmp.l     -$e(a6), d0
  008c14  6f12                 ble.b     $8c28
  008c16  4a44                 tst.w     d4
  008c18  6f06                 ble.b     $8c20
  008c1a  3004                 move.w    d4, d0
  008c1c  48c0                 ext.l     d0
  008c1e  6006                 bra.b     $8c26
  008c20  3004                 move.w    d4, d0
  008c22  48c0                 ext.l     d0
  008c24  4480                 neg.l     d0
  008c26  6010                 bra.b     $8c38
  008c28  4a43                 tst.w     d3
  008c2a  6f06                 ble.b     $8c32
  008c2c  3003                 move.w    d3, d0
  008c2e  48c0                 ext.l     d0
  008c30  6006                 bra.b     $8c38
  008c32  3003                 move.w    d3, d0
  008c34  48c0                 ext.l     d0
  008c36  4480                 neg.l     d0
  008c38  d0aefff6             add.l     -$a(a6), d0
  008c3c  4cdf0018             movem.l   (a7)+, d3-d4
  008c40  4e5e                 unlk      a6
  008c42  4e75                 rts       

;-------------------------------------------------------------
; CalcStereoVolume   (seg 2 +008c52, 264 bytes)
  008c52  4e56fffc             link.w    a6, #$fffc
  008c56  48e71f00             movem.l   d3-d7, -(a7)
  008c5a  38390000806a         move.w    $806a.l, d4   ; viewLeft
  008c60  3a3900008068         move.w    $8068.l, d5   ; viewTop
  008c66  48c5                 ext.l     d5
  008c68  0685000000e0         addi.l    #$e0, d5
  008c6e  3c390000806a         move.w    $806a.l, d6   ; viewLeft
  008c74  48c6                 ext.l     d6
  008c76  0686000001c0         addi.l    #$1c0, d6
  008c7c  3e3900008068         move.w    $8068.l, d7   ; viewTop
  008c82  48c7                 ext.l     d7
  008c84  0687000000e0         addi.l    #$e0, d7
  008c8a  302e0010             move.w    $10(a6), d0
  008c8e  48c0                 ext.l     d0
  008c90  3604                 move.w    d4, d3
  008c92  48c3                 ext.l     d3
  008c94  9680                 sub.l     d0, d3
  008c96  4a83                 tst.l     d3
  008c98  6c02                 bge.b     $8c9c
  008c9a  4483                 neg.l     d3
  008c9c  302e000e             move.w    $e(a6), d0
  008ca0  48c0                 ext.l     d0
  008ca2  3805                 move.w    d5, d4
  008ca4  48c4                 ext.l     d4
  008ca6  9880                 sub.l     d0, d4
  008ca8  4a84                 tst.l     d4
  008caa  6c02                 bge.b     $8cae
  008cac  4484                 neg.l     d4
  008cae  3f04                 move.w    d4, -(a7)
  008cb0  3f03                 move.w    d3, -(a7)
  008cb2  61fffffffe2c         bsr.l     $8ae0   ; PEDistance
  008cb8  48c0                 ext.l     d0
  008cba  2a00                 move.l    d0, d5
  008cbc  0c8500000400         cmpi.l    #$400, d5
  008cc2  584f                 addq.w    #$4, a7
  008cc4  6f06                 ble.b     $8ccc
  008cc6  426efffc             clr.w     -$4(a6)
  008cca  6010                 bra.b     $8cdc
  008ccc  2605                 move.l    d5, d3
  008cce  203c00000400         move.l    #$400, d0
  008cd4  9083                 sub.l     d3, d0
  008cd6  e680                 asr.l     #$3, d0
  008cd8  3d40fffc             move.w    d0, -$4(a6)
  008cdc  302e0010             move.w    $10(a6), d0
  008ce0  48c0                 ext.l     d0
  008ce2  3606                 move.w    d6, d3
  008ce4  48c3                 ext.l     d3
  008ce6  9680                 sub.l     d0, d3
  008ce8  4a83                 tst.l     d3
  008cea  6c02                 bge.b     $8cee
  008cec  4483                 neg.l     d3
  008cee  302e000e             move.w    $e(a6), d0
  008cf2  48c0                 ext.l     d0
  008cf4  3807                 move.w    d7, d4
  008cf6  48c4                 ext.l     d4
  008cf8  9880                 sub.l     d0, d4
  008cfa  4a84                 tst.l     d4
  008cfc  6c02                 bge.b     $8d00
  008cfe  4484                 neg.l     d4
  008d00  3f04                 move.w    d4, -(a7)
  008d02  3f03                 move.w    d3, -(a7)
  008d04  61fffffffdda         bsr.l     $8ae0   ; PEDistance
  008d0a  48c0                 ext.l     d0
  008d0c  2a00                 move.l    d0, d5
  008d0e  0c8500000400         cmpi.l    #$400, d5
  008d14  584f                 addq.w    #$4, a7
  008d16  6f06                 ble.b     $8d1e
  008d18  426efffe             clr.w     -$2(a6)
  008d1c  6010                 bra.b     $8d2e
  008d1e  2605                 move.l    d5, d3
  008d20  203c00000400         move.l    #$400, d0
  008d26  9083                 sub.l     d3, d0
  008d28  e680                 asr.l     #$3, d0
  008d2a  3d40fffe             move.w    d0, -$2(a6)
  008d2e  302efffc             move.w    -$4(a6), d0
  008d32  c1ee000c             muls.w    $c(a6), d0
  008d36  ee80                 asr.l     #$7, d0
  008d38  3d40fffc             move.w    d0, -$4(a6)
  008d3c  302efffe             move.w    -$2(a6), d0
  008d40  c1ee000c             muls.w    $c(a6), d0
  008d44  ee80                 asr.l     #$7, d0
  008d46  3d40fffe             move.w    d0, -$2(a6)
  008d4a  206e0008             movea.l   $8(a6), a0
  008d4e  20aefffc             move.l    -$4(a6), (a0)
  008d52  4cdf00f8             movem.l   (a7)+, d3-d7
  008d56  4e5e                 unlk      a6
  008d58  4e75                 rts       

;-------------------------------------------------------------
; STPlayDynamicSound   (seg 2 +008d6e, 290 bytes)
  008d6e  4e56ffe0             link.w    a6, #$ffe0
  008d72  48e71e20             movem.l   d3-d6/a2, -(a7)
  008d76  246e0008             movea.l   $8(a6), a2
  008d7a  3c2e000c             move.w    $c(a6), d6
  008d7e  3a2e000e             move.w    $e(a6), d5
  008d82  78ff                 moveq     #$ff, d4
  008d84  4a390000617c         tst.b     $617c.l   ; g_617c
  008d8a  670000fc             beq.w     $8e88
  008d8e  200a                 move.l    a2, d0
  008d90  670000f6             beq.w     $8e88
  008d94  7600                 moveq     #$0, d3
  008d96  6016                 bra.b     $8dae
  008d98  7018                 moveq     #$18, d0
  008d9a  c1c3                 muls.w    d3, d0
  008d9c  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008da2  4a300800             tst.b     (a0, d0.l)
  008da6  6604                 bne.b     $8dac
  008da8  3803                 move.w    d3, d4
  008daa  7610                 moveq     #$10, d3
  008dac  5243                 addq.w    #$1, d3
  008dae  0c430010             cmpi.w    #$10, d3
  008db2  6de4                 blt.b     $8d98
  008db4  0c44ffff             cmpi.w    #$ffff, d4
  008db8  670000ce             beq.w     $8e88
  008dbc  2d4affe4             move.l    a2, -$1c(a6)
  008dc0  2d7c00010000ffec     move.l    #$10000, -$14(a6)
  008dc8  42aefff0             clr.l     -$10(a6)
  008dcc  42aefff4             clr.l     -$c(a6)
  008dd0  3d46fff8             move.w    d6, -$8(a6)
  008dd4  42aeffe8             clr.l     -$18(a6)
  008dd8  2f2e0010             move.l    $10(a6), -(a7)
  008ddc  3005                 move.w    d5, d0
  008dde  48c0                 ext.l     d0
  008de0  4c390800000046c8     muls.l    $46c8.l, d0   ; g_46c8
  008de8  e080                 asr.l     #$8, d0
  008dea  3f00                 move.w    d0, -(a7)
  008dec  486effe0             pea.l     -$20(a6)
  008df0  61fffffffe60         bsr.l     $8c52   ; CalcStereoVolume
  008df6  3d6effe0fffa         move.w    -$20(a6), -$6(a6)
  008dfc  3d6effe2fffc         move.w    -$1e(a6), -$4(a6)
  008e02  486effe4             pea.l     -$1c(a6)
  008e06  4eb9000001b8         jsr       $1b8.l   ; seg7+8456
  008e0c  2600                 move.l    d0, d3
  008e0e  7018                 moveq     #$18, d0
  008e10  c1c4                 muls.w    d4, d0
  008e12  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e18  11bc00010800         move.b    #$1, (a0, d0.l)
  008e1e  7018                 moveq     #$18, d0
  008e20  c1c4                 muls.w    d4, d0
  008e22  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e28  21830804             move.l    d3, $4(a0, d0.l)
  008e2c  7018                 moveq     #$18, d0
  008e2e  c1c4                 muls.w    d4, d0
  008e30  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e36  218a0808             move.l    a2, $8(a0, d0.l)
  008e3a  7018                 moveq     #$18, d0
  008e3c  c1c4                 muls.w    d4, d0
  008e3e  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e44  3186080c             move.w    d6, $c(a0, d0.l)
  008e48  3005                 move.w    d5, d0
  008e4a  48c0                 ext.l     d0
  008e4c  4c390800000046c8     muls.l    $46c8.l, d0   ; g_46c8
  008e54  e080                 asr.l     #$8, d0
  008e56  7218                 moveq     #$18, d1
  008e58  c3c4                 muls.w    d4, d1
  008e5a  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e60  3180180e             move.w    d0, $e(a0, d1.l)
  008e64  7018                 moveq     #$18, d0
  008e66  c1c4                 muls.w    d4, d0
  008e68  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e6e  21ae00100810         move.l    $10(a6), $10(a0, d0.l)
  008e74  7018                 moveq     #$18, d0
  008e76  c1c4                 muls.w    d4, d0
  008e78  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008e7e  21ae00140814         move.l    $14(a6), $14(a0, d0.l)
  008e84  4fef000e             lea.l     $e(a7), a7
  008e88  4cdf0478             movem.l   (a7)+, d3-d6/a2
  008e8c  4e5e                 unlk      a6
  008e8e  4e75                 rts       

;-------------------------------------------------------------
; InitDynamicSounds   (seg 2 +008ea6, 34 bytes)
  008ea6  4e560000             link.w    a6, #$0
  008eaa  7200                 moveq     #$0, d1
  008eac  6010                 bra.b     $8ebe
  008eae  7018                 moveq     #$18, d0
  008eb0  c1c1                 muls.w    d1, d0
  008eb2  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008eb8  42300800             clr.b     (a0, d0.l)
  008ebc  5241                 addq.w    #$1, d1
  008ebe  0c41000f             cmpi.w    #$f, d1
  008ec2  6dea                 blt.b     $8eae
  008ec4  4e5e                 unlk      a6
  008ec6  4e75                 rts       

;-------------------------------------------------------------
; UpdateDynamicSounds   (seg 2 +008edc, 276 bytes)
  008edc  4e56ffe0             link.w    a6, #$ffe0
  008ee0  2f03                 move.l    d3, -(a7)
  008ee2  7600                 moveq     #$0, d3
  008ee4  600000fc             bra.w     $8fe2
  008ee8  7018                 moveq     #$18, d0
  008eea  c1c3                 muls.w    d3, d0
  008eec  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008ef2  4a300800             tst.b     (a0, d0.l)
  008ef6  670000e8             beq.w     $8fe0
  008efa  7018                 moveq     #$18, d0
  008efc  c1c3                 muls.w    d3, d0
  008efe  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f04  2f300804             move.l    $4(a0, d0.l), -(a7)
  008f08  4eb9000001c8         jsr       $1c8.l   ; seg7+87b0
  008f0e  4a40                 tst.w     d0
  008f10  584f                 addq.w    #$4, a7
  008f12  6612                 bne.b     $8f26
  008f14  7018                 moveq     #$18, d0
  008f16  c1c3                 muls.w    d3, d0
  008f18  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f1e  42300800             clr.b     (a0, d0.l)
  008f22  600000bc             bra.w     $8fe0
  008f26  7018                 moveq     #$18, d0
  008f28  c1c3                 muls.w    d3, d0
  008f2a  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f30  7218                 moveq     #$18, d1
  008f32  c3c3                 muls.w    d3, d1
  008f34  43f9000072d8         lea.l     $72d8.l, a1   ; g_72d8
  008f3a  43f11812             lea.l     $12(a1, d1.l), a1
  008f3e  30300816             move.w    $16(a0, d0.l), d0
  008f42  d151                 add.w     d0, (a1)
  008f44  7018                 moveq     #$18, d0
  008f46  c1c3                 muls.w    d3, d0
  008f48  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f4e  7218                 moveq     #$18, d1
  008f50  c3c3                 muls.w    d3, d1
  008f52  43f9000072d8         lea.l     $72d8.l, a1   ; g_72d8
  008f58  43f11810             lea.l     $10(a1, d1.l), a1
  008f5c  30300814             move.w    $14(a0, d0.l), d0
  008f60  d151                 add.w     d0, (a1)
  008f62  7018                 moveq     #$18, d0
  008f64  c1c3                 muls.w    d3, d0
  008f66  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f6c  2d700808ffe4         move.l    $8(a0, d0.l), -$1c(a6)
  008f72  2d7c00010000ffec     move.l    #$10000, -$14(a6)
  008f7a  42aefff0             clr.l     -$10(a6)
  008f7e  42aefff4             clr.l     -$c(a6)
  008f82  7018                 moveq     #$18, d0
  008f84  c1c3                 muls.w    d3, d0
  008f86  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f8c  3d70080cfff8         move.w    $c(a0, d0.l), -$8(a6)
  008f92  7018                 moveq     #$18, d0
  008f94  c1c3                 muls.w    d3, d0
  008f96  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008f9c  2f300810             move.l    $10(a0, d0.l), -(a7)
  008fa0  7018                 moveq     #$18, d0
  008fa2  c1c3                 muls.w    d3, d0
  008fa4  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008faa  3f30080e             move.w    $e(a0, d0.l), -(a7)
  008fae  486effe0             pea.l     -$20(a6)
  008fb2  61fffffffc9e         bsr.l     $8c52   ; CalcStereoVolume
  008fb8  3d6effe0fffa         move.w    -$20(a6), -$6(a6)
  008fbe  3d6effe2fffc         move.w    -$1e(a6), -$4(a6)
  008fc4  486effe4             pea.l     -$1c(a6)
  008fc8  7018                 moveq     #$18, d0
  008fca  c1c3                 muls.w    d3, d0
  008fcc  41f9000072d8         lea.l     $72d8.l, a0   ; g_72d8
  008fd2  2f300804             move.l    $4(a0, d0.l), -(a7)
  008fd6  4eb9000001d8         jsr       $1d8.l   ; seg7+88ec
  008fdc  4fef0012             lea.l     $12(a7), a7
  008fe0  5243                 addq.w    #$1, d3
  008fe2  0c43000f             cmpi.w    #$f, d3
  008fe6  6d00ff00             blt.w     $8ee8
  008fea  261f                 move.l    (a7)+, d3
  008fec  4e5e                 unlk      a6
  008fee  4e75                 rts       

;-------------------------------------------------------------
; STPlay3DSound   (seg 2 +009006, 122 bytes)
  009006  4e56ffe0             link.w    a6, #$ffe0
  00900a  2f03                 move.l    d3, -(a7)
  00900c  76ff                 moveq     #$ff, d3
  00900e  4a390000617c         tst.b     $617c.l   ; g_617c
  009014  6762                 beq.b     $9078
  009016  4aae0008             tst.l     $8(a6)
  00901a  675c                 beq.b     $9078
  00901c  2d6e0008ffe4         move.l    $8(a6), -$1c(a6)
  009022  2d7c00010000ffec     move.l    #$10000, -$14(a6)
  00902a  42aefff0             clr.l     -$10(a6)
  00902e  42aefff4             clr.l     -$c(a6)
  009032  3d6e000cfff8         move.w    $c(a6), -$8(a6)
  009038  42aeffe8             clr.l     -$18(a6)
  00903c  2f2e0010             move.l    $10(a6), -(a7)
  009040  302e000e             move.w    $e(a6), d0
  009044  48c0                 ext.l     d0
  009046  4c390800000046c8     muls.l    $46c8.l, d0   ; g_46c8
  00904e  e080                 asr.l     #$8, d0
  009050  3f00                 move.w    d0, -(a7)
  009052  486effe0             pea.l     -$20(a6)
  009056  61fffffffbfa         bsr.l     $8c52   ; CalcStereoVolume
  00905c  3d6effe0fffa         move.w    -$20(a6), -$6(a6)
  009062  3d6effe2fffc         move.w    -$1e(a6), -$4(a6)
  009068  486effe4             pea.l     -$1c(a6)
  00906c  4eb9000001b8         jsr       $1b8.l   ; seg7+8456
  009072  2600                 move.l    d0, d3
  009074  4fef000e             lea.l     $e(a7), a7
  009078  2003                 move.l    d3, d0
  00907a  261f                 move.l    (a7)+, d3
  00907c  4e5e                 unlk      a6
  00907e  4e75                 rts       

;-------------------------------------------------------------
; STPlay3DSoundPitched   (seg 2 +009090, 120 bytes)
  009090  4e56ffe0             link.w    a6, #$ffe0
  009094  2f03                 move.l    d3, -(a7)
  009096  76ff                 moveq     #$ff, d3
  009098  4a390000617c         tst.b     $617c.l   ; g_617c
  00909e  6760                 beq.b     $9100
  0090a0  4aae0008             tst.l     $8(a6)
  0090a4  675a                 beq.b     $9100
  0090a6  2d6e0008ffe4         move.l    $8(a6), -$1c(a6)
  0090ac  2d6e0014ffec         move.l    $14(a6), -$14(a6)
  0090b2  42aefff0             clr.l     -$10(a6)
  0090b6  42aefff4             clr.l     -$c(a6)
  0090ba  3d6e000cfff8         move.w    $c(a6), -$8(a6)
  0090c0  42aeffe8             clr.l     -$18(a6)
  0090c4  2f2e0010             move.l    $10(a6), -(a7)
  0090c8  302e000e             move.w    $e(a6), d0
  0090cc  48c0                 ext.l     d0
  0090ce  4c390800000046c8     muls.l    $46c8.l, d0   ; g_46c8
  0090d6  e080                 asr.l     #$8, d0
  0090d8  3f00                 move.w    d0, -(a7)
  0090da  486effe0             pea.l     -$20(a6)
  0090de  61fffffffb72         bsr.l     $8c52   ; CalcStereoVolume
  0090e4  3d6effe0fffa         move.w    -$20(a6), -$6(a6)
  0090ea  3d6effe2fffc         move.w    -$1e(a6), -$4(a6)
  0090f0  486effe4             pea.l     -$1c(a6)
  0090f4  4eb9000001b8         jsr       $1b8.l   ; seg7+8456
  0090fa  2600                 move.l    d0, d3
  0090fc  4fef000e             lea.l     $e(a7), a7
  009100  2003                 move.l    d3, d0
  009102  261f                 move.l    (a7)+, d3
  009104  4e5e                 unlk      a6
  009106  4e75                 rts       

;-------------------------------------------------------------
; FindInvRow   (seg 2 +009120, 56 bytes)
  009120  4e560000             link.w    a6, #$0
  009124  2f03                 move.l    d3, -(a7)
  009126  302e0008             move.w    $8(a6), d0
  00912a  48c0                 ext.l     d0
  00912c  0c800000000b         cmpi.l    #$b, d0
  009132  621c                 bhi.b     $9150
  009134  5740                 subq.w    #$3, d0
  009136  6d0a                 blt.b     $9142
  009138  5740                 subq.w    #$3, d0
  00913a  6d0a                 blt.b     $9146
  00913c  5740                 subq.w    #$3, d0
  00913e  6d0a                 blt.b     $914a
  009140  600c                 bra.b     $914e
  009142  7600                 moveq     #$0, d3
  009144  600a                 bra.b     $9150
  009146  7601                 moveq     #$1, d3
  009148  6006                 bra.b     $9150
  00914a  7602                 moveq     #$2, d3
  00914c  6002                 bra.b     $9150
  00914e  7603                 moveq     #$3, d3
  009150  3003                 move.w    d3, d0
  009152  261f                 move.l    (a7)+, d3
  009154  4e5e                 unlk      a6
  009156  4e75                 rts       

;-------------------------------------------------------------
; FindInvCol   (seg 2 +009166, 70 bytes)
  009166  4e560000             link.w    a6, #$0
  00916a  2f03                 move.l    d3, -(a7)
  00916c  302e0008             move.w    $8(a6), d0
  009170  48c0                 ext.l     d0
  009172  0c800000000b         cmpi.l    #$b, d0
  009178  622a                 bhi.b     $91a4
  00917a  303b0206             move.w    $9182(pc, d0.w * 2), d0
  00917e  4efb0002             jmp       $9182(pc, d0.w)
  009182  0018001c00200018001c00200018001c cases     0:$919a 1:$919e 2:$91a2 3:$919a 4:$919e 5:$91a2 6:$919a 7:$919e
  009192  00200018001c0020     cases     8:$91a2 9:$919a 10:$919e 11:$91a2
  00919a  7600                 moveq     #$0, d3
  00919c  6006                 bra.b     $91a4
  00919e  7601                 moveq     #$1, d3
  0091a0  6002                 bra.b     $91a4
  0091a2  7602                 moveq     #$2, d3
  0091a4  3003                 move.w    d3, d0
  0091a6  261f                 move.l    (a7)+, d3
  0091a8  4e5e                 unlk      a6
  0091aa  4e75                 rts       

;-------------------------------------------------------------
; GenericMessage   (seg 2 +0091ba, 198 bytes)
  0091ba  4e56fff0             link.w    a6, #$fff0
  0091be  48e71020             movem.l   d3/a2, -(a7)
  0091c2  7600                 moveq     #$0, d3
  0091c4  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0091ca  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  0091d0  6706                 beq.b     $91d8
  0091d2  61ffffffc148         bsr.l     $531c   ; FinalGammaFadeIn
  0091d8  594f                 subq.w    #$4, a7
  0091da  3f3c00c8             move.w    #$c8, -(a7)
  0091de  42a7                 clr.l     -(a7)
  0091e0  4878ffff             pea.l     $ffff.w
  0091e4  a97c                 _GetNewDialog 
  0091e6  205f                 movea.l   (a7)+, a0
  0091e8  2448                 movea.l   a0, a2
  0091ea  200a                 move.l    a2, d0
  0091ec  6700008a             beq.w     $9278
  0091f0  2f0a                 move.l    a2, -(a7)
  0091f2  a922                 _BeginUpdate 
  0091f4  2f0a                 move.l    a2, -(a7)
  0091f6  a873                 _SetPort  
  0091f8  2f0a                 move.l    a2, -(a7)
  0091fa  a873                 _SetPort  
  0091fc  2f0a                 move.l    a2, -(a7)
  0091fe  3f3c0001             move.w    #$1, -(a7)
  009202  486efff4             pea.l     -$c(a6)
  009206  486efff0             pea.l     -$10(a6)
  00920a  486efff6             pea.l     -$a(a6)
  00920e  a98d                 _GetDialogItem 
  009210  486efff6             pea.l     -$a(a6)
  009214  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00921a  a8a9                 _InsetRect 
  00921c  2f3c00030003         move.l    #$30003, -(a7)
  009222  a89b                 _PenSize  
  009224  486efff6             pea.l     -$a(a6)
  009228  2f3c000f000f         move.l    #$f000f, -(a7)
  00922e  a8b0                 _FrameRoundRect 
  009230  2f0a                 move.l    a2, -(a7)
  009232  a923                 _EndUpdate 
  009234  2f0a                 move.l    a2, -(a7)
  009236  a981                 _DrawDialog 
  009238  2f0a                 move.l    a2, -(a7)
  00923a  a915                 _ShowWindow 
  00923c  2f0a                 move.l    a2, -(a7)
  00923e  a91f                 _SelectWindow 
  009240  61ffffffcc3a         bsr.l     $5e7c   ; ShowCursorSafe
  009246  6016                 bra.b     $925e
  009248  42a7                 clr.l     -(a7)
  00924a  486efffe             pea.l     -$2(a6)
  00924e  a991                 _ModalDialog 
  009250  302efffe             move.w    -$2(a6), d0
  009254  48c0                 ext.l     d0
  009256  5380                 subq.l    #$1, d0
  009258  6702                 beq.b     $925c
  00925a  6002                 bra.b     $925e
  00925c  7601                 moveq     #$1, d3
  00925e  4a03                 tst.b     d3
  009260  67e6                 beq.b     $9248
  009262  2f0a                 move.l    a2, -(a7)
  009264  a983                 _DisposeDialog 
  009266  61ffffffcc70         bsr.l     $5ed8   ; ResetCursor
  00926c  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  009272  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  009278  4cdf0408             movem.l   (a7)+, d3/a2
  00927c  4e5e                 unlk      a6
  00927e  4e75                 rts       

;-------------------------------------------------------------
; ReportError   (seg 2 +009292, 58 bytes)
  009292  4e56ff00             link.w    a6, #$ff00
  009296  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00929c  306e000c             movea.w   $c(a6), a0
  0092a0  2f08                 move.l    a0, -(a7)
  0092a2  486eff00             pea.l     -$100(a6)
  0092a6  4eb9000003e8         jsr       $3e8.l   ; seg4+9f2
  0092ac  2f2e0008             move.l    $8(a6), -(a7)
  0092b0  486eff00             pea.l     -$100(a6)
  0092b4  4879000045f2         pea.l     $45f2.l   ; g_45f2
  0092ba  4879000045f2         pea.l     $45f2.l   ; g_45f2
  0092c0  a98b                 _ParamText 
  0092c2  61fffffffef6         bsr.l     $91ba   ; GenericMessage
  0092c8  4e5e                 unlk      a6
  0092ca  4e75                 rts       

;-------------------------------------------------------------
; ReportDialog   (seg 2 +0092da, 44 bytes)
  0092da  4e560000             link.w    a6, #$0
  0092de  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0092e4  2f2e0008             move.l    $8(a6), -(a7)
  0092e8  4879000045f2         pea.l     $45f2.l   ; g_45f2
  0092ee  4879000045f2         pea.l     $45f2.l   ; g_45f2
  0092f4  4879000045f2         pea.l     $45f2.l   ; g_45f2
  0092fa  a98b                 _ParamText 
  0092fc  61fffffffebc         bsr.l     $91ba   ; GenericMessage
  009302  4e5e                 unlk      a6
  009304  4e75                 rts       

;-------------------------------------------------------------
; ApproachMode   (seg 2 +009316, 116 bytes)
  009316  4e560000             link.w    a6, #$0
  00931a  48e71820             movem.l   d3-d4/a2, -(a7)
  00931e  246e0008             movea.l   $8(a6), a2
  009322  382e000c             move.w    $c(a6), d4
  009326  b86a0066             cmp.w     $66(a2), d4
  00932a  6756                 beq.b     $9382
  00932c  3004                 move.w    d4, d0
  00932e  48c0                 ext.l     d0
  009330  362a0066             move.w    $66(a2), d3
  009334  48c3                 ext.l     d3
  009336  9680                 sub.l     d0, d3
  009338  4a43                 tst.w     d3
  00933a  5dc0                 slt.b     d0
  00933c  4400                 neg.b     d0
  00933e  49c0                 extb.l    d0
  009340  1800                 move.b    d0, d4
  009342  4a43                 tst.w     d3
  009344  6c04                 bge.b     $934a
  009346  48c3                 ext.l     d3
  009348  4483                 neg.l     d3
  00934a  0c430012             cmpi.w    #$12, d3
  00934e  6f0a                 ble.b     $935a
  009350  1004                 move.b    d4, d0
  009352  57c0                 seq.b     d0
  009354  4400                 neg.b     d0
  009356  49c0                 extb.l    d0
  009358  1800                 move.b    d0, d4
  00935a  4a04                 tst.b     d4
  00935c  6706                 beq.b     $9364
  00935e  526a0066             addq.w    #$1, $66(a2)
  009362  6004                 bra.b     $9368
  009364  536a0066             subq.w    #$1, $66(a2)
  009368  0c6a00230066         cmpi.w    #$23, $66(a2)
  00936e  6f06                 ble.b     $9376
  009370  426a0066             clr.w     $66(a2)
  009374  600c                 bra.b     $9382
  009376  4a6a0066             tst.w     $66(a2)
  00937a  6c06                 bge.b     $9382
  00937c  357c00230066         move.w    #$23, $66(a2)
  009382  4cdf0418             movem.l   (a7)+, d3-d4/a2
  009386  4e5e                 unlk      a6
  009388  4e75                 rts       

;-------------------------------------------------------------
; InitSprite   (seg 2 +00939a, 124 bytes)
  00939a  4e560000             link.w    a6, #$0
  00939e  206e0008             movea.l   $8(a6), a0
  0093a2  42680072             clr.w     $72(a0)
  0093a6  42680074             clr.w     $74(a0)
  0093aa  317cffff0076         move.w    #$ffff, $76(a0)
  0093b0  42a80078             clr.l     $78(a0)
  0093b4  4268007c             clr.w     $7c(a0)
  0093b8  42a80016             clr.l     $16(a0)
  0093bc  42a8007e             clr.l     $7e(a0)
  0093c0  42680082             clr.w     $82(a0)
  0093c4  42680084             clr.w     $84(a0)
  0093c8  42a80086             clr.l     $86(a0)
  0093cc  4228008a             clr.b     $8a(a0)
  0093d0  4228008b             clr.b     $8b(a0)
  0093d4  4228008c             clr.b     $8c(a0)
  0093d8  317c01000058         move.w    #$100, $58(a0)
  0093de  317c01000056         move.w    #$100, $56(a0)
  0093e4  317c01000054         move.w    #$100, $54(a0)
  0093ea  317c01000052         move.w    #$100, $52(a0)
  0093f0  42680090             clr.w     $90(a0)
  0093f4  4268008e             clr.w     $8e(a0)
  0093f8  317cffff0068         move.w    #$ffff, $68(a0)
  0093fe  42280092             clr.b     $92(a0)
  009402  42680094             clr.w     $94(a0)
  009406  42680096             clr.w     $96(a0)
  00940a  42680050             clr.w     $50(a0)
  00940e  4268004e             clr.w     $4e(a0)
  009412  4e5e                 unlk      a6
  009414  4e75                 rts       

;-------------------------------------------------------------
; SpriteCenter   (seg 2 +009424, 76 bytes)
  009424  4e56fffc             link.w    a6, #$fffc
  009428  226e000c             movea.l   $c(a6), a1
  00942c  3029000c             move.w    $c(a1), d0
  009430  48c0                 ext.l     d0
  009432  32290008             move.w    $8(a1), d1
  009436  48c1                 ext.l     d1
  009438  d280                 add.l     d0, d1
  00943a  e281                 asr.l     #$1, d1
  00943c  3029005c             move.w    $5c(a1), d0
  009440  48c0                 ext.l     d0
  009442  d081                 add.l     d1, d0
  009444  3d40fffe             move.w    d0, -$2(a6)
  009448  3029000a             move.w    $a(a1), d0
  00944c  48c0                 ext.l     d0
  00944e  32290006             move.w    $6(a1), d1
  009452  48c1                 ext.l     d1
  009454  d280                 add.l     d0, d1
  009456  e281                 asr.l     #$1, d1
  009458  3029005a             move.w    $5a(a1), d0
  00945c  48c0                 ext.l     d0
  00945e  d081                 add.l     d1, d0
  009460  3d40fffc             move.w    d0, -$4(a6)
  009464  206e0008             movea.l   $8(a6), a0
  009468  20aefffc             move.l    -$4(a6), (a0)
  00946c  4e5e                 unlk      a6
  00946e  4e75                 rts       

;-------------------------------------------------------------
; RectBounce   (seg 2 +009480, 1006 bytes)
  009480  4e56ffdc             link.w    a6, #$ffdc
  009484  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  009488  246e0008             movea.l   $8(a6), a2
  00948c  266e000c             movea.l   $c(a6), a3
  009490  382e0010             move.w    $10(a6), d4
  009494  262e0012             move.l    $12(a6), d3
  009498  286e0016             movea.l   $16(a6), a4
  00949c  486efff0             pea.l     -$10(a6)
  0094a0  302b0008             move.w    $8(a3), d0
  0094a4  48c0                 ext.l     d0
  0094a6  322b005c             move.w    $5c(a3), d1
  0094aa  48c1                 ext.l     d1
  0094ac  d280                 add.l     d0, d1
  0094ae  3f01                 move.w    d1, -(a7)
  0094b0  302b0006             move.w    $6(a3), d0
  0094b4  48c0                 ext.l     d0
  0094b6  322b005a             move.w    $5a(a3), d1
  0094ba  48c1                 ext.l     d1
  0094bc  d280                 add.l     d0, d1
  0094be  3f01                 move.w    d1, -(a7)
  0094c0  302b000c             move.w    $c(a3), d0
  0094c4  48c0                 ext.l     d0
  0094c6  322b005c             move.w    $5c(a3), d1
  0094ca  48c1                 ext.l     d1
  0094cc  d280                 add.l     d0, d1
  0094ce  3f01                 move.w    d1, -(a7)
  0094d0  302b000a             move.w    $a(a3), d0
  0094d4  48c0                 ext.l     d0
  0094d6  322b005a             move.w    $5a(a3), d1
  0094da  48c1                 ext.l     d1
  0094dc  d280                 add.l     d0, d1
  0094de  3f01                 move.w    d1, -(a7)
  0094e0  a8a7                 _SetRect  
  0094e2  486effe4             pea.l     -$1c(a6)
  0094e6  302c0002             move.w    $2(a4), d0
  0094ea  48c0                 ext.l     d0
  0094ec  322a005c             move.w    $5c(a2), d1
  0094f0  48c1                 ext.l     d1
  0094f2  d280                 add.l     d0, d1
  0094f4  3f01                 move.w    d1, -(a7)
  0094f6  3014                 move.w    (a4), d0
  0094f8  48c0                 ext.l     d0
  0094fa  322a005a             move.w    $5a(a2), d1
  0094fe  48c1                 ext.l     d1
  009500  d280                 add.l     d0, d1
  009502  3f01                 move.w    d1, -(a7)
  009504  302c0006             move.w    $6(a4), d0
  009508  48c0                 ext.l     d0
  00950a  322a005c             move.w    $5c(a2), d1
  00950e  48c1                 ext.l     d1
  009510  d280                 add.l     d0, d1
  009512  3f01                 move.w    d1, -(a7)
  009514  302c0004             move.w    $4(a4), d0
  009518  48c0                 ext.l     d0
  00951a  322a005a             move.w    $5a(a2), d1
  00951e  48c1                 ext.l     d1
  009520  d280                 add.l     d0, d1
  009522  3f01                 move.w    d1, -(a7)
  009524  a8a7                 _SetRect  
  009526  554f                 subq.w    #$2, a7
  009528  486effe4             pea.l     -$1c(a6)
  00952c  486efff0             pea.l     -$10(a6)
  009530  486effdc             pea.l     -$24(a6)
  009534  a8aa                 _SectRect 
  009536  101f                 move.b    (a7)+, d0
  009538  6700032c             beq.w     $9866
  00953c  3004                 move.w    d4, d0
  00953e  48c0                 ext.l     d0
  009540  322a005c             move.w    $5c(a2), d1
  009544  48c1                 ext.l     d1
  009546  d280                 add.l     d0, d1
  009548  3d41fffe             move.w    d1, -$2(a6)
  00954c  3004                 move.w    d4, d0
  00954e  48c0                 ext.l     d0
  009550  322a005a             move.w    $5a(a2), d1
  009554  48c1                 ext.l     d1
  009556  d280                 add.l     d0, d1
  009558  3d41fffc             move.w    d1, -$4(a6)
  00955c  302b0008             move.w    $8(a3), d0
  009560  48c0                 ext.l     d0
  009562  322b000c             move.w    $c(a3), d1
  009566  48c1                 ext.l     d1
  009568  9280                 sub.l     d0, d1
  00956a  e281                 asr.l     #$1, d1
  00956c  302b0008             move.w    $8(a3), d0
  009570  48c0                 ext.l     d0
  009572  342b005c             move.w    $5c(a3), d2
  009576  48c2                 ext.l     d2
  009578  d480                 add.l     d0, d2
  00957a  d481                 add.l     d1, d2
  00957c  3d42fffa             move.w    d2, -$6(a6)
  009580  302b0006             move.w    $6(a3), d0
  009584  48c0                 ext.l     d0
  009586  322b000a             move.w    $a(a3), d1
  00958a  48c1                 ext.l     d1
  00958c  9280                 sub.l     d0, d1
  00958e  e281                 asr.l     #$1, d1
  009590  302b0006             move.w    $6(a3), d0
  009594  48c0                 ext.l     d0
  009596  342b005a             move.w    $5a(a3), d2
  00959a  48c2                 ext.l     d2
  00959c  d480                 add.l     d0, d2
  00959e  d481                 add.l     d1, d2
  0095a0  3d42fff8             move.w    d2, -$8(a6)
  0095a4  3d6a005cffee         move.w    $5c(a2), -$12(a6)
  0095aa  3d6a005affec         move.w    $5a(a2), -$14(a6)
  0095b0  302efffe             move.w    -$2(a6), d0
  0095b4  b06efffa             cmp.w     -$6(a6), d0
  0095b8  6c000144             bge.w     $96fe
  0095bc  302efffc             move.w    -$4(a6), d0
  0095c0  b06efff8             cmp.w     -$8(a6), d0
  0095c4  6c00009e             bge.w     $9664
  0095c8  302efffe             move.w    -$2(a6), d0
  0095cc  48c0                 ext.l     d0
  0095ce  382efffa             move.w    -$6(a6), d4
  0095d2  48c4                 ext.l     d4
  0095d4  9880                 sub.l     d0, d4
  0095d6  302efffc             move.w    -$4(a6), d0
  0095da  48c0                 ext.l     d0
  0095dc  3a2efff8             move.w    -$8(a6), d5
  0095e0  48c5                 ext.l     d5
  0095e2  9a80                 sub.l     d0, d5
  0095e4  b845                 cmp.w     d5, d4
  0095e6  6f3e                 ble.b     $9626
  0095e8  4a6a0050             tst.w     $50(a2)
  0095ec  6f22                 ble.b     $9610
  0095ee  302a0050             move.w    $50(a2), d0
  0095f2  48c0                 ext.l     d0
  0095f4  4c030800             muls.l    d3, d0
  0095f8  4480                 neg.l     d0
  0095fa  e080                 asr.l     #$8, d0
  0095fc  35400050             move.w    d0, $50(a2)
  009600  302a004e             move.w    $4e(a2), d0
  009604  48c0                 ext.l     d0
  009606  4c030800             muls.l    d3, d0
  00960a  e080                 asr.l     #$8, d0
  00960c  3540004e             move.w    d0, $4e(a2)
  009610  302c0006             move.w    $6(a4), d0
  009614  48c0                 ext.l     d0
  009616  322efff2             move.w    -$e(a6), d1
  00961a  48c1                 ext.l     d1
  00961c  9280                 sub.l     d0, d1
  00961e  3541005c             move.w    d1, $5c(a2)
  009622  60000216             bra.w     $983a
  009626  4a6a004e             tst.w     $4e(a2)
  00962a  6f22                 ble.b     $964e
  00962c  302a0050             move.w    $50(a2), d0
  009630  48c0                 ext.l     d0
  009632  4c030800             muls.l    d3, d0
  009636  e080                 asr.l     #$8, d0
  009638  35400050             move.w    d0, $50(a2)
  00963c  302a004e             move.w    $4e(a2), d0
  009640  48c0                 ext.l     d0
  009642  4c030800             muls.l    d3, d0
  009646  4480                 neg.l     d0
  009648  e080                 asr.l     #$8, d0
  00964a  3540004e             move.w    d0, $4e(a2)
  00964e  302c0004             move.w    $4(a4), d0
  009652  48c0                 ext.l     d0
  009654  322efff0             move.w    -$10(a6), d1
  009658  48c1                 ext.l     d1
  00965a  9280                 sub.l     d0, d1
  00965c  3541005a             move.w    d1, $5a(a2)
  009660  600001d8             bra.w     $983a
  009664  302efffe             move.w    -$2(a6), d0
  009668  48c0                 ext.l     d0
  00966a  382efffa             move.w    -$6(a6), d4
  00966e  48c4                 ext.l     d4
  009670  9880                 sub.l     d0, d4
  009672  302efff8             move.w    -$8(a6), d0
  009676  48c0                 ext.l     d0
  009678  3a2efffc             move.w    -$4(a6), d5
  00967c  48c5                 ext.l     d5
  00967e  9a80                 sub.l     d0, d5
  009680  b845                 cmp.w     d5, d4
  009682  6f3e                 ble.b     $96c2
  009684  4a6a0050             tst.w     $50(a2)
  009688  6f22                 ble.b     $96ac
  00968a  302a0050             move.w    $50(a2), d0
  00968e  48c0                 ext.l     d0
  009690  4c030800             muls.l    d3, d0
  009694  4480                 neg.l     d0
  009696  e080                 asr.l     #$8, d0
  009698  35400050             move.w    d0, $50(a2)
  00969c  302a004e             move.w    $4e(a2), d0
  0096a0  48c0                 ext.l     d0
  0096a2  4c030800             muls.l    d3, d0
  0096a6  e080                 asr.l     #$8, d0
  0096a8  3540004e             move.w    d0, $4e(a2)
  0096ac  302c0006             move.w    $6(a4), d0
  0096b0  48c0                 ext.l     d0
  0096b2  322efff2             move.w    -$e(a6), d1
  0096b6  48c1                 ext.l     d1
  0096b8  9280                 sub.l     d0, d1
  0096ba  3541005c             move.w    d1, $5c(a2)
  0096be  6000017a             bra.w     $983a
  0096c2  4a6a004e             tst.w     $4e(a2)
  0096c6  6c22                 bge.b     $96ea
  0096c8  302a0050             move.w    $50(a2), d0
  0096cc  48c0                 ext.l     d0
  0096ce  4c030800             muls.l    d3, d0
  0096d2  e080                 asr.l     #$8, d0
  0096d4  35400050             move.w    d0, $50(a2)
  0096d8  302a004e             move.w    $4e(a2), d0
  0096dc  48c0                 ext.l     d0
  0096de  4c030800             muls.l    d3, d0
  0096e2  4480                 neg.l     d0
  0096e4  e080                 asr.l     #$8, d0
  0096e6  3540004e             move.w    d0, $4e(a2)
  0096ea  3014                 move.w    (a4), d0
  0096ec  48c0                 ext.l     d0
  0096ee  322efff4             move.w    -$c(a6), d1
  0096f2  48c1                 ext.l     d1
  0096f4  9280                 sub.l     d0, d1
  0096f6  3541005a             move.w    d1, $5a(a2)
  0096fa  6000013e             bra.w     $983a
  0096fe  302efffc             move.w    -$4(a6), d0
  009702  b06efff8             cmp.w     -$8(a6), d0
  009706  6c00009e             bge.w     $97a6
  00970a  302efffa             move.w    -$6(a6), d0
  00970e  48c0                 ext.l     d0
  009710  382efffe             move.w    -$2(a6), d4
  009714  48c4                 ext.l     d4
  009716  9880                 sub.l     d0, d4
  009718  302efffc             move.w    -$4(a6), d0
  00971c  48c0                 ext.l     d0
  00971e  3a2efff8             move.w    -$8(a6), d5
  009722  48c5                 ext.l     d5
  009724  9a80                 sub.l     d0, d5
  009726  b845                 cmp.w     d5, d4
  009728  6f3e                 ble.b     $9768
  00972a  4a6a0050             tst.w     $50(a2)
  00972e  6c22                 bge.b     $9752
  009730  302a0050             move.w    $50(a2), d0
  009734  48c0                 ext.l     d0
  009736  4c030800             muls.l    d3, d0
  00973a  4480                 neg.l     d0
  00973c  e080                 asr.l     #$8, d0
  00973e  35400050             move.w    d0, $50(a2)
  009742  302a004e             move.w    $4e(a2), d0
  009746  48c0                 ext.l     d0
  009748  4c030800             muls.l    d3, d0
  00974c  e080                 asr.l     #$8, d0
  00974e  3540004e             move.w    d0, $4e(a2)
  009752  302c0002             move.w    $2(a4), d0
  009756  48c0                 ext.l     d0
  009758  322efff6             move.w    -$a(a6), d1
  00975c  48c1                 ext.l     d1
  00975e  9280                 sub.l     d0, d1
  009760  3541005c             move.w    d1, $5c(a2)
  009764  600000d4             bra.w     $983a
  009768  4a6a004e             tst.w     $4e(a2)
  00976c  6f22                 ble.b     $9790
  00976e  302a0050             move.w    $50(a2), d0
  009772  48c0                 ext.l     d0
  009774  4c030800             muls.l    d3, d0
  009778  e080                 asr.l     #$8, d0
  00977a  35400050             move.w    d0, $50(a2)
  00977e  302a004e             move.w    $4e(a2), d0
  009782  48c0                 ext.l     d0
  009784  4c030800             muls.l    d3, d0
  009788  4480                 neg.l     d0
  00978a  e080                 asr.l     #$8, d0
  00978c  3540004e             move.w    d0, $4e(a2)
  009790  302c0004             move.w    $4(a4), d0
  009794  48c0                 ext.l     d0
  009796  322efff0             move.w    -$10(a6), d1
  00979a  48c1                 ext.l     d1
  00979c  9280                 sub.l     d0, d1
  00979e  3541005a             move.w    d1, $5a(a2)
  0097a2  60000096             bra.w     $983a
  0097a6  302efffa             move.w    -$6(a6), d0
  0097aa  48c0                 ext.l     d0
  0097ac  382efffe             move.w    -$2(a6), d4
  0097b0  48c4                 ext.l     d4
  0097b2  9880                 sub.l     d0, d4
  0097b4  302efff8             move.w    -$8(a6), d0
  0097b8  48c0                 ext.l     d0
  0097ba  3a2efffc             move.w    -$4(a6), d5
  0097be  48c5                 ext.l     d5
  0097c0  9a80                 sub.l     d0, d5
  0097c2  b845                 cmp.w     d5, d4
  0097c4  6f3c                 ble.b     $9802
  0097c6  4a6a0050             tst.w     $50(a2)
  0097ca  6c22                 bge.b     $97ee
  0097cc  302a0050             move.w    $50(a2), d0
  0097d0  48c0                 ext.l     d0
  0097d2  4c030800             muls.l    d3, d0
  0097d6  4480                 neg.l     d0
  0097d8  e080                 asr.l     #$8, d0
  0097da  35400050             move.w    d0, $50(a2)
  0097de  302a004e             move.w    $4e(a2), d0
  0097e2  48c0                 ext.l     d0
  0097e4  4c030800             muls.l    d3, d0
  0097e8  e080                 asr.l     #$8, d0
  0097ea  3540004e             move.w    d0, $4e(a2)
  0097ee  302c0002             move.w    $2(a4), d0
  0097f2  48c0                 ext.l     d0
  0097f4  322efff6             move.w    -$a(a6), d1
  0097f8  48c1                 ext.l     d1
  0097fa  9280                 sub.l     d0, d1
  0097fc  3541005c             move.w    d1, $5c(a2)
  009800  6038                 bra.b     $983a
  009802  4a6a004e             tst.w     $4e(a2)
  009806  6c22                 bge.b     $982a
  009808  302a0050             move.w    $50(a2), d0
  00980c  48c0                 ext.l     d0
  00980e  4c030800             muls.l    d3, d0
  009812  e080                 asr.l     #$8, d0
  009814  35400050             move.w    d0, $50(a2)
  009818  302a004e             move.w    $4e(a2), d0
  00981c  48c0                 ext.l     d0
  00981e  4c030800             muls.l    d3, d0
  009822  4480                 neg.l     d0
  009824  e080                 asr.l     #$8, d0
  009826  3540004e             move.w    d0, $4e(a2)
  00982a  3014                 move.w    (a4), d0
  00982c  48c0                 ext.l     d0
  00982e  322efff4             move.w    -$c(a6), d1
  009832  48c1                 ext.l     d1
  009834  9280                 sub.l     d0, d1
  009836  3541005a             move.w    d1, $5a(a2)
  00983a  302effee             move.w    -$12(a6), d0
  00983e  b06a005c             cmp.w     $5c(a2), d0
  009842  670c                 beq.b     $9850
  009844  302a005c             move.w    $5c(a2), d0
  009848  48c0                 ext.l     d0
  00984a  e188                 lsl.l     #$8, d0
  00984c  2540005e             move.l    d0, $5e(a2)
  009850  302effec             move.w    -$14(a6), d0
  009854  b06a005a             cmp.w     $5a(a2), d0
  009858  670c                 beq.b     $9866
  00985a  302a005a             move.w    $5a(a2), d0
  00985e  48c0                 ext.l     d0
  009860  e188                 lsl.l     #$8, d0
  009862  25400062             move.l    d0, $62(a2)
  009866  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  00986a  4e5e                 unlk      a6
  00986c  4e75                 rts       

;-------------------------------------------------------------
; RectBounceFake   (seg 2 +00987c, 1010 bytes)
  00987c  4e56ffdc             link.w    a6, #$ffdc
  009880  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  009884  246e0008             movea.l   $8(a6), a2
  009888  282e000c             move.l    $c(a6), d4
  00988c  286e0010             movea.l   $10(a6), a4
  009890  3a2e0014             move.w    $14(a6), d5
  009894  262e0016             move.l    $16(a6), d3
  009898  266e001a             movea.l   $1a(a6), a3
  00989c  486efff0             pea.l     -$10(a6)
  0098a0  302c0002             move.w    $2(a4), d0
  0098a4  48c0                 ext.l     d0
  0098a6  2044                 movea.l   d4, a0
  0098a8  32280002             move.w    $2(a0), d1
  0098ac  48c1                 ext.l     d1
  0098ae  d280                 add.l     d0, d1
  0098b0  3f01                 move.w    d1, -(a7)
  0098b2  3014                 move.w    (a4), d0
  0098b4  48c0                 ext.l     d0
  0098b6  2044                 movea.l   d4, a0
  0098b8  3210                 move.w    (a0), d1
  0098ba  48c1                 ext.l     d1
  0098bc  d280                 add.l     d0, d1
  0098be  3f01                 move.w    d1, -(a7)
  0098c0  302c0006             move.w    $6(a4), d0
  0098c4  48c0                 ext.l     d0
  0098c6  2044                 movea.l   d4, a0
  0098c8  32280002             move.w    $2(a0), d1
  0098cc  48c1                 ext.l     d1
  0098ce  d280                 add.l     d0, d1
  0098d0  3f01                 move.w    d1, -(a7)
  0098d2  302c0004             move.w    $4(a4), d0
  0098d6  48c0                 ext.l     d0
  0098d8  2044                 movea.l   d4, a0
  0098da  3210                 move.w    (a0), d1
  0098dc  48c1                 ext.l     d1
  0098de  d280                 add.l     d0, d1
  0098e0  3f01                 move.w    d1, -(a7)
  0098e2  a8a7                 _SetRect  
  0098e4  486effe4             pea.l     -$1c(a6)
  0098e8  302b0002             move.w    $2(a3), d0
  0098ec  48c0                 ext.l     d0
  0098ee  322a005c             move.w    $5c(a2), d1
  0098f2  48c1                 ext.l     d1
  0098f4  d280                 add.l     d0, d1
  0098f6  3f01                 move.w    d1, -(a7)
  0098f8  3013                 move.w    (a3), d0
  0098fa  48c0                 ext.l     d0
  0098fc  322a005a             move.w    $5a(a2), d1
  009900  48c1                 ext.l     d1
  009902  d280                 add.l     d0, d1
  009904  3f01                 move.w    d1, -(a7)
  009906  302b0006             move.w    $6(a3), d0
  00990a  48c0                 ext.l     d0
  00990c  322a005c             move.w    $5c(a2), d1
  009910  48c1                 ext.l     d1
  009912  d280                 add.l     d0, d1
  009914  3f01                 move.w    d1, -(a7)
  009916  302b0004             move.w    $4(a3), d0
  00991a  48c0                 ext.l     d0
  00991c  322a005a             move.w    $5a(a2), d1
  009920  48c1                 ext.l     d1
  009922  d280                 add.l     d0, d1
  009924  3f01                 move.w    d1, -(a7)
  009926  a8a7                 _SetRect  
  009928  554f                 subq.w    #$2, a7
  00992a  486effe4             pea.l     -$1c(a6)
  00992e  486efff0             pea.l     -$10(a6)
  009932  486effdc             pea.l     -$24(a6)
  009936  a8aa                 _SectRect 
  009938  101f                 move.b    (a7)+, d0
  00993a  6700032a             beq.w     $9c66
  00993e  3005                 move.w    d5, d0
  009940  48c0                 ext.l     d0
  009942  322a005c             move.w    $5c(a2), d1
  009946  48c1                 ext.l     d1
  009948  d280                 add.l     d0, d1
  00994a  3d41fffe             move.w    d1, -$2(a6)
  00994e  3005                 move.w    d5, d0
  009950  48c0                 ext.l     d0
  009952  322a005a             move.w    $5a(a2), d1
  009956  48c1                 ext.l     d1
  009958  d280                 add.l     d0, d1
  00995a  3d41fffc             move.w    d1, -$4(a6)
  00995e  302c0002             move.w    $2(a4), d0
  009962  48c0                 ext.l     d0
  009964  322c0006             move.w    $6(a4), d1
  009968  48c1                 ext.l     d1
  00996a  9280                 sub.l     d0, d1
  00996c  e281                 asr.l     #$1, d1
  00996e  302c0002             move.w    $2(a4), d0
  009972  48c0                 ext.l     d0
  009974  2044                 movea.l   d4, a0
  009976  34280002             move.w    $2(a0), d2
  00997a  48c2                 ext.l     d2
  00997c  d480                 add.l     d0, d2
  00997e  d481                 add.l     d1, d2
  009980  3d42fffa             move.w    d2, -$6(a6)
  009984  3014                 move.w    (a4), d0
  009986  48c0                 ext.l     d0
  009988  322c0004             move.w    $4(a4), d1
  00998c  48c1                 ext.l     d1
  00998e  9280                 sub.l     d0, d1
  009990  e281                 asr.l     #$1, d1
  009992  3014                 move.w    (a4), d0
  009994  48c0                 ext.l     d0
  009996  2044                 movea.l   d4, a0
  009998  3410                 move.w    (a0), d2
  00999a  48c2                 ext.l     d2
  00999c  d480                 add.l     d0, d2
  00999e  d481                 add.l     d1, d2
  0099a0  3d42fff8             move.w    d2, -$8(a6)
  0099a4  3d6a005cffee         move.w    $5c(a2), -$12(a6)
  0099aa  3d6a005affec         move.w    $5a(a2), -$14(a6)
  0099b0  302efffe             move.w    -$2(a6), d0
  0099b4  b06efffa             cmp.w     -$6(a6), d0
  0099b8  6c000144             bge.w     $9afe
  0099bc  302efffc             move.w    -$4(a6), d0
  0099c0  b06efff8             cmp.w     -$8(a6), d0
  0099c4  6c00009e             bge.w     $9a64
  0099c8  302efffe             move.w    -$2(a6), d0
  0099cc  48c0                 ext.l     d0
  0099ce  382efffa             move.w    -$6(a6), d4
  0099d2  48c4                 ext.l     d4
  0099d4  9880                 sub.l     d0, d4
  0099d6  302efffc             move.w    -$4(a6), d0
  0099da  48c0                 ext.l     d0
  0099dc  3a2efff8             move.w    -$8(a6), d5
  0099e0  48c5                 ext.l     d5
  0099e2  9a80                 sub.l     d0, d5
  0099e4  b845                 cmp.w     d5, d4
  0099e6  6f3e                 ble.b     $9a26
  0099e8  4a6a0050             tst.w     $50(a2)
  0099ec  6f22                 ble.b     $9a10
  0099ee  302a0050             move.w    $50(a2), d0
  0099f2  48c0                 ext.l     d0
  0099f4  4c030800             muls.l    d3, d0
  0099f8  4480                 neg.l     d0
  0099fa  e080                 asr.l     #$8, d0
  0099fc  35400050             move.w    d0, $50(a2)
  009a00  302a004e             move.w    $4e(a2), d0
  009a04  48c0                 ext.l     d0
  009a06  4c030800             muls.l    d3, d0
  009a0a  e080                 asr.l     #$8, d0
  009a0c  3540004e             move.w    d0, $4e(a2)
  009a10  302b0006             move.w    $6(a3), d0
  009a14  48c0                 ext.l     d0
  009a16  322efff2             move.w    -$e(a6), d1
  009a1a  48c1                 ext.l     d1
  009a1c  9280                 sub.l     d0, d1
  009a1e  3541005c             move.w    d1, $5c(a2)
  009a22  60000216             bra.w     $9c3a
  009a26  4a6a004e             tst.w     $4e(a2)
  009a2a  6f22                 ble.b     $9a4e
  009a2c  302a0050             move.w    $50(a2), d0
  009a30  48c0                 ext.l     d0
  009a32  4c030800             muls.l    d3, d0
  009a36  e080                 asr.l     #$8, d0
  009a38  35400050             move.w    d0, $50(a2)
  009a3c  302a004e             move.w    $4e(a2), d0
  009a40  48c0                 ext.l     d0
  009a42  4c030800             muls.l    d3, d0
  009a46  4480                 neg.l     d0
  009a48  e080                 asr.l     #$8, d0
  009a4a  3540004e             move.w    d0, $4e(a2)
  009a4e  302b0004             move.w    $4(a3), d0
  009a52  48c0                 ext.l     d0
  009a54  322efff0             move.w    -$10(a6), d1
  009a58  48c1                 ext.l     d1
  009a5a  9280                 sub.l     d0, d1
  009a5c  3541005a             move.w    d1, $5a(a2)
  009a60  600001d8             bra.w     $9c3a
  009a64  302efffe             move.w    -$2(a6), d0
  009a68  48c0                 ext.l     d0
  009a6a  382efffa             move.w    -$6(a6), d4
  009a6e  48c4                 ext.l     d4
  009a70  9880                 sub.l     d0, d4
  009a72  302efff8             move.w    -$8(a6), d0
  009a76  48c0                 ext.l     d0
  009a78  3a2efffc             move.w    -$4(a6), d5
  009a7c  48c5                 ext.l     d5
  009a7e  9a80                 sub.l     d0, d5
  009a80  b845                 cmp.w     d5, d4
  009a82  6f3e                 ble.b     $9ac2
  009a84  4a6a0050             tst.w     $50(a2)
  009a88  6f22                 ble.b     $9aac
  009a8a  302a0050             move.w    $50(a2), d0
  009a8e  48c0                 ext.l     d0
  009a90  4c030800             muls.l    d3, d0
  009a94  4480                 neg.l     d0
  009a96  e080                 asr.l     #$8, d0
  009a98  35400050             move.w    d0, $50(a2)
  009a9c  302a004e             move.w    $4e(a2), d0
  009aa0  48c0                 ext.l     d0
  009aa2  4c030800             muls.l    d3, d0
  009aa6  e080                 asr.l     #$8, d0
  009aa8  3540004e             move.w    d0, $4e(a2)
  009aac  302b0006             move.w    $6(a3), d0
  009ab0  48c0                 ext.l     d0
  009ab2  322efff2             move.w    -$e(a6), d1
  009ab6  48c1                 ext.l     d1
  009ab8  9280                 sub.l     d0, d1
  009aba  3541005c             move.w    d1, $5c(a2)
  009abe  6000017a             bra.w     $9c3a
  009ac2  4a6a004e             tst.w     $4e(a2)
  009ac6  6c22                 bge.b     $9aea
  009ac8  302a0050             move.w    $50(a2), d0
  009acc  48c0                 ext.l     d0
  009ace  4c030800             muls.l    d3, d0
  009ad2  e080                 asr.l     #$8, d0
  009ad4  35400050             move.w    d0, $50(a2)
  009ad8  302a004e             move.w    $4e(a2), d0
  009adc  48c0                 ext.l     d0
  009ade  4c030800             muls.l    d3, d0
  009ae2  4480                 neg.l     d0
  009ae4  e080                 asr.l     #$8, d0
  009ae6  3540004e             move.w    d0, $4e(a2)
  009aea  3013                 move.w    (a3), d0
  009aec  48c0                 ext.l     d0
  009aee  322efff4             move.w    -$c(a6), d1
  009af2  48c1                 ext.l     d1
  009af4  9280                 sub.l     d0, d1
  009af6  3541005a             move.w    d1, $5a(a2)
  009afa  6000013e             bra.w     $9c3a
  009afe  302efffc             move.w    -$4(a6), d0
  009b02  b06efff8             cmp.w     -$8(a6), d0
  009b06  6c00009e             bge.w     $9ba6
  009b0a  302efffa             move.w    -$6(a6), d0
  009b0e  48c0                 ext.l     d0
  009b10  382efffe             move.w    -$2(a6), d4
  009b14  48c4                 ext.l     d4
  009b16  9880                 sub.l     d0, d4
  009b18  302efffc             move.w    -$4(a6), d0
  009b1c  48c0                 ext.l     d0
  009b1e  3a2efff8             move.w    -$8(a6), d5
  009b22  48c5                 ext.l     d5
  009b24  9a80                 sub.l     d0, d5
  009b26  b845                 cmp.w     d5, d4
  009b28  6f3e                 ble.b     $9b68
  009b2a  4a6a0050             tst.w     $50(a2)
  009b2e  6c22                 bge.b     $9b52
  009b30  302a0050             move.w    $50(a2), d0
  009b34  48c0                 ext.l     d0
  009b36  4c030800             muls.l    d3, d0
  009b3a  4480                 neg.l     d0
  009b3c  e080                 asr.l     #$8, d0
  009b3e  35400050             move.w    d0, $50(a2)
  009b42  302a004e             move.w    $4e(a2), d0
  009b46  48c0                 ext.l     d0
  009b48  4c030800             muls.l    d3, d0
  009b4c  e080                 asr.l     #$8, d0
  009b4e  3540004e             move.w    d0, $4e(a2)
  009b52  302b0002             move.w    $2(a3), d0
  009b56  48c0                 ext.l     d0
  009b58  322efff6             move.w    -$a(a6), d1
  009b5c  48c1                 ext.l     d1
  009b5e  9280                 sub.l     d0, d1
  009b60  3541005c             move.w    d1, $5c(a2)
  009b64  600000d4             bra.w     $9c3a
  009b68  4a6a004e             tst.w     $4e(a2)
  009b6c  6f22                 ble.b     $9b90
  009b6e  302a0050             move.w    $50(a2), d0
  009b72  48c0                 ext.l     d0
  009b74  4c030800             muls.l    d3, d0
  009b78  e080                 asr.l     #$8, d0
  009b7a  35400050             move.w    d0, $50(a2)
  009b7e  302a004e             move.w    $4e(a2), d0
  009b82  48c0                 ext.l     d0
  009b84  4c030800             muls.l    d3, d0
  009b88  4480                 neg.l     d0
  009b8a  e080                 asr.l     #$8, d0
  009b8c  3540004e             move.w    d0, $4e(a2)
  009b90  302b0004             move.w    $4(a3), d0
  009b94  48c0                 ext.l     d0
  009b96  322efff0             move.w    -$10(a6), d1
  009b9a  48c1                 ext.l     d1
  009b9c  9280                 sub.l     d0, d1
  009b9e  3541005a             move.w    d1, $5a(a2)
  009ba2  60000096             bra.w     $9c3a
  009ba6  302efffa             move.w    -$6(a6), d0
  009baa  48c0                 ext.l     d0
  009bac  382efffe             move.w    -$2(a6), d4
  009bb0  48c4                 ext.l     d4
  009bb2  9880                 sub.l     d0, d4
  009bb4  302efff8             move.w    -$8(a6), d0
  009bb8  48c0                 ext.l     d0
  009bba  3a2efffc             move.w    -$4(a6), d5
  009bbe  48c5                 ext.l     d5
  009bc0  9a80                 sub.l     d0, d5
  009bc2  b845                 cmp.w     d5, d4
  009bc4  6f3c                 ble.b     $9c02
  009bc6  4a6a0050             tst.w     $50(a2)
  009bca  6c22                 bge.b     $9bee
  009bcc  302a0050             move.w    $50(a2), d0
  009bd0  48c0                 ext.l     d0
  009bd2  4c030800             muls.l    d3, d0
  009bd6  4480                 neg.l     d0
  009bd8  e080                 asr.l     #$8, d0
  009bda  35400050             move.w    d0, $50(a2)
  009bde  302a004e             move.w    $4e(a2), d0
  009be2  48c0                 ext.l     d0
  009be4  4c030800             muls.l    d3, d0
  009be8  e080                 asr.l     #$8, d0
  009bea  3540004e             move.w    d0, $4e(a2)
  009bee  302b0002             move.w    $2(a3), d0
  009bf2  48c0                 ext.l     d0
  009bf4  322efff6             move.w    -$a(a6), d1
  009bf8  48c1                 ext.l     d1
  009bfa  9280                 sub.l     d0, d1
  009bfc  3541005c             move.w    d1, $5c(a2)
  009c00  6038                 bra.b     $9c3a
  009c02  4a6a004e             tst.w     $4e(a2)
  009c06  6c22                 bge.b     $9c2a
  009c08  302a0050             move.w    $50(a2), d0
  009c0c  48c0                 ext.l     d0
  009c0e  4c030800             muls.l    d3, d0
  009c12  e080                 asr.l     #$8, d0
  009c14  35400050             move.w    d0, $50(a2)
  009c18  302a004e             move.w    $4e(a2), d0
  009c1c  48c0                 ext.l     d0
  009c1e  4c030800             muls.l    d3, d0
  009c22  4480                 neg.l     d0
  009c24  e080                 asr.l     #$8, d0
  009c26  3540004e             move.w    d0, $4e(a2)
  009c2a  3013                 move.w    (a3), d0
  009c2c  48c0                 ext.l     d0
  009c2e  322efff4             move.w    -$c(a6), d1
  009c32  48c1                 ext.l     d1
  009c34  9280                 sub.l     d0, d1
  009c36  3541005a             move.w    d1, $5a(a2)
  009c3a  302effee             move.w    -$12(a6), d0
  009c3e  b06a005c             cmp.w     $5c(a2), d0
  009c42  670c                 beq.b     $9c50
  009c44  302a005c             move.w    $5c(a2), d0
  009c48  48c0                 ext.l     d0
  009c4a  e188                 lsl.l     #$8, d0
  009c4c  2540005e             move.l    d0, $5e(a2)
  009c50  302effec             move.w    -$14(a6), d0
  009c54  b06a005a             cmp.w     $5a(a2), d0
  009c58  670c                 beq.b     $9c66
  009c5a  302a005a             move.w    $5a(a2), d0
  009c5e  48c0                 ext.l     d0
  009c60  e188                 lsl.l     #$8, d0
  009c62  25400062             move.l    d0, $62(a2)
  009c66  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  009c6a  4e5e                 unlk      a6
  009c6c  4e75                 rts       

;-------------------------------------------------------------
; RectBounceFake2   (seg 2 +009c80, 1016 bytes)
  009c80  4e56ffdc             link.w    a6, #$ffdc
  009c84  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  009c88  246e0008             movea.l   $8(a6), a2
  009c8c  282e000c             move.l    $c(a6), d4
  009c90  286e0010             movea.l   $10(a6), a4
  009c94  2a2e0014             move.l    $14(a6), d5
  009c98  262e0018             move.l    $18(a6), d3
  009c9c  266e001c             movea.l   $1c(a6), a3
  009ca0  486efff0             pea.l     -$10(a6)
  009ca4  302c0002             move.w    $2(a4), d0
  009ca8  48c0                 ext.l     d0
  009caa  2044                 movea.l   d4, a0
  009cac  32280002             move.w    $2(a0), d1
  009cb0  48c1                 ext.l     d1
  009cb2  d280                 add.l     d0, d1
  009cb4  3f01                 move.w    d1, -(a7)
  009cb6  3014                 move.w    (a4), d0
  009cb8  48c0                 ext.l     d0
  009cba  2044                 movea.l   d4, a0
  009cbc  3210                 move.w    (a0), d1
  009cbe  48c1                 ext.l     d1
  009cc0  d280                 add.l     d0, d1
  009cc2  3f01                 move.w    d1, -(a7)
  009cc4  302c0006             move.w    $6(a4), d0
  009cc8  48c0                 ext.l     d0
  009cca  2044                 movea.l   d4, a0
  009ccc  32280002             move.w    $2(a0), d1
  009cd0  48c1                 ext.l     d1
  009cd2  d280                 add.l     d0, d1
  009cd4  3f01                 move.w    d1, -(a7)
  009cd6  302c0004             move.w    $4(a4), d0
  009cda  48c0                 ext.l     d0
  009cdc  2044                 movea.l   d4, a0
  009cde  3210                 move.w    (a0), d1
  009ce0  48c1                 ext.l     d1
  009ce2  d280                 add.l     d0, d1
  009ce4  3f01                 move.w    d1, -(a7)
  009ce6  a8a7                 _SetRect  
  009ce8  486effe4             pea.l     -$1c(a6)
  009cec  302b0002             move.w    $2(a3), d0
  009cf0  48c0                 ext.l     d0
  009cf2  322a005c             move.w    $5c(a2), d1
  009cf6  48c1                 ext.l     d1
  009cf8  d280                 add.l     d0, d1
  009cfa  3f01                 move.w    d1, -(a7)
  009cfc  3013                 move.w    (a3), d0
  009cfe  48c0                 ext.l     d0
  009d00  322a005a             move.w    $5a(a2), d1
  009d04  48c1                 ext.l     d1
  009d06  d280                 add.l     d0, d1
  009d08  3f01                 move.w    d1, -(a7)
  009d0a  302b0006             move.w    $6(a3), d0
  009d0e  48c0                 ext.l     d0
  009d10  322a005c             move.w    $5c(a2), d1
  009d14  48c1                 ext.l     d1
  009d16  d280                 add.l     d0, d1
  009d18  3f01                 move.w    d1, -(a7)
  009d1a  302b0004             move.w    $4(a3), d0
  009d1e  48c0                 ext.l     d0
  009d20  322a005a             move.w    $5a(a2), d1
  009d24  48c1                 ext.l     d1
  009d26  d280                 add.l     d0, d1
  009d28  3f01                 move.w    d1, -(a7)
  009d2a  a8a7                 _SetRect  
  009d2c  554f                 subq.w    #$2, a7
  009d2e  486effe4             pea.l     -$1c(a6)
  009d32  486efff0             pea.l     -$10(a6)
  009d36  486effdc             pea.l     -$24(a6)
  009d3a  a8aa                 _SectRect 
  009d3c  101f                 move.b    (a7)+, d0
  009d3e  67000330             beq.w     $a070
  009d42  2045                 movea.l   d5, a0
  009d44  30280002             move.w    $2(a0), d0
  009d48  48c0                 ext.l     d0
  009d4a  322a005c             move.w    $5c(a2), d1
  009d4e  48c1                 ext.l     d1
  009d50  d280                 add.l     d0, d1
  009d52  3d41fffe             move.w    d1, -$2(a6)
  009d56  2045                 movea.l   d5, a0
  009d58  3010                 move.w    (a0), d0
  009d5a  48c0                 ext.l     d0
  009d5c  322a005a             move.w    $5a(a2), d1
  009d60  48c1                 ext.l     d1
  009d62  d280                 add.l     d0, d1
  009d64  3d41fffc             move.w    d1, -$4(a6)
  009d68  302c0002             move.w    $2(a4), d0
  009d6c  48c0                 ext.l     d0
  009d6e  322c0006             move.w    $6(a4), d1
  009d72  48c1                 ext.l     d1
  009d74  9280                 sub.l     d0, d1
  009d76  e281                 asr.l     #$1, d1
  009d78  302c0002             move.w    $2(a4), d0
  009d7c  48c0                 ext.l     d0
  009d7e  2044                 movea.l   d4, a0
  009d80  34280002             move.w    $2(a0), d2
  009d84  48c2                 ext.l     d2
  009d86  d480                 add.l     d0, d2
  009d88  d481                 add.l     d1, d2
  009d8a  3d42fffa             move.w    d2, -$6(a6)
  009d8e  3014                 move.w    (a4), d0
  009d90  48c0                 ext.l     d0
  009d92  322c0004             move.w    $4(a4), d1
  009d96  48c1                 ext.l     d1
  009d98  9280                 sub.l     d0, d1
  009d9a  e281                 asr.l     #$1, d1
  009d9c  3014                 move.w    (a4), d0
  009d9e  48c0                 ext.l     d0
  009da0  2044                 movea.l   d4, a0
  009da2  3410                 move.w    (a0), d2
  009da4  48c2                 ext.l     d2
  009da6  d480                 add.l     d0, d2
  009da8  d481                 add.l     d1, d2
  009daa  3d42fff8             move.w    d2, -$8(a6)
  009dae  3d6a005cffee         move.w    $5c(a2), -$12(a6)
  009db4  3d6a005affec         move.w    $5a(a2), -$14(a6)
  009dba  302efffe             move.w    -$2(a6), d0
  009dbe  b06efffa             cmp.w     -$6(a6), d0
  009dc2  6c000144             bge.w     $9f08
  009dc6  302efffc             move.w    -$4(a6), d0
  009dca  b06efff8             cmp.w     -$8(a6), d0
  009dce  6c00009e             bge.w     $9e6e
  009dd2  302efffe             move.w    -$2(a6), d0
  009dd6  48c0                 ext.l     d0
  009dd8  382efffa             move.w    -$6(a6), d4
  009ddc  48c4                 ext.l     d4
  009dde  9880                 sub.l     d0, d4
  009de0  302efffc             move.w    -$4(a6), d0
  009de4  48c0                 ext.l     d0
  009de6  3a2efff8             move.w    -$8(a6), d5
  009dea  48c5                 ext.l     d5
  009dec  9a80                 sub.l     d0, d5
  009dee  b845                 cmp.w     d5, d4
  009df0  6f3e                 ble.b     $9e30
  009df2  4a6a0050             tst.w     $50(a2)
  009df6  6f22                 ble.b     $9e1a
  009df8  302a0050             move.w    $50(a2), d0
  009dfc  48c0                 ext.l     d0
  009dfe  4c030800             muls.l    d3, d0
  009e02  4480                 neg.l     d0
  009e04  e080                 asr.l     #$8, d0
  009e06  35400050             move.w    d0, $50(a2)
  009e0a  302a004e             move.w    $4e(a2), d0
  009e0e  48c0                 ext.l     d0
  009e10  4c030800             muls.l    d3, d0
  009e14  e080                 asr.l     #$8, d0
  009e16  3540004e             move.w    d0, $4e(a2)
  009e1a  302b0006             move.w    $6(a3), d0
  009e1e  48c0                 ext.l     d0
  009e20  322efff2             move.w    -$e(a6), d1
  009e24  48c1                 ext.l     d1
  009e26  9280                 sub.l     d0, d1
  009e28  3541005c             move.w    d1, $5c(a2)
  009e2c  60000216             bra.w     $a044
  009e30  4a6a004e             tst.w     $4e(a2)
  009e34  6f22                 ble.b     $9e58
  009e36  302a0050             move.w    $50(a2), d0
  009e3a  48c0                 ext.l     d0
  009e3c  4c030800             muls.l    d3, d0
  009e40  e080                 asr.l     #$8, d0
  009e42  35400050             move.w    d0, $50(a2)
  009e46  302a004e             move.w    $4e(a2), d0
  009e4a  48c0                 ext.l     d0
  009e4c  4c030800             muls.l    d3, d0
  009e50  4480                 neg.l     d0
  009e52  e080                 asr.l     #$8, d0
  009e54  3540004e             move.w    d0, $4e(a2)
  009e58  302b0004             move.w    $4(a3), d0
  009e5c  48c0                 ext.l     d0
  009e5e  322efff0             move.w    -$10(a6), d1
  009e62  48c1                 ext.l     d1
  009e64  9280                 sub.l     d0, d1
  009e66  3541005a             move.w    d1, $5a(a2)
  009e6a  600001d8             bra.w     $a044
  009e6e  302efffe             move.w    -$2(a6), d0
  009e72  48c0                 ext.l     d0
  009e74  382efffa             move.w    -$6(a6), d4
  009e78  48c4                 ext.l     d4
  009e7a  9880                 sub.l     d0, d4
  009e7c  302efff8             move.w    -$8(a6), d0
  009e80  48c0                 ext.l     d0
  009e82  3a2efffc             move.w    -$4(a6), d5
  009e86  48c5                 ext.l     d5
  009e88  9a80                 sub.l     d0, d5
  009e8a  b845                 cmp.w     d5, d4
  009e8c  6f3e                 ble.b     $9ecc
  009e8e  4a6a0050             tst.w     $50(a2)
  009e92  6f22                 ble.b     $9eb6
  009e94  302a0050             move.w    $50(a2), d0
  009e98  48c0                 ext.l     d0
  009e9a  4c030800             muls.l    d3, d0
  009e9e  4480                 neg.l     d0
  009ea0  e080                 asr.l     #$8, d0
  009ea2  35400050             move.w    d0, $50(a2)
  009ea6  302a004e             move.w    $4e(a2), d0
  009eaa  48c0                 ext.l     d0
  009eac  4c030800             muls.l    d3, d0
  009eb0  e080                 asr.l     #$8, d0
  009eb2  3540004e             move.w    d0, $4e(a2)
  009eb6  302b0006             move.w    $6(a3), d0
  009eba  48c0                 ext.l     d0
  009ebc  322efff2             move.w    -$e(a6), d1
  009ec0  48c1                 ext.l     d1
  009ec2  9280                 sub.l     d0, d1
  009ec4  3541005c             move.w    d1, $5c(a2)
  009ec8  6000017a             bra.w     $a044
  009ecc  4a6a004e             tst.w     $4e(a2)
  009ed0  6c22                 bge.b     $9ef4
  009ed2  302a0050             move.w    $50(a2), d0
  009ed6  48c0                 ext.l     d0
  009ed8  4c030800             muls.l    d3, d0
  009edc  e080                 asr.l     #$8, d0
  009ede  35400050             move.w    d0, $50(a2)
  009ee2  302a004e             move.w    $4e(a2), d0
  009ee6  48c0                 ext.l     d0
  009ee8  4c030800             muls.l    d3, d0
  009eec  4480                 neg.l     d0
  009eee  e080                 asr.l     #$8, d0
  009ef0  3540004e             move.w    d0, $4e(a2)
  009ef4  3013                 move.w    (a3), d0
  009ef6  48c0                 ext.l     d0
  009ef8  322efff4             move.w    -$c(a6), d1
  009efc  48c1                 ext.l     d1
  009efe  9280                 sub.l     d0, d1
  009f00  3541005a             move.w    d1, $5a(a2)
  009f04  6000013e             bra.w     $a044
  009f08  302efffc             move.w    -$4(a6), d0
  009f0c  b06efff8             cmp.w     -$8(a6), d0
  009f10  6c00009e             bge.w     $9fb0
  009f14  302efffa             move.w    -$6(a6), d0
  009f18  48c0                 ext.l     d0
  009f1a  382efffe             move.w    -$2(a6), d4
  009f1e  48c4                 ext.l     d4
  009f20  9880                 sub.l     d0, d4
  009f22  302efffc             move.w    -$4(a6), d0
  009f26  48c0                 ext.l     d0
  009f28  3a2efff8             move.w    -$8(a6), d5
  009f2c  48c5                 ext.l     d5
  009f2e  9a80                 sub.l     d0, d5
  009f30  b845                 cmp.w     d5, d4
  009f32  6f3e                 ble.b     $9f72
  009f34  4a6a0050             tst.w     $50(a2)
  009f38  6c22                 bge.b     $9f5c
  009f3a  302a0050             move.w    $50(a2), d0
  009f3e  48c0                 ext.l     d0
  009f40  4c030800             muls.l    d3, d0
  009f44  4480                 neg.l     d0
  009f46  e080                 asr.l     #$8, d0
  009f48  35400050             move.w    d0, $50(a2)
  009f4c  302a004e             move.w    $4e(a2), d0
  009f50  48c0                 ext.l     d0
  009f52  4c030800             muls.l    d3, d0
  009f56  e080                 asr.l     #$8, d0
  009f58  3540004e             move.w    d0, $4e(a2)
  009f5c  302b0002             move.w    $2(a3), d0
  009f60  48c0                 ext.l     d0
  009f62  322efff6             move.w    -$a(a6), d1
  009f66  48c1                 ext.l     d1
  009f68  9280                 sub.l     d0, d1
  009f6a  3541005c             move.w    d1, $5c(a2)
  009f6e  600000d4             bra.w     $a044
  009f72  4a6a004e             tst.w     $4e(a2)
  009f76  6f22                 ble.b     $9f9a
  009f78  302a0050             move.w    $50(a2), d0
  009f7c  48c0                 ext.l     d0
  009f7e  4c030800             muls.l    d3, d0
  009f82  e080                 asr.l     #$8, d0
  009f84  35400050             move.w    d0, $50(a2)
  009f88  302a004e             move.w    $4e(a2), d0
  009f8c  48c0                 ext.l     d0
  009f8e  4c030800             muls.l    d3, d0
  009f92  4480                 neg.l     d0
  009f94  e080                 asr.l     #$8, d0
  009f96  3540004e             move.w    d0, $4e(a2)
  009f9a  302b0004             move.w    $4(a3), d0
  009f9e  48c0                 ext.l     d0
  009fa0  322efff0             move.w    -$10(a6), d1
  009fa4  48c1                 ext.l     d1
  009fa6  9280                 sub.l     d0, d1
  009fa8  3541005a             move.w    d1, $5a(a2)
  009fac  60000096             bra.w     $a044
  009fb0  302efffa             move.w    -$6(a6), d0
  009fb4  48c0                 ext.l     d0
  009fb6  382efffe             move.w    -$2(a6), d4
  009fba  48c4                 ext.l     d4
  009fbc  9880                 sub.l     d0, d4
  009fbe  302efff8             move.w    -$8(a6), d0
  009fc2  48c0                 ext.l     d0
  009fc4  3a2efffc             move.w    -$4(a6), d5
  009fc8  48c5                 ext.l     d5
  009fca  9a80                 sub.l     d0, d5
  009fcc  b845                 cmp.w     d5, d4
  009fce  6f3c                 ble.b     $a00c
  009fd0  4a6a0050             tst.w     $50(a2)
  009fd4  6c22                 bge.b     $9ff8
  009fd6  302a0050             move.w    $50(a2), d0
  009fda  48c0                 ext.l     d0
  009fdc  4c030800             muls.l    d3, d0
  009fe0  4480                 neg.l     d0
  009fe2  e080                 asr.l     #$8, d0
  009fe4  35400050             move.w    d0, $50(a2)
  009fe8  302a004e             move.w    $4e(a2), d0
  009fec  48c0                 ext.l     d0
  009fee  4c030800             muls.l    d3, d0
  009ff2  e080                 asr.l     #$8, d0
  009ff4  3540004e             move.w    d0, $4e(a2)
  009ff8  302b0002             move.w    $2(a3), d0
  009ffc  48c0                 ext.l     d0
  009ffe  322efff6             move.w    -$a(a6), d1
  00a002  48c1                 ext.l     d1
  00a004  9280                 sub.l     d0, d1
  00a006  3541005c             move.w    d1, $5c(a2)
  00a00a  6038                 bra.b     $a044
  00a00c  4a6a004e             tst.w     $4e(a2)
  00a010  6c22                 bge.b     $a034
  00a012  302a0050             move.w    $50(a2), d0
  00a016  48c0                 ext.l     d0
  00a018  4c030800             muls.l    d3, d0
  00a01c  e080                 asr.l     #$8, d0
  00a01e  35400050             move.w    d0, $50(a2)
  00a022  302a004e             move.w    $4e(a2), d0
  00a026  48c0                 ext.l     d0
  00a028  4c030800             muls.l    d3, d0
  00a02c  4480                 neg.l     d0
  00a02e  e080                 asr.l     #$8, d0
  00a030  3540004e             move.w    d0, $4e(a2)
  00a034  3013                 move.w    (a3), d0
  00a036  48c0                 ext.l     d0
  00a038  322efff4             move.w    -$c(a6), d1
  00a03c  48c1                 ext.l     d1
  00a03e  9280                 sub.l     d0, d1
  00a040  3541005a             move.w    d1, $5a(a2)
  00a044  302effee             move.w    -$12(a6), d0
  00a048  b06a005c             cmp.w     $5c(a2), d0
  00a04c  670c                 beq.b     $a05a
  00a04e  302a005c             move.w    $5c(a2), d0
  00a052  48c0                 ext.l     d0
  00a054  e188                 lsl.l     #$8, d0
  00a056  2540005e             move.l    d0, $5e(a2)
  00a05a  302effec             move.w    -$14(a6), d0
  00a05e  b06a005a             cmp.w     $5a(a2), d0
  00a062  670c                 beq.b     $a070
  00a064  302a005a             move.w    $5a(a2), d0
  00a068  48c0                 ext.l     d0
  00a06a  e188                 lsl.l     #$8, d0
  00a06c  25400062             move.l    d0, $62(a2)
  00a070  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  00a074  4e5e                 unlk      a6
  00a076  4e75                 rts       

;-------------------------------------------------------------
; EnforceMaxSpeed   (seg 2 +00a08a, 284 bytes)
  00a08a  4e560000             link.w    a6, #$0
  00a08e  48e71820             movem.l   d3-d4/a2, -(a7)
  00a092  246e0008             movea.l   $8(a6), a2
  00a096  262e000c             move.l    $c(a6), d3
  00a09a  4a6a0050             tst.w     $50(a2)
  00a09e  6f08                 ble.b     $a0a8
  00a0a0  302a0050             move.w    $50(a2), d0
  00a0a4  48c0                 ext.l     d0
  00a0a6  6008                 bra.b     $a0b0
  00a0a8  302a0050             move.w    $50(a2), d0
  00a0ac  48c0                 ext.l     d0
  00a0ae  4480                 neg.l     d0
  00a0b0  b083                 cmp.l     d3, d0
  00a0b2  6f68                 ble.b     $a11c
  00a0b4  4a6a0050             tst.w     $50(a2)
  00a0b8  6f30                 ble.b     $a0ea
  00a0ba  306a004e             movea.w   $4e(a2), a0
  00a0be  2808                 move.l    a0, d4
  00a0c0  2203                 move.l    d3, d1
  00a0c2  4c014800             muls.l    d1, d4
  00a0c6  4a6a0050             tst.w     $50(a2)
  00a0ca  6f08                 ble.b     $a0d4
  00a0cc  302a0050             move.w    $50(a2), d0
  00a0d0  48c0                 ext.l     d0
  00a0d2  6008                 bra.b     $a0dc
  00a0d4  302a0050             move.w    $50(a2), d0
  00a0d8  48c0                 ext.l     d0
  00a0da  4480                 neg.l     d0
  00a0dc  4c404804             divs.l    d0, d4
  00a0e0  3544004e             move.w    d4, $4e(a2)
  00a0e4  35430050             move.w    d3, $50(a2)
  00a0e8  6032                 bra.b     $a11c
  00a0ea  306a004e             movea.w   $4e(a2), a0
  00a0ee  2808                 move.l    a0, d4
  00a0f0  2203                 move.l    d3, d1
  00a0f2  4c014800             muls.l    d1, d4
  00a0f6  4a6a0050             tst.w     $50(a2)
  00a0fa  6f08                 ble.b     $a104
  00a0fc  302a0050             move.w    $50(a2), d0
  00a100  48c0                 ext.l     d0
  00a102  6008                 bra.b     $a10c
  00a104  302a0050             move.w    $50(a2), d0
  00a108  48c0                 ext.l     d0
  00a10a  4480                 neg.l     d0
  00a10c  4c404804             divs.l    d0, d4
  00a110  3544004e             move.w    d4, $4e(a2)
  00a114  2003                 move.l    d3, d0
  00a116  4480                 neg.l     d0
  00a118  35400050             move.w    d0, $50(a2)
  00a11c  4a6a004e             tst.w     $4e(a2)
  00a120  6f08                 ble.b     $a12a
  00a122  302a004e             move.w    $4e(a2), d0
  00a126  48c0                 ext.l     d0
  00a128  6008                 bra.b     $a132
  00a12a  302a004e             move.w    $4e(a2), d0
  00a12e  48c0                 ext.l     d0
  00a130  4480                 neg.l     d0
  00a132  b083                 cmp.l     d3, d0
  00a134  6f68                 ble.b     $a19e
  00a136  4a6a004e             tst.w     $4e(a2)
  00a13a  6f30                 ble.b     $a16c
  00a13c  306a0050             movea.w   $50(a2), a0
  00a140  2808                 move.l    a0, d4
  00a142  2203                 move.l    d3, d1
  00a144  4c014800             muls.l    d1, d4
  00a148  4a6a004e             tst.w     $4e(a2)
  00a14c  6f08                 ble.b     $a156
  00a14e  302a004e             move.w    $4e(a2), d0
  00a152  48c0                 ext.l     d0
  00a154  6008                 bra.b     $a15e
  00a156  302a004e             move.w    $4e(a2), d0
  00a15a  48c0                 ext.l     d0
  00a15c  4480                 neg.l     d0
  00a15e  4c404804             divs.l    d0, d4
  00a162  35440050             move.w    d4, $50(a2)
  00a166  3543004e             move.w    d3, $4e(a2)
  00a16a  6032                 bra.b     $a19e
  00a16c  306a0050             movea.w   $50(a2), a0
  00a170  2808                 move.l    a0, d4
  00a172  2203                 move.l    d3, d1
  00a174  4c014800             muls.l    d1, d4
  00a178  4a6a004e             tst.w     $4e(a2)
  00a17c  6f08                 ble.b     $a186
  00a17e  302a004e             move.w    $4e(a2), d0
  00a182  48c0                 ext.l     d0
  00a184  6008                 bra.b     $a18e
  00a186  302a004e             move.w    $4e(a2), d0
  00a18a  48c0                 ext.l     d0
  00a18c  4480                 neg.l     d0
  00a18e  4c404804             divs.l    d0, d4
  00a192  35440050             move.w    d4, $50(a2)
  00a196  2003                 move.l    d3, d0
  00a198  4480                 neg.l     d0
  00a19a  3540004e             move.w    d0, $4e(a2)
  00a19e  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00a1a2  4e5e                 unlk      a6
  00a1a4  4e75                 rts       

;-------------------------------------------------------------
; ApplyModedImpulse   (seg 2 +00a1b8, 8308 bytes)
  00a1b8  4e56ffe2             link.w    a6, #$ffe2
  00a1bc  48e71020             movem.l   d3/a2, -(a7)
  00a1c0  246e0008             movea.l   $8(a6), a2
  00a1c4  362e000e             move.w    $e(a6), d3
  00a1c8  302e000c             move.w    $c(a6), d0
  00a1cc  48c0                 ext.l     d0
  00a1ce  0c8000000023         cmpi.l    #$23, d0
  00a1d4  6200204e             bhi.w     $c224
  00a1d8  303b0206             move.w    $a1e0(pc, d0.w * 2), d0
  00a1dc  4efb0002             jmp       $a1e0(pc, d0.w)
  00a1e0  1048105411541254134e144e154e1648 cases     0:$b228 1:$b234 2:$b334 3:$b434 4:$b52e 5:$b62e 6:$b72e 7:$b828
  00a1f0  17481848185419541a541b4e1c4e1d4e cases     8:$b928 9:$ba28 10:$ba34 11:$bb34 12:$bc34 13:$bd2e 14:$be2e 15:$bf2e
  00a200  1e481f480048005401540254034e044e cases     16:$c028 17:$c128 18:$a228 19:$a234 20:$a334 21:$a434 22:$a52e 23:$a62e
  00a210  054e064807480848085409540a540b4e cases     24:$a72e 25:$a828 26:$a928 27:$aa28 28:$aa34 29:$ab34 30:$ac34 31:$ad2e
  00a220  0c4e0d4e0e480f48     cases     32:$ae2e 33:$af2e 34:$b028 35:$b128
  00a228  3003                 move.w    d3, d0
  00a22a  48c0                 ext.l     d0
  00a22c  d16a0050             add.w     d0, $50(a2)
  00a230  60001ff2             bra.w     $c224
  00a234  3d43ffe2             move.w    d3, -$1e(a6)
  00a238  486effe2             pea.l     -$1e(a6)
  00a23c  486effe2             pea.l     -$1e(a6)
  00a240  3f3c200e             move.w    #$200e, -(a7)
  00a244  a9eb                 _Pack4_FP 
  00a246  486effe2             pea.l     -$1e(a6)
  00a24a  486effe2             pea.l     -$1e(a6)
  00a24e  3f3c0810             move.w    #$810, -(a7)
  00a252  a9eb                 _Pack4_FP 
  00a254  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00a25c  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00a264  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00a26a  486effe2             pea.l     -$1e(a6)
  00a26e  486effec             pea.l     -$14(a6)
  00a272  3f3c0804             move.w    #$804, -(a7)
  00a276  a9eb                 _Pack4_FP 
  00a278  486a0050             pea.l     $50(a2)
  00a27c  486efff6             pea.l     -$a(a6)
  00a280  3f3c200e             move.w    #$200e, -(a7)
  00a284  a9eb                 _Pack4_FP 
  00a286  486effec             pea.l     -$14(a6)
  00a28a  486efff6             pea.l     -$a(a6)
  00a28e  3f3c0000             move.w    #$0, -(a7)
  00a292  a9eb                 _Pack4_FP 
  00a294  486efff6             pea.l     -$a(a6)
  00a298  3f3c0016             move.w    #$16, -(a7)
  00a29c  a9eb                 _Pack4_FP 
  00a29e  486efff6             pea.l     -$a(a6)
  00a2a2  486efff6             pea.l     -$a(a6)
  00a2a6  3f3c2810             move.w    #$2810, -(a7)
  00a2aa  a9eb                 _Pack4_FP 
  00a2ac  356efff80050         move.w    -$8(a6), $50(a2)
  00a2b2  3d43fff6             move.w    d3, -$a(a6)
  00a2b6  486efff6             pea.l     -$a(a6)
  00a2ba  486efff6             pea.l     -$a(a6)
  00a2be  3f3c200e             move.w    #$200e, -(a7)
  00a2c2  a9eb                 _Pack4_FP 
  00a2c4  486efff6             pea.l     -$a(a6)
  00a2c8  486efff6             pea.l     -$a(a6)
  00a2cc  3f3c0810             move.w    #$810, -(a7)
  00a2d0  a9eb                 _Pack4_FP 
  00a2d2  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00a2da  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00a2e2  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00a2e8  486efff6             pea.l     -$a(a6)
  00a2ec  486effec             pea.l     -$14(a6)
  00a2f0  3f3c0804             move.w    #$804, -(a7)
  00a2f4  a9eb                 _Pack4_FP 
  00a2f6  486a004e             pea.l     $4e(a2)
  00a2fa  486effe2             pea.l     -$1e(a6)
  00a2fe  3f3c200e             move.w    #$200e, -(a7)
  00a302  a9eb                 _Pack4_FP 
  00a304  486effec             pea.l     -$14(a6)
  00a308  486effe2             pea.l     -$1e(a6)
  00a30c  3f3c0002             move.w    #$2, -(a7)
  00a310  a9eb                 _Pack4_FP 
  00a312  486effe2             pea.l     -$1e(a6)
  00a316  3f3c0016             move.w    #$16, -(a7)
  00a31a  a9eb                 _Pack4_FP 
  00a31c  486effe2             pea.l     -$1e(a6)
  00a320  486effe2             pea.l     -$1e(a6)
  00a324  3f3c2810             move.w    #$2810, -(a7)
  00a328  a9eb                 _Pack4_FP 
  00a32a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a330  60001ef2             bra.w     $c224
  00a334  3d43fff6             move.w    d3, -$a(a6)
  00a338  486efff6             pea.l     -$a(a6)
  00a33c  486efff6             pea.l     -$a(a6)
  00a340  3f3c200e             move.w    #$200e, -(a7)
  00a344  a9eb                 _Pack4_FP 
  00a346  486efff6             pea.l     -$a(a6)
  00a34a  486efff6             pea.l     -$a(a6)
  00a34e  3f3c0810             move.w    #$810, -(a7)
  00a352  a9eb                 _Pack4_FP 
  00a354  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00a35c  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00a364  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00a36a  486efff6             pea.l     -$a(a6)
  00a36e  486effec             pea.l     -$14(a6)
  00a372  3f3c0804             move.w    #$804, -(a7)
  00a376  a9eb                 _Pack4_FP 
  00a378  486a0050             pea.l     $50(a2)
  00a37c  486effe2             pea.l     -$1e(a6)
  00a380  3f3c200e             move.w    #$200e, -(a7)
  00a384  a9eb                 _Pack4_FP 
  00a386  486effec             pea.l     -$14(a6)
  00a38a  486effe2             pea.l     -$1e(a6)
  00a38e  3f3c0000             move.w    #$0, -(a7)
  00a392  a9eb                 _Pack4_FP 
  00a394  486effe2             pea.l     -$1e(a6)
  00a398  3f3c0016             move.w    #$16, -(a7)
  00a39c  a9eb                 _Pack4_FP 
  00a39e  486effe2             pea.l     -$1e(a6)
  00a3a2  486effe2             pea.l     -$1e(a6)
  00a3a6  3f3c2810             move.w    #$2810, -(a7)
  00a3aa  a9eb                 _Pack4_FP 
  00a3ac  356effe40050         move.w    -$1c(a6), $50(a2)
  00a3b2  3d43fff6             move.w    d3, -$a(a6)
  00a3b6  486efff6             pea.l     -$a(a6)
  00a3ba  486efff6             pea.l     -$a(a6)
  00a3be  3f3c200e             move.w    #$200e, -(a7)
  00a3c2  a9eb                 _Pack4_FP 
  00a3c4  486efff6             pea.l     -$a(a6)
  00a3c8  486efff6             pea.l     -$a(a6)
  00a3cc  3f3c0810             move.w    #$810, -(a7)
  00a3d0  a9eb                 _Pack4_FP 
  00a3d2  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00a3da  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00a3e2  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00a3e8  486efff6             pea.l     -$a(a6)
  00a3ec  486effec             pea.l     -$14(a6)
  00a3f0  3f3c0804             move.w    #$804, -(a7)
  00a3f4  a9eb                 _Pack4_FP 
  00a3f6  486a004e             pea.l     $4e(a2)
  00a3fa  486effe2             pea.l     -$1e(a6)
  00a3fe  3f3c200e             move.w    #$200e, -(a7)
  00a402  a9eb                 _Pack4_FP 
  00a404  486effec             pea.l     -$14(a6)
  00a408  486effe2             pea.l     -$1e(a6)
  00a40c  3f3c0002             move.w    #$2, -(a7)
  00a410  a9eb                 _Pack4_FP 
  00a412  486effe2             pea.l     -$1e(a6)
  00a416  3f3c0016             move.w    #$16, -(a7)
  00a41a  a9eb                 _Pack4_FP 
  00a41c  486effe2             pea.l     -$1e(a6)
  00a420  486effe2             pea.l     -$1e(a6)
  00a424  3f3c2810             move.w    #$2810, -(a7)
  00a428  a9eb                 _Pack4_FP 
  00a42a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a430  60001df2             bra.w     $c224
  00a434  3d43fff6             move.w    d3, -$a(a6)
  00a438  486efff6             pea.l     -$a(a6)
  00a43c  486efff6             pea.l     -$a(a6)
  00a440  3f3c200e             move.w    #$200e, -(a7)
  00a444  a9eb                 _Pack4_FP 
  00a446  486efff6             pea.l     -$a(a6)
  00a44a  486efff6             pea.l     -$a(a6)
  00a44e  3f3c0810             move.w    #$810, -(a7)
  00a452  a9eb                 _Pack4_FP 
  00a454  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00a45c  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00a464  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00a46a  486efff6             pea.l     -$a(a6)
  00a46e  486effec             pea.l     -$14(a6)
  00a472  3f3c0804             move.w    #$804, -(a7)
  00a476  a9eb                 _Pack4_FP 
  00a478  486a0050             pea.l     $50(a2)
  00a47c  486effe2             pea.l     -$1e(a6)
  00a480  3f3c200e             move.w    #$200e, -(a7)
  00a484  a9eb                 _Pack4_FP 
  00a486  486effec             pea.l     -$14(a6)
  00a48a  486effe2             pea.l     -$1e(a6)
  00a48e  3f3c0000             move.w    #$0, -(a7)
  00a492  a9eb                 _Pack4_FP 
  00a494  486effe2             pea.l     -$1e(a6)
  00a498  3f3c0016             move.w    #$16, -(a7)
  00a49c  a9eb                 _Pack4_FP 
  00a49e  486effe2             pea.l     -$1e(a6)
  00a4a2  486effe2             pea.l     -$1e(a6)
  00a4a6  3f3c2810             move.w    #$2810, -(a7)
  00a4aa  a9eb                 _Pack4_FP 
  00a4ac  356effe40050         move.w    -$1c(a6), $50(a2)
  00a4b2  3d43fff6             move.w    d3, -$a(a6)
  00a4b6  486efff6             pea.l     -$a(a6)
  00a4ba  486efff6             pea.l     -$a(a6)
  00a4be  3f3c200e             move.w    #$200e, -(a7)
  00a4c2  a9eb                 _Pack4_FP 
  00a4c4  486efff6             pea.l     -$a(a6)
  00a4c8  486efff6             pea.l     -$a(a6)
  00a4cc  3f3c0810             move.w    #$810, -(a7)
  00a4d0  a9eb                 _Pack4_FP 
  00a4d2  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00a4da  42aefff0             clr.l     -$10(a6)
  00a4de  426efff4             clr.w     -$c(a6)
  00a4e2  486efff6             pea.l     -$a(a6)
  00a4e6  486effec             pea.l     -$14(a6)
  00a4ea  3f3c0804             move.w    #$804, -(a7)
  00a4ee  a9eb                 _Pack4_FP 
  00a4f0  486a004e             pea.l     $4e(a2)
  00a4f4  486effe2             pea.l     -$1e(a6)
  00a4f8  3f3c200e             move.w    #$200e, -(a7)
  00a4fc  a9eb                 _Pack4_FP 
  00a4fe  486effec             pea.l     -$14(a6)
  00a502  486effe2             pea.l     -$1e(a6)
  00a506  3f3c0002             move.w    #$2, -(a7)
  00a50a  a9eb                 _Pack4_FP 
  00a50c  486effe2             pea.l     -$1e(a6)
  00a510  3f3c0016             move.w    #$16, -(a7)
  00a514  a9eb                 _Pack4_FP 
  00a516  486effe2             pea.l     -$1e(a6)
  00a51a  486effe2             pea.l     -$1e(a6)
  00a51e  3f3c2810             move.w    #$2810, -(a7)
  00a522  a9eb                 _Pack4_FP 
  00a524  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a52a  60001cf8             bra.w     $c224
  00a52e  3d43fff6             move.w    d3, -$a(a6)
  00a532  486efff6             pea.l     -$a(a6)
  00a536  486efff6             pea.l     -$a(a6)
  00a53a  3f3c200e             move.w    #$200e, -(a7)
  00a53e  a9eb                 _Pack4_FP 
  00a540  486efff6             pea.l     -$a(a6)
  00a544  486efff6             pea.l     -$a(a6)
  00a548  3f3c0810             move.w    #$810, -(a7)
  00a54c  a9eb                 _Pack4_FP 
  00a54e  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00a556  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00a55e  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00a564  486efff6             pea.l     -$a(a6)
  00a568  486effec             pea.l     -$14(a6)
  00a56c  3f3c0804             move.w    #$804, -(a7)
  00a570  a9eb                 _Pack4_FP 
  00a572  486a0050             pea.l     $50(a2)
  00a576  486effe2             pea.l     -$1e(a6)
  00a57a  3f3c200e             move.w    #$200e, -(a7)
  00a57e  a9eb                 _Pack4_FP 
  00a580  486effec             pea.l     -$14(a6)
  00a584  486effe2             pea.l     -$1e(a6)
  00a588  3f3c0000             move.w    #$0, -(a7)
  00a58c  a9eb                 _Pack4_FP 
  00a58e  486effe2             pea.l     -$1e(a6)
  00a592  3f3c0016             move.w    #$16, -(a7)
  00a596  a9eb                 _Pack4_FP 
  00a598  486effe2             pea.l     -$1e(a6)
  00a59c  486effe2             pea.l     -$1e(a6)
  00a5a0  3f3c2810             move.w    #$2810, -(a7)
  00a5a4  a9eb                 _Pack4_FP 
  00a5a6  356effe40050         move.w    -$1c(a6), $50(a2)
  00a5ac  3d43fff6             move.w    d3, -$a(a6)
  00a5b0  486efff6             pea.l     -$a(a6)
  00a5b4  486efff6             pea.l     -$a(a6)
  00a5b8  3f3c200e             move.w    #$200e, -(a7)
  00a5bc  a9eb                 _Pack4_FP 
  00a5be  486efff6             pea.l     -$a(a6)
  00a5c2  486efff6             pea.l     -$a(a6)
  00a5c6  3f3c0810             move.w    #$810, -(a7)
  00a5ca  a9eb                 _Pack4_FP 
  00a5cc  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00a5d4  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00a5dc  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00a5e2  486efff6             pea.l     -$a(a6)
  00a5e6  486effec             pea.l     -$14(a6)
  00a5ea  3f3c0804             move.w    #$804, -(a7)
  00a5ee  a9eb                 _Pack4_FP 
  00a5f0  486a004e             pea.l     $4e(a2)
  00a5f4  486effe2             pea.l     -$1e(a6)
  00a5f8  3f3c200e             move.w    #$200e, -(a7)
  00a5fc  a9eb                 _Pack4_FP 
  00a5fe  486effec             pea.l     -$14(a6)
  00a602  486effe2             pea.l     -$1e(a6)
  00a606  3f3c0002             move.w    #$2, -(a7)
  00a60a  a9eb                 _Pack4_FP 
  00a60c  486effe2             pea.l     -$1e(a6)
  00a610  3f3c0016             move.w    #$16, -(a7)
  00a614  a9eb                 _Pack4_FP 
  00a616  486effe2             pea.l     -$1e(a6)
  00a61a  486effe2             pea.l     -$1e(a6)
  00a61e  3f3c2810             move.w    #$2810, -(a7)
  00a622  a9eb                 _Pack4_FP 
  00a624  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a62a  60001bf8             bra.w     $c224
  00a62e  3d43fff6             move.w    d3, -$a(a6)
  00a632  486efff6             pea.l     -$a(a6)
  00a636  486efff6             pea.l     -$a(a6)
  00a63a  3f3c200e             move.w    #$200e, -(a7)
  00a63e  a9eb                 _Pack4_FP 
  00a640  486efff6             pea.l     -$a(a6)
  00a644  486efff6             pea.l     -$a(a6)
  00a648  3f3c0810             move.w    #$810, -(a7)
  00a64c  a9eb                 _Pack4_FP 
  00a64e  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00a656  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00a65e  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00a664  486efff6             pea.l     -$a(a6)
  00a668  486effec             pea.l     -$14(a6)
  00a66c  3f3c0804             move.w    #$804, -(a7)
  00a670  a9eb                 _Pack4_FP 
  00a672  486a0050             pea.l     $50(a2)
  00a676  486effe2             pea.l     -$1e(a6)
  00a67a  3f3c200e             move.w    #$200e, -(a7)
  00a67e  a9eb                 _Pack4_FP 
  00a680  486effec             pea.l     -$14(a6)
  00a684  486effe2             pea.l     -$1e(a6)
  00a688  3f3c0000             move.w    #$0, -(a7)
  00a68c  a9eb                 _Pack4_FP 
  00a68e  486effe2             pea.l     -$1e(a6)
  00a692  3f3c0016             move.w    #$16, -(a7)
  00a696  a9eb                 _Pack4_FP 
  00a698  486effe2             pea.l     -$1e(a6)
  00a69c  486effe2             pea.l     -$1e(a6)
  00a6a0  3f3c2810             move.w    #$2810, -(a7)
  00a6a4  a9eb                 _Pack4_FP 
  00a6a6  356effe40050         move.w    -$1c(a6), $50(a2)
  00a6ac  3d43fff6             move.w    d3, -$a(a6)
  00a6b0  486efff6             pea.l     -$a(a6)
  00a6b4  486efff6             pea.l     -$a(a6)
  00a6b8  3f3c200e             move.w    #$200e, -(a7)
  00a6bc  a9eb                 _Pack4_FP 
  00a6be  486efff6             pea.l     -$a(a6)
  00a6c2  486efff6             pea.l     -$a(a6)
  00a6c6  3f3c0810             move.w    #$810, -(a7)
  00a6ca  a9eb                 _Pack4_FP 
  00a6cc  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00a6d4  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00a6dc  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00a6e2  486efff6             pea.l     -$a(a6)
  00a6e6  486effec             pea.l     -$14(a6)
  00a6ea  3f3c0804             move.w    #$804, -(a7)
  00a6ee  a9eb                 _Pack4_FP 
  00a6f0  486a004e             pea.l     $4e(a2)
  00a6f4  486effe2             pea.l     -$1e(a6)
  00a6f8  3f3c200e             move.w    #$200e, -(a7)
  00a6fc  a9eb                 _Pack4_FP 
  00a6fe  486effec             pea.l     -$14(a6)
  00a702  486effe2             pea.l     -$1e(a6)
  00a706  3f3c0002             move.w    #$2, -(a7)
  00a70a  a9eb                 _Pack4_FP 
  00a70c  486effe2             pea.l     -$1e(a6)
  00a710  3f3c0016             move.w    #$16, -(a7)
  00a714  a9eb                 _Pack4_FP 
  00a716  486effe2             pea.l     -$1e(a6)
  00a71a  486effe2             pea.l     -$1e(a6)
  00a71e  3f3c2810             move.w    #$2810, -(a7)
  00a722  a9eb                 _Pack4_FP 
  00a724  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a72a  60001af8             bra.w     $c224
  00a72e  3d43fff6             move.w    d3, -$a(a6)
  00a732  486efff6             pea.l     -$a(a6)
  00a736  486efff6             pea.l     -$a(a6)
  00a73a  3f3c200e             move.w    #$200e, -(a7)
  00a73e  a9eb                 _Pack4_FP 
  00a740  486efff6             pea.l     -$a(a6)
  00a744  486efff6             pea.l     -$a(a6)
  00a748  3f3c0810             move.w    #$810, -(a7)
  00a74c  a9eb                 _Pack4_FP 
  00a74e  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00a756  42aefff0             clr.l     -$10(a6)
  00a75a  426efff4             clr.w     -$c(a6)
  00a75e  486efff6             pea.l     -$a(a6)
  00a762  486effec             pea.l     -$14(a6)
  00a766  3f3c0804             move.w    #$804, -(a7)
  00a76a  a9eb                 _Pack4_FP 
  00a76c  486a0050             pea.l     $50(a2)
  00a770  486effe2             pea.l     -$1e(a6)
  00a774  3f3c200e             move.w    #$200e, -(a7)
  00a778  a9eb                 _Pack4_FP 
  00a77a  486effec             pea.l     -$14(a6)
  00a77e  486effe2             pea.l     -$1e(a6)
  00a782  3f3c0000             move.w    #$0, -(a7)
  00a786  a9eb                 _Pack4_FP 
  00a788  486effe2             pea.l     -$1e(a6)
  00a78c  3f3c0016             move.w    #$16, -(a7)
  00a790  a9eb                 _Pack4_FP 
  00a792  486effe2             pea.l     -$1e(a6)
  00a796  486effe2             pea.l     -$1e(a6)
  00a79a  3f3c2810             move.w    #$2810, -(a7)
  00a79e  a9eb                 _Pack4_FP 
  00a7a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00a7a6  3d43fff6             move.w    d3, -$a(a6)
  00a7aa  486efff6             pea.l     -$a(a6)
  00a7ae  486efff6             pea.l     -$a(a6)
  00a7b2  3f3c200e             move.w    #$200e, -(a7)
  00a7b6  a9eb                 _Pack4_FP 
  00a7b8  486efff6             pea.l     -$a(a6)
  00a7bc  486efff6             pea.l     -$a(a6)
  00a7c0  3f3c0810             move.w    #$810, -(a7)
  00a7c4  a9eb                 _Pack4_FP 
  00a7c6  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00a7ce  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00a7d6  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00a7dc  486efff6             pea.l     -$a(a6)
  00a7e0  486effec             pea.l     -$14(a6)
  00a7e4  3f3c0804             move.w    #$804, -(a7)
  00a7e8  a9eb                 _Pack4_FP 
  00a7ea  486a004e             pea.l     $4e(a2)
  00a7ee  486effe2             pea.l     -$1e(a6)
  00a7f2  3f3c200e             move.w    #$200e, -(a7)
  00a7f6  a9eb                 _Pack4_FP 
  00a7f8  486effec             pea.l     -$14(a6)
  00a7fc  486effe2             pea.l     -$1e(a6)
  00a800  3f3c0002             move.w    #$2, -(a7)
  00a804  a9eb                 _Pack4_FP 
  00a806  486effe2             pea.l     -$1e(a6)
  00a80a  3f3c0016             move.w    #$16, -(a7)
  00a80e  a9eb                 _Pack4_FP 
  00a810  486effe2             pea.l     -$1e(a6)
  00a814  486effe2             pea.l     -$1e(a6)
  00a818  3f3c2810             move.w    #$2810, -(a7)
  00a81c  a9eb                 _Pack4_FP 
  00a81e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a824  600019fe             bra.w     $c224
  00a828  3d43fff6             move.w    d3, -$a(a6)
  00a82c  486efff6             pea.l     -$a(a6)
  00a830  486efff6             pea.l     -$a(a6)
  00a834  3f3c200e             move.w    #$200e, -(a7)
  00a838  a9eb                 _Pack4_FP 
  00a83a  486efff6             pea.l     -$a(a6)
  00a83e  486efff6             pea.l     -$a(a6)
  00a842  3f3c0810             move.w    #$810, -(a7)
  00a846  a9eb                 _Pack4_FP 
  00a848  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00a850  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00a858  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00a85e  486efff6             pea.l     -$a(a6)
  00a862  486effec             pea.l     -$14(a6)
  00a866  3f3c0804             move.w    #$804, -(a7)
  00a86a  a9eb                 _Pack4_FP 
  00a86c  486a0050             pea.l     $50(a2)
  00a870  486effe2             pea.l     -$1e(a6)
  00a874  3f3c200e             move.w    #$200e, -(a7)
  00a878  a9eb                 _Pack4_FP 
  00a87a  486effec             pea.l     -$14(a6)
  00a87e  486effe2             pea.l     -$1e(a6)
  00a882  3f3c0000             move.w    #$0, -(a7)
  00a886  a9eb                 _Pack4_FP 
  00a888  486effe2             pea.l     -$1e(a6)
  00a88c  3f3c0016             move.w    #$16, -(a7)
  00a890  a9eb                 _Pack4_FP 
  00a892  486effe2             pea.l     -$1e(a6)
  00a896  486effe2             pea.l     -$1e(a6)
  00a89a  3f3c2810             move.w    #$2810, -(a7)
  00a89e  a9eb                 _Pack4_FP 
  00a8a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00a8a6  3d43fff6             move.w    d3, -$a(a6)
  00a8aa  486efff6             pea.l     -$a(a6)
  00a8ae  486efff6             pea.l     -$a(a6)
  00a8b2  3f3c200e             move.w    #$200e, -(a7)
  00a8b6  a9eb                 _Pack4_FP 
  00a8b8  486efff6             pea.l     -$a(a6)
  00a8bc  486efff6             pea.l     -$a(a6)
  00a8c0  3f3c0810             move.w    #$810, -(a7)
  00a8c4  a9eb                 _Pack4_FP 
  00a8c6  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00a8ce  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00a8d6  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00a8dc  486efff6             pea.l     -$a(a6)
  00a8e0  486effec             pea.l     -$14(a6)
  00a8e4  3f3c0804             move.w    #$804, -(a7)
  00a8e8  a9eb                 _Pack4_FP 
  00a8ea  486a004e             pea.l     $4e(a2)
  00a8ee  486effe2             pea.l     -$1e(a6)
  00a8f2  3f3c200e             move.w    #$200e, -(a7)
  00a8f6  a9eb                 _Pack4_FP 
  00a8f8  486effec             pea.l     -$14(a6)
  00a8fc  486effe2             pea.l     -$1e(a6)
  00a900  3f3c0002             move.w    #$2, -(a7)
  00a904  a9eb                 _Pack4_FP 
  00a906  486effe2             pea.l     -$1e(a6)
  00a90a  3f3c0016             move.w    #$16, -(a7)
  00a90e  a9eb                 _Pack4_FP 
  00a910  486effe2             pea.l     -$1e(a6)
  00a914  486effe2             pea.l     -$1e(a6)
  00a918  3f3c2810             move.w    #$2810, -(a7)
  00a91c  a9eb                 _Pack4_FP 
  00a91e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00a924  600018fe             bra.w     $c224
  00a928  3d43fff6             move.w    d3, -$a(a6)
  00a92c  486efff6             pea.l     -$a(a6)
  00a930  486efff6             pea.l     -$a(a6)
  00a934  3f3c200e             move.w    #$200e, -(a7)
  00a938  a9eb                 _Pack4_FP 
  00a93a  486efff6             pea.l     -$a(a6)
  00a93e  486efff6             pea.l     -$a(a6)
  00a942  3f3c0810             move.w    #$810, -(a7)
  00a946  a9eb                 _Pack4_FP 
  00a948  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00a950  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00a958  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00a95e  486efff6             pea.l     -$a(a6)
  00a962  486effec             pea.l     -$14(a6)
  00a966  3f3c0804             move.w    #$804, -(a7)
  00a96a  a9eb                 _Pack4_FP 
  00a96c  486a0050             pea.l     $50(a2)
  00a970  486effe2             pea.l     -$1e(a6)
  00a974  3f3c200e             move.w    #$200e, -(a7)
  00a978  a9eb                 _Pack4_FP 
  00a97a  486effec             pea.l     -$14(a6)
  00a97e  486effe2             pea.l     -$1e(a6)
  00a982  3f3c0000             move.w    #$0, -(a7)
  00a986  a9eb                 _Pack4_FP 
  00a988  486effe2             pea.l     -$1e(a6)
  00a98c  3f3c0016             move.w    #$16, -(a7)
  00a990  a9eb                 _Pack4_FP 
  00a992  486effe2             pea.l     -$1e(a6)
  00a996  486effe2             pea.l     -$1e(a6)
  00a99a  3f3c2810             move.w    #$2810, -(a7)
  00a99e  a9eb                 _Pack4_FP 
  00a9a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00a9a6  3d43fff6             move.w    d3, -$a(a6)
  00a9aa  486efff6             pea.l     -$a(a6)
  00a9ae  486efff6             pea.l     -$a(a6)
  00a9b2  3f3c200e             move.w    #$200e, -(a7)
  00a9b6  a9eb                 _Pack4_FP 
  00a9b8  486efff6             pea.l     -$a(a6)
  00a9bc  486efff6             pea.l     -$a(a6)
  00a9c0  3f3c0810             move.w    #$810, -(a7)
  00a9c4  a9eb                 _Pack4_FP 
  00a9c6  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00a9ce  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00a9d6  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00a9dc  486efff6             pea.l     -$a(a6)
  00a9e0  486effec             pea.l     -$14(a6)
  00a9e4  3f3c0804             move.w    #$804, -(a7)
  00a9e8  a9eb                 _Pack4_FP 
  00a9ea  486a004e             pea.l     $4e(a2)
  00a9ee  486effe2             pea.l     -$1e(a6)
  00a9f2  3f3c200e             move.w    #$200e, -(a7)
  00a9f6  a9eb                 _Pack4_FP 
  00a9f8  486effec             pea.l     -$14(a6)
  00a9fc  486effe2             pea.l     -$1e(a6)
  00aa00  3f3c0002             move.w    #$2, -(a7)
  00aa04  a9eb                 _Pack4_FP 
  00aa06  486effe2             pea.l     -$1e(a6)
  00aa0a  3f3c0016             move.w    #$16, -(a7)
  00aa0e  a9eb                 _Pack4_FP 
  00aa10  486effe2             pea.l     -$1e(a6)
  00aa14  486effe2             pea.l     -$1e(a6)
  00aa18  3f3c2810             move.w    #$2810, -(a7)
  00aa1c  a9eb                 _Pack4_FP 
  00aa1e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00aa24  600017fe             bra.w     $c224
  00aa28  3003                 move.w    d3, d0
  00aa2a  48c0                 ext.l     d0
  00aa2c  916a004e             sub.w     d0, $4e(a2)
  00aa30  600017f2             bra.w     $c224
  00aa34  3d43fff6             move.w    d3, -$a(a6)
  00aa38  486efff6             pea.l     -$a(a6)
  00aa3c  486efff6             pea.l     -$a(a6)
  00aa40  3f3c200e             move.w    #$200e, -(a7)
  00aa44  a9eb                 _Pack4_FP 
  00aa46  486efff6             pea.l     -$a(a6)
  00aa4a  486efff6             pea.l     -$a(a6)
  00aa4e  3f3c0810             move.w    #$810, -(a7)
  00aa52  a9eb                 _Pack4_FP 
  00aa54  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00aa5c  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00aa64  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00aa6a  486efff6             pea.l     -$a(a6)
  00aa6e  486effec             pea.l     -$14(a6)
  00aa72  3f3c0804             move.w    #$804, -(a7)
  00aa76  a9eb                 _Pack4_FP 
  00aa78  486a0050             pea.l     $50(a2)
  00aa7c  486effe2             pea.l     -$1e(a6)
  00aa80  3f3c200e             move.w    #$200e, -(a7)
  00aa84  a9eb                 _Pack4_FP 
  00aa86  486effec             pea.l     -$14(a6)
  00aa8a  486effe2             pea.l     -$1e(a6)
  00aa8e  3f3c0002             move.w    #$2, -(a7)
  00aa92  a9eb                 _Pack4_FP 
  00aa94  486effe2             pea.l     -$1e(a6)
  00aa98  3f3c0016             move.w    #$16, -(a7)
  00aa9c  a9eb                 _Pack4_FP 
  00aa9e  486effe2             pea.l     -$1e(a6)
  00aaa2  486effe2             pea.l     -$1e(a6)
  00aaa6  3f3c2810             move.w    #$2810, -(a7)
  00aaaa  a9eb                 _Pack4_FP 
  00aaac  356effe40050         move.w    -$1c(a6), $50(a2)
  00aab2  3d43fff6             move.w    d3, -$a(a6)
  00aab6  486efff6             pea.l     -$a(a6)
  00aaba  486efff6             pea.l     -$a(a6)
  00aabe  3f3c200e             move.w    #$200e, -(a7)
  00aac2  a9eb                 _Pack4_FP 
  00aac4  486efff6             pea.l     -$a(a6)
  00aac8  486efff6             pea.l     -$a(a6)
  00aacc  3f3c0810             move.w    #$810, -(a7)
  00aad0  a9eb                 _Pack4_FP 
  00aad2  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00aada  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00aae2  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00aae8  486efff6             pea.l     -$a(a6)
  00aaec  486effec             pea.l     -$14(a6)
  00aaf0  3f3c0804             move.w    #$804, -(a7)
  00aaf4  a9eb                 _Pack4_FP 
  00aaf6  486a004e             pea.l     $4e(a2)
  00aafa  486effe2             pea.l     -$1e(a6)
  00aafe  3f3c200e             move.w    #$200e, -(a7)
  00ab02  a9eb                 _Pack4_FP 
  00ab04  486effec             pea.l     -$14(a6)
  00ab08  486effe2             pea.l     -$1e(a6)
  00ab0c  3f3c0002             move.w    #$2, -(a7)
  00ab10  a9eb                 _Pack4_FP 
  00ab12  486effe2             pea.l     -$1e(a6)
  00ab16  3f3c0016             move.w    #$16, -(a7)
  00ab1a  a9eb                 _Pack4_FP 
  00ab1c  486effe2             pea.l     -$1e(a6)
  00ab20  486effe2             pea.l     -$1e(a6)
  00ab24  3f3c2810             move.w    #$2810, -(a7)
  00ab28  a9eb                 _Pack4_FP 
  00ab2a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00ab30  600016f2             bra.w     $c224
  00ab34  3d43fff6             move.w    d3, -$a(a6)
  00ab38  486efff6             pea.l     -$a(a6)
  00ab3c  486efff6             pea.l     -$a(a6)
  00ab40  3f3c200e             move.w    #$200e, -(a7)
  00ab44  a9eb                 _Pack4_FP 
  00ab46  486efff6             pea.l     -$a(a6)
  00ab4a  486efff6             pea.l     -$a(a6)
  00ab4e  3f3c0810             move.w    #$810, -(a7)
  00ab52  a9eb                 _Pack4_FP 
  00ab54  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00ab5c  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00ab64  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00ab6a  486efff6             pea.l     -$a(a6)
  00ab6e  486effec             pea.l     -$14(a6)
  00ab72  3f3c0804             move.w    #$804, -(a7)
  00ab76  a9eb                 _Pack4_FP 
  00ab78  486a0050             pea.l     $50(a2)
  00ab7c  486effe2             pea.l     -$1e(a6)
  00ab80  3f3c200e             move.w    #$200e, -(a7)
  00ab84  a9eb                 _Pack4_FP 
  00ab86  486effec             pea.l     -$14(a6)
  00ab8a  486effe2             pea.l     -$1e(a6)
  00ab8e  3f3c0002             move.w    #$2, -(a7)
  00ab92  a9eb                 _Pack4_FP 
  00ab94  486effe2             pea.l     -$1e(a6)
  00ab98  3f3c0016             move.w    #$16, -(a7)
  00ab9c  a9eb                 _Pack4_FP 
  00ab9e  486effe2             pea.l     -$1e(a6)
  00aba2  486effe2             pea.l     -$1e(a6)
  00aba6  3f3c2810             move.w    #$2810, -(a7)
  00abaa  a9eb                 _Pack4_FP 
  00abac  356effe40050         move.w    -$1c(a6), $50(a2)
  00abb2  3d43fff6             move.w    d3, -$a(a6)
  00abb6  486efff6             pea.l     -$a(a6)
  00abba  486efff6             pea.l     -$a(a6)
  00abbe  3f3c200e             move.w    #$200e, -(a7)
  00abc2  a9eb                 _Pack4_FP 
  00abc4  486efff6             pea.l     -$a(a6)
  00abc8  486efff6             pea.l     -$a(a6)
  00abcc  3f3c0810             move.w    #$810, -(a7)
  00abd0  a9eb                 _Pack4_FP 
  00abd2  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00abda  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00abe2  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00abe8  486efff6             pea.l     -$a(a6)
  00abec  486effec             pea.l     -$14(a6)
  00abf0  3f3c0804             move.w    #$804, -(a7)
  00abf4  a9eb                 _Pack4_FP 
  00abf6  486a004e             pea.l     $4e(a2)
  00abfa  486effe2             pea.l     -$1e(a6)
  00abfe  3f3c200e             move.w    #$200e, -(a7)
  00ac02  a9eb                 _Pack4_FP 
  00ac04  486effec             pea.l     -$14(a6)
  00ac08  486effe2             pea.l     -$1e(a6)
  00ac0c  3f3c0002             move.w    #$2, -(a7)
  00ac10  a9eb                 _Pack4_FP 
  00ac12  486effe2             pea.l     -$1e(a6)
  00ac16  3f3c0016             move.w    #$16, -(a7)
  00ac1a  a9eb                 _Pack4_FP 
  00ac1c  486effe2             pea.l     -$1e(a6)
  00ac20  486effe2             pea.l     -$1e(a6)
  00ac24  3f3c2810             move.w    #$2810, -(a7)
  00ac28  a9eb                 _Pack4_FP 
  00ac2a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00ac30  600015f2             bra.w     $c224
  00ac34  3d43fff6             move.w    d3, -$a(a6)
  00ac38  486efff6             pea.l     -$a(a6)
  00ac3c  486efff6             pea.l     -$a(a6)
  00ac40  3f3c200e             move.w    #$200e, -(a7)
  00ac44  a9eb                 _Pack4_FP 
  00ac46  486efff6             pea.l     -$a(a6)
  00ac4a  486efff6             pea.l     -$a(a6)
  00ac4e  3f3c0810             move.w    #$810, -(a7)
  00ac52  a9eb                 _Pack4_FP 
  00ac54  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00ac5c  42aefff0             clr.l     -$10(a6)
  00ac60  426efff4             clr.w     -$c(a6)
  00ac64  486efff6             pea.l     -$a(a6)
  00ac68  486effec             pea.l     -$14(a6)
  00ac6c  3f3c0804             move.w    #$804, -(a7)
  00ac70  a9eb                 _Pack4_FP 
  00ac72  486a0050             pea.l     $50(a2)
  00ac76  486effe2             pea.l     -$1e(a6)
  00ac7a  3f3c200e             move.w    #$200e, -(a7)
  00ac7e  a9eb                 _Pack4_FP 
  00ac80  486effec             pea.l     -$14(a6)
  00ac84  486effe2             pea.l     -$1e(a6)
  00ac88  3f3c0002             move.w    #$2, -(a7)
  00ac8c  a9eb                 _Pack4_FP 
  00ac8e  486effe2             pea.l     -$1e(a6)
  00ac92  3f3c0016             move.w    #$16, -(a7)
  00ac96  a9eb                 _Pack4_FP 
  00ac98  486effe2             pea.l     -$1e(a6)
  00ac9c  486effe2             pea.l     -$1e(a6)
  00aca0  3f3c2810             move.w    #$2810, -(a7)
  00aca4  a9eb                 _Pack4_FP 
  00aca6  356effe40050         move.w    -$1c(a6), $50(a2)
  00acac  3d43fff6             move.w    d3, -$a(a6)
  00acb0  486efff6             pea.l     -$a(a6)
  00acb4  486efff6             pea.l     -$a(a6)
  00acb8  3f3c200e             move.w    #$200e, -(a7)
  00acbc  a9eb                 _Pack4_FP 
  00acbe  486efff6             pea.l     -$a(a6)
  00acc2  486efff6             pea.l     -$a(a6)
  00acc6  3f3c0810             move.w    #$810, -(a7)
  00acca  a9eb                 _Pack4_FP 
  00accc  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00acd4  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00acdc  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00ace2  486efff6             pea.l     -$a(a6)
  00ace6  486effec             pea.l     -$14(a6)
  00acea  3f3c0804             move.w    #$804, -(a7)
  00acee  a9eb                 _Pack4_FP 
  00acf0  486a004e             pea.l     $4e(a2)
  00acf4  486effe2             pea.l     -$1e(a6)
  00acf8  3f3c200e             move.w    #$200e, -(a7)
  00acfc  a9eb                 _Pack4_FP 
  00acfe  486effec             pea.l     -$14(a6)
  00ad02  486effe2             pea.l     -$1e(a6)
  00ad06  3f3c0002             move.w    #$2, -(a7)
  00ad0a  a9eb                 _Pack4_FP 
  00ad0c  486effe2             pea.l     -$1e(a6)
  00ad10  3f3c0016             move.w    #$16, -(a7)
  00ad14  a9eb                 _Pack4_FP 
  00ad16  486effe2             pea.l     -$1e(a6)
  00ad1a  486effe2             pea.l     -$1e(a6)
  00ad1e  3f3c2810             move.w    #$2810, -(a7)
  00ad22  a9eb                 _Pack4_FP 
  00ad24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00ad2a  600014f8             bra.w     $c224
  00ad2e  3d43fff6             move.w    d3, -$a(a6)
  00ad32  486efff6             pea.l     -$a(a6)
  00ad36  486efff6             pea.l     -$a(a6)
  00ad3a  3f3c200e             move.w    #$200e, -(a7)
  00ad3e  a9eb                 _Pack4_FP 
  00ad40  486efff6             pea.l     -$a(a6)
  00ad44  486efff6             pea.l     -$a(a6)
  00ad48  3f3c0810             move.w    #$810, -(a7)
  00ad4c  a9eb                 _Pack4_FP 
  00ad4e  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00ad56  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00ad5e  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00ad64  486efff6             pea.l     -$a(a6)
  00ad68  486effec             pea.l     -$14(a6)
  00ad6c  3f3c0804             move.w    #$804, -(a7)
  00ad70  a9eb                 _Pack4_FP 
  00ad72  486a0050             pea.l     $50(a2)
  00ad76  486effe2             pea.l     -$1e(a6)
  00ad7a  3f3c200e             move.w    #$200e, -(a7)
  00ad7e  a9eb                 _Pack4_FP 
  00ad80  486effec             pea.l     -$14(a6)
  00ad84  486effe2             pea.l     -$1e(a6)
  00ad88  3f3c0002             move.w    #$2, -(a7)
  00ad8c  a9eb                 _Pack4_FP 
  00ad8e  486effe2             pea.l     -$1e(a6)
  00ad92  3f3c0016             move.w    #$16, -(a7)
  00ad96  a9eb                 _Pack4_FP 
  00ad98  486effe2             pea.l     -$1e(a6)
  00ad9c  486effe2             pea.l     -$1e(a6)
  00ada0  3f3c2810             move.w    #$2810, -(a7)
  00ada4  a9eb                 _Pack4_FP 
  00ada6  356effe40050         move.w    -$1c(a6), $50(a2)
  00adac  3d43fff6             move.w    d3, -$a(a6)
  00adb0  486efff6             pea.l     -$a(a6)
  00adb4  486efff6             pea.l     -$a(a6)
  00adb8  3f3c200e             move.w    #$200e, -(a7)
  00adbc  a9eb                 _Pack4_FP 
  00adbe  486efff6             pea.l     -$a(a6)
  00adc2  486efff6             pea.l     -$a(a6)
  00adc6  3f3c0810             move.w    #$810, -(a7)
  00adca  a9eb                 _Pack4_FP 
  00adcc  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00add4  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00addc  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00ade2  486efff6             pea.l     -$a(a6)
  00ade6  486effec             pea.l     -$14(a6)
  00adea  3f3c0804             move.w    #$804, -(a7)
  00adee  a9eb                 _Pack4_FP 
  00adf0  486a004e             pea.l     $4e(a2)
  00adf4  486effe2             pea.l     -$1e(a6)
  00adf8  3f3c200e             move.w    #$200e, -(a7)
  00adfc  a9eb                 _Pack4_FP 
  00adfe  486effec             pea.l     -$14(a6)
  00ae02  486effe2             pea.l     -$1e(a6)
  00ae06  3f3c0002             move.w    #$2, -(a7)
  00ae0a  a9eb                 _Pack4_FP 
  00ae0c  486effe2             pea.l     -$1e(a6)
  00ae10  3f3c0016             move.w    #$16, -(a7)
  00ae14  a9eb                 _Pack4_FP 
  00ae16  486effe2             pea.l     -$1e(a6)
  00ae1a  486effe2             pea.l     -$1e(a6)
  00ae1e  3f3c2810             move.w    #$2810, -(a7)
  00ae22  a9eb                 _Pack4_FP 
  00ae24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00ae2a  600013f8             bra.w     $c224
  00ae2e  3d43fff6             move.w    d3, -$a(a6)
  00ae32  486efff6             pea.l     -$a(a6)
  00ae36  486efff6             pea.l     -$a(a6)
  00ae3a  3f3c200e             move.w    #$200e, -(a7)
  00ae3e  a9eb                 _Pack4_FP 
  00ae40  486efff6             pea.l     -$a(a6)
  00ae44  486efff6             pea.l     -$a(a6)
  00ae48  3f3c0810             move.w    #$810, -(a7)
  00ae4c  a9eb                 _Pack4_FP 
  00ae4e  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00ae56  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00ae5e  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00ae64  486efff6             pea.l     -$a(a6)
  00ae68  486effec             pea.l     -$14(a6)
  00ae6c  3f3c0804             move.w    #$804, -(a7)
  00ae70  a9eb                 _Pack4_FP 
  00ae72  486a0050             pea.l     $50(a2)
  00ae76  486effe2             pea.l     -$1e(a6)
  00ae7a  3f3c200e             move.w    #$200e, -(a7)
  00ae7e  a9eb                 _Pack4_FP 
  00ae80  486effec             pea.l     -$14(a6)
  00ae84  486effe2             pea.l     -$1e(a6)
  00ae88  3f3c0002             move.w    #$2, -(a7)
  00ae8c  a9eb                 _Pack4_FP 
  00ae8e  486effe2             pea.l     -$1e(a6)
  00ae92  3f3c0016             move.w    #$16, -(a7)
  00ae96  a9eb                 _Pack4_FP 
  00ae98  486effe2             pea.l     -$1e(a6)
  00ae9c  486effe2             pea.l     -$1e(a6)
  00aea0  3f3c2810             move.w    #$2810, -(a7)
  00aea4  a9eb                 _Pack4_FP 
  00aea6  356effe40050         move.w    -$1c(a6), $50(a2)
  00aeac  3d43fff6             move.w    d3, -$a(a6)
  00aeb0  486efff6             pea.l     -$a(a6)
  00aeb4  486efff6             pea.l     -$a(a6)
  00aeb8  3f3c200e             move.w    #$200e, -(a7)
  00aebc  a9eb                 _Pack4_FP 
  00aebe  486efff6             pea.l     -$a(a6)
  00aec2  486efff6             pea.l     -$a(a6)
  00aec6  3f3c0810             move.w    #$810, -(a7)
  00aeca  a9eb                 _Pack4_FP 
  00aecc  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00aed4  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00aedc  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00aee2  486efff6             pea.l     -$a(a6)
  00aee6  486effec             pea.l     -$14(a6)
  00aeea  3f3c0804             move.w    #$804, -(a7)
  00aeee  a9eb                 _Pack4_FP 
  00aef0  486a004e             pea.l     $4e(a2)
  00aef4  486effe2             pea.l     -$1e(a6)
  00aef8  3f3c200e             move.w    #$200e, -(a7)
  00aefc  a9eb                 _Pack4_FP 
  00aefe  486effec             pea.l     -$14(a6)
  00af02  486effe2             pea.l     -$1e(a6)
  00af06  3f3c0002             move.w    #$2, -(a7)
  00af0a  a9eb                 _Pack4_FP 
  00af0c  486effe2             pea.l     -$1e(a6)
  00af10  3f3c0016             move.w    #$16, -(a7)
  00af14  a9eb                 _Pack4_FP 
  00af16  486effe2             pea.l     -$1e(a6)
  00af1a  486effe2             pea.l     -$1e(a6)
  00af1e  3f3c2810             move.w    #$2810, -(a7)
  00af22  a9eb                 _Pack4_FP 
  00af24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00af2a  600012f8             bra.w     $c224
  00af2e  3d43fff6             move.w    d3, -$a(a6)
  00af32  486efff6             pea.l     -$a(a6)
  00af36  486efff6             pea.l     -$a(a6)
  00af3a  3f3c200e             move.w    #$200e, -(a7)
  00af3e  a9eb                 _Pack4_FP 
  00af40  486efff6             pea.l     -$a(a6)
  00af44  486efff6             pea.l     -$a(a6)
  00af48  3f3c0810             move.w    #$810, -(a7)
  00af4c  a9eb                 _Pack4_FP 
  00af4e  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00af56  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00af5e  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00af64  486efff6             pea.l     -$a(a6)
  00af68  486effec             pea.l     -$14(a6)
  00af6c  3f3c0804             move.w    #$804, -(a7)
  00af70  a9eb                 _Pack4_FP 
  00af72  486a0050             pea.l     $50(a2)
  00af76  486effe2             pea.l     -$1e(a6)
  00af7a  3f3c200e             move.w    #$200e, -(a7)
  00af7e  a9eb                 _Pack4_FP 
  00af80  486effec             pea.l     -$14(a6)
  00af84  486effe2             pea.l     -$1e(a6)
  00af88  3f3c0002             move.w    #$2, -(a7)
  00af8c  a9eb                 _Pack4_FP 
  00af8e  486effe2             pea.l     -$1e(a6)
  00af92  3f3c0016             move.w    #$16, -(a7)
  00af96  a9eb                 _Pack4_FP 
  00af98  486effe2             pea.l     -$1e(a6)
  00af9c  486effe2             pea.l     -$1e(a6)
  00afa0  3f3c2810             move.w    #$2810, -(a7)
  00afa4  a9eb                 _Pack4_FP 
  00afa6  356effe40050         move.w    -$1c(a6), $50(a2)
  00afac  3d43fff6             move.w    d3, -$a(a6)
  00afb0  486efff6             pea.l     -$a(a6)
  00afb4  486efff6             pea.l     -$a(a6)
  00afb8  3f3c200e             move.w    #$200e, -(a7)
  00afbc  a9eb                 _Pack4_FP 
  00afbe  486efff6             pea.l     -$a(a6)
  00afc2  486efff6             pea.l     -$a(a6)
  00afc6  3f3c0810             move.w    #$810, -(a7)
  00afca  a9eb                 _Pack4_FP 
  00afcc  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00afd4  42aefff0             clr.l     -$10(a6)
  00afd8  426efff4             clr.w     -$c(a6)
  00afdc  486efff6             pea.l     -$a(a6)
  00afe0  486effec             pea.l     -$14(a6)
  00afe4  3f3c0804             move.w    #$804, -(a7)
  00afe8  a9eb                 _Pack4_FP 
  00afea  486a004e             pea.l     $4e(a2)
  00afee  486effe2             pea.l     -$1e(a6)
  00aff2  3f3c200e             move.w    #$200e, -(a7)
  00aff6  a9eb                 _Pack4_FP 
  00aff8  486effec             pea.l     -$14(a6)
  00affc  486effe2             pea.l     -$1e(a6)
  00b000  3f3c0002             move.w    #$2, -(a7)
  00b004  a9eb                 _Pack4_FP 
  00b006  486effe2             pea.l     -$1e(a6)
  00b00a  3f3c0016             move.w    #$16, -(a7)
  00b00e  a9eb                 _Pack4_FP 
  00b010  486effe2             pea.l     -$1e(a6)
  00b014  486effe2             pea.l     -$1e(a6)
  00b018  3f3c2810             move.w    #$2810, -(a7)
  00b01c  a9eb                 _Pack4_FP 
  00b01e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b024  600011fe             bra.w     $c224
  00b028  3d43fff6             move.w    d3, -$a(a6)
  00b02c  486efff6             pea.l     -$a(a6)
  00b030  486efff6             pea.l     -$a(a6)
  00b034  3f3c200e             move.w    #$200e, -(a7)
  00b038  a9eb                 _Pack4_FP 
  00b03a  486efff6             pea.l     -$a(a6)
  00b03e  486efff6             pea.l     -$a(a6)
  00b042  3f3c0810             move.w    #$810, -(a7)
  00b046  a9eb                 _Pack4_FP 
  00b048  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00b050  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00b058  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00b05e  486efff6             pea.l     -$a(a6)
  00b062  486effec             pea.l     -$14(a6)
  00b066  3f3c0804             move.w    #$804, -(a7)
  00b06a  a9eb                 _Pack4_FP 
  00b06c  486a0050             pea.l     $50(a2)
  00b070  486effe2             pea.l     -$1e(a6)
  00b074  3f3c200e             move.w    #$200e, -(a7)
  00b078  a9eb                 _Pack4_FP 
  00b07a  486effec             pea.l     -$14(a6)
  00b07e  486effe2             pea.l     -$1e(a6)
  00b082  3f3c0002             move.w    #$2, -(a7)
  00b086  a9eb                 _Pack4_FP 
  00b088  486effe2             pea.l     -$1e(a6)
  00b08c  3f3c0016             move.w    #$16, -(a7)
  00b090  a9eb                 _Pack4_FP 
  00b092  486effe2             pea.l     -$1e(a6)
  00b096  486effe2             pea.l     -$1e(a6)
  00b09a  3f3c2810             move.w    #$2810, -(a7)
  00b09e  a9eb                 _Pack4_FP 
  00b0a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00b0a6  3d43fff6             move.w    d3, -$a(a6)
  00b0aa  486efff6             pea.l     -$a(a6)
  00b0ae  486efff6             pea.l     -$a(a6)
  00b0b2  3f3c200e             move.w    #$200e, -(a7)
  00b0b6  a9eb                 _Pack4_FP 
  00b0b8  486efff6             pea.l     -$a(a6)
  00b0bc  486efff6             pea.l     -$a(a6)
  00b0c0  3f3c0810             move.w    #$810, -(a7)
  00b0c4  a9eb                 _Pack4_FP 
  00b0c6  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00b0ce  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00b0d6  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00b0dc  486efff6             pea.l     -$a(a6)
  00b0e0  486effec             pea.l     -$14(a6)
  00b0e4  3f3c0804             move.w    #$804, -(a7)
  00b0e8  a9eb                 _Pack4_FP 
  00b0ea  486a004e             pea.l     $4e(a2)
  00b0ee  486effe2             pea.l     -$1e(a6)
  00b0f2  3f3c200e             move.w    #$200e, -(a7)
  00b0f6  a9eb                 _Pack4_FP 
  00b0f8  486effec             pea.l     -$14(a6)
  00b0fc  486effe2             pea.l     -$1e(a6)
  00b100  3f3c0002             move.w    #$2, -(a7)
  00b104  a9eb                 _Pack4_FP 
  00b106  486effe2             pea.l     -$1e(a6)
  00b10a  3f3c0016             move.w    #$16, -(a7)
  00b10e  a9eb                 _Pack4_FP 
  00b110  486effe2             pea.l     -$1e(a6)
  00b114  486effe2             pea.l     -$1e(a6)
  00b118  3f3c2810             move.w    #$2810, -(a7)
  00b11c  a9eb                 _Pack4_FP 
  00b11e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b124  600010fe             bra.w     $c224
  00b128  3d43fff6             move.w    d3, -$a(a6)
  00b12c  486efff6             pea.l     -$a(a6)
  00b130  486efff6             pea.l     -$a(a6)
  00b134  3f3c200e             move.w    #$200e, -(a7)
  00b138  a9eb                 _Pack4_FP 
  00b13a  486efff6             pea.l     -$a(a6)
  00b13e  486efff6             pea.l     -$a(a6)
  00b142  3f3c0810             move.w    #$810, -(a7)
  00b146  a9eb                 _Pack4_FP 
  00b148  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00b150  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00b158  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00b15e  486efff6             pea.l     -$a(a6)
  00b162  486effec             pea.l     -$14(a6)
  00b166  3f3c0804             move.w    #$804, -(a7)
  00b16a  a9eb                 _Pack4_FP 
  00b16c  486a0050             pea.l     $50(a2)
  00b170  486effe2             pea.l     -$1e(a6)
  00b174  3f3c200e             move.w    #$200e, -(a7)
  00b178  a9eb                 _Pack4_FP 
  00b17a  486effec             pea.l     -$14(a6)
  00b17e  486effe2             pea.l     -$1e(a6)
  00b182  3f3c0002             move.w    #$2, -(a7)
  00b186  a9eb                 _Pack4_FP 
  00b188  486effe2             pea.l     -$1e(a6)
  00b18c  3f3c0016             move.w    #$16, -(a7)
  00b190  a9eb                 _Pack4_FP 
  00b192  486effe2             pea.l     -$1e(a6)
  00b196  486effe2             pea.l     -$1e(a6)
  00b19a  3f3c2810             move.w    #$2810, -(a7)
  00b19e  a9eb                 _Pack4_FP 
  00b1a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00b1a6  3d43fff6             move.w    d3, -$a(a6)
  00b1aa  486efff6             pea.l     -$a(a6)
  00b1ae  486efff6             pea.l     -$a(a6)
  00b1b2  3f3c200e             move.w    #$200e, -(a7)
  00b1b6  a9eb                 _Pack4_FP 
  00b1b8  486efff6             pea.l     -$a(a6)
  00b1bc  486efff6             pea.l     -$a(a6)
  00b1c0  3f3c0810             move.w    #$810, -(a7)
  00b1c4  a9eb                 _Pack4_FP 
  00b1c6  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00b1ce  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00b1d6  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00b1dc  486efff6             pea.l     -$a(a6)
  00b1e0  486effec             pea.l     -$14(a6)
  00b1e4  3f3c0804             move.w    #$804, -(a7)
  00b1e8  a9eb                 _Pack4_FP 
  00b1ea  486a004e             pea.l     $4e(a2)
  00b1ee  486effe2             pea.l     -$1e(a6)
  00b1f2  3f3c200e             move.w    #$200e, -(a7)
  00b1f6  a9eb                 _Pack4_FP 
  00b1f8  486effec             pea.l     -$14(a6)
  00b1fc  486effe2             pea.l     -$1e(a6)
  00b200  3f3c0002             move.w    #$2, -(a7)
  00b204  a9eb                 _Pack4_FP 
  00b206  486effe2             pea.l     -$1e(a6)
  00b20a  3f3c0016             move.w    #$16, -(a7)
  00b20e  a9eb                 _Pack4_FP 
  00b210  486effe2             pea.l     -$1e(a6)
  00b214  486effe2             pea.l     -$1e(a6)
  00b218  3f3c2810             move.w    #$2810, -(a7)
  00b21c  a9eb                 _Pack4_FP 
  00b21e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b224  60000ffe             bra.w     $c224
  00b228  3003                 move.w    d3, d0
  00b22a  48c0                 ext.l     d0
  00b22c  916a0050             sub.w     d0, $50(a2)
  00b230  60000ff2             bra.w     $c224
  00b234  3d43fff6             move.w    d3, -$a(a6)
  00b238  486efff6             pea.l     -$a(a6)
  00b23c  486efff6             pea.l     -$a(a6)
  00b240  3f3c200e             move.w    #$200e, -(a7)
  00b244  a9eb                 _Pack4_FP 
  00b246  486efff6             pea.l     -$a(a6)
  00b24a  486efff6             pea.l     -$a(a6)
  00b24e  3f3c0810             move.w    #$810, -(a7)
  00b252  a9eb                 _Pack4_FP 
  00b254  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00b25c  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00b264  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00b26a  486efff6             pea.l     -$a(a6)
  00b26e  486effec             pea.l     -$14(a6)
  00b272  3f3c0804             move.w    #$804, -(a7)
  00b276  a9eb                 _Pack4_FP 
  00b278  486a0050             pea.l     $50(a2)
  00b27c  486effe2             pea.l     -$1e(a6)
  00b280  3f3c200e             move.w    #$200e, -(a7)
  00b284  a9eb                 _Pack4_FP 
  00b286  486effec             pea.l     -$14(a6)
  00b28a  486effe2             pea.l     -$1e(a6)
  00b28e  3f3c0002             move.w    #$2, -(a7)
  00b292  a9eb                 _Pack4_FP 
  00b294  486effe2             pea.l     -$1e(a6)
  00b298  3f3c0016             move.w    #$16, -(a7)
  00b29c  a9eb                 _Pack4_FP 
  00b29e  486effe2             pea.l     -$1e(a6)
  00b2a2  486effe2             pea.l     -$1e(a6)
  00b2a6  3f3c2810             move.w    #$2810, -(a7)
  00b2aa  a9eb                 _Pack4_FP 
  00b2ac  356effe40050         move.w    -$1c(a6), $50(a2)
  00b2b2  3d43fff6             move.w    d3, -$a(a6)
  00b2b6  486efff6             pea.l     -$a(a6)
  00b2ba  486efff6             pea.l     -$a(a6)
  00b2be  3f3c200e             move.w    #$200e, -(a7)
  00b2c2  a9eb                 _Pack4_FP 
  00b2c4  486efff6             pea.l     -$a(a6)
  00b2c8  486efff6             pea.l     -$a(a6)
  00b2cc  3f3c0810             move.w    #$810, -(a7)
  00b2d0  a9eb                 _Pack4_FP 
  00b2d2  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00b2da  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00b2e2  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00b2e8  486efff6             pea.l     -$a(a6)
  00b2ec  486effec             pea.l     -$14(a6)
  00b2f0  3f3c0804             move.w    #$804, -(a7)
  00b2f4  a9eb                 _Pack4_FP 
  00b2f6  486a004e             pea.l     $4e(a2)
  00b2fa  486effe2             pea.l     -$1e(a6)
  00b2fe  3f3c200e             move.w    #$200e, -(a7)
  00b302  a9eb                 _Pack4_FP 
  00b304  486effec             pea.l     -$14(a6)
  00b308  486effe2             pea.l     -$1e(a6)
  00b30c  3f3c0000             move.w    #$0, -(a7)
  00b310  a9eb                 _Pack4_FP 
  00b312  486effe2             pea.l     -$1e(a6)
  00b316  3f3c0016             move.w    #$16, -(a7)
  00b31a  a9eb                 _Pack4_FP 
  00b31c  486effe2             pea.l     -$1e(a6)
  00b320  486effe2             pea.l     -$1e(a6)
  00b324  3f3c2810             move.w    #$2810, -(a7)
  00b328  a9eb                 _Pack4_FP 
  00b32a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b330  60000ef2             bra.w     $c224
  00b334  3d43fff6             move.w    d3, -$a(a6)
  00b338  486efff6             pea.l     -$a(a6)
  00b33c  486efff6             pea.l     -$a(a6)
  00b340  3f3c200e             move.w    #$200e, -(a7)
  00b344  a9eb                 _Pack4_FP 
  00b346  486efff6             pea.l     -$a(a6)
  00b34a  486efff6             pea.l     -$a(a6)
  00b34e  3f3c0810             move.w    #$810, -(a7)
  00b352  a9eb                 _Pack4_FP 
  00b354  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00b35c  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00b364  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00b36a  486efff6             pea.l     -$a(a6)
  00b36e  486effec             pea.l     -$14(a6)
  00b372  3f3c0804             move.w    #$804, -(a7)
  00b376  a9eb                 _Pack4_FP 
  00b378  486a0050             pea.l     $50(a2)
  00b37c  486effe2             pea.l     -$1e(a6)
  00b380  3f3c200e             move.w    #$200e, -(a7)
  00b384  a9eb                 _Pack4_FP 
  00b386  486effec             pea.l     -$14(a6)
  00b38a  486effe2             pea.l     -$1e(a6)
  00b38e  3f3c0002             move.w    #$2, -(a7)
  00b392  a9eb                 _Pack4_FP 
  00b394  486effe2             pea.l     -$1e(a6)
  00b398  3f3c0016             move.w    #$16, -(a7)
  00b39c  a9eb                 _Pack4_FP 
  00b39e  486effe2             pea.l     -$1e(a6)
  00b3a2  486effe2             pea.l     -$1e(a6)
  00b3a6  3f3c2810             move.w    #$2810, -(a7)
  00b3aa  a9eb                 _Pack4_FP 
  00b3ac  356effe40050         move.w    -$1c(a6), $50(a2)
  00b3b2  3d43fff6             move.w    d3, -$a(a6)
  00b3b6  486efff6             pea.l     -$a(a6)
  00b3ba  486efff6             pea.l     -$a(a6)
  00b3be  3f3c200e             move.w    #$200e, -(a7)
  00b3c2  a9eb                 _Pack4_FP 
  00b3c4  486efff6             pea.l     -$a(a6)
  00b3c8  486efff6             pea.l     -$a(a6)
  00b3cc  3f3c0810             move.w    #$810, -(a7)
  00b3d0  a9eb                 _Pack4_FP 
  00b3d2  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00b3da  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00b3e2  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00b3e8  486efff6             pea.l     -$a(a6)
  00b3ec  486effec             pea.l     -$14(a6)
  00b3f0  3f3c0804             move.w    #$804, -(a7)
  00b3f4  a9eb                 _Pack4_FP 
  00b3f6  486a004e             pea.l     $4e(a2)
  00b3fa  486effe2             pea.l     -$1e(a6)
  00b3fe  3f3c200e             move.w    #$200e, -(a7)
  00b402  a9eb                 _Pack4_FP 
  00b404  486effec             pea.l     -$14(a6)
  00b408  486effe2             pea.l     -$1e(a6)
  00b40c  3f3c0000             move.w    #$0, -(a7)
  00b410  a9eb                 _Pack4_FP 
  00b412  486effe2             pea.l     -$1e(a6)
  00b416  3f3c0016             move.w    #$16, -(a7)
  00b41a  a9eb                 _Pack4_FP 
  00b41c  486effe2             pea.l     -$1e(a6)
  00b420  486effe2             pea.l     -$1e(a6)
  00b424  3f3c2810             move.w    #$2810, -(a7)
  00b428  a9eb                 _Pack4_FP 
  00b42a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b430  60000df2             bra.w     $c224
  00b434  3d43fff6             move.w    d3, -$a(a6)
  00b438  486efff6             pea.l     -$a(a6)
  00b43c  486efff6             pea.l     -$a(a6)
  00b440  3f3c200e             move.w    #$200e, -(a7)
  00b444  a9eb                 _Pack4_FP 
  00b446  486efff6             pea.l     -$a(a6)
  00b44a  486efff6             pea.l     -$a(a6)
  00b44e  3f3c0810             move.w    #$810, -(a7)
  00b452  a9eb                 _Pack4_FP 
  00b454  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00b45c  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00b464  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00b46a  486efff6             pea.l     -$a(a6)
  00b46e  486effec             pea.l     -$14(a6)
  00b472  3f3c0804             move.w    #$804, -(a7)
  00b476  a9eb                 _Pack4_FP 
  00b478  486a0050             pea.l     $50(a2)
  00b47c  486effe2             pea.l     -$1e(a6)
  00b480  3f3c200e             move.w    #$200e, -(a7)
  00b484  a9eb                 _Pack4_FP 
  00b486  486effec             pea.l     -$14(a6)
  00b48a  486effe2             pea.l     -$1e(a6)
  00b48e  3f3c0002             move.w    #$2, -(a7)
  00b492  a9eb                 _Pack4_FP 
  00b494  486effe2             pea.l     -$1e(a6)
  00b498  3f3c0016             move.w    #$16, -(a7)
  00b49c  a9eb                 _Pack4_FP 
  00b49e  486effe2             pea.l     -$1e(a6)
  00b4a2  486effe2             pea.l     -$1e(a6)
  00b4a6  3f3c2810             move.w    #$2810, -(a7)
  00b4aa  a9eb                 _Pack4_FP 
  00b4ac  356effe40050         move.w    -$1c(a6), $50(a2)
  00b4b2  3d43fff6             move.w    d3, -$a(a6)
  00b4b6  486efff6             pea.l     -$a(a6)
  00b4ba  486efff6             pea.l     -$a(a6)
  00b4be  3f3c200e             move.w    #$200e, -(a7)
  00b4c2  a9eb                 _Pack4_FP 
  00b4c4  486efff6             pea.l     -$a(a6)
  00b4c8  486efff6             pea.l     -$a(a6)
  00b4cc  3f3c0810             move.w    #$810, -(a7)
  00b4d0  a9eb                 _Pack4_FP 
  00b4d2  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00b4da  42aefff0             clr.l     -$10(a6)
  00b4de  426efff4             clr.w     -$c(a6)
  00b4e2  486efff6             pea.l     -$a(a6)
  00b4e6  486effec             pea.l     -$14(a6)
  00b4ea  3f3c0804             move.w    #$804, -(a7)
  00b4ee  a9eb                 _Pack4_FP 
  00b4f0  486a004e             pea.l     $4e(a2)
  00b4f4  486effe2             pea.l     -$1e(a6)
  00b4f8  3f3c200e             move.w    #$200e, -(a7)
  00b4fc  a9eb                 _Pack4_FP 
  00b4fe  486effec             pea.l     -$14(a6)
  00b502  486effe2             pea.l     -$1e(a6)
  00b506  3f3c0000             move.w    #$0, -(a7)
  00b50a  a9eb                 _Pack4_FP 
  00b50c  486effe2             pea.l     -$1e(a6)
  00b510  3f3c0016             move.w    #$16, -(a7)
  00b514  a9eb                 _Pack4_FP 
  00b516  486effe2             pea.l     -$1e(a6)
  00b51a  486effe2             pea.l     -$1e(a6)
  00b51e  3f3c2810             move.w    #$2810, -(a7)
  00b522  a9eb                 _Pack4_FP 
  00b524  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b52a  60000cf8             bra.w     $c224
  00b52e  3d43fff6             move.w    d3, -$a(a6)
  00b532  486efff6             pea.l     -$a(a6)
  00b536  486efff6             pea.l     -$a(a6)
  00b53a  3f3c200e             move.w    #$200e, -(a7)
  00b53e  a9eb                 _Pack4_FP 
  00b540  486efff6             pea.l     -$a(a6)
  00b544  486efff6             pea.l     -$a(a6)
  00b548  3f3c0810             move.w    #$810, -(a7)
  00b54c  a9eb                 _Pack4_FP 
  00b54e  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00b556  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00b55e  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00b564  486efff6             pea.l     -$a(a6)
  00b568  486effec             pea.l     -$14(a6)
  00b56c  3f3c0804             move.w    #$804, -(a7)
  00b570  a9eb                 _Pack4_FP 
  00b572  486a0050             pea.l     $50(a2)
  00b576  486effe2             pea.l     -$1e(a6)
  00b57a  3f3c200e             move.w    #$200e, -(a7)
  00b57e  a9eb                 _Pack4_FP 
  00b580  486effec             pea.l     -$14(a6)
  00b584  486effe2             pea.l     -$1e(a6)
  00b588  3f3c0002             move.w    #$2, -(a7)
  00b58c  a9eb                 _Pack4_FP 
  00b58e  486effe2             pea.l     -$1e(a6)
  00b592  3f3c0016             move.w    #$16, -(a7)
  00b596  a9eb                 _Pack4_FP 
  00b598  486effe2             pea.l     -$1e(a6)
  00b59c  486effe2             pea.l     -$1e(a6)
  00b5a0  3f3c2810             move.w    #$2810, -(a7)
  00b5a4  a9eb                 _Pack4_FP 
  00b5a6  356effe40050         move.w    -$1c(a6), $50(a2)
  00b5ac  3d43fff6             move.w    d3, -$a(a6)
  00b5b0  486efff6             pea.l     -$a(a6)
  00b5b4  486efff6             pea.l     -$a(a6)
  00b5b8  3f3c200e             move.w    #$200e, -(a7)
  00b5bc  a9eb                 _Pack4_FP 
  00b5be  486efff6             pea.l     -$a(a6)
  00b5c2  486efff6             pea.l     -$a(a6)
  00b5c6  3f3c0810             move.w    #$810, -(a7)
  00b5ca  a9eb                 _Pack4_FP 
  00b5cc  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00b5d4  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00b5dc  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00b5e2  486efff6             pea.l     -$a(a6)
  00b5e6  486effec             pea.l     -$14(a6)
  00b5ea  3f3c0804             move.w    #$804, -(a7)
  00b5ee  a9eb                 _Pack4_FP 
  00b5f0  486a004e             pea.l     $4e(a2)
  00b5f4  486effe2             pea.l     -$1e(a6)
  00b5f8  3f3c200e             move.w    #$200e, -(a7)
  00b5fc  a9eb                 _Pack4_FP 
  00b5fe  486effec             pea.l     -$14(a6)
  00b602  486effe2             pea.l     -$1e(a6)
  00b606  3f3c0000             move.w    #$0, -(a7)
  00b60a  a9eb                 _Pack4_FP 
  00b60c  486effe2             pea.l     -$1e(a6)
  00b610  3f3c0016             move.w    #$16, -(a7)
  00b614  a9eb                 _Pack4_FP 
  00b616  486effe2             pea.l     -$1e(a6)
  00b61a  486effe2             pea.l     -$1e(a6)
  00b61e  3f3c2810             move.w    #$2810, -(a7)
  00b622  a9eb                 _Pack4_FP 
  00b624  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b62a  60000bf8             bra.w     $c224
  00b62e  3d43fff6             move.w    d3, -$a(a6)
  00b632  486efff6             pea.l     -$a(a6)
  00b636  486efff6             pea.l     -$a(a6)
  00b63a  3f3c200e             move.w    #$200e, -(a7)
  00b63e  a9eb                 _Pack4_FP 
  00b640  486efff6             pea.l     -$a(a6)
  00b644  486efff6             pea.l     -$a(a6)
  00b648  3f3c0810             move.w    #$810, -(a7)
  00b64c  a9eb                 _Pack4_FP 
  00b64e  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00b656  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00b65e  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00b664  486efff6             pea.l     -$a(a6)
  00b668  486effec             pea.l     -$14(a6)
  00b66c  3f3c0804             move.w    #$804, -(a7)
  00b670  a9eb                 _Pack4_FP 
  00b672  486a0050             pea.l     $50(a2)
  00b676  486effe2             pea.l     -$1e(a6)
  00b67a  3f3c200e             move.w    #$200e, -(a7)
  00b67e  a9eb                 _Pack4_FP 
  00b680  486effec             pea.l     -$14(a6)
  00b684  486effe2             pea.l     -$1e(a6)
  00b688  3f3c0002             move.w    #$2, -(a7)
  00b68c  a9eb                 _Pack4_FP 
  00b68e  486effe2             pea.l     -$1e(a6)
  00b692  3f3c0016             move.w    #$16, -(a7)
  00b696  a9eb                 _Pack4_FP 
  00b698  486effe2             pea.l     -$1e(a6)
  00b69c  486effe2             pea.l     -$1e(a6)
  00b6a0  3f3c2810             move.w    #$2810, -(a7)
  00b6a4  a9eb                 _Pack4_FP 
  00b6a6  356effe40050         move.w    -$1c(a6), $50(a2)
  00b6ac  3d43fff6             move.w    d3, -$a(a6)
  00b6b0  486efff6             pea.l     -$a(a6)
  00b6b4  486efff6             pea.l     -$a(a6)
  00b6b8  3f3c200e             move.w    #$200e, -(a7)
  00b6bc  a9eb                 _Pack4_FP 
  00b6be  486efff6             pea.l     -$a(a6)
  00b6c2  486efff6             pea.l     -$a(a6)
  00b6c6  3f3c0810             move.w    #$810, -(a7)
  00b6ca  a9eb                 _Pack4_FP 
  00b6cc  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00b6d4  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00b6dc  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00b6e2  486efff6             pea.l     -$a(a6)
  00b6e6  486effec             pea.l     -$14(a6)
  00b6ea  3f3c0804             move.w    #$804, -(a7)
  00b6ee  a9eb                 _Pack4_FP 
  00b6f0  486a004e             pea.l     $4e(a2)
  00b6f4  486effe2             pea.l     -$1e(a6)
  00b6f8  3f3c200e             move.w    #$200e, -(a7)
  00b6fc  a9eb                 _Pack4_FP 
  00b6fe  486effec             pea.l     -$14(a6)
  00b702  486effe2             pea.l     -$1e(a6)
  00b706  3f3c0000             move.w    #$0, -(a7)
  00b70a  a9eb                 _Pack4_FP 
  00b70c  486effe2             pea.l     -$1e(a6)
  00b710  3f3c0016             move.w    #$16, -(a7)
  00b714  a9eb                 _Pack4_FP 
  00b716  486effe2             pea.l     -$1e(a6)
  00b71a  486effe2             pea.l     -$1e(a6)
  00b71e  3f3c2810             move.w    #$2810, -(a7)
  00b722  a9eb                 _Pack4_FP 
  00b724  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b72a  60000af8             bra.w     $c224
  00b72e  3d43fff6             move.w    d3, -$a(a6)
  00b732  486efff6             pea.l     -$a(a6)
  00b736  486efff6             pea.l     -$a(a6)
  00b73a  3f3c200e             move.w    #$200e, -(a7)
  00b73e  a9eb                 _Pack4_FP 
  00b740  486efff6             pea.l     -$a(a6)
  00b744  486efff6             pea.l     -$a(a6)
  00b748  3f3c0810             move.w    #$810, -(a7)
  00b74c  a9eb                 _Pack4_FP 
  00b74e  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00b756  42aefff0             clr.l     -$10(a6)
  00b75a  426efff4             clr.w     -$c(a6)
  00b75e  486efff6             pea.l     -$a(a6)
  00b762  486effec             pea.l     -$14(a6)
  00b766  3f3c0804             move.w    #$804, -(a7)
  00b76a  a9eb                 _Pack4_FP 
  00b76c  486a0050             pea.l     $50(a2)
  00b770  486effe2             pea.l     -$1e(a6)
  00b774  3f3c200e             move.w    #$200e, -(a7)
  00b778  a9eb                 _Pack4_FP 
  00b77a  486effec             pea.l     -$14(a6)
  00b77e  486effe2             pea.l     -$1e(a6)
  00b782  3f3c0002             move.w    #$2, -(a7)
  00b786  a9eb                 _Pack4_FP 
  00b788  486effe2             pea.l     -$1e(a6)
  00b78c  3f3c0016             move.w    #$16, -(a7)
  00b790  a9eb                 _Pack4_FP 
  00b792  486effe2             pea.l     -$1e(a6)
  00b796  486effe2             pea.l     -$1e(a6)
  00b79a  3f3c2810             move.w    #$2810, -(a7)
  00b79e  a9eb                 _Pack4_FP 
  00b7a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00b7a6  3d43fff6             move.w    d3, -$a(a6)
  00b7aa  486efff6             pea.l     -$a(a6)
  00b7ae  486efff6             pea.l     -$a(a6)
  00b7b2  3f3c200e             move.w    #$200e, -(a7)
  00b7b6  a9eb                 _Pack4_FP 
  00b7b8  486efff6             pea.l     -$a(a6)
  00b7bc  486efff6             pea.l     -$a(a6)
  00b7c0  3f3c0810             move.w    #$810, -(a7)
  00b7c4  a9eb                 _Pack4_FP 
  00b7c6  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00b7ce  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00b7d6  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00b7dc  486efff6             pea.l     -$a(a6)
  00b7e0  486effec             pea.l     -$14(a6)
  00b7e4  3f3c0804             move.w    #$804, -(a7)
  00b7e8  a9eb                 _Pack4_FP 
  00b7ea  486a004e             pea.l     $4e(a2)
  00b7ee  486effe2             pea.l     -$1e(a6)
  00b7f2  3f3c200e             move.w    #$200e, -(a7)
  00b7f6  a9eb                 _Pack4_FP 
  00b7f8  486effec             pea.l     -$14(a6)
  00b7fc  486effe2             pea.l     -$1e(a6)
  00b800  3f3c0000             move.w    #$0, -(a7)
  00b804  a9eb                 _Pack4_FP 
  00b806  486effe2             pea.l     -$1e(a6)
  00b80a  3f3c0016             move.w    #$16, -(a7)
  00b80e  a9eb                 _Pack4_FP 
  00b810  486effe2             pea.l     -$1e(a6)
  00b814  486effe2             pea.l     -$1e(a6)
  00b818  3f3c2810             move.w    #$2810, -(a7)
  00b81c  a9eb                 _Pack4_FP 
  00b81e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b824  600009fe             bra.w     $c224
  00b828  3d43fff6             move.w    d3, -$a(a6)
  00b82c  486efff6             pea.l     -$a(a6)
  00b830  486efff6             pea.l     -$a(a6)
  00b834  3f3c200e             move.w    #$200e, -(a7)
  00b838  a9eb                 _Pack4_FP 
  00b83a  486efff6             pea.l     -$a(a6)
  00b83e  486efff6             pea.l     -$a(a6)
  00b842  3f3c0810             move.w    #$810, -(a7)
  00b846  a9eb                 _Pack4_FP 
  00b848  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00b850  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00b858  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00b85e  486efff6             pea.l     -$a(a6)
  00b862  486effec             pea.l     -$14(a6)
  00b866  3f3c0804             move.w    #$804, -(a7)
  00b86a  a9eb                 _Pack4_FP 
  00b86c  486a0050             pea.l     $50(a2)
  00b870  486effe2             pea.l     -$1e(a6)
  00b874  3f3c200e             move.w    #$200e, -(a7)
  00b878  a9eb                 _Pack4_FP 
  00b87a  486effec             pea.l     -$14(a6)
  00b87e  486effe2             pea.l     -$1e(a6)
  00b882  3f3c0002             move.w    #$2, -(a7)
  00b886  a9eb                 _Pack4_FP 
  00b888  486effe2             pea.l     -$1e(a6)
  00b88c  3f3c0016             move.w    #$16, -(a7)
  00b890  a9eb                 _Pack4_FP 
  00b892  486effe2             pea.l     -$1e(a6)
  00b896  486effe2             pea.l     -$1e(a6)
  00b89a  3f3c2810             move.w    #$2810, -(a7)
  00b89e  a9eb                 _Pack4_FP 
  00b8a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00b8a6  3d43fff6             move.w    d3, -$a(a6)
  00b8aa  486efff6             pea.l     -$a(a6)
  00b8ae  486efff6             pea.l     -$a(a6)
  00b8b2  3f3c200e             move.w    #$200e, -(a7)
  00b8b6  a9eb                 _Pack4_FP 
  00b8b8  486efff6             pea.l     -$a(a6)
  00b8bc  486efff6             pea.l     -$a(a6)
  00b8c0  3f3c0810             move.w    #$810, -(a7)
  00b8c4  a9eb                 _Pack4_FP 
  00b8c6  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00b8ce  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00b8d6  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00b8dc  486efff6             pea.l     -$a(a6)
  00b8e0  486effec             pea.l     -$14(a6)
  00b8e4  3f3c0804             move.w    #$804, -(a7)
  00b8e8  a9eb                 _Pack4_FP 
  00b8ea  486a004e             pea.l     $4e(a2)
  00b8ee  486effe2             pea.l     -$1e(a6)
  00b8f2  3f3c200e             move.w    #$200e, -(a7)
  00b8f6  a9eb                 _Pack4_FP 
  00b8f8  486effec             pea.l     -$14(a6)
  00b8fc  486effe2             pea.l     -$1e(a6)
  00b900  3f3c0000             move.w    #$0, -(a7)
  00b904  a9eb                 _Pack4_FP 
  00b906  486effe2             pea.l     -$1e(a6)
  00b90a  3f3c0016             move.w    #$16, -(a7)
  00b90e  a9eb                 _Pack4_FP 
  00b910  486effe2             pea.l     -$1e(a6)
  00b914  486effe2             pea.l     -$1e(a6)
  00b918  3f3c2810             move.w    #$2810, -(a7)
  00b91c  a9eb                 _Pack4_FP 
  00b91e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00b924  600008fe             bra.w     $c224
  00b928  3d43fff6             move.w    d3, -$a(a6)
  00b92c  486efff6             pea.l     -$a(a6)
  00b930  486efff6             pea.l     -$a(a6)
  00b934  3f3c200e             move.w    #$200e, -(a7)
  00b938  a9eb                 _Pack4_FP 
  00b93a  486efff6             pea.l     -$a(a6)
  00b93e  486efff6             pea.l     -$a(a6)
  00b942  3f3c0810             move.w    #$810, -(a7)
  00b946  a9eb                 _Pack4_FP 
  00b948  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00b950  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00b958  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00b95e  486efff6             pea.l     -$a(a6)
  00b962  486effec             pea.l     -$14(a6)
  00b966  3f3c0804             move.w    #$804, -(a7)
  00b96a  a9eb                 _Pack4_FP 
  00b96c  486a0050             pea.l     $50(a2)
  00b970  486effe2             pea.l     -$1e(a6)
  00b974  3f3c200e             move.w    #$200e, -(a7)
  00b978  a9eb                 _Pack4_FP 
  00b97a  486effec             pea.l     -$14(a6)
  00b97e  486effe2             pea.l     -$1e(a6)
  00b982  3f3c0002             move.w    #$2, -(a7)
  00b986  a9eb                 _Pack4_FP 
  00b988  486effe2             pea.l     -$1e(a6)
  00b98c  3f3c0016             move.w    #$16, -(a7)
  00b990  a9eb                 _Pack4_FP 
  00b992  486effe2             pea.l     -$1e(a6)
  00b996  486effe2             pea.l     -$1e(a6)
  00b99a  3f3c2810             move.w    #$2810, -(a7)
  00b99e  a9eb                 _Pack4_FP 
  00b9a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00b9a6  3d43fff6             move.w    d3, -$a(a6)
  00b9aa  486efff6             pea.l     -$a(a6)
  00b9ae  486efff6             pea.l     -$a(a6)
  00b9b2  3f3c200e             move.w    #$200e, -(a7)
  00b9b6  a9eb                 _Pack4_FP 
  00b9b8  486efff6             pea.l     -$a(a6)
  00b9bc  486efff6             pea.l     -$a(a6)
  00b9c0  3f3c0810             move.w    #$810, -(a7)
  00b9c4  a9eb                 _Pack4_FP 
  00b9c6  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00b9ce  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00b9d6  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00b9dc  486efff6             pea.l     -$a(a6)
  00b9e0  486effec             pea.l     -$14(a6)
  00b9e4  3f3c0804             move.w    #$804, -(a7)
  00b9e8  a9eb                 _Pack4_FP 
  00b9ea  486a004e             pea.l     $4e(a2)
  00b9ee  486effe2             pea.l     -$1e(a6)
  00b9f2  3f3c200e             move.w    #$200e, -(a7)
  00b9f6  a9eb                 _Pack4_FP 
  00b9f8  486effec             pea.l     -$14(a6)
  00b9fc  486effe2             pea.l     -$1e(a6)
  00ba00  3f3c0000             move.w    #$0, -(a7)
  00ba04  a9eb                 _Pack4_FP 
  00ba06  486effe2             pea.l     -$1e(a6)
  00ba0a  3f3c0016             move.w    #$16, -(a7)
  00ba0e  a9eb                 _Pack4_FP 
  00ba10  486effe2             pea.l     -$1e(a6)
  00ba14  486effe2             pea.l     -$1e(a6)
  00ba18  3f3c2810             move.w    #$2810, -(a7)
  00ba1c  a9eb                 _Pack4_FP 
  00ba1e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00ba24  600007fe             bra.w     $c224
  00ba28  3003                 move.w    d3, d0
  00ba2a  48c0                 ext.l     d0
  00ba2c  d16a004e             add.w     d0, $4e(a2)
  00ba30  600007f2             bra.w     $c224
  00ba34  3d43fff6             move.w    d3, -$a(a6)
  00ba38  486efff6             pea.l     -$a(a6)
  00ba3c  486efff6             pea.l     -$a(a6)
  00ba40  3f3c200e             move.w    #$200e, -(a7)
  00ba44  a9eb                 _Pack4_FP 
  00ba46  486efff6             pea.l     -$a(a6)
  00ba4a  486efff6             pea.l     -$a(a6)
  00ba4e  3f3c0810             move.w    #$810, -(a7)
  00ba52  a9eb                 _Pack4_FP 
  00ba54  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00ba5c  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00ba64  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00ba6a  486efff6             pea.l     -$a(a6)
  00ba6e  486effec             pea.l     -$14(a6)
  00ba72  3f3c0804             move.w    #$804, -(a7)
  00ba76  a9eb                 _Pack4_FP 
  00ba78  486a0050             pea.l     $50(a2)
  00ba7c  486effe2             pea.l     -$1e(a6)
  00ba80  3f3c200e             move.w    #$200e, -(a7)
  00ba84  a9eb                 _Pack4_FP 
  00ba86  486effec             pea.l     -$14(a6)
  00ba8a  486effe2             pea.l     -$1e(a6)
  00ba8e  3f3c0000             move.w    #$0, -(a7)
  00ba92  a9eb                 _Pack4_FP 
  00ba94  486effe2             pea.l     -$1e(a6)
  00ba98  3f3c0016             move.w    #$16, -(a7)
  00ba9c  a9eb                 _Pack4_FP 
  00ba9e  486effe2             pea.l     -$1e(a6)
  00baa2  486effe2             pea.l     -$1e(a6)
  00baa6  3f3c2810             move.w    #$2810, -(a7)
  00baaa  a9eb                 _Pack4_FP 
  00baac  356effe40050         move.w    -$1c(a6), $50(a2)
  00bab2  3d43fff6             move.w    d3, -$a(a6)
  00bab6  486efff6             pea.l     -$a(a6)
  00baba  486efff6             pea.l     -$a(a6)
  00babe  3f3c200e             move.w    #$200e, -(a7)
  00bac2  a9eb                 _Pack4_FP 
  00bac4  486efff6             pea.l     -$a(a6)
  00bac8  486efff6             pea.l     -$a(a6)
  00bacc  3f3c0810             move.w    #$810, -(a7)
  00bad0  a9eb                 _Pack4_FP 
  00bad2  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00bada  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00bae2  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00bae8  486efff6             pea.l     -$a(a6)
  00baec  486effec             pea.l     -$14(a6)
  00baf0  3f3c0804             move.w    #$804, -(a7)
  00baf4  a9eb                 _Pack4_FP 
  00baf6  486a004e             pea.l     $4e(a2)
  00bafa  486effe2             pea.l     -$1e(a6)
  00bafe  3f3c200e             move.w    #$200e, -(a7)
  00bb02  a9eb                 _Pack4_FP 
  00bb04  486effec             pea.l     -$14(a6)
  00bb08  486effe2             pea.l     -$1e(a6)
  00bb0c  3f3c0000             move.w    #$0, -(a7)
  00bb10  a9eb                 _Pack4_FP 
  00bb12  486effe2             pea.l     -$1e(a6)
  00bb16  3f3c0016             move.w    #$16, -(a7)
  00bb1a  a9eb                 _Pack4_FP 
  00bb1c  486effe2             pea.l     -$1e(a6)
  00bb20  486effe2             pea.l     -$1e(a6)
  00bb24  3f3c2810             move.w    #$2810, -(a7)
  00bb28  a9eb                 _Pack4_FP 
  00bb2a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00bb30  600006f2             bra.w     $c224
  00bb34  3d43fff6             move.w    d3, -$a(a6)
  00bb38  486efff6             pea.l     -$a(a6)
  00bb3c  486efff6             pea.l     -$a(a6)
  00bb40  3f3c200e             move.w    #$200e, -(a7)
  00bb44  a9eb                 _Pack4_FP 
  00bb46  486efff6             pea.l     -$a(a6)
  00bb4a  486efff6             pea.l     -$a(a6)
  00bb4e  3f3c0810             move.w    #$810, -(a7)
  00bb52  a9eb                 _Pack4_FP 
  00bb54  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00bb5c  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00bb64  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00bb6a  486efff6             pea.l     -$a(a6)
  00bb6e  486effec             pea.l     -$14(a6)
  00bb72  3f3c0804             move.w    #$804, -(a7)
  00bb76  a9eb                 _Pack4_FP 
  00bb78  486a0050             pea.l     $50(a2)
  00bb7c  486effe2             pea.l     -$1e(a6)
  00bb80  3f3c200e             move.w    #$200e, -(a7)
  00bb84  a9eb                 _Pack4_FP 
  00bb86  486effec             pea.l     -$14(a6)
  00bb8a  486effe2             pea.l     -$1e(a6)
  00bb8e  3f3c0000             move.w    #$0, -(a7)
  00bb92  a9eb                 _Pack4_FP 
  00bb94  486effe2             pea.l     -$1e(a6)
  00bb98  3f3c0016             move.w    #$16, -(a7)
  00bb9c  a9eb                 _Pack4_FP 
  00bb9e  486effe2             pea.l     -$1e(a6)
  00bba2  486effe2             pea.l     -$1e(a6)
  00bba6  3f3c2810             move.w    #$2810, -(a7)
  00bbaa  a9eb                 _Pack4_FP 
  00bbac  356effe40050         move.w    -$1c(a6), $50(a2)
  00bbb2  3d43fff6             move.w    d3, -$a(a6)
  00bbb6  486efff6             pea.l     -$a(a6)
  00bbba  486efff6             pea.l     -$a(a6)
  00bbbe  3f3c200e             move.w    #$200e, -(a7)
  00bbc2  a9eb                 _Pack4_FP 
  00bbc4  486efff6             pea.l     -$a(a6)
  00bbc8  486efff6             pea.l     -$a(a6)
  00bbcc  3f3c0810             move.w    #$810, -(a7)
  00bbd0  a9eb                 _Pack4_FP 
  00bbd2  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00bbda  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00bbe2  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00bbe8  486efff6             pea.l     -$a(a6)
  00bbec  486effec             pea.l     -$14(a6)
  00bbf0  3f3c0804             move.w    #$804, -(a7)
  00bbf4  a9eb                 _Pack4_FP 
  00bbf6  486a004e             pea.l     $4e(a2)
  00bbfa  486effe2             pea.l     -$1e(a6)
  00bbfe  3f3c200e             move.w    #$200e, -(a7)
  00bc02  a9eb                 _Pack4_FP 
  00bc04  486effec             pea.l     -$14(a6)
  00bc08  486effe2             pea.l     -$1e(a6)
  00bc0c  3f3c0000             move.w    #$0, -(a7)
  00bc10  a9eb                 _Pack4_FP 
  00bc12  486effe2             pea.l     -$1e(a6)
  00bc16  3f3c0016             move.w    #$16, -(a7)
  00bc1a  a9eb                 _Pack4_FP 
  00bc1c  486effe2             pea.l     -$1e(a6)
  00bc20  486effe2             pea.l     -$1e(a6)
  00bc24  3f3c2810             move.w    #$2810, -(a7)
  00bc28  a9eb                 _Pack4_FP 
  00bc2a  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00bc30  600005f2             bra.w     $c224
  00bc34  3d43fff6             move.w    d3, -$a(a6)
  00bc38  486efff6             pea.l     -$a(a6)
  00bc3c  486efff6             pea.l     -$a(a6)
  00bc40  3f3c200e             move.w    #$200e, -(a7)
  00bc44  a9eb                 _Pack4_FP 
  00bc46  486efff6             pea.l     -$a(a6)
  00bc4a  486efff6             pea.l     -$a(a6)
  00bc4e  3f3c0810             move.w    #$810, -(a7)
  00bc52  a9eb                 _Pack4_FP 
  00bc54  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00bc5c  42aefff0             clr.l     -$10(a6)
  00bc60  426efff4             clr.w     -$c(a6)
  00bc64  486efff6             pea.l     -$a(a6)
  00bc68  486effec             pea.l     -$14(a6)
  00bc6c  3f3c0804             move.w    #$804, -(a7)
  00bc70  a9eb                 _Pack4_FP 
  00bc72  486a0050             pea.l     $50(a2)
  00bc76  486effe2             pea.l     -$1e(a6)
  00bc7a  3f3c200e             move.w    #$200e, -(a7)
  00bc7e  a9eb                 _Pack4_FP 
  00bc80  486effec             pea.l     -$14(a6)
  00bc84  486effe2             pea.l     -$1e(a6)
  00bc88  3f3c0000             move.w    #$0, -(a7)
  00bc8c  a9eb                 _Pack4_FP 
  00bc8e  486effe2             pea.l     -$1e(a6)
  00bc92  3f3c0016             move.w    #$16, -(a7)
  00bc96  a9eb                 _Pack4_FP 
  00bc98  486effe2             pea.l     -$1e(a6)
  00bc9c  486effe2             pea.l     -$1e(a6)
  00bca0  3f3c2810             move.w    #$2810, -(a7)
  00bca4  a9eb                 _Pack4_FP 
  00bca6  356effe40050         move.w    -$1c(a6), $50(a2)
  00bcac  3d43fff6             move.w    d3, -$a(a6)
  00bcb0  486efff6             pea.l     -$a(a6)
  00bcb4  486efff6             pea.l     -$a(a6)
  00bcb8  3f3c200e             move.w    #$200e, -(a7)
  00bcbc  a9eb                 _Pack4_FP 
  00bcbe  486efff6             pea.l     -$a(a6)
  00bcc2  486efff6             pea.l     -$a(a6)
  00bcc6  3f3c0810             move.w    #$810, -(a7)
  00bcca  a9eb                 _Pack4_FP 
  00bccc  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00bcd4  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00bcdc  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00bce2  486efff6             pea.l     -$a(a6)
  00bce6  486effec             pea.l     -$14(a6)
  00bcea  3f3c0804             move.w    #$804, -(a7)
  00bcee  a9eb                 _Pack4_FP 
  00bcf0  486a004e             pea.l     $4e(a2)
  00bcf4  486effe2             pea.l     -$1e(a6)
  00bcf8  3f3c200e             move.w    #$200e, -(a7)
  00bcfc  a9eb                 _Pack4_FP 
  00bcfe  486effec             pea.l     -$14(a6)
  00bd02  486effe2             pea.l     -$1e(a6)
  00bd06  3f3c0000             move.w    #$0, -(a7)
  00bd0a  a9eb                 _Pack4_FP 
  00bd0c  486effe2             pea.l     -$1e(a6)
  00bd10  3f3c0016             move.w    #$16, -(a7)
  00bd14  a9eb                 _Pack4_FP 
  00bd16  486effe2             pea.l     -$1e(a6)
  00bd1a  486effe2             pea.l     -$1e(a6)
  00bd1e  3f3c2810             move.w    #$2810, -(a7)
  00bd22  a9eb                 _Pack4_FP 
  00bd24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00bd2a  600004f8             bra.w     $c224
  00bd2e  3d43fff6             move.w    d3, -$a(a6)
  00bd32  486efff6             pea.l     -$a(a6)
  00bd36  486efff6             pea.l     -$a(a6)
  00bd3a  3f3c200e             move.w    #$200e, -(a7)
  00bd3e  a9eb                 _Pack4_FP 
  00bd40  486efff6             pea.l     -$a(a6)
  00bd44  486efff6             pea.l     -$a(a6)
  00bd48  3f3c0810             move.w    #$810, -(a7)
  00bd4c  a9eb                 _Pack4_FP 
  00bd4e  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00bd56  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00bd5e  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00bd64  486efff6             pea.l     -$a(a6)
  00bd68  486effec             pea.l     -$14(a6)
  00bd6c  3f3c0804             move.w    #$804, -(a7)
  00bd70  a9eb                 _Pack4_FP 
  00bd72  486a0050             pea.l     $50(a2)
  00bd76  486effe2             pea.l     -$1e(a6)
  00bd7a  3f3c200e             move.w    #$200e, -(a7)
  00bd7e  a9eb                 _Pack4_FP 
  00bd80  486effec             pea.l     -$14(a6)
  00bd84  486effe2             pea.l     -$1e(a6)
  00bd88  3f3c0000             move.w    #$0, -(a7)
  00bd8c  a9eb                 _Pack4_FP 
  00bd8e  486effe2             pea.l     -$1e(a6)
  00bd92  3f3c0016             move.w    #$16, -(a7)
  00bd96  a9eb                 _Pack4_FP 
  00bd98  486effe2             pea.l     -$1e(a6)
  00bd9c  486effe2             pea.l     -$1e(a6)
  00bda0  3f3c2810             move.w    #$2810, -(a7)
  00bda4  a9eb                 _Pack4_FP 
  00bda6  356effe40050         move.w    -$1c(a6), $50(a2)
  00bdac  3d43fff6             move.w    d3, -$a(a6)
  00bdb0  486efff6             pea.l     -$a(a6)
  00bdb4  486efff6             pea.l     -$a(a6)
  00bdb8  3f3c200e             move.w    #$200e, -(a7)
  00bdbc  a9eb                 _Pack4_FP 
  00bdbe  486efff6             pea.l     -$a(a6)
  00bdc2  486efff6             pea.l     -$a(a6)
  00bdc6  3f3c0810             move.w    #$810, -(a7)
  00bdca  a9eb                 _Pack4_FP 
  00bdcc  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00bdd4  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00bddc  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00bde2  486efff6             pea.l     -$a(a6)
  00bde6  486effec             pea.l     -$14(a6)
  00bdea  3f3c0804             move.w    #$804, -(a7)
  00bdee  a9eb                 _Pack4_FP 
  00bdf0  486a004e             pea.l     $4e(a2)
  00bdf4  486effe2             pea.l     -$1e(a6)
  00bdf8  3f3c200e             move.w    #$200e, -(a7)
  00bdfc  a9eb                 _Pack4_FP 
  00bdfe  486effec             pea.l     -$14(a6)
  00be02  486effe2             pea.l     -$1e(a6)
  00be06  3f3c0000             move.w    #$0, -(a7)
  00be0a  a9eb                 _Pack4_FP 
  00be0c  486effe2             pea.l     -$1e(a6)
  00be10  3f3c0016             move.w    #$16, -(a7)
  00be14  a9eb                 _Pack4_FP 
  00be16  486effe2             pea.l     -$1e(a6)
  00be1a  486effe2             pea.l     -$1e(a6)
  00be1e  3f3c2810             move.w    #$2810, -(a7)
  00be22  a9eb                 _Pack4_FP 
  00be24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00be2a  600003f8             bra.w     $c224
  00be2e  3d43fff6             move.w    d3, -$a(a6)
  00be32  486efff6             pea.l     -$a(a6)
  00be36  486efff6             pea.l     -$a(a6)
  00be3a  3f3c200e             move.w    #$200e, -(a7)
  00be3e  a9eb                 _Pack4_FP 
  00be40  486efff6             pea.l     -$a(a6)
  00be44  486efff6             pea.l     -$a(a6)
  00be48  3f3c0810             move.w    #$810, -(a7)
  00be4c  a9eb                 _Pack4_FP 
  00be4e  2d7c3ffec418ffec     move.l    #$3ffec418, -$14(a6)
  00be56  2d7c9374bc6afff0     move.l    #$9374bc6a, -$10(a6)
  00be5e  3d7c8000fff4         move.w    #$8000, -$c(a6)
  00be64  486efff6             pea.l     -$a(a6)
  00be68  486effec             pea.l     -$14(a6)
  00be6c  3f3c0804             move.w    #$804, -(a7)
  00be70  a9eb                 _Pack4_FP 
  00be72  486a0050             pea.l     $50(a2)
  00be76  486effe2             pea.l     -$1e(a6)
  00be7a  3f3c200e             move.w    #$200e, -(a7)
  00be7e  a9eb                 _Pack4_FP 
  00be80  486effec             pea.l     -$14(a6)
  00be84  486effe2             pea.l     -$1e(a6)
  00be88  3f3c0000             move.w    #$0, -(a7)
  00be8c  a9eb                 _Pack4_FP 
  00be8e  486effe2             pea.l     -$1e(a6)
  00be92  3f3c0016             move.w    #$16, -(a7)
  00be96  a9eb                 _Pack4_FP 
  00be98  486effe2             pea.l     -$1e(a6)
  00be9c  486effe2             pea.l     -$1e(a6)
  00bea0  3f3c2810             move.w    #$2810, -(a7)
  00bea4  a9eb                 _Pack4_FP 
  00bea6  356effe40050         move.w    -$1c(a6), $50(a2)
  00beac  3d43fff6             move.w    d3, -$a(a6)
  00beb0  486efff6             pea.l     -$a(a6)
  00beb4  486efff6             pea.l     -$a(a6)
  00beb8  3f3c200e             move.w    #$200e, -(a7)
  00bebc  a9eb                 _Pack4_FP 
  00bebe  486efff6             pea.l     -$a(a6)
  00bec2  486efff6             pea.l     -$a(a6)
  00bec6  3f3c0810             move.w    #$810, -(a7)
  00beca  a9eb                 _Pack4_FP 
  00becc  2d7c3ffea49bffec     move.l    #$3ffea49b, -$14(a6)
  00bed4  2d7ca5e353f7fff0     move.l    #$a5e353f7, -$10(a6)
  00bedc  3d7cd000fff4         move.w    #$d000, -$c(a6)
  00bee2  486efff6             pea.l     -$a(a6)
  00bee6  486effec             pea.l     -$14(a6)
  00beea  3f3c0804             move.w    #$804, -(a7)
  00beee  a9eb                 _Pack4_FP 
  00bef0  486a004e             pea.l     $4e(a2)
  00bef4  486effe2             pea.l     -$1e(a6)
  00bef8  3f3c200e             move.w    #$200e, -(a7)
  00befc  a9eb                 _Pack4_FP 
  00befe  486effec             pea.l     -$14(a6)
  00bf02  486effe2             pea.l     -$1e(a6)
  00bf06  3f3c0000             move.w    #$0, -(a7)
  00bf0a  a9eb                 _Pack4_FP 
  00bf0c  486effe2             pea.l     -$1e(a6)
  00bf10  3f3c0016             move.w    #$16, -(a7)
  00bf14  a9eb                 _Pack4_FP 
  00bf16  486effe2             pea.l     -$1e(a6)
  00bf1a  486effe2             pea.l     -$1e(a6)
  00bf1e  3f3c2810             move.w    #$2810, -(a7)
  00bf22  a9eb                 _Pack4_FP 
  00bf24  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00bf2a  600002f8             bra.w     $c224
  00bf2e  3d43fff6             move.w    d3, -$a(a6)
  00bf32  486efff6             pea.l     -$a(a6)
  00bf36  486efff6             pea.l     -$a(a6)
  00bf3a  3f3c200e             move.w    #$200e, -(a7)
  00bf3e  a9eb                 _Pack4_FP 
  00bf40  486efff6             pea.l     -$a(a6)
  00bf44  486efff6             pea.l     -$a(a6)
  00bf48  3f3c0810             move.w    #$810, -(a7)
  00bf4c  a9eb                 _Pack4_FP 
  00bf4e  2d7c3ffeddb2ffec     move.l    #$3ffeddb2, -$14(a6)
  00bf56  2d7c2d0e5604fff0     move.l    #$2d0e5604, -$10(a6)
  00bf5e  3d7c1800fff4         move.w    #$1800, -$c(a6)
  00bf64  486efff6             pea.l     -$a(a6)
  00bf68  486effec             pea.l     -$14(a6)
  00bf6c  3f3c0804             move.w    #$804, -(a7)
  00bf70  a9eb                 _Pack4_FP 
  00bf72  486a0050             pea.l     $50(a2)
  00bf76  486effe2             pea.l     -$1e(a6)
  00bf7a  3f3c200e             move.w    #$200e, -(a7)
  00bf7e  a9eb                 _Pack4_FP 
  00bf80  486effec             pea.l     -$14(a6)
  00bf84  486effe2             pea.l     -$1e(a6)
  00bf88  3f3c0000             move.w    #$0, -(a7)
  00bf8c  a9eb                 _Pack4_FP 
  00bf8e  486effe2             pea.l     -$1e(a6)
  00bf92  3f3c0016             move.w    #$16, -(a7)
  00bf96  a9eb                 _Pack4_FP 
  00bf98  486effe2             pea.l     -$1e(a6)
  00bf9c  486effe2             pea.l     -$1e(a6)
  00bfa0  3f3c2810             move.w    #$2810, -(a7)
  00bfa4  a9eb                 _Pack4_FP 
  00bfa6  356effe40050         move.w    -$1c(a6), $50(a2)
  00bfac  3d43fff6             move.w    d3, -$a(a6)
  00bfb0  486efff6             pea.l     -$a(a6)
  00bfb4  486efff6             pea.l     -$a(a6)
  00bfb8  3f3c200e             move.w    #$200e, -(a7)
  00bfbc  a9eb                 _Pack4_FP 
  00bfbe  486efff6             pea.l     -$a(a6)
  00bfc2  486efff6             pea.l     -$a(a6)
  00bfc6  3f3c0810             move.w    #$810, -(a7)
  00bfca  a9eb                 _Pack4_FP 
  00bfcc  2d7c3ffe8000ffec     move.l    #$3ffe8000, -$14(a6)
  00bfd4  42aefff0             clr.l     -$10(a6)
  00bfd8  426efff4             clr.w     -$c(a6)
  00bfdc  486efff6             pea.l     -$a(a6)
  00bfe0  486effec             pea.l     -$14(a6)
  00bfe4  3f3c0804             move.w    #$804, -(a7)
  00bfe8  a9eb                 _Pack4_FP 
  00bfea  486a004e             pea.l     $4e(a2)
  00bfee  486effe2             pea.l     -$1e(a6)
  00bff2  3f3c200e             move.w    #$200e, -(a7)
  00bff6  a9eb                 _Pack4_FP 
  00bff8  486effec             pea.l     -$14(a6)
  00bffc  486effe2             pea.l     -$1e(a6)
  00c000  3f3c0000             move.w    #$0, -(a7)
  00c004  a9eb                 _Pack4_FP 
  00c006  486effe2             pea.l     -$1e(a6)
  00c00a  3f3c0016             move.w    #$16, -(a7)
  00c00e  a9eb                 _Pack4_FP 
  00c010  486effe2             pea.l     -$1e(a6)
  00c014  486effe2             pea.l     -$1e(a6)
  00c018  3f3c2810             move.w    #$2810, -(a7)
  00c01c  a9eb                 _Pack4_FP 
  00c01e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00c024  600001fe             bra.w     $c224
  00c028  3d43fff6             move.w    d3, -$a(a6)
  00c02c  486efff6             pea.l     -$a(a6)
  00c030  486efff6             pea.l     -$a(a6)
  00c034  3f3c200e             move.w    #$200e, -(a7)
  00c038  a9eb                 _Pack4_FP 
  00c03a  486efff6             pea.l     -$a(a6)
  00c03e  486efff6             pea.l     -$a(a6)
  00c042  3f3c0810             move.w    #$810, -(a7)
  00c046  a9eb                 _Pack4_FP 
  00c048  2d7c3ffef0a3ffec     move.l    #$3ffef0a3, -$14(a6)
  00c050  2d7cd70a3d70fff0     move.l    #$d70a3d70, -$10(a6)
  00c058  3d7ca000fff4         move.w    #$a000, -$c(a6)
  00c05e  486efff6             pea.l     -$a(a6)
  00c062  486effec             pea.l     -$14(a6)
  00c066  3f3c0804             move.w    #$804, -(a7)
  00c06a  a9eb                 _Pack4_FP 
  00c06c  486a0050             pea.l     $50(a2)
  00c070  486effe2             pea.l     -$1e(a6)
  00c074  3f3c200e             move.w    #$200e, -(a7)
  00c078  a9eb                 _Pack4_FP 
  00c07a  486effec             pea.l     -$14(a6)
  00c07e  486effe2             pea.l     -$1e(a6)
  00c082  3f3c0000             move.w    #$0, -(a7)
  00c086  a9eb                 _Pack4_FP 
  00c088  486effe2             pea.l     -$1e(a6)
  00c08c  3f3c0016             move.w    #$16, -(a7)
  00c090  a9eb                 _Pack4_FP 
  00c092  486effe2             pea.l     -$1e(a6)
  00c096  486effe2             pea.l     -$1e(a6)
  00c09a  3f3c2810             move.w    #$2810, -(a7)
  00c09e  a9eb                 _Pack4_FP 
  00c0a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00c0a6  3d43fff6             move.w    d3, -$a(a6)
  00c0aa  486efff6             pea.l     -$a(a6)
  00c0ae  486efff6             pea.l     -$a(a6)
  00c0b2  3f3c200e             move.w    #$200e, -(a7)
  00c0b6  a9eb                 _Pack4_FP 
  00c0b8  486efff6             pea.l     -$a(a6)
  00c0bc  486efff6             pea.l     -$a(a6)
  00c0c0  3f3c0810             move.w    #$810, -(a7)
  00c0c4  a9eb                 _Pack4_FP 
  00c0c6  2d7c3ffdaf1affec     move.l    #$3ffdaf1a, -$14(a6)
  00c0ce  2d7c9fbe76c8fff0     move.l    #$9fbe76c8, -$10(a6)
  00c0d6  3d7cb800fff4         move.w    #$b800, -$c(a6)
  00c0dc  486efff6             pea.l     -$a(a6)
  00c0e0  486effec             pea.l     -$14(a6)
  00c0e4  3f3c0804             move.w    #$804, -(a7)
  00c0e8  a9eb                 _Pack4_FP 
  00c0ea  486a004e             pea.l     $4e(a2)
  00c0ee  486effe2             pea.l     -$1e(a6)
  00c0f2  3f3c200e             move.w    #$200e, -(a7)
  00c0f6  a9eb                 _Pack4_FP 
  00c0f8  486effec             pea.l     -$14(a6)
  00c0fc  486effe2             pea.l     -$1e(a6)
  00c100  3f3c0000             move.w    #$0, -(a7)
  00c104  a9eb                 _Pack4_FP 
  00c106  486effe2             pea.l     -$1e(a6)
  00c10a  3f3c0016             move.w    #$16, -(a7)
  00c10e  a9eb                 _Pack4_FP 
  00c110  486effe2             pea.l     -$1e(a6)
  00c114  486effe2             pea.l     -$1e(a6)
  00c118  3f3c2810             move.w    #$2810, -(a7)
  00c11c  a9eb                 _Pack4_FP 
  00c11e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00c124  600000fe             bra.w     $c224
  00c128  3d43fff6             move.w    d3, -$a(a6)
  00c12c  486efff6             pea.l     -$a(a6)
  00c130  486efff6             pea.l     -$a(a6)
  00c134  3f3c200e             move.w    #$200e, -(a7)
  00c138  a9eb                 _Pack4_FP 
  00c13a  486efff6             pea.l     -$a(a6)
  00c13e  486efff6             pea.l     -$a(a6)
  00c142  3f3c0810             move.w    #$810, -(a7)
  00c146  a9eb                 _Pack4_FP 
  00c148  2d7c3ffefc28ffec     move.l    #$3ffefc28, -$14(a6)
  00c150  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00c158  3d7c2800fff4         move.w    #$2800, -$c(a6)
  00c15e  486efff6             pea.l     -$a(a6)
  00c162  486effec             pea.l     -$14(a6)
  00c166  3f3c0804             move.w    #$804, -(a7)
  00c16a  a9eb                 _Pack4_FP 
  00c16c  486a0050             pea.l     $50(a2)
  00c170  486effe2             pea.l     -$1e(a6)
  00c174  3f3c200e             move.w    #$200e, -(a7)
  00c178  a9eb                 _Pack4_FP 
  00c17a  486effec             pea.l     -$14(a6)
  00c17e  486effe2             pea.l     -$1e(a6)
  00c182  3f3c0000             move.w    #$0, -(a7)
  00c186  a9eb                 _Pack4_FP 
  00c188  486effe2             pea.l     -$1e(a6)
  00c18c  3f3c0016             move.w    #$16, -(a7)
  00c190  a9eb                 _Pack4_FP 
  00c192  486effe2             pea.l     -$1e(a6)
  00c196  486effe2             pea.l     -$1e(a6)
  00c19a  3f3c2810             move.w    #$2810, -(a7)
  00c19e  a9eb                 _Pack4_FP 
  00c1a0  356effe40050         move.w    -$1c(a6), $50(a2)
  00c1a6  3d43fff6             move.w    d3, -$a(a6)
  00c1aa  486efff6             pea.l     -$a(a6)
  00c1ae  486efff6             pea.l     -$a(a6)
  00c1b2  3f3c200e             move.w    #$200e, -(a7)
  00c1b6  a9eb                 _Pack4_FP 
  00c1b8  486efff6             pea.l     -$a(a6)
  00c1bc  486efff6             pea.l     -$a(a6)
  00c1c0  3f3c0810             move.w    #$810, -(a7)
  00c1c4  a9eb                 _Pack4_FP 
  00c1c6  2d7c3ffcb22dffec     move.l    #$3ffcb22d, -$14(a6)
  00c1ce  2d7c0e560418fff0     move.l    #$e560418, -$10(a6)
  00c1d6  3d7c9000fff4         move.w    #$9000, -$c(a6)
  00c1dc  486efff6             pea.l     -$a(a6)
  00c1e0  486effec             pea.l     -$14(a6)
  00c1e4  3f3c0804             move.w    #$804, -(a7)
  00c1e8  a9eb                 _Pack4_FP 
  00c1ea  486a004e             pea.l     $4e(a2)
  00c1ee  486effe2             pea.l     -$1e(a6)
  00c1f2  3f3c200e             move.w    #$200e, -(a7)
  00c1f6  a9eb                 _Pack4_FP 
  00c1f8  486effec             pea.l     -$14(a6)
  00c1fc  486effe2             pea.l     -$1e(a6)
  00c200  3f3c0000             move.w    #$0, -(a7)
  00c204  a9eb                 _Pack4_FP 
  00c206  486effe2             pea.l     -$1e(a6)
  00c20a  3f3c0016             move.w    #$16, -(a7)
  00c20e  a9eb                 _Pack4_FP 
  00c210  486effe2             pea.l     -$1e(a6)
  00c214  486effe2             pea.l     -$1e(a6)
  00c218  3f3c2810             move.w    #$2810, -(a7)
  00c21c  a9eb                 _Pack4_FP 
  00c21e  356effe4004e         move.w    -$1c(a6), $4e(a2)
  00c224  4cdf0408             movem.l   (a7)+, d3/a2
  00c228  4e5e                 unlk      a6
  00c22a  4e75                 rts       

;-------------------------------------------------------------
; InverseMode   (seg 2 +00c240, 36 bytes)
  00c240  4e560000             link.w    a6, #$0
  00c244  342e0008             move.w    $8(a6), d2
  00c248  0c420012             cmpi.w    #$12, d2
  00c24c  6d0a                 blt.b     $c258
  00c24e  3002                 move.w    d2, d0
  00c250  48c0                 ext.l     d0
  00c252  72ee                 moveq     #$ee, d1
  00c254  d081                 add.l     d1, d0
  00c256  6008                 bra.b     $c260
  00c258  3002                 move.w    d2, d0
  00c25a  48c0                 ext.l     d0
  00c25c  7212                 moveq     #$12, d1
  00c25e  d081                 add.l     d1, d0
  00c260  4e5e                 unlk      a6
  00c262  4e75                 rts       

;-------------------------------------------------------------
; Unstuff16BitInto4Bits   (seg 2 +00c272, 90 bytes)
  00c272  4e560000             link.w    a6, #$0
  00c276  48e70018             movem.l   a3-a4, -(a7)
  00c27a  286e000a             movea.l   $a(a6), a4
  00c27e  266e000e             movea.l   $e(a6), a3
  00c282  226e0012             movea.l   $12(a6), a1
  00c286  342e0008             move.w    $8(a6), d2
  00c28a  7000                 moveq     #$0, d0
  00c28c  3002                 move.w    d2, d0
  00c28e  720c                 moveq     #$c, d1
  00c290  e2a0                 asr.l     d1, d0
  00c292  3880                 move.w    d0, (a4)
  00c294  3014                 move.w    (a4), d0
  00c296  48c0                 ext.l     d0
  00c298  720c                 moveq     #$c, d1
  00c29a  e3a8                 lsl.l     d1, d0
  00c29c  9440                 sub.w     d0, d2
  00c29e  7000                 moveq     #$0, d0
  00c2a0  3002                 move.w    d2, d0
  00c2a2  e080                 asr.l     #$8, d0
  00c2a4  3680                 move.w    d0, (a3)
  00c2a6  3013                 move.w    (a3), d0
  00c2a8  48c0                 ext.l     d0
  00c2aa  e188                 lsl.l     #$8, d0
  00c2ac  9440                 sub.w     d0, d2
  00c2ae  7000                 moveq     #$0, d0
  00c2b0  3002                 move.w    d2, d0
  00c2b2  e880                 asr.l     #$4, d0
  00c2b4  3280                 move.w    d0, (a1)
  00c2b6  3011                 move.w    (a1), d0
  00c2b8  48c0                 ext.l     d0
  00c2ba  e988                 lsl.l     #$4, d0
  00c2bc  9440                 sub.w     d0, d2
  00c2be  206e0016             movea.l   $16(a6), a0
  00c2c2  3082                 move.w    d2, (a0)
  00c2c4  4cdf1800             movem.l   (a7)+, a3-a4
  00c2c8  4e5e                 unlk      a6
  00c2ca  4e75                 rts       

;-------------------------------------------------------------
; Unstuff16BitInto8Bits   (seg 2 +00c2e4, 42 bytes)
  00c2e4  4e560000             link.w    a6, #$0
  00c2e8  206e000a             movea.l   $a(a6), a0
  00c2ec  226e000e             movea.l   $e(a6), a1
  00c2f0  322e0008             move.w    $8(a6), d1
  00c2f4  7000                 moveq     #$0, d0
  00c2f6  3001                 move.w    d1, d0
  00c2f8  e080                 asr.l     #$8, d0
  00c2fa  3080                 move.w    d0, (a0)
  00c2fc  3010                 move.w    (a0), d0
  00c2fe  48c0                 ext.l     d0
  00c300  e188                 lsl.l     #$8, d0
  00c302  9240                 sub.w     d0, d1
  00c304  3281                 move.w    d1, (a1)
  00c306  5350                 subq.w    #$1, (a0)
  00c308  5351                 subq.w    #$1, (a1)
  00c30a  4e5e                 unlk      a6
  00c30c  4e75                 rts       

;-------------------------------------------------------------
; LoadTileDefinitions   (seg 2 +00c326, 252 bytes)
  00c326  4e56fff4             link.w    a6, #$fff4
  00c32a  2f03                 move.l    d3, -(a7)
  00c32c  7600                 moveq     #$0, d3
  00c32e  60000084             bra.w     $c3b4
  00c332  486efff8             pea.l     -$8(a6)
  00c336  486efffa             pea.l     -$6(a6)
  00c33a  486efffc             pea.l     -$4(a6)
  00c33e  486efffe             pea.l     -$2(a6)
  00c342  3003                 move.w    d3, d0
  00c344  48c0                 ext.l     d0
  00c346  e480                 asr.l     #$2, d0
  00c348  7210                 moveq     #$10, d1
  00c34a  d081                 add.l     d1, d0
  00c34c  d080                 add.l     d0, d0
  00c34e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00c354  2050                 movea.l   (a0), a0
  00c356  d1c0                 adda.l    d0, a0
  00c358  203c00012074         move.l    #$12074, d0
  00c35e  3f300800             move.w    (a0, d0.l), -(a7)
  00c362  61ffffffff0e         bsr.l     $c272   ; Unstuff16BitInto4Bits
  00c368  3003                 move.w    d3, d0
  00c36a  48c0                 ext.l     d0
  00c36c  41f900007e2a         lea.l     $7e2a.l, a0   ; bgTileKinds
  00c372  31aefffe0a00         move.w    -$2(a6), (a0, d0.l * 2)
  00c378  3003                 move.w    d3, d0
  00c37a  48c0                 ext.l     d0
  00c37c  5280                 addq.l    #$1, d0
  00c37e  41f900007e2a         lea.l     $7e2a.l, a0   ; bgTileKinds
  00c384  31aefffc0a00         move.w    -$4(a6), (a0, d0.l * 2)
  00c38a  3003                 move.w    d3, d0
  00c38c  48c0                 ext.l     d0
  00c38e  5480                 addq.l    #$2, d0
  00c390  41f900007e2a         lea.l     $7e2a.l, a0   ; bgTileKinds
  00c396  31aefffa0a00         move.w    -$6(a6), (a0, d0.l * 2)
  00c39c  3003                 move.w    d3, d0
  00c39e  48c0                 ext.l     d0
  00c3a0  5680                 addq.l    #$3, d0
  00c3a2  41f900007e2a         lea.l     $7e2a.l, a0   ; bgTileKinds
  00c3a8  31aefff80a00         move.w    -$8(a6), (a0, d0.l * 2)
  00c3ae  5843                 addq.w    #$4, d3
  00c3b0  4fef0012             lea.l     $12(a7), a7
  00c3b4  0c430060             cmpi.w    #$60, d3
  00c3b8  6d00ff78             blt.w     $c332
  00c3bc  7600                 moveq     #$0, d3
  00c3be  6056                 bra.b     $c416
  00c3c0  486efff4             pea.l     -$c(a6)
  00c3c4  486efff6             pea.l     -$a(a6)
  00c3c8  3003                 move.w    d3, d0
  00c3ca  48c0                 ext.l     d0
  00c3cc  e280                 asr.l     #$1, d0
  00c3ce  7228                 moveq     #$28, d1
  00c3d0  d081                 add.l     d1, d0
  00c3d2  d080                 add.l     d0, d0
  00c3d4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00c3da  2050                 movea.l   (a0), a0
  00c3dc  d1c0                 adda.l    d0, a0
  00c3de  203c00012074         move.l    #$12074, d0
  00c3e4  3f300800             move.w    (a0, d0.l), -(a7)
  00c3e8  61fffffffefa         bsr.l     $c2e4   ; Unstuff16BitInto8Bits
  00c3ee  3003                 move.w    d3, d0
  00c3f0  48c0                 ext.l     d0
  00c3f2  41f900007eea         lea.l     $7eea.l, a0   ; fgTileKinds
  00c3f8  31aefff60a00         move.w    -$a(a6), (a0, d0.l * 2)
  00c3fe  3003                 move.w    d3, d0
  00c400  48c0                 ext.l     d0
  00c402  5280                 addq.l    #$1, d0
  00c404  41f900007eea         lea.l     $7eea.l, a0   ; fgTileKinds
  00c40a  31aefff40a00         move.w    -$c(a6), (a0, d0.l * 2)
  00c410  5443                 addq.w    #$2, d3
  00c412  4fef000a             lea.l     $a(a7), a7
  00c416  0c430018             cmpi.w    #$18, d3
  00c41a  6da4                 blt.b     $c3c0
  00c41c  261f                 move.l    (a7)+, d3
  00c41e  4e5e                 unlk      a6
  00c420  4e75                 rts       

;-------------------------------------------------------------
; LookupBGTileKind   (seg 2 +00c438, 32 bytes)
  00c438  4e560000             link.w    a6, #$0
  00c43c  302e0008             move.w    $8(a6), d0
  00c440  4a40                 tst.w     d0
  00c442  6d10                 blt.b     $c454
  00c444  0c400060             cmpi.w    #$60, d0
  00c448  6c0a                 bge.b     $c454
  00c44a  41f900007e2a         lea.l     $7e2a.l, a0   ; bgTileKinds
  00c450  30300200             move.w    (a0, d0.w * 2), d0
  00c454  4e5e                 unlk      a6
  00c456  4e75                 rts       

;-------------------------------------------------------------
; LookupFGTileKind   (seg 2 +00c46c, 46 bytes)
  00c46c  4e560000             link.w    a6, #$0
  00c470  342e0008             move.w    $8(a6), d2
  00c474  0c420020             cmpi.w    #$20, d2
  00c478  6d1a                 blt.b     $c494
  00c47a  0c420038             cmpi.w    #$38, d2
  00c47e  6c14                 bge.b     $c494
  00c480  3002                 move.w    d2, d0
  00c482  48c0                 ext.l     d0
  00c484  72e0                 moveq     #$e0, d1
  00c486  d081                 add.l     d1, d0
  00c488  41f900007eea         lea.l     $7eea.l, a0   ; fgTileKinds
  00c48e  30300a00             move.w    (a0, d0.l * 2), d0
  00c492  6002                 bra.b     $c496
  00c494  3002                 move.w    d2, d0
  00c496  4e5e                 unlk      a6
  00c498  4e75                 rts       

;-------------------------------------------------------------
; HandleRampCollision   (seg 2 +00c4ae, 2660 bytes)
  00c4ae  4e56ffec             link.w    a6, #$ffec
  00c4b2  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  00c4b6  246e0008             movea.l   $8(a6), a2
  00c4ba  3c2e000c             move.w    $c(a6), d6
  00c4be  2a2e000e             move.l    $e(a6), d5
  00c4c2  266e0012             movea.l   $12(a6), a3
  00c4c6  286e0016             movea.l   $16(a6), a4
  00c4ca  7801                 moveq     #$1, d4
  00c4cc  7600                 moveq     #$0, d3
  00c4ce  4a6a0094             tst.w     $94(a2)
  00c4d2  6e000a36             bgt.w     $cf0a
  00c4d6  3006                 move.w    d6, d0
  00c4d8  48c0                 ext.l     d0
  00c4da  222a005e             move.l    $5e(a2), d1
  00c4de  e081                 asr.l     #$8, d1
  00c4e0  d280                 add.l     d0, d1
  00c4e2  3d41ffee             move.w    d1, -$12(a6)
  00c4e6  3006                 move.w    d6, d0
  00c4e8  48c0                 ext.l     d0
  00c4ea  222a0062             move.l    $62(a2), d1
  00c4ee  e081                 asr.l     #$8, d1
  00c4f0  d280                 add.l     d0, d1
  00c4f2  3d41ffec             move.w    d1, -$14(a6)
  00c4f6  202a005e             move.l    $5e(a2), d0
  00c4fa  e080                 asr.l     #$8, d0
  00c4fc  35400004             move.w    d0, $4(a2)
  00c500  202a0062             move.l    $62(a2), d0
  00c504  e080                 asr.l     #$8, d0
  00c506  35400002             move.w    d0, $2(a2)
  00c50a  202b005e             move.l    $5e(a3), d0
  00c50e  e080                 asr.l     #$8, d0
  00c510  37400004             move.w    d0, $4(a3)
  00c514  202b0062             move.l    $62(a3), d0
  00c518  e080                 asr.l     #$8, d0
  00c51a  37400002             move.w    d0, $2(a3)
  00c51e  302b0004             move.w    $4(a3), d0
  00c522  48c0                 ext.l     d0
  00c524  322b0008             move.w    $8(a3), d1
  00c528  48c1                 ext.l     d1
  00c52a  d280                 add.l     d0, d1
  00c52c  3d41fffa             move.w    d1, -$6(a6)
  00c530  302b0004             move.w    $4(a3), d0
  00c534  48c0                 ext.l     d0
  00c536  322b000c             move.w    $c(a3), d1
  00c53a  48c1                 ext.l     d1
  00c53c  d280                 add.l     d0, d1
  00c53e  3d41fffe             move.w    d1, -$2(a6)
  00c542  302b0002             move.w    $2(a3), d0
  00c546  48c0                 ext.l     d0
  00c548  322b0006             move.w    $6(a3), d1
  00c54c  48c1                 ext.l     d1
  00c54e  d280                 add.l     d0, d1
  00c550  3d41fff8             move.w    d1, -$8(a6)
  00c554  302b0002             move.w    $2(a3), d0
  00c558  48c0                 ext.l     d0
  00c55a  322b000a             move.w    $a(a3), d1
  00c55e  48c1                 ext.l     d1
  00c560  d280                 add.l     d0, d1
  00c562  3d41fffc             move.w    d1, -$4(a6)
  00c566  2045                 movea.l   d5, a0
  00c568  30280002             move.w    $2(a0), d0
  00c56c  48c0                 ext.l     d0
  00c56e  322a0004             move.w    $4(a2), d1
  00c572  48c1                 ext.l     d1
  00c574  d280                 add.l     d0, d1
  00c576  3d41fff2             move.w    d1, -$e(a6)
  00c57a  2045                 movea.l   d5, a0
  00c57c  30280006             move.w    $6(a0), d0
  00c580  48c0                 ext.l     d0
  00c582  322a0004             move.w    $4(a2), d1
  00c586  48c1                 ext.l     d1
  00c588  d280                 add.l     d0, d1
  00c58a  3d41fff6             move.w    d1, -$a(a6)
  00c58e  2045                 movea.l   d5, a0
  00c590  3010                 move.w    (a0), d0
  00c592  48c0                 ext.l     d0
  00c594  322a0002             move.w    $2(a2), d1
  00c598  48c1                 ext.l     d1
  00c59a  d280                 add.l     d0, d1
  00c59c  3d41fff0             move.w    d1, -$10(a6)
  00c5a0  2045                 movea.l   d5, a0
  00c5a2  30280004             move.w    $4(a0), d0
  00c5a6  48c0                 ext.l     d0
  00c5a8  322a0002             move.w    $2(a2), d1
  00c5ac  48c1                 ext.l     d1
  00c5ae  d280                 add.l     d0, d1
  00c5b0  3d41fff4             move.w    d1, -$c(a6)
  00c5b4  3013                 move.w    (a3), d0
  00c5b6  48c0                 ext.l     d0
  00c5b8  0480000025e5         subi.l    #$25e5, d0
  00c5be  6716                 beq.b     $c5d6
  00c5c0  5380                 subq.l    #$1, d0
  00c5c2  67000266             beq.w     $c82a
  00c5c6  5380                 subq.l    #$1, d0
  00c5c8  670004b4             beq.w     $ca7e
  00c5cc  5380                 subq.l    #$1, d0
  00c5ce  670006f8             beq.w     $ccc8
  00c5d2  60000936             bra.w     $cf0a
  00c5d6  302efffe             move.w    -$2(a6), d0
  00c5da  48c0                 ext.l     d0
  00c5dc  322efffa             move.w    -$6(a6), d1
  00c5e0  48c1                 ext.l     d1
  00c5e2  d280                 add.l     d0, d1
  00c5e4  e281                 asr.l     #$1, d1
  00c5e6  302effee             move.w    -$12(a6), d0
  00c5ea  48c0                 ext.l     d0
  00c5ec  b081                 cmp.l     d1, d0
  00c5ee  6c24                 bge.b     $c614
  00c5f0  4a6a0050             tst.w     $50(a2)
  00c5f4  6f1e                 ble.b     $c614
  00c5f6  302efffe             move.w    -$2(a6), d0
  00c5fa  48c0                 ext.l     d0
  00c5fc  322efffa             move.w    -$6(a6), d1
  00c600  48c1                 ext.l     d1
  00c602  d280                 add.l     d0, d1
  00c604  e281                 asr.l     #$1, d1
  00c606  5181                 subq.l    #$8, d1
  00c608  302effee             move.w    -$12(a6), d0
  00c60c  48c0                 ext.l     d0
  00c60e  b081                 cmp.l     d1, d0
  00c610  6c02                 bge.b     $c614
  00c612  7601                 moveq     #$1, d3
  00c614  302efffe             move.w    -$2(a6), d0
  00c618  48c0                 ext.l     d0
  00c61a  322efffa             move.w    -$6(a6), d1
  00c61e  48c1                 ext.l     d1
  00c620  d280                 add.l     d0, d1
  00c622  e281                 asr.l     #$1, d1
  00c624  302effee             move.w    -$12(a6), d0
  00c628  48c0                 ext.l     d0
  00c62a  b081                 cmp.l     d1, d0
  00c62c  6d24                 blt.b     $c652
  00c62e  4a6a0050             tst.w     $50(a2)
  00c632  6c1e                 bge.b     $c652
  00c634  302efffe             move.w    -$2(a6), d0
  00c638  48c0                 ext.l     d0
  00c63a  322efffa             move.w    -$6(a6), d1
  00c63e  48c1                 ext.l     d1
  00c640  d280                 add.l     d0, d1
  00c642  e281                 asr.l     #$1, d1
  00c644  5081                 addq.l    #$8, d1
  00c646  302effee             move.w    -$12(a6), d0
  00c64a  48c0                 ext.l     d0
  00c64c  b081                 cmp.l     d1, d0
  00c64e  6d02                 blt.b     $c652
  00c650  7601                 moveq     #$1, d3
  00c652  0c030001             cmpi.b    #$1, d3
  00c656  6616                 bne.b     $c66e
  00c658  302efffc             move.w    -$4(a6), d0
  00c65c  48c0                 ext.l     d0
  00c65e  72f3                 moveq     #$f3, d1
  00c660  d081                 add.l     d1, d0
  00c662  322efff0             move.w    -$10(a6), d1
  00c666  48c1                 ext.l     d1
  00c668  b280                 cmp.l     d0, d1
  00c66a  6f02                 ble.b     $c66e
  00c66c  7600                 moveq     #$0, d3
  00c66e  4a04                 tst.b     d4
  00c670  67000146             beq.w     $c7b8
  00c674  4a03                 tst.b     d3
  00c676  66000140             bne.w     $c7b8
  00c67a  302efff8             move.w    -$8(a6), d0
  00c67e  48c0                 ext.l     d0
  00c680  720f                 moveq     #$f, d1
  00c682  d081                 add.l     d1, d0
  00c684  322efff4             move.w    -$c(a6), d1
  00c688  48c1                 ext.l     d1
  00c68a  b280                 cmp.l     d0, d1
  00c68c  6e0000a6             bgt.w     $c734
  00c690  4a6a004e             tst.w     $4e(a2)
  00c694  6c4c                 bge.b     $c6e2
  00c696  0c6afe3e004e         cmpi.w    #$fe3e, $4e(a2)
  00c69c  6c1a                 bge.b     $c6b8
  00c69e  2f3c00640100         move.l    #$640100, -(a7)
  00c6a4  2f0c                 move.l    a4, -(a7)
  00c6a6  61ffffffc3c2         bsr.l     $8a6a   ; STPlayRegSound
  00c6ac  357c0001008e         move.w    #$1, $8e(a2)
  00c6b2  504f                 addq.w    #$8, a7
  00c6b4  60000102             bra.w     $c7b8
  00c6b8  426a004e             clr.w     $4e(a2)
  00c6bc  302efff4             move.w    -$c(a6), d0
  00c6c0  48c0                 ext.l     d0
  00c6c2  322efff8             move.w    -$8(a6), d1
  00c6c6  48c1                 ext.l     d1
  00c6c8  7410                 moveq     #$10, d2
  00c6ca  d282                 add.l     d2, d1
  00c6cc  9280                 sub.l     d0, d1
  00c6ce  d36a0002             add.w     d1, $2(a2)
  00c6d2  302a0002             move.w    $2(a2), d0
  00c6d6  48c0                 ext.l     d0
  00c6d8  e188                 lsl.l     #$8, d0
  00c6da  25400062             move.l    d0, $62(a2)
  00c6de  600000d8             bra.w     $c7b8
  00c6e2  302efff8             move.w    -$8(a6), d0
  00c6e6  48c0                 ext.l     d0
  00c6e8  5c80                 addq.l    #$6, d0
  00c6ea  322efff4             move.w    -$c(a6), d1
  00c6ee  48c1                 ext.l     d1
  00c6f0  b280                 cmp.l     d0, d1
  00c6f2  6e0000c4             bgt.w     $c7b8
  00c6f6  302efff4             move.w    -$c(a6), d0
  00c6fa  48c0                 ext.l     d0
  00c6fc  322efff8             move.w    -$8(a6), d1
  00c700  48c1                 ext.l     d1
  00c702  9280                 sub.l     d0, d1
  00c704  5281                 addq.l    #$1, d1
  00c706  936a0002             sub.w     d1, $2(a2)
  00c70a  302a0002             move.w    $2(a2), d0
  00c70e  48c0                 ext.l     d0
  00c710  e188                 lsl.l     #$8, d0
  00c712  25400062             move.l    d0, $62(a2)
  00c716  302a004e             move.w    $4e(a2), d0
  00c71a  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00c720  7209                 moveq     #$9, d1
  00c722  e2a0                 asr.l     d1, d0
  00c724  4480                 neg.l     d0
  00c726  3540004e             move.w    d0, $4e(a2)
  00c72a  357c00030094         move.w    #$3, $94(a2)
  00c730  60000086             bra.w     $c7b8
  00c734  302efffe             move.w    -$2(a6), d0
  00c738  48c0                 ext.l     d0
  00c73a  322efffa             move.w    -$6(a6), d1
  00c73e  48c1                 ext.l     d1
  00c740  d280                 add.l     d0, d1
  00c742  e281                 asr.l     #$1, d1
  00c744  302effee             move.w    -$12(a6), d0
  00c748  48c0                 ext.l     d0
  00c74a  b081                 cmp.l     d1, d0
  00c74c  6c20                 bge.b     $c76e
  00c74e  526a0004             addq.w    #$1, $4(a2)
  00c752  302a0004             move.w    $4(a2), d0
  00c756  48c0                 ext.l     d0
  00c758  e188                 lsl.l     #$8, d0
  00c75a  2540005e             move.l    d0, $5e(a2)
  00c75e  302a0050             move.w    $50(a2), d0
  00c762  48c0                 ext.l     d0
  00c764  81fc0002             divs.w    #$2, d0
  00c768  35400050             move.w    d0, $50(a2)
  00c76c  6038                 bra.b     $c7a6
  00c76e  302efffe             move.w    -$2(a6), d0
  00c772  48c0                 ext.l     d0
  00c774  322efffa             move.w    -$6(a6), d1
  00c778  48c1                 ext.l     d1
  00c77a  d280                 add.l     d0, d1
  00c77c  e281                 asr.l     #$1, d1
  00c77e  302effee             move.w    -$12(a6), d0
  00c782  48c0                 ext.l     d0
  00c784  b081                 cmp.l     d1, d0
  00c786  6f1e                 ble.b     $c7a6
  00c788  536a0004             subq.w    #$1, $4(a2)
  00c78c  302a0004             move.w    $4(a2), d0
  00c790  48c0                 ext.l     d0
  00c792  e188                 lsl.l     #$8, d0
  00c794  2540005e             move.l    d0, $5e(a2)
  00c798  302a0050             move.w    $50(a2), d0
  00c79c  48c0                 ext.l     d0
  00c79e  81fc0002             divs.w    #$2, d0
  00c7a2  35400050             move.w    d0, $50(a2)
  00c7a6  0c520045             cmpi.w    #$45, (a2)
  00c7aa  56c0                 sne.b     d0
  00c7ac  4400                 neg.b     d0
  00c7ae  49c0                 extb.l    d0
  00c7b0  721e                 moveq     #$1e, d1
  00c7b2  e0a1                 asr.l     d0, d1
  00c7b4  d36a004e             add.w     d1, $4e(a2)
  00c7b8  4a03                 tst.b     d3
  00c7ba  6700074e             beq.w     $cf0a
  00c7be  4a6a0050             tst.w     $50(a2)
  00c7c2  6f16                 ble.b     $c7da
  00c7c4  302efffa             move.w    -$6(a6), d0
  00c7c8  48c0                 ext.l     d0
  00c7ca  322efff6             move.w    -$a(a6), d1
  00c7ce  48c1                 ext.l     d1
  00c7d0  9280                 sub.l     d0, d1
  00c7d2  5281                 addq.l    #$1, d1
  00c7d4  936a0004             sub.w     d1, $4(a2)
  00c7d8  601a                 bra.b     $c7f4
  00c7da  4a6a0050             tst.w     $50(a2)
  00c7de  6c14                 bge.b     $c7f4
  00c7e0  302efff2             move.w    -$e(a6), d0
  00c7e4  48c0                 ext.l     d0
  00c7e6  322efffe             move.w    -$2(a6), d1
  00c7ea  48c1                 ext.l     d1
  00c7ec  9280                 sub.l     d0, d1
  00c7ee  5281                 addq.l    #$1, d1
  00c7f0  d36a0004             add.w     d1, $4(a2)
  00c7f4  302a0004             move.w    $4(a2), d0
  00c7f8  48c0                 ext.l     d0
  00c7fa  e188                 lsl.l     #$8, d0
  00c7fc  2540005e             move.l    d0, $5e(a2)
  00c800  302a0050             move.w    $50(a2), d0
  00c804  48c0                 ext.l     d0
  00c806  e280                 asr.l     #$1, d0
  00c808  d16b0050             add.w     d0, $50(a3)
  00c80c  302a0050             move.w    $50(a2), d0
  00c810  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00c816  7209                 moveq     #$9, d1
  00c818  e2a0                 asr.l     d1, d0
  00c81a  4480                 neg.l     d0
  00c81c  35400050             move.w    d0, $50(a2)
  00c820  357c00030094         move.w    #$3, $94(a2)
  00c826  600006e2             bra.w     $cf0a
  00c82a  302efffe             move.w    -$2(a6), d0
  00c82e  48c0                 ext.l     d0
  00c830  322efffa             move.w    -$6(a6), d1
  00c834  48c1                 ext.l     d1
  00c836  d280                 add.l     d0, d1
  00c838  e281                 asr.l     #$1, d1
  00c83a  302effee             move.w    -$12(a6), d0
  00c83e  48c0                 ext.l     d0
  00c840  b081                 cmp.l     d1, d0
  00c842  6c24                 bge.b     $c868
  00c844  4a6a0050             tst.w     $50(a2)
  00c848  6f1e                 ble.b     $c868
  00c84a  302efffe             move.w    -$2(a6), d0
  00c84e  48c0                 ext.l     d0
  00c850  322efffa             move.w    -$6(a6), d1
  00c854  48c1                 ext.l     d1
  00c856  d280                 add.l     d0, d1
  00c858  e281                 asr.l     #$1, d1
  00c85a  5181                 subq.l    #$8, d1
  00c85c  302effee             move.w    -$12(a6), d0
  00c860  48c0                 ext.l     d0
  00c862  b081                 cmp.l     d1, d0
  00c864  6c02                 bge.b     $c868
  00c866  7601                 moveq     #$1, d3
  00c868  302efffe             move.w    -$2(a6), d0
  00c86c  48c0                 ext.l     d0
  00c86e  322efffa             move.w    -$6(a6), d1
  00c872  48c1                 ext.l     d1
  00c874  d280                 add.l     d0, d1
  00c876  e281                 asr.l     #$1, d1
  00c878  302effee             move.w    -$12(a6), d0
  00c87c  48c0                 ext.l     d0
  00c87e  b081                 cmp.l     d1, d0
  00c880  6d24                 blt.b     $c8a6
  00c882  4a6a0050             tst.w     $50(a2)
  00c886  6c1e                 bge.b     $c8a6
  00c888  302efffe             move.w    -$2(a6), d0
  00c88c  48c0                 ext.l     d0
  00c88e  322efffa             move.w    -$6(a6), d1
  00c892  48c1                 ext.l     d1
  00c894  d280                 add.l     d0, d1
  00c896  e281                 asr.l     #$1, d1
  00c898  5081                 addq.l    #$8, d1
  00c89a  302effee             move.w    -$12(a6), d0
  00c89e  48c0                 ext.l     d0
  00c8a0  b081                 cmp.l     d1, d0
  00c8a2  6d02                 blt.b     $c8a6
  00c8a4  7601                 moveq     #$1, d3
  00c8a6  0c030001             cmpi.b    #$1, d3
  00c8aa  6616                 bne.b     $c8c2
  00c8ac  302efff8             move.w    -$8(a6), d0
  00c8b0  48c0                 ext.l     d0
  00c8b2  720d                 moveq     #$d, d1
  00c8b4  d081                 add.l     d1, d0
  00c8b6  322efff4             move.w    -$c(a6), d1
  00c8ba  48c1                 ext.l     d1
  00c8bc  b280                 cmp.l     d0, d1
  00c8be  6c02                 bge.b     $c8c2
  00c8c0  7600                 moveq     #$0, d3
  00c8c2  4a04                 tst.b     d4
  00c8c4  67000146             beq.w     $ca0c
  00c8c8  4a03                 tst.b     d3
  00c8ca  66000140             bne.w     $ca0c
  00c8ce  302efffc             move.w    -$4(a6), d0
  00c8d2  48c0                 ext.l     d0
  00c8d4  72f1                 moveq     #$f1, d1
  00c8d6  d081                 add.l     d1, d0
  00c8d8  322efff0             move.w    -$10(a6), d1
  00c8dc  48c1                 ext.l     d1
  00c8de  b280                 cmp.l     d0, d1
  00c8e0  6d0000a6             blt.w     $c988
  00c8e4  4a6a004e             tst.w     $4e(a2)
  00c8e8  6f4c                 ble.b     $c936
  00c8ea  0c6a01c2004e         cmpi.w    #$1c2, $4e(a2)
  00c8f0  6f1a                 ble.b     $c90c
  00c8f2  2f3c00640100         move.l    #$640100, -(a7)
  00c8f8  2f0c                 move.l    a4, -(a7)
  00c8fa  61ffffffc16e         bsr.l     $8a6a   ; STPlayRegSound
  00c900  357c0001008e         move.w    #$1, $8e(a2)
  00c906  504f                 addq.w    #$8, a7
  00c908  60000102             bra.w     $ca0c
  00c90c  426a004e             clr.w     $4e(a2)
  00c910  302efffc             move.w    -$4(a6), d0
  00c914  48c0                 ext.l     d0
  00c916  72f0                 moveq     #$f0, d1
  00c918  d081                 add.l     d1, d0
  00c91a  322efff0             move.w    -$10(a6), d1
  00c91e  48c1                 ext.l     d1
  00c920  9280                 sub.l     d0, d1
  00c922  936a0002             sub.w     d1, $2(a2)
  00c926  302a0002             move.w    $2(a2), d0
  00c92a  48c0                 ext.l     d0
  00c92c  e188                 lsl.l     #$8, d0
  00c92e  25400062             move.l    d0, $62(a2)
  00c932  600000d8             bra.w     $ca0c
  00c936  302efffc             move.w    -$4(a6), d0
  00c93a  48c0                 ext.l     d0
  00c93c  5d80                 subq.l    #$6, d0
  00c93e  322efff0             move.w    -$10(a6), d1
  00c942  48c1                 ext.l     d1
  00c944  b280                 cmp.l     d0, d1
  00c946  6d0000c4             blt.w     $ca0c
  00c94a  302efff0             move.w    -$10(a6), d0
  00c94e  48c0                 ext.l     d0
  00c950  322efffc             move.w    -$4(a6), d1
  00c954  48c1                 ext.l     d1
  00c956  9280                 sub.l     d0, d1
  00c958  5281                 addq.l    #$1, d1
  00c95a  d36a0002             add.w     d1, $2(a2)
  00c95e  302a0002             move.w    $2(a2), d0
  00c962  48c0                 ext.l     d0
  00c964  e188                 lsl.l     #$8, d0
  00c966  25400062             move.l    d0, $62(a2)
  00c96a  302a004e             move.w    $4e(a2), d0
  00c96e  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00c974  7209                 moveq     #$9, d1
  00c976  e2a0                 asr.l     d1, d0
  00c978  4480                 neg.l     d0
  00c97a  3540004e             move.w    d0, $4e(a2)
  00c97e  357c00030094         move.w    #$3, $94(a2)
  00c984  60000086             bra.w     $ca0c
  00c988  302efffe             move.w    -$2(a6), d0
  00c98c  48c0                 ext.l     d0
  00c98e  322efffa             move.w    -$6(a6), d1
  00c992  48c1                 ext.l     d1
  00c994  d280                 add.l     d0, d1
  00c996  e281                 asr.l     #$1, d1
  00c998  302effee             move.w    -$12(a6), d0
  00c99c  48c0                 ext.l     d0
  00c99e  b081                 cmp.l     d1, d0
  00c9a0  6c20                 bge.b     $c9c2
  00c9a2  526a0004             addq.w    #$1, $4(a2)
  00c9a6  302a0004             move.w    $4(a2), d0
  00c9aa  48c0                 ext.l     d0
  00c9ac  e188                 lsl.l     #$8, d0
  00c9ae  2540005e             move.l    d0, $5e(a2)
  00c9b2  302a0050             move.w    $50(a2), d0
  00c9b6  48c0                 ext.l     d0
  00c9b8  81fc0002             divs.w    #$2, d0
  00c9bc  35400050             move.w    d0, $50(a2)
  00c9c0  6038                 bra.b     $c9fa
  00c9c2  302efffe             move.w    -$2(a6), d0
  00c9c6  48c0                 ext.l     d0
  00c9c8  322efffa             move.w    -$6(a6), d1
  00c9cc  48c1                 ext.l     d1
  00c9ce  d280                 add.l     d0, d1
  00c9d0  e281                 asr.l     #$1, d1
  00c9d2  302effee             move.w    -$12(a6), d0
  00c9d6  48c0                 ext.l     d0
  00c9d8  b081                 cmp.l     d1, d0
  00c9da  6f1e                 ble.b     $c9fa
  00c9dc  536a0004             subq.w    #$1, $4(a2)
  00c9e0  302a0004             move.w    $4(a2), d0
  00c9e4  48c0                 ext.l     d0
  00c9e6  e188                 lsl.l     #$8, d0
  00c9e8  2540005e             move.l    d0, $5e(a2)
  00c9ec  302a0050             move.w    $50(a2), d0
  00c9f0  48c0                 ext.l     d0
  00c9f2  81fc0002             divs.w    #$2, d0
  00c9f6  35400050             move.w    d0, $50(a2)
  00c9fa  0c520045             cmpi.w    #$45, (a2)
  00c9fe  56c0                 sne.b     d0
  00ca00  4400                 neg.b     d0
  00ca02  49c0                 extb.l    d0
  00ca04  721e                 moveq     #$1e, d1
  00ca06  e0a1                 asr.l     d0, d1
  00ca08  936a004e             sub.w     d1, $4e(a2)
  00ca0c  4a03                 tst.b     d3
  00ca0e  670004fa             beq.w     $cf0a
  00ca12  4a6a0050             tst.w     $50(a2)
  00ca16  6f16                 ble.b     $ca2e
  00ca18  302efffa             move.w    -$6(a6), d0
  00ca1c  48c0                 ext.l     d0
  00ca1e  322efff6             move.w    -$a(a6), d1
  00ca22  48c1                 ext.l     d1
  00ca24  9280                 sub.l     d0, d1
  00ca26  5281                 addq.l    #$1, d1
  00ca28  936a0004             sub.w     d1, $4(a2)
  00ca2c  601a                 bra.b     $ca48
  00ca2e  4a6a0050             tst.w     $50(a2)
  00ca32  6c14                 bge.b     $ca48
  00ca34  302efff2             move.w    -$e(a6), d0
  00ca38  48c0                 ext.l     d0
  00ca3a  322efffe             move.w    -$2(a6), d1
  00ca3e  48c1                 ext.l     d1
  00ca40  9280                 sub.l     d0, d1
  00ca42  5281                 addq.l    #$1, d1
  00ca44  d36a0004             add.w     d1, $4(a2)
  00ca48  302a0004             move.w    $4(a2), d0
  00ca4c  48c0                 ext.l     d0
  00ca4e  e188                 lsl.l     #$8, d0
  00ca50  2540005e             move.l    d0, $5e(a2)
  00ca54  302a0050             move.w    $50(a2), d0
  00ca58  48c0                 ext.l     d0
  00ca5a  e280                 asr.l     #$1, d0
  00ca5c  d16b0050             add.w     d0, $50(a3)
  00ca60  302a0050             move.w    $50(a2), d0
  00ca64  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00ca6a  7209                 moveq     #$9, d1
  00ca6c  e2a0                 asr.l     d1, d0
  00ca6e  4480                 neg.l     d0
  00ca70  35400050             move.w    d0, $50(a2)
  00ca74  357c00030094         move.w    #$3, $94(a2)
  00ca7a  6000048e             bra.w     $cf0a
  00ca7e  302efffc             move.w    -$4(a6), d0
  00ca82  48c0                 ext.l     d0
  00ca84  322efff8             move.w    -$8(a6), d1
  00ca88  48c1                 ext.l     d1
  00ca8a  d280                 add.l     d0, d1
  00ca8c  e281                 asr.l     #$1, d1
  00ca8e  302effec             move.w    -$14(a6), d0
  00ca92  48c0                 ext.l     d0
  00ca94  b081                 cmp.l     d1, d0
  00ca96  6c24                 bge.b     $cabc
  00ca98  4a6a004e             tst.w     $4e(a2)
  00ca9c  6f1e                 ble.b     $cabc
  00ca9e  302efffc             move.w    -$4(a6), d0
  00caa2  48c0                 ext.l     d0
  00caa4  322efff8             move.w    -$8(a6), d1
  00caa8  48c1                 ext.l     d1
  00caaa  d280                 add.l     d0, d1
  00caac  e281                 asr.l     #$1, d1
  00caae  5181                 subq.l    #$8, d1
  00cab0  302effec             move.w    -$14(a6), d0
  00cab4  48c0                 ext.l     d0
  00cab6  b081                 cmp.l     d1, d0
  00cab8  6c02                 bge.b     $cabc
  00caba  7601                 moveq     #$1, d3
  00cabc  302efffc             move.w    -$4(a6), d0
  00cac0  48c0                 ext.l     d0
  00cac2  322efff8             move.w    -$8(a6), d1
  00cac6  48c1                 ext.l     d1
  00cac8  d280                 add.l     d0, d1
  00caca  e281                 asr.l     #$1, d1
  00cacc  302effec             move.w    -$14(a6), d0
  00cad0  48c0                 ext.l     d0
  00cad2  b081                 cmp.l     d1, d0
  00cad4  6d24                 blt.b     $cafa
  00cad6  4a6a004e             tst.w     $4e(a2)
  00cada  6c1e                 bge.b     $cafa
  00cadc  302efffc             move.w    -$4(a6), d0
  00cae0  48c0                 ext.l     d0
  00cae2  322efff8             move.w    -$8(a6), d1
  00cae6  48c1                 ext.l     d1
  00cae8  d280                 add.l     d0, d1
  00caea  e281                 asr.l     #$1, d1
  00caec  5081                 addq.l    #$8, d1
  00caee  302effec             move.w    -$14(a6), d0
  00caf2  48c0                 ext.l     d0
  00caf4  b081                 cmp.l     d1, d0
  00caf6  6d02                 blt.b     $cafa
  00caf8  7601                 moveq     #$1, d3
  00cafa  0c030001             cmpi.b    #$1, d3
  00cafe  6616                 bne.b     $cb16
  00cb00  302efffe             move.w    -$2(a6), d0
  00cb04  48c0                 ext.l     d0
  00cb06  72f3                 moveq     #$f3, d1
  00cb08  d081                 add.l     d1, d0
  00cb0a  322efff2             move.w    -$e(a6), d1
  00cb0e  48c1                 ext.l     d1
  00cb10  b280                 cmp.l     d0, d1
  00cb12  6f02                 ble.b     $cb16
  00cb14  7600                 moveq     #$0, d3
  00cb16  4a04                 tst.b     d4
  00cb18  6700013c             beq.w     $cc56
  00cb1c  4a03                 tst.b     d3
  00cb1e  66000136             bne.w     $cc56
  00cb22  302efffa             move.w    -$6(a6), d0
  00cb26  48c0                 ext.l     d0
  00cb28  720f                 moveq     #$f, d1
  00cb2a  d081                 add.l     d1, d0
  00cb2c  322efff6             move.w    -$a(a6), d1
  00cb30  48c1                 ext.l     d1
  00cb32  b280                 cmp.l     d0, d1
  00cb34  6e00009c             bgt.w     $cbd2
  00cb38  4a6a0050             tst.w     $50(a2)
  00cb3c  6c4c                 bge.b     $cb8a
  00cb3e  0c6afe3e0050         cmpi.w    #$fe3e, $50(a2)
  00cb44  6c1a                 bge.b     $cb60
  00cb46  2f3c00640100         move.l    #$640100, -(a7)
  00cb4c  2f0c                 move.l    a4, -(a7)
  00cb4e  61ffffffbf1a         bsr.l     $8a6a   ; STPlayRegSound
  00cb54  357c0001008e         move.w    #$1, $8e(a2)
  00cb5a  504f                 addq.w    #$8, a7
  00cb5c  600000f8             bra.w     $cc56
  00cb60  426a0050             clr.w     $50(a2)
  00cb64  302efff6             move.w    -$a(a6), d0
  00cb68  48c0                 ext.l     d0
  00cb6a  322efffa             move.w    -$6(a6), d1
  00cb6e  48c1                 ext.l     d1
  00cb70  7410                 moveq     #$10, d2
  00cb72  d282                 add.l     d2, d1
  00cb74  9280                 sub.l     d0, d1
  00cb76  d36a0004             add.w     d1, $4(a2)
  00cb7a  302a0004             move.w    $4(a2), d0
  00cb7e  48c0                 ext.l     d0
  00cb80  e188                 lsl.l     #$8, d0
  00cb82  2540005e             move.l    d0, $5e(a2)
  00cb86  600000ce             bra.w     $cc56
  00cb8a  302efffa             move.w    -$6(a6), d0
  00cb8e  48c0                 ext.l     d0
  00cb90  5c80                 addq.l    #$6, d0
  00cb92  322efff6             move.w    -$a(a6), d1
  00cb96  48c1                 ext.l     d1
  00cb98  b280                 cmp.l     d0, d1
  00cb9a  6e0000ba             bgt.w     $cc56
  00cb9e  302efff6             move.w    -$a(a6), d0
  00cba2  48c0                 ext.l     d0
  00cba4  322efffa             move.w    -$6(a6), d1
  00cba8  48c1                 ext.l     d1
  00cbaa  9280                 sub.l     d0, d1
  00cbac  5281                 addq.l    #$1, d1
  00cbae  e189                 lsl.l     #$8, d1
  00cbb0  93aa005e             sub.l     d1, $5e(a2)
  00cbb4  302a0050             move.w    $50(a2), d0
  00cbb8  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00cbbe  7209                 moveq     #$9, d1
  00cbc0  e2a0                 asr.l     d1, d0
  00cbc2  4480                 neg.l     d0
  00cbc4  35400050             move.w    d0, $50(a2)
  00cbc8  357c00030094         move.w    #$3, $94(a2)
  00cbce  60000086             bra.w     $cc56
  00cbd2  302efffc             move.w    -$4(a6), d0
  00cbd6  48c0                 ext.l     d0
  00cbd8  322efff8             move.w    -$8(a6), d1
  00cbdc  48c1                 ext.l     d1
  00cbde  d280                 add.l     d0, d1
  00cbe0  e281                 asr.l     #$1, d1
  00cbe2  302effec             move.w    -$14(a6), d0
  00cbe6  48c0                 ext.l     d0
  00cbe8  b081                 cmp.l     d1, d0
  00cbea  6c20                 bge.b     $cc0c
  00cbec  526a0002             addq.w    #$1, $2(a2)
  00cbf0  302a0002             move.w    $2(a2), d0
  00cbf4  48c0                 ext.l     d0
  00cbf6  e188                 lsl.l     #$8, d0
  00cbf8  25400062             move.l    d0, $62(a2)
  00cbfc  302a004e             move.w    $4e(a2), d0
  00cc00  48c0                 ext.l     d0
  00cc02  81fc0002             divs.w    #$2, d0
  00cc06  3540004e             move.w    d0, $4e(a2)
  00cc0a  6038                 bra.b     $cc44
  00cc0c  302efffc             move.w    -$4(a6), d0
  00cc10  48c0                 ext.l     d0
  00cc12  322efff8             move.w    -$8(a6), d1
  00cc16  48c1                 ext.l     d1
  00cc18  d280                 add.l     d0, d1
  00cc1a  e281                 asr.l     #$1, d1
  00cc1c  302effec             move.w    -$14(a6), d0
  00cc20  48c0                 ext.l     d0
  00cc22  b081                 cmp.l     d1, d0
  00cc24  6f1e                 ble.b     $cc44
  00cc26  536a0002             subq.w    #$1, $2(a2)
  00cc2a  302a0002             move.w    $2(a2), d0
  00cc2e  48c0                 ext.l     d0
  00cc30  e188                 lsl.l     #$8, d0
  00cc32  25400062             move.l    d0, $62(a2)
  00cc36  302a004e             move.w    $4e(a2), d0
  00cc3a  48c0                 ext.l     d0
  00cc3c  81fc0002             divs.w    #$2, d0
  00cc40  3540004e             move.w    d0, $4e(a2)
  00cc44  0c520045             cmpi.w    #$45, (a2)
  00cc48  56c0                 sne.b     d0
  00cc4a  4400                 neg.b     d0
  00cc4c  49c0                 extb.l    d0
  00cc4e  721e                 moveq     #$1e, d1
  00cc50  e0a1                 asr.l     d0, d1
  00cc52  d36a0050             add.w     d1, $50(a2)
  00cc56  4a03                 tst.b     d3
  00cc58  670002b0             beq.w     $cf0a
  00cc5c  4a6a004e             tst.w     $4e(a2)
  00cc60  6f16                 ble.b     $cc78
  00cc62  302efff8             move.w    -$8(a6), d0
  00cc66  48c0                 ext.l     d0
  00cc68  322efff4             move.w    -$c(a6), d1
  00cc6c  48c1                 ext.l     d1
  00cc6e  9280                 sub.l     d0, d1
  00cc70  5281                 addq.l    #$1, d1
  00cc72  936a0002             sub.w     d1, $2(a2)
  00cc76  601a                 bra.b     $cc92
  00cc78  4a6a004e             tst.w     $4e(a2)
  00cc7c  6c14                 bge.b     $cc92
  00cc7e  302efff0             move.w    -$10(a6), d0
  00cc82  48c0                 ext.l     d0
  00cc84  322efffc             move.w    -$4(a6), d1
  00cc88  48c1                 ext.l     d1
  00cc8a  9280                 sub.l     d0, d1
  00cc8c  5281                 addq.l    #$1, d1
  00cc8e  d36a0002             add.w     d1, $2(a2)
  00cc92  302a0002             move.w    $2(a2), d0
  00cc96  48c0                 ext.l     d0
  00cc98  e188                 lsl.l     #$8, d0
  00cc9a  25400062             move.l    d0, $62(a2)
  00cc9e  302a004e             move.w    $4e(a2), d0
  00cca2  48c0                 ext.l     d0
  00cca4  e280                 asr.l     #$1, d0
  00cca6  d16b004e             add.w     d0, $4e(a3)
  00ccaa  302a004e             move.w    $4e(a2), d0
  00ccae  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00ccb4  7209                 moveq     #$9, d1
  00ccb6  e2a0                 asr.l     d1, d0
  00ccb8  4480                 neg.l     d0
  00ccba  3540004e             move.w    d0, $4e(a2)
  00ccbe  357c00030094         move.w    #$3, $94(a2)
  00ccc4  60000244             bra.w     $cf0a
  00ccc8  302efffc             move.w    -$4(a6), d0
  00cccc  48c0                 ext.l     d0
  00ccce  322efff8             move.w    -$8(a6), d1
  00ccd2  48c1                 ext.l     d1
  00ccd4  d280                 add.l     d0, d1
  00ccd6  e281                 asr.l     #$1, d1
  00ccd8  302effec             move.w    -$14(a6), d0
  00ccdc  48c0                 ext.l     d0
  00ccde  b081                 cmp.l     d1, d0
  00cce0  6c24                 bge.b     $cd06
  00cce2  4a6a004e             tst.w     $4e(a2)
  00cce6  6f1e                 ble.b     $cd06
  00cce8  302efffc             move.w    -$4(a6), d0
  00ccec  48c0                 ext.l     d0
  00ccee  322efff8             move.w    -$8(a6), d1
  00ccf2  48c1                 ext.l     d1
  00ccf4  d280                 add.l     d0, d1
  00ccf6  e281                 asr.l     #$1, d1
  00ccf8  5181                 subq.l    #$8, d1
  00ccfa  302effec             move.w    -$14(a6), d0
  00ccfe  48c0                 ext.l     d0
  00cd00  b081                 cmp.l     d1, d0
  00cd02  6c02                 bge.b     $cd06
  00cd04  7601                 moveq     #$1, d3
  00cd06  302efffc             move.w    -$4(a6), d0
  00cd0a  48c0                 ext.l     d0
  00cd0c  322efff8             move.w    -$8(a6), d1
  00cd10  48c1                 ext.l     d1
  00cd12  d280                 add.l     d0, d1
  00cd14  e281                 asr.l     #$1, d1
  00cd16  302effec             move.w    -$14(a6), d0
  00cd1a  48c0                 ext.l     d0
  00cd1c  b081                 cmp.l     d1, d0
  00cd1e  6d24                 blt.b     $cd44
  00cd20  4a6a004e             tst.w     $4e(a2)
  00cd24  6c1e                 bge.b     $cd44
  00cd26  302efffc             move.w    -$4(a6), d0
  00cd2a  48c0                 ext.l     d0
  00cd2c  322efff8             move.w    -$8(a6), d1
  00cd30  48c1                 ext.l     d1
  00cd32  d280                 add.l     d0, d1
  00cd34  e281                 asr.l     #$1, d1
  00cd36  5081                 addq.l    #$8, d1
  00cd38  302effec             move.w    -$14(a6), d0
  00cd3c  48c0                 ext.l     d0
  00cd3e  b081                 cmp.l     d1, d0
  00cd40  6d02                 blt.b     $cd44
  00cd42  7601                 moveq     #$1, d3
  00cd44  0c030001             cmpi.b    #$1, d3
  00cd48  6616                 bne.b     $cd60
  00cd4a  302efffe             move.w    -$2(a6), d0
  00cd4e  48c0                 ext.l     d0
  00cd50  72f3                 moveq     #$f3, d1
  00cd52  d081                 add.l     d1, d0
  00cd54  322efff2             move.w    -$e(a6), d1
  00cd58  48c1                 ext.l     d1
  00cd5a  b280                 cmp.l     d0, d1
  00cd5c  6f02                 ble.b     $cd60
  00cd5e  7600                 moveq     #$0, d3
  00cd60  4a04                 tst.b     d4
  00cd62  6700013a             beq.w     $ce9e
  00cd66  4a03                 tst.b     d3
  00cd68  66000134             bne.w     $ce9e
  00cd6c  302efffe             move.w    -$2(a6), d0
  00cd70  48c0                 ext.l     d0
  00cd72  72f1                 moveq     #$f1, d1
  00cd74  d081                 add.l     d1, d0
  00cd76  322efff2             move.w    -$e(a6), d1
  00cd7a  48c1                 ext.l     d1
  00cd7c  b280                 cmp.l     d0, d1
  00cd7e  6d00009a             blt.w     $ce1a
  00cd82  4a6a0050             tst.w     $50(a2)
  00cd86  6f4c                 ble.b     $cdd4
  00cd88  0c6a01c20050         cmpi.w    #$1c2, $50(a2)
  00cd8e  6f1a                 ble.b     $cdaa
  00cd90  2f3c00640100         move.l    #$640100, -(a7)
  00cd96  2f0c                 move.l    a4, -(a7)
  00cd98  61ffffffbcd0         bsr.l     $8a6a   ; STPlayRegSound
  00cd9e  357c0001008e         move.w    #$1, $8e(a2)
  00cda4  504f                 addq.w    #$8, a7
  00cda6  600000f6             bra.w     $ce9e
  00cdaa  426a0050             clr.w     $50(a2)
  00cdae  302efffe             move.w    -$2(a6), d0
  00cdb2  48c0                 ext.l     d0
  00cdb4  72f0                 moveq     #$f0, d1
  00cdb6  d081                 add.l     d1, d0
  00cdb8  322efff2             move.w    -$e(a6), d1
  00cdbc  48c1                 ext.l     d1
  00cdbe  9280                 sub.l     d0, d1
  00cdc0  936a0004             sub.w     d1, $4(a2)
  00cdc4  302a0004             move.w    $4(a2), d0
  00cdc8  48c0                 ext.l     d0
  00cdca  e188                 lsl.l     #$8, d0
  00cdcc  2540005e             move.l    d0, $5e(a2)
  00cdd0  600000cc             bra.w     $ce9e
  00cdd4  302efffe             move.w    -$2(a6), d0
  00cdd8  48c0                 ext.l     d0
  00cdda  5d80                 subq.l    #$6, d0
  00cddc  322efff2             move.w    -$e(a6), d1
  00cde0  48c1                 ext.l     d1
  00cde2  b280                 cmp.l     d0, d1
  00cde4  6d0000b8             blt.w     $ce9e
  00cde8  302efffe             move.w    -$2(a6), d0
  00cdec  48c0                 ext.l     d0
  00cdee  322efff2             move.w    -$e(a6), d1
  00cdf2  48c1                 ext.l     d1
  00cdf4  9280                 sub.l     d0, d1
  00cdf6  5281                 addq.l    #$1, d1
  00cdf8  d36a0004             add.w     d1, $4(a2)
  00cdfc  302a0050             move.w    $50(a2), d0
  00ce00  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00ce06  7209                 moveq     #$9, d1
  00ce08  e2a0                 asr.l     d1, d0
  00ce0a  4480                 neg.l     d0
  00ce0c  35400050             move.w    d0, $50(a2)
  00ce10  357c00030094         move.w    #$3, $94(a2)
  00ce16  60000086             bra.w     $ce9e
  00ce1a  302efffc             move.w    -$4(a6), d0
  00ce1e  48c0                 ext.l     d0
  00ce20  322efff8             move.w    -$8(a6), d1
  00ce24  48c1                 ext.l     d1
  00ce26  d280                 add.l     d0, d1
  00ce28  e281                 asr.l     #$1, d1
  00ce2a  302effec             move.w    -$14(a6), d0
  00ce2e  48c0                 ext.l     d0
  00ce30  b081                 cmp.l     d1, d0
  00ce32  6c20                 bge.b     $ce54
  00ce34  526a0002             addq.w    #$1, $2(a2)
  00ce38  302a0002             move.w    $2(a2), d0
  00ce3c  48c0                 ext.l     d0
  00ce3e  e188                 lsl.l     #$8, d0
  00ce40  25400062             move.l    d0, $62(a2)
  00ce44  302a004e             move.w    $4e(a2), d0
  00ce48  48c0                 ext.l     d0
  00ce4a  81fc0002             divs.w    #$2, d0
  00ce4e  3540004e             move.w    d0, $4e(a2)
  00ce52  6038                 bra.b     $ce8c
  00ce54  302efffc             move.w    -$4(a6), d0
  00ce58  48c0                 ext.l     d0
  00ce5a  322efff8             move.w    -$8(a6), d1
  00ce5e  48c1                 ext.l     d1
  00ce60  d280                 add.l     d0, d1
  00ce62  e281                 asr.l     #$1, d1
  00ce64  302effec             move.w    -$14(a6), d0
  00ce68  48c0                 ext.l     d0
  00ce6a  b081                 cmp.l     d1, d0
  00ce6c  6f1e                 ble.b     $ce8c
  00ce6e  536a0002             subq.w    #$1, $2(a2)
  00ce72  302a0002             move.w    $2(a2), d0
  00ce76  48c0                 ext.l     d0
  00ce78  e188                 lsl.l     #$8, d0
  00ce7a  25400062             move.l    d0, $62(a2)
  00ce7e  302a004e             move.w    $4e(a2), d0
  00ce82  48c0                 ext.l     d0
  00ce84  81fc0002             divs.w    #$2, d0
  00ce88  3540004e             move.w    d0, $4e(a2)
  00ce8c  0c520045             cmpi.w    #$45, (a2)
  00ce90  56c0                 sne.b     d0
  00ce92  4400                 neg.b     d0
  00ce94  49c0                 extb.l    d0
  00ce96  721e                 moveq     #$1e, d1
  00ce98  e0a1                 asr.l     d0, d1
  00ce9a  936a0050             sub.w     d1, $50(a2)
  00ce9e  4a03                 tst.b     d3
  00cea0  6768                 beq.b     $cf0a
  00cea2  4a6a004e             tst.w     $4e(a2)
  00cea6  6f16                 ble.b     $cebe
  00cea8  302efff8             move.w    -$8(a6), d0
  00ceac  48c0                 ext.l     d0
  00ceae  322efff4             move.w    -$c(a6), d1
  00ceb2  48c1                 ext.l     d1
  00ceb4  9280                 sub.l     d0, d1
  00ceb6  5281                 addq.l    #$1, d1
  00ceb8  936a0002             sub.w     d1, $2(a2)
  00cebc  601a                 bra.b     $ced8
  00cebe  4a6a004e             tst.w     $4e(a2)
  00cec2  6c14                 bge.b     $ced8
  00cec4  302efff0             move.w    -$10(a6), d0
  00cec8  48c0                 ext.l     d0
  00ceca  322efffc             move.w    -$4(a6), d1
  00cece  48c1                 ext.l     d1
  00ced0  9280                 sub.l     d0, d1
  00ced2  5281                 addq.l    #$1, d1
  00ced4  d36a0002             add.w     d1, $2(a2)
  00ced8  302a0002             move.w    $2(a2), d0
  00cedc  48c0                 ext.l     d0
  00cede  e188                 lsl.l     #$8, d0
  00cee0  25400062             move.l    d0, $62(a2)
  00cee4  302a004e             move.w    $4e(a2), d0
  00cee8  48c0                 ext.l     d0
  00ceea  e280                 asr.l     #$1, d0
  00ceec  d16b004e             add.w     d0, $4e(a3)
  00cef0  302a004e             move.w    $4e(a2), d0
  00cef4  c1f900007e26         muls.w    $7e26.l, d0   ; g_7e26
  00cefa  7209                 moveq     #$9, d1
  00cefc  e2a0                 asr.l     d1, d0
  00cefe  4480                 neg.l     d0
  00cf00  3540004e             move.w    d0, $4e(a2)
  00cf04  357c00030094         move.w    #$3, $94(a2)
  00cf0a  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  00cf0e  4e5e                 unlk      a6
  00cf10  4e75                 rts       

;-------------------------------------------------------------
; HandleStairsCollision   (seg 2 +00cf28, 598 bytes)
  00cf28  4e56ffec             link.w    a6, #$ffec
  00cf2c  48e71038             movem.l   d3/a2-a4, -(a7)
  00cf30  246e0008             movea.l   $8(a6), a2
  00cf34  362e000c             move.w    $c(a6), d3
  00cf38  286e000e             movea.l   $e(a6), a4
  00cf3c  266e0012             movea.l   $12(a6), a3
  00cf40  3003                 move.w    d3, d0
  00cf42  48c0                 ext.l     d0
  00cf44  322a005c             move.w    $5c(a2), d1
  00cf48  48c1                 ext.l     d1
  00cf4a  d280                 add.l     d0, d1
  00cf4c  3d41fffe             move.w    d1, -$2(a6)
  00cf50  3003                 move.w    d3, d0
  00cf52  48c0                 ext.l     d0
  00cf54  322a005a             move.w    $5a(a2), d1
  00cf58  48c1                 ext.l     d1
  00cf5a  d280                 add.l     d0, d1
  00cf5c  3d41fffc             move.w    d1, -$4(a6)
  00cf60  486efff4             pea.l     -$c(a6)
  00cf64  302c0002             move.w    $2(a4), d0
  00cf68  48c0                 ext.l     d0
  00cf6a  322a005c             move.w    $5c(a2), d1
  00cf6e  48c1                 ext.l     d1
  00cf70  d280                 add.l     d0, d1
  00cf72  3f01                 move.w    d1, -(a7)
  00cf74  3014                 move.w    (a4), d0
  00cf76  48c0                 ext.l     d0
  00cf78  322a005a             move.w    $5a(a2), d1
  00cf7c  48c1                 ext.l     d1
  00cf7e  d280                 add.l     d0, d1
  00cf80  3f01                 move.w    d1, -(a7)
  00cf82  3014                 move.w    (a4), d0
  00cf84  48c0                 ext.l     d0
  00cf86  322a005c             move.w    $5c(a2), d1
  00cf8a  48c1                 ext.l     d1
  00cf8c  d280                 add.l     d0, d1
  00cf8e  3f01                 move.w    d1, -(a7)
  00cf90  3014                 move.w    (a4), d0
  00cf92  48c0                 ext.l     d0
  00cf94  322a005a             move.w    $5a(a2), d1
  00cf98  48c1                 ext.l     d1
  00cf9a  d280                 add.l     d0, d1
  00cf9c  3f01                 move.w    d1, -(a7)
  00cf9e  a8a7                 _SetRect  
  00cfa0  486effec             pea.l     -$14(a6)
  00cfa4  302b0008             move.w    $8(a3), d0
  00cfa8  48c0                 ext.l     d0
  00cfaa  322b005c             move.w    $5c(a3), d1
  00cfae  48c1                 ext.l     d1
  00cfb0  d280                 add.l     d0, d1
  00cfb2  3f01                 move.w    d1, -(a7)
  00cfb4  302b0006             move.w    $6(a3), d0
  00cfb8  48c0                 ext.l     d0
  00cfba  322b005a             move.w    $5a(a3), d1
  00cfbe  48c1                 ext.l     d1
  00cfc0  d280                 add.l     d0, d1
  00cfc2  3f01                 move.w    d1, -(a7)
  00cfc4  302b000c             move.w    $c(a3), d0
  00cfc8  48c0                 ext.l     d0
  00cfca  322b005c             move.w    $5c(a3), d1
  00cfce  48c1                 ext.l     d1
  00cfd0  d280                 add.l     d0, d1
  00cfd2  3f01                 move.w    d1, -(a7)
  00cfd4  302b000a             move.w    $a(a3), d0
  00cfd8  48c0                 ext.l     d0
  00cfda  322b005a             move.w    $5a(a3), d1
  00cfde  48c1                 ext.l     d1
  00cfe0  d280                 add.l     d0, d1
  00cfe2  3f01                 move.w    d1, -(a7)
  00cfe4  a8a7                 _SetRect  
  00cfe6  3013                 move.w    (a3), d0
  00cfe8  48c0                 ext.l     d0
  00cfea  0480000026ad         subi.l    #$26ad, d0
  00cff0  6714                 beq.b     $d006
  00cff2  5380                 subq.l    #$1, d0
  00cff4  676e                 beq.b     $d064
  00cff6  5380                 subq.l    #$1, d0
  00cff8  670000ca             beq.w     $d0c4
  00cffc  5380                 subq.l    #$1, d0
  00cffe  6700011e             beq.w     $d11e
  00d002  60000172             bra.w     $d176
  00d006  302b005a             move.w    $5a(a3), d0
  00d00a  48c0                 ext.l     d0
  00d00c  7216                 moveq     #$16, d1
  00d00e  d081                 add.l     d1, d0
  00d010  322efffc             move.w    -$4(a6), d1
  00d014  48c1                 ext.l     d1
  00d016  b280                 cmp.l     d0, d1
  00d018  6c2c                 bge.b     $d046
  00d01a  4a6a004e             tst.w     $4e(a2)
  00d01e  6f26                 ble.b     $d046
  00d020  302b005a             move.w    $5a(a3), d0
  00d024  48c0                 ext.l     d0
  00d026  5980                 subq.l    #$4, d0
  00d028  322efffc             move.w    -$4(a6), d1
  00d02c  48c1                 ext.l     d1
  00d02e  b280                 cmp.l     d0, d1
  00d030  6f000144             ble.w     $d176
  00d034  357c00c8008e         move.w    #$c8, $8e(a2)
  00d03a  426a0050             clr.w     $50(a2)
  00d03e  35530090             move.w    (a3), $90(a2)
  00d042  60000132             bra.w     $d176
  00d046  2f0c                 move.l    a4, -(a7)
  00d048  307900007e26         movea.w   $7e26.l, a0   ; g_7e26
  00d04e  2f08                 move.l    a0, -(a7)
  00d050  3f03                 move.w    d3, -(a7)
  00d052  2f0b                 move.l    a3, -(a7)
  00d054  2f0a                 move.l    a2, -(a7)
  00d056  61ffffffc428         bsr.l     $9480   ; RectBounce
  00d05c  4fef0012             lea.l     $12(a7), a7
  00d060  60000114             bra.w     $d176
  00d064  302b005a             move.w    $5a(a3), d0
  00d068  48c0                 ext.l     d0
  00d06a  720a                 moveq     #$a, d1
  00d06c  d081                 add.l     d1, d0
  00d06e  322efffc             move.w    -$4(a6), d1
  00d072  48c1                 ext.l     d1
  00d074  b280                 cmp.l     d0, d1
  00d076  6f2e                 ble.b     $d0a6
  00d078  4a6a004e             tst.w     $4e(a2)
  00d07c  6c28                 bge.b     $d0a6
  00d07e  302b005a             move.w    $5a(a3), d0
  00d082  48c0                 ext.l     d0
  00d084  7224                 moveq     #$24, d1
  00d086  d081                 add.l     d1, d0
  00d088  322efffc             move.w    -$4(a6), d1
  00d08c  48c1                 ext.l     d1
  00d08e  b280                 cmp.l     d0, d1
  00d090  6c0000e4             bge.w     $d176
  00d094  357c00c8008e         move.w    #$c8, $8e(a2)
  00d09a  426a0050             clr.w     $50(a2)
  00d09e  35530090             move.w    (a3), $90(a2)
  00d0a2  600000d2             bra.w     $d176
  00d0a6  2f0c                 move.l    a4, -(a7)
  00d0a8  307900007e26         movea.w   $7e26.l, a0   ; g_7e26
  00d0ae  2f08                 move.l    a0, -(a7)
  00d0b0  3f03                 move.w    d3, -(a7)
  00d0b2  2f0b                 move.l    a3, -(a7)
  00d0b4  2f0a                 move.l    a2, -(a7)
  00d0b6  61ffffffc3c8         bsr.l     $9480   ; RectBounce
  00d0bc  4fef0012             lea.l     $12(a7), a7
  00d0c0  600000b4             bra.w     $d176
  00d0c4  302b005c             move.w    $5c(a3), d0
  00d0c8  48c0                 ext.l     d0
  00d0ca  7216                 moveq     #$16, d1
  00d0cc  d081                 add.l     d1, d0
  00d0ce  322efffe             move.w    -$2(a6), d1
  00d0d2  48c1                 ext.l     d1
  00d0d4  b280                 cmp.l     d0, d1
  00d0d6  6c2a                 bge.b     $d102
  00d0d8  4a6a0050             tst.w     $50(a2)
  00d0dc  6f24                 ble.b     $d102
  00d0de  302b005c             move.w    $5c(a3), d0
  00d0e2  48c0                 ext.l     d0
  00d0e4  5980                 subq.l    #$4, d0
  00d0e6  322efffe             move.w    -$2(a6), d1
  00d0ea  48c1                 ext.l     d1
  00d0ec  b280                 cmp.l     d0, d1
  00d0ee  6f000086             ble.w     $d176
  00d0f2  357c00c8008e         move.w    #$c8, $8e(a2)
  00d0f8  426a004e             clr.w     $4e(a2)
  00d0fc  35530090             move.w    (a3), $90(a2)
  00d100  6074                 bra.b     $d176
  00d102  2f0c                 move.l    a4, -(a7)
  00d104  307900007e26         movea.w   $7e26.l, a0   ; g_7e26
  00d10a  2f08                 move.l    a0, -(a7)
  00d10c  3f03                 move.w    d3, -(a7)
  00d10e  2f0b                 move.l    a3, -(a7)
  00d110  2f0a                 move.l    a2, -(a7)
  00d112  61ffffffc36c         bsr.l     $9480   ; RectBounce
  00d118  4fef0012             lea.l     $12(a7), a7
  00d11c  6058                 bra.b     $d176
  00d11e  302b005c             move.w    $5c(a3), d0
  00d122  48c0                 ext.l     d0
  00d124  720a                 moveq     #$a, d1
  00d126  d081                 add.l     d1, d0
  00d128  322efffe             move.w    -$2(a6), d1
  00d12c  48c1                 ext.l     d1
  00d12e  b280                 cmp.l     d0, d1
  00d130  6f2a                 ble.b     $d15c
  00d132  4a6a0050             tst.w     $50(a2)
  00d136  6c24                 bge.b     $d15c
  00d138  302b005c             move.w    $5c(a3), d0
  00d13c  48c0                 ext.l     d0
  00d13e  7224                 moveq     #$24, d1
  00d140  d081                 add.l     d1, d0
  00d142  322efffe             move.w    -$2(a6), d1
  00d146  48c1                 ext.l     d1
  00d148  b280                 cmp.l     d0, d1
  00d14a  6c2a                 bge.b     $d176
  00d14c  357c00c8008e         move.w    #$c8, $8e(a2)
  00d152  426a004e             clr.w     $4e(a2)
  00d156  35530090             move.w    (a3), $90(a2)
  00d15a  601a                 bra.b     $d176
  00d15c  2f0c                 move.l    a4, -(a7)
  00d15e  307900007e26         movea.w   $7e26.l, a0   ; g_7e26
  00d164  2f08                 move.l    a0, -(a7)
  00d166  3f03                 move.w    d3, -(a7)
  00d168  2f0b                 move.l    a3, -(a7)
  00d16a  2f0a                 move.l    a2, -(a7)
  00d16c  61ffffffc312         bsr.l     $9480   ; RectBounce
  00d172  4fef0012             lea.l     $12(a7), a7
  00d176  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  00d17a  4e5e                 unlk      a6
  00d17c  4e75                 rts       

;-------------------------------------------------------------
; HandleExplodeRadius   (seg 2 +00d196, 300 bytes)
  00d196  4e56fff8             link.w    a6, #$fff8
  00d19a  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  00d19e  246e0008             movea.l   $8(a6), a2
  00d1a2  382e000c             move.w    $c(a6), d4
  00d1a6  266e000e             movea.l   $e(a6), a3
  00d1aa  7600                 moveq     #$0, d3
  00d1ac  0c6b1068007c         cmpi.w    #$1068, $7c(a3)
  00d1b2  6c000106             bge.w     $d2ba
  00d1b6  4a6a0096             tst.w     $96(a2)
  00d1ba  6e0000fe             bgt.w     $d2ba
  00d1be  357c001e0096         move.w    #$1e, $96(a2)
  00d1c4  3004                 move.w    d4, d0
  00d1c6  48c0                 ext.l     d0
  00d1c8  322a005c             move.w    $5c(a2), d1
  00d1cc  48c1                 ext.l     d1
  00d1ce  d280                 add.l     d0, d1
  00d1d0  3d41fffe             move.w    d1, -$2(a6)
  00d1d4  3004                 move.w    d4, d0
  00d1d6  48c0                 ext.l     d0
  00d1d8  322a005a             move.w    $5a(a2), d1
  00d1dc  48c1                 ext.l     d1
  00d1de  d280                 add.l     d0, d1
  00d1e0  3d41fffc             move.w    d1, -$4(a6)
  00d1e4  302b005c             move.w    $5c(a3), d0
  00d1e8  48c0                 ext.l     d0
  00d1ea  7220                 moveq     #$20, d1
  00d1ec  d081                 add.l     d1, d0
  00d1ee  3d40fffa             move.w    d0, -$6(a6)
  00d1f2  302b005a             move.w    $5a(a3), d0
  00d1f6  48c0                 ext.l     d0
  00d1f8  7220                 moveq     #$20, d1
  00d1fa  d081                 add.l     d1, d0
  00d1fc  3d40fff8             move.w    d0, -$8(a6)
  00d200  302efffa             move.w    -$6(a6), d0
  00d204  48c0                 ext.l     d0
  00d206  322efffe             move.w    -$2(a6), d1
  00d20a  48c1                 ext.l     d1
  00d20c  9280                 sub.l     d0, d1
  00d20e  4a81                 tst.l     d1
  00d210  6f12                 ble.b     $d224
  00d212  302efffa             move.w    -$6(a6), d0
  00d216  48c0                 ext.l     d0
  00d218  322efffe             move.w    -$2(a6), d1
  00d21c  48c1                 ext.l     d1
  00d21e  9280                 sub.l     d0, d1
  00d220  2001                 move.l    d1, d0
  00d222  6012                 bra.b     $d236
  00d224  302efffa             move.w    -$6(a6), d0
  00d228  48c0                 ext.l     d0
  00d22a  322efffe             move.w    -$2(a6), d1
  00d22e  48c1                 ext.l     d1
  00d230  9280                 sub.l     d0, d1
  00d232  4481                 neg.l     d1
  00d234  2001                 move.l    d1, d0
  00d236  3600                 move.w    d0, d3
  00d238  302efff8             move.w    -$8(a6), d0
  00d23c  48c0                 ext.l     d0
  00d23e  322efffc             move.w    -$4(a6), d1
  00d242  48c1                 ext.l     d1
  00d244  9280                 sub.l     d0, d1
  00d246  4a81                 tst.l     d1
  00d248  6f12                 ble.b     $d25c
  00d24a  302efff8             move.w    -$8(a6), d0
  00d24e  48c0                 ext.l     d0
  00d250  322efffc             move.w    -$4(a6), d1
  00d254  48c1                 ext.l     d1
  00d256  9280                 sub.l     d0, d1
  00d258  2001                 move.l    d1, d0
  00d25a  6012                 bra.b     $d26e
  00d25c  302efff8             move.w    -$8(a6), d0
  00d260  48c0                 ext.l     d0
  00d262  322efffc             move.w    -$4(a6), d1
  00d266  48c1                 ext.l     d1
  00d268  9280                 sub.l     d0, d1
  00d26a  4481                 neg.l     d1
  00d26c  2001                 move.l    d1, d0
  00d26e  3a00                 move.w    d0, d5
  00d270  3f05                 move.w    d5, -(a7)
  00d272  3f03                 move.w    d3, -(a7)
  00d274  61ffffffb86a         bsr.l     $8ae0   ; PEDistance
  00d27a  3800                 move.w    d0, d4
  00d27c  0c440020             cmpi.w    #$20, d4
  00d280  584f                 addq.w    #$4, a7
  00d282  6c36                 bge.b     $d2ba
  00d284  3004                 move.w    d4, d0
  00d286  48c0                 ext.l     d0
  00d288  7620                 moveq     #$20, d3
  00d28a  9680                 sub.l     d0, d3
  00d28c  0c430010             cmpi.w    #$10, d3
  00d290  6f02                 ble.b     $d294
  00d292  7610                 moveq     #$10, d3
  00d294  2f2efff8             move.l    -$8(a6), -(a7)
  00d298  2f2efffc             move.l    -$4(a6), -(a7)
  00d29c  61ff000005b4         bsr.l     $d852   ; FindDesiredDirectionGeneric
  00d2a2  3800                 move.w    d0, d4
  00d2a4  3003                 move.w    d3, d0
  00d2a6  48c0                 ext.l     d0
  00d2a8  ef88                 lsl.l     #$7, d0
  00d2aa  3f00                 move.w    d0, -(a7)
  00d2ac  3f04                 move.w    d4, -(a7)
  00d2ae  2f0a                 move.l    a2, -(a7)
  00d2b0  61ffffffcf06         bsr.l     $a1b8   ; ApplyModedImpulse
  00d2b6  4fef0010             lea.l     $10(a7), a7
  00d2ba  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  00d2be  4e5e                 unlk      a6
  00d2c0  4e75                 rts       

;-------------------------------------------------------------
; JumpScale   (seg 2 +00d2d8, 1390 bytes)
  00d2d8  4e56ffee             link.w    a6, #$ffee
  00d2dc  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  00d2e0  246e0008             movea.l   $8(a6), a2
  00d2e4  3c2e000c             move.w    $c(a6), d6
  00d2e8  286e000e             movea.l   $e(a6), a4
  00d2ec  266e0012             movea.l   $12(a6), a3
  00d2f0  182e001a             move.b    $1a(a6), d4
  00d2f4  3006                 move.w    d6, d0
  00d2f6  48c0                 ext.l     d0
  00d2f8  322a005a             move.w    $5a(a2), d1
  00d2fc  48c1                 ext.l     d1
  00d2fe  d280                 add.l     d0, d1
  00d300  ea81                 asr.l     #$5, d1
  00d302  3f01                 move.w    d1, -(a7)
  00d304  3006                 move.w    d6, d0
  00d306  48c0                 ext.l     d0
  00d308  322a005c             move.w    $5c(a2), d1
  00d30c  48c1                 ext.l     d1
  00d30e  d280                 add.l     d0, d1
  00d310  ea81                 asr.l     #$5, d1
  00d312  3f01                 move.w    d1, -(a7)
  00d314  61ffffffad7e         bsr.l     $8094   ; GetBGTile
  00d31a  584f                 addq.w    #$4, a7
  00d31c  3f00                 move.w    d0, -(a7)
  00d31e  61fffffff118         bsr.l     $c438   ; LookupBGTileKind
  00d324  3a00                 move.w    d0, d5
  00d326  4a6a008e             tst.w     $8e(a2)
  00d32a  544f                 addq.w    #$2, a7
  00d32c  660c                 bne.b     $d33a
  00d32e  0c450007             cmpi.w    #$7, d5
  00d332  6606                 bne.b     $d33a
  00d334  357c03e8008e         move.w    #$3e8, $8e(a2)
  00d33a  4a6a008e             tst.w     $8e(a2)
  00d33e  670004fe             beq.w     $d83e
  00d342  0c6a00c8008e         cmpi.w    #$c8, $8e(a2)
  00d348  6c00017c             bge.w     $d4c6
  00d34c  302a008e             move.w    $8e(a2), d0
  00d350  48c0                 ext.l     d0
  00d352  0c8000000023         cmpi.l    #$23, d0
  00d358  620004ce             bhi.w     $d828
  00d35c  303b0206             move.w    $d364(pc, d0.w * 2), d0
  00d360  4efb0002             jmp       $d364(pc, d0.w)
  00d364  04c40048004e0054005a00600066006c cases     0:$d828 1:$d3ac 2:$d3b2 3:$d3b8 4:$d3be 5:$d3c4 6:$d3ca 7:$d3d0
  00d374  00720078007e0084008a00900096009c cases     8:$d3d6 9:$d3dc 10:$d3e2 11:$d3e8 12:$d3ee 13:$d3f4 14:$d3fa 15:$d400
  00d384  00a200a800ae00b400ba00c000c600cc cases     16:$d406 17:$d40c 18:$d412 19:$d418 20:$d41e 21:$d424 22:$d42a 23:$d430
  00d394  00f200f800fe0104010a01100138013e cases     24:$d456 25:$d45c 26:$d462 27:$d468 28:$d46e 29:$d474 30:$d49c 31:$d4a2
  00d3a4  0144014a01500156     cases     32:$d4a8 33:$d4ae 34:$d4b4 35:$d4ba
  00d3ac  7610                 moveq     #$10, d3
  00d3ae  60000478             bra.w     $d828
  00d3b2  7618                 moveq     #$18, d3
  00d3b4  60000472             bra.w     $d828
  00d3b8  7620                 moveq     #$20, d3
  00d3ba  6000046c             bra.w     $d828
  00d3be  7628                 moveq     #$28, d3
  00d3c0  60000466             bra.w     $d828
  00d3c4  7630                 moveq     #$30, d3
  00d3c6  60000460             bra.w     $d828
  00d3ca  7638                 moveq     #$38, d3
  00d3cc  6000045a             bra.w     $d828
  00d3d0  7640                 moveq     #$40, d3
  00d3d2  60000454             bra.w     $d828
  00d3d6  7645                 moveq     #$45, d3
  00d3d8  6000044e             bra.w     $d828
  00d3dc  764b                 moveq     #$4b, d3
  00d3de  60000448             bra.w     $d828
  00d3e2  7650                 moveq     #$50, d3
  00d3e4  60000442             bra.w     $d828
  00d3e8  7650                 moveq     #$50, d3
  00d3ea  6000043c             bra.w     $d828
  00d3ee  764b                 moveq     #$4b, d3
  00d3f0  60000436             bra.w     $d828
  00d3f4  7645                 moveq     #$45, d3
  00d3f6  60000430             bra.w     $d828
  00d3fa  7640                 moveq     #$40, d3
  00d3fc  6000042a             bra.w     $d828
  00d400  763b                 moveq     #$3b, d3
  00d402  60000424             bra.w     $d828
  00d406  7635                 moveq     #$35, d3
  00d408  6000041e             bra.w     $d828
  00d40c  7630                 moveq     #$30, d3
  00d40e  60000418             bra.w     $d828
  00d412  7628                 moveq     #$28, d3
  00d414  60000412             bra.w     $d828
  00d418  7620                 moveq     #$20, d3
  00d41a  6000040c             bra.w     $d828
  00d41e  7618                 moveq     #$18, d3
  00d420  60000406             bra.w     $d828
  00d424  7610                 moveq     #$10, d3
  00d426  60000400             bra.w     $d828
  00d42a  7608                 moveq     #$8, d3
  00d42c  600003fa             bra.w     $d828
  00d430  7600                 moveq     #$0, d3
  00d432  0c450007             cmpi.w    #$7, d5
  00d436  6714                 beq.b     $d44c
  00d438  2f3c00640100         move.l    #$640100, -(a7)
  00d43e  2f0c                 move.l    a4, -(a7)
  00d440  61ffffffb628         bsr.l     $8a6a   ; STPlayRegSound
  00d446  504f                 addq.w    #$8, a7
  00d448  600003de             bra.w     $d828
  00d44c  357c03e7008e         move.w    #$3e7, $8e(a2)
  00d452  600003d4             bra.w     $d828
  00d456  7608                 moveq     #$8, d3
  00d458  600003ce             bra.w     $d828
  00d45c  7610                 moveq     #$10, d3
  00d45e  600003c8             bra.w     $d828
  00d462  7618                 moveq     #$18, d3
  00d464  600003c2             bra.w     $d828
  00d468  7620                 moveq     #$20, d3
  00d46a  600003bc             bra.w     $d828
  00d46e  7618                 moveq     #$18, d3
  00d470  600003b6             bra.w     $d828
  00d474  7610                 moveq     #$10, d3
  00d476  0c450007             cmpi.w    #$7, d5
  00d47a  6714                 beq.b     $d490
  00d47c  2f3c00640100         move.l    #$640100, -(a7)
  00d482  2f0b                 move.l    a3, -(a7)
  00d484  61ffffffb5e4         bsr.l     $8a6a   ; STPlayRegSound
  00d48a  504f                 addq.w    #$8, a7
  00d48c  6000039a             bra.w     $d828
  00d490  7600                 moveq     #$0, d3
  00d492  357c03e7008e         move.w    #$3e7, $8e(a2)
  00d498  6000038e             bra.w     $d828
  00d49c  7608                 moveq     #$8, d3
  00d49e  60000388             bra.w     $d828
  00d4a2  7600                 moveq     #$0, d3
  00d4a4  60000382             bra.w     $d828
  00d4a8  7608                 moveq     #$8, d3
  00d4aa  6000037c             bra.w     $d828
  00d4ae  7610                 moveq     #$10, d3
  00d4b0  60000376             bra.w     $d828
  00d4b4  7608                 moveq     #$8, d3
  00d4b6  60000370             bra.w     $d828
  00d4ba  7600                 moveq     #$0, d3
  00d4bc  357cffff008e         move.w    #$ffff, $8e(a2)
  00d4c2  60000364             bra.w     $d828
  00d4c6  0c6a012c008e         cmpi.w    #$12c, $8e(a2)
  00d4cc  6c0000c0             bge.w     $d58e
  00d4d0  302a0090             move.w    $90(a2), d0
  00d4d4  48c0                 ext.l     d0
  00d4d6  0480000026ad         subi.l    #$26ad, d0
  00d4dc  670e                 beq.b     $d4ec
  00d4de  5380                 subq.l    #$1, d0
  00d4e0  671a                 beq.b     $d4fc
  00d4e2  5380                 subq.l    #$1, d0
  00d4e4  6726                 beq.b     $d50c
  00d4e6  5380                 subq.l    #$1, d0
  00d4e8  6732                 beq.b     $d51c
  00d4ea  603e                 bra.b     $d52a
  00d4ec  0c6a0200004e         cmpi.w    #$200, $4e(a2)
  00d4f2  6c36                 bge.b     $d52a
  00d4f4  357c0200004e         move.w    #$200, $4e(a2)
  00d4fa  602e                 bra.b     $d52a
  00d4fc  0c6afe00004e         cmpi.w    #$fe00, $4e(a2)
  00d502  6f26                 ble.b     $d52a
  00d504  357cfe00004e         move.w    #$fe00, $4e(a2)
  00d50a  601e                 bra.b     $d52a
  00d50c  0c6a02000050         cmpi.w    #$200, $50(a2)
  00d512  6c16                 bge.b     $d52a
  00d514  357c02000050         move.w    #$200, $50(a2)
  00d51a  600e                 bra.b     $d52a
  00d51c  0c6afe00004e         cmpi.w    #$fe00, $4e(a2)
  00d522  6f06                 ble.b     $d52a
  00d524  357cfe000050         move.w    #$fe00, $50(a2)
  00d52a  302a008e             move.w    $8e(a2), d0
  00d52e  48c0                 ext.l     d0
  00d530  4c7c080100000004     divsl.l   #$4, d1:d0
  00d538  4a81                 tst.l     d1
  00d53a  670e                 beq.b     $d54a
  00d53c  5381                 subq.l    #$1, d1
  00d53e  671e                 beq.b     $d55e
  00d540  5381                 subq.l    #$1, d1
  00d542  671e                 beq.b     $d562
  00d544  5381                 subq.l    #$1, d1
  00d546  671e                 beq.b     $d566
  00d548  601e                 bra.b     $d568
  00d54a  7600                 moveq     #$0, d3
  00d54c  2f3c00640100         move.l    #$640100, -(a7)
  00d552  2f0c                 move.l    a4, -(a7)
  00d554  61ffffffb514         bsr.l     $8a6a   ; STPlayRegSound
  00d55a  504f                 addq.w    #$8, a7
  00d55c  600a                 bra.b     $d568
  00d55e  7610                 moveq     #$10, d3
  00d560  6006                 bra.b     $d568
  00d562  7620                 moveq     #$20, d3
  00d564  6002                 bra.b     $d568
  00d566  7610                 moveq     #$10, d3
  00d568  0c6a00dc008e         cmpi.w    #$dc, $8e(a2)
  00d56e  6f0002b8             ble.w     $d828
  00d572  7600                 moveq     #$0, d3
  00d574  357cffff008e         move.w    #$ffff, $8e(a2)
  00d57a  2f3c00640100         move.l    #$640100, -(a7)
  00d580  2f0b                 move.l    a3, -(a7)
  00d582  61ffffffb4e6         bsr.l     $8a6a   ; STPlayRegSound
  00d588  504f                 addq.w    #$8, a7
  00d58a  6000029c             bra.w     $d828
  00d58e  0c6a03e8008e         cmpi.w    #$3e8, $8e(a2)
  00d594  6d000292             blt.w     $d828
  00d598  0c6a03e8008e         cmpi.w    #$3e8, $8e(a2)
  00d59e  6618                 bne.b     $d5b8
  00d5a0  2f3c00640100         move.l    #$640100, -(a7)
  00d5a6  2f2e0016             move.l    $16(a6), -(a7)
  00d5aa  61ffffffb4be         bsr.l     $8a6a   ; STPlayRegSound
  00d5b0  76fa                 moveq     #$fa, d3
  00d5b2  504f                 addq.w    #$8, a7
  00d5b4  60000272             bra.w     $d828
  00d5b8  0c6a0406008e         cmpi.w    #$406, $8e(a2)
  00d5be  6c0000ca             bge.w     $d68a
  00d5c2  302a008e             move.w    $8e(a2), d0
  00d5c6  48c0                 ext.l     d0
  00d5c8  263c000003e8         move.l    #$3e8, d3
  00d5ce  9680                 sub.l     d0, d3
  00d5d0  4c3c380000000006     muls.l    #$6, d3
  00d5d8  2d7c3fe99999ffee     move.l    #$3fe99999, -$12(a6)
  00d5e0  2d7c9999999afff2     move.l    #$9999999a, -$e(a6)
  00d5e8  486a0050             pea.l     $50(a2)
  00d5ec  486efff6             pea.l     -$a(a6)
  00d5f0  3f3c200e             move.w    #$200e, -(a7)
  00d5f4  a9eb                 _Pack4_FP 
  00d5f6  486effee             pea.l     -$12(a6)
  00d5fa  486efff6             pea.l     -$a(a6)
  00d5fe  3f3c0804             move.w    #$804, -(a7)
  00d602  a9eb                 _Pack4_FP 
  00d604  486efff6             pea.l     -$a(a6)
  00d608  3f3c0016             move.w    #$16, -(a7)
  00d60c  a9eb                 _Pack4_FP 
  00d60e  486efff6             pea.l     -$a(a6)
  00d612  486efff6             pea.l     -$a(a6)
  00d616  3f3c2810             move.w    #$2810, -(a7)
  00d61a  a9eb                 _Pack4_FP 
  00d61c  356efff80050         move.w    -$8(a6), $50(a2)
  00d622  2d7c3fe99999ffee     move.l    #$3fe99999, -$12(a6)
  00d62a  2d7c9999999afff2     move.l    #$9999999a, -$e(a6)
  00d632  486a004e             pea.l     $4e(a2)
  00d636  486efff6             pea.l     -$a(a6)
  00d63a  3f3c200e             move.w    #$200e, -(a7)
  00d63e  a9eb                 _Pack4_FP 
  00d640  486effee             pea.l     -$12(a6)
  00d644  486efff6             pea.l     -$a(a6)
  00d648  3f3c0804             move.w    #$804, -(a7)
  00d64c  a9eb                 _Pack4_FP 
  00d64e  486efff6             pea.l     -$a(a6)
  00d652  3f3c0016             move.w    #$16, -(a7)
  00d656  a9eb                 _Pack4_FP 
  00d658  486efff6             pea.l     -$a(a6)
  00d65c  486efff6             pea.l     -$a(a6)
  00d660  3f3c2810             move.w    #$2810, -(a7)
  00d664  a9eb                 _Pack4_FP 
  00d666  356efff8004e         move.w    -$8(a6), $4e(a2)
  00d66c  4a04                 tst.b     d4
  00d66e  670001b8             beq.w     $d828
  00d672  526a0066             addq.w    #$1, $66(a2)
  00d676  0c6a00230066         cmpi.w    #$23, $66(a2)
  00d67c  6f0001aa             ble.w     $d828
  00d680  046a00240066         subi.w    #$24, $66(a2)
  00d686  600001a0             bra.w     $d828
  00d68a  0c6a0406008e         cmpi.w    #$406, $8e(a2)
  00d690  660000d0             bne.w     $d762
  00d694  554f                 subq.w    #$2, a7
  00d696  3f3c0007             move.w    #$7, -(a7)
  00d69a  4eb900000058         jsr       $58.l   ; SATRAND
  00d6a0  301f                 move.w    (a7)+, d0
  00d6a2  48c0                 ext.l     d0
  00d6a4  5780                 subq.l    #$3, d0
  00d6a6  3206                 move.w    d6, d1
  00d6a8  48c1                 ext.l     d1
  00d6aa  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00d6b0  2250                 movea.l   (a0), a1
  00d6b2  243c00012076         move.l    #$12076, d2
  00d6b8  34312800             move.w    (a1, d2.l), d2
  00d6bc  48c2                 ext.l     d2
  00d6be  9481                 sub.l     d1, d2
  00d6c0  d480                 add.l     d0, d2
  00d6c2  e18a                 lsl.l     #$8, d2
  00d6c4  2542005e             move.l    d2, $5e(a2)
  00d6c8  554f                 subq.w    #$2, a7
  00d6ca  3f3c0007             move.w    #$7, -(a7)
  00d6ce  4eb900000058         jsr       $58.l   ; SATRAND
  00d6d4  301f                 move.w    (a7)+, d0
  00d6d6  48c0                 ext.l     d0
  00d6d8  5780                 subq.l    #$3, d0
  00d6da  3206                 move.w    d6, d1
  00d6dc  48c1                 ext.l     d1
  00d6de  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00d6e4  2250                 movea.l   (a0), a1
  00d6e6  243c00012078         move.l    #$12078, d2
  00d6ec  34312800             move.w    (a1, d2.l), d2
  00d6f0  48c2                 ext.l     d2
  00d6f2  9481                 sub.l     d1, d2
  00d6f4  d480                 add.l     d0, d2
  00d6f6  e18a                 lsl.l     #$8, d2
  00d6f8  25420062             move.l    d2, $62(a2)
  00d6fc  202a005e             move.l    $5e(a2), d0
  00d700  e080                 asr.l     #$8, d0
  00d702  35400004             move.w    d0, $4(a2)
  00d706  3540005c             move.w    d0, $5c(a2)
  00d70a  202a0062             move.l    $62(a2), d0
  00d70e  e080                 asr.l     #$8, d0
  00d710  35400002             move.w    d0, $2(a2)
  00d714  3540005a             move.w    d0, $5a(a2)
  00d718  363c00c8             move.w    #$c8, d3
  00d71c  4a04                 tst.b     d4
  00d71e  67000108             beq.w     $d828
  00d722  3f3c0008             move.w    #$8, -(a7)
  00d726  61ffffff7a46         bsr.l     $516e   ; GammaFadeOut
  00d72c  302a005c             move.w    $5c(a2), d0
  00d730  48c0                 ext.l     d0
  00d732  0680ffffff30         addi.l    #$ffffff30, d0
  00d738  33c00000806a         move.w    d0, $806a.l   ; viewLeft
  00d73e  33c00000806e         move.w    d0, $806e.l   ; viewLeft2
  00d744  302a005a             move.w    $5a(a2), d0
  00d748  48c0                 ext.l     d0
  00d74a  0680ffffff30         addi.l    #$ffffff30, d0
  00d750  33c000008068         move.w    d0, $8068.l   ; viewTop
  00d756  33c00000806c         move.w    d0, $806c.l   ; viewTop2
  00d75c  544f                 addq.w    #$2, a7
  00d75e  600000c8             bra.w     $d828
  00d762  0c6a0415008e         cmpi.w    #$415, $8e(a2)
  00d768  6e0000be             bgt.w     $d828
  00d76c  0c6a0407008e         cmpi.w    #$407, $8e(a2)
  00d772  661a                 bne.b     $d78e
  00d774  4a04                 tst.b     d4
  00d776  6716                 beq.b     $d78e
  00d778  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00d77e  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  00d786  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00d78e  0c6a0408008e         cmpi.w    #$408, $8e(a2)
  00d794  6610                 bne.b     $d7a6
  00d796  4a04                 tst.b     d4
  00d798  670c                 beq.b     $d7a6
  00d79a  3f3c0008             move.w    #$8, -(a7)
  00d79e  61ffffff7aae         bsr.l     $524e   ; GammaFadeIn
  00d7a4  544f                 addq.w    #$2, a7
  00d7a6  426a004e             clr.w     $4e(a2)
  00d7aa  426a0050             clr.w     $50(a2)
  00d7ae  302a008e             move.w    $8e(a2), d0
  00d7b2  48c0                 ext.l     d0
  00d7b4  263c00000415         move.l    #$415, d3
  00d7ba  9680                 sub.l     d0, d3
  00d7bc  e78b                 lsl.l     #$3, d3
  00d7be  7050                 moveq     #$50, d0
  00d7c0  d680                 add.l     d0, d3
  00d7c2  0c6a0415008e         cmpi.w    #$415, $8e(a2)
  00d7c8  6636                 bne.b     $d800
  00d7ca  357c000a008e         move.w    #$a, $8e(a2)
  00d7d0  4a04                 tst.b     d4
  00d7d2  672c                 beq.b     $d800
  00d7d4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00d7da  2250                 movea.l   (a0), a1
  00d7dc  203c0001207a         move.l    #$1207a, d0
  00d7e2  30310800             move.w    (a1, d0.l), d0
  00d7e6  d179000046c4         add.w     d0, $46c4.l   ; g_46c4
  00d7ec  2f3c00640100         move.l    #$640100, -(a7)
  00d7f2  2f3900008332         move.l    $8332.l, -(a7)   ; snd224_Ouch_Ghost
  00d7f8  61ffffffb270         bsr.l     $8a6a   ; STPlayRegSound
  00d7fe  504f                 addq.w    #$8, a7
  00d800  4a04                 tst.b     d4
  00d802  6724                 beq.b     $d828
  00d804  0c6a040e008e         cmpi.w    #$40e, $8e(a2)
  00d80a  6d0a                 blt.b     $d816
  00d80c  302a008e             move.w    $8e(a2), d0
  00d810  7201                 moveq     #$1, d1
  00d812  c081                 and.l     d1, d0
  00d814  6704                 beq.b     $d81a
  00d816  526a0066             addq.w    #$1, $66(a2)
  00d81a  0c6a00230066         cmpi.w    #$23, $66(a2)
  00d820  6f06                 ble.b     $d828
  00d822  046a00240066         subi.w    #$24, $66(a2)
  00d828  526a008e             addq.w    #$1, $8e(a2)
  00d82c  3003                 move.w    d3, d0
  00d82e  48c0                 ext.l     d0
  00d830  068000000100         addi.l    #$100, d0
  00d836  35400054             move.w    d0, $54(a2)
  00d83a  35400052             move.w    d0, $52(a2)
  00d83e  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  00d842  4e5e                 unlk      a6
  00d844  4e75                 rts       

;-------------------------------------------------------------
; FindDesiredDirectionGeneric   (seg 2 +00d852, 2152 bytes)
  00d852  4e56ffde             link.w    a6, #$ffde
  00d856  48e70e00             movem.l   d4-d6, -(a7)
  00d85a  342e000e             move.w    $e(a6), d2
  00d85e  382e000c             move.w    $c(a6), d4
  00d862  3a2e000a             move.w    $a(a6), d5
  00d866  3c2e0008             move.w    $8(a6), d6
  00d86a  b445                 cmp.w     d5, d2
  00d86c  6602                 bne.b     $d870
  00d86e  5242                 addq.w    #$1, d2
  00d870  b846                 cmp.w     d6, d4
  00d872  6602                 bne.b     $d876
  00d874  5244                 addq.w    #$1, d4
  00d876  3005                 move.w    d5, d0
  00d878  48c0                 ext.l     d0
  00d87a  3202                 move.w    d2, d1
  00d87c  48c1                 ext.l     d1
  00d87e  9280                 sub.l     d0, d1
  00d880  2d41ffde             move.l    d1, -$22(a6)
  00d884  486effde             pea.l     -$22(a6)
  00d888  486effde             pea.l     -$22(a6)
  00d88c  3f3c280e             move.w    #$280e, -(a7)
  00d890  a9eb                 _Pack4_FP 
  00d892  486effde             pea.l     -$22(a6)
  00d896  486effde             pea.l     -$22(a6)
  00d89a  3f3c1010             move.w    #$1010, -(a7)
  00d89e  a9eb                 _Pack4_FP 
  00d8a0  2d6effdefff8         move.l    -$22(a6), -$8(a6)
  00d8a6  3004                 move.w    d4, d0
  00d8a8  48c0                 ext.l     d0
  00d8aa  3206                 move.w    d6, d1
  00d8ac  48c1                 ext.l     d1
  00d8ae  9280                 sub.l     d0, d1
  00d8b0  2d41ffde             move.l    d1, -$22(a6)
  00d8b4  486effde             pea.l     -$22(a6)
  00d8b8  486effde             pea.l     -$22(a6)
  00d8bc  3f3c280e             move.w    #$280e, -(a7)
  00d8c0  a9eb                 _Pack4_FP 
  00d8c2  486effde             pea.l     -$22(a6)
  00d8c6  486effde             pea.l     -$22(a6)
  00d8ca  3f3c1010             move.w    #$1010, -(a7)
  00d8ce  a9eb                 _Pack4_FP 
  00d8d0  2d6effdefff4         move.l    -$22(a6), -$c(a6)
  00d8d6  486efff4             pea.l     -$c(a6)
  00d8da  486effde             pea.l     -$22(a6)
  00d8de  3f3c100e             move.w    #$100e, -(a7)
  00d8e2  a9eb                 _Pack4_FP 
  00d8e4  486efff8             pea.l     -$8(a6)
  00d8e8  486effde             pea.l     -$22(a6)
  00d8ec  3f3c1006             move.w    #$1006, -(a7)
  00d8f0  a9eb                 _Pack4_FP 
  00d8f2  486effde             pea.l     -$22(a6)
  00d8f6  486effe8             pea.l     -$18(a6)
  00d8fa  3f3c1010             move.w    #$1010, -(a7)
  00d8fe  a9eb                 _Pack4_FP 
  00d900  2d6effe8fffc         move.l    -$18(a6), -$4(a6)
  00d906  42aeffe8             clr.l     -$18(a6)
  00d90a  486efff4             pea.l     -$c(a6)
  00d90e  486effde             pea.l     -$22(a6)
  00d912  3f3c100e             move.w    #$100e, -(a7)
  00d916  a9eb                 _Pack4_FP 
  00d918  486effe8             pea.l     -$18(a6)
  00d91c  486effde             pea.l     -$22(a6)
  00d920  3f3c1008             move.w    #$1008, -(a7)
  00d924  a9eb                 _Pack4_FP 
  00d926  6f0003ca             ble.w     $dcf2
  00d92a  42aeffe8             clr.l     -$18(a6)
  00d92e  486efff8             pea.l     -$8(a6)
  00d932  486effde             pea.l     -$22(a6)
  00d936  3f3c100e             move.w    #$100e, -(a7)
  00d93a  a9eb                 _Pack4_FP 
  00d93c  486effe8             pea.l     -$18(a6)
  00d940  486effde             pea.l     -$22(a6)
  00d944  3f3c1008             move.w    #$1008, -(a7)
  00d948  a9eb                 _Pack4_FP 
  00d94a  6f0001d4             ble.w     $db20
  00d94e  2d7c3fb66666ffec     move.l    #$3fb66666, -$14(a6)
  00d956  2d7c66666666fff0     move.l    #$66666666, -$10(a6)
  00d95e  486efffc             pea.l     -$4(a6)
  00d962  486effde             pea.l     -$22(a6)
  00d966  3f3c100e             move.w    #$100e, -(a7)
  00d96a  a9eb                 _Pack4_FP 
  00d96c  486effec             pea.l     -$14(a6)
  00d970  486effde             pea.l     -$22(a6)
  00d974  3f3c0808             move.w    #$808, -(a7)
  00d978  a9eb                 _Pack4_FP 
  00d97a  6c06                 bge.b     $d982
  00d97c  7400                 moveq     #$0, d2
  00d97e  60000730             bra.w     $e0b0
  00d982  2d7c3fd11eb8ffec     move.l    #$3fd11eb8, -$14(a6)
  00d98a  2d7c51eb851ffff0     move.l    #$51eb851f, -$10(a6)
  00d992  486efffc             pea.l     -$4(a6)
  00d996  486effde             pea.l     -$22(a6)
  00d99a  3f3c100e             move.w    #$100e, -(a7)
  00d99e  a9eb                 _Pack4_FP 
  00d9a0  486effec             pea.l     -$14(a6)
  00d9a4  486effde             pea.l     -$22(a6)
  00d9a8  3f3c0808             move.w    #$808, -(a7)
  00d9ac  a9eb                 _Pack4_FP 
  00d9ae  6c06                 bge.b     $d9b6
  00d9b0  7401                 moveq     #$1, d2
  00d9b2  600006fc             bra.w     $e0b0
  00d9b6  2d7c3fddd7dbffec     move.l    #$3fddd7db, -$14(a6)
  00d9be  2d7cf487fcb9fff0     move.l    #$f487fcb9, -$10(a6)
  00d9c6  486efffc             pea.l     -$4(a6)
  00d9ca  486effde             pea.l     -$22(a6)
  00d9ce  3f3c100e             move.w    #$100e, -(a7)
  00d9d2  a9eb                 _Pack4_FP 
  00d9d4  486effec             pea.l     -$14(a6)
  00d9d8  486effde             pea.l     -$22(a6)
  00d9dc  3f3c0808             move.w    #$808, -(a7)
  00d9e0  a9eb                 _Pack4_FP 
  00d9e2  6c06                 bge.b     $d9ea
  00d9e4  7402                 moveq     #$2, d2
  00d9e6  600006c8             bra.w     $e0b0
  00d9ea  2d7c3fe66809ffec     move.l    #$3fe66809, -$14(a6)
  00d9f2  2d7cd495182bfff0     move.l    #$d495182b, -$10(a6)
  00d9fa  486efffc             pea.l     -$4(a6)
  00d9fe  486effde             pea.l     -$22(a6)
  00da02  3f3c100e             move.w    #$100e, -(a7)
  00da06  a9eb                 _Pack4_FP 
  00da08  486effec             pea.l     -$14(a6)
  00da0c  486effde             pea.l     -$22(a6)
  00da10  3f3c0808             move.w    #$808, -(a7)
  00da14  a9eb                 _Pack4_FP 
  00da16  6c06                 bge.b     $da1e
  00da18  7403                 moveq     #$3, d2
  00da1a  60000694             bra.w     $e0b0
  00da1e  2d7c3f800000ffe8     move.l    #$3f800000, -$18(a6)
  00da26  486efffc             pea.l     -$4(a6)
  00da2a  486effde             pea.l     -$22(a6)
  00da2e  3f3c100e             move.w    #$100e, -(a7)
  00da32  a9eb                 _Pack4_FP 
  00da34  486effe8             pea.l     -$18(a6)
  00da38  486effde             pea.l     -$22(a6)
  00da3c  3f3c1008             move.w    #$1008, -(a7)
  00da40  a9eb                 _Pack4_FP 
  00da42  6c06                 bge.b     $da4a
  00da44  7404                 moveq     #$4, d2
  00da46  60000668             bra.w     $e0b0
  00da4a  2d7c3ff6d97fffec     move.l    #$3ff6d97f, -$14(a6)
  00da52  2d7c62b6ae7dfff0     move.l    #$62b6ae7d, -$10(a6)
  00da5a  486efffc             pea.l     -$4(a6)
  00da5e  486effde             pea.l     -$22(a6)
  00da62  3f3c100e             move.w    #$100e, -(a7)
  00da66  a9eb                 _Pack4_FP 
  00da68  486effec             pea.l     -$14(a6)
  00da6c  486effde             pea.l     -$22(a6)
  00da70  3f3c0808             move.w    #$808, -(a7)
  00da74  a9eb                 _Pack4_FP 
  00da76  6c06                 bge.b     $da7e
  00da78  7405                 moveq     #$5, d2
  00da7a  60000634             bra.w     $e0b0
  00da7e  2d7c400127efffec     move.l    #$400127ef, -$14(a6)
  00da86  2d7c9db22d0efff0     move.l    #$9db22d0e, -$10(a6)
  00da8e  486efffc             pea.l     -$4(a6)
  00da92  486effde             pea.l     -$22(a6)
  00da96  3f3c100e             move.w    #$100e, -(a7)
  00da9a  a9eb                 _Pack4_FP 
  00da9c  486effec             pea.l     -$14(a6)
  00daa0  486effde             pea.l     -$22(a6)
  00daa4  3f3c0808             move.w    #$808, -(a7)
  00daa8  a9eb                 _Pack4_FP 
  00daaa  6c06                 bge.b     $dab2
  00daac  7406                 moveq     #$6, d2
  00daae  60000600             bra.w     $e0b0
  00dab2  2d7c400ddb22ffec     move.l    #$400ddb22, -$14(a6)
  00daba  2d7cd0e56042fff0     move.l    #$d0e56042, -$10(a6)
  00dac2  486efffc             pea.l     -$4(a6)
  00dac6  486effde             pea.l     -$22(a6)
  00daca  3f3c100e             move.w    #$100e, -(a7)
  00dace  a9eb                 _Pack4_FP 
  00dad0  486effec             pea.l     -$14(a6)
  00dad4  486effde             pea.l     -$22(a6)
  00dad8  3f3c0808             move.w    #$808, -(a7)
  00dadc  a9eb                 _Pack4_FP 
  00dade  6c06                 bge.b     $dae6
  00dae0  7407                 moveq     #$7, d2
  00dae2  600005cc             bra.w     $e0b0
  00dae6  2d7c4026dc28ffec     move.l    #$4026dc28, -$14(a6)
  00daee  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00daf6  486efffc             pea.l     -$4(a6)
  00dafa  486effde             pea.l     -$22(a6)
  00dafe  3f3c100e             move.w    #$100e, -(a7)
  00db02  a9eb                 _Pack4_FP 
  00db04  486effec             pea.l     -$14(a6)
  00db08  486effde             pea.l     -$22(a6)
  00db0c  3f3c0808             move.w    #$808, -(a7)
  00db10  a9eb                 _Pack4_FP 
  00db12  6c06                 bge.b     $db1a
  00db14  7408                 moveq     #$8, d2
  00db16  60000598             bra.w     $e0b0
  00db1a  7409                 moveq     #$9, d2
  00db1c  60000592             bra.w     $e0b0
  00db20  2d7cc026dc28ffec     move.l    #$c026dc28, -$14(a6)
  00db28  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00db30  486efffc             pea.l     -$4(a6)
  00db34  486effde             pea.l     -$22(a6)
  00db38  3f3c100e             move.w    #$100e, -(a7)
  00db3c  a9eb                 _Pack4_FP 
  00db3e  486effec             pea.l     -$14(a6)
  00db42  486effde             pea.l     -$22(a6)
  00db46  3f3c0808             move.w    #$808, -(a7)
  00db4a  a9eb                 _Pack4_FP 
  00db4c  6c06                 bge.b     $db54
  00db4e  7409                 moveq     #$9, d2
  00db50  6000055e             bra.w     $e0b0
  00db54  2d7cc00ddb22ffec     move.l    #$c00ddb22, -$14(a6)
  00db5c  2d7cd0e56042fff0     move.l    #$d0e56042, -$10(a6)
  00db64  486efffc             pea.l     -$4(a6)
  00db68  486effde             pea.l     -$22(a6)
  00db6c  3f3c100e             move.w    #$100e, -(a7)
  00db70  a9eb                 _Pack4_FP 
  00db72  486effec             pea.l     -$14(a6)
  00db76  486effde             pea.l     -$22(a6)
  00db7a  3f3c0808             move.w    #$808, -(a7)
  00db7e  a9eb                 _Pack4_FP 
  00db80  6c06                 bge.b     $db88
  00db82  740a                 moveq     #$a, d2
  00db84  6000052a             bra.w     $e0b0
  00db88  2d7cc00127efffec     move.l    #$c00127ef, -$14(a6)
  00db90  2d7c9db22d0efff0     move.l    #$9db22d0e, -$10(a6)
  00db98  486efffc             pea.l     -$4(a6)
  00db9c  486effde             pea.l     -$22(a6)
  00dba0  3f3c100e             move.w    #$100e, -(a7)
  00dba4  a9eb                 _Pack4_FP 
  00dba6  486effec             pea.l     -$14(a6)
  00dbaa  486effde             pea.l     -$22(a6)
  00dbae  3f3c0808             move.w    #$808, -(a7)
  00dbb2  a9eb                 _Pack4_FP 
  00dbb4  6c06                 bge.b     $dbbc
  00dbb6  740b                 moveq     #$b, d2
  00dbb8  600004f6             bra.w     $e0b0
  00dbbc  2d7cbff6d97fffec     move.l    #$bff6d97f, -$14(a6)
  00dbc4  2d7c62b6ae7dfff0     move.l    #$62b6ae7d, -$10(a6)
  00dbcc  486efffc             pea.l     -$4(a6)
  00dbd0  486effde             pea.l     -$22(a6)
  00dbd4  3f3c100e             move.w    #$100e, -(a7)
  00dbd8  a9eb                 _Pack4_FP 
  00dbda  486effec             pea.l     -$14(a6)
  00dbde  486effde             pea.l     -$22(a6)
  00dbe2  3f3c0808             move.w    #$808, -(a7)
  00dbe6  a9eb                 _Pack4_FP 
  00dbe8  6c06                 bge.b     $dbf0
  00dbea  740c                 moveq     #$c, d2
  00dbec  600004c2             bra.w     $e0b0
  00dbf0  2d7cbf800000ffe8     move.l    #$bf800000, -$18(a6)
  00dbf8  486efffc             pea.l     -$4(a6)
  00dbfc  486effde             pea.l     -$22(a6)
  00dc00  3f3c100e             move.w    #$100e, -(a7)
  00dc04  a9eb                 _Pack4_FP 
  00dc06  486effe8             pea.l     -$18(a6)
  00dc0a  486effde             pea.l     -$22(a6)
  00dc0e  3f3c1008             move.w    #$1008, -(a7)
  00dc12  a9eb                 _Pack4_FP 
  00dc14  6c06                 bge.b     $dc1c
  00dc16  740d                 moveq     #$d, d2
  00dc18  60000496             bra.w     $e0b0
  00dc1c  2d7cbfe66809ffec     move.l    #$bfe66809, -$14(a6)
  00dc24  2d7cd495182bfff0     move.l    #$d495182b, -$10(a6)
  00dc2c  486efffc             pea.l     -$4(a6)
  00dc30  486effde             pea.l     -$22(a6)
  00dc34  3f3c100e             move.w    #$100e, -(a7)
  00dc38  a9eb                 _Pack4_FP 
  00dc3a  486effec             pea.l     -$14(a6)
  00dc3e  486effde             pea.l     -$22(a6)
  00dc42  3f3c0808             move.w    #$808, -(a7)
  00dc46  a9eb                 _Pack4_FP 
  00dc48  6c06                 bge.b     $dc50
  00dc4a  740e                 moveq     #$e, d2
  00dc4c  60000462             bra.w     $e0b0
  00dc50  2d7cbfddd7dbffec     move.l    #$bfddd7db, -$14(a6)
  00dc58  2d7cf487fcb9fff0     move.l    #$f487fcb9, -$10(a6)
  00dc60  486efffc             pea.l     -$4(a6)
  00dc64  486effde             pea.l     -$22(a6)
  00dc68  3f3c100e             move.w    #$100e, -(a7)
  00dc6c  a9eb                 _Pack4_FP 
  00dc6e  486effec             pea.l     -$14(a6)
  00dc72  486effde             pea.l     -$22(a6)
  00dc76  3f3c0808             move.w    #$808, -(a7)
  00dc7a  a9eb                 _Pack4_FP 
  00dc7c  6c06                 bge.b     $dc84
  00dc7e  740f                 moveq     #$f, d2
  00dc80  6000042e             bra.w     $e0b0
  00dc84  2d7cbfd12546ffec     move.l    #$bfd12546, -$14(a6)
  00dc8c  2d7c0aa64c30fff0     move.l    #$aa64c30, -$10(a6)
  00dc94  486efffc             pea.l     -$4(a6)
  00dc98  486effde             pea.l     -$22(a6)
  00dc9c  3f3c100e             move.w    #$100e, -(a7)
  00dca0  a9eb                 _Pack4_FP 
  00dca2  486effec             pea.l     -$14(a6)
  00dca6  486effde             pea.l     -$22(a6)
  00dcaa  3f3c0808             move.w    #$808, -(a7)
  00dcae  a9eb                 _Pack4_FP 
  00dcb0  6c06                 bge.b     $dcb8
  00dcb2  7410                 moveq     #$10, d2
  00dcb4  600003fa             bra.w     $e0b0
  00dcb8  2d7cbfb66666ffec     move.l    #$bfb66666, -$14(a6)
  00dcc0  2d7c66666666fff0     move.l    #$66666666, -$10(a6)
  00dcc8  486efffc             pea.l     -$4(a6)
  00dccc  486effde             pea.l     -$22(a6)
  00dcd0  3f3c100e             move.w    #$100e, -(a7)
  00dcd4  a9eb                 _Pack4_FP 
  00dcd6  486effec             pea.l     -$14(a6)
  00dcda  486effde             pea.l     -$22(a6)
  00dcde  3f3c0808             move.w    #$808, -(a7)
  00dce2  a9eb                 _Pack4_FP 
  00dce4  6c06                 bge.b     $dcec
  00dce6  7411                 moveq     #$11, d2
  00dce8  600003c6             bra.w     $e0b0
  00dcec  7412                 moveq     #$12, d2
  00dcee  600003c0             bra.w     $e0b0
  00dcf2  42aeffe8             clr.l     -$18(a6)
  00dcf6  486efff8             pea.l     -$8(a6)
  00dcfa  486effde             pea.l     -$22(a6)
  00dcfe  3f3c100e             move.w    #$100e, -(a7)
  00dd02  a9eb                 _Pack4_FP 
  00dd04  486effe8             pea.l     -$18(a6)
  00dd08  486effde             pea.l     -$22(a6)
  00dd0c  3f3c1008             move.w    #$1008, -(a7)
  00dd10  a9eb                 _Pack4_FP 
  00dd12  6c0001d4             bge.w     $dee8
  00dd16  2d7c3fb66666ffec     move.l    #$3fb66666, -$14(a6)
  00dd1e  2d7c66666666fff0     move.l    #$66666666, -$10(a6)
  00dd26  486efffc             pea.l     -$4(a6)
  00dd2a  486effde             pea.l     -$22(a6)
  00dd2e  3f3c100e             move.w    #$100e, -(a7)
  00dd32  a9eb                 _Pack4_FP 
  00dd34  486effec             pea.l     -$14(a6)
  00dd38  486effde             pea.l     -$22(a6)
  00dd3c  3f3c0808             move.w    #$808, -(a7)
  00dd40  a9eb                 _Pack4_FP 
  00dd42  6c06                 bge.b     $dd4a
  00dd44  7412                 moveq     #$12, d2
  00dd46  60000368             bra.w     $e0b0
  00dd4a  2d7c3fd11eb8ffec     move.l    #$3fd11eb8, -$14(a6)
  00dd52  2d7c51eb851ffff0     move.l    #$51eb851f, -$10(a6)
  00dd5a  486efffc             pea.l     -$4(a6)
  00dd5e  486effde             pea.l     -$22(a6)
  00dd62  3f3c100e             move.w    #$100e, -(a7)
  00dd66  a9eb                 _Pack4_FP 
  00dd68  486effec             pea.l     -$14(a6)
  00dd6c  486effde             pea.l     -$22(a6)
  00dd70  3f3c0808             move.w    #$808, -(a7)
  00dd74  a9eb                 _Pack4_FP 
  00dd76  6c06                 bge.b     $dd7e
  00dd78  7413                 moveq     #$13, d2
  00dd7a  60000334             bra.w     $e0b0
  00dd7e  2d7c3fddd7dbffec     move.l    #$3fddd7db, -$14(a6)
  00dd86  2d7cf487fcb9fff0     move.l    #$f487fcb9, -$10(a6)
  00dd8e  486efffc             pea.l     -$4(a6)
  00dd92  486effde             pea.l     -$22(a6)
  00dd96  3f3c100e             move.w    #$100e, -(a7)
  00dd9a  a9eb                 _Pack4_FP 
  00dd9c  486effec             pea.l     -$14(a6)
  00dda0  486effde             pea.l     -$22(a6)
  00dda4  3f3c0808             move.w    #$808, -(a7)
  00dda8  a9eb                 _Pack4_FP 
  00ddaa  6c06                 bge.b     $ddb2
  00ddac  7414                 moveq     #$14, d2
  00ddae  60000300             bra.w     $e0b0
  00ddb2  2d7c3fe66809ffec     move.l    #$3fe66809, -$14(a6)
  00ddba  2d7cd495182bfff0     move.l    #$d495182b, -$10(a6)
  00ddc2  486efffc             pea.l     -$4(a6)
  00ddc6  486effde             pea.l     -$22(a6)
  00ddca  3f3c100e             move.w    #$100e, -(a7)
  00ddce  a9eb                 _Pack4_FP 
  00ddd0  486effec             pea.l     -$14(a6)
  00ddd4  486effde             pea.l     -$22(a6)
  00ddd8  3f3c0808             move.w    #$808, -(a7)
  00dddc  a9eb                 _Pack4_FP 
  00ddde  6c06                 bge.b     $dde6
  00dde0  7415                 moveq     #$15, d2
  00dde2  600002cc             bra.w     $e0b0
  00dde6  2d7c3f800000ffe8     move.l    #$3f800000, -$18(a6)
  00ddee  486efffc             pea.l     -$4(a6)
  00ddf2  486effde             pea.l     -$22(a6)
  00ddf6  3f3c100e             move.w    #$100e, -(a7)
  00ddfa  a9eb                 _Pack4_FP 
  00ddfc  486effe8             pea.l     -$18(a6)
  00de00  486effde             pea.l     -$22(a6)
  00de04  3f3c1008             move.w    #$1008, -(a7)
  00de08  a9eb                 _Pack4_FP 
  00de0a  6c06                 bge.b     $de12
  00de0c  7416                 moveq     #$16, d2
  00de0e  600002a0             bra.w     $e0b0
  00de12  2d7c3ff6d97fffec     move.l    #$3ff6d97f, -$14(a6)
  00de1a  2d7c62b6ae7dfff0     move.l    #$62b6ae7d, -$10(a6)
  00de22  486efffc             pea.l     -$4(a6)
  00de26  486effde             pea.l     -$22(a6)
  00de2a  3f3c100e             move.w    #$100e, -(a7)
  00de2e  a9eb                 _Pack4_FP 
  00de30  486effec             pea.l     -$14(a6)
  00de34  486effde             pea.l     -$22(a6)
  00de38  3f3c0808             move.w    #$808, -(a7)
  00de3c  a9eb                 _Pack4_FP 
  00de3e  6c06                 bge.b     $de46
  00de40  7417                 moveq     #$17, d2
  00de42  6000026c             bra.w     $e0b0
  00de46  2d7c400127efffec     move.l    #$400127ef, -$14(a6)
  00de4e  2d7c9db22d0efff0     move.l    #$9db22d0e, -$10(a6)
  00de56  486efffc             pea.l     -$4(a6)
  00de5a  486effde             pea.l     -$22(a6)
  00de5e  3f3c100e             move.w    #$100e, -(a7)
  00de62  a9eb                 _Pack4_FP 
  00de64  486effec             pea.l     -$14(a6)
  00de68  486effde             pea.l     -$22(a6)
  00de6c  3f3c0808             move.w    #$808, -(a7)
  00de70  a9eb                 _Pack4_FP 
  00de72  6c06                 bge.b     $de7a
  00de74  7418                 moveq     #$18, d2
  00de76  60000238             bra.w     $e0b0
  00de7a  2d7c400ddb22ffec     move.l    #$400ddb22, -$14(a6)
  00de82  2d7cd0e56042fff0     move.l    #$d0e56042, -$10(a6)
  00de8a  486efffc             pea.l     -$4(a6)
  00de8e  486effde             pea.l     -$22(a6)
  00de92  3f3c100e             move.w    #$100e, -(a7)
  00de96  a9eb                 _Pack4_FP 
  00de98  486effec             pea.l     -$14(a6)
  00de9c  486effde             pea.l     -$22(a6)
  00dea0  3f3c0808             move.w    #$808, -(a7)
  00dea4  a9eb                 _Pack4_FP 
  00dea6  6c06                 bge.b     $deae
  00dea8  7419                 moveq     #$19, d2
  00deaa  60000204             bra.w     $e0b0
  00deae  2d7c4026dc28ffec     move.l    #$4026dc28, -$14(a6)
  00deb6  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00debe  486efffc             pea.l     -$4(a6)
  00dec2  486effde             pea.l     -$22(a6)
  00dec6  3f3c100e             move.w    #$100e, -(a7)
  00deca  a9eb                 _Pack4_FP 
  00decc  486effec             pea.l     -$14(a6)
  00ded0  486effde             pea.l     -$22(a6)
  00ded4  3f3c0808             move.w    #$808, -(a7)
  00ded8  a9eb                 _Pack4_FP 
  00deda  6c06                 bge.b     $dee2
  00dedc  741a                 moveq     #$1a, d2
  00dede  600001d0             bra.w     $e0b0
  00dee2  741b                 moveq     #$1b, d2
  00dee4  600001ca             bra.w     $e0b0
  00dee8  2d7cc026dc28ffec     move.l    #$c026dc28, -$14(a6)
  00def0  2d7cf5c28f5cfff0     move.l    #$f5c28f5c, -$10(a6)
  00def8  486efffc             pea.l     -$4(a6)
  00defc  486effde             pea.l     -$22(a6)
  00df00  3f3c100e             move.w    #$100e, -(a7)
  00df04  a9eb                 _Pack4_FP 
  00df06  486effec             pea.l     -$14(a6)
  00df0a  486effde             pea.l     -$22(a6)
  00df0e  3f3c0808             move.w    #$808, -(a7)
  00df12  a9eb                 _Pack4_FP 
  00df14  6c06                 bge.b     $df1c
  00df16  741b                 moveq     #$1b, d2
  00df18  60000196             bra.w     $e0b0
  00df1c  2d7cc00ddb22ffec     move.l    #$c00ddb22, -$14(a6)
  00df24  2d7cd0e56042fff0     move.l    #$d0e56042, -$10(a6)
  00df2c  486efffc             pea.l     -$4(a6)
  00df30  486effde             pea.l     -$22(a6)
  00df34  3f3c100e             move.w    #$100e, -(a7)
  00df38  a9eb                 _Pack4_FP 
  00df3a  486effec             pea.l     -$14(a6)
  00df3e  486effde             pea.l     -$22(a6)
  00df42  3f3c0808             move.w    #$808, -(a7)
  00df46  a9eb                 _Pack4_FP 
  00df48  6c06                 bge.b     $df50
  00df4a  741c                 moveq     #$1c, d2
  00df4c  60000162             bra.w     $e0b0
  00df50  2d7cc00127efffec     move.l    #$c00127ef, -$14(a6)
  00df58  2d7c9db22d0efff0     move.l    #$9db22d0e, -$10(a6)
  00df60  486efffc             pea.l     -$4(a6)
  00df64  486effde             pea.l     -$22(a6)
  00df68  3f3c100e             move.w    #$100e, -(a7)
  00df6c  a9eb                 _Pack4_FP 
  00df6e  486effec             pea.l     -$14(a6)
  00df72  486effde             pea.l     -$22(a6)
  00df76  3f3c0808             move.w    #$808, -(a7)
  00df7a  a9eb                 _Pack4_FP 
  00df7c  6c06                 bge.b     $df84
  00df7e  741d                 moveq     #$1d, d2
  00df80  6000012e             bra.w     $e0b0
  00df84  2d7cbff6d97fffec     move.l    #$bff6d97f, -$14(a6)
  00df8c  2d7c62b6ae7dfff0     move.l    #$62b6ae7d, -$10(a6)
  00df94  486efffc             pea.l     -$4(a6)
  00df98  486effde             pea.l     -$22(a6)
  00df9c  3f3c100e             move.w    #$100e, -(a7)
  00dfa0  a9eb                 _Pack4_FP 
  00dfa2  486effec             pea.l     -$14(a6)
  00dfa6  486effde             pea.l     -$22(a6)
  00dfaa  3f3c0808             move.w    #$808, -(a7)
  00dfae  a9eb                 _Pack4_FP 
  00dfb0  6c06                 bge.b     $dfb8
  00dfb2  741e                 moveq     #$1e, d2
  00dfb4  600000fa             bra.w     $e0b0
  00dfb8  2d7cbf800000ffe8     move.l    #$bf800000, -$18(a6)
  00dfc0  486efffc             pea.l     -$4(a6)
  00dfc4  486effde             pea.l     -$22(a6)
  00dfc8  3f3c100e             move.w    #$100e, -(a7)
  00dfcc  a9eb                 _Pack4_FP 
  00dfce  486effe8             pea.l     -$18(a6)
  00dfd2  486effde             pea.l     -$22(a6)
  00dfd6  3f3c1008             move.w    #$1008, -(a7)
  00dfda  a9eb                 _Pack4_FP 
  00dfdc  6c06                 bge.b     $dfe4
  00dfde  741f                 moveq     #$1f, d2
  00dfe0  600000ce             bra.w     $e0b0
  00dfe4  2d7cbfe66809ffec     move.l    #$bfe66809, -$14(a6)
  00dfec  2d7cd495182bfff0     move.l    #$d495182b, -$10(a6)
  00dff4  486efffc             pea.l     -$4(a6)
  00dff8  486effde             pea.l     -$22(a6)
  00dffc  3f3c100e             move.w    #$100e, -(a7)
  00e000  a9eb                 _Pack4_FP 
  00e002  486effec             pea.l     -$14(a6)
  00e006  486effde             pea.l     -$22(a6)
  00e00a  3f3c0808             move.w    #$808, -(a7)
  00e00e  a9eb                 _Pack4_FP 
  00e010  6c06                 bge.b     $e018
  00e012  7420                 moveq     #$20, d2
  00e014  6000009a             bra.w     $e0b0
  00e018  2d7cbfddd7dbffec     move.l    #$bfddd7db, -$14(a6)
  00e020  2d7cf487fcb9fff0     move.l    #$f487fcb9, -$10(a6)
  00e028  486efffc             pea.l     -$4(a6)
  00e02c  486effde             pea.l     -$22(a6)
  00e030  3f3c100e             move.w    #$100e, -(a7)
  00e034  a9eb                 _Pack4_FP 
  00e036  486effec             pea.l     -$14(a6)
  00e03a  486effde             pea.l     -$22(a6)
  00e03e  3f3c0808             move.w    #$808, -(a7)
  00e042  a9eb                 _Pack4_FP 
  00e044  6c04                 bge.b     $e04a
  00e046  7421                 moveq     #$21, d2
  00e048  6066                 bra.b     $e0b0
  00e04a  2d7cbfd12546ffec     move.l    #$bfd12546, -$14(a6)
  00e052  2d7c0aa64c30fff0     move.l    #$aa64c30, -$10(a6)
  00e05a  486efffc             pea.l     -$4(a6)
  00e05e  486effde             pea.l     -$22(a6)
  00e062  3f3c100e             move.w    #$100e, -(a7)
  00e066  a9eb                 _Pack4_FP 
  00e068  486effec             pea.l     -$14(a6)
  00e06c  486effde             pea.l     -$22(a6)
  00e070  3f3c0808             move.w    #$808, -(a7)
  00e074  a9eb                 _Pack4_FP 
  00e076  6c04                 bge.b     $e07c
  00e078  7422                 moveq     #$22, d2
  00e07a  6034                 bra.b     $e0b0
  00e07c  2d7cbfb66666ffec     move.l    #$bfb66666, -$14(a6)
  00e084  2d7c66666666fff0     move.l    #$66666666, -$10(a6)
  00e08c  486efffc             pea.l     -$4(a6)
  00e090  486effde             pea.l     -$22(a6)
  00e094  3f3c100e             move.w    #$100e, -(a7)
  00e098  a9eb                 _Pack4_FP 
  00e09a  486effec             pea.l     -$14(a6)
  00e09e  486effde             pea.l     -$22(a6)
  00e0a2  3f3c0808             move.w    #$808, -(a7)
  00e0a6  a9eb                 _Pack4_FP 
  00e0a8  6c04                 bge.b     $e0ae
  00e0aa  7423                 moveq     #$23, d2
  00e0ac  6002                 bra.b     $e0b0
  00e0ae  7400                 moveq     #$0, d2
  00e0b0  3002                 move.w    d2, d0
  00e0b2  4cdf0070             movem.l   (a7)+, d4-d6
  00e0b6  4e5e                 unlk      a6
  00e0b8  4e75                 rts       

;-------------------------------------------------------------
; HandleHalfPipe   (seg 2 +00e0d8, 728 bytes)
  00e0d8  4e56fff4             link.w    a6, #$fff4
  00e0dc  48e71f20             movem.l   d3-d7/a2, -(a7)
  00e0e0  246e0008             movea.l   $8(a6), a2
  00e0e4  362e000c             move.w    $c(a6), d3
  00e0e8  3a3c0090             move.w    #$90, d5
  00e0ec  7c30                 moveq     #$30, d6
  00e0ee  3003                 move.w    d3, d0
  00e0f0  48c0                 ext.l     d0
  00e0f2  222a005e             move.l    $5e(a2), d1
  00e0f6  e081                 asr.l     #$8, d1
  00e0f8  d280                 add.l     d0, d1
  00e0fa  3d41fffe             move.w    d1, -$2(a6)
  00e0fe  3003                 move.w    d3, d0
  00e100  48c0                 ext.l     d0
  00e102  222a0062             move.l    $62(a2), d1
  00e106  e081                 asr.l     #$8, d1
  00e108  d280                 add.l     d0, d1
  00e10a  3d41fffc             move.w    d1, -$4(a6)
  00e10e  302efffe             move.w    -$2(a6), d0
  00e112  48c0                 ext.l     d0
  00e114  ea80                 asr.l     #$5, d0
  00e116  3d40fffa             move.w    d0, -$6(a6)
  00e11a  302efffc             move.w    -$4(a6), d0
  00e11e  48c0                 ext.l     d0
  00e120  ea80                 asr.l     #$5, d0
  00e122  3d40fff8             move.w    d0, -$8(a6)
  00e126  302efffa             move.w    -$6(a6), d0
  00e12a  48c0                 ext.l     d0
  00e12c  eb88                 lsl.l     #$5, d0
  00e12e  7210                 moveq     #$10, d1
  00e130  d081                 add.l     d1, d0
  00e132  3d40fff6             move.w    d0, -$a(a6)
  00e136  302efff8             move.w    -$8(a6), d0
  00e13a  48c0                 ext.l     d0
  00e13c  eb88                 lsl.l     #$5, d0
  00e13e  7210                 moveq     #$10, d1
  00e140  d081                 add.l     d1, d0
  00e142  3d40fff4             move.w    d0, -$c(a6)
  00e146  3f2efff8             move.w    -$8(a6), -(a7)
  00e14a  3f2efffa             move.w    -$6(a6), -(a7)
  00e14e  61ffffff9f44         bsr.l     $8094   ; GetBGTile
  00e154  584f                 addq.w    #$4, a7
  00e156  3f00                 move.w    d0, -(a7)
  00e158  61ffffffe2de         bsr.l     $c438   ; LookupBGTileKind
  00e15e  3600                 move.w    d0, d3
  00e160  4a6a008e             tst.w     $8e(a2)
  00e164  544f                 addq.w    #$2, a7
  00e166  6714                 beq.b     $e17c
  00e168  0c6a0017008e         cmpi.w    #$17, $8e(a2)
  00e16e  6f000228             ble.w     $e398
  00e172  0c6a00c8008e         cmpi.w    #$c8, $8e(a2)
  00e178  6c00021e             bge.w     $e398
  00e17c  7e00                 moveq     #$0, d7
  00e17e  0c430008             cmpi.w    #$8, d3
  00e182  6d0000e2             blt.w     $e266
  00e186  0c43000c             cmpi.w    #$c, d3
  00e18a  6d10                 blt.b     $e19c
  00e18c  302efffc             move.w    -$4(a6), d0
  00e190  48c0                 ext.l     d0
  00e192  382efff4             move.w    -$c(a6), d4
  00e196  48c4                 ext.l     d4
  00e198  9880                 sub.l     d0, d4
  00e19a  600e                 bra.b     $e1aa
  00e19c  302efffe             move.w    -$2(a6), d0
  00e1a0  48c0                 ext.l     d0
  00e1a2  382efff6             move.w    -$a(a6), d4
  00e1a6  48c4                 ext.l     d4
  00e1a8  9880                 sub.l     d0, d4
  00e1aa  b5f900008070         cmpa.l    $8070.l, a2   ; playerSprite
  00e1b0  6708                 beq.b     $e1ba
  00e1b2  7a60                 moveq     #$60, d5
  00e1b4  7c20                 moveq     #$20, d6
  00e1b6  d844                 add.w     d4, d4
  00e1b8  6006                 bra.b     $e1c0
  00e1ba  48c4                 ext.l     d4
  00e1bc  c9fc0003             muls.w    #$3, d4
  00e1c0  3003                 move.w    d3, d0
  00e1c2  48c0                 ext.l     d0
  00e1c4  5180                 subq.l    #$8, d0
  00e1c6  0c8000000007         cmpi.l    #$7, d0
  00e1cc  62000098             bhi.w     $e266
  00e1d0  303b0206             move.w    $e1d8(pc, d0.w * 2), d0
  00e1d4  4efb0002             jmp       $e1d8(pc, d0.w)
  00e1d8  00100020003000400050006000700080 cases     0:$e1e8 1:$e1f8 2:$e208 3:$e218 4:$e228 5:$e238 6:$e248 7:$e258
  00e1e8  3004                 move.w    d4, d0
  00e1ea  48c0                 ext.l     d0
  00e1ec  3205                 move.w    d5, d1
  00e1ee  48c1                 ext.l     d1
  00e1f0  d280                 add.l     d0, d1
  00e1f2  d36a0050             add.w     d1, $50(a2)
  00e1f6  606e                 bra.b     $e266
  00e1f8  3004                 move.w    d4, d0
  00e1fa  48c0                 ext.l     d0
  00e1fc  3206                 move.w    d6, d1
  00e1fe  48c1                 ext.l     d1
  00e200  d280                 add.l     d0, d1
  00e202  d36a0050             add.w     d1, $50(a2)
  00e206  605e                 bra.b     $e266
  00e208  3004                 move.w    d4, d0
  00e20a  48c0                 ext.l     d0
  00e20c  3206                 move.w    d6, d1
  00e20e  48c1                 ext.l     d1
  00e210  9280                 sub.l     d0, d1
  00e212  936a0050             sub.w     d1, $50(a2)
  00e216  604e                 bra.b     $e266
  00e218  3004                 move.w    d4, d0
  00e21a  48c0                 ext.l     d0
  00e21c  3205                 move.w    d5, d1
  00e21e  48c1                 ext.l     d1
  00e220  9280                 sub.l     d0, d1
  00e222  936a0050             sub.w     d1, $50(a2)
  00e226  603e                 bra.b     $e266
  00e228  3004                 move.w    d4, d0
  00e22a  48c0                 ext.l     d0
  00e22c  3205                 move.w    d5, d1
  00e22e  48c1                 ext.l     d1
  00e230  d280                 add.l     d0, d1
  00e232  d36a004e             add.w     d1, $4e(a2)
  00e236  602e                 bra.b     $e266
  00e238  3004                 move.w    d4, d0
  00e23a  48c0                 ext.l     d0
  00e23c  3206                 move.w    d6, d1
  00e23e  48c1                 ext.l     d1
  00e240  d280                 add.l     d0, d1
  00e242  d36a004e             add.w     d1, $4e(a2)
  00e246  601e                 bra.b     $e266
  00e248  3004                 move.w    d4, d0
  00e24a  48c0                 ext.l     d0
  00e24c  3206                 move.w    d6, d1
  00e24e  48c1                 ext.l     d1
  00e250  9280                 sub.l     d0, d1
  00e252  936a004e             sub.w     d1, $4e(a2)
  00e256  600e                 bra.b     $e266
  00e258  3004                 move.w    d4, d0
  00e25a  48c0                 ext.l     d0
  00e25c  3205                 move.w    d5, d1
  00e25e  48c1                 ext.l     d1
  00e260  9280                 sub.l     d0, d1
  00e262  936a004e             sub.w     d1, $4e(a2)
  00e266  0c6a0008009c         cmpi.w    #$8, $9c(a2)
  00e26c  6d7a                 blt.b     $e2e8
  00e26e  0c6a000f009c         cmpi.w    #$f, $9c(a2)
  00e274  6e72                 bgt.b     $e2e8
  00e276  302a009c             move.w    $9c(a2), d0
  00e27a  48c0                 ext.l     d0
  00e27c  5180                 subq.l    #$8, d0
  00e27e  6710                 beq.b     $e290
  00e280  5780                 subq.l    #$3, d0
  00e282  6722                 beq.b     $e2a6
  00e284  5380                 subq.l    #$1, d0
  00e286  6734                 beq.b     $e2bc
  00e288  5780                 subq.l    #$3, d0
  00e28a  6746                 beq.b     $e2d2
  00e28c  600000ee             bra.w     $e37c
  00e290  0c430008             cmpi.w    #$8, d3
  00e294  670000e6             beq.w     $e37c
  00e298  4a6a0050             tst.w     $50(a2)
  00e29c  6c0000de             bge.w     $e37c
  00e2a0  7e01                 moveq     #$1, d7
  00e2a2  600000d8             bra.w     $e37c
  00e2a6  0c43000b             cmpi.w    #$b, d3
  00e2aa  670000d0             beq.w     $e37c
  00e2ae  4a6a0050             tst.w     $50(a2)
  00e2b2  6f0000c8             ble.w     $e37c
  00e2b6  7e01                 moveq     #$1, d7
  00e2b8  600000c2             bra.w     $e37c
  00e2bc  0c43000c             cmpi.w    #$c, d3
  00e2c0  670000ba             beq.w     $e37c
  00e2c4  4a6a004e             tst.w     $4e(a2)
  00e2c8  6c0000b2             bge.w     $e37c
  00e2cc  7e01                 moveq     #$1, d7
  00e2ce  600000ac             bra.w     $e37c
  00e2d2  0c43000f             cmpi.w    #$f, d3
  00e2d6  670000a4             beq.w     $e37c
  00e2da  4a6a004e             tst.w     $4e(a2)
  00e2de  6f00009c             ble.w     $e37c
  00e2e2  7e01                 moveq     #$1, d7
  00e2e4  60000096             bra.w     $e37c
  00e2e8  0c430008             cmpi.w    #$8, d3
  00e2ec  6610                 bne.b     $e2fe
  00e2ee  302efffe             move.w    -$2(a6), d0
  00e2f2  b06efff6             cmp.w     -$a(a6), d0
  00e2f6  6c06                 bge.b     $e2fe
  00e2f8  4a6a0050             tst.w     $50(a2)
  00e2fc  6e42                 bgt.b     $e340
  00e2fe  0c43000b             cmpi.w    #$b, d3
  00e302  6610                 bne.b     $e314
  00e304  302efffe             move.w    -$2(a6), d0
  00e308  b06efff6             cmp.w     -$a(a6), d0
  00e30c  6f06                 ble.b     $e314
  00e30e  4a6a0050             tst.w     $50(a2)
  00e312  6d2c                 blt.b     $e340
  00e314  0c43000f             cmpi.w    #$f, d3
  00e318  6610                 bne.b     $e32a
  00e31a  302efffc             move.w    -$4(a6), d0
  00e31e  b06efff4             cmp.w     -$c(a6), d0
  00e322  6f06                 ble.b     $e32a
  00e324  4a6a004e             tst.w     $4e(a2)
  00e328  6d16                 blt.b     $e340
  00e32a  0c43000c             cmpi.w    #$c, d3
  00e32e  664c                 bne.b     $e37c
  00e330  302efffc             move.w    -$4(a6), d0
  00e334  b06efff4             cmp.w     -$c(a6), d0
  00e338  6c42                 bge.b     $e37c
  00e33a  4a6a004e             tst.w     $4e(a2)
  00e33e  6f3c                 ble.b     $e37c
  00e340  357c00d7008e         move.w    #$d7, $8e(a2)
  00e346  0c430008             cmpi.w    #$8, d3
  00e34a  6608                 bne.b     $e354
  00e34c  357c26af0090         move.w    #$26af, $90(a2)
  00e352  6028                 bra.b     $e37c
  00e354  0c43000b             cmpi.w    #$b, d3
  00e358  6608                 bne.b     $e362
  00e35a  357c26b00090         move.w    #$26b0, $90(a2)
  00e360  601a                 bra.b     $e37c
  00e362  0c43000f             cmpi.w    #$f, d3
  00e366  6608                 bne.b     $e370
  00e368  357c26ae0090         move.w    #$26ae, $90(a2)
  00e36e  600c                 bra.b     $e37c
  00e370  0c43000c             cmpi.w    #$c, d3
  00e374  6606                 bne.b     $e37c
  00e376  357c26ad0090         move.w    #$26ad, $90(a2)
  00e37c  4a07                 tst.b     d7
  00e37e  6718                 beq.b     $e398
  00e380  357c0001008e         move.w    #$1, $8e(a2)
  00e386  2f3c00640100         move.l    #$640100, -(a7)
  00e38c  2f2e000e             move.l    $e(a6), -(a7)
  00e390  61ffffffa6d8         bsr.l     $8a6a   ; STPlayRegSound
  00e396  504f                 addq.w    #$8, a7
  00e398  356efffa0098         move.w    -$6(a6), $98(a2)
  00e39e  356efff8009a         move.w    -$8(a6), $9a(a2)
  00e3a4  3543009c             move.w    d3, $9c(a2)
  00e3a8  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  00e3ac  4e5e                 unlk      a6
  00e3ae  4e75                 rts       

;-------------------------------------------------------------
; HandleGlide   (seg 2 +00e3c2, 394 bytes)
  00e3c2  4e560000             link.w    a6, #$0
  00e3c6  48e71c20             movem.l   d3-d5/a2, -(a7)
  00e3ca  246e0008             movea.l   $8(a6), a2
  00e3ce  362e000c             move.w    $c(a6), d3
  00e3d2  4a6a008e             tst.w     $8e(a2)
  00e3d6  6714                 beq.b     $e3ec
  00e3d8  0c6a0017008e         cmpi.w    #$17, $8e(a2)
  00e3de  6f000164             ble.w     $e544
  00e3e2  0c6a00c8008e         cmpi.w    #$c8, $8e(a2)
  00e3e8  6c00015a             bge.w     $e544
  00e3ec  3003                 move.w    d3, d0
  00e3ee  48c0                 ext.l     d0
  00e3f0  282a005e             move.l    $5e(a2), d4
  00e3f4  e084                 asr.l     #$8, d4
  00e3f6  d880                 add.l     d0, d4
  00e3f8  3003                 move.w    d3, d0
  00e3fa  48c0                 ext.l     d0
  00e3fc  2a2a0062             move.l    $62(a2), d5
  00e400  e085                 asr.l     #$8, d5
  00e402  da80                 add.l     d0, d5
  00e404  3604                 move.w    d4, d3
  00e406  48c3                 ext.l     d3
  00e408  ea83                 asr.l     #$5, d3
  00e40a  3805                 move.w    d5, d4
  00e40c  48c4                 ext.l     d4
  00e40e  ea84                 asr.l     #$5, d4
  00e410  3f04                 move.w    d4, -(a7)
  00e412  3f03                 move.w    d3, -(a7)
  00e414  61ffffff9c7e         bsr.l     $8094   ; GetBGTile
  00e41a  584f                 addq.w    #$4, a7
  00e41c  3f00                 move.w    d0, -(a7)
  00e41e  61ffffffe018         bsr.l     $c438   ; LookupBGTileKind
  00e424  3a00                 move.w    d0, d5
  00e426  3005                 move.w    d5, d0
  00e428  48c0                 ext.l     d0
  00e42a  544f                 addq.w    #$2, a7
  00e42c  5580                 subq.l    #$2, d0
  00e42e  6704                 beq.b     $e434
  00e430  6000008e             bra.w     $e4c0
  00e434  363900007e24         move.w    $7e24.l, d3   ; g_7e24
  00e43a  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e440  6d0a                 blt.b     $e44c
  00e442  48c3                 ext.l     d3
  00e444  068300000100         addi.l    #$100, d3
  00e44a  e283                 asr.l     #$1, d3
  00e44c  4a6a0050             tst.w     $50(a2)
  00e450  6f08                 ble.b     $e45a
  00e452  302a0050             move.w    $50(a2), d0
  00e456  48c0                 ext.l     d0
  00e458  6008                 bra.b     $e462
  00e45a  302a0050             move.w    $50(a2), d0
  00e45e  48c0                 ext.l     d0
  00e460  4480                 neg.l     d0
  00e462  7218                 moveq     #$18, d1
  00e464  b081                 cmp.l     d1, d0
  00e466  6f0e                 ble.b     $e476
  00e468  302a0050             move.w    $50(a2), d0
  00e46c  c1c3                 muls.w    d3, d0
  00e46e  e080                 asr.l     #$8, d0
  00e470  35400050             move.w    d0, $50(a2)
  00e474  600c                 bra.b     $e482
  00e476  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e47c  6c04                 bge.b     $e482
  00e47e  426a0050             clr.w     $50(a2)
  00e482  4a6a004e             tst.w     $4e(a2)
  00e486  6f08                 ble.b     $e490
  00e488  302a004e             move.w    $4e(a2), d0
  00e48c  48c0                 ext.l     d0
  00e48e  6008                 bra.b     $e498
  00e490  302a004e             move.w    $4e(a2), d0
  00e494  48c0                 ext.l     d0
  00e496  4480                 neg.l     d0
  00e498  7218                 moveq     #$18, d1
  00e49a  b081                 cmp.l     d1, d0
  00e49c  6f10                 ble.b     $e4ae
  00e49e  302a004e             move.w    $4e(a2), d0
  00e4a2  c1c3                 muls.w    d3, d0
  00e4a4  e080                 asr.l     #$8, d0
  00e4a6  3540004e             move.w    d0, $4e(a2)
  00e4aa  60000098             bra.w     $e544
  00e4ae  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e4b4  6c00008e             bge.w     $e544
  00e4b8  426a004e             clr.w     $4e(a2)
  00e4bc  60000086             bra.w     $e544
  00e4c0  363900007e22         move.w    $7e22.l, d3   ; g_7e22
  00e4c6  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e4cc  6d0a                 blt.b     $e4d8
  00e4ce  48c3                 ext.l     d3
  00e4d0  068300000100         addi.l    #$100, d3
  00e4d6  e283                 asr.l     #$1, d3
  00e4d8  4a6a0050             tst.w     $50(a2)
  00e4dc  6f08                 ble.b     $e4e6
  00e4de  302a0050             move.w    $50(a2), d0
  00e4e2  48c0                 ext.l     d0
  00e4e4  6008                 bra.b     $e4ee
  00e4e6  302a0050             move.w    $50(a2), d0
  00e4ea  48c0                 ext.l     d0
  00e4ec  4480                 neg.l     d0
  00e4ee  7218                 moveq     #$18, d1
  00e4f0  b081                 cmp.l     d1, d0
  00e4f2  6f0e                 ble.b     $e502
  00e4f4  302a0050             move.w    $50(a2), d0
  00e4f8  c1c3                 muls.w    d3, d0
  00e4fa  e080                 asr.l     #$8, d0
  00e4fc  35400050             move.w    d0, $50(a2)
  00e500  600c                 bra.b     $e50e
  00e502  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e508  6c04                 bge.b     $e50e
  00e50a  426a0050             clr.w     $50(a2)
  00e50e  4a6a004e             tst.w     $4e(a2)
  00e512  6f08                 ble.b     $e51c
  00e514  302a004e             move.w    $4e(a2), d0
  00e518  48c0                 ext.l     d0
  00e51a  6008                 bra.b     $e524
  00e51c  302a004e             move.w    $4e(a2), d0
  00e520  48c0                 ext.l     d0
  00e522  4480                 neg.l     d0
  00e524  7218                 moveq     #$18, d1
  00e526  b081                 cmp.l     d1, d0
  00e528  6f0e                 ble.b     $e538
  00e52a  302a004e             move.w    $4e(a2), d0
  00e52e  c1c3                 muls.w    d3, d0
  00e530  e080                 asr.l     #$8, d0
  00e532  3540004e             move.w    d0, $4e(a2)
  00e536  600c                 bra.b     $e544
  00e538  0c6a0058009c         cmpi.w    #$58, $9c(a2)
  00e53e  6c04                 bge.b     $e544
  00e540  426a004e             clr.w     $4e(a2)
  00e544  4cdf0438             movem.l   (a7)+, d3-d5/a2
  00e548  4e5e                 unlk      a6
  00e54a  4e75                 rts       

;-------------------------------------------------------------
; RedrawGameArea   (seg 2 +00e55a, 128 bytes)
  00e55a  4e560000             link.w    a6, #$0
  00e55e  4a3900006174         tst.b     $6174.l   ; prefInterlace
  00e564  6748                 beq.b     $e5ae
  00e566  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  00e56c  6640                 bne.b     $e5ae
  00e56e  4a39000046cd         tst.b     $46cd.l   ; g_46cd
  00e574  6738                 beq.b     $e5ae
  00e576  61ffffff1a94         bsr.l     $c   ; DrawBlackLines
  00e57c  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  00e582  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  00e588  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  00e58e  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  00e594  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  00e59a  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  00e5a0  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  00e5a6  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  00e5ac  6028                 bra.b     $e5d6
  00e5ae  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  00e5b4  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  00e5ba  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  00e5c0  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  00e5c6  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  00e5cc  4227                 clr.b     -(a7)
  00e5ce  4227                 clr.b     -(a7)
  00e5d0  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  00e5d6  4e5e                 unlk      a6
  00e5d8  4e75                 rts       

;-------------------------------------------------------------
; HBounce   (seg 2 +00e5ec, 484 bytes)
  00e5ec  4e56ffdc             link.w    a6, #$ffdc
  00e5f0  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  00e5f4  246e0008             movea.l   $8(a6), a2
  00e5f8  266e000c             movea.l   $c(a6), a3
  00e5fc  382e0010             move.w    $10(a6), d4
  00e600  262e0012             move.l    $12(a6), d3
  00e604  286e0016             movea.l   $16(a6), a4
  00e608  486efff8             pea.l     -$8(a6)
  00e60c  302b0008             move.w    $8(a3), d0
  00e610  48c0                 ext.l     d0
  00e612  322b005c             move.w    $5c(a3), d1
  00e616  48c1                 ext.l     d1
  00e618  d280                 add.l     d0, d1
  00e61a  3f01                 move.w    d1, -(a7)
  00e61c  302b0006             move.w    $6(a3), d0
  00e620  48c0                 ext.l     d0
  00e622  322b005a             move.w    $5a(a3), d1
  00e626  48c1                 ext.l     d1
  00e628  d280                 add.l     d0, d1
  00e62a  3f01                 move.w    d1, -(a7)
  00e62c  302b000c             move.w    $c(a3), d0
  00e630  48c0                 ext.l     d0
  00e632  322b005c             move.w    $5c(a3), d1
  00e636  48c1                 ext.l     d1
  00e638  d280                 add.l     d0, d1
  00e63a  3f01                 move.w    d1, -(a7)
  00e63c  302b000a             move.w    $a(a3), d0
  00e640  48c0                 ext.l     d0
  00e642  322b005a             move.w    $5a(a3), d1
  00e646  48c1                 ext.l     d1
  00e648  d280                 add.l     d0, d1
  00e64a  3f01                 move.w    d1, -(a7)
  00e64c  a8a7                 _SetRect  
  00e64e  486effe4             pea.l     -$1c(a6)
  00e652  302c0002             move.w    $2(a4), d0
  00e656  48c0                 ext.l     d0
  00e658  322a005c             move.w    $5c(a2), d1
  00e65c  48c1                 ext.l     d1
  00e65e  d280                 add.l     d0, d1
  00e660  3f01                 move.w    d1, -(a7)
  00e662  3014                 move.w    (a4), d0
  00e664  48c0                 ext.l     d0
  00e666  322a005a             move.w    $5a(a2), d1
  00e66a  48c1                 ext.l     d1
  00e66c  d280                 add.l     d0, d1
  00e66e  3f01                 move.w    d1, -(a7)
  00e670  302c0006             move.w    $6(a4), d0
  00e674  48c0                 ext.l     d0
  00e676  322a005c             move.w    $5c(a2), d1
  00e67a  48c1                 ext.l     d1
  00e67c  d280                 add.l     d0, d1
  00e67e  3f01                 move.w    d1, -(a7)
  00e680  302c0004             move.w    $4(a4), d0
  00e684  48c0                 ext.l     d0
  00e686  322a005a             move.w    $5a(a2), d1
  00e68a  48c1                 ext.l     d1
  00e68c  d280                 add.l     d0, d1
  00e68e  3f01                 move.w    d1, -(a7)
  00e690  a8a7                 _SetRect  
  00e692  554f                 subq.w    #$2, a7
  00e694  486effe4             pea.l     -$1c(a6)
  00e698  486efff8             pea.l     -$8(a6)
  00e69c  486effdc             pea.l     -$24(a6)
  00e6a0  a8aa                 _SectRect 
  00e6a2  101f                 move.b    (a7)+, d0
  00e6a4  67000122             beq.w     $e7c8
  00e6a8  3004                 move.w    d4, d0
  00e6aa  48c0                 ext.l     d0
  00e6ac  322a005c             move.w    $5c(a2), d1
  00e6b0  48c1                 ext.l     d1
  00e6b2  d280                 add.l     d0, d1
  00e6b4  3d41fff2             move.w    d1, -$e(a6)
  00e6b8  3004                 move.w    d4, d0
  00e6ba  48c0                 ext.l     d0
  00e6bc  322a005a             move.w    $5a(a2), d1
  00e6c0  48c1                 ext.l     d1
  00e6c2  d280                 add.l     d0, d1
  00e6c4  3d41fff0             move.w    d1, -$10(a6)
  00e6c8  302b0008             move.w    $8(a3), d0
  00e6cc  48c0                 ext.l     d0
  00e6ce  322b000c             move.w    $c(a3), d1
  00e6d2  48c1                 ext.l     d1
  00e6d4  9280                 sub.l     d0, d1
  00e6d6  e281                 asr.l     #$1, d1
  00e6d8  302b0008             move.w    $8(a3), d0
  00e6dc  48c0                 ext.l     d0
  00e6de  342b005c             move.w    $5c(a3), d2
  00e6e2  48c2                 ext.l     d2
  00e6e4  d480                 add.l     d0, d2
  00e6e6  d481                 add.l     d1, d2
  00e6e8  3d42ffee             move.w    d2, -$12(a6)
  00e6ec  302b0006             move.w    $6(a3), d0
  00e6f0  48c0                 ext.l     d0
  00e6f2  322b000a             move.w    $a(a3), d1
  00e6f6  48c1                 ext.l     d1
  00e6f8  9280                 sub.l     d0, d1
  00e6fa  e281                 asr.l     #$1, d1
  00e6fc  302b0006             move.w    $6(a3), d0
  00e700  48c0                 ext.l     d0
  00e702  342b005a             move.w    $5a(a3), d2
  00e706  48c2                 ext.l     d2
  00e708  d480                 add.l     d0, d2
  00e70a  d481                 add.l     d1, d2
  00e70c  3d42ffec             move.w    d2, -$14(a6)
  00e710  3d6a005cfff6         move.w    $5c(a2), -$a(a6)
  00e716  3d6a005afff4         move.w    $5a(a2), -$c(a6)
  00e71c  302efff2             move.w    -$e(a6), d0
  00e720  b06effee             cmp.w     -$12(a6), d0
  00e724  6c3c                 bge.b     $e762
  00e726  4a6a0050             tst.w     $50(a2)
  00e72a  6f22                 ble.b     $e74e
  00e72c  302a0050             move.w    $50(a2), d0
  00e730  48c0                 ext.l     d0
  00e732  4c030800             muls.l    d3, d0
  00e736  4480                 neg.l     d0
  00e738  e080                 asr.l     #$8, d0
  00e73a  35400050             move.w    d0, $50(a2)
  00e73e  302a004e             move.w    $4e(a2), d0
  00e742  48c0                 ext.l     d0
  00e744  4c030800             muls.l    d3, d0
  00e748  e080                 asr.l     #$8, d0
  00e74a  3540004e             move.w    d0, $4e(a2)
  00e74e  302c0006             move.w    $6(a4), d0
  00e752  48c0                 ext.l     d0
  00e754  322efffa             move.w    -$6(a6), d1
  00e758  48c1                 ext.l     d1
  00e75a  9280                 sub.l     d0, d1
  00e75c  3541005c             move.w    d1, $5c(a2)
  00e760  603a                 bra.b     $e79c
  00e762  4a6a0050             tst.w     $50(a2)
  00e766  6c22                 bge.b     $e78a
  00e768  302a0050             move.w    $50(a2), d0
  00e76c  48c0                 ext.l     d0
  00e76e  4c030800             muls.l    d3, d0
  00e772  4480                 neg.l     d0
  00e774  e080                 asr.l     #$8, d0
  00e776  35400050             move.w    d0, $50(a2)
  00e77a  302a004e             move.w    $4e(a2), d0
  00e77e  48c0                 ext.l     d0
  00e780  4c030800             muls.l    d3, d0
  00e784  e080                 asr.l     #$8, d0
  00e786  3540004e             move.w    d0, $4e(a2)
  00e78a  302c0002             move.w    $2(a4), d0
  00e78e  48c0                 ext.l     d0
  00e790  322efffe             move.w    -$2(a6), d1
  00e794  48c1                 ext.l     d1
  00e796  9280                 sub.l     d0, d1
  00e798  3541005c             move.w    d1, $5c(a2)
  00e79c  302efff6             move.w    -$a(a6), d0
  00e7a0  b06a005c             cmp.w     $5c(a2), d0
  00e7a4  670c                 beq.b     $e7b2
  00e7a6  302a005c             move.w    $5c(a2), d0
  00e7aa  48c0                 ext.l     d0
  00e7ac  e188                 lsl.l     #$8, d0
  00e7ae  2540005e             move.l    d0, $5e(a2)
  00e7b2  302efff4             move.w    -$c(a6), d0
  00e7b6  b06a005a             cmp.w     $5a(a2), d0
  00e7ba  670c                 beq.b     $e7c8
  00e7bc  302a005a             move.w    $5a(a2), d0
  00e7c0  48c0                 ext.l     d0
  00e7c2  e188                 lsl.l     #$8, d0
  00e7c4  25400062             move.l    d0, $62(a2)
  00e7c8  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  00e7cc  4e5e                 unlk      a6
  00e7ce  4e75                 rts       

;-------------------------------------------------------------
; VBounce   (seg 2 +00e7da, 482 bytes)
  00e7da  4e56ffdc             link.w    a6, #$ffdc
  00e7de  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  00e7e2  246e0008             movea.l   $8(a6), a2
  00e7e6  266e000c             movea.l   $c(a6), a3
  00e7ea  382e0010             move.w    $10(a6), d4
  00e7ee  262e0012             move.l    $12(a6), d3
  00e7f2  286e0016             movea.l   $16(a6), a4
  00e7f6  486efff8             pea.l     -$8(a6)
  00e7fa  302b0008             move.w    $8(a3), d0
  00e7fe  48c0                 ext.l     d0
  00e800  322b005c             move.w    $5c(a3), d1
  00e804  48c1                 ext.l     d1
  00e806  d280                 add.l     d0, d1
  00e808  3f01                 move.w    d1, -(a7)
  00e80a  302b0006             move.w    $6(a3), d0
  00e80e  48c0                 ext.l     d0
  00e810  322b005a             move.w    $5a(a3), d1
  00e814  48c1                 ext.l     d1
  00e816  d280                 add.l     d0, d1
  00e818  3f01                 move.w    d1, -(a7)
  00e81a  302b000c             move.w    $c(a3), d0
  00e81e  48c0                 ext.l     d0
  00e820  322b005c             move.w    $5c(a3), d1
  00e824  48c1                 ext.l     d1
  00e826  d280                 add.l     d0, d1
  00e828  3f01                 move.w    d1, -(a7)
  00e82a  302b000a             move.w    $a(a3), d0
  00e82e  48c0                 ext.l     d0
  00e830  322b005a             move.w    $5a(a3), d1
  00e834  48c1                 ext.l     d1
  00e836  d280                 add.l     d0, d1
  00e838  3f01                 move.w    d1, -(a7)
  00e83a  a8a7                 _SetRect  
  00e83c  486effe4             pea.l     -$1c(a6)
  00e840  302c0002             move.w    $2(a4), d0
  00e844  48c0                 ext.l     d0
  00e846  322a005c             move.w    $5c(a2), d1
  00e84a  48c1                 ext.l     d1
  00e84c  d280                 add.l     d0, d1
  00e84e  3f01                 move.w    d1, -(a7)
  00e850  3014                 move.w    (a4), d0
  00e852  48c0                 ext.l     d0
  00e854  322a005a             move.w    $5a(a2), d1
  00e858  48c1                 ext.l     d1
  00e85a  d280                 add.l     d0, d1
  00e85c  3f01                 move.w    d1, -(a7)
  00e85e  302c0006             move.w    $6(a4), d0
  00e862  48c0                 ext.l     d0
  00e864  322a005c             move.w    $5c(a2), d1
  00e868  48c1                 ext.l     d1
  00e86a  d280                 add.l     d0, d1
  00e86c  3f01                 move.w    d1, -(a7)
  00e86e  302c0004             move.w    $4(a4), d0
  00e872  48c0                 ext.l     d0
  00e874  322a005a             move.w    $5a(a2), d1
  00e878  48c1                 ext.l     d1
  00e87a  d280                 add.l     d0, d1
  00e87c  3f01                 move.w    d1, -(a7)
  00e87e  a8a7                 _SetRect  
  00e880  554f                 subq.w    #$2, a7
  00e882  486effe4             pea.l     -$1c(a6)
  00e886  486efff8             pea.l     -$8(a6)
  00e88a  486effdc             pea.l     -$24(a6)
  00e88e  a8aa                 _SectRect 
  00e890  101f                 move.b    (a7)+, d0
  00e892  67000120             beq.w     $e9b4
  00e896  3004                 move.w    d4, d0
  00e898  48c0                 ext.l     d0
  00e89a  322a005c             move.w    $5c(a2), d1
  00e89e  48c1                 ext.l     d1
  00e8a0  d280                 add.l     d0, d1
  00e8a2  3d41fff2             move.w    d1, -$e(a6)
  00e8a6  3004                 move.w    d4, d0
  00e8a8  48c0                 ext.l     d0
  00e8aa  322a005a             move.w    $5a(a2), d1
  00e8ae  48c1                 ext.l     d1
  00e8b0  d280                 add.l     d0, d1
  00e8b2  3d41fff0             move.w    d1, -$10(a6)
  00e8b6  302b0008             move.w    $8(a3), d0
  00e8ba  48c0                 ext.l     d0
  00e8bc  322b000c             move.w    $c(a3), d1
  00e8c0  48c1                 ext.l     d1
  00e8c2  9280                 sub.l     d0, d1
  00e8c4  e281                 asr.l     #$1, d1
  00e8c6  302b0008             move.w    $8(a3), d0
  00e8ca  48c0                 ext.l     d0
  00e8cc  342b005c             move.w    $5c(a3), d2
  00e8d0  48c2                 ext.l     d2
  00e8d2  d480                 add.l     d0, d2
  00e8d4  d481                 add.l     d1, d2
  00e8d6  3d42ffee             move.w    d2, -$12(a6)
  00e8da  302b0006             move.w    $6(a3), d0
  00e8de  48c0                 ext.l     d0
  00e8e0  322b000a             move.w    $a(a3), d1
  00e8e4  48c1                 ext.l     d1
  00e8e6  9280                 sub.l     d0, d1
  00e8e8  e281                 asr.l     #$1, d1
  00e8ea  302b0006             move.w    $6(a3), d0
  00e8ee  48c0                 ext.l     d0
  00e8f0  342b005a             move.w    $5a(a3), d2
  00e8f4  48c2                 ext.l     d2
  00e8f6  d480                 add.l     d0, d2
  00e8f8  d481                 add.l     d1, d2
  00e8fa  3d42ffec             move.w    d2, -$14(a6)
  00e8fe  3d6a005cfff6         move.w    $5c(a2), -$a(a6)
  00e904  3d6a005afff4         move.w    $5a(a2), -$c(a6)
  00e90a  302efff0             move.w    -$10(a6), d0
  00e90e  b06effec             cmp.w     -$14(a6), d0
  00e912  6c3c                 bge.b     $e950
  00e914  4a6a004e             tst.w     $4e(a2)
  00e918  6f22                 ble.b     $e93c
  00e91a  302a0050             move.w    $50(a2), d0
  00e91e  48c0                 ext.l     d0
  00e920  4c030800             muls.l    d3, d0
  00e924  e080                 asr.l     #$8, d0
  00e926  35400050             move.w    d0, $50(a2)
  00e92a  302a004e             move.w    $4e(a2), d0
  00e92e  48c0                 ext.l     d0
  00e930  4c030800             muls.l    d3, d0
  00e934  4480                 neg.l     d0
  00e936  e080                 asr.l     #$8, d0
  00e938  3540004e             move.w    d0, $4e(a2)
  00e93c  302c0004             move.w    $4(a4), d0
  00e940  48c0                 ext.l     d0
  00e942  322efff8             move.w    -$8(a6), d1
  00e946  48c1                 ext.l     d1
  00e948  9280                 sub.l     d0, d1
  00e94a  3541005a             move.w    d1, $5a(a2)
  00e94e  6038                 bra.b     $e988
  00e950  4a6a004e             tst.w     $4e(a2)
  00e954  6c22                 bge.b     $e978
  00e956  302a0050             move.w    $50(a2), d0
  00e95a  48c0                 ext.l     d0
  00e95c  4c030800             muls.l    d3, d0
  00e960  e080                 asr.l     #$8, d0
  00e962  35400050             move.w    d0, $50(a2)
  00e966  302a004e             move.w    $4e(a2), d0
  00e96a  48c0                 ext.l     d0
  00e96c  4c030800             muls.l    d3, d0
  00e970  4480                 neg.l     d0
  00e972  e080                 asr.l     #$8, d0
  00e974  3540004e             move.w    d0, $4e(a2)
  00e978  3014                 move.w    (a4), d0
  00e97a  48c0                 ext.l     d0
  00e97c  322efffc             move.w    -$4(a6), d1
  00e980  48c1                 ext.l     d1
  00e982  9280                 sub.l     d0, d1
  00e984  3541005a             move.w    d1, $5a(a2)
  00e988  302efff6             move.w    -$a(a6), d0
  00e98c  b06a005c             cmp.w     $5c(a2), d0
  00e990  670c                 beq.b     $e99e
  00e992  302a005c             move.w    $5c(a2), d0
  00e996  48c0                 ext.l     d0
  00e998  e188                 lsl.l     #$8, d0
  00e99a  2540005e             move.l    d0, $5e(a2)
  00e99e  302efff4             move.w    -$c(a6), d0
  00e9a2  b06a005a             cmp.w     $5a(a2), d0
  00e9a6  670c                 beq.b     $e9b4
  00e9a8  302a005a             move.w    $5a(a2), d0
  00e9ac  48c0                 ext.l     d0
  00e9ae  e188                 lsl.l     #$8, d0
  00e9b0  25400062             move.l    d0, $62(a2)
  00e9b4  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  00e9b8  4e5e                 unlk      a6
  00e9ba  4e75                 rts       

;-------------------------------------------------------------
; GrateBounce   (seg 2 +00e9c6, 90 bytes)
  00e9c6  4e560000             link.w    a6, #$0
  00e9ca  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  00e9ce  286e0008             movea.l   $8(a6), a4
  00e9d2  246e000c             movea.l   $c(a6), a2
  00e9d6  382e0010             move.w    $10(a6), d4
  00e9da  262e0012             move.l    $12(a6), d3
  00e9de  266e0016             movea.l   $16(a6), a3
  00e9e2  0c520f3c             cmpi.w    #$f3c, (a2)
  00e9e6  6706                 beq.b     $e9ee
  00e9e8  0c520f46             cmpi.w    #$f46, (a2)
  00e9ec  6616                 bne.b     $ea04
  00e9ee  2f0b                 move.l    a3, -(a7)
  00e9f0  2f03                 move.l    d3, -(a7)
  00e9f2  3f04                 move.w    d4, -(a7)
  00e9f4  2f0a                 move.l    a2, -(a7)
  00e9f6  2f0c                 move.l    a4, -(a7)
  00e9f8  61fffffffde0         bsr.l     $e7da   ; VBounce
  00e9fe  4fef0012             lea.l     $12(a7), a7
  00ea02  6014                 bra.b     $ea18
  00ea04  2f0b                 move.l    a3, -(a7)
  00ea06  2f03                 move.l    d3, -(a7)
  00ea08  3f04                 move.w    d4, -(a7)
  00ea0a  2f0a                 move.l    a2, -(a7)
  00ea0c  2f0c                 move.l    a4, -(a7)
  00ea0e  61fffffffbdc         bsr.l     $e5ec   ; HBounce
  00ea14  4fef0012             lea.l     $12(a7), a7
  00ea18  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  00ea1c  4e5e                 unlk      a6
  00ea1e  4e75                 rts       

;-------------------------------------------------------------
; PromptGetFile   (seg 2 +00ea2e, 78 bytes)
  00ea2e  4e56fffc             link.w    a6, #$fffc
  00ea32  2d79000045eefffc     move.l    $45ee.l, -$4(a6)   ; g_45ee
  00ea3a  2f2e0008             move.l    $8(a6), -(a7)
  00ea3e  4879000045f2         pea.l     $45f2.l   ; g_45f2
  00ea44  4879000045f2         pea.l     $45f2.l   ; g_45f2
  00ea4a  4879000045f2         pea.l     $45f2.l   ; g_45f2
  00ea50  a98b                 _ParamText 
  00ea52  42a7                 clr.l     -(a7)
  00ea54  3f3c0001             move.w    #$1, -(a7)
  00ea58  2f2e000c             move.l    $c(a6), -(a7)
  00ea5c  2f2e0010             move.l    $10(a6), -(a7)
  00ea60  3f3c03e8             move.w    #$3e8, -(a7)
  00ea64  2f2efffc             move.l    -$4(a6), -(a7)
  00ea68  42a7                 clr.l     -(a7)
  00ea6a  42a7                 clr.l     -(a7)
  00ea6c  42a7                 clr.l     -(a7)
  00ea6e  42a7                 clr.l     -(a7)
  00ea70  42a7                 clr.l     -(a7)
  00ea72  3f3c0008             move.w    #$8, -(a7)
  00ea76  a9ea                 _Pack3    
  00ea78  4e5e                 unlk      a6
  00ea7a  4e75                 rts       

;-------------------------------------------------------------
; PromptPutFile   (seg 2 +00ea8c, 52 bytes)
  00ea8c  4e56fffc             link.w    a6, #$fffc
  00ea90  2d79000045eafffc     move.l    $45ea.l, -$4(a6)   ; g_45ea
  00ea98  2f2e0008             move.l    $8(a6), -(a7)
  00ea9c  2f2e000c             move.l    $c(a6), -(a7)
  00eaa0  2f2e0010             move.l    $10(a6), -(a7)
  00eaa4  3f3c03eb             move.w    #$3eb, -(a7)
  00eaa8  2f2efffc             move.l    -$4(a6), -(a7)
  00eaac  42a7                 clr.l     -(a7)
  00eaae  42a7                 clr.l     -(a7)
  00eab0  42a7                 clr.l     -(a7)
  00eab2  42a7                 clr.l     -(a7)
  00eab4  42a7                 clr.l     -(a7)
  00eab6  3f3c0007             move.w    #$7, -(a7)
  00eaba  a9ea                 _Pack3    
  00eabc  4e5e                 unlk      a6
  00eabe  4e75                 rts       

;-------------------------------------------------------------
; SaveSG   (seg 2 +00ead0, 400 bytes)
  00ead0  4e56fda6             link.w    a6, #$fda6
  00ead4  2f03                 move.l    d3, -(a7)
  00ead6  207900007470         movea.l   $7470.l, a0   ; hSave
  00eadc  2050                 movea.l   (a0), a0
  00eade  4a280004             tst.b     $4(a0)
  00eae2  6714                 beq.b     $eaf8
  00eae4  486efea8             pea.l     -$158(a6)
  00eae8  4879000045cb         pea.l     $45cb.l   ; g_45cb
  00eaee  61ffffff64dc         bsr.l     $4fcc   ; CopyPString
  00eaf4  504f                 addq.w    #$8, a7
  00eaf6  6012                 bra.b     $eb0a
  00eaf8  486efea8             pea.l     -$158(a6)
  00eafc  4879000045b0         pea.l     $45b0.l   ; g_45b0
  00eb02  61ffffff64c8         bsr.l     $4fcc   ; CopyPString
  00eb08  504f                 addq.w    #$8, a7
  00eb0a  307900008066         movea.w   $8066.l, a0   ; curLevel
  00eb10  2f08                 move.l    a0, -(a7)
  00eb12  486efda8             pea.l     -$258(a6)
  00eb16  4eb9000003e8         jsr       $3e8.l   ; seg4+9f2
  00eb1c  486efda8             pea.l     -$258(a6)
  00eb20  486efea8             pea.l     -$158(a6)
  00eb24  61ffffff64dc         bsr.l     $5002   ; ConcatPString
  00eb2a  486efea8             pea.l     -$158(a6)
  00eb2e  4879000045af         pea.l     $45af.l   ; g_45af
  00eb34  4879000045af         pea.l     $45af.l   ; g_45af
  00eb3a  4879000045af         pea.l     $45af.l   ; g_45af
  00eb40  a98b                 _ParamText 
  00eb42  486effa8             pea.l     -$58(a6)
  00eb46  4879000061a2         pea.l     $61a2.l   ; g_61a2
  00eb4c  487900004592         pea.l     $4592.l   ; g_4592
  00eb52  61ffffffff38         bsr.l     $ea8c   ; PromptPutFile
  00eb58  4a2effa8             tst.b     -$58(a6)
  00eb5c  4fef0014             lea.l     $14(a7), a7
  00eb60  670000f6             beq.w     $ec58
  00eb64  554f                 subq.w    #$2, a7
  00eb66  a994                 _CurResFile 
  00eb68  301f                 move.w    (a7)+, d0
  00eb6a  3d40fda6             move.w    d0, -$25a(a6)
  00eb6e  554f                 subq.w    #$2, a7
  00eb70  486effae             pea.l     -$52(a6)
  00eb74  7006                 moveq     #$6, d0
  00eb76  aa52                 _HighLevelFSDispatch 
  00eb78  301f                 move.w    (a7)+, d0
  00eb7a  3600                 move.w    d0, d3
  00eb7c  4879000061a2         pea.l     $61a2.l   ; g_61a2
  00eb82  486effb4             pea.l     -$4c(a6)
  00eb86  61ffffff6444         bsr.l     $4fcc   ; CopyPString
  00eb8c  4eb90000b02c         jsr       $b02c.l   ; UpdateSGString
  00eb92  486effae             pea.l     -$52(a6)
  00eb96  2f3c48617279         move.l    #$48617279, -(a7)
  00eb9c  2f3c48725347         move.l    #$48725347, -(a7)
  00eba2  4267                 clr.w     -(a7)
  00eba4  7004                 moveq     #$4, d0
  00eba6  aa52                 _HighLevelFSDispatch 
  00eba8  301f                 move.w    (a7)+, d0
  00ebaa  3600                 move.w    d0, d3
  00ebac  486effae             pea.l     -$52(a6)
  00ebb0  2f3c48617279         move.l    #$48617279, -(a7)
  00ebb6  2f3c48725347         move.l    #$48725347, -(a7)
  00ebbc  4267                 clr.w     -(a7)
  00ebbe  700e                 moveq     #$e, d0
  00ebc0  aa52                 _HighLevelFSDispatch 
  00ebc2  486effae             pea.l     -$52(a6)
  00ebc6  1f3c0003             move.b    #$3, -(a7)
  00ebca  700d                 moveq     #$d, d0
  00ebcc  aa52                 _HighLevelFSDispatch 
  00ebce  301f                 move.w    (a7)+, d0
  00ebd0  3600                 move.w    d0, d3
  00ebd2  3f03                 move.w    d3, -(a7)
  00ebd4  a998                 _UseResFile 
  00ebd6  2f3900007470         move.l    $7470.l, -(a7)   ; hSave
  00ebdc  2f3c48725347         move.l    #$48725347, -(a7)
  00ebe2  4267                 clr.w     -(a7)
  00ebe4  487900004581         pea.l     $4581.l   ; g_4581
  00ebea  a9ab                 _AddResource 
  00ebec  2f3900007470         move.l    $7470.l, -(a7)   ; hSave
  00ebf2  a9b0                 _WriteResource 
  00ebf4  2f3900007470         move.l    $7470.l, -(a7)   ; hSave
  00ebfa  a992                 _DetachResource 
  00ebfc  3f2efda6             move.w    -$25a(a6), -(a7)
  00ec00  a998                 _UseResFile 
  00ec02  3f03                 move.w    d3, -(a7)
  00ec04  a99a                 _CloseResFile 
  00ec06  a9af                 _ResError 
  00ec08  301f                 move.w    (a7)+, d0
  00ec0a  3600                 move.w    d0, d3
  00ec0c  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00ec12  a873                 _SetPort  
  00ec14  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00ec1a  48680010             pea.l     $10(a0)
  00ec1e  a928                 _InvalRect 
  00ec20  41eeffa8             lea.l     -$58(a6), a0
  00ec24  43f90000712a         lea.l     $712a.l, a1   ; g_712a
  00ec2a  7015                 moveq     #$15, d0
  00ec2c  22d8                 move.l    (a0)+, (a1)+
  00ec2e  51c8fffc             dbra      d0, $ec2c
  00ec32  13fc0001000070cf     move.b    #$1, $70cf.l   ; g_70cf
  00ec3a  3003                 move.w    d3, d0
  00ec3c  48c0                 ext.l     d0
  00ec3e  544f                 addq.w    #$2, a7
  00ec40  6712                 beq.b     $ec54
  00ec42  48790000456a         pea.l     $456a.l   ; g_456a
  00ec48  61ffffff67ec         bsr.l     $5436   ; SafeReportStr
  00ec4e  7000                 moveq     #$0, d0
  00ec50  584f                 addq.w    #$4, a7
  00ec52  6006                 bra.b     $ec5a
  00ec54  7001                 moveq     #$1, d0
  00ec56  6002                 bra.b     $ec5a
  00ec58  7000                 moveq     #$0, d0
  00ec5a  261f                 move.l    (a7)+, d3
  00ec5c  4e5e                 unlk      a6
  00ec5e  4e75                 rts       

;-------------------------------------------------------------
; OpenSG   (seg 2 +00ec6a, 290 bytes)
  00ec6a  4e56ff98             link.w    a6, #$ff98
  00ec6e  48e71820             movem.l   d3-d4/a2, -(a7)
  00ec72  246e0008             movea.l   $8(a6), a2
  00ec76  200a                 move.l    a2, d0
  00ec78  6710                 beq.b     $ec8a
  00ec7a  41d2                 lea.l     (a2), a0
  00ec7c  43eeffa8             lea.l     -$58(a6), a1
  00ec80  7015                 moveq     #$15, d0
  00ec82  22d8                 move.l    (a0)+, (a1)+
  00ec84  51c8fffc             dbra      d0, $ec82
  00ec88  6034                 bra.b     $ecbe
  00ec8a  2d7c48725347ff98     move.l    #$48725347, -$68(a6)
  00ec92  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  00ec98  670c                 beq.b     $eca6
  00ec9a  3f3c0014             move.w    #$14, -(a7)
  00ec9e  61ffffff65ae         bsr.l     $524e   ; GammaFadeIn
  00eca4  544f                 addq.w    #$2, a7
  00eca6  486effa8             pea.l     -$58(a6)
  00ecaa  486eff98             pea.l     -$68(a6)
  00ecae  487900004526         pea.l     $4526.l   ; g_4526
  00ecb4  61fffffffd78         bsr.l     $ea2e   ; PromptGetFile
  00ecba  4fef000c             lea.l     $c(a7), a7
  00ecbe  4a2effa8             tst.b     -$58(a6)
  00ecc2  670000be             beq.w     $ed82
  00ecc6  554f                 subq.w    #$2, a7
  00ecc8  a994                 _CurResFile 
  00ecca  301f                 move.w    (a7)+, d0
  00eccc  3800                 move.w    d0, d4
  00ecce  554f                 subq.w    #$2, a7
  00ecd0  486effae             pea.l     -$52(a6)
  00ecd4  1f3c0001             move.b    #$1, -(a7)
  00ecd8  700d                 moveq     #$d, d0
  00ecda  aa52                 _HighLevelFSDispatch 
  00ecdc  301f                 move.w    (a7)+, d0
  00ecde  3600                 move.w    d0, d3
  00ece0  3f03                 move.w    d3, -(a7)
  00ece2  a998                 _UseResFile 
  00ece4  207900007470         movea.l   $7470.l, a0   ; hSave
  00ecea  a023                 _DisposeHandle 
  00ecec  42b900007470         clr.l     $7470.l   ; hSave
  00ecf2  594f                 subq.w    #$4, a7
  00ecf4  2f3c48725347         move.l    #$48725347, -(a7)
  00ecfa  4267                 clr.w     -(a7)
  00ecfc  a9a0                 _GetResource 
  00ecfe  205f                 movea.l   (a7)+, a0
  00ed00  23c800007470         move.l    a0, $7470.l   ; hSave
  00ed06  4ab900007470         tst.l     $7470.l   ; hSave
  00ed0c  6762                 beq.b     $ed70
  00ed0e  2f3900007470         move.l    $7470.l, -(a7)   ; hSave
  00ed14  a992                 _DetachResource 
  00ed16  3f04                 move.w    d4, -(a7)
  00ed18  a998                 _UseResFile 
  00ed1a  3f03                 move.w    d3, -(a7)
  00ed1c  a99a                 _CloseResFile 
  00ed1e  554f                 subq.w    #$2, a7
  00ed20  a9af                 _ResError 
  00ed22  301f                 move.w    (a7)+, d0
  00ed24  3600                 move.w    d0, d3
  00ed26  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00ed2c  a873                 _SetPort  
  00ed2e  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00ed34  48680010             pea.l     $10(a0)
  00ed38  a928                 _InvalRect 
  00ed3a  41eeffa8             lea.l     -$58(a6), a0
  00ed3e  43f90000712a         lea.l     $712a.l, a1   ; g_712a
  00ed44  7015                 moveq     #$15, d0
  00ed46  22d8                 move.l    (a0)+, (a1)+
  00ed48  51c8fffc             dbra      d0, $ed46
  00ed4c  13fc0001000070cf     move.b    #$1, $70cf.l   ; g_70cf
  00ed54  3003                 move.w    d3, d0
  00ed56  48c0                 ext.l     d0
  00ed58  6712                 beq.b     $ed6c
  00ed5a  487900004508         pea.l     $4508.l   ; g_4508
  00ed60  61ffffffa578         bsr.l     $92da   ; ReportDialog
  00ed66  7000                 moveq     #$0, d0
  00ed68  584f                 addq.w    #$4, a7
  00ed6a  6018                 bra.b     $ed84
  00ed6c  7001                 moveq     #$1, d0
  00ed6e  6014                 bra.b     $ed84
  00ed70  4879000044d2         pea.l     $44d2.l   ; g_44d2
  00ed76  61ffffffa562         bsr.l     $92da   ; ReportDialog
  00ed7c  7000                 moveq     #$0, d0
  00ed7e  584f                 addq.w    #$4, a7
  00ed80  6002                 bra.b     $ed84
  00ed82  7000                 moveq     #$0, d0
  00ed84  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00ed88  4e5e                 unlk      a6
  00ed8a  4e75                 rts       

;-------------------------------------------------------------
; OpenDefaultWorldLevel   (seg 2 +00ed96, 294 bytes)
  00ed96  4e56ffa8             link.w    a6, #$ffa8
  00ed9a  48e71c20             movem.l   d3-d5/a2, -(a7)
  00ed9e  246e000a             movea.l   $a(a6), a2
  00eda2  76ff                 moveq     #$ff, d3
  00eda4  7800                 moveq     #$0, d4
  00eda6  554f                 subq.w    #$2, a7
  00eda8  a994                 _CurResFile 
  00edaa  301f                 move.w    (a7)+, d0
  00edac  3a00                 move.w    d0, d5
  00edae  4a39000070d0         tst.b     $70d0.l   ; g_70d0
  00edb4  6738                 beq.b     $edee
  00edb6  41f9000070d2         lea.l     $70d2.l, a0   ; g_70d2
  00edbc  43eeffa8             lea.l     -$58(a6), a1
  00edc0  7015                 moveq     #$15, d0
  00edc2  22d8                 move.l    (a0)+, (a1)+
  00edc4  51c8fffc             dbra      d0, $edc2
  00edc8  102effa8             move.b    -$58(a6), d0
  00edcc  57c0                 seq.b     d0
  00edce  4400                 neg.b     d0
  00edd0  49c0                 extb.l    d0
  00edd2  3800                 move.w    d0, d4
  00edd4  554f                 subq.w    #$2, a7
  00edd6  486effae             pea.l     -$52(a6)
  00edda  1f3c0001             move.b    #$1, -(a7)
  00edde  700d                 moveq     #$d, d0
  00ede0  aa52                 _HighLevelFSDispatch 
  00ede2  301f                 move.w    (a7)+, d0
  00ede4  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  00edea  3600                 move.w    d0, d3
  00edec  6018                 bra.b     $ee06
  00edee  554f                 subq.w    #$2, a7
  00edf0  2f0a                 move.l    a2, -(a7)
  00edf2  a997                 _OpenResFile 
  00edf4  301f                 move.w    (a7)+, d0
  00edf6  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  00edfc  3600                 move.w    d0, d3
  00edfe  554f                 subq.w    #$2, a7
  00ee00  a9af                 _ResError 
  00ee02  301f                 move.w    (a7)+, d0
  00ee04  3800                 move.w    d0, d4
  00ee06  3004                 move.w    d4, d0
  00ee08  48c0                 ext.l     d0
  00ee0a  660a                 bne.b     $ee16
  00ee0c  4a43                 tst.w     d3
  00ee0e  6706                 beq.b     $ee16
  00ee10  0c43ffff             cmpi.w    #$ffff, d3
  00ee14  6628                 bne.b     $ee3e
  00ee16  2f0a                 move.l    a2, -(a7)
  00ee18  4879000045af         pea.l     $45af.l   ; g_45af
  00ee1e  4879000045af         pea.l     $45af.l   ; g_45af
  00ee24  4879000045af         pea.l     $45af.l   ; g_45af
  00ee2a  a98b                 _ParamText 
  00ee2c  3f04                 move.w    d4, -(a7)
  00ee2e  48790000447c         pea.l     $447c.l   ; g_447c
  00ee34  61ffffffa45c         bsr.l     $9292   ; ReportError
  00ee3a  a9f4                 _ExitToShell 
  00ee3c  5c4f                 addq.w    #$6, a7
  00ee3e  3f03                 move.w    d3, -(a7)
  00ee40  a998                 _UseResFile 
  00ee42  4ab90000746c         tst.l     $746c.l   ; hLevel
  00ee48  670e                 beq.b     $ee58
  00ee4a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ee50  a023                 _DisposeHandle 
  00ee52  42b90000746c         clr.l     $746c.l   ; hLevel
  00ee58  594f                 subq.w    #$4, a7
  00ee5a  2f3c486c766c         move.l    #$486c766c, -(a7)
  00ee60  3f2e0008             move.w    $8(a6), -(a7)
  00ee64  a9a0                 _GetResource 
  00ee66  205f                 movea.l   (a7)+, a0
  00ee68  23c80000746c         move.l    a0, $746c.l   ; hLevel
  00ee6e  554f                 subq.w    #$2, a7
  00ee70  a9af                 _ResError 
  00ee72  301f                 move.w    (a7)+, d0
  00ee74  3800                 move.w    d0, d4
  00ee76  2f390000746c         move.l    $746c.l, -(a7)   ; hLevel
  00ee7c  a992                 _DetachResource 
  00ee7e  3f05                 move.w    d5, -(a7)
  00ee80  a998                 _UseResFile 
  00ee82  3f03                 move.w    d3, -(a7)
  00ee84  a99a                 _CloseResFile 
  00ee86  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00ee8c  a873                 _SetPort  
  00ee8e  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00ee94  48680010             pea.l     $10(a0)
  00ee98  a928                 _InvalRect 
  00ee9a  3004                 move.w    d4, d0
  00ee9c  48c0                 ext.l     d0
  00ee9e  6712                 beq.b     $eeb2
  00eea0  487900004452         pea.l     $4452.l   ; g_4452
  00eea6  61ffffff658e         bsr.l     $5436   ; SafeReportStr
  00eeac  7000                 moveq     #$0, d0
  00eeae  584f                 addq.w    #$4, a7
  00eeb0  6002                 bra.b     $eeb4
  00eeb2  7001                 moveq     #$1, d0
  00eeb4  4cdf0438             movem.l   (a7)+, d3-d5/a2
  00eeb8  4e5e                 unlk      a6
  00eeba  4e75                 rts       

;-------------------------------------------------------------
; SetResWorldFile   (seg 2 +00eed4, 134 bytes)
  00eed4  4e56ffa8             link.w    a6, #$ffa8
  00eed8  2f03                 move.l    d3, -(a7)
  00eeda  7600                 moveq     #$0, d3
  00eedc  554f                 subq.w    #$2, a7
  00eede  a994                 _CurResFile 
  00eee0  301f                 move.w    (a7)+, d0
  00eee2  33c000007184         move.w    d0, $7184.l   ; g_7184
  00eee8  4a39000070d0         tst.b     $70d0.l   ; g_70d0
  00eeee  673c                 beq.b     $ef2c
  00eef0  41f9000070d2         lea.l     $70d2.l, a0   ; g_70d2
  00eef6  43eeffa8             lea.l     -$58(a6), a1
  00eefa  7015                 moveq     #$15, d0
  00eefc  22d8                 move.l    (a0)+, (a1)+
  00eefe  51c8fffc             dbra      d0, $eefc
  00ef02  102effa8             move.b    -$58(a6), d0
  00ef06  57c0                 seq.b     d0
  00ef08  4400                 neg.b     d0
  00ef0a  49c0                 extb.l    d0
  00ef0c  3600                 move.w    d0, d3
  00ef0e  554f                 subq.w    #$2, a7
  00ef10  486effae             pea.l     -$52(a6)
  00ef14  1f3c0001             move.b    #$1, -(a7)
  00ef18  700d                 moveq     #$d, d0
  00ef1a  aa52                 _HighLevelFSDispatch 
  00ef1c  301f                 move.w    (a7)+, d0
  00ef1e  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  00ef24  33c000007182         move.w    d0, $7182.l   ; g_7182
  00ef2a  6020                 bra.b     $ef4c
  00ef2c  554f                 subq.w    #$2, a7
  00ef2e  487900007f64         pea.l     $7f64.l   ; g_7f64
  00ef34  a997                 _OpenResFile 
  00ef36  301f                 move.w    (a7)+, d0
  00ef38  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  00ef3e  33c000007182         move.w    d0, $7182.l   ; g_7182
  00ef44  554f                 subq.w    #$2, a7
  00ef46  a9af                 _ResError 
  00ef48  301f                 move.w    (a7)+, d0
  00ef4a  3600                 move.w    d0, d3
  00ef4c  3f3900007182         move.w    $7182.l, -(a7)   ; g_7182
  00ef52  a998                 _UseResFile 
  00ef54  261f                 move.l    (a7)+, d3
  00ef56  4e5e                 unlk      a6
  00ef58  4e75                 rts       

;-------------------------------------------------------------
; RestoreResWorldFile   (seg 2 +00ef6c, 24 bytes)
  00ef6c  4e560000             link.w    a6, #$0
  00ef70  3f3900007184         move.w    $7184.l, -(a7)   ; g_7184
  00ef76  a998                 _UseResFile 
  00ef78  3f3900007182         move.w    $7182.l, -(a7)   ; g_7182
  00ef7e  a99a                 _CloseResFile 
  00ef80  4e5e                 unlk      a6
  00ef82  4e75                 rts       

;-------------------------------------------------------------
; OpenWorld   (seg 2 +00ef9a, 314 bytes)
  00ef9a  4e56ff98             link.w    a6, #$ff98
  00ef9e  48e71820             movem.l   d3-d4/a2, -(a7)
  00efa2  246e000e             movea.l   $e(a6), a2
  00efa6  13fc0001000070d0     move.b    #$1, $70d0.l   ; g_70d0
  00efae  4a2e0008             tst.b     $8(a6)
  00efb2  675c                 beq.b     $f010
  00efb4  2f0a                 move.l    a2, -(a7)
  00efb6  487900007186         pea.l     $7186.l   ; g_7186
  00efbc  61ffffff609c         bsr.l     $505a   ; StringsEqual
  00efc2  4a00                 tst.b     d0
  00efc4  504f                 addq.w    #$8, a7
  00efc6  6714                 beq.b     $efdc
  00efc8  2f0a                 move.l    a2, -(a7)
  00efca  4879000045af         pea.l     $45af.l   ; g_45af
  00efd0  61ffffff6088         bsr.l     $505a   ; StringsEqual
  00efd6  4a00                 tst.b     d0
  00efd8  504f                 addq.w    #$8, a7
  00efda  6734                 beq.b     $f010
  00efdc  2d7c48776c64ff98     move.l    #$48776c64, -$68(a6)
  00efe4  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  00efea  670c                 beq.b     $eff8
  00efec  3f3c0014             move.w    #$14, -(a7)
  00eff0  61ffffff625c         bsr.l     $524e   ; GammaFadeIn
  00eff6  544f                 addq.w    #$2, a7
  00eff8  486effa8             pea.l     -$58(a6)
  00effc  486eff98             pea.l     -$68(a6)
  00f000  2f2e000a             move.l    $a(a6), -(a7)
  00f004  61fffffffa28         bsr.l     $ea2e   ; PromptGetFile
  00f00a  4fef000c             lea.l     $c(a7), a7
  00f00e  6012                 bra.b     $f022
  00f010  41f9000070d2         lea.l     $70d2.l, a0   ; g_70d2
  00f016  43eeffa8             lea.l     -$58(a6), a1
  00f01a  7015                 moveq     #$15, d0
  00f01c  22d8                 move.l    (a0)+, (a1)+
  00f01e  51c8fffc             dbra      d0, $f01c
  00f022  487900007f64         pea.l     $7f64.l   ; g_7f64
  00f028  486effb4             pea.l     -$4c(a6)
  00f02c  61ffffff5f9e         bsr.l     $4fcc   ; CopyPString
  00f032  4a2effa8             tst.b     -$58(a6)
  00f036  504f                 addq.w    #$8, a7
  00f038  6700008c             beq.w     $f0c6
  00f03c  554f                 subq.w    #$2, a7
  00f03e  a994                 _CurResFile 
  00f040  301f                 move.w    (a7)+, d0
  00f042  3800                 move.w    d0, d4
  00f044  554f                 subq.w    #$2, a7
  00f046  486effae             pea.l     -$52(a6)
  00f04a  1f3c0001             move.b    #$1, -(a7)
  00f04e  700d                 moveq     #$d, d0
  00f050  aa52                 _HighLevelFSDispatch 
  00f052  301f                 move.w    (a7)+, d0
  00f054  3600                 move.w    d0, d3
  00f056  3f03                 move.w    d3, -(a7)
  00f058  a998                 _UseResFile 
  00f05a  33c300007f20         move.w    d3, $7f20.l   ; g_7f20
  00f060  207900007468         movea.l   $7468.l, a0   ; hWorld
  00f066  a023                 _DisposeHandle 
  00f068  594f                 subq.w    #$4, a7
  00f06a  2f3c48776c64         move.l    #$48776c64, -(a7)
  00f070  4267                 clr.w     -(a7)
  00f072  a9a0                 _GetResource 
  00f074  205f                 movea.l   (a7)+, a0
  00f076  23c800007468         move.l    a0, $7468.l   ; hWorld
  00f07c  2f3900007468         move.l    $7468.l, -(a7)   ; hWorld
  00f082  a992                 _DetachResource 
  00f084  3f04                 move.w    d4, -(a7)
  00f086  a998                 _UseResFile 
  00f088  3f03                 move.w    d3, -(a7)
  00f08a  a99a                 _CloseResFile 
  00f08c  41eeffa8             lea.l     -$58(a6), a0
  00f090  43f9000070d2         lea.l     $70d2.l, a1   ; g_70d2
  00f096  7015                 moveq     #$15, d0
  00f098  22d8                 move.l    (a0)+, (a1)+
  00f09a  51c8fffc             dbra      d0, $f098
  00f09e  487900007186         pea.l     $7186.l   ; g_7186
  00f0a4  486effb4             pea.l     -$4c(a6)
  00f0a8  61ffffff5f22         bsr.l     $4fcc   ; CopyPString
  00f0ae  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00f0b4  a873                 _SetPort  
  00f0b6  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00f0bc  48680010             pea.l     $10(a0)
  00f0c0  a928                 _InvalRect 
  00f0c2  504f                 addq.w    #$8, a7
  00f0c4  6004                 bra.b     $f0ca
  00f0c6  7000                 moveq     #$0, d0
  00f0c8  6002                 bra.b     $f0cc
  00f0ca  7001                 moveq     #$1, d0
  00f0cc  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00f0d0  4e5e                 unlk      a6
  00f0d2  4e75                 rts       

;-------------------------------------------------------------
; OpenDefaultWorld   (seg 2 +00f0e0, 268 bytes)
  00f0e0  4e56ff00             link.w    a6, #$ff00
  00f0e4  48e71c20             movem.l   d3-d5/a2, -(a7)
  00f0e8  246e0008             movea.l   $8(a6), a2
  00f0ec  76ff                 moveq     #$ff, d3
  00f0ee  554f                 subq.w    #$2, a7
  00f0f0  a994                 _CurResFile 
  00f0f2  301f                 move.w    (a7)+, d0
  00f0f4  3a00                 move.w    d0, d5
  00f0f6  554f                 subq.w    #$2, a7
  00f0f8  2f0a                 move.l    a2, -(a7)
  00f0fa  a997                 _OpenResFile 
  00f0fc  301f                 move.w    (a7)+, d0
  00f0fe  3600                 move.w    d0, d3
  00f100  486eff00             pea.l     -$100(a6)
  00f104  487900004435         pea.l     $4435.l   ; g_4435
  00f10a  61ffffff5ec0         bsr.l     $4fcc   ; CopyPString
  00f110  2f0a                 move.l    a2, -(a7)
  00f112  486eff00             pea.l     -$100(a6)
  00f116  61ffffff5eea         bsr.l     $5002   ; ConcatPString
  00f11c  487900004432         pea.l     $4432.l   ; g_4432
  00f122  486eff00             pea.l     -$100(a6)
  00f126  61ffffff5eda         bsr.l     $5002   ; ConcatPString
  00f12c  4239000070d0         clr.b     $70d0.l   ; g_70d0
  00f132  a9af                 _ResError 
  00f134  301f                 move.w    (a7)+, d0
  00f136  48c0                 ext.l     d0
  00f138  4fef0016             lea.l     $16(a7), a7
  00f13c  6606                 bne.b     $f144
  00f13e  0c43ffff             cmpi.w    #$ffff, d3
  00f142  6618                 bne.b     $f15c
  00f144  2f0a                 move.l    a2, -(a7)
  00f146  486eff00             pea.l     -$100(a6)
  00f14a  1f3c0001             move.b    #$1, -(a7)
  00f14e  61fffffffe4a         bsr.l     $ef9a   ; OpenWorld
  00f154  4fef000a             lea.l     $a(a7), a7
  00f158  6000008a             bra.w     $f1e4
  00f15c  3f03                 move.w    d3, -(a7)
  00f15e  a998                 _UseResFile 
  00f160  487900007f64         pea.l     $7f64.l   ; g_7f64
  00f166  2f0a                 move.l    a2, -(a7)
  00f168  61ffffff5e62         bsr.l     $4fcc   ; CopyPString
  00f16e  33c300007f20         move.w    d3, $7f20.l   ; g_7f20
  00f174  207900007468         movea.l   $7468.l, a0   ; hWorld
  00f17a  a023                 _DisposeHandle 
  00f17c  2f3c48776c64         move.l    #$48776c64, -(a7)
  00f182  4267                 clr.w     -(a7)
  00f184  a9a0                 _GetResource 
  00f186  205f                 movea.l   (a7)+, a0
  00f188  23c800007468         move.l    a0, $7468.l   ; hWorld
  00f18e  a9af                 _ResError 
  00f190  301f                 move.w    (a7)+, d0
  00f192  3800                 move.w    d0, d4
  00f194  2f3900007468         move.l    $7468.l, -(a7)   ; hWorld
  00f19a  a992                 _DetachResource 
  00f19c  3f05                 move.w    d5, -(a7)
  00f19e  a998                 _UseResFile 
  00f1a0  3f03                 move.w    d3, -(a7)
  00f1a2  a99a                 _CloseResFile 
  00f1a4  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00f1aa  a873                 _SetPort  
  00f1ac  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00f1b2  48680010             pea.l     $10(a0)
  00f1b6  a928                 _InvalRect 
  00f1b8  487900007186         pea.l     $7186.l   ; g_7186
  00f1be  2f0a                 move.l    a2, -(a7)
  00f1c0  61ffffff5e0a         bsr.l     $4fcc   ; CopyPString
  00f1c6  3004                 move.w    d4, d0
  00f1c8  48c0                 ext.l     d0
  00f1ca  4fef000a             lea.l     $a(a7), a7
  00f1ce  6712                 beq.b     $f1e2
  00f1d0  487900004402         pea.l     $4402.l   ; g_4402
  00f1d6  61ffffff625e         bsr.l     $5436   ; SafeReportStr
  00f1dc  7000                 moveq     #$0, d0
  00f1de  584f                 addq.w    #$4, a7
  00f1e0  6002                 bra.b     $f1e4
  00f1e2  7001                 moveq     #$1, d0
  00f1e4  4cdf0438             movem.l   (a7)+, d3-d5/a2
  00f1e8  4e5e                 unlk      a6
  00f1ea  4e75                 rts       

;-------------------------------------------------------------
; _tail_f200   (seg 2 +00f200, 818 bytes)
  00f200  00000275             ori.b     #$75, d0
  00f204  8baae99a             or.l      d5, -$1666(a2)
  00f208  e940                 asl.w     #$4, d0
  00f20a  6f40                 ble.b     $f24c
  00f20c  aa40                 _QDError  
  00f20e  e1f340e9             asl.w     -$17(a3, d4.w)
  00f212  f345                 dc.w      $f345
  00f214  13c17fbfcaca         move.b    d1, $7fbfcaca.l
  00f21a  7fbc                 dc.w      $7fbc
  00f21c  7f06                 dc.w      $7f06
  00f21e  7f07                 dc.w      $7f07
  00f220  d1d1                 adda.l    (a1), a0
  00f222  c1ca                 dc.w      $c1ca
  00f224  ca7f                 dc.w      $ca7f
  00f226  b27f                 dc.w      $b27f
  00f228  b643                 cmp.w     d3, d3
  00f22a  c9f742b7             muls.w    -$49(a7, d4.w * 2), d4
  00f22e  ebe9                 dc.w      $ebe9
  00f230  e17f                 rol.w     d0, d7
  00f232  78fa                 moveq     #$fa, d4
  00f234  fb41                 dc.w      $fb41
  00f236  0e7f                 dc.w      $0e7f
  00f238  4240                 clr.w     d0
  00f23a  6be2                 bmi.b     $f21e
  00f23c  83412340             pack      d1, d1, #$2340
  00f240  9441                 sub.w     d1, d2
  00f242  5640                 addq.w    #$3, d0
  00f244  81411895             pack      d1, d0, #$1895
  00f248  8895                 or.l      (a5), d4
  00f24a  9540                 subx.w    d0, d2
  00f24c  6740                 beq.b     $f28e
  00f24e  4a95                 tst.l     (a5)
  00f250  8895                 or.l      (a5), d4
  00f252  9540                 subx.w    d0, d2
  00f254  5c41                 addq.w    #$6, d1
  00f256  8d421041             pack      d2, d6, #$1041
  00f25a  338e888f             move.w    a6, -$71(a1, a0.l)
  00f25e  8f40ae41             pack      d0, d7, #$ae41
  00f262  9e8e                 sub.l     a6, d7
  00f264  888f                 dc.w      $888f
  00f266  8f412283             pack      d1, d7, #$2283
  00f26a  8940def7             pack      d0, d4, #$def7
  00f26e  dcf97f87f7fc         adda.w    $7f87f7fc.l, a6
  00f274  4050                 negx.w    (a0)
  00f276  41b5db8ffdfcfc9a     chk.w     ([], a5.l * 2, $fdfcfc9a), d0
  00f27e  8a40                 or.w      d0, d5
  00f280  9e83                 sub.l     d3, d7
  00f282  8994                 or.l      d4, (a4)
  00f284  4200                 clr.b     d0
  00f286  419d                 chk.w     (a5)+, d0
  00f288  4093                 negx.l    (a3)
  00f28a  8940fa7f             pack      d0, d4, #$fa7f
  00f28e  7984                 dc.w      $7984
  00f290  404d                 dc.w      $404d
  00f292  40abc87f             negx.l    -$3781(a3)
  00f296  aca0                 _StdRect  
  00f298  4083                 negx.l    d3
  00f29a  7f86                 dc.w      $7f86
  00f29c  9440                 sub.w     d0, d2
  00f29e  5ebd                 dc.w      $5ebd
  00f2a0  4050                 negx.w    (a0)
  00f2a2  40b6c87f             negx.l    $7f(a6, a4.l)
  00f2a6  a49b                 _trap_a49b 
  00f2a8  ec9d                 ror.l     #$6, d5
  00f2aa  4087                 negx.l    d7
  00f2ac  7f87                 dc.w      $7f87
  00f2ae  9340                 subx.w    d0, d1
  00f2b0  5e41                 addq.w    #$7, d1
  00f2b2  a37e                 _trap_a37e 
  00f2b4  b9f4410a7f06         cmpa.l    ([a4, d4.w], $7f06), a4
  00f2ba  404f                 dc.w      $404f
  00f2bc  a841                 _Fix2Frac 
  00f2be  1fc0                 dc.w      $1fc0
  00f2c0  7f6c                 dc.w      $7f6c
  00f2c2  4046                 negx.w    d6
  00f2c4  4094                 negx.l    (a4)
  00f2c6  7f7d                 dc.w      $7f7d
  00f2c8  a040                 _ResrvMem 
  00f2ca  7a40                 moveq     #$40, d5
  00f2cc  5efc                 trapgt    
  00f2ce  fdb0                 dc.w      $fdb0
  00f2d0  f3ed                 dc.w      $f3ed
  00f2d2  97f193f5a4bbfafa     suba.l    ([$a4bbfafa]), a3
  00f2da  fafaf9fafafa         fbf.l     $f9fbedd6
  00f2e0  fabd9bf7             fbf.w     $8ed9
  00f2e4  f292f7fa             fbf.w     $eae0
  00f2e8  406d8d88             negx.w    -$7278(a5)
  00f2ec  8889                 dc.w      $8889
  00f2ee  8fbf                 dc.w      $8fbf
  00f2f0  f940                 dc.w      $f940
  00f2f2  d340                 addx.w    d0, d1
  00f2f4  5b91                 subq.l    #$5, (a1)
  00f2f6  9191                 sub.l     d0, (a1)
  00f2f8  40e7                 move.w    sr, -(a7)
  00f2fa  8795                 or.l      d3, (a5)
  00f2fc  87878583             unpk      d7, d3, #$8583
  00f300  8597                 or.l      d2, (a7)
  00f302  405b                 negx.w    (a3)+
  00f304  7faa                 dc.w      $7faa
  00f306  4048                 dc.w      $4048
  00f308  e0e9f883             asr.w     -$77d(a1)
  00f30c  8886                 or.l      d6, d4
  00f30e  b1e0                 cmpa.l    -(a0), a0
  00f310  f3b3                 dc.w      $f3b3
  00f312  e0ba                 ror.l     d0, d2
  00f314  4050                 negx.w    (a0)
  00f316  7fb5                 dc.w      $7fb5
  00f318  b9f2e1b4eee1a5e1     cmpa.l    $eee1a5e1(a6.w), a4
  00f320  a789                 _trap_a789 
  00f322  9b40                 subx.w    d0, d5
  00f324  4a7f                 dc.w      $4a7f
  00f326  bbb3f2e7             eor.l     d5, -$19(a3, a7.w * 2)
  00f32a  aeee                 _trap_aeee 
  00f32c  e79f                 rol.l     #$3, d7
  00f32e  e7a1                 asl.l     d3, d1
  00f330  899c                 or.l      d4, (a4)+
  00f332  8ff68689             divs.w    -$77(a6, a0.w * 8), d7
  00f336  8394                 or.l      d1, (a4)
  00f338  89409d84             pack      d0, d4, #$9d84
  00f33c  8440                 or.w      d0, d2
  00f33e  45f5f5f5f5f5f740     lea.l     ([$f5f5f740]), a2
  00f346  4b8b                 dc.w      $4b8b
  00f348  8b9d                 or.l      d5, (a5)+
  00f34a  4283                 clr.l     d3
  00f34c  d77d                 dc.w      $d77d
  00f34e  a940                 _trap_a940 
  00f350  47f5e9f8f8f342ad     lea.l     $f8f342ad(invalid.w), a3
  00f358  f6f1f2e5f2e5         fbf.l     $f2e6e63f
  00f35e  f4ea                 dc.w      $f4ea
  00f360  faeaf2eeebf1         fbf.l     $f2efdf53
  00f366  ee7f                 ror.w     d7, d7
  00f368  43eeeeee             lea.l     -$1112(a6), a1
  00f36c  eeee                 dc.w      $eeee
  00f36e  eeee                 dc.w      $eeee
  00f370  eef0                 dc.w      $eef0
  00f372  f5f6                 dc.w      $f5f6
  00f374  cb83                 dc.w      $cb83
  00f376  42bd                 dc.w      $42bd
  00f378  7d67                 dc.w      $7d67
  00f37a  4286                 clr.l     d6
  00f37c  f6f0f2e5f2e5         fbf.l     $f2e6e663
  00f382  f4eb                 dc.w      $f4eb
  00f384  f6edf2e0f9f1         fbf.l     $f2e1ed77
  00f38a  e1f0edededed         asl.w     ([$eded])
  00f390  eded                 dc.w      $eded
  00f392  edee                 dc.w      $edee
  00f394  ebee                 dc.w      $ebee
  00f396  eeee                 dc.w      $eeee
  00f398  eeee                 dc.w      $eeee
  00f39a  eeee                 dc.w      $eeee
  00f39c  eff8                 dc.w      $eff8
  00f39e  f541                 dc.w      $f541
  00f3a0  e97f                 rol.w     d4, d7
  00f3a2  befad0fa             cmpa.w    $c49e(pc), a7
  00f3a6  eded                 dc.w      $eded
  00f3a8  eded                 dc.w      $eded
  00f3aa  eded                 dc.w      $eded
  00f3ac  eded                 dc.w      $eded
  00f3ae  edee                 dc.w      $edee
  00f3b0  eeee                 dc.w      $eeee
  00f3b2  eeee                 dc.w      $eeee
  00f3b4  eeee                 dc.w      $eeee
  00f3b6  eeee                 dc.w      $eeee
  00f3b8  e641                 asr.w     #$3, d1
  00f3ba  c740                 exg.l     d3, d0
  00f3bc  43a9be8e             chk.w     -$4172(a1), d1
  00f3c0  ab8b                 _trap_ab8b 
  00f3c2  8b92                 or.l      d5, (a2)
  00f3c4  9abe                 dc.w      $9abe
  00f3c6  a2f6                 _trap_a2f6 
  00f3c8  bbfd                 dc.w      $bbfd
  00f3ca  8ffd                 dc.w      $8ffd
  00f3cc  9afa9ef8             suba.w    $92c6(pc), a5
  00f3d0  988d                 sub.l     a5, d4
  00f3d2  fbfc                 dc.w      $fbfc
  00f3d4  9a8d                 sub.l     a5, d5
  00f3d6  fbfc                 dc.w      $fbfc
  00f3d8  b2f68483             cmpa.w    -$7d(a6, a0.w * 4), a1
  00f3dc  9ff28483             suba.l    -$7d(a2, a0.w * 4), a7
  00f3e0  83405283             pack      d0, d1, #$5283
  00f3e4  4082                 negx.l    d2
  00f3e6  f3f4                 dc.w      $f3f4
  00f3e8  f346                 dc.w      $f346
  00f3ea  387c337f             movea.w   #$337f, a4
  00f3ee  7c7f                 moveq     #$7f, d6
  00f3f0  867f                 dc.w      $867f
  00f3f2  7b45                 dc.w      $7b45
  00f3f4  557c                 dc.w      $557c
  00f3f6  337f                 dc.w      $337f
  00f3f8  7c7f                 moveq     #$7f, d6
  00f3fa  867f                 dc.w      $867f
  00f3fc  7b47                 dc.w      $7b47
  00f3fe  13f3f4f346477c27     move.b    -$d(a3, a7.w * 4), $46477c27.l
  00f406  7f7c                 dc.w      $7f7c
  00f408  7f86                 dc.w      $7f86
  00f40a  7f7b                 dc.w      $7f7b
  00f40c  4561                 dc.w      $4561
  00f40e  7c27                 moveq     #$27, d6
  00f410  7f7c                 dc.w      $7f7c
  00f412  7f86                 dc.w      $7f86
  00f414  7f7b                 dc.w      $7f7b
  00f416  46e0                 move.w    -(a0), sr
  00f418  b340                 eor.w     d1, d0
  00f41a  7bf3                 dc.w      $7bf3
  00f41c  f4f3                 dc.w      $f4f3
  00f41e  b885                 cmp.l     d5, d4
  00f420  4259                 clr.w     (a1)+
  00f422  f3f4                 dc.w      $f3f4
  00f424  f3b8                 dc.w      $f3b8
  00f426  8541cf99             pack      d1, d2, #$cf99
  00f42a  8c40                 or.w      d0, d6
  00f42c  e0f9f9fd4095         asr.w     $f9fd4095.l
  00f432  407a                 dc.w      $407a
  00f434  f8f9f2f9f9f8         fbf.l     $f2faee2e
  00f43a  c540                 exg.l     d2, d0
  00f43c  59ca9240             dbvs      d2, $867e
  00f440  5640                 addq.w    #$3, d0
  00f442  8decf9f8             divs.w    -$608(a4), d6
  00f446  f0f6fbf6fbf7         fbf.l     $fbf7f03f
  00f44c  f3f7                 dc.w      $f3f7
  00f44e  8e40                 or.w      d0, d7
  00f450  679c                 beq.b     $f3ee
  00f452  9d92                 sub.l     d6, (a2)
  00f454  969c                 sub.l     (a4)+, d3
  00f456  9240                 sub.w     d0, d1
  00f458  bc7f                 dc.w      $bc7f
  00f45a  ac83                 _DrawChar 
  00f45c  4054                 negx.w    (a4)
  00f45e  9288                 sub.l     a0, d1
  00f460  8afd                 dc.w      $8afd
  00f462  958b                 subx.l    -(a3), -(a2)
  00f464  fdfd                 dc.w      $fdfd
  00f466  58767fbdaaf7f7f7     addq.w    #$4, ([$aaf7f7f7], d7.l * 8)
  00f46e  404c                 dc.w      $404c
  00f470  f7ac                 dc.w      $f7ac
  00f472  9f45                 subx.w    d5, d7
  00f474  367f                 dc.w      $367f
  00f476  867f                 dc.w      $867f
  00f478  577f                 dc.w      $577f
  00f47a  857f                 dc.w      $857f
  00f47c  567f                 dc.w      $567f
  00f47e  857f                 dc.w      $857f
  00f480  517f                 dc.w      $517f
  00f482  854522d3             pack      d5, d2, #$22d3
  00f486  d2d0                 adda.w    (a0), a1
  00f488  4343                 dc.w      $4343
  00f48a  e640                 asr.w     #$3, d0
  00f48c  9d7f                 dc.w      $9d7f
  00f48e  85e6                 divs.w    -(a6), d2
  00f490  4053                 negx.w    (a3)
  00f492  f48f                 dc.w      $f48f
  00f494  f49d                 dc.w      $f49d
  00f496  8484                 or.l      d4, d2
  00f498  af86                 _trap_af86 
  00f49a  44dc                 move.w    (a4)+, ccr
  00f49c  418b                 dc.w      $418b
  00f49e  7fba                 dc.w      $7fba
  00f4a0  40b6fde6fcb4         negx.l    ([$fcb4])
  00f4a6  e7eda0e7             rol.w     -$5f19(a5)
  00f4aa  9ce7                 suba.w    -(a7), a6
  00f4ac  9ffd                 dc.w      $9ffd
  00f4ae  eafd                 dc.w      $eafd
  00f4b0  a4eb                 _trap_a4eb 
  00f4b2  4246                 clr.w     d6
  00f4b4  8cfd                 dc.w      $8cfd
  00f4b6  fda9                 dc.w      $fda9
  00f4b8  40b2fcf5             negx.l    -$b(a2, a7.l * 4)
  00f4bc  7f80                 dc.w      $7f80
  00f4be  898a8786             unpk      -(a2), -(a4), #$8786
  00f4c2  92fd                 dc.w      $92fd
  00f4c4  fda7                 dc.w      $fda7
  00f4c6  e583                 asl.l     #$2, d3
  00f4c8  404c                 dc.w      $404c
  00f4ca  98fc8c88             suba.w    #$8c88, a4
  00f4ce  87a88eb0             or.l      d3, -$7150(a0)
  00f4d2  fcfdf6fca5fc         fbf.l     $f6fd9ad0
  00f4d8  8c88                 dc.w      $8c88
  00f4da  868b                 dc.w      $868b
  00f4dc  9f84                 subx.l    d4, d7
  00f4de  a0f7                 _trap_a0f7 
  00f4e0  a0fd                 _trap_a0fd 
  00f4e2  fd8b                 dc.w      $fd8b
  00f4e4  a4f9                 _trap_a4f9 
  00f4e6  f5fc                 dc.w      $f5fc
  00f4e8  fca6fc8d             fbf.w     $f177
  00f4ec  a183                 _trap_a183 
  00f4ee  84a4                 or.l      -(a4), d2
  00f4f0  f397                 dc.w      $f397
  00f4f2  f9f3                 dc.w      $f9f3
  00f4f4  85a1                 or.l      d2, -(a1)
  00f4f6  8498                 or.l      (a0)+, d2
  00f4f8  407b                 dc.w      $407b
  00f4fa  7f8c                 dc.w      $7f8c
  00f4fc  8a8d                 dc.w      $8a8d
  00f4fe  4056                 negx.w    (a6)
  00f500  c089                 dc.w      $c089
  00f502  9c91                 sub.l     (a1), d6
  00f504  fdf5                 dc.w      $fdf5
  00f506  abfc                 _trap_abfc 
  00f508  ab8c                 _trap_ab8c 
  00f50a  889a                 or.l      (a2)+, d4
  00f50c  8793                 or.l      d3, (a3)
  00f50e  faf69cfc8a8c         fbf.l     $9cfd7f9c
  00f514  0000000e             ori.b     #$e, d0
  00f518  000025b4             ori.b     #$b4, d0
  00f51c  b540                 eor.w     d2, d0
  00f51e  49f98b848585         lea.l     $8b848585.l, a4
  00f524  9e84                 sub.l     d4, d7
  00f526  8440                 or.w      d0, d2
  00f528  97b70000             sub.l     d3, (a7, d0.w)
  00f52c  75c7                 dc.w      $75c7
  00f52e  00000000             ori.b     #$0, d0
