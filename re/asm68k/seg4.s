
;-------------------------------------------------------------
; _tail_c   (seg 4 +00000c, 3466 bytes)
  00000c  303ca8d7             move.w    #$a8d7, d0
  000010  a746                 _GetTrapAddress 
  000012  2248                 movea.l   a0, a1
  000014  303ca89f             move.w    #$a89f, d0
  000018  a746                 _GetTrapAddress 
  00001a  b3c8                 cmpa.l    a0, a1
  00001c  6702                 beq.b     $20
  00001e  4ed1                 jmp       (a1)
  000020  4e56ffe2             link.w    a6, #$ffe2
  000024  48e71f3c             movem.l   d3-d7/a2-a5, -(a7)
  000028  42aefff4             clr.l     -$c(a6)
  00002c  426e0010             clr.w     $10(a6)
  000030  206e000c             movea.l   $c(a6), a0
  000034  2450                 movea.l   (a0), a2
  000036  7000                 moveq     #$0, d0
  000038  3012                 move.w    (a2), d0
  00003a  2d40ffe6             move.l    d0, -$1a(a6)
  00003e  226e0008             movea.l   $8(a6), a1
  000042  30290004             move.w    $4(a1), d0
  000046  6a1a                 bpl.b     $62
  000048  0800000e             btst.b    #$e, d0
  00004c  6704                 beq.b     $52
  00004e  2051                 movea.l   (a1), a0
  000050  2250                 movea.l   (a0), a1
  000052  0c6900010020         cmpi.w    #$1, $20(a1)
  000058  6708                 beq.b     $62
  00005a  303cff6c             move.w    #$ff6c, d0
  00005e  6000025c             bra.w     $2bc
  000062  3d690004fff0         move.w    $4(a1), -$10(a6)
  000068  026e7ffffff0         andi.w    #$7fff, -$10(a6)
  00006e  24290006             move.l    $6(a1), d2
  000072  3029000c             move.w    $c(a1), d0
  000076  9042                 sub.w     d2, d0
  000078  6f000246             ble.w     $2c0
  00007c  48c0                 ext.l     d0
  00007e  2800                 move.l    d0, d4
  000080  d884                 add.l     d4, d4
  000082  5c84                 addq.l    #$6, d4
  000084  d884                 add.l     d4, d4
  000086  2d44ffe2             move.l    d4, -$1e(a6)
  00008a  7e20                 moveq     #$20, d7
  00008c  80c7                 divu.w    d7, d0
  00008e  2600                 move.l    d0, d3
  000090  4843                 swap      d3
  000092  72ff                 moveq     #$ff, d1
  000094  4a43                 tst.w     d3
  000096  6706                 beq.b     $9e
  000098  5240                 addq.w    #$1, d0
  00009a  9e43                 sub.w     d3, d7
  00009c  efa1                 asl.l     d7, d1
  00009e  2d41fff8             move.l    d1, -$8(a6)
  0000a2  48c0                 ext.l     d0
  0000a4  2d40fffc             move.l    d0, -$4(a6)
  0000a8  e580                 asl.l     #$2, d0
  0000aa  a322                 _NewHandle 
  0000ac  6600020e             bne.w     $2bc
  0000b0  2d48fff4             move.l    a0, -$c(a6)
  0000b4  2602                 move.l    d2, d3
  0000b6  4843                 swap      d3
  0000b8  3029000a             move.w    $a(a1), d0
  0000bc  9043                 sub.w     d3, d0
  0000be  6f000200             ble.w     $2c0
  0000c2  3d40fff2             move.w    d0, -$e(a6)
  0000c6  2851                 movea.l   (a1), a4
  0000c8  3e3c000a             move.w    #$a, d7
  0000cc  246e000c             movea.l   $c(a6), a2
  0000d0  2452                 movea.l   (a2), a2
  0000d2  4bf27000             lea.l     (a2, d7.w), a5
  0000d6  222effe6             move.l    -$1a(a6), d1
  0000da  9247                 sub.w     d7, d1
  0000dc  b2aeffe2             cmp.l     -$1e(a6), d1
  0000e0  6c18                 bge.b     $fa
  0000e2  202effe6             move.l    -$1a(a6), d0
  0000e6  d0aeffe2             add.l     -$1e(a6), d0
  0000ea  2d40ffe6             move.l    d0, -$1a(a6)
  0000ee  206e000c             movea.l   $c(a6), a0
  0000f2  a024                 _SetHandleSize 
  0000f4  660001c6             bne.w     $2bc
  0000f8  60d2                 bra.b     $cc
  0000fa  3802                 move.w    d2, d4
  0000fc  7c00                 moveq     #$0, d6
  0000fe  224c                 movea.l   a4, a1
  000100  2a2efffc             move.l    -$4(a6), d5
  000104  266efff4             movea.l   -$c(a6), a3
  000108  2653                 movea.l   (a3), a3
  00010a  3003                 move.w    d3, d0
  00010c  6100014c             bsr.w     $25a
  000110  3d47ffee             move.w    d7, -$12(a6)
  000114  600000f4             bra.w     $20a
  000118  2019                 move.l    (a1)+, d0
  00011a  2213                 move.l    (a3), d1
  00011c  b181                 eor.l     d0, d1
  00011e  660000ae             bne.w     $1ce
  000122  4a06                 tst.b     d6
  000124  6704                 beq.b     $12a
  000126  3ac4                 move.w    d4, (a5)+
  000128  7c00                 moveq     #$0, d6
  00012a  06440020             addi.w    #$20, d4
  00012e  584b                 addq.w    #$4, a3
  000130  600000d8             bra.w     $20a
  000134  5644                 addq.w    #$3, d4
  000136  3ac4                 move.w    d4, (a5)+
  000138  5244                 addq.w    #$1, d4
  00013a  4606                 not.b     d6
  00013c  4e75                 rts       
  00013e  5444                 addq.w    #$2, d4
  000140  3ac4                 move.w    d4, (a5)+
  000142  6126                 bsr.b     $16a
  000144  5244                 addq.w    #$1, d4
  000146  4e75                 rts       
  000148  5444                 addq.w    #$2, d4
  00014a  3ac4                 move.w    d4, (a5)+
  00014c  5444                 addq.w    #$2, d4
  00014e  60ea                 bra.b     $13a
  000150  6118                 bsr.b     $16a
  000152  6116                 bsr.b     $16a
  000154  5444                 addq.w    #$2, d4
  000156  4e75                 rts       
  000158  61f6                 bsr.b     $150
  00015a  5344                 subq.w    #$1, d4
  00015c  60d8                 bra.b     $136
  00015e  610a                 bsr.b     $16a
  000160  5244                 addq.w    #$1, d4
  000162  60de                 bra.b     $142
  000164  6104                 bsr.b     $16a
  000166  5644                 addq.w    #$3, d4
  000168  60d0                 bra.b     $13a
  00016a  5244                 addq.w    #$1, d4
  00016c  3ac4                 move.w    d4, (a5)+
  00016e  4e75                 rts       
  000170  3ac4                 move.w    d4, (a5)+
  000172  61f6                 bsr.b     $16a
  000174  5644                 addq.w    #$3, d4
  000176  4e75                 rts       
  000178  3ac4                 move.w    d4, (a5)+
  00017a  61ee                 bsr.b     $16a
  00017c  5444                 addq.w    #$2, d4
  00017e  60b6                 bra.b     $136
  000180  3ac4                 move.w    d4, (a5)+
  000182  61e6                 bsr.b     $16a
  000184  61e4                 bsr.b     $16a
  000186  60ba                 bra.b     $142
  000188  3ac4                 move.w    d4, (a5)+
  00018a  61de                 bsr.b     $16a
  00018c  61dc                 bsr.b     $16a
  00018e  5444                 addq.w    #$2, d4
  000190  60a8                 bra.b     $13a
  000192  3ac4                 move.w    d4, (a5)+
  000194  5444                 addq.w    #$2, d4
  000196  3ac4                 move.w    d4, (a5)+
  000198  60ba                 bra.b     $154
  00019a  61f6                 bsr.b     $192
  00019c  5344                 subq.w    #$1, d4
  00019e  6096                 bra.b     $136
  0001a0  3ac4                 move.w    d4, (a5)+
  0001a2  5644                 addq.w    #$3, d4
  0001a4  3ac4                 move.w    d4, (a5)+
  0001a6  609c                 bra.b     $144
  0001a8  6020                 bra.b     $1ca
  0001aa  6088                 bra.b     $134
  0001ac  6090                 bra.b     $13e
  0001ae  6098                 bra.b     $148
  0001b0  609e                 bra.b     $150
  0001b2  60a4                 bra.b     $158
  0001b4  60a8                 bra.b     $15e
  0001b6  60ac                 bra.b     $164
  0001b8  60b6                 bra.b     $170
  0001ba  60bc                 bra.b     $178
  0001bc  60c2                 bra.b     $180
  0001be  60c8                 bra.b     $188
  0001c0  60d0                 bra.b     $192
  0001c2  60d6                 bra.b     $19a
  0001c4  60da                 bra.b     $1a0
  0001c6  3ac4                 move.w    d4, (a5)+
  0001c8  4606                 not.b     d6
  0001ca  5844                 addq.w    #$4, d4
  0001cc  4e75                 rts       
  0001ce  26c0                 move.l    d0, (a3)+
  0001d0  7e03                 moveq     #$3, d7
  0001d2  7000                 moveq     #$0, d0
  0001d4  e199                 rol.l     #$8, d1
  0001d6  4a01                 tst.b     d1
  0001d8  6612                 bne.b     $1ec
  0001da  4a06                 tst.b     d6
  0001dc  660e                 bne.b     $1ec
  0001de  5044                 addq.w    #$8, d4
  0001e0  6024                 bra.b     $206
  0001e2  2011                 move.l    (a1), d0
  0001e4  c0aefff8             and.l     -$8(a6), d0
  0001e8  6000ff30             bra.w     $11a
  0001ec  1001                 move.b    d1, d0
  0001ee  bd00                 eor.b     d6, d0
  0001f0  e808                 lsr.b     #$4, d0
  0001f2  d040                 add.w     d0, d0
  0001f4  4ebb00b2             jsr       $1a8(pc, d0.w)
  0001f8  1001                 move.b    d1, d0
  0001fa  bd00                 eor.b     d6, d0
  0001fc  0240000f             andi.w    #$f, d0
  000200  d040                 add.w     d0, d0
  000202  4ebb00a4             jsr       $1a8(pc, d0.w)
  000206  51cfffcc             dbra      d7, $1d4
  00020a  5345                 subq.w    #$1, d5
  00020c  6e00ff0a             bgt.w     $118
  000210  67d0                 beq.b     $1e2
  000212  3e0d                 move.w    a5, d7
  000214  9e4a                 sub.w     a2, d7
  000216  be6effee             cmp.w     -$12(a6), d7
  00021a  6734                 beq.b     $250
  00021c  6d00009a             blt.w     $2b8
  000220  4a06                 tst.b     d6
  000222  6704                 beq.b     $228
  000224  3ac4                 move.w    d4, (a5)+
  000226  5447                 addq.w    #$2, d7
  000228  612c                 bsr.b     $256
  00022a  5243                 addq.w    #$1, d3
  00022c  3802                 move.w    d2, d4
  00022e  d8eefff0             adda.w    -$10(a6), a4
  000232  536efff2             subq.w    #$1, -$e(a6)
  000236  6e00fe9a             bgt.w     $d2
  00023a  6d24                 blt.b     $260
  00023c  202efffc             move.l    -$4(a6), d0
  000240  e580                 asl.l     #$2, d0
  000242  a322                 _NewHandle 
  000244  6676                 bne.b     $2bc
  000246  2d48ffea             move.l    a0, -$16(a6)
  00024a  2850                 movea.l   (a0), a4
  00024c  6000fe7e             bra.w     $cc
  000250  558d                 subq.l    #$2, a5
  000252  5547                 subq.w    #$2, d7
  000254  60d4                 bra.b     $22a
  000256  303c7fff             move.w    #$7fff, d0
  00025a  3ac0                 move.w    d0, (a5)+
  00025c  5447                 addq.w    #$2, d7
  00025e  4e75                 rts       
  000260  206effea             movea.l   -$16(a6), a0
  000264  2008                 move.l    a0, d0
  000266  6702                 beq.b     $26a
  000268  a023                 _DisposeHandle 
  00026a  0c47000a             cmpi.w    #$a, d7
  00026e  6750                 beq.b     $2c0
  000270  61e4                 bsr.b     $256
  000272  6b44                 bmi.b     $2b8
  000274  41ea000a             lea.l     $a(a2), a0
  000278  383c7fff             move.w    #$7fff, d4
  00027c  3204                 move.w    d4, d1
  00027e  343c8000             move.w    #$8000, d2
  000282  3610                 move.w    (a0), d3
  000284  6018                 bra.b     $29e
  000286  2248                 movea.l   a0, a1
  000288  b258                 cmp.w     (a0)+, d1
  00028a  6f04                 ble.b     $290
  00028c  3228fffe             move.w    -$2(a0), d1
  000290  b858                 cmp.w     (a0)+, d4
  000292  66fc                 bne.b     $290
  000294  b468fffc             cmp.w     -$4(a0), d2
  000298  6c04                 bge.b     $29e
  00029a  3428fffc             move.w    -$4(a0), d2
  00029e  3018                 move.w    (a0)+, d0
  0002a0  b044                 cmp.w     d4, d0
  0002a2  66e2                 bne.b     $286
  0002a4  4843                 swap      d3
  0002a6  3601                 move.w    d1, d3
  0002a8  3829fffe             move.w    -$2(a1), d4
  0002ac  4844                 swap      d4
  0002ae  3802                 move.w    d2, d4
  0002b0  0c47001c             cmpi.w    #$1c, d7
  0002b4  6714                 beq.b     $2ca
  0002b6  6014                 bra.b     $2cc
  0002b8  303cfe0c             move.w    #$fe0c, d0
  0002bc  3d400010             move.w    d0, $10(a6)
  0002c0  206e000c             movea.l   $c(a6), a0
  0002c4  2450                 movea.l   (a0), a2
  0002c6  7600                 moveq     #$0, d3
  0002c8  7800                 moveq     #$0, d4
  0002ca  7e0a                 moveq     #$a, d7
  0002cc  34c7                 move.w    d7, (a2)+
  0002ce  24c3                 move.l    d3, (a2)+
  0002d0  2484                 move.l    d4, (a2)
  0002d2  2007                 move.l    d7, d0
  0002d4  206e000c             movea.l   $c(a6), a0
  0002d8  a024                 _SetHandleSize 
  0002da  206efff4             movea.l   -$c(a6), a0
  0002de  2008                 move.l    a0, d0
  0002e0  6702                 beq.b     $2e4
  0002e2  a023                 _DisposeHandle 
  0002e4  4cdf3cf8             movem.l   (a7)+, d3-d7/a2-a5
  0002e8  4e5e                 unlk      a6
  0002ea  205f                 movea.l   (a7)+, a0
  0002ec  504f                 addq.w    #$8, a7
  0002ee  4ed0                 jmp       (a0)
  0002f0  201f                 move.l    (a7)+, d0
  0002f2  3f3c0402             move.w    #$402, -(a7)
  0002f6  204f                 movea.l   a7, a0
  0002f8  2f00                 move.l    d0, -(a7)
  0002fa  a08b                 _trap_a08b 
  0002fc  205f                 movea.l   (a7)+, a0
  0002fe  4fef000c             lea.l     $c(a7), a7
  000302  4ed0                 jmp       (a0)
  000304  201f                 move.l    (a7)+, d0
  000306  3f3c0403             move.w    #$403, -(a7)
  00030a  204f                 movea.l   a7, a0
  00030c  2f00                 move.l    d0, -(a7)
  00030e  a08b                 _trap_a08b 
  000310  205f                 movea.l   (a7)+, a0
  000312  5c4f                 addq.w    #$6, a7
  000314  3e80                 move.w    d0, (a7)
  000316  4ed0                 jmp       (a0)
  000318  201f                 move.l    (a7)+, d0
  00031a  3f3c0404             move.w    #$404, -(a7)
  00031e  204f                 movea.l   a7, a0
  000320  2f00                 move.l    d0, -(a7)
  000322  a08b                 _trap_a08b 
  000324  205f                 movea.l   (a7)+, a0
  000326  504f                 addq.w    #$8, a7
  000328  4ed0                 jmp       (a0)
  00032a  4a78028e             tst.w     $28e.w
  00032e  6b22                 bmi.b     $352
  000330  303c0090             move.w    #$90, d0
  000334  a346                 _GetTrapAddress 
  000336  2248                 movea.l   a0, a1
  000338  303c009f             move.w    #$9f, d0
  00033c  a746                 _GetTrapAddress 
  00033e  b3c8                 cmpa.l    a0, a1
  000340  6710                 beq.b     $352
  000342  225f                 movea.l   (a7)+, a1
  000344  205f                 movea.l   (a7)+, a0
  000346  301f                 move.w    (a7)+, d0
  000348  2f09                 move.l    a1, -(a7)
  00034a  a090                 _SysEnvirons 
  00034c  3f400004             move.w    d0, $4(a7)
  000350  4e75                 rts       
  000352  206f0004             movea.l   $4(a7), a0
  000356  303c0001             move.w    #$1, d0
  00035a  2248                 movea.l   a0, a1
  00035c  6006                 bra.b     $364
  00035e  0313                 btst.l    d1, (a3)
  000360  0b02                 btst.l    d5, d2
  000362  0100                 btst.l    d0, d0
  000364  303c0010             move.w    #$10, d0
  000368  e240                 asr.w     #$1, d0
  00036a  5340                 subq.w    #$1, d0
  00036c  4258                 clr.w     (a0)+
  00036e  51c8fffc             dbra      d0, $36c
  000372  32bc0002             move.w    #$2, (a1)
  000376  207802ae             movea.l   $2ae.w, a0
  00037a  337cfffe0002         move.w    #$fffe, $2(a1)
  000380  0c2800ff0009         cmpi.b    #$ff, $9(a0)
  000386  6742                 beq.b     $3ca
  000388  4a280008             tst.b     $8(a0)
  00038c  6e20                 bgt.b     $3ae
  00038e  337cffff0002         move.w    #$ffff, $2(a1)
  000394  4a78028e             tst.w     $28e.w
  000398  6b30                 bmi.b     $3ca
  00039a  337c00010002         move.w    #$1, $2(a1)
  0003a0  4a780b22             tst.w     $b22.w
  0003a4  6a24                 bpl.b     $3ca
  0003a6  337c00020002         move.w    #$2, $2(a1)
  0003ac  601c                 bra.b     $3ca
  0003ae  42690002             clr.w     $2(a1)
  0003b2  0c2800020008         cmpi.b    #$2, $8(a0)
  0003b8  6e10                 bgt.b     $3ca
  0003ba  6708                 beq.b     $3c4
  0003bc  337c00040002         move.w    #$4, $2(a1)
  0003c2  6006                 bra.b     $3ca
  0003c4  337c00030002         move.w    #$3, $2(a1)
  0003ca  42690004             clr.w     $4(a1)
  0003ce  0c380002012f         cmpi.b    #$2, $12f.w
  0003d4  6e0a                 bgt.b     $3e0
  0003d6  1038012f             move.b    $12f.w, d0
  0003da  5240                 addq.w    #$1, d0
  0003dc  13400007             move.b    d0, $7(a1)
  0003e0  4a78028e             tst.w     $28e.w
  0003e4  6b0e                 bmi.b     $3f4
  0003e6  083800040b22         btst.b    #$4, $b22.w
  0003ec  6706                 beq.b     $3f4
  0003ee  137c00010008         move.b    #$1, $8(a1)
  0003f4  0c783fff028e         cmpi.w    #$3fff, $28e.w
  0003fa  6206                 bhi.b     $402
  0003fc  137c00010009         move.b    #$1, $9(a1)
  000402  1038021e             move.b    $21e.w, d0
  000406  41faff5b             lea.l     $363(pc), a0
  00040a  323c0004             move.w    #$4, d1
  00040e  b020                 cmp.b     -(a0), d0
  000410  57c9fffc             dbeq      d1, $40e
  000414  5241                 addq.w    #$1, d1
  000416  3341000a             move.w    d1, $a(a1)
  00041a  4a380291             tst.b     $291.w
  00041e  6b18                 bmi.b     $438
  000420  123801fb             move.b    $1fb.w, d1
  000424  0201000f             andi.b    #$f, d1
  000428  0c010001             cmpi.b    #$1, d1
  00042c  660a                 bne.b     $438
  00042e  207802dc             movea.l   $2dc.w, a0
  000432  13680007000d         move.b    $7(a0), $d(a1)
  000438  33780210000e         move.w    $210.w, $e(a1)
  00043e  4a7803f6             tst.w     $3f6.w
  000442  6d44                 blt.b     $488
  000444  4269000e             clr.w     $e(a1)
  000448  323c003c             move.w    #$3c, d1
  00044c  4267                 clr.w     -(a7)
  00044e  51c9fffc             dbra      d1, $44c
  000452  204f                 movea.l   a7, a0
  000454  31780a580018         move.w    $a58.w, $18(a0)
  00045a  7008                 moveq     #$8, d0
  00045c  a260                 _HFSDispatch 
  00045e  6624                 bne.b     $484
  000460  316800340016         move.w    $34(a0), $16(a0)
  000466  a207                 _GetVolInfo 
  000468  661a                 bne.b     $484
  00046a  2168005a0030         move.l    $5a(a0), $30(a0)
  000470  217c4552494b001c     move.l    #$4552494b, $1c(a0)
  000478  7001                 moveq     #$1, d0
  00047a  a260                 _HFSDispatch 
  00047c  6606                 bne.b     $484
  00047e  33680016000e         move.w    $16(a0), $e(a1)
  000484  4fef007a             lea.l     $7a(a7), a7
  000488  2049                 movea.l   a1, a0
  00048a  225f                 movea.l   (a7)+, a1
  00048c  5c4f                 addq.w    #$6, a7
  00048e  3ebcea84             move.w    #$ea84, (a7)
  000492  4ed1                 jmp       (a1)
  000494  4e560000             link.w    a6, #$0
  000498  203c0000a89f         move.l    #$a89f, d0
  00049e  a746                 _GetTrapAddress 
  0004a0  2f08                 move.l    a0, -(a7)
  0004a2  203c0000a0ad         move.l    #$a0ad, d0
  0004a8  a346                 _GetTrapAddress 
  0004aa  b1df                 cmpa.l    (a7)+, a0
  0004ac  670e                 beq.b     $4bc
  0004ae  202e000c             move.l    $c(a6), d0
  0004b2  a1ad                 _Gestalt  
  0004b4  226e0008             movea.l   $8(a6), a1
  0004b8  2288                 move.l    a0, (a1)
  0004ba  6026                 bra.b     $4e2
  0004bc  41fa0036             lea.l     $4f4(pc), a0
  0004c0  303cea51             move.w    #$ea51, d0
  0004c4  222e000c             move.l    $c(a6), d1
  0004c8  b298                 cmp.l     (a0)+, d1
  0004ca  6706                 beq.b     $4d2
  0004cc  4a98                 tst.l     (a0)+
  0004ce  6712                 beq.b     $4e2
  0004d0  60f6                 bra.b     $4c8
  0004d2  43fa0020             lea.l     $4f4(pc), a1
  0004d6  d3d0                 adda.l    (a0), a1
  0004d8  4ed1                 jmp       (a1)
  0004da  226e0008             movea.l   $8(a6), a1
  0004de  2280                 move.l    d0, (a1)
  0004e0  4240                 clr.w     d0
  0004e2  3d400010             move.w    d0, $10(a6)
  0004e6  4e5e                 unlk      a6
  0004e8  205f                 movea.l   (a7)+, a0
  0004ea  508f                 addq.l    #$8, a7
  0004ec  4ed0                 jmp       (a0)
  0004ee  303cea52             move.w    #$ea52, d0
  0004f2  60ee                 bra.b     $4e2
  0004f4  7665                 moveq     #$65, d3
  0004f6  7273                 moveq     #$73, d1
  0004f8  00000060             ori.b     #$60, d0
  0004fc  6d61                 blt.b     $55f
  0004fe  6368                 bls.b     $568
  000500  00000064             ori.b     #$64, d0
  000504  7379                 dc.w      $7379
  000506  7376                 dc.w      $7376
  000508  00000088             ori.b     #$88, d0
  00050c  7072                 moveq     #$72, d0
  00050e  6f63                 ble.b     $573
  000510  00000092             ori.b     #$92, d0
  000514  6670                 bne.b     $586
  000516  7520                 dc.w      $7520
  000518  0000009e             ori.b     #$9e, d0
  00051c  7164                 dc.w      $7164
  00051e  2020                 move.l    -(a0), d0
  000520  000000e8             ori.b     #$e8, d0
  000524  6b62                 bmi.b     $588
  000526  6420                 bcc.b     $548
  000528  0000011a             ori.b     #$1a, d0
  00052c  6174                 bsr.b     $5a2
  00052e  6c6b                 bge.b     $59b
  000530  00000142             ori.b     #$42, d0
  000534  6d6d                 blt.b     $5a3
  000536  7520                 dc.w      $7520
  000538  00000164             ori.b     #$64, d0
  00053c  7261                 moveq     #$61, d1
  00053e  6d20                 blt.b     $560
  000540  00000188             ori.b     #$88, d0
  000544  6c72                 bge.b     $5b8
  000546  616d                 bsr.b     $5b5
  000548  00000188             ori.b     #$88, d0
  00054c  00000000             ori.b     #$0, d0
  000550  00000000             ori.b     #$0, d0
  000554  7001                 moveq     #$1, d0
  000556  6082                 bra.b     $4da
  000558  227802ae             movea.l   $2ae.w, a1
  00055c  7004                 moveq     #$4, d0
  00055e  0c6900750008         cmpi.w    #$75, $8(a1)
  000564  6712                 beq.b     $578
  000566  0c6902760008         cmpi.w    #$276, $8(a1)
  00056c  6604                 bne.b     $572
  00056e  5240                 addq.w    #$1, d0
  000570  6006                 bra.b     $578
  000572  10380cb3             move.b    $cb3.w, d0
  000576  5c80                 addq.l    #$6, d0
  000578  6000ff60             bra.w     $4da
  00057c  7000                 moveq     #$0, d0
  00057e  3038015a             move.w    $15a.w, d0
  000582  6000ff56             bra.w     $4da
  000586  7000                 moveq     #$0, d0
  000588  1038012f             move.b    $12f.w, d0
  00058c  5240                 addq.w    #$1, d0
  00058e  6000ff4a             bra.w     $4da
  000592  0c380004012f         cmpi.b    #$4, $12f.w
  000598  6738                 beq.b     $5d2
  00059a  083800040b22         btst.b    #$4, $b22.w
  0005a0  6734                 beq.b     $5d6
  0005a2  204f                 movea.l   a7, a0
  0005a4  f2800000             fnop      
  0005a8  f327                 fsave     -(a7)
  0005aa  3017                 move.w    (a7), d0
  0005ac  2e48                 movea.l   a0, a7
  0005ae  0c401f18             cmpi.w    #$1f18, d0
  0005b2  6716                 beq.b     $5ca
  0005b4  0c403f18             cmpi.w    #$3f18, d0
  0005b8  6710                 beq.b     $5ca
  0005ba  0c403f38             cmpi.w    #$3f38, d0
  0005be  670e                 beq.b     $5ce
  0005c0  0c401f38             cmpi.w    #$1f38, d0
  0005c4  6708                 beq.b     $5ce
  0005c6  7000                 moveq     #$0, d0
  0005c8  600e                 bra.b     $5d8
  0005ca  7001                 moveq     #$1, d0
  0005cc  600a                 bra.b     $5d8
  0005ce  7002                 moveq     #$2, d0
  0005d0  6006                 bra.b     $5d8
  0005d2  7003                 moveq     #$3, d0
  0005d4  6002                 bra.b     $5d8
  0005d6  7000                 moveq     #$0, d0
  0005d8  6000ff00             bra.w     $4da
  0005dc  0c783fff028e         cmpi.w    #$3fff, $28e.w
  0005e2  6e1c                 bgt.b     $600
  0005e4  303ca89f             move.w    #$a89f, d0
  0005e8  a746                 _GetTrapAddress 
  0005ea  2408                 move.l    a0, d2
  0005ec  203c0000ab03         move.l    #$ab03, d0
  0005f2  a746                 _GetTrapAddress 
  0005f4  203c00000100         move.l    #$100, d0
  0005fa  b488                 cmp.l     a0, d2
  0005fc  6606                 bne.b     $604
  0005fe  600a                 bra.b     $60a
  000600  7000                 moveq     #$0, d0
  000602  6006                 bra.b     $60a
  000604  203c00000200         move.l    #$200, d0
  00060a  6000fece             bra.w     $4da
  00060e  1038021e             move.b    $21e.w, d0
  000612  41fa0016             lea.l     $62a(pc), a0
  000616  2248                 movea.l   a0, a1
  000618  1218                 move.b    (a0)+, d1
  00061a  6700fed2             beq.w     $4ee
  00061e  b200                 cmp.b     d0, d1
  000620  66f6                 bne.b     $618
  000622  91c9                 suba.l    a1, a0
  000624  2008                 move.l    a0, d0
  000626  6000feb2             bra.w     $4da
  00062a  0313                 btst.l    d1, (a3)
  00062c  0b02                 btst.l    d5, d2
  00062e  0106                 btst.l    d0, d6
  000630  0704                 btst.l    d3, d4
  000632  05080900             movep.w   $900(a0), d2
  000636  7000                 moveq     #$0, d0
  000638  4a380291             tst.b     $291.w
  00063c  6b16                 bmi.b     $654
  00063e  123801fb             move.b    $1fb.w, d1
  000642  0201000f             andi.b    #$f, d1
  000646  0c010001             cmpi.b    #$1, d1
  00064a  6608                 bne.b     $654
  00064c  207802dc             movea.l   $2dc.w, a0
  000650  10280007             move.b    $7(a0), d0
  000654  6000fe84             bra.w     $4da
  000658  0c380002012f         cmpi.b    #$2, $12f.w
  00065e  6d16                 blt.b     $676
  000660  7000                 moveq     #$0, d0
  000662  10380cb1             move.b    $cb1.w, d0
  000666  0c000001             cmpi.b    #$1, d0
  00066a  670c                 beq.b     $678
  00066c  0c000003             cmpi.b    #$3, d0
  000670  6d04                 blt.b     $676
  000672  5340                 subq.w    #$1, d0
  000674  6002                 bra.b     $678
  000676  7000                 moveq     #$0, d0
  000678  6000fe60             bra.w     $4da
  00067c  303ca89f             move.w    #$a89f, d0
  000680  a746                 _GetTrapAddress 
  000682  2408                 move.l    a0, d2
  000684  203c0000a88f         move.l    #$a88f, d0
  00068a  a746                 _GetTrapAddress 
  00068c  20380108             move.l    $108.w, d0
  000690  b488                 cmp.l     a0, d2
  000692  670a                 beq.b     $69e
  000694  598f                 subq.l    #$4, a7
  000696  3f3c0016             move.w    #$16, -(a7)
  00069a  a88f                 _trap_a88f 
  00069c  201f                 move.l    (a7)+, d0
  00069e  6000fe3a             bra.w     $4da
  0006a2  225f                 movea.l   (a7)+, a1
  0006a4  205f                 movea.l   (a7)+, a0
  0006a6  a025                 _GetHandleSize 
  0006a8  2e80                 move.l    d0, (a7)
  0006aa  6a02                 bpl.b     $6ae
  0006ac  4297                 clr.l     (a7)
  0006ae  4ed1                 jmp       (a1)
  0006b0  225f                 movea.l   (a7)+, a1
  0006b2  121f                 move.b    (a7)+, d1
  0006b4  301f                 move.w    (a7)+, d0
  0006b6  4a01                 tst.b     d1
  0006b8  6704                 beq.b     $6be
  0006ba  a746                 _GetTrapAddress 
  0006bc  6002                 bra.b     $6c0
  0006be  a346                 _GetTrapAddress 
  0006c0  2e88                 move.l    a0, (a7)
  0006c2  4ed1                 jmp       (a1)
  0006c4  206f000c             movea.l   $c(a7), a0
  0006c8  226f0008             movea.l   $8(a7), a1
  0006cc  7000                 moveq     #$0, d0
  0006ce  1018                 move.b    (a0)+, d0
  0006d0  4840                 swap      d0
  0006d2  1019                 move.b    (a1)+, d0
  0006d4  4a2f0004             tst.b     $4(a7)
  0006d8  670e                 beq.b     $6e8
  0006da  4a2f0006             tst.b     $6(a7)
  0006de  6704                 beq.b     $6e4
  0006e0  a43c                 _CmpString 
  0006e2  6010                 bra.b     $6f4
  0006e4  a03c                 _CmpString 
  0006e6  600c                 bra.b     $6f4
  0006e8  4a2f0006             tst.b     $6(a7)
  0006ec  6704                 beq.b     $6f2
  0006ee  a63c                 _CmpString 
  0006f0  6002                 bra.b     $6f4
  0006f2  a23c                 _CmpString 
  0006f4  0a000001             eori.b    #$1, d0
  0006f8  1f400010             move.b    d0, $10(a7)
  0006fc  205f                 movea.l   (a7)+, a0
  0006fe  4fef000c             lea.l     $c(a7), a7
  000702  4ed0                 jmp       (a0)
  000704  225f                 movea.l   (a7)+, a1
  000706  121f                 move.b    (a7)+, d1
  000708  205f                 movea.l   (a7)+, a0
  00070a  7000                 moveq     #$0, d0
  00070c  1018                 move.b    (a0)+, d0
  00070e  2f09                 move.l    a1, -(a7)
  000710  4a01                 tst.b     d1
  000712  6704                 beq.b     $718
  000714  a054                 _UprString 
  000716  6002                 bra.b     $71a
  000718  a254                 _UprString 
  00071a  4e75                 rts       
  00071c  4e56ffce             link.w    a6, #$ffce
  000720  204f                 movea.l   a7, a0
  000722  316e00080018         move.w    $8(a6), $18(a0)
  000728  a001                 _Close    
  00072a  3d40000a             move.w    d0, $a(a6)
  00072e  4e5e                 unlk      a6
  000730  205f                 movea.l   (a7)+, a0
  000732  548f                 addq.l    #$2, a7
  000734  4ed0                 jmp       (a0)
  000736  51c1                 sf.b      d1
  000738  6002                 bra.b     $73c
  00073a  50c1                 st.b      d1
  00073c  4e56ffce             link.w    a6, #$ffce
  000740  204f                 movea.l   a7, a0
  000742  216e00080020         move.l    $8(a6), $20(a0)
  000748  316e00100018         move.w    $10(a6), $18(a0)
  00074e  226e000c             movea.l   $c(a6), a1
  000752  21510024             move.l    (a1), $24(a0)
  000756  4268002c             clr.w     $2c(a0)
  00075a  42a8002e             clr.l     $2e(a0)
  00075e  4a01                 tst.b     d1
  000760  6604                 bne.b     $766
  000762  a002                 _Read     
  000764  6002                 bra.b     $768
  000766  a003                 _Write    
  000768  3d400012             move.w    d0, $12(a6)
  00076c  226e000c             movea.l   $c(a6), a1
  000770  22a80028             move.l    $28(a0), (a1)
  000774  4e5e                 unlk      a6
  000776  225f                 movea.l   (a7)+, a1
  000778  4fef000a             lea.l     $a(a7), a7
  00077c  4ed1                 jmp       (a1)
  00077e  4e56ffc0             link.w    a6, #$ffc0
  000782  204f                 movea.l   a7, a0
  000784  316e00080016         move.w    $8(a6), $16(a0)
  00078a  216e000a0012         move.l    $a(a6), $12(a0)
  000790  a013                 _FlushVol 
  000792  3d40000e             move.w    d0, $e(a6)
  000796  4e5e                 unlk      a6
  000798  225f                 movea.l   (a7)+, a1
  00079a  5c8f                 addq.l    #$6, a7
  00079c  4ed1                 jmp       (a1)
  00079e  4e56ffce             link.w    a6, #$ffce
  0007a2  204f                 movea.l   a7, a0
  0007a4  316e000c0018         move.w    $c(a6), $18(a0)
  0007aa  a011                 _GetEOF   
  0007ac  3d40000e             move.w    d0, $e(a6)
  0007b0  226e0008             movea.l   $8(a6), a1
  0007b4  22a8001c             move.l    $1c(a0), (a1)
  0007b8  4e5e                 unlk      a6
  0007ba  225f                 movea.l   (a7)+, a1
  0007bc  5c8f                 addq.l    #$6, a7
  0007be  4ed1                 jmp       (a1)
  0007c0  4e56ffce             link.w    a6, #$ffce
  0007c4  204f                 movea.l   a7, a0
  0007c6  316e000e0018         move.w    $e(a6), $18(a0)
  0007cc  316e000c002c         move.w    $c(a6), $2c(a0)
  0007d2  216e0008002e         move.l    $8(a6), $2e(a0)
  0007d8  a044                 _SetFPos  
  0007da  3d400010             move.w    d0, $10(a6)
  0007de  4e5e                 unlk      a6
  0007e0  225f                 movea.l   (a7)+, a1
  0007e2  508f                 addq.l    #$8, a7
  0007e4  4ed1                 jmp       (a1)
  0007e6  205f                 movea.l   (a7)+, a0
  0007e8  301f                 move.w    (a7)+, d0
  0007ea  2f08                 move.l    a0, -(a7)
  0007ec  4e56ffe0             link.w    a6, #$ffe0
  0007f0  204f                 movea.l   a7, a0
  0007f2  317cfffc0018         move.w    #$fffc, $18(a0)
  0007f8  317c0002001a         move.w    #$2, $1a(a0)
  0007fe  3140001c             move.w    d0, $1c(a0)
  000802  a204                 _Control  
  000804  4e5e                 unlk      a6
  000806  4e75                 rts       
  000808  20780ae8             movea.l   $ae8.w, a0
  00080c  2008                 move.l    a0, d0
  00080e  6a1e                 bpl.b     $82e
  000810  703a                 moveq     #$3a, d0
  000812  a322                 _NewHandle 
  000814  660000e0             bne.w     $8f6
  000818  a029                 _HLock    
  00081a  21c80ae8             move.l    a0, $ae8.w
  00081e  2250                 movea.l   (a0), a1
  000820  2378033c0034         move.l    $33c.w, $34(a1)
  000826  43fa010c             lea.l     $934(pc), a1
  00082a  21c9033c             move.l    a1, $33c.w
  00082e  2250                 movea.l   (a0), a1
  000830  4a690010             tst.w     $10(a1)
  000834  6f000084             ble.w     $8ba
  000838  222f0004             move.l    $4(a7), d1
  00083c  b0b80a06             cmp.l     $a06.w, d0
  000840  6772                 beq.b     $8b4
  000842  50e90039             st.b      $39(a1)
  000846  32290032             move.w    $32(a1), d1
  00084a  2408                 move.l    a0, d2
  00084c  48e76000             movem.l   d1-d2, -(a7)
  000850  a9e1                 _HandToHand 
  000852  4cdf0006             movem.l   (a7)+, d1-d2
  000856  4a40                 tst.w     d0
  000858  66000098             bne.w     $8f2
  00085c  7000                 moveq     #$0, d0
  00085e  0641000c             addi.w    #$c, d1
  000862  3001                 move.w    d1, d0
  000864  a024                 _SetHandleSize 
  000866  6600008a             bne.w     $8f2
  00086a  a029                 _HLock    
  00086c  21c80ae8             move.l    a0, $ae8.w
  000870  2250                 movea.l   (a0), a1
  000872  2078027a             movea.l   $27a.w, a0
  000876  21490008             move.l    a1, $8(a0)
  00087a  2149000c             move.l    a1, $c(a0)
  00087e  2042                 movea.l   d2, a0
  000880  2050                 movea.l   (a0), a0
  000882  10280038             move.b    $38(a0), d0
  000886  81290038             or.b      d0, $38(a1)
  00088a  2042                 movea.l   d2, a0
  00088c  a023                 _DisposeHandle 
  00088e  33410032             move.w    d1, $32(a1)
  000892  08a900000038         bclr.b    #$0, $38(a1)
  000898  6708                 beq.b     $8a2
  00089a  42690010             clr.w     $10(a1)
  00089e  4eba00a0             jsr       $940(pc)
  0008a2  51e90039             sf.b      $39(a1)
  0008a6  d2c1                 adda.w    d1, a1
  0008a8  700c                 moveq     #$c, d0
  0008aa  92c0                 suba.w    d0, a1
  0008ac  41ef0004             lea.l     $4(a7), a0
  0008b0  a02e                 _BlockMove 
  0008b2  6042                 bra.b     $8f6
  0008b4  30290010             move.w    $10(a1), d0
  0008b8  6efa                 bgt.b     $8b4
  0008ba  2049                 movea.l   a1, a0
  0008bc  317c003a0032         move.w    #$3a, $32(a0)
  0008c2  216f00080024         move.l    $8(a7), $24(a0)
  0008c8  216f000c0020         move.l    $c(a7), $20(a0)
  0008ce  317cfffc0018         move.w    #$fffc, $18(a0)
  0008d4  222f0004             move.l    $4(a7), d1
  0008d8  b2b80a06             cmp.l     $a06.w, d1
  0008dc  6604                 bne.b     $8e2
  0008de  a003                 _Write    
  0008e0  6012                 bra.b     $8f4
  0008e2  2141001c             move.l    d1, $1c(a0)
  0008e6  43fa0058             lea.l     $940(pc), a1
  0008ea  2149000c             move.l    a1, $c(a0)
  0008ee  a403                 _Write    
  0008f0  4a40                 tst.w     d0
  0008f2  6702                 beq.b     $8f6
  0008f4  6108                 bsr.b     $8fe
  0008f6  225f                 movea.l   (a7)+, a1
  0008f8  4fef000c             lea.l     $c(a7), a7
  0008fc  4ed1                 jmp       (a1)
  0008fe  20780ae8             movea.l   $ae8.w, a0
  000902  b0f80a06             cmpa.w    $a06.w, a0
  000906  6710                 beq.b     $918
  000908  2250                 movea.l   (a0), a1
  00090a  21e90034033c         move.l    $34(a1), $33c.w
  000910  a023                 _DisposeHandle 
  000912  21f80a060ae8         move.l    $a06.w, $ae8.w
  000918  4e75                 rts       
  00091a  4e56ffe0             link.w    a6, #$ffe0
  00091e  41eeffe0             lea.l     -$20(a6), a0
  000922  317cfffc0018         move.w    #$fffc, $18(a0)
  000928  a206                 _KillIO   
  00092a  42780280             clr.w     $280.w
  00092e  61ce                 bsr.b     $8fe
  000930  4e5e                 unlk      a6
  000932  4e75                 rts       
  000934  61e4                 bsr.b     $91a
  000936  2038033c             move.l    $33c.w, d0
  00093a  6ff6                 ble.b     $932
  00093c  2040                 movea.l   d0, a0
  00093e  4ed0                 jmp       (a0)
  000940  48e7e0c0             movem.l   d0-d2/a0-a1, -(a7)
  000944  20780ae8             movea.l   $ae8.w, a0
  000948  2050                 movea.l   (a0), a0
  00094a  4a280039             tst.b     $39(a0)
  00094e  6706                 beq.b     $956
  000950  50e80038             st.b      $38(a0)
  000954  6068                 bra.b     $9be
  000956  30280032             move.w    $32(a0), d0
  00095a  2228001c             move.l    $1c(a0), d1
  00095e  670c                 beq.b     $96c
  000960  2241                 movea.l   d1, a1
  000962  48e78080             movem.l   d0/a0, -(a7)
  000966  4e91                 jsr       (a1)
  000968  4cdf0101             movem.l   (a7)+, d0/a0
  00096c  0c40003a             cmpi.w    #$3a, d0
  000970  6606                 bne.b     $978
  000972  4ebaff8a             jsr       $8fe(pc)
  000976  6046                 bra.b     $9be
  000978  2248                 movea.l   a0, a1
  00097a  41e8003a             lea.l     $3a(a0), a0
  00097e  2358001c             move.l    (a0)+, $1c(a1)
  000982  23580024             move.l    (a0)+, $24(a1)
  000986  23580020             move.l    (a0)+, $20(a1)
  00098a  337cfffc0018         move.w    #$fffc, $18(a1)
  000990  7246                 moveq     #$46, d1
  000992  9041                 sub.w     d1, d0
  000994  6712                 beq.b     $9a8
  000996  3200                 move.w    d0, d1
  000998  48c0                 ext.l     d0
  00099a  2248                 movea.l   a0, a1
  00099c  92fc000c             suba.w    #$c, a1
  0009a0  a02e                 _BlockMove 
  0009a2  0641003a             addi.w    #$3a, d1
  0009a6  6002                 bra.b     $9aa
  0009a8  723a                 moveq     #$3a, d1
  0009aa  20780ae8             movea.l   $ae8.w, a0
  0009ae  2050                 movea.l   (a0), a0
  0009b0  31410032             move.w    d1, $32(a0)
  0009b4  43faff8a             lea.l     $940(pc), a1
  0009b8  2149000c             move.l    a1, $c(a0)
  0009bc  a403                 _Write    
  0009be  4cdf0307             movem.l   (a7)+, d0-d2/a0-a1
  0009c2  4e75                 rts       
  0009c4  225f                 movea.l   (a7)+, a1
  0009c6  50d7                 st.b      (a7)
  0009c8  20780ae8             movea.l   $ae8.w, a0
  0009cc  b0f80a06             cmpa.w    $a06.w, a0
  0009d0  6708                 beq.b     $9da
  0009d2  2050                 movea.l   (a0), a0
  0009d4  4a680010             tst.w     $10(a0)
  0009d8  5fd7                 sle.b     (a7)
  0009da  4417                 neg.b     (a7)
  0009dc  4ed1                 jmp       (a1)
  0009de  206f0008             movea.l   $8(a7), a0
  0009e2  3f3c0001             move.w    #$1, -(a7)
  0009e6  a9ee                 _Pack7_BinDec 
  0009e8  206f0004             movea.l   $4(a7), a0
  0009ec  2080                 move.l    d0, (a0)
  0009ee  4efa000e             jmp       $9fe(pc)
  0009f2  206f0004             movea.l   $4(a7), a0
  0009f6  202f0008             move.l    $8(a7), d0
  0009fa  4267                 clr.w     -(a7)
  0009fc  a9ee                 _Pack7_BinDec 
  0009fe  205f                 movea.l   (a7)+, a0
  000a00  504f                 addq.w    #$8, a7
  000a02  4ed0                 jmp       (a0)
  000a04  225f                 movea.l   (a7)+, a1
  000a06  201f                 move.l    (a7)+, d0
  000a08  08380006028e         btst.b    #$6, $28e.w
  000a0e  6606                 bne.b     $a16
  000a10  a055                 _StripAddress 
  000a12  2e80                 move.l    d0, (a7)
  000a14  4ed1                 jmp       (a1)
  000a16  c0b8031a             and.l     $31a.w, d0
  000a1a  2e80                 move.l    d0, (a7)
  000a1c  4ed1                 jmp       (a1)
  000a1e  206f0004             movea.l   $4(a7), a0
  000a22  2050                 movea.l   (a0), a0
  000a24  a9e1                 _HandToHand 
  000a26  226f0004             movea.l   $4(a7), a1
  000a2a  2288                 move.l    a0, (a1)
  000a2c  3f400008             move.w    d0, $8(a7)
  000a30  2e9f                 move.l    (a7)+, (a7)
  000a32  4e75                 rts       
  000a34  206f000c             movea.l   $c(a7), a0
  000a38  202f0004             move.l    $4(a7), d0
  000a3c  a9e3                 _PtrToHand 
  000a3e  3f400010             move.w    d0, $10(a7)
  000a42  226f0008             movea.l   $8(a7), a1
  000a46  2288                 move.l    a0, (a1)
  000a48  205f                 movea.l   (a7)+, a0
  000a4a  4fef000c             lea.l     $c(a7), a7
  000a4e  4ed0                 jmp       (a0)
  000a50  4e560000             link.w    a6, #$0
  000a54  594f                 subq.w    #$4, a7
  000a56  2f3c53545223         move.l    #$53545223, -(a7)
  000a5c  3f2e000a             move.w    $a(a6), -(a7)
  000a60  a9a0                 _GetResource 
  000a62  226e000c             movea.l   $c(a6), a1
  000a66  4211                 clr.b     (a1)
  000a68  201f                 move.l    (a7)+, d0
  000a6a  6722                 beq.b     $a8e
  000a6c  2040                 movea.l   d0, a0
  000a6e  2050                 movea.l   (a0), a0
  000a70  3018                 move.w    (a0)+, d0
  000a72  322e0008             move.w    $8(a6), d1
  000a76  6716                 beq.b     $a8e
  000a78  b240                 cmp.w     d0, d1
  000a7a  6212                 bhi.b     $a8e
  000a7c  7000                 moveq     #$0, d0
  000a7e  5341                 subq.w    #$1, d1
  000a80  6706                 beq.b     $a88
  000a82  1018                 move.b    (a0)+, d0
  000a84  d1c0                 adda.l    d0, a0
  000a86  60f6                 bra.b     $a7e
  000a88  1010                 move.b    (a0), d0
  000a8a  5240                 addq.w    #$1, d0
  000a8c  a02e                 _BlockMove 
  000a8e  4e5e                 unlk      a6
  000a90  205f                 movea.l   (a7)+, a0
  000a92  508f                 addq.l    #$8, a7
  000a94  4ed0                 jmp       (a0)
  000a96  4e56ffcc             link.w    a6, #$ffcc
  000a9a  2f03                 move.l    d3, -(a7)
  000a9c  2d6e0010ffde         move.l    $10(a6), -$22(a6)
  000aa2  41eeffcc             lea.l     -$34(a6), a0
  000aa6  a214                 _GetVol   
  000aa8  3600                 move.w    d0, d3
  000aaa  206e000c             movea.l   $c(a6), a0
  000aae  30aeffe2             move.w    -$1e(a6), (a0)
  000ab2  206e0008             movea.l   $8(a6), a0
  000ab6  20aefffc             move.l    -$4(a6), (a0)
  000aba  3003                 move.w    d3, d0
  000abc  3d400014             move.w    d0, $14(a6)
  000ac0  261f                 move.l    (a7)+, d3
  000ac2  4e5e                 unlk      a6
  000ac4  205f                 movea.l   (a7)+, a0
  000ac6  4fef000c             lea.l     $c(a7), a7
  000aca  4ed0                 jmp       (a0)
  000acc  4e56ff84             link.w    a6, #$ff84
  000ad0  2f03                 move.l    d3, -(a7)
  000ad2  3d6e0016ff9a         move.w    $16(a6), -$66(a6)
  000ad8  2d6e0012ffb4         move.l    $12(a6), -$4c(a6)
  000ade  2d6e000eff96         move.l    $e(a6), -$6a(a6)
  000ae4  422eff9e             clr.b     -$62(a6)
  000ae8  1d6e000cff9f         move.b    $c(a6), -$61(a6)
  000aee  7000                 moveq     #$0, d0
  000af0  2d40ffa0             move.l    d0, -$60(a6)
  000af4  41eeff84             lea.l     -$7c(a6), a0
  000af8  a200                 _Open     
  000afa  3600                 move.w    d0, d3
  000afc  206e0008             movea.l   $8(a6), a0
  000b00  30aeff9c             move.w    -$64(a6), (a0)
  000b04  3003                 move.w    d3, d0
  000b06  3d400018             move.w    d0, $18(a6)
  000b0a  261f                 move.l    (a7)+, d3
  000b0c  4e5e                 unlk      a6
  000b0e  205f                 movea.l   (a7)+, a0
  000b10  4fef0010             lea.l     $10(a7), a7
  000b14  4ed0                 jmp       (a0)
  000b16  4e56ff84             link.w    a6, #$ff84
  000b1a  48e71800             movem.l   d3-d4, -(a7)
  000b1e  3d6e0018ff9a         move.w    $18(a6), -$66(a6)
  000b24  262e0014             move.l    $14(a6), d3
  000b28  2d43ffb4             move.l    d3, -$4c(a6)
  000b2c  2d6e0010ff96         move.l    $10(a6), -$6a(a6)
  000b32  422eff9e             clr.b     -$62(a6)
  000b36  41eeff84             lea.l     -$7c(a6), a0
  000b3a  a208                 _Create   
  000b3c  3800                 move.w    d0, d4
  000b3e  6628                 bne.b     $b68
  000b40  4240                 clr.w     d0
  000b42  3d40ffa0             move.w    d0, -$60(a6)
  000b46  41eeff84             lea.l     -$7c(a6), a0
  000b4a  a20c                 _GetFileInfo 
  000b4c  3800                 move.w    d0, d4
  000b4e  6618                 bne.b     $b68
  000b50  2d6e000cffa8         move.l    $c(a6), -$58(a6)
  000b56  2d6e0008ffa4         move.l    $8(a6), -$5c(a6)
  000b5c  2d43ffb4             move.l    d3, -$4c(a6)
  000b60  41eeff84             lea.l     -$7c(a6), a0
  000b64  a20d                 _SetFileInfo 
  000b66  3800                 move.w    d0, d4
  000b68  3004                 move.w    d4, d0
  000b6a  3d40001a             move.w    d0, $1a(a6)
  000b6e  4cdf0018             movem.l   (a7)+, d3-d4
  000b72  4e5e                 unlk      a6
  000b74  205f                 movea.l   (a7)+, a0
  000b76  4fef0012             lea.l     $12(a7), a7
  000b7a  4ed0                 jmp       (a0)
  000b7c  4e56ff84             link.w    a6, #$ff84
  000b80  2f03                 move.l    d3, -(a7)
  000b82  3d6e0014ff9a         move.w    $14(a6), -$66(a6)
  000b88  2d6e0010ffb4         move.l    $10(a6), -$4c(a6)
  000b8e  2d6e000cff96         move.l    $c(a6), -$6a(a6)
  000b94  422eff9e             clr.b     -$62(a6)
  000b98  4240                 clr.w     d0
  000b9a  3d40ffa0             move.w    d0, -$60(a6)
  000b9e  41eeff84             lea.l     -$7c(a6), a0
  000ba2  a20c                 _GetFileInfo 
  000ba4  3600                 move.w    d0, d3
  000ba6  41eeffa4             lea.l     -$5c(a6), a0
  000baa  226e0008             movea.l   $8(a6), a1
  000bae  22d8                 move.l    (a0)+, (a1)+
  000bb0  22d8                 move.l    (a0)+, (a1)+
  000bb2  22d8                 move.l    (a0)+, (a1)+
  000bb4  22d8                 move.l    (a0)+, (a1)+
  000bb6  3003                 move.w    d3, d0
  000bb8  3d400016             move.w    d0, $16(a6)
  000bbc  261f                 move.l    (a7)+, d3
  000bbe  4e5e                 unlk      a6
  000bc0  205f                 movea.l   (a7)+, a0
  000bc2  4fef000e             lea.l     $e(a7), a7
  000bc6  4ed0                 jmp       (a0)
  000bc8  4e56ff84             link.w    a6, #$ff84
  000bcc  48e71800             movem.l   d3-d4, -(a7)
  000bd0  3d6e0014ff9a         move.w    $14(a6), -$66(a6)
  000bd6  262e0010             move.l    $10(a6), d3
  000bda  2d43ffb4             move.l    d3, -$4c(a6)
  000bde  2d6e000cff96         move.l    $c(a6), -$6a(a6)
  000be4  422eff9e             clr.b     -$62(a6)
  000be8  4240                 clr.w     d0
  000bea  3d40ffa0             move.w    d0, -$60(a6)
  000bee  41eeff84             lea.l     -$7c(a6), a0
  000bf2  a20c                 _GetFileInfo 
  000bf4  3800                 move.w    d0, d4
  000bf6  661c                 bne.b     $c14
  000bf8  206e0008             movea.l   $8(a6), a0
  000bfc  43eeffa4             lea.l     -$5c(a6), a1
  000c00  22d8                 move.l    (a0)+, (a1)+
  000c02  22d8                 move.l    (a0)+, (a1)+
  000c04  22d8                 move.l    (a0)+, (a1)+
  000c06  22d8                 move.l    (a0)+, (a1)+
  000c08  2d43ffb4             move.l    d3, -$4c(a6)
  000c0c  41eeff84             lea.l     -$7c(a6), a0
  000c10  a20d                 _SetFileInfo 
  000c12  3800                 move.w    d0, d4
  000c14  3004                 move.w    d4, d0
  000c16  3d400016             move.w    d0, $16(a6)
  000c1a  4cdf0018             movem.l   (a7)+, d3-d4
  000c1e  4e5e                 unlk      a6
  000c20  205f                 movea.l   (a7)+, a0
  000c22  4fef000e             lea.l     $e(a7), a7
  000c26  4ed0                 jmp       (a0)
  000c28  4e56ff74             link.w    a6, #$ff74
  000c2c  48e71c00             movem.l   d3-d5, -(a7)
  000c30  282e0012             move.l    $12(a6), d4
  000c34  3a2e0016             move.w    $16(a6), d5
  000c38  422eff78             clr.b     -$88(a6)
  000c3c  554f                 subq.w    #$2, a7
  000c3e  2f3c666f6c64         move.l    #$666f6c64, -(a7)
  000c44  486eff74             pea.l     -$8c(a6)
  000c48  4ebaf84a             jsr       $494(pc)
  000c4c  301f                 move.w    (a7)+, d0
  000c4e  6610                 bne.b     $c60
  000c50  202eff74             move.l    -$8c(a6), d0
  000c54  7201                 moveq     #$1, d1
  000c56  c081                 and.l     d1, d0
  000c58  6706                 beq.b     $c60
  000c5a  1d7c0001ff78         move.b    #$1, -$88(a6)
  000c60  102eff78             move.b    -$88(a6), d0
  000c64  6720                 beq.b     $c86
  000c66  554f                 subq.w    #$2, a7
  000c68  3f05                 move.w    d5, -(a7)
  000c6a  2f04                 move.l    d4, -(a7)
  000c6c  1f2e0010             move.b    $10(a6), -(a7)
  000c70  2f2e000c             move.l    $c(a6), -(a7)
  000c74  2f2e0008             move.l    $8(a6), -(a7)
  000c78  7000                 moveq     #$0, d0
  000c7a  a823                 _AliasDispatch 
  000c7c  301f                 move.w    (a7)+, d0
  000c7e  3d400018             move.w    d0, $18(a6)
  000c82  4efa00f8             jmp       $d7c(pc)
  000c86  0c846d616373         cmpi.l    #$6d616373, d4
  000c8c  6742                 beq.b     $cd0
  000c8e  0c8474656d70         cmpi.l    #$74656d70, d4
  000c94  673a                 beq.b     $cd0
  000c96  0c8470726566         cmpi.l    #$70726566, d4
  000c9c  6732                 beq.b     $cd0
  000c9e  0c846578746e         cmpi.l    #$6578746e, d4
  000ca4  672a                 beq.b     $cd0
  000ca6  0c846374726c         cmpi.l    #$6374726c, d4
  000cac  6722                 beq.b     $cd0
  000cae  0c84616d6e75         cmpi.l    #$616d6e75, d4
  000cb4  671a                 beq.b     $cd0
  000cb6  0c8473747274         cmpi.l    #$73747274, d4
  000cbc  6712                 beq.b     $cd0
  000cbe  0c8470726e74         cmpi.l    #$70726e74, d4
  000cc4  670a                 beq.b     $cd0
  000cc6  70ce                 moveq     #$ce, d0
  000cc8  3d400018             move.w    d0, $18(a6)
  000ccc  4efa00ae             jmp       $d7c(pc)
  000cd0  7000                 moveq     #$0, d0
  000cd2  2d40ff8e             move.l    d0, -$72(a6)
  000cd6  0c458000             cmpi.w    #$8000, d5
  000cda  662c                 bne.b     $d08
  000cdc  554f                 subq.w    #$2, a7
  000cde  3eb80a58             move.w    $a58.w, (a7)
  000ce2  301f                 move.w    (a7)+, d0
  000ce4  3d40ff94             move.w    d0, -$6c(a6)
  000ce8  4240                 clr.w     d0
  000cea  3d40ff98             move.w    d0, -$68(a6)
  000cee  7002                 moveq     #$2, d0
  000cf0  2d40ffb6             move.l    d0, -$4a(a6)
  000cf4  41eeff7c             lea.l     -$84(a6), a0
  000cf8  7008                 moveq     #$8, d0
  000cfa  a260                 _HFSDispatch 
  000cfc  3800                 move.w    d0, d4
  000cfe  6676                 bne.b     $d76
  000d00  3d6effb0ff92         move.w    -$50(a6), -$6e(a6)
  000d06  6004                 bra.b     $d0c
  000d08  3d45ff92             move.w    d5, -$6e(a6)
  000d0c  7006                 moveq     #$6, d0
  000d0e  2d40ffa0             move.l    d0, -$60(a6)
  000d12  41eefff8             lea.l     -$8(a6), a0
  000d16  2d48ff9c             move.l    a0, -$64(a6)
  000d1a  41eeff7c             lea.l     -$84(a6), a0
  000d1e  7030                 moveq     #$30, d0
  000d20  a260                 _HFSDispatch 
  000d22  3800                 move.w    d0, d4
  000d24  70ce                 moveq     #$ce, d0
  000d26  b840                 cmp.w     d0, d4
  000d28  6710                 beq.b     $d3a
  000d2a  4a44                 tst.w     d4
  000d2c  6642                 bne.b     $d70
  000d2e  202efffa             move.l    -$6(a6), d0
  000d32  028000020000         andi.l    #$20000, d0
  000d38  6636                 bne.b     $d70
  000d3a  4240                 clr.w     d0
  000d3c  3d40ff98             move.w    d0, -$68(a6)
  000d40  7600                 moveq     #$0, d3
  000d42  2d43ffd6             move.l    d3, -$2a(a6)
  000d46  2d43ffac             move.l    d3, -$54(a6)
  000d4a  41eeff7c             lea.l     -$84(a6), a0
  000d4e  a207                 _GetVolInfo 
  000d50  3800                 move.w    d0, d4
  000d52  6622                 bne.b     $d76
  000d54  202effd6             move.l    -$2a(a6), d0
  000d58  6712                 beq.b     $d6c
  000d5a  206e000c             movea.l   $c(a6), a0
  000d5e  30aeff92             move.w    -$6e(a6), (a0)
  000d62  206e0008             movea.l   $8(a6), a0
  000d66  20aeffd6             move.l    -$2a(a6), (a0)
  000d6a  600a                 bra.b     $d76
  000d6c  78d5                 moveq     #$d5, d4
  000d6e  6006                 bra.b     $d76
  000d70  4a44                 tst.w     d4
  000d72  6602                 bne.b     $d76
  000d74  78d5                 moveq     #$d5, d4
  000d76  3004                 move.w    d4, d0
  000d78  3d400018             move.w    d0, $18(a6)
  000d7c  4cdf0038             movem.l   (a7)+, d3-d5
  000d80  4e5e                 unlk      a6
  000d82  205f                 movea.l   (a7)+, a0
  000d84  4fef0010             lea.l     $10(a7), a7
  000d88  4ed0                 jmp       (a0)
  000d8a  00000000             ori.b     #$0, d0
  000d8e  00000000             ori.b     #$0, d0
  000d92  00000000             ori.b     #$0, d0
