
;-------------------------------------------------------------
; InitSAT   (seg 1 +000004, 1604 bytes)
  000004  9dce                 suba.l    a6, a6
  000006  598f                 subq.l    #$4, a7
  000008  2f3c434f4445         move.l    #$434f4445, -(a7)
  00000e  4267                 clr.w     -(a7)
  000010  a9a0                 _GetResource 
  000012  2017                 move.l    (a7), d0
  000014  670000f2             beq.w     $108
  000018  2040                 movea.l   d0, a0
  00001a  2050                 movea.l   (a0), a0
  00001c  2e18                 move.l    (a0)+, d7
  00001e  2c10                 move.l    (a0), d6
  000020  a9a3                 _ReleaseResource 
  000022  7000                 moveq     #$0, d0
  000024  204d                 movea.l   a5, a0
  000026  91c6                 suba.l    d6, a0
  000028  6002                 bra.b     $2c
  00002a  10c0                 move.b    d0, (a0)+
  00002c  b1cd                 cmpa.l    a5, a0
  00002e  6dfa                 blt.b     $2a
  000030  41ed0028             lea.l     $28(a5), a0
  000034  43f57800             lea.l     (a5, d7.l), a1
  000038  6002                 bra.b     $3c
  00003a  10c0                 move.b    d0, (a0)+
  00003c  b1c9                 cmpa.l    a1, a0
  00003e  6dfa                 blt.b     $3a
  000040  598f                 subq.l    #$4, a7
  000042  2f3c44415441         move.l    #$44415441, -(a7)
  000048  4267                 clr.w     -(a7)
  00004a  a9a0                 _GetResource 
  00004c  2057                 movea.l   (a7), a0
  00004e  2008                 move.l    a0, d0
  000050  670000b6             beq.w     $108
  000054  2f0d                 move.l    a5, -(a7)
  000056  2050                 movea.l   (a0), a0
  000058  48680004             pea.l     $4(a0)
  00005c  4eba00b0             jsr       $10e(pc)
  000060  508f                 addq.l    #$8, a7
  000062  43faff9c             lea.l     $0(pc), a1
  000066  2b49e6d4             move.l    a1, -$192c(a5)
  00006a  224d                 movea.l   a5, a1
  00006c  4eba0218             jsr       $286(pc)
  000070  226de6d4             movea.l   -$192c(a5), a1
  000074  4eba0210             jsr       $286(pc)
  000078  a9a3                 _ReleaseResource 
  00007a  4eba0296             jsr       $312(pc)
  00007e  422de6d9             clr.b     -$1927(a5)
  000082  303ca89f             move.w    #$a89f, d0
  000086  a746                 _GetTrapAddress 
  000088  2f08                 move.l    a0, -(a7)
  00008a  303ca198             move.w    #$a198, d0
  00008e  a346                 _GetTrapAddress 
  000090  b1df                 cmpa.l    (a7)+, a0
  000092  670a                 beq.b     $9e
  000094  1b7c0001e6d9         move.b    #$1, -$1927(a5)
  00009a  7001                 moveq     #$1, d0
  00009c  a198                 _HWPriv   
  00009e  303ca9f0             move.w    #$a9f0, d0
  0000a2  a746                 _GetTrapAddress 
  0000a4  2b48e6d0             move.l    a0, -$1930(a5)
  0000a8  303ca9f1             move.w    #$a9f1, d0
  0000ac  a746                 _GetTrapAddress 
  0000ae  2b48e6cc             move.l    a0, -$1934(a5)
  0000b2  303ca9f4             move.w    #$a9f4, d0
  0000b6  a746                 _GetTrapAddress 
  0000b8  2b48e6c8             move.l    a0, -$1938(a5)
  0000bc  303ca9f0             move.w    #$a9f0, d0
  0000c0  41fa0268             lea.l     $32a(pc), a0
  0000c4  a647                 _SetTrapAddress 
  0000c6  303ca9f1             move.w    #$a9f1, d0
  0000ca  41fa0324             lea.l     $3f0(pc), a0
  0000ce  a647                 _SetTrapAddress 
  0000d0  303ca9f4             move.w    #$a9f4, d0
  0000d4  41fa002e             lea.l     $104(pc), a0
  0000d8  a647                 _SetTrapAddress 
  0000da  4eb900000488         jsr       $488.l   ; seg1+488
  0000e0  4eb9000005f8         jsr       $5f8.l   ; seg1+5f8
  0000e6  487a0022             pea.l     $10a(pc)
  0000ea  4a2dffff             tst.b     -$1(a5)
  0000ee  6702                 beq.b     $f2
  0000f0  4267                 clr.w     -(a7)
  0000f2  4267                 clr.w     -(a7)
  0000f4  4eb90000c914         jsr       $c914.l   ; main
  0000fa  5c8f                 addq.l    #$6, a7
  0000fc  42a7                 clr.l     -(a7)
  0000fe  4eb900000330         jsr       $330.l   ; _tail_c
  000104  4eba0384             jsr       $48a(pc)
  000108  a9f4                 _ExitToShell 
  00010a  00000000             ori.b     #$0, d0
  00010e  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  000112  594f                 subq.w    #$4, a7
  000114  266f001c             movea.l   $1c(a7), a3
  000118  7800                 moveq     #$0, d4
  00011a  600000e4             bra.w     $200
  00011e  1e9b                 move.b    (a3)+, (a7)
  000120  1f5b0001             move.b    (a3)+, $1(a7)
  000124  1f5b0002             move.b    (a3)+, $2(a7)
  000128  1f5b0003             move.b    (a3)+, $3(a7)
  00012c  246f0020             movea.l   $20(a7), a2
  000130  d5d7                 adda.l    (a7), a2
  000132  161b                 move.b    (a3)+, d3
  000134  4883                 ext.w     d3
  000136  3003                 move.w    d3, d0
  000138  02400080             andi.w    #$80, d0
  00013c  670e                 beq.b     $14c
  00013e  0243007f             andi.w    #$7f, d3
  000142  14db                 move.b    (a3)+, (a2)+
  000144  5343                 subq.w    #$1, d3
  000146  4a43                 tst.w     d3
  000148  6cf8                 bge.b     $142
  00014a  60e6                 bra.b     $132
  00014c  3003                 move.w    d3, d0
  00014e  02400040             andi.w    #$40, d0
  000152  670e                 beq.b     $162
  000154  3003                 move.w    d3, d0
  000156  0240003f             andi.w    #$3f, d0
  00015a  5240                 addq.w    #$1, d0
  00015c  48c0                 ext.l     d0
  00015e  d5c0                 adda.l    d0, a2
  000160  60d0                 bra.b     $132
  000162  3003                 move.w    d3, d0
  000164  02400020             andi.w    #$20, d0
  000168  670a                 beq.b     $174
  00016a  0243001f             andi.w    #$1f, d3
  00016e  5243                 addq.w    #$1, d3
  000170  1a1b                 move.b    (a3)+, d5
  000172  600e                 bra.b     $182
  000174  3003                 move.w    d3, d0
  000176  02400010             andi.w    #$10, d0
  00017a  6710                 beq.b     $18c
  00017c  0243000f             andi.w    #$f, d3
  000180  7aff                 moveq     #$ff, d5
  000182  14c5                 move.b    d5, (a2)+
  000184  5343                 subq.w    #$1, d3
  000186  4a43                 tst.w     d3
  000188  6cf8                 bge.b     $182
  00018a  60a6                 bra.b     $132
  00018c  3003                 move.w    d3, d0
  00018e  0c400004             cmpi.w    #$4, d0
  000192  6264                 bhi.b     $1f8
  000194  d040                 add.w     d0, d0
  000196  303b0006             move.w    $19e(pc, d0.w), d0
  00019a  4efb0002             jmp       $19e(pc, d0.w)
  00019e  0060000a001c002c0042 cases     0:$1fe 1:$1a8 2:$1ba 3:$1ca 4:$1e0
  0001a8  588a                 addq.l    #$4, a2
  0001aa  14fcffff             move.b    #$ff, (a2)+
  0001ae  14fcffff             move.b    #$ff, (a2)+
  0001b2  14db                 move.b    (a3)+, (a2)+
  0001b4  14db                 move.b    (a3)+, (a2)+
  0001b6  6000ff7a             bra.w     $132
  0001ba  588a                 addq.l    #$4, a2
  0001bc  14fcffff             move.b    #$ff, (a2)+
  0001c0  14db                 move.b    (a3)+, (a2)+
  0001c2  14db                 move.b    (a3)+, (a2)+
  0001c4  14db                 move.b    (a3)+, (a2)+
  0001c6  6000ff6a             bra.w     $132
  0001ca  14fcffa9             move.b    #$a9, (a2)+
  0001ce  14fcfff0             move.b    #$f0, (a2)+
  0001d2  548a                 addq.l    #$2, a2
  0001d4  14db                 move.b    (a3)+, (a2)+
  0001d6  14db                 move.b    (a3)+, (a2)+
  0001d8  528a                 addq.l    #$1, a2
  0001da  14db                 move.b    (a3)+, (a2)+
  0001dc  6000ff54             bra.w     $132
  0001e0  14fcffa9             move.b    #$a9, (a2)+
  0001e4  14fcfff0             move.b    #$f0, (a2)+
  0001e8  528a                 addq.l    #$1, a2
  0001ea  14db                 move.b    (a3)+, (a2)+
  0001ec  14db                 move.b    (a3)+, (a2)+
  0001ee  14db                 move.b    (a3)+, (a2)+
  0001f0  528a                 addq.l    #$1, a2
  0001f2  14db                 move.b    (a3)+, (a2)+
  0001f4  6000ff3c             bra.w     $132
  0001f8  3f3c000f             move.w    #$f, -(a7)
  0001fc  a9c9                 _SysError 
  0001fe  5244                 addq.w    #$1, d4
  000200  0c440003             cmpi.w    #$3, d4
  000204  6d00ff18             blt.w     $11e
  000208  204b                 movea.l   a3, a0
  00020a  584f                 addq.w    #$4, a7
  00020c  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  000210  4e75                 rts       
  000212  2f05                 move.l    d5, -(a7)
  000214  594f                 subq.w    #$4, a7
  000216  226f000c             movea.l   $c(a7), a1
  00021a  1e99                 move.b    (a1)+, (a7)
  00021c  1f590001             move.b    (a1)+, $1(a7)
  000220  1f590002             move.b    (a1)+, $2(a7)
  000224  1f590003             move.b    (a1)+, $3(a7)
  000228  2a17                 move.l    (a7), d5
  00022a  7400                 moveq     #$0, d2
  00022c  604c                 bra.b     $27a
  00022e  1219                 move.b    (a1)+, d1
  000230  1001                 move.b    d1, d0
  000232  02400080             andi.w    #$80, d0
  000236  670c                 beq.b     $244
  000238  d201                 add.b     d1, d1
  00023a  1001                 move.b    d1, d0
  00023c  4880                 ext.w     d0
  00023e  48c0                 ext.l     d0
  000240  d480                 add.l     d0, d2
  000242  6028                 bra.b     $26c
  000244  1e81                 move.b    d1, (a7)
  000246  1f590001             move.b    (a1)+, $1(a7)
  00024a  1001                 move.b    d1, d0
  00024c  02400040             andi.w    #$40, d0
  000250  670c                 beq.b     $25e
  000252  3017                 move.w    (a7), d0
  000254  e548                 lsl.w     #$2, d0
  000256  e240                 asr.w     #$1, d0
  000258  48c0                 ext.l     d0
  00025a  d480                 add.l     d0, d2
  00025c  600e                 bra.b     $26c
  00025e  1f590002             move.b    (a1)+, $2(a7)
  000262  1f590003             move.b    (a1)+, $3(a7)
  000266  2417                 move.l    (a7), d2
  000268  e58a                 lsl.l     #$2, d2
  00026a  e282                 asr.l     #$1, d2
  00026c  206f0010             movea.l   $10(a7), a0
  000270  202f0014             move.l    $14(a7), d0
  000274  d1b02800             add.l     d0, (a0, d2.l)
  000278  5385                 subq.l    #$1, d5
  00027a  4a85                 tst.l     d5
  00027c  6eb0                 bgt.b     $22e
  00027e  2049                 movea.l   a1, a0
  000280  584f                 addq.w    #$4, a7
  000282  2a1f                 move.l    (a7)+, d5
  000284  4e75                 rts       
  000286  2f0a                 move.l    a2, -(a7)
  000288  2449                 movea.l   a1, a2
  00028a  2f0d                 move.l    a5, -(a7)
  00028c  2f0a                 move.l    a2, -(a7)
  00028e  2f08                 move.l    a0, -(a7)
  000290  4ebaff80             jsr       $212(pc)
  000294  2f2de6d4             move.l    -$192c(a5), -(a7)
  000298  2f0a                 move.l    a2, -(a7)
  00029a  2f08                 move.l    a0, -(a7)
  00029c  4ebaff74             jsr       $212(pc)
  0002a0  2f0a                 move.l    a2, -(a7)
  0002a2  2f0a                 move.l    a2, -(a7)
  0002a4  2f08                 move.l    a0, -(a7)
  0002a6  4ebaff6a             jsr       $212(pc)
  0002aa  4fef0024             lea.l     $24(a7), a7
  0002ae  245f                 movea.l   (a7)+, a2
  0002b0  4e75                 rts       
  0002b2  2f0a                 move.l    a2, -(a7)
  0002b4  2449                 movea.l   a1, a2
  0002b6  2f0d                 move.l    a5, -(a7)
  0002b8  4497                 neg.l     (a7)
  0002ba  2f0a                 move.l    a2, -(a7)
  0002bc  2f08                 move.l    a0, -(a7)
  0002be  4ebaff52             jsr       $212(pc)
  0002c2  2f2de6d4             move.l    -$192c(a5), -(a7)
  0002c6  4497                 neg.l     (a7)
  0002c8  2f0a                 move.l    a2, -(a7)
  0002ca  2f08                 move.l    a0, -(a7)
  0002cc  4ebaff44             jsr       $212(pc)
  0002d0  2f0a                 move.l    a2, -(a7)
  0002d2  4497                 neg.l     (a7)
  0002d4  2f0a                 move.l    a2, -(a7)
  0002d6  2f08                 move.l    a0, -(a7)
  0002d8  4ebaff38             jsr       $212(pc)
  0002dc  4fef0024             lea.l     $24(a7), a7
  0002e0  245f                 movea.l   (a7)+, a2
  0002e2  4e75                 rts       
  0002e4  bbfa0028             cmpa.l    $30e(pc), a5
  0002e8  6602                 bne.b     $2ec
  0002ea  4e75                 rts       
  0002ec  48e70084             movem.l   a0/a5, -(a7)
  0002f0  2a7a001c             movea.l   $30e(pc), a5
  0002f4  206de6d0             movea.l   -$1930(a5), a0
  0002f8  4a6f000c             tst.w     $c(a7)
  0002fc  6604                 bne.b     $302
  0002fe  206de6cc             movea.l   -$1934(a5), a0
  000302  2f48000a             move.l    a0, $a(a7)
  000306  4cdf2100             movem.l   (a7)+, a0/a5
  00030a  544f                 addq.w    #$2, a7
  00030c  4e75                 rts       
  00030e  00000000             ori.b     #$0, d0
  000312  41fafffa             lea.l     $30e(pc), a0
  000316  208d                 move.l    a5, (a0)
  000318  4e75                 rts       
  00031a  43f9000055aa         lea.l     $55aa.l, a1   ; g_55aa
  000320  c0fc0010             mulu.w    #$10, d0
  000324  238808f0             move.l    a0, -$10(a1, d0.l)
  000328  4e75                 rts       
  00032a  3f3c0001             move.w    #$1, -(a7)
  00032e  4ebaffb4             jsr       $2e4(pc)
  000332  544f                 addq.w    #$2, a7
  000334  48e7e0e0             movem.l   d0-d2/a0-a2, -(a7)
  000338  55af0018             subq.l    #$2, $18(a7)
  00033c  246f0018             movea.l   $18(a7), a2
  000340  202de6da             move.l    -$1926(a5), d0
  000344  670a                 beq.b     $350
  000346  2040                 movea.l   d0, a0
  000348  3f2a0006             move.w    $6(a2), -(a7)
  00034c  4e90                 jsr       (a0)
  00034e  548f                 addq.l    #$2, a7
  000350  50f80a5e             st.b      $a5e.w
  000354  598f                 subq.l    #$4, a7
  000356  2f3c434f4445         move.l    #$434f4445, -(a7)
  00035c  3f2a0006             move.w    $6(a2), -(a7)
  000360  a9a0                 _GetResource 
  000362  2017                 move.l    (a7), d0
  000364  6616                 bne.b     $37c
  000366  202de6e6             move.l    -$191a(a5), d0
  00036a  6604                 bne.b     $370
  00036c  700f                 moveq     #$f, d0
  00036e  a9c9                 _SysError 
  000370  2040                 movea.l   d0, a0
  000372  3f2a0006             move.w    $6(a2), -(a7)
  000376  4e90                 jsr       (a0)
  000378  548f                 addq.l    #$2, a7
  00037a  60da                 bra.b     $356
  00037c  4a380bb2             tst.b     $bb2.w
  000380  6704                 beq.b     $386
  000382  2040                 movea.l   d0, a0
  000384  a064                 _MoveHHi  
  000386  2057                 movea.l   (a7), a0
  000388  a029                 _HLock    
  00038a  205f                 movea.l   (a7)+, a0
  00038c  2050                 movea.l   (a0), a0
  00038e  2008                 move.l    a0, d0
  000390  a055                 _StripAddress 
  000392  2040                 movea.l   d0, a0
  000394  2f08                 move.l    a0, -(a7)
  000396  302a0006             move.w    $6(a2), d0
  00039a  4ebaff7e             jsr       $31a(pc)
  00039e  2248                 movea.l   a0, a1
  0003a0  d1e80008             adda.l    $8(a0), a0
  0003a4  4ebafee0             jsr       $286(pc)
  0003a8  205f                 movea.l   (a7)+, a0
  0003aa  224d                 movea.l   a5, a1
  0003ac  d3e80004             adda.l    $4(a0), a1
  0003b0  30280002             move.w    $2(a0), d0
  0003b4  2208                 move.l    a0, d1
  0003b6  600c                 bra.b     $3c4
  0003b8  337c4ef90000         move.w    #$4ef9, $0(a1)
  0003be  d3a90002             add.l     d1, $2(a1)
  0003c2  5089                 addq.l    #$8, a1
  0003c4  51c8fff2             dbra      d0, $3b8
  0003c8  4a2de6d9             tst.b     -$1927(a5)
  0003cc  6704                 beq.b     $3d2
  0003ce  7001                 moveq     #$1, d0
  0003d0  a198                 _HWPriv   
  0003d2  202de6de             move.l    -$1922(a5), d0
  0003d6  670a                 beq.b     $3e2
  0003d8  2040                 movea.l   d0, a0
  0003da  3f2a0006             move.w    $6(a2), -(a7)
  0003de  4e90                 jsr       (a0)
  0003e0  548f                 addq.l    #$2, a7
  0003e2  4cdf0707             movem.l   (a7)+, d0-d2/a0-a2
  0003e6  4a38012d             tst.b     $12d.w
  0003ea  6702                 beq.b     $3ee
  0003ec  a9ff                 _Debugger 
  0003ee  4e75                 rts       
  0003f0  3f3c0000             move.w    #$0, -(a7)
  0003f4  4ebafeee             jsr       $2e4(pc)
  0003f8  544f                 addq.w    #$2, a7
  0003fa  2f0a                 move.l    a2, -(a7)
  0003fc  246f0008             movea.l   $8(a7), a2
  000400  0c6a4ef90000         cmpi.w    #$4ef9, $0(a2)
  000406  667a                 bne.b     $482
  000408  0c6a00020006         cmpi.w    #$2, $6(a2)
  00040e  6d72                 blt.b     $482
  000410  91c8                 suba.l    a0, a0
  000412  302a0006             move.w    $6(a2), d0
  000416  4ebaff02             jsr       $31a(pc)
  00041a  598f                 subq.l    #$4, a7
  00041c  2f3c434f4445         move.l    #$434f4445, -(a7)
  000422  3f2a0006             move.w    $6(a2), -(a7)
  000426  a9a0                 _GetResource 
  000428  2017                 move.l    (a7), d0
  00042a  6604                 bne.b     $430
  00042c  588f                 addq.l    #$4, a7
  00042e  6052                 bra.b     $482
  000430  2040                 movea.l   d0, a0
  000432  2050                 movea.l   (a0), a0
  000434  2248                 movea.l   a0, a1
  000436  d1e80008             adda.l    $8(a0), a0
  00043a  4ebafe76             jsr       $2b2(pc)
  00043e  2057                 movea.l   (a7), a0
  000440  2050                 movea.l   (a0), a0
  000442  224d                 movea.l   a5, a1
  000444  d3e80004             adda.l    $4(a0), a1
  000448  30280002             move.w    $2(a0), d0
  00044c  2208                 move.l    a0, d1
  00044e  600c                 bra.b     $45c
  000450  337ca9f00000         move.w    #$a9f0, $0(a1)
  000456  93a90002             sub.l     d1, $2(a1)
  00045a  5089                 addq.l    #$8, a1
  00045c  51c8fff2             dbra      d0, $450
  000460  2057                 movea.l   (a7), a0
  000462  a02a                 _HUnlock  
  000464  205f                 movea.l   (a7)+, a0
  000466  a049                 _HPurge   
  000468  4a2de6d9             tst.b     -$1927(a5)
  00046c  6704                 beq.b     $472
  00046e  7001                 moveq     #$1, d0
  000470  a198                 _HWPriv   
  000472  202de6e2             move.l    -$191e(a5), d0
  000476  670a                 beq.b     $482
  000478  2040                 movea.l   d0, a0
  00047a  3f2a0006             move.w    $6(a2), -(a7)
  00047e  4e90                 jsr       (a0)
  000480  548f                 addq.l    #$2, a7
  000482  245f                 movea.l   (a7)+, a2
  000484  2e9f                 move.l    (a7)+, (a7)
  000486  4e75                 rts       
  000488  4e75                 rts       
  00048a  2a780904             movea.l   $904.w, a5
  00048e  303ca9f4             move.w    #$a9f4, d0
  000492  206de6c8             movea.l   -$1938(a5), a0
  000496  a647                 _SetTrapAddress 
  000498  303ca9f0             move.w    #$a9f0, d0
  00049c  206de6d0             movea.l   -$1930(a5), a0
  0004a0  a647                 _SetTrapAddress 
  0004a2  303ca9f1             move.w    #$a9f1, d0
  0004a6  206de6cc             movea.l   -$1934(a5), a0
  0004aa  a647                 _SetTrapAddress 
  0004ac  4e75                 rts       
  0004ae  2f0a                 move.l    a2, -(a7)
  0004b0  6014                 bra.b     $4c6
  0004b2  2b52e6ea             move.l    (a2), -$1916(a5)
  0004b6  3f3cffff             move.w    #$ffff, -(a7)
  0004ba  2f2a0008             move.l    $8(a2), -(a7)
  0004be  206a0004             movea.l   $4(a2), a0
  0004c2  4e90                 jsr       (a0)
  0004c4  5c4f                 addq.w    #$6, a7
  0004c6  246de6ea             movea.l   -$1916(a5), a2
  0004ca  200a                 move.l    a2, d0
  0004cc  66e4                 bne.b     $4b2
  0004ce  245f                 movea.l   (a7)+, a2
  0004d0  4e75                 rts       
  0004d2  48e73000             movem.l   d2-d3, -(a7)
  0004d6  7402                 moveq     #$2, d2
  0004d8  4efb2200             jmp       $4da(pc,d2.w * 2)
  0004dc  600a                 bra.b     $4e8
  0004de  4c010000             mulu.l    d1, d0
  0004e2  4cdf000c             movem.l   (a7)+, d2-d3
  0004e6  4e75                 rts       
  0004e8  2400                 move.l    d0, d2
  0004ea  4842                 swap      d2
  0004ec  c4c1                 mulu.w    d1, d2
  0004ee  2601                 move.l    d1, d3
  0004f0  4843                 swap      d3
  0004f2  c6c0                 mulu.w    d0, d3
  0004f4  d443                 add.w     d3, d2
  0004f6  4842                 swap      d2
  0004f8  4242                 clr.w     d2
  0004fa  c0c1                 mulu.w    d1, d0
  0004fc  d082                 add.l     d2, d0
  0004fe  4cdf000c             movem.l   (a7)+, d2-d3
  000502  4e75                 rts       
  000504  48e73000             movem.l   d2-d3, -(a7)
  000508  7402                 moveq     #$2, d2
  00050a  4efb2200             jmp       $50c(pc,d2.w * 2)
  00050e  600a                 bra.b     $51a
  000510  4c410000             divu.l    d1, d0
  000514  4cdf000c             movem.l   (a7)+, d2-d3
  000518  4e75                 rts       
  00051a  2401                 move.l    d1, d2
  00051c  4242                 clr.w     d2
  00051e  4842                 swap      d2
  000520  661c                 bne.b     $53e
  000522  3600                 move.w    d0, d3
  000524  4240                 clr.w     d0
  000526  4840                 swap      d0
  000528  6706                 beq.b     $530
  00052a  80c1                 divu.w    d1, d0
  00052c  3400                 move.w    d0, d2
  00052e  4842                 swap      d2
  000530  3003                 move.w    d3, d0
  000532  80c1                 divu.w    d1, d0
  000534  3400                 move.w    d0, d2
  000536  2002                 move.l    d2, d0
  000538  4cdf000c             movem.l   (a7)+, d2-d3
  00053c  4e75                 rts       
  00053e  3400                 move.w    d0, d2
  000540  4240                 clr.w     d0
  000542  4840                 swap      d0
  000544  4842                 swap      d2
  000546  2601                 move.l    d1, d3
  000548  720f                 moveq     #$f, d1
  00054a  d482                 add.l     d2, d2
  00054c  d180                 addx.l    d0, d0
  00054e  b083                 cmp.l     d3, d0
  000550  6504                 bcs.b     $556
  000552  9083                 sub.l     d3, d0
  000554  5202                 addq.b    #$1, d2
  000556  51c9fff2             dbra      d1, $54a
  00055a  2002                 move.l    d2, d0
  00055c  4cdf000c             movem.l   (a7)+, d2-d3
  000560  4e75                 rts       
  000562  4a80                 tst.l     d0
  000564  6c0c                 bge.b     $572
  000566  4480                 neg.l     d0
  000568  4a81                 tst.l     d1
  00056a  6c10                 bge.b     $57c
  00056c  4481                 neg.l     d1
  00056e  4efaff94             jmp       $504(pc)
  000572  4a81                 tst.l     d1
  000574  6d04                 blt.b     $57a
  000576  4efaff8c             jmp       $504(pc)
  00057a  4481                 neg.l     d1
  00057c  4ebaff86             jsr       $504(pc)
  000580  4480                 neg.l     d0
  000582  4e75                 rts       
  000584  48e73000             movem.l   d2-d3, -(a7)
  000588  7402                 moveq     #$2, d2
  00058a  4efb2200             jmp       $58c(pc,d2.w * 2)
  00058e  600c                 bra.b     $59c
  000590  4c410001             divul.l   d1, d1:d0
  000594  2001                 move.l    d1, d0
  000596  4cdf000c             movem.l   (a7)+, d2-d3
  00059a  4e75                 rts       
  00059c  2401                 move.l    d1, d2
  00059e  4242                 clr.w     d2
  0005a0  4842                 swap      d2
  0005a2  661c                 bne.b     $5c0
  0005a4  3600                 move.w    d0, d3
  0005a6  4240                 clr.w     d0
  0005a8  4840                 swap      d0
  0005aa  6706                 beq.b     $5b2
  0005ac  80c1                 divu.w    d1, d0
  0005ae  3400                 move.w    d0, d2
  0005b0  4842                 swap      d2
  0005b2  3003                 move.w    d3, d0
  0005b4  80c1                 divu.w    d1, d0
  0005b6  4240                 clr.w     d0
  0005b8  4840                 swap      d0
  0005ba  4cdf000c             movem.l   (a7)+, d2-d3
  0005be  4e75                 rts       
  0005c0  3400                 move.w    d0, d2
  0005c2  4240                 clr.w     d0
  0005c4  4840                 swap      d0
  0005c6  4842                 swap      d2
  0005c8  2601                 move.l    d1, d3
  0005ca  720f                 moveq     #$f, d1
  0005cc  d482                 add.l     d2, d2
  0005ce  d180                 addx.l    d0, d0
  0005d0  b083                 cmp.l     d3, d0
  0005d2  6502                 bcs.b     $5d6
  0005d4  9083                 sub.l     d3, d0
  0005d6  51c9fff4             dbra      d1, $5cc
  0005da  4cdf000c             movem.l   (a7)+, d2-d3
  0005de  4e75                 rts       
  0005e0  4a81                 tst.l     d1
  0005e2  6c02                 bge.b     $5e6
  0005e4  4481                 neg.l     d1
  0005e6  4a80                 tst.l     d0
  0005e8  6d04                 blt.b     $5ee
  0005ea  4efaff98             jmp       $584(pc)
  0005ee  4480                 neg.l     d0
  0005f0  4ebaff92             jsr       $584(pc)
  0005f4  4480                 neg.l     d0
  0005f6  4e75                 rts       
  0005f8  4e75                 rts       
  0005fa  4e560000             link.w    a6, #$0
  0005fe  4227                 clr.b     -(a7)
  000600  2f3c00010001         move.l    #$10001, -(a7)
  000606  3f3c0040             move.w    #$40, -(a7)
  00060a  4eb900000088         jsr       $88.l   ; SATCONFIGURE
  000610  2f3c00830083         move.l    #$830083, -(a7)
  000616  4879000055a2         pea.l     $55a2.l   ; g_55a2
  00061c  42a7                 clr.l     -(a7)
  00061e  42a7                 clr.l     -(a7)
  000620  1f3c0001             move.b    #$1, -(a7)
  000624  1f3c0001             move.b    #$1, -(a7)
  000628  1f3c0001             move.b    #$1, -(a7)
  00062c  1f3c0001             move.b    #$1, -(a7)
  000630  1f3c0001             move.b    #$1, -(a7)
  000634  4eb900000098         jsr       $98.l   ; SATCUSTOMINIT
  00063a  487800a2             pea.l     $a2.w
  00063e  4eb900000090         jsr       $90.l   ; SATSETSPRITERECSIZE
  000644  4e5e                 unlk      a6
  000646  4e75                 rts       

;-------------------------------------------------------------
; InitSprites   (seg 1 +000652, 224 bytes)
  000652  4e560000             link.w    a6, #$0
  000656  4eb900000458         jsr       $458.l   ; InitPlayerSprite
  00065c  4eb900000840         jsr       $840.l   ; InitPlantSprite
  000662  4eb900000598         jsr       $598.l   ; InitChairSprite
  000668  4eb900000648         jsr       $648.l   ; InitDartEnemySprite
  00066e  4eb9000006c8         jsr       $6c8.l   ; InitEnemyShotSprite
  000674  4eb900000488         jsr       $488.l   ; InitBarrelSprite
  00067a  4eb9000004e0         jsr       $4e0.l   ; InitBonusSprite
  000680  4eb9000005d8         jsr       $5d8.l   ; InitColliderSprite
  000686  4eb9000005f8         jsr       $5f8.l   ; InitCoolerSprite
  00068c  4eb900000688         jsr       $688.l   ; InitDoorSprite
  000692  4eb9000006b0         jsr       $6b0.l   ; InitEffectSprite
  000698  4eb9000006f0         jsr       $6f0.l   ; InitExitSprite
  00069e  4eb900000780         jsr       $780.l   ; InitHazardSprite
  0006a4  4eb9000007a8         jsr       $7a8.l   ; InitHeldWeaponSprite
  0006aa  4eb9000007c0         jsr       $7c0.l   ; InitItemSprite
  0006b0  4eb900000840         jsr       $840.l   ; InitPlantSprite
  0006b6  4eb900000868         jsr       $868.l   ; InitPlayerShotSprite
  0006bc  4eb900000890         jsr       $890.l   ; InitRampSprite
  0006c2  4eb900000618         jsr       $618.l   ; InitCoWorkerSprite
  0006c8  4eb9000007e8         jsr       $7e8.l   ; InitMailGuySprite
  0006ce  4eb900000818         jsr       $818.l   ; InitMessageSprite
  0006d4  4eb900000630         jsr       $630.l   ; InitCustomSprite
  0006da  4eb900000838         jsr       $838.l   ; InitOverheadSprite
  0006e0  4eb900000710         jsr       $710.l   ; InitFirePipeSprite
  0006e6  4eb9000008f0         jsr       $8f0.l   ; InitRobotSprite
  0006ec  4eb900000760         jsr       $760.l   ; InitGrateSprite
  0006f2  4eb900000738         jsr       $738.l   ; InitGhostSprite
  0006f8  4eb9000004b8         jsr       $4b8.l   ; InitBlobSprite
  0006fe  4eb900000920         jsr       $920.l   ; InitScientistSprite
  000704  4eb900000500         jsr       $500.l   ; InitBoulderSprite
  00070a  4eb900000988         jsr       $988.l   ; InitTurretSprite
  000710  4eb9000008b8         jsr       $8b8.l   ; InitReversorSprite
  000716  4eb900000960         jsr       $960.l   ; InitStairsSprite
  00071c  4eb900000940         jsr       $940.l   ; InitSlidingDoorSprite
  000722  4eb900000568         jsr       $568.l   ; InitButtonSprite
  000728  4eb900000530         jsr       $530.l   ; InitBossSprite
  00072e  4e5e                 unlk      a6
  000730  4e75                 rts       

;-------------------------------------------------------------
; DisposeSounds   (seg 1 +000740, 404 bytes)
  000740  4e560000             link.w    a6, #$0
  000744  4ab9000082fa         tst.l     $82fa.l   ; snd200_Scoot_Regular
  00074a  670e                 beq.b     $75a
  00074c  2079000082fa         movea.l   $82fa.l, a0   ; snd200_Scoot_Regular
  000752  a01f                 _DisposePtr 
  000754  42b9000082fa         clr.l     $82fa.l   ; snd200_Scoot_Regular
  00075a  4ab9000082fe         tst.l     $82fe.l   ; snd201_Scoot_Low
  000760  670e                 beq.b     $770
  000762  2079000082fe         movea.l   $82fe.l, a0   ; snd201_Scoot_Low
  000768  a01f                 _DisposePtr 
  00076a  42b9000082fe         clr.l     $82fe.l   ; snd201_Scoot_Low
  000770  4ab900008302         tst.l     $8302.l   ; snd202_snd202
  000776  670e                 beq.b     $786
  000778  207900008302         movea.l   $8302.l, a0   ; snd202_snd202
  00077e  a01f                 _DisposePtr 
  000780  42b900008302         clr.l     $8302.l   ; snd202_snd202
  000786  4ab900008306         tst.l     $8306.l   ; snd203_Kick
  00078c  670e                 beq.b     $79c
  00078e  207900008306         movea.l   $8306.l, a0   ; snd203_Kick
  000794  a01f                 _DisposePtr 
  000796  42b900008306         clr.l     $8306.l   ; snd203_Kick
  00079c  4ab90000830a         tst.l     $830a.l   ; snd204_Kick_Door
  0007a2  670e                 beq.b     $7b2
  0007a4  20790000830a         movea.l   $830a.l, a0   ; snd204_Kick_Door
  0007aa  a01f                 _DisposePtr 
  0007ac  42b90000830a         clr.l     $830a.l   ; snd204_Kick_Door
  0007b2  4ab900008366         tst.l     $8366.l   ; snd205_Locked_Door
  0007b8  670e                 beq.b     $7c8
  0007ba  207900008366         movea.l   $8366.l, a0   ; snd205_Locked_Door
  0007c0  a01f                 _DisposePtr 
  0007c2  42b900008366         clr.l     $8366.l   ; snd205_Locked_Door
  0007c8  4ab90000836a         tst.l     $836a.l   ; snd206_Harry
  0007ce  670e                 beq.b     $7de
  0007d0  20790000836a         movea.l   $836a.l, a0   ; snd206_Harry
  0007d6  a01f                 _DisposePtr 
  0007d8  42b90000836a         clr.l     $836a.l   ; snd206_Harry
  0007de  4ab90000836e         tst.l     $836e.l   ; snd207_Jump_Hit
  0007e4  670e                 beq.b     $7f4
  0007e6  20790000836e         movea.l   $836e.l, a0   ; snd207_Jump_Hit
  0007ec  a01f                 _DisposePtr 
  0007ee  42b90000836e         clr.l     $836e.l   ; snd207_Jump_Hit
  0007f4  4ab900008372         tst.l     $8372.l   ; snd208_Jump_Slam
  0007fa  670e                 beq.b     $80a
  0007fc  207900008372         movea.l   $8372.l, a0   ; snd208_Jump_Slam
  000802  a01f                 _DisposePtr 
  000804  42b900008372         clr.l     $8372.l   ; snd208_Jump_Slam
  00080a  4ab900008376         tst.l     $8376.l   ; snd209_Jump
  000810  670e                 beq.b     $820
  000812  207900008376         movea.l   $8376.l, a0   ; snd209_Jump
  000818  a01f                 _DisposePtr 
  00081a  42b900008376         clr.l     $8376.l   ; snd209_Jump
  000820  4ab90000830e         tst.l     $830e.l   ; snd210_Get_Coffee
  000826  670e                 beq.b     $836
  000828  20790000830e         movea.l   $830e.l, a0   ; snd210_Get_Coffee
  00082e  a01f                 _DisposePtr 
  000830  42b90000830e         clr.l     $830e.l   ; snd210_Get_Coffee
  000836  4ab900008312         tst.l     $8312.l   ; snd211_Get_Donut
  00083c  670e                 beq.b     $84c
  00083e  207900008312         movea.l   $8312.l, a0   ; snd211_Get_Donut
  000844  a01f                 _DisposePtr 
  000846  42b900008312         clr.l     $8312.l   ; snd211_Get_Donut
  00084c  4ab900008316         tst.l     $8316.l   ; snd212_Get_Donut_Box
  000852  670e                 beq.b     $862
  000854  207900008316         movea.l   $8316.l, a0   ; snd212_Get_Donut_Box
  00085a  a01f                 _DisposePtr 
  00085c  42b900008316         clr.l     $8316.l   ; snd212_Get_Donut_Box
  000862  4ab90000831a         tst.l     $831a.l   ; snd213_snd213
  000868  670e                 beq.b     $878
  00086a  20790000831a         movea.l   $831a.l, a0   ; snd213_snd213
  000870  a01f                 _DisposePtr 
  000872  42b90000831a         clr.l     $831a.l   ; snd213_snd213
  000878  4ab90000831e         tst.l     $831e.l   ; snd214_Get_Item
  00087e  670e                 beq.b     $88e
  000880  20790000831e         movea.l   $831e.l, a0   ; snd214_Get_Item
  000886  a01f                 _DisposePtr 
  000888  42b90000831e         clr.l     $831e.l   ; snd214_Get_Item
  00088e  4ab900008382         tst.l     $8382.l   ; snd215_Oil
  000894  670e                 beq.b     $8a4
  000896  207900008382         movea.l   $8382.l, a0   ; snd215_Oil
  00089c  a01f                 _DisposePtr 
  00089e  42b900008382         clr.l     $8382.l   ; snd215_Oil
  0008a4  4ab900008386         tst.l     $8386.l   ; snd216_Get_Ammo
  0008aa  670e                 beq.b     $8ba
  0008ac  207900008386         movea.l   $8386.l, a0   ; snd216_Get_Ammo
  0008b2  a01f                 _DisposePtr 
  0008b4  42b900008386         clr.l     $8386.l   ; snd216_Get_Ammo
  0008ba  4ab900008396         tst.l     $8396.l   ; snd217_Mumble
  0008c0  670e                 beq.b     $8d0
  0008c2  207900008396         movea.l   $8396.l, a0   ; snd217_Mumble
  0008c8  a01f                 _DisposePtr 
  0008ca  42b900008396         clr.l     $8396.l   ; snd217_Mumble
  0008d0  4e5e                 unlk      a6
  0008d2  4e75                 rts       

;-------------------------------------------------------------
; InitNonLevelSounds   (seg 1 +0008e4, 1202 bytes)
  0008e4  4e560000             link.w    a6, #$0
  0008e8  4a3900005590         tst.b     $5590.l   ; g_5590
  0008ee  670004a2             beq.w     $d92
  0008f2  3f3c00dc             move.w    #$dc, -(a7)
  0008f6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0008fc  23c800008322         move.l    a0, $8322.l   ; snd220_Ouch_Regular
  000902  3f3c00dd             move.w    #$dd, -(a7)
  000906  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00090c  23c800008326         move.l    a0, $8326.l   ; snd221_snd221
  000912  3f3c00de             move.w    #$de, -(a7)
  000916  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00091c  23c80000832a         move.l    a0, $832a.l   ; snd222_ouch_reg_old
  000922  3f3c00df             move.w    #$df, -(a7)
  000926  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00092c  23c80000832e         move.l    a0, $832e.l   ; snd223_Ouch_Robot
  000932  3f3c00e0             move.w    #$e0, -(a7)
  000936  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00093c  23c800008332         move.l    a0, $8332.l   ; snd224_Ouch_Ghost
  000942  3f3c00e1             move.w    #$e1, -(a7)
  000946  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00094c  23c80000837a         move.l    a0, $837a.l   ; snd225_Ouch_2
  000952  3f3c00e2             move.w    #$e2, -(a7)
  000956  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00095c  23c80000837e         move.l    a0, $837e.l   ; snd226_Ouch_3
  000962  3f3c00e6             move.w    #$e6, -(a7)
  000966  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00096c  23c800008336         move.l    a0, $8336.l   ; snd230_Shoot_Staple
  000972  3f3c00e7             move.w    #$e7, -(a7)
  000976  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00097c  23c800008342         move.l    a0, $8342.l   ; snd231_Charge_Up
  000982  3f3c00e8             move.w    #$e8, -(a7)
  000986  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00098c  23c80000834a         move.l    a0, $834a.l   ; snd232_Shoot_Heat_Reg
  000992  3f3c00e9             move.w    #$e9, -(a7)
  000996  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00099c  23c80000834e         move.l    a0, $834e.l   ; snd233_Shoot_Heat_Charged
  0009a2  3f3c00ea             move.w    #$ea, -(a7)
  0009a6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009ac  23c800008352         move.l    a0, $8352.l   ; snd234_snd234
  0009b2  3f3c00eb             move.w    #$eb, -(a7)
  0009b6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009bc  23c800008356         move.l    a0, $8356.l   ; snd235_snd235
  0009c2  3f3c00ec             move.w    #$ec, -(a7)
  0009c6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009cc  23c80000835a         move.l    a0, $835a.l   ; snd236_snd236
  0009d2  3f3c00ed             move.w    #$ed, -(a7)
  0009d6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009dc  23c80000835e         move.l    a0, $835e.l   ; snd237_Charge_Power
  0009e2  3f3c00ee             move.w    #$ee, -(a7)
  0009e6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009ec  23c800008362         move.l    a0, $8362.l   ; snd238_Shoot_Power
  0009f2  3f3c00ef             move.w    #$ef, -(a7)
  0009f6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  0009fc  23c800008346         move.l    a0, $8346.l   ; snd239_Out_of_Ammo
  000a02  3f3c00f0             move.w    #$f0, -(a7)
  000a06  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a0c  23c80000833a         move.l    a0, $833a.l   ; snd240_Unlock
  000a12  3f3c00f1             move.w    #$f1, -(a7)
  000a16  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a1c  23c80000833e         move.l    a0, $833e.l   ; snd241_Use_Caffeine_Kombat
  000a22  3f3c0096             move.w    #$96, -(a7)
  000a26  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a2c  23c80000838a         move.l    a0, $838a.l   ; snd150_Suck_Swivel
  000a32  3f3c0097             move.w    #$97, -(a7)
  000a36  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a3c  23c80000838e         move.l    a0, $838e.l   ; snd151_Yeah_Byatch
  000a42  3f3c0098             move.w    #$98, -(a7)
  000a46  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a4c  23c800008392         move.l    a0, $8392.l   ; snd152_Eat_Staples
  000a52  3f3c00fa             move.w    #$fa, -(a7)
  000a56  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a5c  23c80000839a         move.l    a0, $839a.l   ; snd250_Shoot
  000a62  3f3c00fb             move.w    #$fb, -(a7)
  000a66  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a6c  23c80000839e         move.l    a0, $839e.l   ; snd251_Hit
  000a72  3f3c00fc             move.w    #$fc, -(a7)
  000a76  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a7c  23c8000083a2         move.l    a0, $83a2.l   ; snd252_Shoot_Shrapnel
  000a82  3f3c00fd             move.w    #$fd, -(a7)
  000a86  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a8c  23c8000083a6         move.l    a0, $83a6.l   ; snd253_CoWorkerTalk
  000a92  3f3c00fe             move.w    #$fe, -(a7)
  000a96  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000a9c  23c8000083aa         move.l    a0, $83aa.l   ; snd254_CoWorkerTalk2
  000aa2  3f3c00ff             move.w    #$ff, -(a7)
  000aa6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000aac  23c8000083ae         move.l    a0, $83ae.l   ; snd255_Ow_F_snd
  000ab2  3f3c0100             move.w    #$100, -(a7)
  000ab6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000abc  23c8000083b2         move.l    a0, $83b2.l   ; snd256_ooo_F_snd
  000ac2  3f3c0101             move.w    #$101, -(a7)
  000ac6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000acc  23c8000083b6         move.l    a0, $83b6.l   ; snd257_Empty_Swivel_Fall
  000ad2  3f3c0102             move.w    #$102, -(a7)
  000ad6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000adc  23c8000083ba         move.l    a0, $83ba.l   ; snd258_Empty_Swivel_Hit
  000ae2  3f3c00da             move.w    #$da, -(a7)
  000ae6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000aec  23c8000083be         move.l    a0, $83be.l   ; snd218_Full
  000af2  3f3c00db             move.w    #$db, -(a7)
  000af6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000afc  23c8000083c2         move.l    a0, $83c2.l   ; snd219_Clip_Full
  000b02  3f3c0192             move.w    #$192, -(a7)
  000b06  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b0c  23c8000083c6         move.l    a0, $83c6.l   ; snd402_Boulder
  000b12  3f3c025e             move.w    #$25e, -(a7)
  000b16  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b1c  23c8000083ca         move.l    a0, $83ca.l   ; snd606_Machine_Gun
  000b22  3f3c012c             move.w    #$12c, -(a7)
  000b26  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b2c  23c8000083ce         move.l    a0, $83ce.l   ; snd300_Throw_Dart
  000b32  3f3c012d             move.w    #$12d, -(a7)
  000b36  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b3c  23c8000083d2         move.l    a0, $83d2.l   ; snd301_Ring
  000b42  3f3c0190             move.w    #$190, -(a7)
  000b46  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b4c  23c8000083d6         move.l    a0, $83d6.l   ; snd400_Zoom
  000b52  3f3c0191             move.w    #$191, -(a7)
  000b56  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b5c  23c8000083da         move.l    a0, $83da.l   ; snd401_Die
  000b62  3f3c01f4             move.w    #$1f4, -(a7)
  000b66  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b6c  23c8000083de         move.l    a0, $83de.l   ; snd500_Explode
  000b72  3f3c01f5             move.w    #$1f5, -(a7)
  000b76  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b7c  23c8000083e2         move.l    a0, $83e2.l   ; snd501_Collide
  000b82  3f3c01f6             move.w    #$1f6, -(a7)
  000b86  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b8c  23c8000083e6         move.l    a0, $83e6.l   ; snd502_Staple_Hit
  000b92  3f3c0258             move.w    #$258, -(a7)
  000b96  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000b9c  23c8000083ea         move.l    a0, $83ea.l   ; snd600_Hit
  000ba2  3f3c0259             move.w    #$259, -(a7)
  000ba6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bac  23c8000083fa         move.l    a0, $83fa.l   ; snd601_Shoot
  000bb2  3f3c025a             move.w    #$25a, -(a7)
  000bb6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bbc  23c8000083fe         move.l    a0, $83fe.l   ; snd602_Explode
  000bc2  3f3c0259             move.w    #$259, -(a7)
  000bc6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bcc  23c80000841e         move.l    a0, $841e.l   ; snd601_Shoot
  000bd2  3f3c025b             move.w    #$25b, -(a7)
  000bd6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bdc  23c8000083f2         move.l    a0, $83f2.l   ; snd603_Die
  000be2  3f3c025c             move.w    #$25c, -(a7)
  000be6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bec  23c8000083ee         move.l    a0, $83ee.l   ; snd604_Hit
  000bf2  3f3c025d             move.w    #$25d, -(a7)
  000bf6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000bfc  23c8000083f6         move.l    a0, $83f6.l   ; snd605_Reverse
  000c02  3f3c02bc             move.w    #$2bc, -(a7)
  000c06  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c0c  23c800008402         move.l    a0, $8402.l   ; snd700_Flame
  000c12  3f3c0320             move.w    #$320, -(a7)
  000c16  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c1c  23c800008406         move.l    a0, $8406.l   ; snd800_Collide
  000c22  3f3c0321             move.w    #$321, -(a7)
  000c26  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c2c  23c80000840a         move.l    a0, $840a.l   ; snd801_Explode
  000c32  3f3c0352             move.w    #$352, -(a7)
  000c36  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c3c  23c80000840e         move.l    a0, $840e.l   ; snd850_Join_Us
  000c42  3f3c0353             move.w    #$353, -(a7)
  000c46  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c4c  23c800008412         move.l    a0, $8412.l   ; snd851_Die
  000c52  3f3c0354             move.w    #$354, -(a7)
  000c56  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c5c  23c800008416         move.l    a0, $8416.l   ; snd852_Hit
  000c62  3f3c03e8             move.w    #$3e8, -(a7)
  000c66  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c6c  23c800008422         move.l    a0, $8422.l   ; snd1000_Yell_1
  000c72  3f3c03e9             move.w    #$3e9, -(a7)
  000c76  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c7c  23c800008426         move.l    a0, $8426.l   ; snd1001_Yell_2
  000c82  3f3c03ea             move.w    #$3ea, -(a7)
  000c86  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c8c  23c80000842a         move.l    a0, $842a.l   ; snd1002_Shoot
  000c92  3f3c044c             move.w    #$44c, -(a7)
  000c96  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000c9c  23c800008456         move.l    a0, $8456.l   ; snd1100_Rustle
  000ca2  3f3c044d             move.w    #$44d, -(a7)
  000ca6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000cac  23c80000845a         move.l    a0, $845a.l   ; snd1101_Hit
  000cb2  3f3c04b0             move.w    #$4b0, -(a7)
  000cb6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000cbc  23c80000841a         move.l    a0, $841a.l   ; snd1200_Retract
  000cc2  3f3c125c             move.w    #$125c, -(a7)
  000cc6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000ccc  23c80000842e         move.l    a0, $842e.l   ; snd4700_Staple
  000cd2  3f3c125d             move.w    #$125d, -(a7)
  000cd6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000cdc  23c800008432         move.l    a0, $8432.l   ; snd4701_Dart
  000ce2  3f3c125e             move.w    #$125e, -(a7)
  000ce6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000cec  23c800008452         move.l    a0, $8452.l   ; snd4702_Grate
  000cf2  3f3c125f             move.w    #$125f, -(a7)
  000cf6  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000cfc  23c800008436         move.l    a0, $8436.l   ; snd4703_Vial
  000d02  3f3c1260             move.w    #$1260, -(a7)
  000d06  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d0c  23c80000843a         move.l    a0, $843a.l   ; snd4704_Floor_Button_Down
  000d12  3f3c1261             move.w    #$1261, -(a7)
  000d16  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d1c  23c80000843e         move.l    a0, $843e.l   ; snd4705_Floor_Button_Up
  000d22  3f3c1262             move.w    #$1262, -(a7)
  000d26  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d2c  23c800008442         move.l    a0, $8442.l   ; snd4706_Button_Down
  000d32  3f3c1263             move.w    #$1263, -(a7)
  000d36  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d3c  23c800008446         move.l    a0, $8446.l   ; snd4707_Button_Up
  000d42  3f3c1264             move.w    #$1264, -(a7)
  000d46  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d4c  23c80000844a         move.l    a0, $844a.l   ; snd4708_Open
  000d52  3f3c1265             move.w    #$1265, -(a7)
  000d56  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d5c  23c80000844e         move.l    a0, $844e.l   ; snd4709_Close
  000d62  3f3c0515             move.w    #$515, -(a7)
  000d66  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d6c  23c80000845e         move.l    a0, $845e.l   ; snd1301_Kick
  000d72  3f3c0516             move.w    #$516, -(a7)
  000d76  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d7c  23c800008462         move.l    a0, $8462.l   ; snd1302_Deliver
  000d82  3f3c0517             move.w    #$517, -(a7)
  000d86  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000d8c  23c800008466         move.l    a0, $8466.l   ; snd1303_Fan
  000d92  4e5e                 unlk      a6
  000d94  4e75                 rts       

;-------------------------------------------------------------
; InitSounds   (seg 1 +000dac, 306 bytes)
  000dac  4e560000             link.w    a6, #$0
  000db0  4a3900005590         tst.b     $5590.l   ; g_5590
  000db6  67000122             beq.w     $eda
  000dba  3f3c00c8             move.w    #$c8, -(a7)
  000dbe  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000dc4  23c8000082fa         move.l    a0, $82fa.l   ; snd200_Scoot_Regular
  000dca  3f3c00c9             move.w    #$c9, -(a7)
  000dce  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000dd4  23c8000082fe         move.l    a0, $82fe.l   ; snd201_Scoot_Low
  000dda  3f3c00ca             move.w    #$ca, -(a7)
  000dde  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000de4  23c800008302         move.l    a0, $8302.l   ; snd202_snd202
  000dea  3f3c00cb             move.w    #$cb, -(a7)
  000dee  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000df4  23c800008306         move.l    a0, $8306.l   ; snd203_Kick
  000dfa  3f3c00cc             move.w    #$cc, -(a7)
  000dfe  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e04  23c80000830a         move.l    a0, $830a.l   ; snd204_Kick_Door
  000e0a  3f3c00cd             move.w    #$cd, -(a7)
  000e0e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e14  23c800008366         move.l    a0, $8366.l   ; snd205_Locked_Door
  000e1a  3f3c00ce             move.w    #$ce, -(a7)
  000e1e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e24  23c80000836a         move.l    a0, $836a.l   ; snd206_Harry
  000e2a  3f3c00cf             move.w    #$cf, -(a7)
  000e2e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e34  23c80000836e         move.l    a0, $836e.l   ; snd207_Jump_Hit
  000e3a  3f3c00d0             move.w    #$d0, -(a7)
  000e3e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e44  23c800008372         move.l    a0, $8372.l   ; snd208_Jump_Slam
  000e4a  3f3c00d1             move.w    #$d1, -(a7)
  000e4e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e54  23c800008376         move.l    a0, $8376.l   ; snd209_Jump
  000e5a  3f3c00d2             move.w    #$d2, -(a7)
  000e5e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e64  23c80000830e         move.l    a0, $830e.l   ; snd210_Get_Coffee
  000e6a  3f3c00d3             move.w    #$d3, -(a7)
  000e6e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e74  23c800008312         move.l    a0, $8312.l   ; snd211_Get_Donut
  000e7a  3f3c00d4             move.w    #$d4, -(a7)
  000e7e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e84  23c800008316         move.l    a0, $8316.l   ; snd212_Get_Donut_Box
  000e8a  3f3c00d5             move.w    #$d5, -(a7)
  000e8e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000e94  23c80000831a         move.l    a0, $831a.l   ; snd213_snd213
  000e9a  3f3c00d6             move.w    #$d6, -(a7)
  000e9e  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000ea4  23c80000831e         move.l    a0, $831e.l   ; snd214_Get_Item
  000eaa  3f3c00d7             move.w    #$d7, -(a7)
  000eae  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000eb4  23c800008382         move.l    a0, $8382.l   ; snd215_Oil
  000eba  3f3c00d8             move.w    #$d8, -(a7)
  000ebe  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000ec4  23c800008386         move.l    a0, $8386.l   ; snd216_Get_Ammo
  000eca  3f3c00d9             move.w    #$d9, -(a7)
  000ece  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  000ed4  23c800008396         move.l    a0, $8396.l   ; snd217_Mumble
  000eda  4e5e                 unlk      a6
  000edc  4e75                 rts       

;-------------------------------------------------------------
; InitMeters   (seg 1 +000eec, 76 bytes)
  000eec  4e56fff8             link.w    a6, #$fff8
  000ef0  426efffa             clr.w     -$6(a6)
  000ef4  426efff8             clr.w     -$8(a6)
  000ef8  3d7c0093fffe         move.w    #$93, -$2(a6)
  000efe  3d7c002cfffc         move.w    #$2c, -$4(a6)
  000f04  48790000f6a6         pea.l     $f6a6.l   ; g_f6a6
  000f0a  486efff8             pea.l     -$8(a6)
  000f0e  4eb9000000b0         jsr       $b0.l   ; SATMAKEOFFSCREEN
  000f14  48790000f6a6         pea.l     $f6a6.l   ; g_f6a6
  000f1a  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  000f20  3f3c0096             move.w    #$96, -(a7)
  000f24  486efff8             pea.l     -$8(a6)
  000f28  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  000f2e  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  000f34  4e5e                 unlk      a6
  000f36  4e75                 rts       

;-------------------------------------------------------------
; InitPlayerKickRects   (seg 1 +000f46, 1326 bytes)
  000f46  4e560000             link.w    a6, #$0
  000f4a  2f03                 move.l    d3, -(a7)
  000f4c  7600                 moveq     #$0, d3
  000f4e  60000516             bra.w     $1466
  000f52  3003                 move.w    d3, d0
  000f54  48c0                 ext.l     d0
  000f56  0c8000000023         cmpi.l    #$23, d0
  000f5c  62000506             bhi.w     $1464
  000f60  303b0206             move.w    $f68(pc, d0.w * 2), d0
  000f64  4efb0002             jmp       $f68(pc, d0.w)
  000f68  0048006a008c00ae00d000f201140136 cases     0:$fb0 1:$fd2 2:$ff4 3:$1016 4:$1038 5:$105a 6:$107c 7:$109e
  000f78  01560176019601b601d601f8021a023c cases     8:$10be 9:$10de 10:$10fe 11:$111e 12:$113e 13:$1160 14:$1182 15:$11a4
  000f88  025e028002a202c402e60308032a034c cases     16:$11c6 17:$11e8 18:$120a 19:$122c 20:$124e 21:$1270 22:$1292 23:$12b4
  000f98  036e039003b203d403f60418043a045c cases     24:$12d6 25:$12f8 26:$131a 27:$133c 28:$135e 29:$1380 30:$13a2 31:$13c4
  000fa8  047e049e04be04de     cases     32:$13e6 33:$1406 34:$1426 35:$1446
  000fb0  3043                 movea.w   d3, a0
  000fb2  2008                 move.l    a0, d0
  000fb4  e788                 lsl.l     #$3, d0
  000fb6  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  000fbc  d1c0                 adda.l    d0, a0
  000fbe  4850                 pea.l     (a0)
  000fc0  2f3c001b0033         move.l    #$1b0033, -(a7)
  000fc6  2f3c0025003f         move.l    #$25003f, -(a7)
  000fcc  a8a7                 _SetRect  
  000fce  60000494             bra.w     $1464
  000fd2  3043                 movea.w   d3, a0
  000fd4  2008                 move.l    a0, d0
  000fd6  e788                 lsl.l     #$3, d0
  000fd8  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  000fde  d1c0                 adda.l    d0, a0
  000fe0  4850                 pea.l     (a0)
  000fe2  2f3c00150036         move.l    #$150036, -(a7)
  000fe8  2f3c0021003f         move.l    #$21003f, -(a7)
  000fee  a8a7                 _SetRect  
  000ff0  60000472             bra.w     $1464
  000ff4  3043                 movea.w   d3, a0
  000ff6  2008                 move.l    a0, d0
  000ff8  e788                 lsl.l     #$3, d0
  000ffa  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001000  d1c0                 adda.l    d0, a0
  001002  4850                 pea.l     (a0)
  001004  2f3c00100036         move.l    #$100036, -(a7)
  00100a  2f3c001c003f         move.l    #$1c003f, -(a7)
  001010  a8a7                 _SetRect  
  001012  60000450             bra.w     $1464
  001016  3043                 movea.w   d3, a0
  001018  2008                 move.l    a0, d0
  00101a  e788                 lsl.l     #$3, d0
  00101c  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001022  d1c0                 adda.l    d0, a0
  001024  4850                 pea.l     (a0)
  001026  2f3c000b0031         move.l    #$b0031, -(a7)
  00102c  2f3c0019003e         move.l    #$19003e, -(a7)
  001032  a8a7                 _SetRect  
  001034  6000042e             bra.w     $1464
  001038  3043                 movea.w   d3, a0
  00103a  2008                 move.l    a0, d0
  00103c  e788                 lsl.l     #$3, d0
  00103e  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001044  d1c0                 adda.l    d0, a0
  001046  4850                 pea.l     (a0)
  001048  2f3c00060030         move.l    #$60030, -(a7)
  00104e  2f3c0014003c         move.l    #$14003c, -(a7)
  001054  a8a7                 _SetRect  
  001056  6000040c             bra.w     $1464
  00105a  3043                 movea.w   d3, a0
  00105c  2008                 move.l    a0, d0
  00105e  e788                 lsl.l     #$3, d0
  001060  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001066  d1c0                 adda.l    d0, a0
  001068  4850                 pea.l     (a0)
  00106a  2f3c0004002c         move.l    #$4002c, -(a7)
  001070  2f3c00100039         move.l    #$100039, -(a7)
  001076  a8a7                 _SetRect  
  001078  600003ea             bra.w     $1464
  00107c  3043                 movea.w   d3, a0
  00107e  2008                 move.l    a0, d0
  001080  e788                 lsl.l     #$3, d0
  001082  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001088  d1c0                 adda.l    d0, a0
  00108a  4850                 pea.l     (a0)
  00108c  2f3c00010029         move.l    #$10029, -(a7)
  001092  2f3c000d0035         move.l    #$d0035, -(a7)
  001098  a8a7                 _SetRect  
  00109a  600003c8             bra.w     $1464
  00109e  3043                 movea.w   d3, a0
  0010a0  2008                 move.l    a0, d0
  0010a2  e788                 lsl.l     #$3, d0
  0010a4  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0010aa  d1c0                 adda.l    d0, a0
  0010ac  4850                 pea.l     (a0)
  0010ae  48780024             pea.l     $24.w
  0010b2  2f3c000a0030         move.l    #$a0030, -(a7)
  0010b8  a8a7                 _SetRect  
  0010ba  600003a8             bra.w     $1464
  0010be  3043                 movea.w   d3, a0
  0010c0  2008                 move.l    a0, d0
  0010c2  e788                 lsl.l     #$3, d0
  0010c4  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0010ca  d1c0                 adda.l    d0, a0
  0010cc  4850                 pea.l     (a0)
  0010ce  4878001f             pea.l     $1f.w
  0010d2  2f3c0008002a         move.l    #$8002a, -(a7)
  0010d8  a8a7                 _SetRect  
  0010da  60000388             bra.w     $1464
  0010de  3043                 movea.w   d3, a0
  0010e0  2008                 move.l    a0, d0
  0010e2  e788                 lsl.l     #$3, d0
  0010e4  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0010ea  d1c0                 adda.l    d0, a0
  0010ec  4850                 pea.l     (a0)
  0010ee  4878001b             pea.l     $1b.w
  0010f2  2f3c00060025         move.l    #$60025, -(a7)
  0010f8  a8a7                 _SetRect  
  0010fa  60000368             bra.w     $1464
  0010fe  3043                 movea.w   d3, a0
  001100  2008                 move.l    a0, d0
  001102  e788                 lsl.l     #$3, d0
  001104  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00110a  d1c0                 adda.l    d0, a0
  00110c  4850                 pea.l     (a0)
  00110e  48780015             pea.l     $15.w
  001112  2f3c00070020         move.l    #$70020, -(a7)
  001118  a8a7                 _SetRect  
  00111a  60000348             bra.w     $1464
  00111e  3043                 movea.w   d3, a0
  001120  2008                 move.l    a0, d0
  001122  e788                 lsl.l     #$3, d0
  001124  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00112a  d1c0                 adda.l    d0, a0
  00112c  4850                 pea.l     (a0)
  00112e  48780010             pea.l     $10.w
  001132  2f3c0009001c         move.l    #$9001c, -(a7)
  001138  a8a7                 _SetRect  
  00113a  60000328             bra.w     $1464
  00113e  3043                 movea.w   d3, a0
  001140  2008                 move.l    a0, d0
  001142  e788                 lsl.l     #$3, d0
  001144  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00114a  d1c0                 adda.l    d0, a0
  00114c  4850                 pea.l     (a0)
  00114e  2f3c0001000a         move.l    #$1000a, -(a7)
  001154  2f3c000b0017         move.l    #$b0017, -(a7)
  00115a  a8a7                 _SetRect  
  00115c  60000306             bra.w     $1464
  001160  3043                 movea.w   d3, a0
  001162  2008                 move.l    a0, d0
  001164  e788                 lsl.l     #$3, d0
  001166  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00116c  d1c0                 adda.l    d0, a0
  00116e  4850                 pea.l     (a0)
  001170  2f3c00020006         move.l    #$20006, -(a7)
  001176  2f3c000e0013         move.l    #$e0013, -(a7)
  00117c  a8a7                 _SetRect  
  00117e  600002e4             bra.w     $1464
  001182  3043                 movea.w   d3, a0
  001184  2008                 move.l    a0, d0
  001186  e788                 lsl.l     #$3, d0
  001188  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00118e  d1c0                 adda.l    d0, a0
  001190  4850                 pea.l     (a0)
  001192  2f3c00060004         move.l    #$60004, -(a7)
  001198  2f3c0012000f         move.l    #$12000f, -(a7)
  00119e  a8a7                 _SetRect  
  0011a0  600002c2             bra.w     $1464
  0011a4  3043                 movea.w   d3, a0
  0011a6  2008                 move.l    a0, d0
  0011a8  e788                 lsl.l     #$3, d0
  0011aa  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0011b0  d1c0                 adda.l    d0, a0
  0011b2  4850                 pea.l     (a0)
  0011b4  2f3c000a0001         move.l    #$a0001, -(a7)
  0011ba  2f3c0016000d         move.l    #$16000d, -(a7)
  0011c0  a8a7                 _SetRect  
  0011c2  600002a0             bra.w     $1464
  0011c6  3043                 movea.w   d3, a0
  0011c8  2008                 move.l    a0, d0
  0011ca  e788                 lsl.l     #$3, d0
  0011cc  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0011d2  d1c0                 adda.l    d0, a0
  0011d4  4850                 pea.l     (a0)
  0011d6  2f3c000f0000         move.l    #$f0000, -(a7)
  0011dc  2f3c001b0009         move.l    #$1b0009, -(a7)
  0011e2  a8a7                 _SetRect  
  0011e4  6000027e             bra.w     $1464
  0011e8  3043                 movea.w   d3, a0
  0011ea  2008                 move.l    a0, d0
  0011ec  e788                 lsl.l     #$3, d0
  0011ee  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0011f4  d1c0                 adda.l    d0, a0
  0011f6  4850                 pea.l     (a0)
  0011f8  2f3c00150000         move.l    #$150000, -(a7)
  0011fe  2f3c00200008         move.l    #$200008, -(a7)
  001204  a8a7                 _SetRect  
  001206  6000025c             bra.w     $1464
  00120a  3043                 movea.w   d3, a0
  00120c  2008                 move.l    a0, d0
  00120e  e788                 lsl.l     #$3, d0
  001210  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001216  d1c0                 adda.l    d0, a0
  001218  4850                 pea.l     (a0)
  00121a  2f3c001a0000         move.l    #$1a0000, -(a7)
  001220  2f3c00240007         move.l    #$240007, -(a7)
  001226  a8a7                 _SetRect  
  001228  6000023a             bra.w     $1464
  00122c  3043                 movea.w   d3, a0
  00122e  2008                 move.l    a0, d0
  001230  e788                 lsl.l     #$3, d0
  001232  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001238  d1c0                 adda.l    d0, a0
  00123a  4850                 pea.l     (a0)
  00123c  2f3c001f0000         move.l    #$1f0000, -(a7)
  001242  2f3c002a0007         move.l    #$2a0007, -(a7)
  001248  a8a7                 _SetRect  
  00124a  60000218             bra.w     $1464
  00124e  3043                 movea.w   d3, a0
  001250  2008                 move.l    a0, d0
  001252  e788                 lsl.l     #$3, d0
  001254  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00125a  d1c0                 adda.l    d0, a0
  00125c  4850                 pea.l     (a0)
  00125e  2f3c00230000         move.l    #$230000, -(a7)
  001264  2f3c002f0009         move.l    #$2f0009, -(a7)
  00126a  a8a7                 _SetRect  
  00126c  600001f6             bra.w     $1464
  001270  3043                 movea.w   d3, a0
  001272  2008                 move.l    a0, d0
  001274  e788                 lsl.l     #$3, d0
  001276  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00127c  d1c0                 adda.l    d0, a0
  00127e  4850                 pea.l     (a0)
  001280  2f3c00260001         move.l    #$260001, -(a7)
  001286  2f3c0035000b         move.l    #$35000b, -(a7)
  00128c  a8a7                 _SetRect  
  00128e  600001d4             bra.w     $1464
  001292  3043                 movea.w   d3, a0
  001294  2008                 move.l    a0, d0
  001296  e788                 lsl.l     #$3, d0
  001298  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00129e  d1c0                 adda.l    d0, a0
  0012a0  4850                 pea.l     (a0)
  0012a2  2f3c002b0003         move.l    #$2b0003, -(a7)
  0012a8  2f3c0039000f         move.l    #$39000f, -(a7)
  0012ae  a8a7                 _SetRect  
  0012b0  600001b2             bra.w     $1464
  0012b4  3043                 movea.w   d3, a0
  0012b6  2008                 move.l    a0, d0
  0012b8  e788                 lsl.l     #$3, d0
  0012ba  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0012c0  d1c0                 adda.l    d0, a0
  0012c2  4850                 pea.l     (a0)
  0012c4  2f3c002f0007         move.l    #$2f0007, -(a7)
  0012ca  2f3c003b0013         move.l    #$3b0013, -(a7)
  0012d0  a8a7                 _SetRect  
  0012d2  60000190             bra.w     $1464
  0012d6  3043                 movea.w   d3, a0
  0012d8  2008                 move.l    a0, d0
  0012da  e788                 lsl.l     #$3, d0
  0012dc  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0012e2  d1c0                 adda.l    d0, a0
  0012e4  4850                 pea.l     (a0)
  0012e6  2f3c0033000b         move.l    #$33000b, -(a7)
  0012ec  2f3c003f0016         move.l    #$3f0016, -(a7)
  0012f2  a8a7                 _SetRect  
  0012f4  6000016e             bra.w     $1464
  0012f8  3043                 movea.w   d3, a0
  0012fa  2008                 move.l    a0, d0
  0012fc  e788                 lsl.l     #$3, d0
  0012fe  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001304  d1c0                 adda.l    d0, a0
  001306  4850                 pea.l     (a0)
  001308  2f3c0035000f         move.l    #$35000f, -(a7)
  00130e  2f3c003f001b         move.l    #$3f001b, -(a7)
  001314  a8a7                 _SetRect  
  001316  6000014c             bra.w     $1464
  00131a  3043                 movea.w   d3, a0
  00131c  2008                 move.l    a0, d0
  00131e  e788                 lsl.l     #$3, d0
  001320  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001326  d1c0                 adda.l    d0, a0
  001328  4850                 pea.l     (a0)
  00132a  2f3c00370015         move.l    #$370015, -(a7)
  001330  2f3c003f0020         move.l    #$3f0020, -(a7)
  001336  a8a7                 _SetRect  
  001338  6000012a             bra.w     $1464
  00133c  3043                 movea.w   d3, a0
  00133e  2008                 move.l    a0, d0
  001340  e788                 lsl.l     #$3, d0
  001342  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001348  d1c0                 adda.l    d0, a0
  00134a  4850                 pea.l     (a0)
  00134c  2f3c0037001a         move.l    #$37001a, -(a7)
  001352  2f3c003f0024         move.l    #$3f0024, -(a7)
  001358  a8a7                 _SetRect  
  00135a  60000108             bra.w     $1464
  00135e  3043                 movea.w   d3, a0
  001360  2008                 move.l    a0, d0
  001362  e788                 lsl.l     #$3, d0
  001364  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00136a  d1c0                 adda.l    d0, a0
  00136c  4850                 pea.l     (a0)
  00136e  2f3c0038001f         move.l    #$38001f, -(a7)
  001374  2f3c003f002a         move.l    #$3f002a, -(a7)
  00137a  a8a7                 _SetRect  
  00137c  600000e6             bra.w     $1464
  001380  3043                 movea.w   d3, a0
  001382  2008                 move.l    a0, d0
  001384  e788                 lsl.l     #$3, d0
  001386  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  00138c  d1c0                 adda.l    d0, a0
  00138e  4850                 pea.l     (a0)
  001390  2f3c00360023         move.l    #$360023, -(a7)
  001396  2f3c003f002f         move.l    #$3f002f, -(a7)
  00139c  a8a7                 _SetRect  
  00139e  600000c4             bra.w     $1464
  0013a2  3043                 movea.w   d3, a0
  0013a4  2008                 move.l    a0, d0
  0013a6  e788                 lsl.l     #$3, d0
  0013a8  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0013ae  d1c0                 adda.l    d0, a0
  0013b0  4850                 pea.l     (a0)
  0013b2  2f3c00330027         move.l    #$330027, -(a7)
  0013b8  2f3c003e0035         move.l    #$3e0035, -(a7)
  0013be  a8a7                 _SetRect  
  0013c0  600000a2             bra.w     $1464
  0013c4  3043                 movea.w   d3, a0
  0013c6  2008                 move.l    a0, d0
  0013c8  e788                 lsl.l     #$3, d0
  0013ca  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0013d0  d1c0                 adda.l    d0, a0
  0013d2  4850                 pea.l     (a0)
  0013d4  2f3c0030002b         move.l    #$30002b, -(a7)
  0013da  2f3c003d0038         move.l    #$3d0038, -(a7)
  0013e0  a8a7                 _SetRect  
  0013e2  60000080             bra.w     $1464
  0013e6  3043                 movea.w   d3, a0
  0013e8  2008                 move.l    a0, d0
  0013ea  e788                 lsl.l     #$3, d0
  0013ec  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  0013f2  d1c0                 adda.l    d0, a0
  0013f4  4850                 pea.l     (a0)
  0013f6  2f3c002c002e         move.l    #$2c002e, -(a7)
  0013fc  2f3c0039003c         move.l    #$39003c, -(a7)
  001402  a8a7                 _SetRect  
  001404  605e                 bra.b     $1464
  001406  3043                 movea.w   d3, a0
  001408  2008                 move.l    a0, d0
  00140a  e788                 lsl.l     #$3, d0
  00140c  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001412  d1c0                 adda.l    d0, a0
  001414  4850                 pea.l     (a0)
  001416  2f3c00280033         move.l    #$280033, -(a7)
  00141c  2f3c0034003e         move.l    #$34003e, -(a7)
  001422  a8a7                 _SetRect  
  001424  603e                 bra.b     $1464
  001426  3043                 movea.w   d3, a0
  001428  2008                 move.l    a0, d0
  00142a  e788                 lsl.l     #$3, d0
  00142c  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001432  d1c0                 adda.l    d0, a0
  001434  4850                 pea.l     (a0)
  001436  2f3c00240034         move.l    #$240034, -(a7)
  00143c  2f3c0030003f         move.l    #$30003f, -(a7)
  001442  a8a7                 _SetRect  
  001444  601e                 bra.b     $1464
  001446  3043                 movea.w   d3, a0
  001448  2008                 move.l    a0, d0
  00144a  e788                 lsl.l     #$3, d0
  00144c  41f9000080ce         lea.l     $80ce.l, a0   ; g_80ce
  001452  d1c0                 adda.l    d0, a0
  001454  4850                 pea.l     (a0)
  001456  2f3c001f0037         move.l    #$1f0037, -(a7)
  00145c  2f3c002a003f         move.l    #$2a003f, -(a7)
  001462  a8a7                 _SetRect  
  001464  5243                 addq.w    #$1, d3
  001466  0c430024             cmpi.w    #$24, d3
  00146a  6d00fae6             blt.w     $f52
  00146e  261f                 move.l    (a7)+, d3
  001470  4e5e                 unlk      a6
  001472  4e75                 rts       

;-------------------------------------------------------------
; InitAppGlobals   (seg 1 +00148a, 532 bytes)
  00148a  4e56ffe0             link.w    a6, #$ffe0
  00148e  2f0a                 move.l    a2, -(a7)
  001490  423900007f1a         clr.b     $7f1a.l   ; g_7f1a
  001496  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  00149c  487900007f24         pea.l     $7f24.l   ; g_7f24
  0014a2  487900005586         pea.l     $5586.l   ; g_5586
  0014a8  4eb900000a88         jsr       $a88.l   ; CopyPString
  0014ae  486effe8             pea.l     -$18(a6)
  0014b2  42a7                 clr.l     -(a7)
  0014b4  2f3c01000100         move.l    #$1000100, -(a7)
  0014ba  a8a7                 _SetRect  
  0014bc  61fffffffa2e         bsr.l     $eec   ; InitMeters
  0014c2  61fffffffa82         bsr.l     $f46   ; InitPlayerKickRects
  0014c8  203c0001140c         move.l    #$1140c, d0
  0014ce  a322                 _NewHandle 
  0014d0  23c800007468         move.l    a0, $7468.l   ; hWorld
  0014d6  203c00012988         move.l    #$12988, d0
  0014dc  a322                 _NewHandle 
  0014de  23c80000746c         move.l    a0, $746c.l   ; hLevel
  0014e4  203c000095d8         move.l    #$95d8, d0
  0014ea  a322                 _NewHandle 
  0014ec  23c800007470         move.l    a0, $7470.l   ; hSave
  0014f2  423900007f1d         clr.b     $7f1d.l   ; g_7f1d
  0014f8  486efff0             pea.l     -$10(a6)
  0014fc  42a7                 clr.l     -(a7)
  0014fe  2f3c01e00280         move.l    #$1e00280, -(a7)
  001504  a8a7                 _SetRect  
  001506  486efff8             pea.l     -$8(a6)
  00150a  42a7                 clr.l     -(a7)
  00150c  2f3c00800080         move.l    #$800080, -(a7)
  001512  a8a7                 _SetRect  
  001514  3f3c00c6             move.w    #$c6, -(a7)
  001518  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00151e  23c800013c2a         move.l    a0, $13c2a.l   ; snd198_pause_snd
  001524  3f3c12c0             move.w    #$12c0, -(a7)
  001528  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00152e  23c80000846a         move.l    a0, $846a.l   ; snd4800_Level_Up
  001534  3f3c12c1             move.w    #$12c1, -(a7)
  001538  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00153e  23c80000846e         move.l    a0, $846e.l   ; snd4801_Switch_Item
  001544  3f3c12c3             move.w    #$12c3, -(a7)
  001548  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00154e  23c800008472         move.l    a0, $8472.l   ; snd4803_Mouse_Down
  001554  3f3c12c4             move.w    #$12c4, -(a7)
  001558  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00155e  23c800008476         move.l    a0, $8476.l   ; snd4804_Mouse_Up
  001564  3f3c1324             move.w    #$1324, -(a7)
  001568  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00156e  23c80000847a         move.l    a0, $847a.l   ; snd4900_You_re_Fired
  001574  3f3c1325             move.w    #$1325, -(a7)
  001578  4eb9000001d0         jsr       $1d0.l   ; seg7+87ec
  00157e  23c80000847e         move.l    a0, $847e.l   ; snd4901_Scream_1
  001584  487900007474         pea.l     $7474.l   ; gameOffscreen
  00158a  486efff0             pea.l     -$10(a6)
  00158e  4eb9000000b0         jsr       $b0.l   ; SATMAKEOFFSCREEN
  001594  48790000f688         pea.l     $f688.l   ; g_f688
  00159a  486efff8             pea.l     -$8(a6)
  00159e  4eb9000000b0         jsr       $b0.l   ; SATMAKEOFFSCREEN
  0015a4  487900007474         pea.l     $7474.l   ; gameOffscreen
  0015aa  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  0015b0  3f3c0081             move.w    #$81, -(a7)
  0015b4  4eb900000078         jsr       $78.l   ; SATGETANDDRAWPICTRES
  0015ba  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0015c0  42b900007e0e         clr.l     $7e0e.l   ; bgTileFaces
  0015c6  aa2a                 _GetMainDevice 
  0015c8  205f                 movea.l   (a7)+, a0
  0015ca  2448                 movea.l   a0, a2
  0015cc  200a                 move.l    a2, d0
  0015ce  4fef0012             lea.l     $12(a7), a7
  0015d2  6608                 bne.b     $15dc
  0015d4  3f3c0019             move.w    #$19, -(a7)
  0015d8  a9c8                 _SysBeep  
  0015da  a9f4                 _ExitToShell 
  0015dc  2052                 movea.l   (a2), a0
  0015de  20680016             movea.l   $16(a0), a0
  0015e2  2050                 movea.l   (a0), a0
  0015e4  23e8000600013c8c     move.l    $6(a0), $13c8c.l   ; g_13c8c
  0015ec  23e8000a00013c90     move.l    $a(a0), $13c90.l   ; g_13c90
  0015f4  23e8000600013c84     move.l    $6(a0), $13c84.l   ; g_13c84
  0015fc  23e8000a00013c88     move.l    $a(a0), $13c88.l   ; g_13c88
  001604  2052                 movea.l   (a2), a0
  001606  20680016             movea.l   $16(a0), a0
  00160a  2050                 movea.l   (a0), a0
  00160c  30280004             move.w    $4(a0), d0
  001610  028000003fff         andi.l    #$3fff, d0
  001616  23c0000082f6         move.l    d0, $82f6.l   ; g_82f6
  00161c  303900013c86         move.w    $13c86.l, d0   ; g_13c86
  001622  48c0                 ext.l     d0
  001624  323900013c8a         move.w    $13c8a.l, d1   ; g_13c8a
  00162a  48c1                 ext.l     d1
  00162c  9280                 sub.l     d0, d1
  00162e  0681fffffd80         addi.l    #$fffffd80, d1
  001634  2001                 move.l    d1, d0
  001636  e088                 lsr.l     #$8, d0
  001638  e088                 lsr.l     #$8, d0
  00163a  e088                 lsr.l     #$8, d0
  00163c  ee88                 lsr.l     #$7, d0
  00163e  d081                 add.l     d1, d0
  001640  e280                 asr.l     #$1, d0
  001642  323900013c84         move.w    $13c84.l, d1   ; g_13c84
  001648  48c1                 ext.l     d1
  00164a  343900013c88         move.w    $13c88.l, d2   ; g_13c88
  001650  48c2                 ext.l     d2
  001652  9481                 sub.l     d1, d2
  001654  0682fffffe20         addi.l    #$fffffe20, d2
  00165a  2202                 move.l    d2, d1
  00165c  e089                 lsr.l     #$8, d1
  00165e  e089                 lsr.l     #$8, d1
  001660  e089                 lsr.l     #$8, d1
  001662  ee89                 lsr.l     #$7, d1
  001664  d282                 add.l     d2, d1
  001666  e281                 asr.l     #$1, d1
  001668  4c391800000082f6     muls.l    $82f6.l, d1   ; g_82f6
  001670  2d40ffe0             move.l    d0, -$20(a6)
  001674  2d41ffe4             move.l    d1, -$1c(a6)
  001678  594f                 subq.w    #$4, a7
  00167a  2052                 movea.l   (a2), a0
  00167c  2f280016             move.l    $16(a0), -(a7)
  001680  203c0004000f         move.l    #$4000f, d0
  001686  ab1d                 _QDExtensions 
  001688  205f                 movea.l   (a7)+, a0
  00168a  d1eeffe4             adda.l    -$1c(a6), a0
  00168e  d1eeffe0             adda.l    -$20(a6), a0
  001692  23c8000082f2         move.l    a0, $82f2.l   ; g_82f2
  001698  245f                 movea.l   (a7)+, a2
  00169a  4e5e                 unlk      a6
  00169c  4e75                 rts       

;-------------------------------------------------------------
; InitGameGlobals   (seg 1 +0016b0, 258 bytes)
  0016b0  4e560000             link.w    a6, #$0
  0016b4  2f03                 move.l    d3, -(a7)
  0016b6  33fc0048000046be     move.w    #$48, $46be.l   ; g_46be
  0016be  33fc00480000f6c4     move.w    #$48, $f6c4.l   ; g_f6c4
  0016c6  33fc0048000046c4     move.w    #$48, $46c4.l   ; g_46c4
  0016ce  33fc0048000046ba     move.w    #$48, $46ba.l   ; g_46ba
  0016d6  33fc00480000f6c8     move.w    #$48, $f6c8.l   ; g_f6c8
  0016de  33fc0048000046c0     move.w    #$48, $46c0.l   ; g_46c0
  0016e6  33fc0048000046bc     move.w    #$48, $46bc.l   ; g_46bc
  0016ee  33fc00480000f6c6     move.w    #$48, $f6c6.l   ; g_f6c6
  0016f6  33fc0048000046c2     move.w    #$48, $46c2.l   ; g_46c2
  0016fe  33fcffff000046b4     move.w    #$ffff, $46b4.l   ; g_46b4
  001706  42b90000f6c0         clr.l     $f6c0.l   ; g_f6c0
  00170c  42b90000807e         clr.l     $807e.l   ; g_807e
  001712  42b90000807a         clr.l     $807a.l   ; g_807a
  001718  42790000f6d4         clr.w     $f6d4.l   ; g_f6d4
  00171e  42790000f6d2         clr.w     $f6d2.l   ; g_f6d2
  001724  42790000f6d0         clr.w     $f6d0.l   ; g_f6d0
  00172a  427900008086         clr.w     $8086.l   ; g_8086
  001730  427900008084         clr.w     $8084.l   ; g_8084
  001736  427900008082         clr.w     $8082.l   ; g_8082
  00173c  42790000808c         clr.w     $808c.l   ; g_808c
  001742  4279000080c0         clr.w     $80c0.l   ; screenShake
  001748  4239000080c4         clr.b     $80c4.l   ; g_80c4
  00174e  4279000080c2         clr.w     $80c2.l   ; g_80c2
  001754  4ab900007470         tst.l     $7470.l   ; hSave
  00175a  670c                 beq.b     $1768
  00175c  207900007470         movea.l   $7470.l, a0   ; hSave
  001762  2050                 movea.l   (a0), a0
  001764  42280004             clr.b     $4(a0)
  001768  7600                 moveq     #$0, d3
  00176a  602e                 bra.b     $179a
  00176c  41f90000f6d8         lea.l     $f6d8.l, a0   ; g_f6d8
  001772  31bcffff3400         move.w    #$ffff, (a0, d3.w * 4)
  001778  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00177e  31bcffff3400         move.w    #$ffff, (a0, d3.w * 4)
  001784  41f90000f6d8         lea.l     $f6d8.l, a0   ; g_f6d8
  00178a  42703402             clr.w     $2(a0, d3.w * 4)
  00178e  41f900008090         lea.l     $8090.l, a0   ; g_8090
  001794  42703402             clr.w     $2(a0, d3.w * 4)
  001798  5243                 addq.w    #$1, d3
  00179a  0c43000c             cmpi.w    #$c, d3
  00179e  6dcc                 blt.b     $176c
  0017a0  423900013c27         clr.b     $13c27.l   ; g_13c27
  0017a6  4eb900000bb8         jsr       $bb8.l   ; InitDynamicSounds
  0017ac  261f                 move.l    (a7)+, d3
  0017ae  4e5e                 unlk      a6
  0017b0  4e75                 rts       

;-------------------------------------------------------------
; InitTiles   (seg 1 +0017c4, 176 bytes)
  0017c4  4e560000             link.w    a6, #$0
  0017c8  2f03                 move.l    d3, -(a7)
  0017ca  42a7                 clr.l     -(a7)
  0017cc  2f3c00080000         move.l    #$80000, -(a7)
  0017d2  2f3c00200020         move.l    #$200020, -(a7)
  0017d8  2f3c00b40060         move.l    #$b40060, -(a7)
  0017de  4eb900000a28         jsr       $a28.l   ; LoadEncFaceSetFromPICT
  0017e4  23c800007e0e         move.l    a0, $7e0e.l   ; bgTileFaces
  0017ea  42a7                 clr.l     -(a7)
  0017ec  2f3c00080000         move.l    #$80000, -(a7)
  0017f2  2f3c00200020         move.l    #$200020, -(a7)
  0017f8  2f3c00b50040         move.l    #$b50040, -(a7)
  0017fe  4eb900000a28         jsr       $a28.l   ; LoadEncFaceSetFromPICT
  001804  23c800007e12         move.l    a0, $7e12.l   ; fgTileFaces
  00180a  7600                 moveq     #$0, d3
  00180c  4fef0020             lea.l     $20(a7), a7
  001810  6026                 bra.b     $1838
  001812  701c                 moveq     #$1c, d0
  001814  c1c3                 muls.w    d3, d0
  001816  207900007e0e         movea.l   $7e0e.l, a0   ; bgTileFaces
  00181c  d1c0                 adda.l    d0, a0
  00181e  2008                 move.l    a0, d0
  001820  6714                 beq.b     $1836
  001822  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  001828  701c                 moveq     #$1c, d0
  00182a  c1c3                 muls.w    d3, d0
  00182c  227900007e0e         movea.l   $7e0e.l, a1   ; bgTileFaces
  001832  23880818             move.l    a0, $18(a1, d0.l)
  001836  5243                 addq.w    #$1, d3
  001838  0c430060             cmpi.w    #$60, d3
  00183c  6dd4                 blt.b     $1812
  00183e  7600                 moveq     #$0, d3
  001840  6026                 bra.b     $1868
  001842  701c                 moveq     #$1c, d0
  001844  c1c3                 muls.w    d3, d0
  001846  207900007e12         movea.l   $7e12.l, a0   ; fgTileFaces
  00184c  d1c0                 adda.l    d0, a0
  00184e  2008                 move.l    a0, d0
  001850  6714                 beq.b     $1866
  001852  41f900000a08         lea.l     $a08.l, a0   ; BLITENCFACEPROC
  001858  701c                 moveq     #$1c, d0
  00185a  c1c3                 muls.w    d3, d0
  00185c  227900007e12         movea.l   $7e12.l, a1   ; fgTileFaces
  001862  23880818             move.l    a0, $18(a1, d0.l)
  001866  5243                 addq.w    #$1, d3
  001868  0c430040             cmpi.w    #$40, d3
  00186c  6dd4                 blt.b     $1842
  00186e  261f                 move.l    (a7)+, d3
  001870  4e5e                 unlk      a6
  001872  4e75                 rts       

;-------------------------------------------------------------
; LoadBGTileset   (seg 1 +001880, 156 bytes)
  001880  4e560000             link.w    a6, #$0
  001884  48e71020             movem.l   d3/a2, -(a7)
  001888  4ab900007e0e         tst.l     $7e0e.l   ; bgTileFaces
  00188e  6734                 beq.b     $18c4
  001890  7600                 moveq     #$0, d3
  001892  602a                 bra.b     $18be
  001894  701c                 moveq     #$1c, d0
  001896  c1c3                 muls.w    d3, d0
  001898  247900007e0e         movea.l   $7e0e.l, a2   ; bgTileFaces
  00189e  d5c0                 adda.l    d0, a2
  0018a0  701c                 moveq     #$1c, d0
  0018a2  c1c3                 muls.w    d3, d0
  0018a4  207900007e0e         movea.l   $7e0e.l, a0   ; bgTileFaces
  0018aa  d1c0                 adda.l    d0, a0
  0018ac  2008                 move.l    a0, d0
  0018ae  670c                 beq.b     $18bc
  0018b0  2f0a                 move.l    a2, -(a7)
  0018b2  4eb900000a30         jsr       $a30.l   ; DisposeEncFace
  0018b8  95ca                 suba.l    a2, a2
  0018ba  584f                 addq.w    #$4, a7
  0018bc  5243                 addq.w    #$1, d3
  0018be  0c430060             cmpi.w    #$60, d3
  0018c2  6dd0                 blt.b     $1894
  0018c4  4267                 clr.w     -(a7)
  0018c6  42a7                 clr.l     -(a7)
  0018c8  2f3c00200008         move.l    #$200008, -(a7)
  0018ce  2f3c00600020         move.l    #$600020, -(a7)
  0018d4  3f2e0008             move.w    $8(a6), -(a7)
  0018d8  4eb900000a28         jsr       $a28.l   ; LoadEncFaceSetFromPICT
  0018de  23c800007e0e         move.l    a0, $7e0e.l   ; bgTileFaces
  0018e4  7600                 moveq     #$0, d3
  0018e6  4fef0010             lea.l     $10(a7), a7
  0018ea  6022                 bra.b     $190e
  0018ec  701c                 moveq     #$1c, d0
  0018ee  c1c3                 muls.w    d3, d0
  0018f0  247900007e0e         movea.l   $7e0e.l, a2   ; bgTileFaces
  0018f6  d5c0                 adda.l    d0, a2
  0018f8  200a                 move.l    a2, d0
  0018fa  6610                 bne.b     $190c
  0018fc  487900005558         pea.l     $5558.l   ; g_5558
  001902  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  001908  a9f4                 _ExitToShell 
  00190a  584f                 addq.w    #$4, a7
  00190c  5243                 addq.w    #$1, d3
  00190e  0c430060             cmpi.w    #$60, d3
  001912  6dd8                 blt.b     $18ec
  001914  4cdf0408             movem.l   (a7)+, d3/a2
  001918  4e5e                 unlk      a6
  00191a  4e75                 rts       

;-------------------------------------------------------------
; LoadFGTileset   (seg 1 +00192c, 142 bytes)
  00192c  4e560000             link.w    a6, #$0
  001930  2f03                 move.l    d3, -(a7)
  001932  7600                 moveq     #$0, d3
  001934  6028                 bra.b     $195e
  001936  701c                 moveq     #$1c, d0
  001938  c1c3                 muls.w    d3, d0
  00193a  207900007e12         movea.l   $7e12.l, a0   ; fgTileFaces
  001940  d1c0                 adda.l    d0, a0
  001942  2008                 move.l    a0, d0
  001944  6716                 beq.b     $195c
  001946  701c                 moveq     #$1c, d0
  001948  c1c3                 muls.w    d3, d0
  00194a  207900007e12         movea.l   $7e12.l, a0   ; fgTileFaces
  001950  d1c0                 adda.l    d0, a0
  001952  4850                 pea.l     (a0)
  001954  4eb900000a30         jsr       $a30.l   ; DisposeEncFace
  00195a  584f                 addq.w    #$4, a7
  00195c  5243                 addq.w    #$1, d3
  00195e  0c430040             cmpi.w    #$40, d3
  001962  6dd2                 blt.b     $1936
  001964  4267                 clr.w     -(a7)
  001966  42a7                 clr.l     -(a7)
  001968  2f3c00200008         move.l    #$200008, -(a7)
  00196e  2f3c00400020         move.l    #$400020, -(a7)
  001974  3f2e0008             move.w    $8(a6), -(a7)
  001978  4eb900000a28         jsr       $a28.l   ; LoadEncFaceSetFromPICT
  00197e  23c800007e12         move.l    a0, $7e12.l   ; fgTileFaces
  001984  7600                 moveq     #$0, d3
  001986  4fef0010             lea.l     $10(a7), a7
  00198a  6022                 bra.b     $19ae
  00198c  701c                 moveq     #$1c, d0
  00198e  c1c3                 muls.w    d3, d0
  001990  207900007e12         movea.l   $7e12.l, a0   ; fgTileFaces
  001996  d1c0                 adda.l    d0, a0
  001998  2008                 move.l    a0, d0
  00199a  6610                 bne.b     $19ac
  00199c  48790000552a         pea.l     $552a.l   ; g_552a
  0019a2  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  0019a8  a9f4                 _ExitToShell 
  0019aa  584f                 addq.w    #$4, a7
  0019ac  5243                 addq.w    #$1, d3
  0019ae  0c430040             cmpi.w    #$40, d3
  0019b2  6dd8                 blt.b     $198c
  0019b4  261f                 move.l    (a7)+, d3
  0019b6  4e5e                 unlk      a6
  0019b8  4e75                 rts       

;-------------------------------------------------------------
; InitTileHotRects   (seg 1 +0019ca, 930 bytes)
  0019ca  4e560000             link.w    a6, #$0
  0019ce  2f03                 move.l    d3, -(a7)
  0019d0  7600                 moveq     #$0, d3
  0019d2  600001e6             bra.w     $1bba
  0019d6  3003                 move.w    d3, d0
  0019d8  48c0                 ext.l     d0
  0019da  6746                 beq.b     $1a22
  0019dc  5380                 subq.l    #$1, d0
  0019de  6760                 beq.b     $1a40
  0019e0  5380                 subq.l    #$1, d0
  0019e2  677a                 beq.b     $1a5e
  0019e4  5380                 subq.l    #$1, d0
  0019e6  67000096             beq.w     $1a7e
  0019ea  5380                 subq.l    #$1, d0
  0019ec  670000b2             beq.w     $1aa0
  0019f0  5380                 subq.l    #$1, d0
  0019f2  670000ce             beq.w     $1ac2
  0019f6  5380                 subq.l    #$1, d0
  0019f8  670000e6             beq.w     $1ae0
  0019fc  5380                 subq.l    #$1, d0
  0019fe  67000100             beq.w     $1b00
  001a02  04800000002b         subi.l    #$2b, d0
  001a08  67000118             beq.w     $1b22
  001a0c  5380                 subq.l    #$1, d0
  001a0e  6700012e             beq.w     $1b3e
  001a12  5380                 subq.l    #$1, d0
  001a14  67000148             beq.w     $1b5e
  001a18  5380                 subq.l    #$1, d0
  001a1a  67000162             beq.w     $1b7e
  001a1e  6000017e             bra.w     $1b9e
  001a22  7014                 moveq     #$14, d0
  001a24  c1c3                 muls.w    d3, d0
  001a26  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001a2c  d1c0                 adda.l    d0, a0
  001a2e  48680004             pea.l     $4(a0)
  001a32  42a7                 clr.l     -(a7)
  001a34  2f3c00200010         move.l    #$200010, -(a7)
  001a3a  a8a7                 _SetRect  
  001a3c  6000017a             bra.w     $1bb8
  001a40  7014                 moveq     #$14, d0
  001a42  c1c3                 muls.w    d3, d0
  001a44  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001a4a  d1c0                 adda.l    d0, a0
  001a4c  48680004             pea.l     $4(a0)
  001a50  42a7                 clr.l     -(a7)
  001a52  2f3c00100020         move.l    #$100020, -(a7)
  001a58  a8a7                 _SetRect  
  001a5a  6000015c             bra.w     $1bb8
  001a5e  7014                 moveq     #$14, d0
  001a60  c1c3                 muls.w    d3, d0
  001a62  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001a68  d1c0                 adda.l    d0, a0
  001a6a  48680004             pea.l     $4(a0)
  001a6e  48780010             pea.l     $10.w
  001a72  2f3c00200020         move.l    #$200020, -(a7)
  001a78  a8a7                 _SetRect  
  001a7a  6000013c             bra.w     $1bb8
  001a7e  7014                 moveq     #$14, d0
  001a80  c1c3                 muls.w    d3, d0
  001a82  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001a88  d1c0                 adda.l    d0, a0
  001a8a  48680004             pea.l     $4(a0)
  001a8e  2f3c00100000         move.l    #$100000, -(a7)
  001a94  2f3c00200020         move.l    #$200020, -(a7)
  001a9a  a8a7                 _SetRect  
  001a9c  6000011a             bra.w     $1bb8
  001aa0  7014                 moveq     #$14, d0
  001aa2  c1c3                 muls.w    d3, d0
  001aa4  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001aaa  d1c0                 adda.l    d0, a0
  001aac  48680004             pea.l     $4(a0)
  001ab0  2f3c00100000         move.l    #$100000, -(a7)
  001ab6  2f3c00200010         move.l    #$200010, -(a7)
  001abc  a8a7                 _SetRect  
  001abe  600000f8             bra.w     $1bb8
  001ac2  7014                 moveq     #$14, d0
  001ac4  c1c3                 muls.w    d3, d0
  001ac6  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001acc  d1c0                 adda.l    d0, a0
  001ace  48680004             pea.l     $4(a0)
  001ad2  42a7                 clr.l     -(a7)
  001ad4  2f3c00100010         move.l    #$100010, -(a7)
  001ada  a8a7                 _SetRect  
  001adc  600000da             bra.w     $1bb8
  001ae0  7014                 moveq     #$14, d0
  001ae2  c1c3                 muls.w    d3, d0
  001ae4  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001aea  d1c0                 adda.l    d0, a0
  001aec  48680004             pea.l     $4(a0)
  001af0  48780010             pea.l     $10.w
  001af4  2f3c00100020         move.l    #$100020, -(a7)
  001afa  a8a7                 _SetRect  
  001afc  600000ba             bra.w     $1bb8
  001b00  7014                 moveq     #$14, d0
  001b02  c1c3                 muls.w    d3, d0
  001b04  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001b0a  d1c0                 adda.l    d0, a0
  001b0c  48680004             pea.l     $4(a0)
  001b10  2f3c00100010         move.l    #$100010, -(a7)
  001b16  2f3c00200020         move.l    #$200020, -(a7)
  001b1c  a8a7                 _SetRect  
  001b1e  60000098             bra.w     $1bb8
  001b22  7014                 moveq     #$14, d0
  001b24  c1c3                 muls.w    d3, d0
  001b26  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001b2c  d1c0                 adda.l    d0, a0
  001b2e  48680004             pea.l     $4(a0)
  001b32  42a7                 clr.l     -(a7)
  001b34  2f3c00200020         move.l    #$200020, -(a7)
  001b3a  a8a7                 _SetRect  
  001b3c  607a                 bra.b     $1bb8
  001b3e  7014                 moveq     #$14, d0
  001b40  c1c3                 muls.w    d3, d0
  001b42  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001b48  d1c0                 adda.l    d0, a0
  001b4a  48680004             pea.l     $4(a0)
  001b4e  2f3c00040004         move.l    #$40004, -(a7)
  001b54  2f3c001c001c         move.l    #$1c001c, -(a7)
  001b5a  a8a7                 _SetRect  
  001b5c  605a                 bra.b     $1bb8
  001b5e  7014                 moveq     #$14, d0
  001b60  c1c3                 muls.w    d3, d0
  001b62  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001b68  d1c0                 adda.l    d0, a0
  001b6a  48680004             pea.l     $4(a0)
  001b6e  2f3c00080008         move.l    #$80008, -(a7)
  001b74  2f3c00180018         move.l    #$180018, -(a7)
  001b7a  a8a7                 _SetRect  
  001b7c  603a                 bra.b     $1bb8
  001b7e  7014                 moveq     #$14, d0
  001b80  c1c3                 muls.w    d3, d0
  001b82  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001b88  d1c0                 adda.l    d0, a0
  001b8a  48680004             pea.l     $4(a0)
  001b8e  2f3c000c000c         move.l    #$c000c, -(a7)
  001b94  2f3c00140014         move.l    #$140014, -(a7)
  001b9a  a8a7                 _SetRect  
  001b9c  601a                 bra.b     $1bb8
  001b9e  7014                 moveq     #$14, d0
  001ba0  c1c3                 muls.w    d3, d0
  001ba2  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001ba8  d1c0                 adda.l    d0, a0
  001baa  48680004             pea.l     $4(a0)
  001bae  42a7                 clr.l     -(a7)
  001bb0  2f3c00200020         move.l    #$200020, -(a7)
  001bb6  a8a7                 _SetRect  
  001bb8  5243                 addq.w    #$1, d3
  001bba  0c430040             cmpi.w    #$40, d3
  001bbe  6d00fe16             blt.w     $19d6
  001bc2  7600                 moveq     #$0, d3
  001bc4  6052                 bra.b     $1c18
  001bc6  0c430003             cmpi.w    #$3, d3
  001bca  670c                 beq.b     $1bd8
  001bcc  0c430004             cmpi.w    #$4, d3
  001bd0  6706                 beq.b     $1bd8
  001bd2  0c430005             cmpi.w    #$5, d3
  001bd6  6620                 bne.b     $1bf8
  001bd8  700c                 moveq     #$c, d0
  001bda  c1c3                 muls.w    d3, d0
  001bdc  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  001be2  d1c0                 adda.l    d0, a0
  001be4  48680004             pea.l     $4(a0)
  001be8  2f3c00060006         move.l    #$60006, -(a7)
  001bee  2f3c001a001a         move.l    #$1a001a, -(a7)
  001bf4  a8a7                 _SetRect  
  001bf6  601e                 bra.b     $1c16
  001bf8  700c                 moveq     #$c, d0
  001bfa  c1c3                 muls.w    d3, d0
  001bfc  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  001c02  d1c0                 adda.l    d0, a0
  001c04  48680004             pea.l     $4(a0)
  001c08  2f3c00020002         move.l    #$20002, -(a7)
  001c0e  2f3c001e001e         move.l    #$1e001e, -(a7)
  001c14  a8a7                 _SetRect  
  001c16  5243                 addq.w    #$1, d3
  001c18  0c430060             cmpi.w    #$60, d3
  001c1c  6da8                 blt.b     $1bc6
  001c1e  7600                 moveq     #$0, d3
  001c20  6000013c             bra.w     $1d5e
  001c24  3003                 move.w    d3, d0
  001c26  48c0                 ext.l     d0
  001c28  0c8000000007         cmpi.l    #$7, d0
  001c2e  62000112             bhi.w     $1d42
  001c32  303b0206             move.w    $1c3a(pc, d0.w * 2), d0
  001c36  4efb0002             jmp       $1c3a(pc, d0.w)
  001c3a  0010002e004c006c008e00ae00ca00e8 cases     0:$1c4a 1:$1c68 2:$1c86 3:$1ca6 4:$1cc8 5:$1ce8 6:$1d04 7:$1d22
  001c4a  7014                 moveq     #$14, d0
  001c4c  c1c3                 muls.w    d3, d0
  001c4e  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001c54  d1c0                 adda.l    d0, a0
  001c56  4868000c             pea.l     $c(a0)
  001c5a  42a7                 clr.l     -(a7)
  001c5c  2f3c00200010         move.l    #$200010, -(a7)
  001c62  a8a7                 _SetRect  
  001c64  600000f6             bra.w     $1d5c
  001c68  7014                 moveq     #$14, d0
  001c6a  c1c3                 muls.w    d3, d0
  001c6c  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001c72  d1c0                 adda.l    d0, a0
  001c74  4868000c             pea.l     $c(a0)
  001c78  42a7                 clr.l     -(a7)
  001c7a  2f3c00100020         move.l    #$100020, -(a7)
  001c80  a8a7                 _SetRect  
  001c82  600000d8             bra.w     $1d5c
  001c86  7014                 moveq     #$14, d0
  001c88  c1c3                 muls.w    d3, d0
  001c8a  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001c90  d1c0                 adda.l    d0, a0
  001c92  4868000c             pea.l     $c(a0)
  001c96  48780010             pea.l     $10.w
  001c9a  2f3c00200020         move.l    #$200020, -(a7)
  001ca0  a8a7                 _SetRect  
  001ca2  600000b8             bra.w     $1d5c
  001ca6  7014                 moveq     #$14, d0
  001ca8  c1c3                 muls.w    d3, d0
  001caa  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001cb0  d1c0                 adda.l    d0, a0
  001cb2  4868000c             pea.l     $c(a0)
  001cb6  2f3c00100000         move.l    #$100000, -(a7)
  001cbc  2f3c00200020         move.l    #$200020, -(a7)
  001cc2  a8a7                 _SetRect  
  001cc4  60000096             bra.w     $1d5c
  001cc8  7014                 moveq     #$14, d0
  001cca  c1c3                 muls.w    d3, d0
  001ccc  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001cd2  d1c0                 adda.l    d0, a0
  001cd4  4868000c             pea.l     $c(a0)
  001cd8  2f3c00100000         move.l    #$100000, -(a7)
  001cde  2f3c00200010         move.l    #$200010, -(a7)
  001ce4  a8a7                 _SetRect  
  001ce6  6074                 bra.b     $1d5c
  001ce8  7014                 moveq     #$14, d0
  001cea  c1c3                 muls.w    d3, d0
  001cec  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001cf2  d1c0                 adda.l    d0, a0
  001cf4  4868000c             pea.l     $c(a0)
  001cf8  42a7                 clr.l     -(a7)
  001cfa  2f3c00100010         move.l    #$100010, -(a7)
  001d00  a8a7                 _SetRect  
  001d02  6058                 bra.b     $1d5c
  001d04  7014                 moveq     #$14, d0
  001d06  c1c3                 muls.w    d3, d0
  001d08  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001d0e  d1c0                 adda.l    d0, a0
  001d10  4868000c             pea.l     $c(a0)
  001d14  48780010             pea.l     $10.w
  001d18  2f3c00100020         move.l    #$100020, -(a7)
  001d1e  a8a7                 _SetRect  
  001d20  603a                 bra.b     $1d5c
  001d22  7014                 moveq     #$14, d0
  001d24  c1c3                 muls.w    d3, d0
  001d26  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001d2c  d1c0                 adda.l    d0, a0
  001d2e  4868000c             pea.l     $c(a0)
  001d32  2f3c00100010         move.l    #$100010, -(a7)
  001d38  2f3c00200020         move.l    #$200020, -(a7)
  001d3e  a8a7                 _SetRect  
  001d40  601a                 bra.b     $1d5c
  001d42  7014                 moveq     #$14, d0
  001d44  c1c3                 muls.w    d3, d0
  001d46  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  001d4c  d1c0                 adda.l    d0, a0
  001d4e  4868000c             pea.l     $c(a0)
  001d52  42a7                 clr.l     -(a7)
  001d54  2f3c00200020         move.l    #$200020, -(a7)
  001d5a  a8a7                 _SetRect  
  001d5c  5243                 addq.w    #$1, d3
  001d5e  0c430040             cmpi.w    #$40, d3
  001d62  6d00fec0             blt.w     $1c24
  001d66  261f                 move.l    (a7)+, d3
  001d68  4e5e                 unlk      a6
  001d6a  4e75                 rts       

;-------------------------------------------------------------
; TrackClickOnCommandButton   (seg 1 +001d80, 478 bytes)
  001d80  4e56fff0             link.w    a6, #$fff0
  001d84  48e71e00             movem.l   d3-d6, -(a7)
  001d88  3c2e0008             move.w    $8(a6), d6
  001d8c  7600                 moveq     #$0, d3
  001d8e  7800                 moveq     #$0, d4
  001d90  3006                 move.w    d6, d0
  001d92  48c0                 ext.l     d0
  001d94  0c8000000006         cmpi.l    #$6, d0
  001d9a  62000090             bhi.w     $1e2c
  001d9e  303b0206             move.w    $1da6(pc, d0.w * 2), d0
  001da2  4efb0002             jmp       $1da6(pc, d0.w)
  001da6  0086000e00220036004a005e0072 cases     0:$1e2c 1:$1db4 2:$1dc8 3:$1ddc 4:$1df0 5:$1e04 6:$1e18
  001db4  486efff8             pea.l     -$8(a6)
  001db8  2f3c002c01ec         move.l    #$2c01ec, -(a7)
  001dbe  2f3c0046025b         move.l    #$46025b, -(a7)
  001dc4  a8a7                 _SetRect  
  001dc6  6072                 bra.b     $1e3a
  001dc8  486efff8             pea.l     -$8(a6)
  001dcc  2f3c004b01ec         move.l    #$4b01ec, -(a7)
  001dd2  2f3c0065025b         move.l    #$65025b, -(a7)
  001dd8  a8a7                 _SetRect  
  001dda  605e                 bra.b     $1e3a
  001ddc  486efff8             pea.l     -$8(a6)
  001de0  2f3c006a01ec         move.l    #$6a01ec, -(a7)
  001de6  2f3c0084025b         move.l    #$84025b, -(a7)
  001dec  a8a7                 _SetRect  
  001dee  604a                 bra.b     $1e3a
  001df0  486efff8             pea.l     -$8(a6)
  001df4  2f3c008901ec         move.l    #$8901ec, -(a7)
  001dfa  2f3c00a3025b         move.l    #$a3025b, -(a7)
  001e00  a8a7                 _SetRect  
  001e02  6036                 bra.b     $1e3a
  001e04  486efff8             pea.l     -$8(a6)
  001e08  2f3c00a801ec         move.l    #$a801ec, -(a7)
  001e0e  2f3c00c3025b         move.l    #$c3025b, -(a7)
  001e14  a8a7                 _SetRect  
  001e16  6022                 bra.b     $1e3a
  001e18  486efff8             pea.l     -$8(a6)
  001e1c  2f3c00c801ec         move.l    #$c801ec, -(a7)
  001e22  2f3c00e2025b         move.l    #$e2025b, -(a7)
  001e28  a8a7                 _SetRect  
  001e2a  600e                 bra.b     $1e3a
  001e2c  4879000054f6         pea.l     $54f6.l   ; g_54f6
  001e32  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  001e38  584f                 addq.w    #$4, a7
  001e3a  3a06                 move.w    d6, d5
  001e3c  48c5                 ext.l     d5
  001e3e  068500001324         addi.l    #$1324, d5
  001e44  4a2e000a             tst.b     $a(a6)
  001e48  660000a2             bne.w     $1eec
  001e4c  554f                 subq.w    #$2, a7
  001e4e  a974                 _Button   
  001e50  101f                 move.b    (a7)+, d0
  001e52  670000a4             beq.w     $1ef8
  001e56  60000094             bra.w     $1eec
  001e5a  486efff4             pea.l     -$c(a6)
  001e5e  a972                 _GetMouse 
  001e60  554f                 subq.w    #$2, a7
  001e62  2f2efff4             move.l    -$c(a6), -(a7)
  001e66  486efff8             pea.l     -$8(a6)
  001e6a  a8ad                 _PtInRect 
  001e6c  101f                 move.b    (a7)+, d0
  001e6e  672a                 beq.b     $1e9a
  001e70  4a43                 tst.w     d3
  001e72  6678                 bne.b     $1eec
  001e74  7601                 moveq     #$1, d3
  001e76  3f05                 move.w    d5, -(a7)
  001e78  486efff8             pea.l     -$8(a6)
  001e7c  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  001e82  2f3c000a0055         move.l    #$a0055, -(a7)
  001e88  2f3900008472         move.l    $8472.l, -(a7)   ; snd4803_Mouse_Down
  001e8e  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  001e94  5244                 addq.w    #$1, d4
  001e96  504f                 addq.w    #$8, a7
  001e98  6052                 bra.b     $1eec
  001e9a  4a43                 tst.w     d3
  001e9c  674e                 beq.b     $1eec
  001e9e  7600                 moveq     #$0, d3
  001ea0  3005                 move.w    d5, d0
  001ea2  48c0                 ext.l     d0
  001ea4  720a                 moveq     #$a, d1
  001ea6  d081                 add.l     d1, d0
  001ea8  3f00                 move.w    d0, -(a7)
  001eaa  486efff8             pea.l     -$8(a6)
  001eae  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  001eb4  2f3c000a0055         move.l    #$a0055, -(a7)
  001eba  2f3900008476         move.l    $8476.l, -(a7)   ; snd4804_Mouse_Up
  001ec0  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  001ec6  0c44000a             cmpi.w    #$a, d4
  001eca  504f                 addq.w    #$8, a7
  001ecc  6d1e                 blt.b     $1eec
  001ece  554f                 subq.w    #$2, a7
  001ed0  42a7                 clr.l     -(a7)
  001ed2  594f                 subq.w    #$4, a7
  001ed4  2f3c736e6420         move.l    #$736e6420, -(a7)
  001eda  3f3c00c7             move.w    #$c7, -(a7)
  001ede  a9a0                 _GetResource 
  001ee0  205f                 movea.l   (a7)+, a0
  001ee2  2f08                 move.l    a0, -(a7)
  001ee4  4227                 clr.b     -(a7)
  001ee6  a805                 _SndPlay  
  001ee8  301f                 move.w    (a7)+, d0
  001eea  7800                 moveq     #$0, d4
  001eec  554f                 subq.w    #$2, a7
  001eee  a974                 _Button   
  001ef0  101f                 move.b    (a7)+, d0
  001ef2  6600ff66             bne.w     $1e5a
  001ef6  6030                 bra.b     $1f28
  001ef8  7601                 moveq     #$1, d3
  001efa  3f05                 move.w    d5, -(a7)
  001efc  486efff8             pea.l     -$8(a6)
  001f00  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  001f06  2f3c000a0055         move.l    #$a0055, -(a7)
  001f0c  2f3900008472         move.l    $8472.l, -(a7)   ; snd4803_Mouse_Down
  001f12  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  001f18  207c0000000a         movea.l   #$a, a0
  001f1e  43eefff0             lea.l     -$10(a6), a1
  001f22  a03b                 _Delay    
  001f24  2280                 move.l    d0, (a1)
  001f26  504f                 addq.w    #$8, a7
  001f28  4a43                 tst.w     d3
  001f2a  6728                 beq.b     $1f54
  001f2c  3005                 move.w    d5, d0
  001f2e  48c0                 ext.l     d0
  001f30  720a                 moveq     #$a, d1
  001f32  d081                 add.l     d1, d0
  001f34  3f00                 move.w    d0, -(a7)
  001f36  486efff8             pea.l     -$8(a6)
  001f3a  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  001f40  2f3c000a0055         move.l    #$a0055, -(a7)
  001f46  2f3900008476         move.l    $8476.l, -(a7)   ; snd4804_Mouse_Up
  001f4c  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  001f52  504f                 addq.w    #$8, a7
  001f54  1003                 move.b    d3, d0
  001f56  4cdf0078             movem.l   (a7)+, d3-d6
  001f5a  4e5e                 unlk      a6
  001f5c  4e75                 rts       

;-------------------------------------------------------------
; UpdateText   (seg 1 +001f7a, 382 bytes)
  001f7a  4e56fee2             link.w    a6, #$fee2
  001f7e  2f03                 move.l    d3, -(a7)
  001f80  2d79000054f0fffa     move.l    $54f0.l, -$6(a6)   ; g_54f0
  001f88  3d79000054f4fffe     move.w    $54f4.l, -$2(a6)   ; g_54f4
  001f90  7600                 moveq     #$0, d3
  001f92  487900007474         pea.l     $7474.l   ; gameOffscreen
  001f98  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  001f9e  486efff2             pea.l     -$e(a6)
  001fa2  2f3c006a01e2         move.l    #$6a01e2, -(a7)
  001fa8  2f3c00790266         move.l    #$790266, -(a7)
  001fae  a8a7                 _SetRect  
  001fb0  486effea             pea.l     -$16(a6)
  001fb4  2f3c008201e2         move.l    #$8201e2, -(a7)
  001fba  2f3c008e024b         move.l    #$8e024b, -(a7)
  001fc0  a8a7                 _SetRect  
  001fc2  486efee2             pea.l     -$11e(a6)
  001fc6  2f3c00830255         move.l    #$830255, -(a7)
  001fcc  2f3c00900266         move.l    #$900266, -(a7)
  001fd2  a8a7                 _SetRect  
  001fd4  3f3c0015             move.w    #$15, -(a7)
  001fd8  a887                 _TextFont 
  001fda  3f3c0009             move.w    #$9, -(a7)
  001fde  a88a                 _TextSize 
  001fe0  48780021             pea.l     $21.w
  001fe4  a862                 _ForeColor 
  001fe6  4878001e             pea.l     $1e.w
  001fea  a863                 _BackColor 
  001fec  4a2e0008             tst.b     $8(a6)
  001ff0  6638                 bne.b     $202a
  001ff2  486efff2             pea.l     -$e(a6)
  001ff6  a8a2                 _PaintRect 
  001ff8  486efffa             pea.l     -$6(a6)
  001ffc  aa14                 _RGBForeColor 
  001ffe  4267                 clr.w     -(a7)
  002000  a888                 _TextFace 
  002002  2f3c007601e3         move.l    #$7601e3, -(a7)
  002008  a893                 _MoveTo   
  00200a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  002010  2250                 movea.l   (a0), a1
  002012  203c000114c0         move.l    #$114c0, d0
  002018  48710800             pea.l     (a1, d0.l)
  00201c  a884                 _DrawString 
  00201e  486efff2             pea.l     -$e(a6)
  002022  61ff000000e2         bsr.l     $2106   ; CopyStatRect
  002028  584f                 addq.w    #$4, a7
  00202a  20390000807a         move.l    $807a.l, d0   ; g_807a
  002030  b0b90000807e         cmp.l     $807e.l, d0   ; g_807e
  002036  6608                 bne.b     $2040
  002038  4a2e0008             tst.b     $8(a6)
  00203c  660000a8             bne.w     $20e6
  002040  20390000807a         move.l    $807a.l, d0   ; g_807a
  002046  b0b90000807e         cmp.l     $807e.l, d0   ; g_807e
  00204c  6730                 beq.b     $207e
  00204e  20390000807e         move.l    $807e.l, d0   ; g_807e
  002054  b0b90000807a         cmp.l     $807a.l, d0   ; g_807a
  00205a  6f0c                 ble.b     $2068
  00205c  23f90000807a0000807e move.l    $807a.l, $807e.l   ; g_807a, g_807e
  002066  601c                 bra.b     $2084
  002068  7032                 moveq     #$32, d0
  00206a  d1b90000807e         add.l     d0, $807e.l   ; g_807e
  002070  26390000807a         move.l    $807a.l, d3   ; g_807a
  002076  96b90000807e         sub.l     $807e.l, d3   ; g_807e
  00207c  6006                 bra.b     $2084
  00207e  48780021             pea.l     $21.w
  002082  a862                 _ForeColor 
  002084  486effea             pea.l     -$16(a6)
  002088  a8a2                 _PaintRect 
  00208a  0c8300000320         cmpi.l    #$320, d3
  002090  6f06                 ble.b     $2098
  002092  263c00000320         move.l    #$320, d3
  002098  7028                 moveq     #$28, d0
  00209a  4c030800             muls.l    d3, d0
  00209e  068000007d00         addi.l    #$7d00, d0
  0020a4  3d40fffe             move.w    d0, -$2(a6)
  0020a8  3d40fffc             move.w    d0, -$4(a6)
  0020ac  3d40fffa             move.w    d0, -$6(a6)
  0020b0  486efffa             pea.l     -$6(a6)
  0020b4  aa14                 _RGBForeColor 
  0020b6  3f3c0001             move.w    #$1, -(a7)
  0020ba  a888                 _TextFace 
  0020bc  2f3c008d01e3         move.l    #$8d01e3, -(a7)
  0020c2  a893                 _MoveTo   
  0020c4  2f390000807e         move.l    $807e.l, -(a7)   ; g_807e
  0020ca  486efeea             pea.l     -$116(a6)
  0020ce  4eb9000003e8         jsr       $3e8.l   ; seg4+9f2
  0020d4  486efeea             pea.l     -$116(a6)
  0020d8  a884                 _DrawString 
  0020da  486effea             pea.l     -$16(a6)
  0020de  61ff00000026         bsr.l     $2106   ; CopyStatRect
  0020e4  584f                 addq.w    #$4, a7
  0020e6  48780021             pea.l     $21.w
  0020ea  a862                 _ForeColor 
  0020ec  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0020f2  261f                 move.l    (a7)+, d3
  0020f4  4e5e                 unlk      a6
  0020f6  4e75                 rts       

;-------------------------------------------------------------
; CopyStatRect   (seg 1 +002106, 34 bytes)
  002106  4e560000             link.w    a6, #$0
  00210a  487900007474         pea.l     $7474.l   ; gameOffscreen
  002110  2f2e0008             move.l    $8(a6), -(a7)
  002114  2f2e0008             move.l    $8(a6), -(a7)
  002118  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  00211e  4eb900000128         jsr       $128.l   ; SATCOPYBITSTOSCREEN
  002124  4e5e                 unlk      a6
  002126  4e75                 rts       

;-------------------------------------------------------------
; UpdateMeters   (seg 1 +002138, 1626 bytes)
  002138  4e56ffdc             link.w    a6, #$ffdc
  00213c  48e71800             movem.l   d3-d4, -(a7)
  002140  182e0008             move.b    $8(a6), d4
  002144  7600                 moveq     #$0, d3
  002146  4a04                 tst.b     d4
  002148  672c                 beq.b     $2176
  00214a  3039000046c4         move.w    $46c4.l, d0   ; g_46c4
  002150  b079000046be         cmp.w     $46be.l, d0   ; g_46be
  002156  661e                 bne.b     $2176
  002158  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  00215e  b079000046bc         cmp.w     $46bc.l, d0   ; g_46bc
  002164  6610                 bne.b     $2176
  002166  3039000046c0         move.w    $46c0.l, d0   ; g_46c0
  00216c  b079000046ba         cmp.w     $46ba.l, d0   ; g_46ba
  002172  67000616             beq.w     $278a
  002176  0c790090000046c4     cmpi.w    #$90, $46c4.l   ; g_46c4
  00217e  6f0a                 ble.b     $218a
  002180  33fc0090000046c4     move.w    #$90, $46c4.l   ; g_46c4
  002188  600e                 bra.b     $2198
  00218a  4a79000046c4         tst.w     $46c4.l   ; g_46c4
  002190  6c06                 bge.b     $2198
  002192  4279000046c4         clr.w     $46c4.l   ; g_46c4
  002198  0c790090000046c2     cmpi.w    #$90, $46c2.l   ; g_46c2
  0021a0  6f0a                 ble.b     $21ac
  0021a2  33fc0090000046c2     move.w    #$90, $46c2.l   ; g_46c2
  0021aa  600e                 bra.b     $21ba
  0021ac  4a79000046c2         tst.w     $46c2.l   ; g_46c2
  0021b2  6c06                 bge.b     $21ba
  0021b4  4279000046c2         clr.w     $46c2.l   ; g_46c2
  0021ba  0c790090000046c0     cmpi.w    #$90, $46c0.l   ; g_46c0
  0021c2  6f0a                 ble.b     $21ce
  0021c4  33fc0090000046c0     move.w    #$90, $46c0.l   ; g_46c0
  0021cc  600e                 bra.b     $21dc
  0021ce  4a79000046c0         tst.w     $46c0.l   ; g_46c0
  0021d4  6c06                 bge.b     $21dc
  0021d6  4279000046c0         clr.w     $46c0.l   ; g_46c0
  0021dc  3039000046c4         move.w    $46c4.l, d0   ; g_46c4
  0021e2  b079000046be         cmp.w     $46be.l, d0   ; g_46be
  0021e8  6606                 bne.b     $21f0
  0021ea  4a04                 tst.b     d4
  0021ec  660001b4             bne.w     $23a2
  0021f0  0c790008000046be     cmpi.w    #$8, $46be.l   ; g_46be
  0021f8  6f02                 ble.b     $21fc
  0021fa  76fd                 moveq     #$fd, d3
  0021fc  4a04                 tst.b     d4
  0021fe  6622                 bne.b     $2222
  002200  486efff8             pea.l     -$8(a6)
  002204  42a7                 clr.l     -(a7)
  002206  2f3c000b0093         move.l    #$b0093, -(a7)
  00220c  a8a7                 _SetRect  
  00220e  486efff0             pea.l     -$10(a6)
  002212  2f3c018201d9         move.l    #$18201d9, -(a7)
  002218  2f3c018d026c         move.l    #$18d026c, -(a7)
  00221e  a8a7                 _SetRect  
  002220  6038                 bra.b     $225a
  002222  486efff8             pea.l     -$8(a6)
  002226  42a7                 clr.l     -(a7)
  002228  3039000046be         move.w    $46be.l, d0   ; g_46be
  00222e  48c0                 ext.l     d0
  002230  5680                 addq.l    #$3, d0
  002232  3f00                 move.w    d0, -(a7)
  002234  3f3c000b             move.w    #$b, -(a7)
  002238  a8a7                 _SetRect  
  00223a  486efff0             pea.l     -$10(a6)
  00223e  2f3c018201d9         move.l    #$18201d9, -(a7)
  002244  3039000046be         move.w    $46be.l, d0   ; g_46be
  00224a  48c0                 ext.l     d0
  00224c  0680000001dc         addi.l    #$1dc, d0
  002252  3f00                 move.w    d0, -(a7)
  002254  3f3c018d             move.w    #$18d, -(a7)
  002258  a8a7                 _SetRect  
  00225a  3039000046c4         move.w    $46c4.l, d0   ; g_46c4
  002260  b079000046be         cmp.w     $46be.l, d0   ; g_46be
  002266  6d04                 blt.b     $226c
  002268  4a04                 tst.b     d4
  00226a  6622                 bne.b     $228e
  00226c  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  002272  48680002             pea.l     $2(a0)
  002276  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  00227c  48680002             pea.l     $2(a0)
  002280  486efff8             pea.l     -$8(a6)
  002284  486efff0             pea.l     -$10(a6)
  002288  4267                 clr.w     -(a7)
  00228a  42a7                 clr.l     -(a7)
  00228c  a8ec                 _CopyBits 
  00228e  486efff8             pea.l     -$8(a6)
  002292  2f3c000b0000         move.l    #$b0000, -(a7)
  002298  3003                 move.w    d3, d0
  00229a  48c0                 ext.l     d0
  00229c  3239000046be         move.w    $46be.l, d1   ; g_46be
  0022a2  48c1                 ext.l     d1
  0022a4  d280                 add.l     d0, d1
  0022a6  3f01                 move.w    d1, -(a7)
  0022a8  3f3c0016             move.w    #$16, -(a7)
  0022ac  a8a7                 _SetRect  
  0022ae  486effdc             pea.l     -$24(a6)
  0022b2  2f3c018201d9         move.l    #$18201d9, -(a7)
  0022b8  3003                 move.w    d3, d0
  0022ba  48c0                 ext.l     d0
  0022bc  3239000046be         move.w    $46be.l, d1   ; g_46be
  0022c2  48c1                 ext.l     d1
  0022c4  0681000001d9         addi.l    #$1d9, d1
  0022ca  d280                 add.l     d0, d1
  0022cc  3f01                 move.w    d1, -(a7)
  0022ce  3f3c018d             move.w    #$18d, -(a7)
  0022d2  a8a7                 _SetRect  
  0022d4  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  0022da  48680002             pea.l     $2(a0)
  0022de  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  0022e4  48680002             pea.l     $2(a0)
  0022e8  486efff8             pea.l     -$8(a6)
  0022ec  486effdc             pea.l     -$24(a6)
  0022f0  4267                 clr.w     -(a7)
  0022f2  42a7                 clr.l     -(a7)
  0022f4  a8ec                 _CopyBits 
  0022f6  4a43                 tst.w     d3
  0022f8  673a                 beq.b     $2334
  0022fa  3003                 move.w    d3, d0
  0022fc  48c0                 ext.l     d0
  0022fe  3239000046be         move.w    $46be.l, d1   ; g_46be
  002304  48c1                 ext.l     d1
  002306  0681000001d9         addi.l    #$1d9, d1
  00230c  d280                 add.l     d0, d1
  00230e  3d41ffe6             move.w    d1, -$1a(a6)
  002312  3d7c0183ffe4         move.w    #$183, -$1c(a6)
  002318  2f390000f70c         move.l    $f70c.l, -(a7)   ; g_f70c
  00231e  487900007474         pea.l     $7474.l   ; gameOffscreen
  002324  2f2effe4             move.l    -$1c(a6), -(a7)
  002328  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  00232e  4eb900000118         jsr       $118.l   ; SATPLOTFACE
  002334  4a04                 tst.b     d4
  002336  6722                 beq.b     $235a
  002338  486effe8             pea.l     -$18(a6)
  00233c  2f3c018201d9         move.l    #$18201d9, -(a7)
  002342  3039000046be         move.w    $46be.l, d0   ; g_46be
  002348  48c0                 ext.l     d0
  00234a  0680000001dc         addi.l    #$1dc, d0
  002350  3f00                 move.w    d0, -(a7)
  002352  3f3c018d             move.w    #$18d, -(a7)
  002356  a8a7                 _SetRect  
  002358  6012                 bra.b     $236c
  00235a  486effe8             pea.l     -$18(a6)
  00235e  2f3c018201d9         move.l    #$18201d9, -(a7)
  002364  2f3c018d026c         move.l    #$18d026c, -(a7)
  00236a  a8a7                 _SetRect  
  00236c  486effe8             pea.l     -$18(a6)
  002370  61fffffffd94         bsr.l     $2106   ; CopyStatRect
  002376  3039000046c4         move.w    $46c4.l, d0   ; g_46c4
  00237c  b079000046be         cmp.w     $46be.l, d0   ; g_46be
  002382  584f                 addq.w    #$4, a7
  002384  6c08                 bge.b     $238e
  002386  5379000046be         subq.w    #$1, $46be.l   ; g_46be
  00238c  6014                 bra.b     $23a2
  00238e  3039000046c4         move.w    $46c4.l, d0   ; g_46c4
  002394  b079000046be         cmp.w     $46be.l, d0   ; g_46be
  00239a  6f06                 ble.b     $23a2
  00239c  5279000046be         addq.w    #$1, $46be.l   ; g_46be
  0023a2  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  0023a8  b079000046bc         cmp.w     $46bc.l, d0   ; g_46bc
  0023ae  6606                 bne.b     $23b6
  0023b0  4a04                 tst.b     d4
  0023b2  66000210             bne.w     $25c4
  0023b6  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  0023bc  48c0                 ext.l     d0
  0023be  4480                 neg.l     d0
  0023c0  068000000090         addi.l    #$90, d0
  0023c6  33c0000046c2         move.w    d0, $46c2.l   ; g_46c2
  0023cc  3039000046bc         move.w    $46bc.l, d0   ; g_46bc
  0023d2  48c0                 ext.l     d0
  0023d4  4480                 neg.l     d0
  0023d6  068000000090         addi.l    #$90, d0
  0023dc  33c0000046bc         move.w    d0, $46bc.l   ; g_46bc
  0023e2  0c790008000046bc     cmpi.w    #$8, $46bc.l   ; g_46bc
  0023ea  6f02                 ble.b     $23ee
  0023ec  76fd                 moveq     #$fd, d3
  0023ee  4a04                 tst.b     d4
  0023f0  6622                 bne.b     $2414
  0023f2  486efff8             pea.l     -$8(a6)
  0023f6  42a7                 clr.l     -(a7)
  0023f8  2f3c000b0093         move.l    #$b0093, -(a7)
  0023fe  a8a7                 _SetRect  
  002400  486efff0             pea.l     -$10(a6)
  002404  2f3c01a001d9         move.l    #$1a001d9, -(a7)
  00240a  2f3c01ab026c         move.l    #$1ab026c, -(a7)
  002410  a8a7                 _SetRect  
  002412  6038                 bra.b     $244c
  002414  486efff8             pea.l     -$8(a6)
  002418  42a7                 clr.l     -(a7)
  00241a  3039000046bc         move.w    $46bc.l, d0   ; g_46bc
  002420  48c0                 ext.l     d0
  002422  5680                 addq.l    #$3, d0
  002424  3f00                 move.w    d0, -(a7)
  002426  3f3c000b             move.w    #$b, -(a7)
  00242a  a8a7                 _SetRect  
  00242c  486efff0             pea.l     -$10(a6)
  002430  2f3c01a001d9         move.l    #$1a001d9, -(a7)
  002436  3039000046bc         move.w    $46bc.l, d0   ; g_46bc
  00243c  48c0                 ext.l     d0
  00243e  0680000001dc         addi.l    #$1dc, d0
  002444  3f00                 move.w    d0, -(a7)
  002446  3f3c01ab             move.w    #$1ab, -(a7)
  00244a  a8a7                 _SetRect  
  00244c  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  002452  b079000046bc         cmp.w     $46bc.l, d0   ; g_46bc
  002458  6d04                 blt.b     $245e
  00245a  4a04                 tst.b     d4
  00245c  6622                 bne.b     $2480
  00245e  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  002464  48680002             pea.l     $2(a0)
  002468  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  00246e  48680002             pea.l     $2(a0)
  002472  486efff8             pea.l     -$8(a6)
  002476  486efff0             pea.l     -$10(a6)
  00247a  4267                 clr.w     -(a7)
  00247c  42a7                 clr.l     -(a7)
  00247e  a8ec                 _CopyBits 
  002480  486efff8             pea.l     -$8(a6)
  002484  2f3c00160000         move.l    #$160000, -(a7)
  00248a  3003                 move.w    d3, d0
  00248c  48c0                 ext.l     d0
  00248e  3239000046bc         move.w    $46bc.l, d1   ; g_46bc
  002494  48c1                 ext.l     d1
  002496  d280                 add.l     d0, d1
  002498  3f01                 move.w    d1, -(a7)
  00249a  3f3c0021             move.w    #$21, -(a7)
  00249e  a8a7                 _SetRect  
  0024a0  486effdc             pea.l     -$24(a6)
  0024a4  2f3c01a001d9         move.l    #$1a001d9, -(a7)
  0024aa  3003                 move.w    d3, d0
  0024ac  48c0                 ext.l     d0
  0024ae  3239000046bc         move.w    $46bc.l, d1   ; g_46bc
  0024b4  48c1                 ext.l     d1
  0024b6  0681000001d9         addi.l    #$1d9, d1
  0024bc  d280                 add.l     d0, d1
  0024be  3f01                 move.w    d1, -(a7)
  0024c0  3f3c01ab             move.w    #$1ab, -(a7)
  0024c4  a8a7                 _SetRect  
  0024c6  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  0024cc  48680002             pea.l     $2(a0)
  0024d0  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  0024d6  48680002             pea.l     $2(a0)
  0024da  486efff8             pea.l     -$8(a6)
  0024de  486effdc             pea.l     -$24(a6)
  0024e2  4267                 clr.w     -(a7)
  0024e4  42a7                 clr.l     -(a7)
  0024e6  a8ec                 _CopyBits 
  0024e8  4a43                 tst.w     d3
  0024ea  673a                 beq.b     $2526
  0024ec  3003                 move.w    d3, d0
  0024ee  48c0                 ext.l     d0
  0024f0  3239000046bc         move.w    $46bc.l, d1   ; g_46bc
  0024f6  48c1                 ext.l     d1
  0024f8  0681000001d9         addi.l    #$1d9, d1
  0024fe  d280                 add.l     d0, d1
  002500  3d41ffe6             move.w    d1, -$1a(a6)
  002504  3d7c01a1ffe4         move.w    #$1a1, -$1c(a6)
  00250a  2f390000f710         move.l    $f710.l, -(a7)   ; g_f710
  002510  487900007474         pea.l     $7474.l   ; gameOffscreen
  002516  2f2effe4             move.l    -$1c(a6), -(a7)
  00251a  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  002520  4eb900000118         jsr       $118.l   ; SATPLOTFACE
  002526  4a04                 tst.b     d4
  002528  6722                 beq.b     $254c
  00252a  486effe8             pea.l     -$18(a6)
  00252e  2f3c01a001d9         move.l    #$1a001d9, -(a7)
  002534  3039000046bc         move.w    $46bc.l, d0   ; g_46bc
  00253a  48c0                 ext.l     d0
  00253c  0680000001dc         addi.l    #$1dc, d0
  002542  3f00                 move.w    d0, -(a7)
  002544  3f3c01ab             move.w    #$1ab, -(a7)
  002548  a8a7                 _SetRect  
  00254a  6012                 bra.b     $255e
  00254c  486effe8             pea.l     -$18(a6)
  002550  2f3c01a001d9         move.l    #$1a001d9, -(a7)
  002556  2f3c01ab026c         move.l    #$1ab026c, -(a7)
  00255c  a8a7                 _SetRect  
  00255e  486effe8             pea.l     -$18(a6)
  002562  61fffffffba2         bsr.l     $2106   ; CopyStatRect
  002568  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  00256e  b079000046bc         cmp.w     $46bc.l, d0   ; g_46bc
  002574  584f                 addq.w    #$4, a7
  002576  6c08                 bge.b     $2580
  002578  5379000046bc         subq.w    #$1, $46bc.l   ; g_46bc
  00257e  6014                 bra.b     $2594
  002580  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  002586  b079000046bc         cmp.w     $46bc.l, d0   ; g_46bc
  00258c  6f06                 ble.b     $2594
  00258e  5279000046bc         addq.w    #$1, $46bc.l   ; g_46bc
  002594  04790090000046c2     subi.w    #$90, $46c2.l   ; g_46c2
  00259c  04790090000046bc     subi.w    #$90, $46bc.l   ; g_46bc
  0025a4  3039000046c2         move.w    $46c2.l, d0   ; g_46c2
  0025aa  48c0                 ext.l     d0
  0025ac  4480                 neg.l     d0
  0025ae  33c0000046c2         move.w    d0, $46c2.l   ; g_46c2
  0025b4  3039000046bc         move.w    $46bc.l, d0   ; g_46bc
  0025ba  48c0                 ext.l     d0
  0025bc  4480                 neg.l     d0
  0025be  33c0000046bc         move.w    d0, $46bc.l   ; g_46bc
  0025c4  3039000046c0         move.w    $46c0.l, d0   ; g_46c0
  0025ca  b079000046ba         cmp.w     $46ba.l, d0   ; g_46ba
  0025d0  6606                 bne.b     $25d8
  0025d2  4a04                 tst.b     d4
  0025d4  660001b4             bne.w     $278a
  0025d8  0c790008000046ba     cmpi.w    #$8, $46ba.l   ; g_46ba
  0025e0  6f02                 ble.b     $25e4
  0025e2  76fd                 moveq     #$fd, d3
  0025e4  4a04                 tst.b     d4
  0025e6  6622                 bne.b     $260a
  0025e8  486efff8             pea.l     -$8(a6)
  0025ec  42a7                 clr.l     -(a7)
  0025ee  2f3c000b0093         move.l    #$b0093, -(a7)
  0025f4  a8a7                 _SetRect  
  0025f6  486efff0             pea.l     -$10(a6)
  0025fa  2f3c01be01d9         move.l    #$1be01d9, -(a7)
  002600  2f3c01c9026c         move.l    #$1c9026c, -(a7)
  002606  a8a7                 _SetRect  
  002608  6038                 bra.b     $2642
  00260a  486efff8             pea.l     -$8(a6)
  00260e  42a7                 clr.l     -(a7)
  002610  3039000046ba         move.w    $46ba.l, d0   ; g_46ba
  002616  48c0                 ext.l     d0
  002618  5680                 addq.l    #$3, d0
  00261a  3f00                 move.w    d0, -(a7)
  00261c  3f3c000b             move.w    #$b, -(a7)
  002620  a8a7                 _SetRect  
  002622  486efff0             pea.l     -$10(a6)
  002626  2f3c01be01d9         move.l    #$1be01d9, -(a7)
  00262c  3039000046ba         move.w    $46ba.l, d0   ; g_46ba
  002632  48c0                 ext.l     d0
  002634  0680000001dc         addi.l    #$1dc, d0
  00263a  3f00                 move.w    d0, -(a7)
  00263c  3f3c01c9             move.w    #$1c9, -(a7)
  002640  a8a7                 _SetRect  
  002642  3039000046c0         move.w    $46c0.l, d0   ; g_46c0
  002648  b079000046ba         cmp.w     $46ba.l, d0   ; g_46ba
  00264e  6d04                 blt.b     $2654
  002650  4a04                 tst.b     d4
  002652  6622                 bne.b     $2676
  002654  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  00265a  48680002             pea.l     $2(a0)
  00265e  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  002664  48680002             pea.l     $2(a0)
  002668  486efff8             pea.l     -$8(a6)
  00266c  486efff0             pea.l     -$10(a6)
  002670  4267                 clr.w     -(a7)
  002672  42a7                 clr.l     -(a7)
  002674  a8ec                 _CopyBits 
  002676  486efff8             pea.l     -$8(a6)
  00267a  2f3c00210000         move.l    #$210000, -(a7)
  002680  3003                 move.w    d3, d0
  002682  48c0                 ext.l     d0
  002684  3239000046ba         move.w    $46ba.l, d1   ; g_46ba
  00268a  48c1                 ext.l     d1
  00268c  d280                 add.l     d0, d1
  00268e  3f01                 move.w    d1, -(a7)
  002690  3f3c002c             move.w    #$2c, -(a7)
  002694  a8a7                 _SetRect  
  002696  486effdc             pea.l     -$24(a6)
  00269a  2f3c01be01d9         move.l    #$1be01d9, -(a7)
  0026a0  3003                 move.w    d3, d0
  0026a2  48c0                 ext.l     d0
  0026a4  3239000046ba         move.w    $46ba.l, d1   ; g_46ba
  0026aa  48c1                 ext.l     d1
  0026ac  0681000001d9         addi.l    #$1d9, d1
  0026b2  d280                 add.l     d0, d1
  0026b4  3f01                 move.w    d1, -(a7)
  0026b6  3f3c01c9             move.w    #$1c9, -(a7)
  0026ba  a8a7                 _SetRect  
  0026bc  20790000f6a6         movea.l   $f6a6.l, a0   ; g_f6a6
  0026c2  48680002             pea.l     $2(a0)
  0026c6  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  0026cc  48680002             pea.l     $2(a0)
  0026d0  486efff8             pea.l     -$8(a6)
  0026d4  486effdc             pea.l     -$24(a6)
  0026d8  4267                 clr.w     -(a7)
  0026da  42a7                 clr.l     -(a7)
  0026dc  a8ec                 _CopyBits 
  0026de  4a43                 tst.w     d3
  0026e0  673a                 beq.b     $271c
  0026e2  3003                 move.w    d3, d0
  0026e4  48c0                 ext.l     d0
  0026e6  3239000046ba         move.w    $46ba.l, d1   ; g_46ba
  0026ec  48c1                 ext.l     d1
  0026ee  0681000001d9         addi.l    #$1d9, d1
  0026f4  d280                 add.l     d0, d1
  0026f6  3d41ffe6             move.w    d1, -$1a(a6)
  0026fa  3d7c01bfffe4         move.w    #$1bf, -$1c(a6)
  002700  2f390000f714         move.l    $f714.l, -(a7)   ; g_f714
  002706  487900007474         pea.l     $7474.l   ; gameOffscreen
  00270c  2f2effe4             move.l    -$1c(a6), -(a7)
  002710  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  002716  4eb900000118         jsr       $118.l   ; SATPLOTFACE
  00271c  4a04                 tst.b     d4
  00271e  6722                 beq.b     $2742
  002720  486effe8             pea.l     -$18(a6)
  002724  2f3c01be01d9         move.l    #$1be01d9, -(a7)
  00272a  3039000046ba         move.w    $46ba.l, d0   ; g_46ba
  002730  48c0                 ext.l     d0
  002732  0680000001dc         addi.l    #$1dc, d0
  002738  3f00                 move.w    d0, -(a7)
  00273a  3f3c01c9             move.w    #$1c9, -(a7)
  00273e  a8a7                 _SetRect  
  002740  6012                 bra.b     $2754
  002742  486effe8             pea.l     -$18(a6)
  002746  2f3c01be01d9         move.l    #$1be01d9, -(a7)
  00274c  2f3c01c9026c         move.l    #$1c9026c, -(a7)
  002752  a8a7                 _SetRect  
  002754  486effe8             pea.l     -$18(a6)
  002758  61fffffff9ac         bsr.l     $2106   ; CopyStatRect
  00275e  3039000046c0         move.w    $46c0.l, d0   ; g_46c0
  002764  b079000046ba         cmp.w     $46ba.l, d0   ; g_46ba
  00276a  584f                 addq.w    #$4, a7
  00276c  6c08                 bge.b     $2776
  00276e  5379000046ba         subq.w    #$1, $46ba.l   ; g_46ba
  002774  6014                 bra.b     $278a
  002776  3039000046c0         move.w    $46c0.l, d0   ; g_46c0
  00277c  b079000046ba         cmp.w     $46ba.l, d0   ; g_46ba
  002782  6f06                 ble.b     $278a
  002784  5279000046ba         addq.w    #$1, $46ba.l   ; g_46ba
  00278a  4cdf0018             movem.l   (a7)+, d3-d4
  00278e  4e5e                 unlk      a6
  002790  4e75                 rts       

;-------------------------------------------------------------
; UpdateAmmo   (seg 1 +0027a2, 2042 bytes)
  0027a2  4e56ffc8             link.w    a6, #$ffc8
  0027a6  48e71f00             movem.l   d3-d7, -(a7)
  0027aa  1e2e0008             move.b    $8(a6), d7
  0027ae  78ff                 moveq     #$ff, d4
  0027b0  7aff                 moveq     #$ff, d5
  0027b2  7cff                 moveq     #$ff, d6
  0027b4  2d79000054eaffce     move.l    $54ea.l, -$32(a6)   ; g_54ea
  0027bc  3d79000054eeffd2     move.w    $54ee.l, -$2e(a6)   ; g_54ee
  0027c4  2d79000054e4ffc8     move.l    $54e4.l, -$38(a6)   ; g_54e4
  0027cc  3d79000054e8ffcc     move.w    $54e8.l, -$34(a6)   ; g_54e8
  0027d4  2d79000054deffe6     move.l    $54de.l, -$1a(a6)   ; g_54de
  0027dc  3d79000054e2ffea     move.w    $54e2.l, -$16(a6)   ; g_54e2
  0027e4  2d79000054d8ffe0     move.l    $54d8.l, -$20(a6)   ; g_54d8
  0027ec  3d79000054dcffe4     move.w    $54dc.l, -$1c(a6)   ; g_54dc
  0027f4  2d79000054d2ffda     move.l    $54d2.l, -$26(a6)   ; g_54d2
  0027fc  3d79000054d6ffde     move.w    $54d6.l, -$22(a6)   ; g_54d6
  002804  2d79000054ccffd4     move.l    $54cc.l, -$2c(a6)   ; g_54cc
  00280c  3d79000054d0ffd8     move.w    $54d0.l, -$28(a6)   ; g_54d0
  002814  7600                 moveq     #$0, d3
  002816  6032                 bra.b     $284a
  002818  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00281e  0c702c233400         cmpi.w    #$2c23, (a0, d3.w * 4)
  002824  6602                 bne.b     $2828
  002826  3803                 move.w    d3, d4
  002828  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00282e  0c702d4f3400         cmpi.w    #$2d4f, (a0, d3.w * 4)
  002834  6602                 bne.b     $2838
  002836  3a03                 move.w    d3, d5
  002838  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00283e  0c702e173400         cmpi.w    #$2e17, (a0, d3.w * 4)
  002844  6602                 bne.b     $2848
  002846  3c03                 move.w    d3, d6
  002848  5243                 addq.w    #$1, d3
  00284a  0c43000c             cmpi.w    #$c, d3
  00284e  6dc8                 blt.b     $2818
  002850  487900007474         pea.l     $7474.l   ; gameOffscreen
  002856  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  00285c  4a7900008082         tst.w     $8082.l   ; g_8082
  002862  6c08                 bge.b     $286c
  002864  427900008082         clr.w     $8082.l   ; g_8082
  00286a  6012                 bra.b     $287e
  00286c  0c79006400008082     cmpi.w    #$64, $8082.l   ; g_8082
  002874  6f08                 ble.b     $287e
  002876  33fc006400008082     move.w    #$64, $8082.l   ; g_8082
  00287e  4a7900008084         tst.w     $8084.l   ; g_8084
  002884  6c08                 bge.b     $288e
  002886  427900008084         clr.w     $8084.l   ; g_8084
  00288c  6012                 bra.b     $28a0
  00288e  0c79006400008084     cmpi.w    #$64, $8084.l   ; g_8084
  002896  6f08                 ble.b     $28a0
  002898  33fc006400008084     move.w    #$64, $8084.l   ; g_8084
  0028a0  4a7900008086         tst.w     $8086.l   ; g_8086
  0028a6  6c08                 bge.b     $28b0
  0028a8  427900008086         clr.w     $8086.l   ; g_8086
  0028ae  6012                 bra.b     $28c2
  0028b0  0c79006400008086     cmpi.w    #$64, $8086.l   ; g_8086
  0028b8  6f08                 ble.b     $28c2
  0028ba  33fc006400008086     move.w    #$64, $8086.l   ; g_8086
  0028c2  0c44ffff             cmpi.w    #$ffff, d4
  0028c6  6700023c             beq.w     $2b04
  0028ca  30390000f6ca         move.w    $f6ca.l, d0   ; g_f6ca
  0028d0  b07900008082         cmp.w     $8082.l, d0   ; g_8082
  0028d6  6606                 bne.b     $28de
  0028d8  4a07                 tst.b     d7
  0028da  66000228             bne.w     $2b04
  0028de  3f04                 move.w    d4, -(a7)
  0028e0  4eb900000be0         jsr       $be0.l   ; FindInvCol
  0028e6  c1fc0031             muls.w    #$31, d0
  0028ea  0680000001e1         addi.l    #$1e1, d0
  0028f0  3d40fffe             move.w    d0, -$2(a6)
  0028f4  3f04                 move.w    d4, -(a7)
  0028f6  4eb900000bd8         jsr       $bd8.l   ; FindInvRow
  0028fc  c1fc0031             muls.w    #$31, d0
  002900  0680000000c9         addi.l    #$c9, d0
  002906  3d40fffc             move.w    d0, -$4(a6)
  00290a  363900008082         move.w    $8082.l, d3   ; g_8082
  002910  48c3                 ext.l     d3
  002912  4c7c380300000003     divs.l    #$3, d3
  00291a  3f2efffe             move.w    -$2(a6), -(a7)
  00291e  3f2efffc             move.w    -$4(a6), -(a7)
  002922  a893                 _MoveTo   
  002924  486effe6             pea.l     -$1a(a6)
  002928  aa14                 _RGBForeColor 
  00292a  3003                 move.w    d3, d0
  00292c  48c0                 ext.l     d0
  00292e  322efffe             move.w    -$2(a6), d1
  002932  48c1                 ext.l     d1
  002934  d280                 add.l     d0, d1
  002936  3f01                 move.w    d1, -(a7)
  002938  3f2efffc             move.w    -$4(a6), -(a7)
  00293c  a891                 _LineTo   
  00293e  486effda             pea.l     -$26(a6)
  002942  aa14                 _RGBForeColor 
  002944  302efffe             move.w    -$2(a6), d0
  002948  48c0                 ext.l     d0
  00294a  7221                 moveq     #$21, d1
  00294c  d081                 add.l     d1, d0
  00294e  3f00                 move.w    d0, -(a7)
  002950  3f2efffc             move.w    -$4(a6), -(a7)
  002954  a891                 _LineTo   
  002956  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  00295c  302efffc             move.w    -$4(a6), d0
  002960  48c0                 ext.l     d0
  002962  5280                 addq.l    #$1, d0
  002964  3d40fff4             move.w    d0, -$c(a6)
  002968  3003                 move.w    d3, d0
  00296a  48c0                 ext.l     d0
  00296c  322efffe             move.w    -$2(a6), d1
  002970  48c1                 ext.l     d1
  002972  d280                 add.l     d0, d1
  002974  3d41fffa             move.w    d1, -$6(a6)
  002978  302efffc             move.w    -$4(a6), d0
  00297c  48c0                 ext.l     d0
  00297e  5880                 addq.l    #$4, d0
  002980  3d40fff8             move.w    d0, -$8(a6)
  002984  486effce             pea.l     -$32(a6)
  002988  aa14                 _RGBForeColor 
  00298a  486efff4             pea.l     -$c(a6)
  00298e  a8a2                 _PaintRect 
  002990  3003                 move.w    d3, d0
  002992  48c0                 ext.l     d0
  002994  322efffe             move.w    -$2(a6), d1
  002998  48c1                 ext.l     d1
  00299a  d280                 add.l     d0, d1
  00299c  3d41fff6             move.w    d1, -$a(a6)
  0029a0  302efffc             move.w    -$4(a6), d0
  0029a4  48c0                 ext.l     d0
  0029a6  5280                 addq.l    #$1, d0
  0029a8  3d40fff4             move.w    d0, -$c(a6)
  0029ac  302efffe             move.w    -$2(a6), d0
  0029b0  48c0                 ext.l     d0
  0029b2  7221                 moveq     #$21, d1
  0029b4  d081                 add.l     d1, d0
  0029b6  3d40fffa             move.w    d0, -$6(a6)
  0029ba  302efffc             move.w    -$4(a6), d0
  0029be  48c0                 ext.l     d0
  0029c0  5880                 addq.l    #$4, d0
  0029c2  3d40fff8             move.w    d0, -$8(a6)
  0029c6  486effc8             pea.l     -$38(a6)
  0029ca  aa14                 _RGBForeColor 
  0029cc  486efff4             pea.l     -$c(a6)
  0029d0  a8a2                 _PaintRect 
  0029d2  3f2efffe             move.w    -$2(a6), -(a7)
  0029d6  302efffc             move.w    -$4(a6), d0
  0029da  48c0                 ext.l     d0
  0029dc  5880                 addq.l    #$4, d0
  0029de  3f00                 move.w    d0, -(a7)
  0029e0  a893                 _MoveTo   
  0029e2  486effe0             pea.l     -$20(a6)
  0029e6  aa14                 _RGBForeColor 
  0029e8  3003                 move.w    d3, d0
  0029ea  48c0                 ext.l     d0
  0029ec  322efffe             move.w    -$2(a6), d1
  0029f0  48c1                 ext.l     d1
  0029f2  d280                 add.l     d0, d1
  0029f4  3f01                 move.w    d1, -(a7)
  0029f6  302efffc             move.w    -$4(a6), d0
  0029fa  48c0                 ext.l     d0
  0029fc  5880                 addq.l    #$4, d0
  0029fe  3f00                 move.w    d0, -(a7)
  002a00  a891                 _LineTo   
  002a02  486effd4             pea.l     -$2c(a6)
  002a06  aa14                 _RGBForeColor 
  002a08  302efffe             move.w    -$2(a6), d0
  002a0c  48c0                 ext.l     d0
  002a0e  7221                 moveq     #$21, d1
  002a10  d081                 add.l     d1, d0
  002a12  3f00                 move.w    d0, -(a7)
  002a14  302efffc             move.w    -$4(a6), d0
  002a18  48c0                 ext.l     d0
  002a1a  5880                 addq.l    #$4, d0
  002a1c  3f00                 move.w    d0, -(a7)
  002a1e  a891                 _LineTo   
  002a20  3f2efffe             move.w    -$2(a6), -(a7)
  002a24  3f2efffc             move.w    -$4(a6), -(a7)
  002a28  a893                 _MoveTo   
  002a2a  4a7900008082         tst.w     $8082.l   ; g_8082
  002a30  584f                 addq.w    #$4, a7
  002a32  6f08                 ble.b     $2a3c
  002a34  486effe6             pea.l     -$1a(a6)
  002a38  aa14                 _RGBForeColor 
  002a3a  6006                 bra.b     $2a42
  002a3c  486effda             pea.l     -$26(a6)
  002a40  aa14                 _RGBForeColor 
  002a42  3f2efffe             move.w    -$2(a6), -(a7)
  002a46  302efffc             move.w    -$4(a6), d0
  002a4a  48c0                 ext.l     d0
  002a4c  5880                 addq.l    #$4, d0
  002a4e  3f00                 move.w    d0, -(a7)
  002a50  a891                 _LineTo   
  002a52  0c79006400008082     cmpi.w    #$64, $8082.l   ; g_8082
  002a5a  6c30                 bge.b     $2a8c
  002a5c  302efffe             move.w    -$2(a6), d0
  002a60  48c0                 ext.l     d0
  002a62  7221                 moveq     #$21, d1
  002a64  d081                 add.l     d1, d0
  002a66  3f00                 move.w    d0, -(a7)
  002a68  3f2efffc             move.w    -$4(a6), -(a7)
  002a6c  a893                 _MoveTo   
  002a6e  486effd4             pea.l     -$2c(a6)
  002a72  aa14                 _RGBForeColor 
  002a74  302efffe             move.w    -$2(a6), d0
  002a78  48c0                 ext.l     d0
  002a7a  7221                 moveq     #$21, d1
  002a7c  d081                 add.l     d1, d0
  002a7e  3f00                 move.w    d0, -(a7)
  002a80  302efffc             move.w    -$4(a6), d0
  002a84  48c0                 ext.l     d0
  002a86  5880                 addq.l    #$4, d0
  002a88  3f00                 move.w    d0, -(a7)
  002a8a  a891                 _LineTo   
  002a8c  4a7900008082         tst.w     $8082.l   ; g_8082
  002a92  6f34                 ble.b     $2ac8
  002a94  3003                 move.w    d3, d0
  002a96  48c0                 ext.l     d0
  002a98  322efffe             move.w    -$2(a6), d1
  002a9c  48c1                 ext.l     d1
  002a9e  d280                 add.l     d0, d1
  002aa0  3f01                 move.w    d1, -(a7)
  002aa2  3f2efffc             move.w    -$4(a6), -(a7)
  002aa6  a893                 _MoveTo   
  002aa8  486effe0             pea.l     -$20(a6)
  002aac  aa14                 _RGBForeColor 
  002aae  3003                 move.w    d3, d0
  002ab0  48c0                 ext.l     d0
  002ab2  322efffe             move.w    -$2(a6), d1
  002ab6  48c1                 ext.l     d1
  002ab8  d280                 add.l     d0, d1
  002aba  3f01                 move.w    d1, -(a7)
  002abc  302efffc             move.w    -$4(a6), d0
  002ac0  48c0                 ext.l     d0
  002ac2  5880                 addq.l    #$4, d0
  002ac4  3f00                 move.w    d0, -(a7)
  002ac6  a891                 _LineTo   
  002ac8  3d6efffeffee         move.w    -$2(a6), -$12(a6)
  002ace  3d6efffcffec         move.w    -$4(a6), -$14(a6)
  002ad4  302efffe             move.w    -$2(a6), d0
  002ad8  48c0                 ext.l     d0
  002ada  7224                 moveq     #$24, d1
  002adc  d081                 add.l     d1, d0
  002ade  3d40fff2             move.w    d0, -$e(a6)
  002ae2  302efffc             move.w    -$4(a6), d0
  002ae6  48c0                 ext.l     d0
  002ae8  5c80                 addq.l    #$6, d0
  002aea  3d40fff0             move.w    d0, -$10(a6)
  002aee  486effec             pea.l     -$14(a6)
  002af2  61fffffff612         bsr.l     $2106   ; CopyStatRect
  002af8  33f9000080820000f6ca move.w    $8082.l, $f6ca.l   ; g_8082, g_f6ca
  002b02  584f                 addq.w    #$4, a7
  002b04  0c45ffff             cmpi.w    #$ffff, d5
  002b08  6700023c             beq.w     $2d46
  002b0c  30390000f6cc         move.w    $f6cc.l, d0   ; g_f6cc
  002b12  b07900008084         cmp.w     $8084.l, d0   ; g_8084
  002b18  6606                 bne.b     $2b20
  002b1a  4a07                 tst.b     d7
  002b1c  66000228             bne.w     $2d46
  002b20  3f05                 move.w    d5, -(a7)
  002b22  4eb900000be0         jsr       $be0.l   ; FindInvCol
  002b28  c1fc0031             muls.w    #$31, d0
  002b2c  0680000001e1         addi.l    #$1e1, d0
  002b32  3d40fffe             move.w    d0, -$2(a6)
  002b36  3f05                 move.w    d5, -(a7)
  002b38  4eb900000bd8         jsr       $bd8.l   ; FindInvRow
  002b3e  c1fc0031             muls.w    #$31, d0
  002b42  0680000000c9         addi.l    #$c9, d0
  002b48  3d40fffc             move.w    d0, -$4(a6)
  002b4c  363900008084         move.w    $8084.l, d3   ; g_8084
  002b52  48c3                 ext.l     d3
  002b54  4c7c380300000003     divs.l    #$3, d3
  002b5c  3f2efffe             move.w    -$2(a6), -(a7)
  002b60  3f2efffc             move.w    -$4(a6), -(a7)
  002b64  a893                 _MoveTo   
  002b66  486effe6             pea.l     -$1a(a6)
  002b6a  aa14                 _RGBForeColor 
  002b6c  3003                 move.w    d3, d0
  002b6e  48c0                 ext.l     d0
  002b70  322efffe             move.w    -$2(a6), d1
  002b74  48c1                 ext.l     d1
  002b76  d280                 add.l     d0, d1
  002b78  3f01                 move.w    d1, -(a7)
  002b7a  3f2efffc             move.w    -$4(a6), -(a7)
  002b7e  a891                 _LineTo   
  002b80  486effda             pea.l     -$26(a6)
  002b84  aa14                 _RGBForeColor 
  002b86  302efffe             move.w    -$2(a6), d0
  002b8a  48c0                 ext.l     d0
  002b8c  7221                 moveq     #$21, d1
  002b8e  d081                 add.l     d1, d0
  002b90  3f00                 move.w    d0, -(a7)
  002b92  3f2efffc             move.w    -$4(a6), -(a7)
  002b96  a891                 _LineTo   
  002b98  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  002b9e  302efffc             move.w    -$4(a6), d0
  002ba2  48c0                 ext.l     d0
  002ba4  5280                 addq.l    #$1, d0
  002ba6  3d40fff4             move.w    d0, -$c(a6)
  002baa  3003                 move.w    d3, d0
  002bac  48c0                 ext.l     d0
  002bae  322efffe             move.w    -$2(a6), d1
  002bb2  48c1                 ext.l     d1
  002bb4  d280                 add.l     d0, d1
  002bb6  3d41fffa             move.w    d1, -$6(a6)
  002bba  302efffc             move.w    -$4(a6), d0
  002bbe  48c0                 ext.l     d0
  002bc0  5880                 addq.l    #$4, d0
  002bc2  3d40fff8             move.w    d0, -$8(a6)
  002bc6  486effce             pea.l     -$32(a6)
  002bca  aa14                 _RGBForeColor 
  002bcc  486efff4             pea.l     -$c(a6)
  002bd0  a8a2                 _PaintRect 
  002bd2  3003                 move.w    d3, d0
  002bd4  48c0                 ext.l     d0
  002bd6  322efffe             move.w    -$2(a6), d1
  002bda  48c1                 ext.l     d1
  002bdc  d280                 add.l     d0, d1
  002bde  3d41fff6             move.w    d1, -$a(a6)
  002be2  302efffc             move.w    -$4(a6), d0
  002be6  48c0                 ext.l     d0
  002be8  5280                 addq.l    #$1, d0
  002bea  3d40fff4             move.w    d0, -$c(a6)
  002bee  302efffe             move.w    -$2(a6), d0
  002bf2  48c0                 ext.l     d0
  002bf4  7221                 moveq     #$21, d1
  002bf6  d081                 add.l     d1, d0
  002bf8  3d40fffa             move.w    d0, -$6(a6)
  002bfc  302efffc             move.w    -$4(a6), d0
  002c00  48c0                 ext.l     d0
  002c02  5880                 addq.l    #$4, d0
  002c04  3d40fff8             move.w    d0, -$8(a6)
  002c08  486effc8             pea.l     -$38(a6)
  002c0c  aa14                 _RGBForeColor 
  002c0e  486efff4             pea.l     -$c(a6)
  002c12  a8a2                 _PaintRect 
  002c14  3f2efffe             move.w    -$2(a6), -(a7)
  002c18  302efffc             move.w    -$4(a6), d0
  002c1c  48c0                 ext.l     d0
  002c1e  5880                 addq.l    #$4, d0
  002c20  3f00                 move.w    d0, -(a7)
  002c22  a893                 _MoveTo   
  002c24  486effe0             pea.l     -$20(a6)
  002c28  aa14                 _RGBForeColor 
  002c2a  3003                 move.w    d3, d0
  002c2c  48c0                 ext.l     d0
  002c2e  322efffe             move.w    -$2(a6), d1
  002c32  48c1                 ext.l     d1
  002c34  d280                 add.l     d0, d1
  002c36  3f01                 move.w    d1, -(a7)
  002c38  302efffc             move.w    -$4(a6), d0
  002c3c  48c0                 ext.l     d0
  002c3e  5880                 addq.l    #$4, d0
  002c40  3f00                 move.w    d0, -(a7)
  002c42  a891                 _LineTo   
  002c44  486effd4             pea.l     -$2c(a6)
  002c48  aa14                 _RGBForeColor 
  002c4a  302efffe             move.w    -$2(a6), d0
  002c4e  48c0                 ext.l     d0
  002c50  7221                 moveq     #$21, d1
  002c52  d081                 add.l     d1, d0
  002c54  3f00                 move.w    d0, -(a7)
  002c56  302efffc             move.w    -$4(a6), d0
  002c5a  48c0                 ext.l     d0
  002c5c  5880                 addq.l    #$4, d0
  002c5e  3f00                 move.w    d0, -(a7)
  002c60  a891                 _LineTo   
  002c62  3f2efffe             move.w    -$2(a6), -(a7)
  002c66  3f2efffc             move.w    -$4(a6), -(a7)
  002c6a  a893                 _MoveTo   
  002c6c  4a7900008084         tst.w     $8084.l   ; g_8084
  002c72  584f                 addq.w    #$4, a7
  002c74  6f08                 ble.b     $2c7e
  002c76  486effe6             pea.l     -$1a(a6)
  002c7a  aa14                 _RGBForeColor 
  002c7c  6006                 bra.b     $2c84
  002c7e  486effda             pea.l     -$26(a6)
  002c82  aa14                 _RGBForeColor 
  002c84  3f2efffe             move.w    -$2(a6), -(a7)
  002c88  302efffc             move.w    -$4(a6), d0
  002c8c  48c0                 ext.l     d0
  002c8e  5880                 addq.l    #$4, d0
  002c90  3f00                 move.w    d0, -(a7)
  002c92  a891                 _LineTo   
  002c94  0c79006400008084     cmpi.w    #$64, $8084.l   ; g_8084
  002c9c  6c30                 bge.b     $2cce
  002c9e  302efffe             move.w    -$2(a6), d0
  002ca2  48c0                 ext.l     d0
  002ca4  7221                 moveq     #$21, d1
  002ca6  d081                 add.l     d1, d0
  002ca8  3f00                 move.w    d0, -(a7)
  002caa  3f2efffc             move.w    -$4(a6), -(a7)
  002cae  a893                 _MoveTo   
  002cb0  486effd4             pea.l     -$2c(a6)
  002cb4  aa14                 _RGBForeColor 
  002cb6  302efffe             move.w    -$2(a6), d0
  002cba  48c0                 ext.l     d0
  002cbc  7221                 moveq     #$21, d1
  002cbe  d081                 add.l     d1, d0
  002cc0  3f00                 move.w    d0, -(a7)
  002cc2  302efffc             move.w    -$4(a6), d0
  002cc6  48c0                 ext.l     d0
  002cc8  5880                 addq.l    #$4, d0
  002cca  3f00                 move.w    d0, -(a7)
  002ccc  a891                 _LineTo   
  002cce  4a7900008084         tst.w     $8084.l   ; g_8084
  002cd4  6f34                 ble.b     $2d0a
  002cd6  3003                 move.w    d3, d0
  002cd8  48c0                 ext.l     d0
  002cda  322efffe             move.w    -$2(a6), d1
  002cde  48c1                 ext.l     d1
  002ce0  d280                 add.l     d0, d1
  002ce2  3f01                 move.w    d1, -(a7)
  002ce4  3f2efffc             move.w    -$4(a6), -(a7)
  002ce8  a893                 _MoveTo   
  002cea  486effe0             pea.l     -$20(a6)
  002cee  aa14                 _RGBForeColor 
  002cf0  3003                 move.w    d3, d0
  002cf2  48c0                 ext.l     d0
  002cf4  322efffe             move.w    -$2(a6), d1
  002cf8  48c1                 ext.l     d1
  002cfa  d280                 add.l     d0, d1
  002cfc  3f01                 move.w    d1, -(a7)
  002cfe  302efffc             move.w    -$4(a6), d0
  002d02  48c0                 ext.l     d0
  002d04  5880                 addq.l    #$4, d0
  002d06  3f00                 move.w    d0, -(a7)
  002d08  a891                 _LineTo   
  002d0a  3d6efffeffee         move.w    -$2(a6), -$12(a6)
  002d10  3d6efffcffec         move.w    -$4(a6), -$14(a6)
  002d16  302efffe             move.w    -$2(a6), d0
  002d1a  48c0                 ext.l     d0
  002d1c  7224                 moveq     #$24, d1
  002d1e  d081                 add.l     d1, d0
  002d20  3d40fff2             move.w    d0, -$e(a6)
  002d24  302efffc             move.w    -$4(a6), d0
  002d28  48c0                 ext.l     d0
  002d2a  5c80                 addq.l    #$6, d0
  002d2c  3d40fff0             move.w    d0, -$10(a6)
  002d30  486effec             pea.l     -$14(a6)
  002d34  61fffffff3d0         bsr.l     $2106   ; CopyStatRect
  002d3a  33f9000080840000f6cc move.w    $8084.l, $f6cc.l   ; g_8084, g_f6cc
  002d44  584f                 addq.w    #$4, a7
  002d46  0c46ffff             cmpi.w    #$ffff, d6
  002d4a  6700023c             beq.w     $2f88
  002d4e  30390000f6ce         move.w    $f6ce.l, d0   ; g_f6ce
  002d54  b07900008086         cmp.w     $8086.l, d0   ; g_8086
  002d5a  6606                 bne.b     $2d62
  002d5c  4a07                 tst.b     d7
  002d5e  66000228             bne.w     $2f88
  002d62  3f06                 move.w    d6, -(a7)
  002d64  4eb900000be0         jsr       $be0.l   ; FindInvCol
  002d6a  c1fc0031             muls.w    #$31, d0
  002d6e  0680000001e1         addi.l    #$1e1, d0
  002d74  3d40fffe             move.w    d0, -$2(a6)
  002d78  3f06                 move.w    d6, -(a7)
  002d7a  4eb900000bd8         jsr       $bd8.l   ; FindInvRow
  002d80  c1fc0031             muls.w    #$31, d0
  002d84  0680000000c9         addi.l    #$c9, d0
  002d8a  3d40fffc             move.w    d0, -$4(a6)
  002d8e  363900008086         move.w    $8086.l, d3   ; g_8086
  002d94  48c3                 ext.l     d3
  002d96  4c7c380300000003     divs.l    #$3, d3
  002d9e  3f2efffe             move.w    -$2(a6), -(a7)
  002da2  3f2efffc             move.w    -$4(a6), -(a7)
  002da6  a893                 _MoveTo   
  002da8  486effe6             pea.l     -$1a(a6)
  002dac  aa14                 _RGBForeColor 
  002dae  3003                 move.w    d3, d0
  002db0  48c0                 ext.l     d0
  002db2  322efffe             move.w    -$2(a6), d1
  002db6  48c1                 ext.l     d1
  002db8  d280                 add.l     d0, d1
  002dba  3f01                 move.w    d1, -(a7)
  002dbc  3f2efffc             move.w    -$4(a6), -(a7)
  002dc0  a891                 _LineTo   
  002dc2  486effda             pea.l     -$26(a6)
  002dc6  aa14                 _RGBForeColor 
  002dc8  302efffe             move.w    -$2(a6), d0
  002dcc  48c0                 ext.l     d0
  002dce  7221                 moveq     #$21, d1
  002dd0  d081                 add.l     d1, d0
  002dd2  3f00                 move.w    d0, -(a7)
  002dd4  3f2efffc             move.w    -$4(a6), -(a7)
  002dd8  a891                 _LineTo   
  002dda  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  002de0  302efffc             move.w    -$4(a6), d0
  002de4  48c0                 ext.l     d0
  002de6  5280                 addq.l    #$1, d0
  002de8  3d40fff4             move.w    d0, -$c(a6)
  002dec  3003                 move.w    d3, d0
  002dee  48c0                 ext.l     d0
  002df0  322efffe             move.w    -$2(a6), d1
  002df4  48c1                 ext.l     d1
  002df6  d280                 add.l     d0, d1
  002df8  3d41fffa             move.w    d1, -$6(a6)
  002dfc  302efffc             move.w    -$4(a6), d0
  002e00  48c0                 ext.l     d0
  002e02  5880                 addq.l    #$4, d0
  002e04  3d40fff8             move.w    d0, -$8(a6)
  002e08  486effce             pea.l     -$32(a6)
  002e0c  aa14                 _RGBForeColor 
  002e0e  486efff4             pea.l     -$c(a6)
  002e12  a8a2                 _PaintRect 
  002e14  3003                 move.w    d3, d0
  002e16  48c0                 ext.l     d0
  002e18  322efffe             move.w    -$2(a6), d1
  002e1c  48c1                 ext.l     d1
  002e1e  d280                 add.l     d0, d1
  002e20  3d41fff6             move.w    d1, -$a(a6)
  002e24  302efffc             move.w    -$4(a6), d0
  002e28  48c0                 ext.l     d0
  002e2a  5280                 addq.l    #$1, d0
  002e2c  3d40fff4             move.w    d0, -$c(a6)
  002e30  302efffe             move.w    -$2(a6), d0
  002e34  48c0                 ext.l     d0
  002e36  7221                 moveq     #$21, d1
  002e38  d081                 add.l     d1, d0
  002e3a  3d40fffa             move.w    d0, -$6(a6)
  002e3e  302efffc             move.w    -$4(a6), d0
  002e42  48c0                 ext.l     d0
  002e44  5880                 addq.l    #$4, d0
  002e46  3d40fff8             move.w    d0, -$8(a6)
  002e4a  486effc8             pea.l     -$38(a6)
  002e4e  aa14                 _RGBForeColor 
  002e50  486efff4             pea.l     -$c(a6)
  002e54  a8a2                 _PaintRect 
  002e56  3f2efffe             move.w    -$2(a6), -(a7)
  002e5a  302efffc             move.w    -$4(a6), d0
  002e5e  48c0                 ext.l     d0
  002e60  5880                 addq.l    #$4, d0
  002e62  3f00                 move.w    d0, -(a7)
  002e64  a893                 _MoveTo   
  002e66  486effe0             pea.l     -$20(a6)
  002e6a  aa14                 _RGBForeColor 
  002e6c  3003                 move.w    d3, d0
  002e6e  48c0                 ext.l     d0
  002e70  322efffe             move.w    -$2(a6), d1
  002e74  48c1                 ext.l     d1
  002e76  d280                 add.l     d0, d1
  002e78  3f01                 move.w    d1, -(a7)
  002e7a  302efffc             move.w    -$4(a6), d0
  002e7e  48c0                 ext.l     d0
  002e80  5880                 addq.l    #$4, d0
  002e82  3f00                 move.w    d0, -(a7)
  002e84  a891                 _LineTo   
  002e86  486effd4             pea.l     -$2c(a6)
  002e8a  aa14                 _RGBForeColor 
  002e8c  302efffe             move.w    -$2(a6), d0
  002e90  48c0                 ext.l     d0
  002e92  7221                 moveq     #$21, d1
  002e94  d081                 add.l     d1, d0
  002e96  3f00                 move.w    d0, -(a7)
  002e98  302efffc             move.w    -$4(a6), d0
  002e9c  48c0                 ext.l     d0
  002e9e  5880                 addq.l    #$4, d0
  002ea0  3f00                 move.w    d0, -(a7)
  002ea2  a891                 _LineTo   
  002ea4  3f2efffe             move.w    -$2(a6), -(a7)
  002ea8  3f2efffc             move.w    -$4(a6), -(a7)
  002eac  a893                 _MoveTo   
  002eae  4a7900008086         tst.w     $8086.l   ; g_8086
  002eb4  584f                 addq.w    #$4, a7
  002eb6  6f08                 ble.b     $2ec0
  002eb8  486effe6             pea.l     -$1a(a6)
  002ebc  aa14                 _RGBForeColor 
  002ebe  6006                 bra.b     $2ec6
  002ec0  486effda             pea.l     -$26(a6)
  002ec4  aa14                 _RGBForeColor 
  002ec6  3f2efffe             move.w    -$2(a6), -(a7)
  002eca  302efffc             move.w    -$4(a6), d0
  002ece  48c0                 ext.l     d0
  002ed0  5880                 addq.l    #$4, d0
  002ed2  3f00                 move.w    d0, -(a7)
  002ed4  a891                 _LineTo   
  002ed6  0c79006400008086     cmpi.w    #$64, $8086.l   ; g_8086
  002ede  6c30                 bge.b     $2f10
  002ee0  302efffe             move.w    -$2(a6), d0
  002ee4  48c0                 ext.l     d0
  002ee6  7221                 moveq     #$21, d1
  002ee8  d081                 add.l     d1, d0
  002eea  3f00                 move.w    d0, -(a7)
  002eec  3f2efffc             move.w    -$4(a6), -(a7)
  002ef0  a893                 _MoveTo   
  002ef2  486effd4             pea.l     -$2c(a6)
  002ef6  aa14                 _RGBForeColor 
  002ef8  302efffe             move.w    -$2(a6), d0
  002efc  48c0                 ext.l     d0
  002efe  7221                 moveq     #$21, d1
  002f00  d081                 add.l     d1, d0
  002f02  3f00                 move.w    d0, -(a7)
  002f04  302efffc             move.w    -$4(a6), d0
  002f08  48c0                 ext.l     d0
  002f0a  5880                 addq.l    #$4, d0
  002f0c  3f00                 move.w    d0, -(a7)
  002f0e  a891                 _LineTo   
  002f10  4a7900008086         tst.w     $8086.l   ; g_8086
  002f16  6f34                 ble.b     $2f4c
  002f18  3003                 move.w    d3, d0
  002f1a  48c0                 ext.l     d0
  002f1c  322efffe             move.w    -$2(a6), d1
  002f20  48c1                 ext.l     d1
  002f22  d280                 add.l     d0, d1
  002f24  3f01                 move.w    d1, -(a7)
  002f26  3f2efffc             move.w    -$4(a6), -(a7)
  002f2a  a893                 _MoveTo   
  002f2c  486effe0             pea.l     -$20(a6)
  002f30  aa14                 _RGBForeColor 
  002f32  3003                 move.w    d3, d0
  002f34  48c0                 ext.l     d0
  002f36  322efffe             move.w    -$2(a6), d1
  002f3a  48c1                 ext.l     d1
  002f3c  d280                 add.l     d0, d1
  002f3e  3f01                 move.w    d1, -(a7)
  002f40  302efffc             move.w    -$4(a6), d0
  002f44  48c0                 ext.l     d0
  002f46  5880                 addq.l    #$4, d0
  002f48  3f00                 move.w    d0, -(a7)
  002f4a  a891                 _LineTo   
  002f4c  3d6efffeffee         move.w    -$2(a6), -$12(a6)
  002f52  3d6efffcffec         move.w    -$4(a6), -$14(a6)
  002f58  302efffe             move.w    -$2(a6), d0
  002f5c  48c0                 ext.l     d0
  002f5e  7224                 moveq     #$24, d1
  002f60  d081                 add.l     d1, d0
  002f62  3d40fff2             move.w    d0, -$e(a6)
  002f66  302efffc             move.w    -$4(a6), d0
  002f6a  48c0                 ext.l     d0
  002f6c  5c80                 addq.l    #$6, d0
  002f6e  3d40fff0             move.w    d0, -$10(a6)
  002f72  486effec             pea.l     -$14(a6)
  002f76  61fffffff18e         bsr.l     $2106   ; CopyStatRect
  002f7c  33f9000080860000f6ce move.w    $8086.l, $f6ce.l   ; g_8086, g_f6ce
  002f86  584f                 addq.w    #$4, a7
  002f88  48780021             pea.l     $21.w
  002f8c  a862                 _ForeColor 
  002f8e  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  002f94  4cdf00f8             movem.l   (a7)+, d3-d7
  002f98  4e5e                 unlk      a6
  002f9a  4e75                 rts       

;-------------------------------------------------------------
; SetColor   (seg 1 +002faa, 28 bytes)
  002faa  4e560000             link.w    a6, #$0
  002fae  206e0008             movea.l   $8(a6), a0
  002fb2  30ae000e             move.w    $e(a6), (a0)
  002fb6  316e00120002         move.w    $12(a6), $2(a0)
  002fbc  316e00160004         move.w    $16(a6), $4(a0)
  002fc2  4e5e                 unlk      a6
  002fc4  4e75                 rts       

;-------------------------------------------------------------
; DrawMainMenu   (seg 1 +002fd2, 586 bytes)
  002fd2  4e56fcf6             link.w    a6, #$fcf6
  002fd6  2f03                 move.l    d3, -(a7)
  002fd8  1d7c0031fcf7         move.b    #$31, -$309(a6)
  002fde  4ab9ffffe866         tst.l     $ffffe866.l   ; g_-179a
  002fe4  6706                 beq.b     $2fec
  002fe6  4eb900000aa8         jsr       $aa8.l   ; KillAllSprites
  002fec  4eb9000000d8         jsr       $d8.l   ; SATSETPORTBACKSCREEN
  002ff2  3f3c0082             move.w    #$82, -(a7)
  002ff6  4879000055a2         pea.l     $55a2.l   ; g_55a2
  002ffc  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  003002  486efdf9             pea.l     -$207(a6)
  003006  4eb900000150         jsr       $150.l   ; seg7+609a
  00300c  3600                 move.w    d0, d3
  00300e  4a43                 tst.w     d3
  003010  584f                 addq.w    #$4, a7
  003012  660001d6             bne.w     $31ea
  003016  4a2efdf9             tst.b     -$207(a6)
  00301a  670000b4             beq.w     $30d0
  00301e  486eff00             pea.l     -$100(a6)
  003022  4879000054a8         pea.l     $54a8.l   ; g_54a8
  003028  4eb900000a88         jsr       $a88.l   ; CopyPString
  00302e  486efcf8             pea.l     -$308(a6)
  003032  4eb900000160         jsr       $160.l   ; seg7+638a
  003038  3600                 move.w    d0, d3
  00303a  4a43                 tst.w     d3
  00303c  4fef000c             lea.l     $c(a7), a7
  003040  6714                 beq.b     $3056
  003042  3f03                 move.w    d3, -(a7)
  003044  48790000548a         pea.l     $548a.l   ; g_548a
  00304a  4eb900000be8         jsr       $be8.l   ; ReportError
  003050  5c4f                 addq.w    #$6, a7
  003052  600001c2             bra.w     $3216
  003056  486efdfa             pea.l     -$206(a6)
  00305a  4eb900000168         jsr       $168.l   ; seg7+63fa
  003060  3600                 move.w    d0, d3
  003062  4a43                 tst.w     d3
  003064  584f                 addq.w    #$4, a7
  003066  6714                 beq.b     $307c
  003068  3f03                 move.w    d3, -(a7)
  00306a  48790000546b         pea.l     $546b.l   ; g_546b
  003070  4eb900000be8         jsr       $be8.l   ; ReportError
  003076  5c4f                 addq.w    #$6, a7
  003078  6000019c             bra.w     $3216
  00307c  486efcf8             pea.l     -$308(a6)
  003080  486eff00             pea.l     -$100(a6)
  003084  4eb900000a90         jsr       $a90.l   ; ConcatPString
  00308a  102efcf7             move.b    -$309(a6), d0
  00308e  49c0                 extb.l    d0
  003090  7200                 moveq     #$0, d1
  003092  122efdfb             move.b    -$205(a6), d1
  003096  b280                 cmp.l     d0, d1
  003098  504f                 addq.w    #$8, a7
  00309a  6746                 beq.b     $30e2
  00309c  487900005468         pea.l     $5468.l   ; g_5468
  0030a2  486eff00             pea.l     -$100(a6)
  0030a6  4eb900000a90         jsr       $a90.l   ; ConcatPString
  0030ac  486efdfa             pea.l     -$206(a6)
  0030b0  486eff00             pea.l     -$100(a6)
  0030b4  4eb900000a90         jsr       $a90.l   ; ConcatPString
  0030ba  48790000545f         pea.l     $545f.l   ; g_545f
  0030c0  486eff00             pea.l     -$100(a6)
  0030c4  4eb900000a90         jsr       $a90.l   ; ConcatPString
  0030ca  4fef0018             lea.l     $18(a7), a7
  0030ce  6012                 bra.b     $30e2
  0030d0  486eff00             pea.l     -$100(a6)
  0030d4  487900005412         pea.l     $5412.l   ; g_5412
  0030da  4eb900000a88         jsr       $a88.l   ; CopyPString
  0030e0  504f                 addq.w    #$8, a7
  0030e2  4878001e             pea.l     $1e.w
  0030e6  a862                 _ForeColor 
  0030e8  3f3c0015             move.w    #$15, -(a7)
  0030ec  a887                 _TextFont 
  0030ee  3f3c0001             move.w    #$1, -(a7)
  0030f2  a888                 _TextFace 
  0030f4  3f3c0009             move.w    #$9, -(a7)
  0030f8  a88a                 _TextSize 
  0030fa  554f                 subq.w    #$2, a7
  0030fc  486eff00             pea.l     -$100(a6)
  003100  a88c                 _StringWidth 
  003102  301f                 move.w    (a7)+, d0
  003104  3600                 move.w    d0, d3
  003106  42a7                 clr.l     -(a7)
  003108  42a7                 clr.l     -(a7)
  00310a  42a7                 clr.l     -(a7)
  00310c  486efefa             pea.l     -$106(a6)
  003110  61fffffffe98         bsr.l     $2faa   ; SetColor
  003116  486efefa             pea.l     -$106(a6)
  00311a  aa14                 _RGBForeColor 
  00311c  3003                 move.w    d3, d0
  00311e  48c0                 ext.l     d0
  003120  223c000001a6         move.l    #$1a6, d1
  003126  9280                 sub.l     d0, d1
  003128  e281                 asr.l     #$1, d1
  00312a  7016                 moveq     #$16, d0
  00312c  d280                 add.l     d0, d1
  00312e  3f01                 move.w    d1, -(a7)
  003130  3f3c01d3             move.w    #$1d3, -(a7)
  003134  a893                 _MoveTo   
  003136  486eff00             pea.l     -$100(a6)
  00313a  a884                 _DrawString 
  00313c  48784444             pea.l     $4444.w
  003140  48784444             pea.l     $4444.w
  003144  48784444             pea.l     $4444.w
  003148  486efefa             pea.l     -$106(a6)
  00314c  61fffffffe5c         bsr.l     $2faa   ; SetColor
  003152  486efefa             pea.l     -$106(a6)
  003156  aa14                 _RGBForeColor 
  003158  3003                 move.w    d3, d0
  00315a  48c0                 ext.l     d0
  00315c  223c000001a6         move.l    #$1a6, d1
  003162  9280                 sub.l     d0, d1
  003164  e281                 asr.l     #$1, d1
  003166  7018                 moveq     #$18, d0
  003168  d280                 add.l     d0, d1
  00316a  3f01                 move.w    d1, -(a7)
  00316c  3f3c01d5             move.w    #$1d5, -(a7)
  003170  a893                 _MoveTo   
  003172  486eff00             pea.l     -$100(a6)
  003176  a884                 _DrawString 
  003178  2f3c0000ffff         move.l    #$ffff, -(a7)
  00317e  2f3c0000ffff         move.l    #$ffff, -(a7)
  003184  2f3c0000ffff         move.l    #$ffff, -(a7)
  00318a  486efefa             pea.l     -$106(a6)
  00318e  61fffffffe1a         bsr.l     $2faa   ; SetColor
  003194  486efefa             pea.l     -$106(a6)
  003198  aa14                 _RGBForeColor 
  00319a  3003                 move.w    d3, d0
  00319c  48c0                 ext.l     d0
  00319e  223c000001a6         move.l    #$1a6, d1
  0031a4  9280                 sub.l     d0, d1
  0031a6  e281                 asr.l     #$1, d1
  0031a8  7017                 moveq     #$17, d0
  0031aa  d280                 add.l     d0, d1
  0031ac  3f01                 move.w    d1, -(a7)
  0031ae  3f3c01d4             move.w    #$1d4, -(a7)
  0031b2  a893                 _MoveTo   
  0031b4  486eff00             pea.l     -$100(a6)
  0031b8  a884                 _DrawString 
  0031ba  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  0031c0  4fef0030             lea.l     $30(a7), a7
  0031c4  6734                 beq.b     $31fa
  0031c6  3f3c0024             move.w    #$24, -(a7)
  0031ca  a88a                 _TextSize 
  0031cc  487800cd             pea.l     $cd.w
  0031d0  a862                 _ForeColor 
  0031d2  2f3c00400040         move.l    #$400040, -(a7)
  0031d8  a893                 _MoveTo   
  0031da  4879000053ff         pea.l     $53ff.l   ; g_53ff
  0031e0  a884                 _DrawString 
  0031e2  48780021             pea.l     $21.w
  0031e6  a862                 _ForeColor 
  0031e8  6010                 bra.b     $31fa
  0031ea  3f03                 move.w    d3, -(a7)
  0031ec  4879000053c0         pea.l     $53c0.l   ; g_53c0
  0031f2  4eb900000be8         jsr       $be8.l   ; ReportError
  0031f8  5c4f                 addq.w    #$6, a7
  0031fa  4879000055a2         pea.l     $55a2.l   ; g_55a2
  003200  4eb9000000f0         jsr       $f0.l   ; SATBACKCHANGED
  003206  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00320c  1f3c0001             move.b    #$1, -(a7)
  003210  4eb900000108         jsr       $108.l   ; SATRUN
  003216  261f                 move.l    (a7)+, d3
  003218  4e5e                 unlk      a6
  00321a  4e75                 rts       

;-------------------------------------------------------------
; LoadLevelTilesets   (seg 1 +00322c, 200 bytes)
  00322c  4e560000             link.w    a6, #$0
  003230  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003236  2250                 movea.l   (a0), a1
  003238  203c000120fe         move.l    #$120fe, d0
  00323e  323900013c16         move.w    $13c16.l, d1   ; g_13c16
  003244  b2710800             cmp.w     (a1, d0.l), d1
  003248  6746                 beq.b     $3290
  00324a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003250  2250                 movea.l   (a0), a1
  003252  203c000120fe         move.l    #$120fe, d0
  003258  33f1080000013c16     move.w    (a1, d0.l), $13c16.l   ; g_13c16
  003260  4a7900013c16         tst.w     $13c16.l   ; g_13c16
  003266  671c                 beq.b     $3284
  003268  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  00326e  3f3900013c16         move.w    $13c16.l, -(a7)   ; g_13c16
  003274  61ffffffe60a         bsr.l     $1880   ; LoadBGTileset
  00327a  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  003280  544f                 addq.w    #$2, a7
  003282  600c                 bra.b     $3290
  003284  3f3c00b4             move.w    #$b4, -(a7)
  003288  61ffffffe5f6         bsr.l     $1880   ; LoadBGTileset
  00328e  544f                 addq.w    #$2, a7
  003290  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003296  2250                 movea.l   (a0), a1
  003298  203c000120fc         move.l    #$120fc, d0
  00329e  323900013c18         move.w    $13c18.l, d1   ; g_13c18
  0032a4  b2710800             cmp.w     (a1, d0.l), d1
  0032a8  6746                 beq.b     $32f0
  0032aa  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0032b0  2250                 movea.l   (a0), a1
  0032b2  203c000120fc         move.l    #$120fc, d0
  0032b8  33f1080000013c18     move.w    (a1, d0.l), $13c18.l   ; g_13c18
  0032c0  4a7900013c18         tst.w     $13c18.l   ; g_13c18
  0032c6  671c                 beq.b     $32e4
  0032c8  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  0032ce  3f3900013c18         move.w    $13c18.l, -(a7)   ; g_13c18
  0032d4  61ffffffe656         bsr.l     $192c   ; LoadFGTileset
  0032da  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  0032e0  544f                 addq.w    #$2, a7
  0032e2  600c                 bra.b     $32f0
  0032e4  3f3c00b5             move.w    #$b5, -(a7)
  0032e8  61ffffffe642         bsr.l     $192c   ; LoadFGTileset
  0032ee  544f                 addq.w    #$2, a7
  0032f0  4e5e                 unlk      a6
  0032f2  4e75                 rts       

;-------------------------------------------------------------
; GenerateSprite   (seg 1 +003308, 2376 bytes)
  003308  4e56fffc             link.w    a6, #$fffc
  00330c  48e71e20             movem.l   d3-d6/a2, -(a7)
  003310  3a2e0008             move.w    $8(a6), d5
  003314  382e000a             move.w    $a(a6), d4
  003318  362e000c             move.w    $c(a6), d3
  00331c  3c2e000e             move.w    $e(a6), d6
  003320  3d45fffe             move.w    d5, -$2(a6)
  003324  3d44fffc             move.w    d4, -$4(a6)
  003328  0c43012c             cmpi.w    #$12c, d3
  00332c  6f2a                 ble.b     $3358
  00332e  0c430140             cmpi.w    #$140, d3
  003332  6c24                 bge.b     $3358
  003334  3d45fffe             move.w    d5, -$2(a6)
  003338  3d44fffc             move.w    d4, -$4(a6)
  00333c  594f                 subq.w    #$4, a7
  00333e  3f03                 move.w    d3, -(a7)
  003340  3f05                 move.w    d5, -(a7)
  003342  3f04                 move.w    d4, -(a7)
  003344  487900000668         pea.l     $668.l   ; SETUPDESKSPRITE
  00334a  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  003350  205f                 movea.l   (a7)+, a0
  003352  2448                 movea.l   a0, a2
  003354  600008f2             bra.w     $3c48
  003358  0c4301f4             cmpi.w    #$1f4, d3
  00335c  6d000180             blt.w     $34de
  003360  0c43025d             cmpi.w    #$25d, d3
  003364  6c000178             bge.w     $34de
  003368  3005                 move.w    d5, d0
  00336a  48c0                 ext.l     d0
  00336c  2200                 move.l    d0, d1
  00336e  e089                 lsr.l     #$8, d1
  003370  e089                 lsr.l     #$8, d1
  003372  e089                 lsr.l     #$8, d1
  003374  ee89                 lsr.l     #$7, d1
  003376  d280                 add.l     d0, d1
  003378  e281                 asr.l     #$1, d1
  00337a  d281                 add.l     d1, d1
  00337c  3d41fffe             move.w    d1, -$2(a6)
  003380  3004                 move.w    d4, d0
  003382  48c0                 ext.l     d0
  003384  2200                 move.l    d0, d1
  003386  e089                 lsr.l     #$8, d1
  003388  e089                 lsr.l     #$8, d1
  00338a  e089                 lsr.l     #$8, d1
  00338c  ee89                 lsr.l     #$7, d1
  00338e  d280                 add.l     d0, d1
  003390  e281                 asr.l     #$1, d1
  003392  d281                 add.l     d1, d1
  003394  3d41fffc             move.w    d1, -$4(a6)
  003398  3003                 move.w    d3, d0
  00339a  48c0                 ext.l     d0
  00339c  0480000001f4         subi.l    #$1f4, d0
  0033a2  6722                 beq.b     $33c6
  0033a4  5380                 subq.l    #$1, d0
  0033a6  671e                 beq.b     $33c6
  0033a8  048000000031         subi.l    #$31, d0
  0033ae  675c                 beq.b     $340c
  0033b0  5180                 subq.l    #$8, d0
  0033b2  5580                 subq.l    #$2, d0
  0033b4  6700009c             beq.w     $3452
  0033b8  048000000029         subi.l    #$29, d0
  0033be  670000d8             beq.w     $3498
  0033c2  60000884             bra.w     $3c48
  0033c6  487900000600         pea.l     $600.l   ; SETUPCOOLERSPRITE
  0033cc  42a7                 clr.l     -(a7)
  0033ce  3f06                 move.w    d6, -(a7)
  0033d0  3004                 move.w    d4, d0
  0033d2  48c0                 ext.l     d0
  0033d4  2200                 move.l    d0, d1
  0033d6  e089                 lsr.l     #$8, d1
  0033d8  e089                 lsr.l     #$8, d1
  0033da  e089                 lsr.l     #$8, d1
  0033dc  ee89                 lsr.l     #$7, d1
  0033de  d280                 add.l     d0, d1
  0033e0  e281                 asr.l     #$1, d1
  0033e2  d281                 add.l     d1, d1
  0033e4  3f01                 move.w    d1, -(a7)
  0033e6  3005                 move.w    d5, d0
  0033e8  48c0                 ext.l     d0
  0033ea  2200                 move.l    d0, d1
  0033ec  e089                 lsr.l     #$8, d1
  0033ee  e089                 lsr.l     #$8, d1
  0033f0  e089                 lsr.l     #$8, d1
  0033f2  ee89                 lsr.l     #$7, d1
  0033f4  d280                 add.l     d0, d1
  0033f6  e281                 asr.l     #$1, d1
  0033f8  d281                 add.l     d1, d1
  0033fa  3f01                 move.w    d1, -(a7)
  0033fc  3f03                 move.w    d3, -(a7)
  0033fe  61ff00003730         bsr.l     $6b30   ; AddIdleSprite
  003404  4fef0010             lea.l     $10(a7), a7
  003408  6000083e             bra.w     $3c48
  00340c  487900000490         pea.l     $490.l   ; SETUPBARRELSPRITE
  003412  42a7                 clr.l     -(a7)
  003414  3f06                 move.w    d6, -(a7)
  003416  3004                 move.w    d4, d0
  003418  48c0                 ext.l     d0
  00341a  2200                 move.l    d0, d1
  00341c  e089                 lsr.l     #$8, d1
  00341e  e089                 lsr.l     #$8, d1
  003420  e089                 lsr.l     #$8, d1
  003422  ee89                 lsr.l     #$7, d1
  003424  d280                 add.l     d0, d1
  003426  e281                 asr.l     #$1, d1
  003428  d281                 add.l     d1, d1
  00342a  3f01                 move.w    d1, -(a7)
  00342c  3005                 move.w    d5, d0
  00342e  48c0                 ext.l     d0
  003430  2200                 move.l    d0, d1
  003432  e089                 lsr.l     #$8, d1
  003434  e089                 lsr.l     #$8, d1
  003436  e089                 lsr.l     #$8, d1
  003438  ee89                 lsr.l     #$7, d1
  00343a  d280                 add.l     d0, d1
  00343c  e281                 asr.l     #$1, d1
  00343e  d281                 add.l     d1, d1
  003440  3f01                 move.w    d1, -(a7)
  003442  3f03                 move.w    d3, -(a7)
  003444  61ff000036ea         bsr.l     $6b30   ; AddIdleSprite
  00344a  4fef0010             lea.l     $10(a7), a7
  00344e  600007f8             bra.w     $3c48
  003452  4879000005a0         pea.l     $5a0.l   ; SETUPCHAIRSPRITE
  003458  42a7                 clr.l     -(a7)
  00345a  3f06                 move.w    d6, -(a7)
  00345c  3004                 move.w    d4, d0
  00345e  48c0                 ext.l     d0
  003460  2200                 move.l    d0, d1
  003462  e089                 lsr.l     #$8, d1
  003464  e089                 lsr.l     #$8, d1
  003466  e089                 lsr.l     #$8, d1
  003468  ee89                 lsr.l     #$7, d1
  00346a  d280                 add.l     d0, d1
  00346c  e281                 asr.l     #$1, d1
  00346e  d281                 add.l     d1, d1
  003470  3f01                 move.w    d1, -(a7)
  003472  3005                 move.w    d5, d0
  003474  48c0                 ext.l     d0
  003476  2200                 move.l    d0, d1
  003478  e089                 lsr.l     #$8, d1
  00347a  e089                 lsr.l     #$8, d1
  00347c  e089                 lsr.l     #$8, d1
  00347e  ee89                 lsr.l     #$7, d1
  003480  d280                 add.l     d0, d1
  003482  e281                 asr.l     #$1, d1
  003484  d281                 add.l     d1, d1
  003486  3f01                 move.w    d1, -(a7)
  003488  3f03                 move.w    d3, -(a7)
  00348a  61ff000036a4         bsr.l     $6b30   ; AddIdleSprite
  003490  4fef0010             lea.l     $10(a7), a7
  003494  600007b2             bra.w     $3c48
  003498  487900000848         pea.l     $848.l   ; SETUPPLANTSPRITE
  00349e  42a7                 clr.l     -(a7)
  0034a0  3f06                 move.w    d6, -(a7)
  0034a2  3004                 move.w    d4, d0
  0034a4  48c0                 ext.l     d0
  0034a6  2200                 move.l    d0, d1
  0034a8  e089                 lsr.l     #$8, d1
  0034aa  e089                 lsr.l     #$8, d1
  0034ac  e089                 lsr.l     #$8, d1
  0034ae  ee89                 lsr.l     #$7, d1
  0034b0  d280                 add.l     d0, d1
  0034b2  e281                 asr.l     #$1, d1
  0034b4  d281                 add.l     d1, d1
  0034b6  3f01                 move.w    d1, -(a7)
  0034b8  3005                 move.w    d5, d0
  0034ba  48c0                 ext.l     d0
  0034bc  2200                 move.l    d0, d1
  0034be  e089                 lsr.l     #$8, d1
  0034c0  e089                 lsr.l     #$8, d1
  0034c2  e089                 lsr.l     #$8, d1
  0034c4  ee89                 lsr.l     #$7, d1
  0034c6  d280                 add.l     d0, d1
  0034c8  e281                 asr.l     #$1, d1
  0034ca  d281                 add.l     d1, d1
  0034cc  3f01                 move.w    d1, -(a7)
  0034ce  3f03                 move.w    d3, -(a7)
  0034d0  61ff0000365e         bsr.l     $6b30   ; AddIdleSprite
  0034d6  4fef0010             lea.l     $10(a7), a7
  0034da  6000076c             bra.w     $3c48
  0034de  0c4302bc             cmpi.w    #$2bc, d3
  0034e2  6d24                 blt.b     $3508
  0034e4  0c430320             cmpi.w    #$320, d3
  0034e8  6c1e                 bge.b     $3508
  0034ea  4879000004e8         pea.l     $4e8.l   ; SETUPBONUSSPRITE
  0034f0  42a7                 clr.l     -(a7)
  0034f2  3f06                 move.w    d6, -(a7)
  0034f4  3f04                 move.w    d4, -(a7)
  0034f6  3f05                 move.w    d5, -(a7)
  0034f8  3f03                 move.w    d3, -(a7)
  0034fa  61ff00003634         bsr.l     $6b30   ; AddIdleSprite
  003500  4fef0010             lea.l     $10(a7), a7
  003504  60000742             bra.w     $3c48
  003508  0c430384             cmpi.w    #$384, d3
  00350c  6d50                 blt.b     $355e
  00350e  0c4303b6             cmpi.w    #$3b6, d3
  003512  6c4a                 bge.b     $355e
  003514  3005                 move.w    d5, d0
  003516  48c0                 ext.l     d0
  003518  2200                 move.l    d0, d1
  00351a  e089                 lsr.l     #$8, d1
  00351c  e089                 lsr.l     #$8, d1
  00351e  e089                 lsr.l     #$8, d1
  003520  ee89                 lsr.l     #$7, d1
  003522  d280                 add.l     d0, d1
  003524  e281                 asr.l     #$1, d1
  003526  d281                 add.l     d1, d1
  003528  3a01                 move.w    d1, d5
  00352a  3004                 move.w    d4, d0
  00352c  48c0                 ext.l     d0
  00352e  2200                 move.l    d0, d1
  003530  e089                 lsr.l     #$8, d1
  003532  e089                 lsr.l     #$8, d1
  003534  e089                 lsr.l     #$8, d1
  003536  ee89                 lsr.l     #$7, d1
  003538  d280                 add.l     d0, d1
  00353a  e281                 asr.l     #$1, d1
  00353c  d281                 add.l     d1, d1
  00353e  3801                 move.w    d1, d4
  003540  487900000690         pea.l     $690.l   ; SETUPDOORSPRITE
  003546  42a7                 clr.l     -(a7)
  003548  3f06                 move.w    d6, -(a7)
  00354a  3f04                 move.w    d4, -(a7)
  00354c  3f05                 move.w    d5, -(a7)
  00354e  3f03                 move.w    d3, -(a7)
  003550  61ff000035de         bsr.l     $6b30   ; AddIdleSprite
  003556  4fef0010             lea.l     $10(a7), a7
  00355a  600006ec             bra.w     $3c48
  00355e  0c4303b6             cmpi.w    #$3b6, d3
  003562  6d5c                 blt.b     $35c0
  003564  0c4303e8             cmpi.w    #$3e8, d3
  003568  6c56                 bge.b     $35c0
  00356a  3005                 move.w    d5, d0
  00356c  48c0                 ext.l     d0
  00356e  2200                 move.l    d0, d1
  003570  e089                 lsr.l     #$8, d1
  003572  e089                 lsr.l     #$8, d1
  003574  e089                 lsr.l     #$8, d1
  003576  ee89                 lsr.l     #$7, d1
  003578  d280                 add.l     d0, d1
  00357a  e281                 asr.l     #$1, d1
  00357c  d281                 add.l     d1, d1
  00357e  3a01                 move.w    d1, d5
  003580  3004                 move.w    d4, d0
  003582  48c0                 ext.l     d0
  003584  2200                 move.l    d0, d1
  003586  e089                 lsr.l     #$8, d1
  003588  e089                 lsr.l     #$8, d1
  00358a  e089                 lsr.l     #$8, d1
  00358c  ee89                 lsr.l     #$7, d1
  00358e  d280                 add.l     d0, d1
  003590  e281                 asr.l     #$1, d1
  003592  d281                 add.l     d1, d1
  003594  0c4303b7             cmpi.w    #$3b7, d3
  003598  57c0                 seq.b     d0
  00359a  4400                 neg.b     d0
  00359c  49c0                 extb.l    d0
  00359e  d081                 add.l     d1, d0
  0035a0  3800                 move.w    d0, d4
  0035a2  487900000948         pea.l     $948.l   ; SETUPSLIDINGDOORSPRITE
  0035a8  42a7                 clr.l     -(a7)
  0035aa  3f06                 move.w    d6, -(a7)
  0035ac  3f04                 move.w    d4, -(a7)
  0035ae  3f05                 move.w    d5, -(a7)
  0035b0  3f03                 move.w    d3, -(a7)
  0035b2  61ff0000357c         bsr.l     $6b30   ; AddIdleSprite
  0035b8  4fef0010             lea.l     $10(a7), a7
  0035bc  6000068a             bra.w     $3c48
  0035c0  0c4303e8             cmpi.w    #$3e8, d3
  0035c4  6d0000a8             blt.w     $366e
  0035c8  0c43041a             cmpi.w    #$41a, d3
  0035cc  6c0000a0             bge.w     $366e
  0035d0  3d45fffe             move.w    d5, -$2(a6)
  0035d4  3d44fffc             move.w    d4, -$4(a6)
  0035d8  3003                 move.w    d3, d0
  0035da  48c0                 ext.l     d0
  0035dc  0480000003fb         subi.l    #$3fb, d0
  0035e2  6714                 beq.b     $35f8
  0035e4  5180                 subq.l    #$8, d0
  0035e6  5580                 subq.l    #$2, d0
  0035e8  6724                 beq.b     $360e
  0035ea  5180                 subq.l    #$8, d0
  0035ec  5580                 subq.l    #$2, d0
  0035ee  6734                 beq.b     $3624
  0035f0  5180                 subq.l    #$8, d0
  0035f2  5580                 subq.l    #$2, d0
  0035f4  6744                 beq.b     $363a
  0035f6  6058                 bra.b     $3650
  0035f8  2f390000f72c         move.l    $f72c.l, -(a7)   ; g_f72c
  0035fe  2f2efffc             move.l    -$4(a6), -(a7)
  003602  61ff00004798         bsr.l     $7d9c   ; AddBGProp
  003608  504f                 addq.w    #$8, a7
  00360a  6000063c             bra.w     $3c48
  00360e  2f390000f730         move.l    $f730.l, -(a7)   ; g_f730
  003614  2f2efffc             move.l    -$4(a6), -(a7)
  003618  61ff00004782         bsr.l     $7d9c   ; AddBGProp
  00361e  504f                 addq.w    #$8, a7
  003620  60000626             bra.w     $3c48
  003624  2f390000f734         move.l    $f734.l, -(a7)   ; g_f734
  00362a  2f2efffc             move.l    -$4(a6), -(a7)
  00362e  61ff0000476c         bsr.l     $7d9c   ; AddBGProp
  003634  504f                 addq.w    #$8, a7
  003636  60000610             bra.w     $3c48
  00363a  2f390000f738         move.l    $f738.l, -(a7)   ; g_f738
  003640  2f2efffc             move.l    -$4(a6), -(a7)
  003644  61ff00004756         bsr.l     $7d9c   ; AddBGProp
  00364a  504f                 addq.w    #$8, a7
  00364c  600005fa             bra.w     $3c48
  003650  487900000650         pea.l     $650.l   ; SETUPDARTENEMYSPRITE
  003656  42a7                 clr.l     -(a7)
  003658  3f06                 move.w    d6, -(a7)
  00365a  3f04                 move.w    d4, -(a7)
  00365c  3f05                 move.w    d5, -(a7)
  00365e  3f03                 move.w    d3, -(a7)
  003660  61ff000034ce         bsr.l     $6b30   ; AddIdleSprite
  003666  4fef0010             lea.l     $10(a7), a7
  00366a  600005dc             bra.w     $3c48
  00366e  0c43044c             cmpi.w    #$44c, d3
  003672  6d24                 blt.b     $3698
  003674  0c430514             cmpi.w    #$514, d3
  003678  6c1e                 bge.b     $3698
  00367a  487900000928         pea.l     $928.l   ; SETUPSCIENTISTSPRITE
  003680  42a7                 clr.l     -(a7)
  003682  3f06                 move.w    d6, -(a7)
  003684  3f04                 move.w    d4, -(a7)
  003686  3f05                 move.w    d5, -(a7)
  003688  3f03                 move.w    d3, -(a7)
  00368a  61ff000034a4         bsr.l     $6b30   ; AddIdleSprite
  003690  4fef0010             lea.l     $10(a7), a7
  003694  600005b2             bra.w     $3c48
  003698  0c430514             cmpi.w    #$514, d3
  00369c  6d52                 blt.b     $36f0
  00369e  0c4305aa             cmpi.w    #$5aa, d3
  0036a2  6c4c                 bge.b     $36f0
  0036a4  3005                 move.w    d5, d0
  0036a6  48c0                 ext.l     d0
  0036a8  2200                 move.l    d0, d1
  0036aa  e089                 lsr.l     #$8, d1
  0036ac  e089                 lsr.l     #$8, d1
  0036ae  e089                 lsr.l     #$8, d1
  0036b0  ee89                 lsr.l     #$7, d1
  0036b2  d280                 add.l     d0, d1
  0036b4  e281                 asr.l     #$1, d1
  0036b6  d281                 add.l     d1, d1
  0036b8  5281                 addq.l    #$1, d1
  0036ba  3a01                 move.w    d1, d5
  0036bc  3004                 move.w    d4, d0
  0036be  48c0                 ext.l     d0
  0036c0  2200                 move.l    d0, d1
  0036c2  e089                 lsr.l     #$8, d1
  0036c4  e089                 lsr.l     #$8, d1
  0036c6  e089                 lsr.l     #$8, d1
  0036c8  ee89                 lsr.l     #$7, d1
  0036ca  d280                 add.l     d0, d1
  0036cc  e281                 asr.l     #$1, d1
  0036ce  d281                 add.l     d1, d1
  0036d0  3801                 move.w    d1, d4
  0036d2  487900000620         pea.l     $620.l   ; SETUPCOWORKERSPRITE
  0036d8  42a7                 clr.l     -(a7)
  0036da  3f06                 move.w    d6, -(a7)
  0036dc  3f04                 move.w    d4, -(a7)
  0036de  3f05                 move.w    d5, -(a7)
  0036e0  3f03                 move.w    d3, -(a7)
  0036e2  61ff0000344c         bsr.l     $6b30   ; AddIdleSprite
  0036e8  4fef0010             lea.l     $10(a7), a7
  0036ec  6000055a             bra.w     $3c48
  0036f0  0c430640             cmpi.w    #$640, d3
  0036f4  6d0000ae             blt.w     $37a4
  0036f8  0c4306a4             cmpi.w    #$6a4, d3
  0036fc  6c0000a6             bge.w     $37a4
  003700  3003                 move.w    d3, d0
  003702  48c0                 ext.l     d0
  003704  048000000641         subi.l    #$641, d0
  00370a  6720                 beq.b     $372c
  00370c  5180                 subq.l    #$8, d0
  00370e  673c                 beq.b     $374c
  003710  5580                 subq.l    #$2, d0
  003712  6718                 beq.b     $372c
  003714  5180                 subq.l    #$8, d0
  003716  674a                 beq.b     $3762
  003718  5580                 subq.l    #$2, d0
  00371a  6710                 beq.b     $372c
  00371c  5180                 subq.l    #$8, d0
  00371e  6758                 beq.b     $3778
  003720  5580                 subq.l    #$2, d0
  003722  6708                 beq.b     $372c
  003724  5180                 subq.l    #$8, d0
  003726  6766                 beq.b     $378e
  003728  6000051e             bra.w     $3c48
  00372c  594f                 subq.w    #$4, a7
  00372e  3f03                 move.w    d3, -(a7)
  003730  3f05                 move.w    d5, -(a7)
  003732  3f04                 move.w    d4, -(a7)
  003734  4879000007f0         pea.l     $7f0.l   ; SETUPMAILGUYSPRITE
  00373a  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  003740  205f                 movea.l   (a7)+, a0
  003742  2448                 movea.l   a0, a2
  003744  35460068             move.w    d6, $68(a2)
  003748  600004fe             bra.w     $3c48
  00374c  2f390000f74c         move.l    $f74c.l, -(a7)   ; g_f74c
  003752  2f2efffc             move.l    -$4(a6), -(a7)
  003756  61ff000046c0         bsr.l     $7e18   ; AddFGProp
  00375c  504f                 addq.w    #$8, a7
  00375e  600004e8             bra.w     $3c48
  003762  2f390000f750         move.l    $f750.l, -(a7)   ; g_f750
  003768  2f2efffc             move.l    -$4(a6), -(a7)
  00376c  61ff000046aa         bsr.l     $7e18   ; AddFGProp
  003772  504f                 addq.w    #$8, a7
  003774  600004d2             bra.w     $3c48
  003778  2f390000f754         move.l    $f754.l, -(a7)   ; g_f754
  00377e  2f2efffc             move.l    -$4(a6), -(a7)
  003782  61ff00004694         bsr.l     $7e18   ; AddFGProp
  003788  504f                 addq.w    #$8, a7
  00378a  600004bc             bra.w     $3c48
  00378e  2f390000f758         move.l    $f758.l, -(a7)   ; g_f758
  003794  2f2efffc             move.l    -$4(a6), -(a7)
  003798  61ff0000467e         bsr.l     $7e18   ; AddFGProp
  00379e  504f                 addq.w    #$8, a7
  0037a0  600004a6             bra.w     $3c48
  0037a4  0c4306a4             cmpi.w    #$6a4, d3
  0037a8  6d24                 blt.b     $37ce
  0037aa  0c430708             cmpi.w    #$708, d3
  0037ae  6c1e                 bge.b     $37ce
  0037b0  4879000004c0         pea.l     $4c0.l   ; SETUPBLOBSPRITE
  0037b6  42a7                 clr.l     -(a7)
  0037b8  3f06                 move.w    d6, -(a7)
  0037ba  3f04                 move.w    d4, -(a7)
  0037bc  3f05                 move.w    d5, -(a7)
  0037be  3f03                 move.w    d3, -(a7)
  0037c0  61ff0000336e         bsr.l     $6b30   ; AddIdleSprite
  0037c6  4fef0010             lea.l     $10(a7), a7
  0037ca  6000047c             bra.w     $3c48
  0037ce  0c430708             cmpi.w    #$708, d3
  0037d2  6d24                 blt.b     $37f8
  0037d4  0c43073a             cmpi.w    #$73a, d3
  0037d8  6c1e                 bge.b     $37f8
  0037da  4879000008f8         pea.l     $8f8.l   ; SETUPROBOTSPRITE
  0037e0  42a7                 clr.l     -(a7)
  0037e2  3f06                 move.w    d6, -(a7)
  0037e4  3f04                 move.w    d4, -(a7)
  0037e6  3f05                 move.w    d5, -(a7)
  0037e8  3f03                 move.w    d3, -(a7)
  0037ea  61ff00003344         bsr.l     $6b30   ; AddIdleSprite
  0037f0  4fef0010             lea.l     $10(a7), a7
  0037f4  60000452             bra.w     $3c48
  0037f8  0c43073a             cmpi.w    #$73a, d3
  0037fc  6d26                 blt.b     $3824
  0037fe  0c43076c             cmpi.w    #$76c, d3
  003802  6c20                 bge.b     $3824
  003804  594f                 subq.w    #$4, a7
  003806  3f03                 move.w    d3, -(a7)
  003808  3f05                 move.w    d5, -(a7)
  00380a  3f04                 move.w    d4, -(a7)
  00380c  4879000008c0         pea.l     $8c0.l   ; SETUPREVERSORSPRITE
  003812  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  003818  205f                 movea.l   (a7)+, a0
  00381a  2448                 movea.l   a0, a2
  00381c  35460068             move.w    d6, $68(a2)
  003820  60000426             bra.w     $3c48
  003824  0c43076c             cmpi.w    #$76c, d3
  003828  6d24                 blt.b     $384e
  00382a  0c4307d0             cmpi.w    #$7d0, d3
  00382e  6c1e                 bge.b     $384e
  003830  487900000990         pea.l     $990.l   ; SETUPTURRETSPRITE
  003836  42a7                 clr.l     -(a7)
  003838  3f06                 move.w    d6, -(a7)
  00383a  3f04                 move.w    d4, -(a7)
  00383c  3f05                 move.w    d5, -(a7)
  00383e  3f03                 move.w    d3, -(a7)
  003840  61ff000032ee         bsr.l     $6b30   ; AddIdleSprite
  003846  4fef0010             lea.l     $10(a7), a7
  00384a  600003fc             bra.w     $3c48
  00384e  0c4307d0             cmpi.w    #$7d0, d3
  003852  6d24                 blt.b     $3878
  003854  0c430834             cmpi.w    #$834, d3
  003858  6c1e                 bge.b     $3878
  00385a  4879000008f8         pea.l     $8f8.l   ; SETUPROBOTSPRITE
  003860  42a7                 clr.l     -(a7)
  003862  3f06                 move.w    d6, -(a7)
  003864  3f04                 move.w    d4, -(a7)
  003866  3f05                 move.w    d5, -(a7)
  003868  3f03                 move.w    d3, -(a7)
  00386a  61ff000032c4         bsr.l     $6b30   ; AddIdleSprite
  003870  4fef0010             lea.l     $10(a7), a7
  003874  600003d2             bra.w     $3c48
  003878  0c430898             cmpi.w    #$898, d3
  00387c  6d24                 blt.b     $38a2
  00387e  0c4308fc             cmpi.w    #$8fc, d3
  003882  6c1e                 bge.b     $38a2
  003884  487900000538         pea.l     $538.l   ; SETUPBOSSSPRITE
  00388a  42a7                 clr.l     -(a7)
  00388c  3f06                 move.w    d6, -(a7)
  00388e  3f04                 move.w    d4, -(a7)
  003890  3f05                 move.w    d5, -(a7)
  003892  3f03                 move.w    d3, -(a7)
  003894  61ff0000329a         bsr.l     $6b30   ; AddIdleSprite
  00389a  4fef0010             lea.l     $10(a7), a7
  00389e  600003a8             bra.w     $3c48
  0038a2  0c4308fd             cmpi.w    #$8fd, d3
  0038a6  6d26                 blt.b     $38ce
  0038a8  0c430900             cmpi.w    #$900, d3
  0038ac  6e20                 bgt.b     $38ce
  0038ae  594f                 subq.w    #$4, a7
  0038b0  3f03                 move.w    d3, -(a7)
  0038b2  3f05                 move.w    d5, -(a7)
  0038b4  3f04                 move.w    d4, -(a7)
  0038b6  4879000005e0         pea.l     $5e0.l   ; SETUPCOLLIDERSPRITE
  0038bc  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  0038c2  205f                 movea.l   (a7)+, a0
  0038c4  2448                 movea.l   a0, a2
  0038c6  35460068             move.w    d6, $68(a2)
  0038ca  6000037c             bra.w     $3c48
  0038ce  0c430bb8             cmpi.w    #$bb8, d3
  0038d2  6d6c                 blt.b     $3940
  0038d4  0c430bba             cmpi.w    #$bba, d3
  0038d8  6c66                 bge.b     $3940
  0038da  3005                 move.w    d5, d0
  0038dc  48c0                 ext.l     d0
  0038de  2200                 move.l    d0, d1
  0038e0  e089                 lsr.l     #$8, d1
  0038e2  e089                 lsr.l     #$8, d1
  0038e4  e089                 lsr.l     #$8, d1
  0038e6  ee89                 lsr.l     #$7, d1
  0038e8  d280                 add.l     d0, d1
  0038ea  e281                 asr.l     #$1, d1
  0038ec  d281                 add.l     d1, d1
  0038ee  3a01                 move.w    d1, d5
  0038f0  3004                 move.w    d4, d0
  0038f2  48c0                 ext.l     d0
  0038f4  2200                 move.l    d0, d1
  0038f6  e089                 lsr.l     #$8, d1
  0038f8  e089                 lsr.l     #$8, d1
  0038fa  e089                 lsr.l     #$8, d1
  0038fc  ee89                 lsr.l     #$7, d1
  0038fe  d280                 add.l     d0, d1
  003900  e281                 asr.l     #$1, d1
  003902  d281                 add.l     d1, d1
  003904  3801                 move.w    d1, d4
  003906  3d45fffe             move.w    d5, -$2(a6)
  00390a  3d44fffc             move.w    d4, -$4(a6)
  00390e  3003                 move.w    d3, d0
  003910  48c0                 ext.l     d0
  003912  048000000bb9         subi.l    #$bb9, d0
  003918  6704                 beq.b     $391e
  00391a  6000032c             bra.w     $3c48
  00391e  487900000788         pea.l     $788.l   ; SETUPHAZARDSPRITE
  003924  2f390000f728         move.l    $f728.l, -(a7)   ; g_f728
  00392a  3f06                 move.w    d6, -(a7)
  00392c  3f04                 move.w    d4, -(a7)
  00392e  3f05                 move.w    d5, -(a7)
  003930  3f03                 move.w    d3, -(a7)
  003932  61ff000031fc         bsr.l     $6b30   ; AddIdleSprite
  003938  4fef0010             lea.l     $10(a7), a7
  00393c  6000030a             bra.w     $3c48
  003940  0c430c1c             cmpi.w    #$c1c, d3
  003944  6718                 beq.b     $395e
  003946  0c430c1d             cmpi.w    #$c1d, d3
  00394a  6712                 beq.b     $395e
  00394c  0c432454             cmpi.w    #$2454, d3
  003950  670c                 beq.b     $395e
  003952  0c4323f0             cmpi.w    #$23f0, d3
  003956  6706                 beq.b     $395e
  003958  0c4323ef             cmpi.w    #$23ef, d3
  00395c  661e                 bne.b     $397c
  00395e  4879000005e0         pea.l     $5e0.l   ; SETUPCOLLIDERSPRITE
  003964  42a7                 clr.l     -(a7)
  003966  3f06                 move.w    d6, -(a7)
  003968  3f04                 move.w    d4, -(a7)
  00396a  3f05                 move.w    d5, -(a7)
  00396c  3f03                 move.w    d3, -(a7)
  00396e  61ff000031c0         bsr.l     $6b30   ; AddIdleSprite
  003974  4fef0010             lea.l     $10(a7), a7
  003978  600002ce             bra.w     $3c48
  00397c  0c430f3c             cmpi.w    #$f3c, d3
  003980  6d66                 blt.b     $39e8
  003982  0c430fa0             cmpi.w    #$fa0, d3
  003986  6c60                 bge.b     $39e8
  003988  3005                 move.w    d5, d0
  00398a  48c0                 ext.l     d0
  00398c  2200                 move.l    d0, d1
  00398e  e089                 lsr.l     #$8, d1
  003990  e089                 lsr.l     #$8, d1
  003992  e089                 lsr.l     #$8, d1
  003994  ee89                 lsr.l     #$7, d1
  003996  d280                 add.l     d0, d1
  003998  e281                 asr.l     #$1, d1
  00399a  d281                 add.l     d1, d1
  00399c  3a01                 move.w    d1, d5
  00399e  0c430f41             cmpi.w    #$f41, d3
  0039a2  670a                 beq.b     $39ae
  0039a4  0c430f4b             cmpi.w    #$f4b, d3
  0039a8  6704                 beq.b     $39ae
  0039aa  7000                 moveq     #$0, d0
  0039ac  6002                 bra.b     $39b0
  0039ae  7001                 moveq     #$1, d0
  0039b0  3204                 move.w    d4, d1
  0039b2  48c1                 ext.l     d1
  0039b4  2401                 move.l    d1, d2
  0039b6  e08a                 lsr.l     #$8, d2
  0039b8  e08a                 lsr.l     #$8, d2
  0039ba  e08a                 lsr.l     #$8, d2
  0039bc  ee8a                 lsr.l     #$7, d2
  0039be  d481                 add.l     d1, d2
  0039c0  e282                 asr.l     #$1, d2
  0039c2  d482                 add.l     d2, d2
  0039c4  d480                 add.l     d0, d2
  0039c6  5382                 subq.l    #$1, d2
  0039c8  3802                 move.w    d2, d4
  0039ca  487900000768         pea.l     $768.l   ; SETUPGRATESPRITE
  0039d0  42a7                 clr.l     -(a7)
  0039d2  3f06                 move.w    d6, -(a7)
  0039d4  3f04                 move.w    d4, -(a7)
  0039d6  3f05                 move.w    d5, -(a7)
  0039d8  3f03                 move.w    d3, -(a7)
  0039da  61ff00003154         bsr.l     $6b30   ; AddIdleSprite
  0039e0  4fef0010             lea.l     $10(a7), a7
  0039e4  60000262             bra.w     $3c48
  0039e8  0c431068             cmpi.w    #$1068, d3
  0039ec  6d0000e2             blt.w     $3ad0
  0039f0  0c4310cc             cmpi.w    #$10cc, d3
  0039f4  6c0000da             bge.w     $3ad0
  0039f8  3005                 move.w    d5, d0
  0039fa  48c0                 ext.l     d0
  0039fc  2200                 move.l    d0, d1
  0039fe  e089                 lsr.l     #$8, d1
  003a00  e089                 lsr.l     #$8, d1
  003a02  e089                 lsr.l     #$8, d1
  003a04  ee89                 lsr.l     #$7, d1
  003a06  d280                 add.l     d0, d1
  003a08  e281                 asr.l     #$1, d1
  003a0a  d281                 add.l     d1, d1
  003a0c  3a01                 move.w    d1, d5
  003a0e  3004                 move.w    d4, d0
  003a10  48c0                 ext.l     d0
  003a12  2200                 move.l    d0, d1
  003a14  e089                 lsr.l     #$8, d1
  003a16  e089                 lsr.l     #$8, d1
  003a18  e089                 lsr.l     #$8, d1
  003a1a  ee89                 lsr.l     #$7, d1
  003a1c  d280                 add.l     d0, d1
  003a1e  e281                 asr.l     #$1, d1
  003a20  d281                 add.l     d1, d1
  003a22  3801                 move.w    d1, d4
  003a24  3d45fffe             move.w    d5, -$2(a6)
  003a28  3d44fffc             move.w    d4, -$4(a6)
  003a2c  3003                 move.w    d3, d0
  003a2e  48c0                 ext.l     d0
  003a30  048000001069         subi.l    #$1069, d0
  003a36  6710                 beq.b     $3a48
  003a38  5380                 subq.l    #$1, d0
  003a3a  672e                 beq.b     $3a6a
  003a3c  5380                 subq.l    #$1, d0
  003a3e  674c                 beq.b     $3a8c
  003a40  5380                 subq.l    #$1, d0
  003a42  676a                 beq.b     $3aae
  003a44  60000202             bra.w     $3c48
  003a48  487900000718         pea.l     $718.l   ; SETUPFIREPIPESPRITE
  003a4e  2f390000f73c         move.l    $f73c.l, -(a7)   ; g_f73c
  003a54  3f06                 move.w    d6, -(a7)
  003a56  3f04                 move.w    d4, -(a7)
  003a58  3f05                 move.w    d5, -(a7)
  003a5a  3f03                 move.w    d3, -(a7)
  003a5c  61ff000030d2         bsr.l     $6b30   ; AddIdleSprite
  003a62  4fef0010             lea.l     $10(a7), a7
  003a66  600001e0             bra.w     $3c48
  003a6a  487900000718         pea.l     $718.l   ; SETUPFIREPIPESPRITE
  003a70  2f390000f740         move.l    $f740.l, -(a7)   ; g_f740
  003a76  3f06                 move.w    d6, -(a7)
  003a78  3f04                 move.w    d4, -(a7)
  003a7a  3f05                 move.w    d5, -(a7)
  003a7c  3f03                 move.w    d3, -(a7)
  003a7e  61ff000030b0         bsr.l     $6b30   ; AddIdleSprite
  003a84  4fef0010             lea.l     $10(a7), a7
  003a88  600001be             bra.w     $3c48
  003a8c  487900000718         pea.l     $718.l   ; SETUPFIREPIPESPRITE
  003a92  2f390000f744         move.l    $f744.l, -(a7)   ; g_f744
  003a98  3f06                 move.w    d6, -(a7)
  003a9a  3f04                 move.w    d4, -(a7)
  003a9c  3f05                 move.w    d5, -(a7)
  003a9e  3f03                 move.w    d3, -(a7)
  003aa0  61ff0000308e         bsr.l     $6b30   ; AddIdleSprite
  003aa6  4fef0010             lea.l     $10(a7), a7
  003aaa  6000019c             bra.w     $3c48
  003aae  487900000718         pea.l     $718.l   ; SETUPFIREPIPESPRITE
  003ab4  2f390000f748         move.l    $f748.l, -(a7)   ; g_f748
  003aba  3f06                 move.w    d6, -(a7)
  003abc  3f04                 move.w    d4, -(a7)
  003abe  3f05                 move.w    d5, -(a7)
  003ac0  3f03                 move.w    d3, -(a7)
  003ac2  61ff0000306c         bsr.l     $6b30   ; AddIdleSprite
  003ac8  4fef0010             lea.l     $10(a7), a7
  003acc  6000017a             bra.w     $3c48
  003ad0  0c431388             cmpi.w    #$1388, d3
  003ad4  6d24                 blt.b     $3afa
  003ad6  0c431770             cmpi.w    #$1770, d3
  003ada  6c1e                 bge.b     $3afa
  003adc  487900000740         pea.l     $740.l   ; SETUPGHOSTSPRITE
  003ae2  42a7                 clr.l     -(a7)
  003ae4  3f06                 move.w    d6, -(a7)
  003ae6  3f04                 move.w    d4, -(a7)
  003ae8  3f05                 move.w    d5, -(a7)
  003aea  3f03                 move.w    d3, -(a7)
  003aec  61ff00003042         bsr.l     $6b30   ; AddIdleSprite
  003af2  4fef0010             lea.l     $10(a7), a7
  003af6  60000150             bra.w     $3c48
  003afa  0c431770             cmpi.w    #$1770, d3
  003afe  6d26                 blt.b     $3b26
  003b00  0c4317d4             cmpi.w    #$17d4, d3
  003b04  6c20                 bge.b     $3b26
  003b06  594f                 subq.w    #$4, a7
  003b08  3f03                 move.w    d3, -(a7)
  003b0a  3f05                 move.w    d5, -(a7)
  003b0c  3f04                 move.w    d4, -(a7)
  003b0e  487900000508         pea.l     $508.l   ; SETUPBOULDERSPRITE
  003b14  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  003b1a  205f                 movea.l   (a7)+, a0
  003b1c  2448                 movea.l   a0, a2
  003b1e  35460068             move.w    d6, $68(a2)
  003b22  60000124             bra.w     $3c48
  003b26  0c4326ac             cmpi.w    #$26ac, d3
  003b2a  6d24                 blt.b     $3b50
  003b2c  0c4326b6             cmpi.w    #$26b6, d3
  003b30  6c1e                 bge.b     $3b50
  003b32  487900000968         pea.l     $968.l   ; SETUPSTAIRSSPRITE
  003b38  42a7                 clr.l     -(a7)
  003b3a  3f06                 move.w    d6, -(a7)
  003b3c  3f04                 move.w    d4, -(a7)
  003b3e  3f05                 move.w    d5, -(a7)
  003b40  3f03                 move.w    d3, -(a7)
  003b42  61ff00002fec         bsr.l     $6b30   ; AddIdleSprite
  003b48  4fef0010             lea.l     $10(a7), a7
  003b4c  600000fa             bra.w     $3c48
  003b50  0c43251c             cmpi.w    #$251c, d3
  003b54  6d24                 blt.b     $3b7a
  003b56  0c432580             cmpi.w    #$2580, d3
  003b5a  6c1e                 bge.b     $3b7a
  003b5c  487900000570         pea.l     $570.l   ; SETUPBUTTONSPRITE
  003b62  42a7                 clr.l     -(a7)
  003b64  3f06                 move.w    d6, -(a7)
  003b66  3f04                 move.w    d4, -(a7)
  003b68  3f05                 move.w    d5, -(a7)
  003b6a  3f03                 move.w    d3, -(a7)
  003b6c  61ff00002fc2         bsr.l     $6b30   ; AddIdleSprite
  003b72  4fef0010             lea.l     $10(a7), a7
  003b76  600000d0             bra.w     $3c48
  003b7a  0c4325e4             cmpi.w    #$25e4, d3
  003b7e  6d24                 blt.b     $3ba4
  003b80  0c432648             cmpi.w    #$2648, d3
  003b84  6c1e                 bge.b     $3ba4
  003b86  487900000898         pea.l     $898.l   ; SETUPRAMPSPRITE
  003b8c  42a7                 clr.l     -(a7)
  003b8e  3f06                 move.w    d6, -(a7)
  003b90  3f04                 move.w    d4, -(a7)
  003b92  3f05                 move.w    d5, -(a7)
  003b94  3f03                 move.w    d3, -(a7)
  003b96  61ff00002f98         bsr.l     $6b30   ; AddIdleSprite
  003b9c  4fef0010             lea.l     $10(a7), a7
  003ba0  600000a6             bra.w     $3c48
  003ba4  0c432580             cmpi.w    #$2580, d3
  003ba8  6712                 beq.b     $3bbc
  003baa  0c432648             cmpi.w    #$2648, d3
  003bae  670c                 beq.b     $3bbc
  003bb0  0c4324b8             cmpi.w    #$24b8, d3
  003bb4  6f22                 ble.b     $3bd8
  003bb6  0c43251c             cmpi.w    #$251c, d3
  003bba  6c1c                 bge.b     $3bd8
  003bbc  4879000005e0         pea.l     $5e0.l   ; SETUPCOLLIDERSPRITE
  003bc2  42a7                 clr.l     -(a7)
  003bc4  3f06                 move.w    d6, -(a7)
  003bc6  3f04                 move.w    d4, -(a7)
  003bc8  3f05                 move.w    d5, -(a7)
  003bca  3f03                 move.w    d3, -(a7)
  003bcc  61ff00002f62         bsr.l     $6b30   ; AddIdleSprite
  003bd2  4fef0010             lea.l     $10(a7), a7
  003bd6  6070                 bra.b     $3c48
  003bd8  0c432706             cmpi.w    #$2706, d3
  003bdc  6d22                 blt.b     $3c00
  003bde  0c432710             cmpi.w    #$2710, d3
  003be2  6c1c                 bge.b     $3c00
  003be4  4879000006f8         pea.l     $6f8.l   ; SETUPEXITSPRITE
  003bea  42a7                 clr.l     -(a7)
  003bec  3f06                 move.w    d6, -(a7)
  003bee  3f04                 move.w    d4, -(a7)
  003bf0  3f05                 move.w    d5, -(a7)
  003bf2  3f03                 move.w    d3, -(a7)
  003bf4  61ff00002f3a         bsr.l     $6b30   ; AddIdleSprite
  003bfa  4fef0010             lea.l     $10(a7), a7
  003bfe  6048                 bra.b     $3c48
  003c00  0c432af8             cmpi.w    #$2af8, d3
  003c04  6f22                 ble.b     $3c28
  003c06  0c434e20             cmpi.w    #$4e20, d3
  003c0a  6c1c                 bge.b     $3c28
  003c0c  4879000007c8         pea.l     $7c8.l   ; SETUPITEMSPRITE
  003c12  42a7                 clr.l     -(a7)
  003c14  3f06                 move.w    d6, -(a7)
  003c16  3f04                 move.w    d4, -(a7)
  003c18  3f05                 move.w    d5, -(a7)
  003c1a  3f03                 move.w    d3, -(a7)
  003c1c  61ff00002f12         bsr.l     $6b30   ; AddIdleSprite
  003c22  4fef0010             lea.l     $10(a7), a7
  003c26  6020                 bra.b     $3c48
  003c28  0c435208             cmpi.w    #$5208, d3
  003c2c  6d1a                 blt.b     $3c48
  003c2e  487900000820         pea.l     $820.l   ; SETUPMESSAGESPRITE
  003c34  42a7                 clr.l     -(a7)
  003c36  3f06                 move.w    d6, -(a7)
  003c38  3f04                 move.w    d4, -(a7)
  003c3a  3f05                 move.w    d5, -(a7)
  003c3c  3f03                 move.w    d3, -(a7)
  003c3e  61ff00002ef0         bsr.l     $6b30   ; AddIdleSprite
  003c44  4fef0010             lea.l     $10(a7), a7
  003c48  4cdf0478             movem.l   (a7)+, d3-d6/a2
  003c4c  4e5e                 unlk      a6
  003c4e  4e75                 rts       

;-------------------------------------------------------------
; LoadLevelPhysics   (seg 1 +003c62, 180 bytes)
  003c62  4e560000             link.w    a6, #$0
  003c66  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003c6c  2250                 movea.l   (a0), a1
  003c6e  203c00012100         move.l    #$12100, d0
  003c74  4a710800             tst.w     (a1, d0.l)
  003c78  6770                 beq.b     $3cea
  003c7a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003c80  2250                 movea.l   (a0), a1
  003c82  203c00012102         move.l    #$12102, d0
  003c88  33f1080000007e1e     move.w    (a1, d0.l), $7e1e.l   ; g_7e1e
  003c90  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003c96  2250                 movea.l   (a0), a1
  003c98  203c00012104         move.l    #$12104, d0
  003c9e  33f1080000007e20     move.w    (a1, d0.l), $7e20.l   ; g_7e20
  003ca6  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003cac  2250                 movea.l   (a0), a1
  003cae  203c00012106         move.l    #$12106, d0
  003cb4  33f1080000007e22     move.w    (a1, d0.l), $7e22.l   ; g_7e22
  003cbc  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003cc2  2250                 movea.l   (a0), a1
  003cc4  203c00012108         move.l    #$12108, d0
  003cca  33f1080000007e24     move.w    (a1, d0.l), $7e24.l   ; g_7e24
  003cd2  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003cd8  2250                 movea.l   (a0), a1
  003cda  203c0001210a         move.l    #$1210a, d0
  003ce0  33f1080000007e26     move.w    (a1, d0.l), $7e26.l   ; g_7e26
  003ce8  6028                 bra.b     $3d12
  003cea  33fc003200007e1e     move.w    #$32, $7e1e.l   ; g_7e1e
  003cf2  33fc004600007e20     move.w    #$46, $7e20.l   ; g_7e20
  003cfa  33fc00f500007e22     move.w    #$f5, $7e22.l   ; g_7e22
  003d02  33fc00fc00007e24     move.w    #$fc, $7e24.l   ; g_7e24
  003d0a  33fc009600007e26     move.w    #$96, $7e26.l   ; g_7e26
  003d12  4e5e                 unlk      a6
  003d14  4e75                 rts       

;-------------------------------------------------------------
; LoadLevelSounds   (seg 1 +003d2a, 82 bytes)
  003d2a  4e560000             link.w    a6, #$0
  003d2e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003d34  2250                 movea.l   (a0), a1
  003d36  203c00012034         move.l    #$12034, d0
  003d3c  4a310800             tst.b     (a1, d0.l)
  003d40  6722                 beq.b     $3d64
  003d42  13fc000100013c26     move.b    #$1, $13c26.l   ; g_13c26
  003d4a  61ffffffc9f4         bsr.l     $740   ; DisposeSounds
  003d50  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  003d56  61ffffffd054         bsr.l     $dac   ; InitSounds
  003d5c  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  003d62  6014                 bra.b     $3d78
  003d64  4a3900013c26         tst.b     $13c26.l   ; g_13c26
  003d6a  670c                 beq.b     $3d78
  003d6c  61ffffffc9d2         bsr.l     $740   ; DisposeSounds
  003d72  61ffffffd038         bsr.l     $dac   ; InitSounds
  003d78  4e5e                 unlk      a6
  003d7a  4e75                 rts       

;-------------------------------------------------------------
; CheckWorldCorruption   (seg 1 +003d8e, 822 bytes)
  003d8e  4e560000             link.w    a6, #$0
  003d92  2f03                 move.l    d3, -(a7)
  003d94  7600                 moveq     #$0, d3
  003d96  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  003d9c  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  003da2  6700031a             beq.w     $40be
  003da6  303900008066         move.w    $8066.l, d0   ; curLevel
  003dac  48c0                 ext.l     d0
  003dae  0c800000000f         cmpi.l    #$f, d0
  003db4  620002d4             bhi.w     $408a
  003db8  303b0206             move.w    $3dc0(pc, d0.w * 2), d0
  003dbc  4efb0002             jmp       $3dc0(pc, d0.w)
  003dc0  02ca0020004e007c00aa00d801060134 cases     0:$408a 1:$3de0 2:$3e0e 3:$3e3c 4:$3e6a 5:$3e98 6:$3ec6 7:$3ef4
  003dd0  0162019001be01ec021a0248027402a0 cases     8:$3f22 9:$3f50 10:$3f7e 11:$3fac 12:$3fda 13:$4008 14:$4034 15:$4060
  003de0  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003de6  2250                 movea.l   (a0), a1
  003de8  203c000114c0         move.l    #$114c0, d0
  003dee  48710800             pea.l     (a1, d0.l)
  003df2  4879000053ae         pea.l     $53ae.l   ; g_53ae
  003df8  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003dfe  4a00                 tst.b     d0
  003e00  57c0                 seq.b     d0
  003e02  4400                 neg.b     d0
  003e04  49c0                 extb.l    d0
  003e06  1600                 move.b    d0, d3
  003e08  504f                 addq.w    #$8, a7
  003e0a  6000027e             bra.w     $408a
  003e0e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003e14  2250                 movea.l   (a0), a1
  003e16  203c000114c0         move.l    #$114c0, d0
  003e1c  48710800             pea.l     (a1, d0.l)
  003e20  48790000539b         pea.l     $539b.l   ; g_539b
  003e26  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003e2c  4a00                 tst.b     d0
  003e2e  57c0                 seq.b     d0
  003e30  4400                 neg.b     d0
  003e32  49c0                 extb.l    d0
  003e34  1600                 move.b    d0, d3
  003e36  504f                 addq.w    #$8, a7
  003e38  60000250             bra.w     $408a
  003e3c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003e42  2250                 movea.l   (a0), a1
  003e44  203c000114c0         move.l    #$114c0, d0
  003e4a  48710800             pea.l     (a1, d0.l)
  003e4e  487900005388         pea.l     $5388.l   ; g_5388
  003e54  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003e5a  4a00                 tst.b     d0
  003e5c  57c0                 seq.b     d0
  003e5e  4400                 neg.b     d0
  003e60  49c0                 extb.l    d0
  003e62  1600                 move.b    d0, d3
  003e64  504f                 addq.w    #$8, a7
  003e66  60000222             bra.w     $408a
  003e6a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003e70  2250                 movea.l   (a0), a1
  003e72  203c000114c0         move.l    #$114c0, d0
  003e78  48710800             pea.l     (a1, d0.l)
  003e7c  487900005378         pea.l     $5378.l   ; g_5378
  003e82  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003e88  4a00                 tst.b     d0
  003e8a  57c0                 seq.b     d0
  003e8c  4400                 neg.b     d0
  003e8e  49c0                 extb.l    d0
  003e90  1600                 move.b    d0, d3
  003e92  504f                 addq.w    #$8, a7
  003e94  600001f4             bra.w     $408a
  003e98  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003e9e  2250                 movea.l   (a0), a1
  003ea0  203c000114c0         move.l    #$114c0, d0
  003ea6  48710800             pea.l     (a1, d0.l)
  003eaa  487900005368         pea.l     $5368.l   ; g_5368
  003eb0  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003eb6  4a00                 tst.b     d0
  003eb8  57c0                 seq.b     d0
  003eba  4400                 neg.b     d0
  003ebc  49c0                 extb.l    d0
  003ebe  1600                 move.b    d0, d3
  003ec0  504f                 addq.w    #$8, a7
  003ec2  600001c6             bra.w     $408a
  003ec6  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003ecc  2250                 movea.l   (a0), a1
  003ece  203c000114c0         move.l    #$114c0, d0
  003ed4  48710800             pea.l     (a1, d0.l)
  003ed8  487900005350         pea.l     $5350.l   ; g_5350
  003ede  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003ee4  4a00                 tst.b     d0
  003ee6  57c0                 seq.b     d0
  003ee8  4400                 neg.b     d0
  003eea  49c0                 extb.l    d0
  003eec  1600                 move.b    d0, d3
  003eee  504f                 addq.w    #$8, a7
  003ef0  60000198             bra.w     $408a
  003ef4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003efa  2250                 movea.l   (a0), a1
  003efc  203c000114c0         move.l    #$114c0, d0
  003f02  48710800             pea.l     (a1, d0.l)
  003f06  48790000533c         pea.l     $533c.l   ; g_533c
  003f0c  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003f12  4a00                 tst.b     d0
  003f14  57c0                 seq.b     d0
  003f16  4400                 neg.b     d0
  003f18  49c0                 extb.l    d0
  003f1a  1600                 move.b    d0, d3
  003f1c  504f                 addq.w    #$8, a7
  003f1e  6000016a             bra.w     $408a
  003f22  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003f28  2250                 movea.l   (a0), a1
  003f2a  203c000114c0         move.l    #$114c0, d0
  003f30  48710800             pea.l     (a1, d0.l)
  003f34  48790000532a         pea.l     $532a.l   ; g_532a
  003f3a  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003f40  4a00                 tst.b     d0
  003f42  57c0                 seq.b     d0
  003f44  4400                 neg.b     d0
  003f46  49c0                 extb.l    d0
  003f48  1600                 move.b    d0, d3
  003f4a  504f                 addq.w    #$8, a7
  003f4c  6000013c             bra.w     $408a
  003f50  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003f56  2250                 movea.l   (a0), a1
  003f58  203c000114c0         move.l    #$114c0, d0
  003f5e  48710800             pea.l     (a1, d0.l)
  003f62  487900005320         pea.l     $5320.l   ; g_5320
  003f68  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003f6e  4a00                 tst.b     d0
  003f70  57c0                 seq.b     d0
  003f72  4400                 neg.b     d0
  003f74  49c0                 extb.l    d0
  003f76  1600                 move.b    d0, d3
  003f78  504f                 addq.w    #$8, a7
  003f7a  6000010e             bra.w     $408a
  003f7e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003f84  2250                 movea.l   (a0), a1
  003f86  203c000114c0         move.l    #$114c0, d0
  003f8c  48710800             pea.l     (a1, d0.l)
  003f90  48790000530f         pea.l     $530f.l   ; g_530f
  003f96  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003f9c  4a00                 tst.b     d0
  003f9e  57c0                 seq.b     d0
  003fa0  4400                 neg.b     d0
  003fa2  49c0                 extb.l    d0
  003fa4  1600                 move.b    d0, d3
  003fa6  504f                 addq.w    #$8, a7
  003fa8  600000e0             bra.w     $408a
  003fac  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003fb2  2250                 movea.l   (a0), a1
  003fb4  203c000114c0         move.l    #$114c0, d0
  003fba  48710800             pea.l     (a1, d0.l)
  003fbe  4879000052f4         pea.l     $52f4.l   ; g_52f4
  003fc4  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003fca  4a00                 tst.b     d0
  003fcc  57c0                 seq.b     d0
  003fce  4400                 neg.b     d0
  003fd0  49c0                 extb.l    d0
  003fd2  1600                 move.b    d0, d3
  003fd4  504f                 addq.w    #$8, a7
  003fd6  600000b2             bra.w     $408a
  003fda  20790000746c         movea.l   $746c.l, a0   ; hLevel
  003fe0  2250                 movea.l   (a0), a1
  003fe2  203c000114c0         move.l    #$114c0, d0
  003fe8  48710800             pea.l     (a1, d0.l)
  003fec  4879000052e4         pea.l     $52e4.l   ; g_52e4
  003ff2  4eb900000a98         jsr       $a98.l   ; StringsEqual
  003ff8  4a00                 tst.b     d0
  003ffa  57c0                 seq.b     d0
  003ffc  4400                 neg.b     d0
  003ffe  49c0                 extb.l    d0
  004000  1600                 move.b    d0, d3
  004002  504f                 addq.w    #$8, a7
  004004  60000084             bra.w     $408a
  004008  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00400e  2250                 movea.l   (a0), a1
  004010  203c000114c0         move.l    #$114c0, d0
  004016  48710800             pea.l     (a1, d0.l)
  00401a  4879000052c8         pea.l     $52c8.l   ; g_52c8
  004020  4eb900000a98         jsr       $a98.l   ; StringsEqual
  004026  4a00                 tst.b     d0
  004028  57c0                 seq.b     d0
  00402a  4400                 neg.b     d0
  00402c  49c0                 extb.l    d0
  00402e  1600                 move.b    d0, d3
  004030  504f                 addq.w    #$8, a7
  004032  6056                 bra.b     $408a
  004034  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00403a  2250                 movea.l   (a0), a1
  00403c  203c000114c0         move.l    #$114c0, d0
  004042  48710800             pea.l     (a1, d0.l)
  004046  4879000052b4         pea.l     $52b4.l   ; g_52b4
  00404c  4eb900000a98         jsr       $a98.l   ; StringsEqual
  004052  4a00                 tst.b     d0
  004054  57c0                 seq.b     d0
  004056  4400                 neg.b     d0
  004058  49c0                 extb.l    d0
  00405a  1600                 move.b    d0, d3
  00405c  504f                 addq.w    #$8, a7
  00405e  602a                 bra.b     $408a
  004060  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004066  2250                 movea.l   (a0), a1
  004068  203c000114c0         move.l    #$114c0, d0
  00406e  48710800             pea.l     (a1, d0.l)
  004072  4879000052a6         pea.l     $52a6.l   ; g_52a6
  004078  4eb900000a98         jsr       $a98.l   ; StringsEqual
  00407e  4a00                 tst.b     d0
  004080  57c0                 seq.b     d0
  004082  4400                 neg.b     d0
  004084  49c0                 extb.l    d0
  004086  1600                 move.b    d0, d3
  004088  504f                 addq.w    #$8, a7
  00408a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004090  2250                 movea.l   (a0), a1
  004092  203c00012032         move.l    #$12032, d0
  004098  30310800             move.w    (a1, d0.l), d0
  00409c  b07900008066         cmp.w     $8066.l, d0   ; curLevel
  0040a2  6702                 beq.b     $40a6
  0040a4  7601                 moveq     #$1, d3
  0040a6  4a03                 tst.b     d3
  0040a8  6714                 beq.b     $40be
  0040aa  487900005250         pea.l     $5250.l   ; g_5250
  0040b0  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  0040b6  61ff000077ea         bsr.l     $b8a2   ; Quit
  0040bc  584f                 addq.w    #$4, a7
  0040be  261f                 move.l    (a7)+, d3
  0040c0  4e5e                 unlk      a6
  0040c2  4e75                 rts       

;-------------------------------------------------------------
; SetupLevelSprites   (seg 1 +0040dc, 290 bytes)
  0040dc  4e56fffc             link.w    a6, #$fffc
  0040e0  48e71e00             movem.l   d3-d6, -(a7)
  0040e4  4eb900000aa8         jsr       $aa8.l   ; KillAllSprites
  0040ea  61ff0000287c         bsr.l     $6968   ; InitIdleSprites
  0040f0  61fffffffc9c         bsr.l     $3d8e   ; CheckWorldCorruption
  0040f6  61fffffff134         bsr.l     $322c   ; LoadLevelTilesets
  0040fc  4eb900000c40         jsr       $c40.l   ; LoadTileDefinitions
  004102  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  004108  4a3900013c27         tst.b     $13c27.l   ; g_13c27
  00410e  6608                 bne.b     $4118
  004110  61ff000007e8         bsr.l     $48fa   ; InitTrackMap
  004116  6006                 bra.b     $411e
  004118  423900013c27         clr.b     $13c27.l   ; g_13c27
  00411e  61fffffffb42         bsr.l     $3c62   ; LoadLevelPhysics
  004124  61fffffffc04         bsr.l     $3d2a   ; LoadLevelSounds
  00412a  7600                 moveq     #$0, d3
  00412c  601e                 bra.b     $414c
  00412e  700c                 moveq     #$c, d0
  004130  c1c3                 muls.w    d3, d0
  004132  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  004138  42300800             clr.b     (a0, d0.l)
  00413c  700c                 moveq     #$c, d0
  00413e  c1c3                 muls.w    d3, d0
  004140  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  004146  42300800             clr.b     (a0, d0.l)
  00414a  5243                 addq.w    #$1, d3
  00414c  0c430040             cmpi.w    #$40, d3
  004150  6ddc                 blt.b     $412e
  004152  7600                 moveq     #$0, d3
  004154  60000092             bra.w     $41e8
  004158  3043                 movea.w   d3, a0
  00415a  2008                 move.l    a0, d0
  00415c  e988                 lsl.l     #$4, d0
  00415e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004164  2050                 movea.l   (a0), a0
  004166  d1c0                 adda.l    d0, a0
  004168  203c00010000         move.l    #$10000, d0
  00416e  4a300800             tst.b     (a0, d0.l)
  004172  6772                 beq.b     $41e6
  004174  3043                 movea.w   d3, a0
  004176  2a08                 move.l    a0, d5
  004178  e98d                 lsl.l     #$4, d5
  00417a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004180  2050                 movea.l   (a0), a0
  004182  d1c5                 adda.l    d5, a0
  004184  2a3c0001000e         move.l    #$1000e, d5
  00418a  3a305800             move.w    (a0, d5.l), d5
  00418e  48c5                 ext.l     d5
  004190  5d85                 subq.l    #$6, d5
  004192  3d45fffe             move.w    d5, -$2(a6)
  004196  3043                 movea.w   d3, a0
  004198  2c08                 move.l    a0, d6
  00419a  e98e                 lsl.l     #$4, d6
  00419c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0041a2  2050                 movea.l   (a0), a0
  0041a4  d1c6                 adda.l    d6, a0
  0041a6  2c3c0001000c         move.l    #$1000c, d6
  0041ac  3c306800             move.w    (a0, d6.l), d6
  0041b0  48c6                 ext.l     d6
  0041b2  5d86                 subq.l    #$6, d6
  0041b4  3d46fffc             move.w    d6, -$4(a6)
  0041b8  3043                 movea.w   d3, a0
  0041ba  2008                 move.l    a0, d0
  0041bc  e988                 lsl.l     #$4, d0
  0041be  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0041c4  2050                 movea.l   (a0), a0
  0041c6  d1c0                 adda.l    d0, a0
  0041c8  203c00010002         move.l    #$10002, d0
  0041ce  38300800             move.w    (a0, d0.l), d4
  0041d2  4a44                 tst.w     d4
  0041d4  6710                 beq.b     $41e6
  0041d6  3f03                 move.w    d3, -(a7)
  0041d8  3f04                 move.w    d4, -(a7)
  0041da  3f06                 move.w    d6, -(a7)
  0041dc  3f05                 move.w    d5, -(a7)
  0041de  61fffffff128         bsr.l     $3308   ; GenerateSprite
  0041e4  504f                 addq.w    #$8, a7
  0041e6  5243                 addq.w    #$1, d3
  0041e8  0c430100             cmpi.w    #$100, d3
  0041ec  6d00ff6a             blt.w     $4158
  0041f0  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0041f6  4cdf0078             movem.l   (a7)+, d3-d6
  0041fa  4e5e                 unlk      a6
  0041fc  4e75                 rts       

;-------------------------------------------------------------
; DoSectRect   (seg 1 +004212, 26 bytes)
  004212  4e560000             link.w    a6, #$0
  004216  554f                 subq.w    #$2, a7
  004218  2f2e0008             move.l    $8(a6), -(a7)
  00421c  2f2e000c             move.l    $c(a6), -(a7)
  004220  2f2e0010             move.l    $10(a6), -(a7)
  004224  a8aa                 _SectRect 
  004226  101f                 move.b    (a7)+, d0
  004228  4e5e                 unlk      a6
  00422a  4e75                 rts       

;-------------------------------------------------------------
; CheckTileCollisions   (seg 1 +00423a, 1706 bytes)
  00423a  4e56ffaa             link.w    a6, #$ffaa
  00423e  48e71f20             movem.l   d3-d7/a2, -(a7)
  004242  422effab             clr.b     -$55(a6)
  004246  7600                 moveq     #$0, d3
  004248  42790000fc10         clr.w     $fc10.l   ; g_fc10
  00424e  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  004254  3d790000806affae     move.w    $806a.l, -$52(a6)   ; viewLeft
  00425c  3d7900008068ffac     move.w    $8068.l, -$54(a6)   ; viewTop
  004264  30390000806a         move.w    $806a.l, d0   ; viewLeft
  00426a  48c0                 ext.l     d0
  00426c  0680000001c0         addi.l    #$1c0, d0
  004272  3d40ffb2             move.w    d0, -$4e(a6)
  004276  303900008068         move.w    $8068.l, d0   ; viewTop
  00427c  48c0                 ext.l     d0
  00427e  0680000001c0         addi.l    #$1c0, d0
  004284  3d40ffb0             move.w    d0, -$50(a6)
  004288  60000646             bra.w     $48d0
  00428c  4aaa009e             tst.l     $9e(a2)
  004290  660a                 bne.b     $429c
  004292  0c2a0001008b         cmpi.b    #$1, $8b(a2)
  004298  66000632             bne.w     $48cc
  00429c  302a0008             move.w    $8(a2), d0
  0042a0  48c0                 ext.l     d0
  0042a2  322a005c             move.w    $5c(a2), d1
  0042a6  48c1                 ext.l     d1
  0042a8  d280                 add.l     d0, d1
  0042aa  3d41ffe4             move.w    d1, -$1c(a6)
  0042ae  302a0006             move.w    $6(a2), d0
  0042b2  48c0                 ext.l     d0
  0042b4  322a005a             move.w    $5a(a2), d1
  0042b8  48c1                 ext.l     d1
  0042ba  d280                 add.l     d0, d1
  0042bc  3d41ffe2             move.w    d1, -$1e(a6)
  0042c0  302a000c             move.w    $c(a2), d0
  0042c4  48c0                 ext.l     d0
  0042c6  322a005c             move.w    $5c(a2), d1
  0042ca  48c1                 ext.l     d1
  0042cc  d280                 add.l     d0, d1
  0042ce  3d41ffe8             move.w    d1, -$18(a6)
  0042d2  302a000a             move.w    $a(a2), d0
  0042d6  48c0                 ext.l     d0
  0042d8  322a005a             move.w    $5a(a2), d1
  0042dc  48c1                 ext.l     d1
  0042de  d280                 add.l     d0, d1
  0042e0  3d41ffe6             move.w    d1, -$1a(a6)
  0042e4  0c6a01000052         cmpi.w    #$100, $52(a2)
  0042ea  6662                 bne.b     $434e
  0042ec  0c6a01000054         cmpi.w    #$100, $54(a2)
  0042f2  665a                 bne.b     $434e
  0042f4  206a007e             movea.l   $7e(a2), a0
  0042f8  3028000a             move.w    $a(a0), d0
  0042fc  48c0                 ext.l     d0
  0042fe  322a005c             move.w    $5c(a2), d1
  004302  48c1                 ext.l     d1
  004304  d280                 add.l     d0, d1
  004306  3d41ffda             move.w    d1, -$26(a6)
  00430a  206a007e             movea.l   $7e(a2), a0
  00430e  30280008             move.w    $8(a0), d0
  004312  48c0                 ext.l     d0
  004314  322a005a             move.w    $5a(a2), d1
  004318  48c1                 ext.l     d1
  00431a  d280                 add.l     d0, d1
  00431c  3d41ffd8             move.w    d1, -$28(a6)
  004320  206a007e             movea.l   $7e(a2), a0
  004324  3028000e             move.w    $e(a0), d0
  004328  48c0                 ext.l     d0
  00432a  322a005c             move.w    $5c(a2), d1
  00432e  48c1                 ext.l     d1
  004330  d280                 add.l     d0, d1
  004332  3d41ffde             move.w    d1, -$22(a6)
  004336  206a007e             movea.l   $7e(a2), a0
  00433a  3028000c             move.w    $c(a0), d0
  00433e  48c0                 ext.l     d0
  004340  322a005a             move.w    $5a(a2), d1
  004344  48c1                 ext.l     d1
  004346  d280                 add.l     d0, d1
  004348  3d41ffdc             move.w    d1, -$24(a6)
  00434c  6042                 bra.b     $4390
  00434e  486effd8             pea.l     -$28(a6)
  004352  486effb4             pea.l     -$4c(a6)
  004356  3f2a0054             move.w    $54(a2), -(a7)
  00435a  3f2a0052             move.w    $52(a2), -(a7)
  00435e  2f2a007e             move.l    $7e(a2), -(a7)
  004362  2f2a005a             move.l    $5a(a2), -(a7)
  004366  61ff00003b2c         bsr.l     $7e94   ; FindScaledPosAndBounds
  00436c  302effb6             move.w    -$4a(a6), d0
  004370  d16effda             add.w     d0, -$26(a6)
  004374  302effb4             move.w    -$4c(a6), d0
  004378  d16effd8             add.w     d0, -$28(a6)
  00437c  302effb6             move.w    -$4a(a6), d0
  004380  d16effde             add.w     d0, -$22(a6)
  004384  302effb4             move.w    -$4c(a6), d0
  004388  d16effdc             add.w     d0, -$24(a6)
  00438c  4fef0014             lea.l     $14(a7), a7
  004390  206a007e             movea.l   $7e(a2), a0
  004394  30280002             move.w    $2(a0), d0
  004398  48c0                 ext.l     d0
  00439a  206a007e             movea.l   $7e(a2), a0
  00439e  32280006             move.w    $6(a0), d1
  0043a2  48c1                 ext.l     d1
  0043a4  9280                 sub.l     d0, d1
  0043a6  e281                 asr.l     #$1, d1
  0043a8  302a005c             move.w    $5c(a2), d0
  0043ac  48c0                 ext.l     d0
  0043ae  d081                 add.l     d1, d0
  0043b0  3d40ffb6             move.w    d0, -$4a(a6)
  0043b4  206a007e             movea.l   $7e(a2), a0
  0043b8  3010                 move.w    (a0), d0
  0043ba  48c0                 ext.l     d0
  0043bc  206a007e             movea.l   $7e(a2), a0
  0043c0  32280004             move.w    $4(a0), d1
  0043c4  48c1                 ext.l     d1
  0043c6  9280                 sub.l     d0, d1
  0043c8  e281                 asr.l     #$1, d1
  0043ca  302a005a             move.w    $5a(a2), d0
  0043ce  48c0                 ext.l     d0
  0043d0  d081                 add.l     d1, d0
  0043d2  3d40ffb4             move.w    d0, -$4c(a6)
  0043d6  302effb6             move.w    -$4a(a6), d0
  0043da  48c0                 ext.l     d0
  0043dc  ea80                 asr.l     #$5, d0
  0043de  3d40ffea             move.w    d0, -$16(a6)
  0043e2  302effb4             move.w    -$4c(a6), d0
  0043e6  48c0                 ext.l     d0
  0043e8  ea80                 asr.l     #$5, d0
  0043ea  3d40ffe0             move.w    d0, -$20(a6)
  0043ee  302effe0             move.w    -$20(a6), d0
  0043f2  48c0                 ext.l     d0
  0043f4  5380                 subq.l    #$1, d0
  0043f6  3d40ffc8             move.w    d0, -$38(a6)
  0043fa  3d40ffcc             move.w    d0, -$34(a6)
  0043fe  3d40ffd0             move.w    d0, -$30(a6)
  004402  302effea             move.w    -$16(a6), d0
  004406  48c0                 ext.l     d0
  004408  5380                 subq.l    #$1, d0
  00440a  3d40ffc2             move.w    d0, -$3e(a6)
  00440e  3d40ffd6             move.w    d0, -$2a(a6)
  004412  3d40ffd2             move.w    d0, -$2e(a6)
  004416  3d6effeaffbe         move.w    -$16(a6), -$42(a6)
  00441c  3d6effeaffce         move.w    -$16(a6), -$32(a6)
  004422  302effea             move.w    -$16(a6), d0
  004426  48c0                 ext.l     d0
  004428  5280                 addq.l    #$1, d0
  00442a  3d40ffba             move.w    d0, -$46(a6)
  00442e  3d40ffd4             move.w    d0, -$2c(a6)
  004432  3d40ffca             move.w    d0, -$36(a6)
  004436  3d6effe0ffc4         move.w    -$20(a6), -$3c(a6)
  00443c  3d6effe0ffc6         move.w    -$20(a6), -$3a(a6)
  004442  302effea             move.w    -$16(a6), d0
  004446  48c0                 ext.l     d0
  004448  5380                 subq.l    #$1, d0
  00444a  3d40ffd6             move.w    d0, -$2a(a6)
  00444e  302effea             move.w    -$16(a6), d0
  004452  48c0                 ext.l     d0
  004454  5280                 addq.l    #$1, d0
  004456  3d40ffd4             move.w    d0, -$2c(a6)
  00445a  302effe0             move.w    -$20(a6), d0
  00445e  48c0                 ext.l     d0
  004460  5280                 addq.l    #$1, d0
  004462  3d40ffb8             move.w    d0, -$48(a6)
  004466  3d40ffbc             move.w    d0, -$44(a6)
  00446a  3d40ffc0             move.w    d0, -$40(a6)
  00446e  4aaa009e             tst.l     $9e(a2)
  004472  6700027c             beq.w     $46f0
  004476  7600                 moveq     #$0, d3
  004478  6000026e             bra.w     $46e8
  00447c  4a43                 tst.w     d3
  00447e  6606                 bne.b     $4486
  004480  382effea             move.w    -$16(a6), d4
  004484  605e                 bra.b     $44e4
  004486  0c430001             cmpi.w    #$1, d3
  00448a  6606                 bne.b     $4492
  00448c  382effd2             move.w    -$2e(a6), d4
  004490  6052                 bra.b     $44e4
  004492  0c430002             cmpi.w    #$2, d3
  004496  6606                 bne.b     $449e
  004498  382effce             move.w    -$32(a6), d4
  00449c  6046                 bra.b     $44e4
  00449e  0c430003             cmpi.w    #$3, d3
  0044a2  6606                 bne.b     $44aa
  0044a4  382effca             move.w    -$36(a6), d4
  0044a8  603a                 bra.b     $44e4
  0044aa  0c430004             cmpi.w    #$4, d3
  0044ae  6606                 bne.b     $44b6
  0044b0  382effd6             move.w    -$2a(a6), d4
  0044b4  602e                 bra.b     $44e4
  0044b6  0c430005             cmpi.w    #$5, d3
  0044ba  6606                 bne.b     $44c2
  0044bc  382effd4             move.w    -$2c(a6), d4
  0044c0  6022                 bra.b     $44e4
  0044c2  0c430006             cmpi.w    #$6, d3
  0044c6  6606                 bne.b     $44ce
  0044c8  382effc2             move.w    -$3e(a6), d4
  0044cc  6016                 bra.b     $44e4
  0044ce  0c430007             cmpi.w    #$7, d3
  0044d2  6606                 bne.b     $44da
  0044d4  382effbe             move.w    -$42(a6), d4
  0044d8  600a                 bra.b     $44e4
  0044da  0c430008             cmpi.w    #$8, d3
  0044de  6604                 bne.b     $44e4
  0044e0  382effba             move.w    -$46(a6), d4
  0044e4  4a43                 tst.w     d3
  0044e6  6606                 bne.b     $44ee
  0044e8  3a2effe0             move.w    -$20(a6), d5
  0044ec  605e                 bra.b     $454c
  0044ee  0c430001             cmpi.w    #$1, d3
  0044f2  6606                 bne.b     $44fa
  0044f4  3a2effd0             move.w    -$30(a6), d5
  0044f8  6052                 bra.b     $454c
  0044fa  0c430002             cmpi.w    #$2, d3
  0044fe  6606                 bne.b     $4506
  004500  3a2effcc             move.w    -$34(a6), d5
  004504  6046                 bra.b     $454c
  004506  0c430003             cmpi.w    #$3, d3
  00450a  6606                 bne.b     $4512
  00450c  3a2effc8             move.w    -$38(a6), d5
  004510  603a                 bra.b     $454c
  004512  0c430004             cmpi.w    #$4, d3
  004516  6606                 bne.b     $451e
  004518  3a2effc6             move.w    -$3a(a6), d5
  00451c  602e                 bra.b     $454c
  00451e  0c430005             cmpi.w    #$5, d3
  004522  6606                 bne.b     $452a
  004524  3a2effc4             move.w    -$3c(a6), d5
  004528  6022                 bra.b     $454c
  00452a  0c430006             cmpi.w    #$6, d3
  00452e  6606                 bne.b     $4536
  004530  3a2effc0             move.w    -$40(a6), d5
  004534  6016                 bra.b     $454c
  004536  0c430007             cmpi.w    #$7, d3
  00453a  6606                 bne.b     $4542
  00453c  3a2effbc             move.w    -$44(a6), d5
  004540  600a                 bra.b     $454c
  004542  0c430008             cmpi.w    #$8, d3
  004546  6604                 bne.b     $454c
  004548  3a2effb8             move.w    -$48(a6), d5
  00454c  3004                 move.w    d4, d0
  00454e  48c0                 ext.l     d0
  004550  eb88                 lsl.l     #$5, d0
  004552  3d40fffe             move.w    d0, -$2(a6)
  004556  3005                 move.w    d5, d0
  004558  48c0                 ext.l     d0
  00455a  eb88                 lsl.l     #$5, d0
  00455c  3d40fffc             move.w    d0, -$4(a6)
  004560  3f05                 move.w    d5, -(a7)
  004562  3f04                 move.w    d4, -(a7)
  004564  4eb900000b80         jsr       $b80.l   ; GetFGTile
  00456a  584f                 addq.w    #$4, a7
  00456c  3f00                 move.w    d0, -(a7)
  00456e  4eb900000c50         jsr       $c50.l   ; LookupFGTileKind
  004574  48c0                 ext.l     d0
  004576  2c00                 move.l    d0, d6
  004578  3f05                 move.w    d5, -(a7)
  00457a  3f04                 move.w    d4, -(a7)
  00457c  4eb900000b88         jsr       $b88.l   ; GetBGTile
  004582  584f                 addq.w    #$4, a7
  004584  3f00                 move.w    d0, -(a7)
  004586  4eb900000c48         jsr       $c48.l   ; LookupBGTileKind
  00458c  48c0                 ext.l     d0
  00458e  2e00                 move.l    d0, d7
  004590  70ff                 moveq     #$ff, d0
  004592  bc80                 cmp.l     d0, d6
  004594  584f                 addq.w    #$4, a7
  004596  670000a6             beq.w     $463e
  00459a  7014                 moveq     #$14, d0
  00459c  4c060800             muls.l    d6, d0
  0045a0  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  0045a6  30300806             move.w    $6(a0, d0.l), d0
  0045aa  48c0                 ext.l     d0
  0045ac  322efffe             move.w    -$2(a6), d1
  0045b0  48c1                 ext.l     d1
  0045b2  d280                 add.l     d0, d1
  0045b4  3d41fff6             move.w    d1, -$a(a6)
  0045b8  7014                 moveq     #$14, d0
  0045ba  4c060800             muls.l    d6, d0
  0045be  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  0045c4  30300804             move.w    $4(a0, d0.l), d0
  0045c8  48c0                 ext.l     d0
  0045ca  322efffc             move.w    -$4(a6), d1
  0045ce  48c1                 ext.l     d1
  0045d0  d280                 add.l     d0, d1
  0045d2  3d41fff4             move.w    d1, -$c(a6)
  0045d6  7014                 moveq     #$14, d0
  0045d8  4c060800             muls.l    d6, d0
  0045dc  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  0045e2  3030080a             move.w    $a(a0, d0.l), d0
  0045e6  48c0                 ext.l     d0
  0045e8  322efffe             move.w    -$2(a6), d1
  0045ec  48c1                 ext.l     d1
  0045ee  d280                 add.l     d0, d1
  0045f0  3d41fffa             move.w    d1, -$6(a6)
  0045f4  7014                 moveq     #$14, d0
  0045f6  4c060800             muls.l    d6, d0
  0045fa  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  004600  30300808             move.w    $8(a0, d0.l), d0
  004604  48c0                 ext.l     d0
  004606  322efffc             move.w    -$4(a6), d1
  00460a  48c1                 ext.l     d1
  00460c  d280                 add.l     d0, d1
  00460e  3d41fff8             move.w    d1, -$8(a6)
  004612  486effec             pea.l     -$14(a6)
  004616  486efff4             pea.l     -$c(a6)
  00461a  486effe2             pea.l     -$1e(a6)
  00461e  61fffffffbf2         bsr.l     $4212   ; DoSectRect
  004624  4a00                 tst.b     d0
  004626  4fef000c             lea.l     $c(a7), a7
  00462a  6712                 beq.b     $463e
  00462c  2f0a                 move.l    a2, -(a7)
  00462e  2f2efffc             move.l    -$4(a6), -(a7)
  004632  3f06                 move.w    d6, -(a7)
  004634  3f3c0001             move.w    #$1, -(a7)
  004638  206a009e             movea.l   $9e(a2), a0
  00463c  4e90                 jsr       (a0)
  00463e  4a87                 tst.l     d7
  004640  670000a4             beq.w     $46e6
  004644  700c                 moveq     #$c, d0
  004646  4c070800             muls.l    d7, d0
  00464a  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  004650  30300806             move.w    $6(a0, d0.l), d0
  004654  48c0                 ext.l     d0
  004656  322efffe             move.w    -$2(a6), d1
  00465a  48c1                 ext.l     d1
  00465c  d280                 add.l     d0, d1
  00465e  3d41fff6             move.w    d1, -$a(a6)
  004662  700c                 moveq     #$c, d0
  004664  4c070800             muls.l    d7, d0
  004668  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  00466e  30300804             move.w    $4(a0, d0.l), d0
  004672  48c0                 ext.l     d0
  004674  322efffc             move.w    -$4(a6), d1
  004678  48c1                 ext.l     d1
  00467a  d280                 add.l     d0, d1
  00467c  3d41fff4             move.w    d1, -$c(a6)
  004680  700c                 moveq     #$c, d0
  004682  4c070800             muls.l    d7, d0
  004686  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  00468c  3030080a             move.w    $a(a0, d0.l), d0
  004690  48c0                 ext.l     d0
  004692  322efffe             move.w    -$2(a6), d1
  004696  48c1                 ext.l     d1
  004698  d280                 add.l     d0, d1
  00469a  3d41fffa             move.w    d1, -$6(a6)
  00469e  700c                 moveq     #$c, d0
  0046a0  4c070800             muls.l    d7, d0
  0046a4  41f90000748e         lea.l     $748e.l, a0   ; bgKindRects
  0046aa  30300808             move.w    $8(a0, d0.l), d0
  0046ae  48c0                 ext.l     d0
  0046b0  322efffc             move.w    -$4(a6), d1
  0046b4  48c1                 ext.l     d1
  0046b6  d280                 add.l     d0, d1
  0046b8  3d41fff8             move.w    d1, -$8(a6)
  0046bc  486effec             pea.l     -$14(a6)
  0046c0  486efff4             pea.l     -$c(a6)
  0046c4  486effe2             pea.l     -$1e(a6)
  0046c8  61fffffffb48         bsr.l     $4212   ; DoSectRect
  0046ce  4a00                 tst.b     d0
  0046d0  4fef000c             lea.l     $c(a7), a7
  0046d4  6710                 beq.b     $46e6
  0046d6  2f0a                 move.l    a2, -(a7)
  0046d8  2f2efffc             move.l    -$4(a6), -(a7)
  0046dc  3f07                 move.w    d7, -(a7)
  0046de  4267                 clr.w     -(a7)
  0046e0  206a009e             movea.l   $9e(a2), a0
  0046e4  4e90                 jsr       (a0)
  0046e6  5243                 addq.w    #$1, d3
  0046e8  0c430009             cmpi.w    #$9, d3
  0046ec  6d00fd8e             blt.w     $447c
  0046f0  4a2a008b             tst.b     $8b(a2)
  0046f4  670001d6             beq.w     $48cc
  0046f8  486effec             pea.l     -$14(a6)
  0046fc  486effac             pea.l     -$54(a6)
  004700  486effd8             pea.l     -$28(a6)
  004704  61fffffffb0c         bsr.l     $4212   ; DoSectRect
  00470a  4a00                 tst.b     d0
  00470c  4fef000c             lea.l     $c(a7), a7
  004710  670001ba             beq.w     $48cc
  004714  7600                 moveq     #$0, d3
  004716  600001ac             bra.w     $48c4
  00471a  4a43                 tst.w     d3
  00471c  6606                 bne.b     $4724
  00471e  382effea             move.w    -$16(a6), d4
  004722  605e                 bra.b     $4782
  004724  0c430001             cmpi.w    #$1, d3
  004728  6606                 bne.b     $4730
  00472a  382effd2             move.w    -$2e(a6), d4
  00472e  6052                 bra.b     $4782
  004730  0c430002             cmpi.w    #$2, d3
  004734  6606                 bne.b     $473c
  004736  382effce             move.w    -$32(a6), d4
  00473a  6046                 bra.b     $4782
  00473c  0c430003             cmpi.w    #$3, d3
  004740  6606                 bne.b     $4748
  004742  382effca             move.w    -$36(a6), d4
  004746  603a                 bra.b     $4782
  004748  0c430004             cmpi.w    #$4, d3
  00474c  6606                 bne.b     $4754
  00474e  382effd6             move.w    -$2a(a6), d4
  004752  602e                 bra.b     $4782
  004754  0c430005             cmpi.w    #$5, d3
  004758  6606                 bne.b     $4760
  00475a  382effd4             move.w    -$2c(a6), d4
  00475e  6022                 bra.b     $4782
  004760  0c430006             cmpi.w    #$6, d3
  004764  6606                 bne.b     $476c
  004766  382effc2             move.w    -$3e(a6), d4
  00476a  6016                 bra.b     $4782
  00476c  0c430007             cmpi.w    #$7, d3
  004770  6606                 bne.b     $4778
  004772  382effbe             move.w    -$42(a6), d4
  004776  600a                 bra.b     $4782
  004778  0c430008             cmpi.w    #$8, d3
  00477c  6604                 bne.b     $4782
  00477e  382effba             move.w    -$46(a6), d4
  004782  4a43                 tst.w     d3
  004784  6606                 bne.b     $478c
  004786  3a2effe0             move.w    -$20(a6), d5
  00478a  605e                 bra.b     $47ea
  00478c  0c430001             cmpi.w    #$1, d3
  004790  6606                 bne.b     $4798
  004792  3a2effd0             move.w    -$30(a6), d5
  004796  6052                 bra.b     $47ea
  004798  0c430002             cmpi.w    #$2, d3
  00479c  6606                 bne.b     $47a4
  00479e  3a2effcc             move.w    -$34(a6), d5
  0047a2  6046                 bra.b     $47ea
  0047a4  0c430003             cmpi.w    #$3, d3
  0047a8  6606                 bne.b     $47b0
  0047aa  3a2effc8             move.w    -$38(a6), d5
  0047ae  603a                 bra.b     $47ea
  0047b0  0c430004             cmpi.w    #$4, d3
  0047b4  6606                 bne.b     $47bc
  0047b6  3a2effc6             move.w    -$3a(a6), d5
  0047ba  602e                 bra.b     $47ea
  0047bc  0c430005             cmpi.w    #$5, d3
  0047c0  6606                 bne.b     $47c8
  0047c2  3a2effc4             move.w    -$3c(a6), d5
  0047c6  6022                 bra.b     $47ea
  0047c8  0c430006             cmpi.w    #$6, d3
  0047cc  6606                 bne.b     $47d4
  0047ce  3a2effc0             move.w    -$40(a6), d5
  0047d2  6016                 bra.b     $47ea
  0047d4  0c430007             cmpi.w    #$7, d3
  0047d8  6606                 bne.b     $47e0
  0047da  3a2effbc             move.w    -$44(a6), d5
  0047de  600a                 bra.b     $47ea
  0047e0  0c430008             cmpi.w    #$8, d3
  0047e4  6604                 bne.b     $47ea
  0047e6  3a2effb8             move.w    -$48(a6), d5
  0047ea  3f05                 move.w    d5, -(a7)
  0047ec  3f04                 move.w    d4, -(a7)
  0047ee  4eb900000b80         jsr       $b80.l   ; GetFGTile
  0047f4  584f                 addq.w    #$4, a7
  0047f6  3f00                 move.w    d0, -(a7)
  0047f8  4eb900000c50         jsr       $c50.l   ; LookupFGTileKind
  0047fe  48c0                 ext.l     d0
  004800  2c00                 move.l    d0, d6
  004802  70ff                 moveq     #$ff, d0
  004804  bc80                 cmp.l     d0, d6
  004806  544f                 addq.w    #$2, a7
  004808  670000b8             beq.w     $48c2
  00480c  3004                 move.w    d4, d0
  00480e  48c0                 ext.l     d0
  004810  eb88                 lsl.l     #$5, d0
  004812  3d40fffe             move.w    d0, -$2(a6)
  004816  3005                 move.w    d5, d0
  004818  48c0                 ext.l     d0
  00481a  eb88                 lsl.l     #$5, d0
  00481c  3d40fffc             move.w    d0, -$4(a6)
  004820  7014                 moveq     #$14, d0
  004822  4c060800             muls.l    d6, d0
  004826  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  00482c  3030080e             move.w    $e(a0, d0.l), d0
  004830  48c0                 ext.l     d0
  004832  322efffe             move.w    -$2(a6), d1
  004836  48c1                 ext.l     d1
  004838  d280                 add.l     d0, d1
  00483a  3d41fff6             move.w    d1, -$a(a6)
  00483e  7014                 moveq     #$14, d0
  004840  4c060800             muls.l    d6, d0
  004844  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  00484a  3030080c             move.w    $c(a0, d0.l), d0
  00484e  48c0                 ext.l     d0
  004850  322efffc             move.w    -$4(a6), d1
  004854  48c1                 ext.l     d1
  004856  d280                 add.l     d0, d1
  004858  3d41fff4             move.w    d1, -$c(a6)
  00485c  7014                 moveq     #$14, d0
  00485e  4c060800             muls.l    d6, d0
  004862  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  004868  30300812             move.w    $12(a0, d0.l), d0
  00486c  48c0                 ext.l     d0
  00486e  322efffe             move.w    -$2(a6), d1
  004872  48c1                 ext.l     d1
  004874  d280                 add.l     d0, d1
  004876  3d41fffa             move.w    d1, -$6(a6)
  00487a  7014                 moveq     #$14, d0
  00487c  4c060800             muls.l    d6, d0
  004880  41f90000790e         lea.l     $790e.l, a0   ; fgKindRects
  004886  30300810             move.w    $10(a0, d0.l), d0
  00488a  48c0                 ext.l     d0
  00488c  322efffc             move.w    -$4(a6), d1
  004890  48c1                 ext.l     d1
  004892  d280                 add.l     d0, d1
  004894  3d41fff8             move.w    d1, -$8(a6)
  004898  486effec             pea.l     -$14(a6)
  00489c  486efff4             pea.l     -$c(a6)
  0048a0  486effd8             pea.l     -$28(a6)
  0048a4  61fffffff96c         bsr.l     $4212   ; DoSectRect
  0048aa  4a00                 tst.b     d0
  0048ac  4fef000c             lea.l     $c(a7), a7
  0048b0  6710                 beq.b     $48c2
  0048b2  486effec             pea.l     -$14(a6)
  0048b6  2f2efffc             move.l    -$4(a6), -(a7)
  0048ba  61ff00004616         bsr.l     $8ed2   ; AddFGRedraw
  0048c0  504f                 addq.w    #$8, a7
  0048c2  5243                 addq.w    #$1, d3
  0048c4  0c430009             cmpi.w    #$9, d3
  0048c8  6d00fe50             blt.w     $471a
  0048cc  246a002e             movea.l   $2e(a2), a2
  0048d0  200a                 move.l    a2, d0
  0048d2  6708                 beq.b     $48dc
  0048d4  4a2effab             tst.b     -$55(a6)
  0048d8  6700f9b2             beq.w     $428c
  0048dc  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  0048e0  4e5e                 unlk      a6
  0048e2  4e75                 rts       

;-------------------------------------------------------------
; InitTrackMap   (seg 1 +0048fa, 50 bytes)
  0048fa  4e560000             link.w    a6, #$0
  0048fe  7400                 moveq     #$0, d2
  004900  6020                 bra.b     $4922
  004902  7200                 moveq     #$0, d1
  004904  6014                 bra.b     $491a
  004906  3042                 movea.w   d2, a0
  004908  2008                 move.l    a0, d0
  00490a  ef88                 lsl.l     #$7, d0
  00490c  41f90000fc12         lea.l     $fc12.l, a0   ; trackMap
  004912  d1c0                 adda.l    d0, a0
  004914  42301000             clr.b     (a0, d1.w)
  004918  5241                 addq.w    #$1, d1
  00491a  0c410080             cmpi.w    #$80, d1
  00491e  6de6                 blt.b     $4906
  004920  5242                 addq.w    #$1, d2
  004922  0c420080             cmpi.w    #$80, d2
  004926  6dda                 blt.b     $4902
  004928  4e5e                 unlk      a6
  00492a  4e75                 rts       

;-------------------------------------------------------------
; SetTrackMap   (seg 1 +00493c, 56 bytes)
  00493c  4e560000             link.w    a6, #$0
  004940  342e0008             move.w    $8(a6), d2
  004944  322e000a             move.w    $a(a6), d1
  004948  4a42                 tst.w     d2
  00494a  6d24                 blt.b     $4970
  00494c  0c420080             cmpi.w    #$80, d2
  004950  6c1e                 bge.b     $4970
  004952  4a41                 tst.w     d1
  004954  6d1a                 blt.b     $4970
  004956  0c410080             cmpi.w    #$80, d1
  00495a  6c14                 bge.b     $4970
  00495c  3042                 movea.w   d2, a0
  00495e  2008                 move.l    a0, d0
  004960  ef88                 lsl.l     #$7, d0
  004962  41f90000fc12         lea.l     $fc12.l, a0   ; trackMap
  004968  d1c0                 adda.l    d0, a0
  00496a  11ae000c1000         move.b    $c(a6), (a0, d1.w)
  004970  4e5e                 unlk      a6
  004972  4e75                 rts       

;-------------------------------------------------------------
; UpdateTrackMap   (seg 1 +004982, 136 bytes)
  004982  4e560000             link.w    a6, #$0
  004986  48e71e00             movem.l   d3-d6, -(a7)
  00498a  3c3900008074         move.w    $8074.l, d6   ; playerH
  004990  48c6                 ext.l     d6
  004992  7220                 moveq     #$20, d1
  004994  dc81                 add.l     d1, d6
  004996  ea86                 asr.l     #$5, d6
  004998  3a3900008076         move.w    $8076.l, d5   ; playerV
  00499e  48c5                 ext.l     d5
  0049a0  7220                 moveq     #$20, d1
  0049a2  da81                 add.l     d1, d5
  0049a4  ea85                 asr.l     #$5, d5
  0049a6  bc7900013c14         cmp.w     $13c14.l, d6   ; g_13c14
  0049ac  6608                 bne.b     $49b6
  0049ae  ba7900013c12         cmp.w     $13c12.l, d5   ; g_13c12
  0049b4  674c                 beq.b     $4a02
  0049b6  3806                 move.w    d6, d4
  0049b8  48c4                 ext.l     d4
  0049ba  5f84                 subq.l    #$7, d4
  0049bc  602a                 bra.b     $49e8
  0049be  3605                 move.w    d5, d3
  0049c0  48c3                 ext.l     d3
  0049c2  5f83                 subq.l    #$7, d3
  0049c4  6012                 bra.b     $49d8
  0049c6  1f3c0001             move.b    #$1, -(a7)
  0049ca  3f03                 move.w    d3, -(a7)
  0049cc  3f04                 move.w    d4, -(a7)
  0049ce  61ffffffff6c         bsr.l     $493c   ; SetTrackMap
  0049d4  5243                 addq.w    #$1, d3
  0049d6  5c4f                 addq.w    #$6, a7
  0049d8  3005                 move.w    d5, d0
  0049da  48c0                 ext.l     d0
  0049dc  5e80                 addq.l    #$7, d0
  0049de  3203                 move.w    d3, d1
  0049e0  48c1                 ext.l     d1
  0049e2  b280                 cmp.l     d0, d1
  0049e4  6de0                 blt.b     $49c6
  0049e6  5244                 addq.w    #$1, d4
  0049e8  3006                 move.w    d6, d0
  0049ea  48c0                 ext.l     d0
  0049ec  5e80                 addq.l    #$7, d0
  0049ee  3204                 move.w    d4, d1
  0049f0  48c1                 ext.l     d1
  0049f2  b280                 cmp.l     d0, d1
  0049f4  6dc8                 blt.b     $49be
  0049f6  33c600013c14         move.w    d6, $13c14.l   ; g_13c14
  0049fc  33c500013c12         move.w    d5, $13c12.l   ; g_13c12
  004a02  4cdf0078             movem.l   (a7)+, d3-d6
  004a06  4e5e                 unlk      a6
  004a08  4e75                 rts       

;-------------------------------------------------------------
; ShowMap   (seg 1 +004a1c, 894 bytes)
  004a1c  4e56ffd6             link.w    a6, #$ffd6
  004a20  48e71f00             movem.l   d3-d7, -(a7)
  004a24  7e00                 moveq     #$0, d7
  004a26  7c06                 moveq     #$6, d6
  004a28  2d7900005248ffdc     move.l    $5248.l, -$24(a6)   ; g_5248
  004a30  2d790000524cffe0     move.l    $524c.l, -$20(a6)   ; g_524c
  004a38  2d7900005244fff0     move.l    $5244.l, -$10(a6)   ; g_5244
  004a40  2d790000523effd6     move.l    $523e.l, -$2a(a6)   ; g_523e
  004a48  3d7900005242ffda     move.w    $5242.l, -$26(a6)   ; g_5242
  004a50  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  004a56  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  004a5c  4eb9000000d8         jsr       $d8.l   ; SATSETPORTBACKSCREEN
  004a62  3d7c0010fff6         move.w    #$10, -$a(a6)
  004a68  3d7c0010fff4         move.w    #$10, -$c(a6)
  004a6e  3d7c01d0fffa         move.w    #$1d0, -$6(a6)
  004a74  3d7c01d0fff8         move.w    #$1d0, -$8(a6)
  004a7a  486effd6             pea.l     -$2a(a6)
  004a7e  aa14                 _RGBForeColor 
  004a80  486efff4             pea.l     -$c(a6)
  004a84  a8a2                 _PaintRect 
  004a86  48780021             pea.l     $21.w
  004a8a  a862                 _ForeColor 
  004a8c  3d7c0500ffe6         move.w    #$500, -$1a(a6)
  004a92  3d7c0500ffe4         move.w    #$500, -$1c(a6)
  004a98  3d7c0b40ffea         move.w    #$b40, -$16(a6)
  004a9e  3d7c0b40ffe8         move.w    #$b40, -$18(a6)
  004aa4  3d7900008074fffe     move.w    $8074.l, -$2(a6)   ; playerH
  004aac  3d7900008076fffc     move.w    $8076.l, -$4(a6)   ; playerV
  004ab4  554f                 subq.w    #$2, a7
  004ab6  2f2efffc             move.l    -$4(a6), -(a7)
  004aba  486effe4             pea.l     -$1c(a6)
  004abe  a8ad                 _PtInRect 
  004ac0  101f                 move.b    (a7)+, d0
  004ac2  6642                 bne.b     $4b06
  004ac4  0c79080000008074     cmpi.w    #$800, $8074.l   ; playerH
  004acc  6c1c                 bge.b     $4aea
  004ace  426efff2             clr.w     -$e(a6)
  004ad2  0c79080000008076     cmpi.w    #$800, $8076.l   ; playerV
  004ada  6c06                 bge.b     $4ae2
  004adc  426efff0             clr.w     -$10(a6)
  004ae0  6024                 bra.b     $4b06
  004ae2  3d7c0010fff0         move.w    #$10, -$10(a6)
  004ae8  601c                 bra.b     $4b06
  004aea  3d7c0010fff2         move.w    #$10, -$e(a6)
  004af0  0c79080000008076     cmpi.w    #$800, $8076.l   ; playerV
  004af8  6c06                 bge.b     $4b00
  004afa  426efff0             clr.w     -$10(a6)
  004afe  6006                 bra.b     $4b06
  004b00  3d7c0010fff0         move.w    #$10, -$10(a6)
  004b06  302efff2             move.w    -$e(a6), d0
  004b0a  48c0                 ext.l     d0
  004b0c  e588                 lsl.l     #$2, d0
  004b0e  323900008074         move.w    $8074.l, d1   ; playerH
  004b14  48c1                 ext.l     d1
  004b16  7420                 moveq     #$20, d2
  004b18  d282                 add.l     d2, d1
  004b1a  2401                 move.l    d1, d2
  004b1c  e482                 asr.l     #$2, d2
  004b1e  e08a                 lsr.l     #$8, d2
  004b20  e08a                 lsr.l     #$8, d2
  004b22  e08a                 lsr.l     #$8, d2
  004b24  ea8a                 lsr.l     #$5, d2
  004b26  d481                 add.l     d1, d2
  004b28  e682                 asr.l     #$3, d2
  004b2a  9480                 sub.l     d0, d2
  004b2c  3d42fffe             move.w    d2, -$2(a6)
  004b30  302efff0             move.w    -$10(a6), d0
  004b34  48c0                 ext.l     d0
  004b36  e588                 lsl.l     #$2, d0
  004b38  323900008076         move.w    $8076.l, d1   ; playerV
  004b3e  48c1                 ext.l     d1
  004b40  7420                 moveq     #$20, d2
  004b42  d282                 add.l     d2, d1
  004b44  2401                 move.l    d1, d2
  004b46  e482                 asr.l     #$2, d2
  004b48  e08a                 lsr.l     #$8, d2
  004b4a  e08a                 lsr.l     #$8, d2
  004b4c  e08a                 lsr.l     #$8, d2
  004b4e  ea8a                 lsr.l     #$5, d2
  004b50  d481                 add.l     d1, d2
  004b52  e682                 asr.l     #$3, d2
  004b54  9480                 sub.l     d0, d2
  004b56  3d42fffc             move.w    d2, -$4(a6)
  004b5a  3a2efff2             move.w    -$e(a6), d5
  004b5e  60000128             bra.w     $4c88
  004b62  382efff0             move.w    -$10(a6), d4
  004b66  6000010a             bra.w     $4c72
  004b6a  3f04                 move.w    d4, -(a7)
  004b6c  3f05                 move.w    d5, -(a7)
  004b6e  4eb900000b80         jsr       $b80.l   ; GetFGTile
  004b74  3600                 move.w    d0, d3
  004b76  302efff2             move.w    -$e(a6), d0
  004b7a  48c0                 ext.l     d0
  004b7c  3205                 move.w    d5, d1
  004b7e  48c1                 ext.l     d1
  004b80  9280                 sub.l     d0, d1
  004b82  e589                 lsl.l     #$2, d1
  004b84  7010                 moveq     #$10, d0
  004b86  d280                 add.l     d0, d1
  004b88  3d41fffe             move.w    d1, -$2(a6)
  004b8c  302efff0             move.w    -$10(a6), d0
  004b90  48c0                 ext.l     d0
  004b92  3204                 move.w    d4, d1
  004b94  48c1                 ext.l     d1
  004b96  9280                 sub.l     d0, d1
  004b98  e589                 lsl.l     #$2, d1
  004b9a  7010                 moveq     #$10, d0
  004b9c  d280                 add.l     d0, d1
  004b9e  3d41fffc             move.w    d1, -$4(a6)
  004ba2  3045                 movea.w   d5, a0
  004ba4  2008                 move.l    a0, d0
  004ba6  ef88                 lsl.l     #$7, d0
  004ba8  41f90000fc12         lea.l     $fc12.l, a0   ; trackMap
  004bae  d1c0                 adda.l    d0, a0
  004bb0  4a304000             tst.b     (a0, d4.w)
  004bb4  584f                 addq.w    #$4, a7
  004bb6  6634                 bne.b     $4bec
  004bb8  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  004bbe  3d6efffcfff4         move.w    -$4(a6), -$c(a6)
  004bc4  302efffe             move.w    -$2(a6), d0
  004bc8  48c0                 ext.l     d0
  004bca  5880                 addq.l    #$4, d0
  004bcc  3d40fffa             move.w    d0, -$6(a6)
  004bd0  302efffc             move.w    -$4(a6), d0
  004bd4  48c0                 ext.l     d0
  004bd6  5880                 addq.l    #$4, d0
  004bd8  3d40fff8             move.w    d0, -$8(a6)
  004bdc  48780021             pea.l     $21.w
  004be0  a862                 _ForeColor 
  004be2  486efff4             pea.l     -$c(a6)
  004be6  a8a2                 _PaintRect 
  004be8  60000086             bra.w     $4c70
  004bec  4a43                 tst.w     d3
  004bee  6d000080             blt.w     $4c70
  004bf2  0c43001f             cmpi.w    #$1f, d3
  004bf6  6f06                 ble.b     $4bfe
  004bf8  0c430038             cmpi.w    #$38, d3
  004bfc  6d72                 blt.b     $4c70
  004bfe  0c430038             cmpi.w    #$38, d3
  004c02  6d32                 blt.b     $4c36
  004c04  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  004c0a  3d6efffcfff4         move.w    -$4(a6), -$c(a6)
  004c10  302efffe             move.w    -$2(a6), d0
  004c14  48c0                 ext.l     d0
  004c16  5880                 addq.l    #$4, d0
  004c18  3d40fffa             move.w    d0, -$6(a6)
  004c1c  302efffc             move.w    -$4(a6), d0
  004c20  48c0                 ext.l     d0
  004c22  5880                 addq.l    #$4, d0
  004c24  3d40fff8             move.w    d0, -$8(a6)
  004c28  48780021             pea.l     $21.w
  004c2c  a862                 _ForeColor 
  004c2e  486efff4             pea.l     -$c(a6)
  004c32  a8a2                 _PaintRect 
  004c34  603a                 bra.b     $4c70
  004c36  0c430020             cmpi.w    #$20, d3
  004c3a  6c34                 bge.b     $4c70
  004c3c  4a43                 tst.w     d3
  004c3e  6d30                 blt.b     $4c70
  004c40  2d7900018650ffec     move.l    $18650.l, -$14(a6)   ; g_18650
  004c48  701c                 moveq     #$1c, d0
  004c4a  c1c3                 muls.w    d3, d0
  004c4c  20790000f75c         movea.l   $f75c.l, a0   ; g_f75c
  004c52  d1c0                 adda.l    d0, a0
  004c54  4850                 pea.l     (a0)
  004c56  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  004c5c  2f2effec             move.l    -$14(a6), -(a7)
  004c60  2f2efffc             move.l    -$4(a6), -(a7)
  004c64  2f3c00040004         move.l    #$40004, -(a7)
  004c6a  4eb9000009c8         jsr       $9c8.l   ; BLITENCFACENOCLIP
  004c70  5244                 addq.w    #$1, d4
  004c72  302efff0             move.w    -$10(a6), d0
  004c76  48c0                 ext.l     d0
  004c78  7270                 moveq     #$70, d1
  004c7a  d081                 add.l     d1, d0
  004c7c  3204                 move.w    d4, d1
  004c7e  48c1                 ext.l     d1
  004c80  b280                 cmp.l     d0, d1
  004c82  6d00fee6             blt.w     $4b6a
  004c86  5245                 addq.w    #$1, d5
  004c88  302efff2             move.w    -$e(a6), d0
  004c8c  48c0                 ext.l     d0
  004c8e  7270                 moveq     #$70, d1
  004c90  d081                 add.l     d1, d0
  004c92  3205                 move.w    d5, d1
  004c94  48c1                 ext.l     d1
  004c96  b280                 cmp.l     d0, d1
  004c98  6d00fec8             blt.w     $4b62
  004c9c  302efff2             move.w    -$e(a6), d0
  004ca0  48c0                 ext.l     d0
  004ca2  e588                 lsl.l     #$2, d0
  004ca4  323900008074         move.w    $8074.l, d1   ; playerH
  004caa  48c1                 ext.l     d1
  004cac  7420                 moveq     #$20, d2
  004cae  d282                 add.l     d2, d1
  004cb0  2401                 move.l    d1, d2
  004cb2  e482                 asr.l     #$2, d2
  004cb4  e08a                 lsr.l     #$8, d2
  004cb6  e08a                 lsr.l     #$8, d2
  004cb8  e08a                 lsr.l     #$8, d2
  004cba  ea8a                 lsr.l     #$5, d2
  004cbc  d481                 add.l     d1, d2
  004cbe  e682                 asr.l     #$3, d2
  004cc0  9480                 sub.l     d0, d2
  004cc2  3d42fffe             move.w    d2, -$2(a6)
  004cc6  302efff0             move.w    -$10(a6), d0
  004cca  48c0                 ext.l     d0
  004ccc  e588                 lsl.l     #$2, d0
  004cce  323900008076         move.w    $8076.l, d1   ; playerV
  004cd4  48c1                 ext.l     d1
  004cd6  7420                 moveq     #$20, d2
  004cd8  d282                 add.l     d2, d1
  004cda  2401                 move.l    d1, d2
  004cdc  e482                 asr.l     #$2, d2
  004cde  e08a                 lsr.l     #$8, d2
  004ce0  e08a                 lsr.l     #$8, d2
  004ce2  e08a                 lsr.l     #$8, d2
  004ce4  ea8a                 lsr.l     #$5, d2
  004ce6  d481                 add.l     d1, d2
  004ce8  e682                 asr.l     #$3, d2
  004cea  9480                 sub.l     d0, d2
  004cec  3d42fffc             move.w    d2, -$4(a6)
  004cf0  2f390000f720         move.l    $f720.l, -(a7)   ; g_f720
  004cf6  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  004cfc  2f2efffc             move.l    -$4(a6), -(a7)
  004d00  1f3c0001             move.b    #$1, -(a7)
  004d04  4eb900000118         jsr       $118.l   ; SATPLOTFACE
  004d0a  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  004d10  486effdc             pea.l     -$24(a6)
  004d14  486effdc             pea.l     -$24(a6)
  004d18  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  004d1e  4eb900000128         jsr       $128.l   ; SATCOPYBITSTOSCREEN
  004d24  4eb900000b30         jsr       $b30.l   ; ResetCursor
  004d2a  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  004d30  6032                 bra.b     $4d64
  004d32  594f                 subq.w    #$4, a7
  004d34  a975                 _TickCount 
  004d36  201f                 move.l    (a7)+, d0
  004d38  2600                 move.l    d0, d3
  004d3a  3f3900006190         move.w    $6190.l, -(a7)   ; g_6190
  004d40  4eb900000b60         jsr       $b60.l   ; IsPressed
  004d46  4a00                 tst.b     d0
  004d48  544f                 addq.w    #$2, a7
  004d4a  6706                 beq.b     $4d52
  004d4c  4a46                 tst.w     d6
  004d4e  6602                 bne.b     $4d52
  004d50  7e01                 moveq     #$1, d7
  004d52  4a46                 tst.w     d6
  004d54  6f02                 ble.b     $4d58
  004d56  5346                 subq.w    #$1, d6
  004d58  594f                 subq.w    #$4, a7
  004d5a  a975                 _TickCount 
  004d5c  201f                 move.l    (a7)+, d0
  004d5e  5580                 subq.l    #$2, d0
  004d60  b680                 cmp.l     d0, d3
  004d62  62f4                 bhi.b     $4d58
  004d64  4a07                 tst.b     d7
  004d66  67ca                 beq.b     $4d32
  004d68  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  004d6e  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  004d74  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  004d7a  61ff00003b32         bsr.l     $88ae   ; DrawSpritesBehindTiles
  004d80  4eb900000c90         jsr       $c90.l   ; RedrawGameArea
  004d86  4eb900000b30         jsr       $b30.l   ; ResetCursor
  004d8c  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  004d92  4cdf00f8             movem.l   (a7)+, d3-d7
  004d96  4e5e                 unlk      a6
  004d98  4e75                 rts       

;-------------------------------------------------------------
; IntroLevel   (seg 1 +004da4, 692 bytes)
  004da4  4e56fee2             link.w    a6, #$fee2
  004da8  48e71020             movem.l   d3/a2, -(a7)
  004dac  2d7900005238ffec     move.l    $5238.l, -$14(a6)   ; g_5238
  004db4  3d790000523cfff0     move.w    $523c.l, -$10(a6)   ; g_523c
  004dbc  2d7900005232fff2     move.l    $5232.l, -$e(a6)   ; g_5232
  004dc4  3d7900005236fff6     move.w    $5236.l, -$a(a6)   ; g_5236
  004dcc  2d790000522cffe6     move.l    $522c.l, -$1a(a6)   ; g_522c
  004dd4  3d7900005230ffea     move.w    $5230.l, -$16(a6)   ; g_5230
  004ddc  7600                 moveq     #$0, d3
  004dde  3f3c0008             move.w    #$8, -(a7)
  004de2  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  004de8  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  004dee  48780021             pea.l     $21.w
  004df2  a862                 _ForeColor 
  004df4  48790000559a         pea.l     $559a.l   ; g_559a
  004dfa  a8a2                 _PaintRect 
  004dfc  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004e02  2250                 movea.l   (a0), a1
  004e04  203c00012084         move.l    #$12084, d0
  004e0a  4a710800             tst.w     (a1, d0.l)
  004e0e  544f                 addq.w    #$2, a7
  004e10  6702                 beq.b     $4e14
  004e12  7601                 moveq     #$1, d3
  004e14  4a03                 tst.b     d3
  004e16  670000ce             beq.w     $4ee6
  004e1a  95ca                 suba.l    a2, a2
  004e1c  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  004e22  594f                 subq.w    #$4, a7
  004e24  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004e2a  2250                 movea.l   (a0), a1
  004e2c  203c00012084         move.l    #$12084, d0
  004e32  3f310800             move.w    (a1, d0.l), -(a7)
  004e36  a9bc                 _GetPicture 
  004e38  205f                 movea.l   (a7)+, a0
  004e3a  2448                 movea.l   a0, a2
  004e3c  200a                 move.l    a2, d0
  004e3e  6700009e             beq.w     $4ede
  004e42  204a                 movea.l   a2, a0
  004e44  a029                 _HLock    
  004e46  2052                 movea.l   (a2), a0
  004e48  2d680002fff8         move.l    $2(a0), -$8(a6)
  004e4e  2d680006fffc         move.l    $6(a0), -$4(a6)
  004e54  302efffa             move.w    -$6(a6), d0
  004e58  48c0                 ext.l     d0
  004e5a  322efffe             move.w    -$2(a6), d1
  004e5e  48c1                 ext.l     d1
  004e60  9280                 sub.l     d0, d1
  004e62  203c000001c0         move.l    #$1c0, d0
  004e68  9081                 sub.l     d1, d0
  004e6a  e280                 asr.l     #$1, d0
  004e6c  7210                 moveq     #$10, d1
  004e6e  d081                 add.l     d1, d0
  004e70  3d40fffa             move.w    d0, -$6(a6)
  004e74  2052                 movea.l   (a2), a0
  004e76  30280004             move.w    $4(a0), d0
  004e7a  48c0                 ext.l     d0
  004e7c  2052                 movea.l   (a2), a0
  004e7e  32280008             move.w    $8(a0), d1
  004e82  48c1                 ext.l     d1
  004e84  9280                 sub.l     d0, d1
  004e86  302efffa             move.w    -$6(a6), d0
  004e8a  48c0                 ext.l     d0
  004e8c  d081                 add.l     d1, d0
  004e8e  3d40fffe             move.w    d0, -$2(a6)
  004e92  302efff8             move.w    -$8(a6), d0
  004e96  48c0                 ext.l     d0
  004e98  322efffc             move.w    -$4(a6), d1
  004e9c  48c1                 ext.l     d1
  004e9e  9280                 sub.l     d0, d1
  004ea0  203c000001c0         move.l    #$1c0, d0
  004ea6  9081                 sub.l     d1, d0
  004ea8  e280                 asr.l     #$1, d0
  004eaa  3d40fff8             move.w    d0, -$8(a6)
  004eae  2052                 movea.l   (a2), a0
  004eb0  30280002             move.w    $2(a0), d0
  004eb4  48c0                 ext.l     d0
  004eb6  2052                 movea.l   (a2), a0
  004eb8  32280006             move.w    $6(a0), d1
  004ebc  48c1                 ext.l     d1
  004ebe  9280                 sub.l     d0, d1
  004ec0  302efff8             move.w    -$8(a6), d0
  004ec4  48c0                 ext.l     d0
  004ec6  d081                 add.l     d1, d0
  004ec8  3d40fffc             move.w    d0, -$4(a6)
  004ecc  2f0a                 move.l    a2, -(a7)
  004ece  486efff8             pea.l     -$8(a6)
  004ed2  a8f6                 _DrawPicture 
  004ed4  204a                 movea.l   a2, a0
  004ed6  a02a                 _HUnlock  
  004ed8  2f0a                 move.l    a2, -(a7)
  004eda  a9a3                 _ReleaseResource 
  004edc  6002                 bra.b     $4ee0
  004ede  7600                 moveq     #$0, d3
  004ee0  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  004ee6  4a03                 tst.b     d3
  004ee8  66000124             bne.w     $500e
  004eec  3f3c0015             move.w    #$15, -(a7)
  004ef0  a887                 _TextFont 
  004ef2  3f3c0001             move.w    #$1, -(a7)
  004ef6  a888                 _TextFace 
  004ef8  3f3c001b             move.w    #$1b, -(a7)
  004efc  a88a                 _TextSize 
  004efe  486effe6             pea.l     -$1a(a6)
  004f02  aa14                 _RGBForeColor 
  004f04  554f                 subq.w    #$2, a7
  004f06  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004f0c  2250                 movea.l   (a0), a1
  004f0e  203c000114c0         move.l    #$114c0, d0
  004f14  48710800             pea.l     (a1, d0.l)
  004f18  a88c                 _StringWidth 
  004f1a  301f                 move.w    (a7)+, d0
  004f1c  3600                 move.w    d0, d3
  004f1e  3003                 move.w    d3, d0
  004f20  48c0                 ext.l     d0
  004f22  223c000001c0         move.l    #$1c0, d1
  004f28  9280                 sub.l     d0, d1
  004f2a  2001                 move.l    d1, d0
  004f2c  e088                 lsr.l     #$8, d0
  004f2e  e088                 lsr.l     #$8, d0
  004f30  e088                 lsr.l     #$8, d0
  004f32  ee88                 lsr.l     #$7, d0
  004f34  d081                 add.l     d1, d0
  004f36  e280                 asr.l     #$1, d0
  004f38  7210                 moveq     #$10, d1
  004f3a  d081                 add.l     d1, d0
  004f3c  3f00                 move.w    d0, -(a7)
  004f3e  3f3c00f9             move.w    #$f9, -(a7)
  004f42  a893                 _MoveTo   
  004f44  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004f4a  2250                 movea.l   (a0), a1
  004f4c  203c000114c0         move.l    #$114c0, d0
  004f52  48710800             pea.l     (a1, d0.l)
  004f56  a884                 _DrawString 
  004f58  3003                 move.w    d3, d0
  004f5a  48c0                 ext.l     d0
  004f5c  223c000001c0         move.l    #$1c0, d1
  004f62  9280                 sub.l     d0, d1
  004f64  2001                 move.l    d1, d0
  004f66  e088                 lsr.l     #$8, d0
  004f68  e088                 lsr.l     #$8, d0
  004f6a  e088                 lsr.l     #$8, d0
  004f6c  ee88                 lsr.l     #$7, d0
  004f6e  d081                 add.l     d1, d0
  004f70  e280                 asr.l     #$1, d0
  004f72  7210                 moveq     #$10, d1
  004f74  d081                 add.l     d1, d0
  004f76  3f00                 move.w    d0, -(a7)
  004f78  3f3c00dd             move.w    #$dd, -(a7)
  004f7c  a893                 _MoveTo   
  004f7e  486efff2             pea.l     -$e(a6)
  004f82  aa14                 _RGBForeColor 
  004f84  3f03                 move.w    d3, -(a7)
  004f86  4267                 clr.w     -(a7)
  004f88  a892                 _Line     
  004f8a  3003                 move.w    d3, d0
  004f8c  48c0                 ext.l     d0
  004f8e  223c000001c0         move.l    #$1c0, d1
  004f94  9280                 sub.l     d0, d1
  004f96  2001                 move.l    d1, d0
  004f98  e088                 lsr.l     #$8, d0
  004f9a  e088                 lsr.l     #$8, d0
  004f9c  e088                 lsr.l     #$8, d0
  004f9e  ee88                 lsr.l     #$7, d0
  004fa0  d081                 add.l     d1, d0
  004fa2  e280                 asr.l     #$1, d0
  004fa4  7210                 moveq     #$10, d1
  004fa6  d081                 add.l     d1, d0
  004fa8  3f00                 move.w    d0, -(a7)
  004faa  3f3c00de             move.w    #$de, -(a7)
  004fae  a893                 _MoveTo   
  004fb0  486efff2             pea.l     -$e(a6)
  004fb4  aa14                 _RGBForeColor 
  004fb6  3f03                 move.w    d3, -(a7)
  004fb8  4267                 clr.w     -(a7)
  004fba  a892                 _Line     
  004fbc  2f3c00d700cb         move.l    #$d700cb, -(a7)
  004fc2  a893                 _MoveTo   
  004fc4  486effec             pea.l     -$14(a6)
  004fc8  aa14                 _RGBForeColor 
  004fca  4267                 clr.w     -(a7)
  004fcc  a888                 _TextFace 
  004fce  3f3c000b             move.w    #$b, -(a7)
  004fd2  a88a                 _TextSize 
  004fd4  48790000521e         pea.l     $521e.l   ; g_521e
  004fda  a884                 _DrawString 
  004fdc  2f3c00d7010f         move.l    #$d7010f, -(a7)
  004fe2  a893                 _MoveTo   
  004fe4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  004fea  2250                 movea.l   (a0), a1
  004fec  203c00012032         move.l    #$12032, d0
  004ff2  30710800             movea.w   (a1, d0.l), a0
  004ff6  2f08                 move.l    a0, -(a7)
  004ff8  486efee6             pea.l     -$11a(a6)
  004ffc  4eb9000003e8         jsr       $3e8.l   ; seg4+9f2
  005002  486efee6             pea.l     -$11a(a6)
  005006  a884                 _DrawString 
  005008  48780021             pea.l     $21.w
  00500c  a862                 _ForeColor 
  00500e  4eb9000009b0         jsr       $9b0.l   ; BuildSineTable
  005014  3f3c0008             move.w    #$8, -(a7)
  005018  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00501e  207900007468         movea.l   $7468.l, a0   ; hWorld
  005024  2050                 movea.l   (a0), a0
  005026  302801c4             move.w    $1c4(a0), d0
  00502a  b07900008066         cmp.w     $8066.l, d0   ; curLevel
  005030  544f                 addq.w    #$2, a7
  005032  670e                 beq.b     $5042
  005034  48780002             pea.l     $2.w
  005038  4267                 clr.w     -(a7)
  00503a  61ff00001062         bsr.l     $609e   ; FadeMusic
  005040  5c4f                 addq.w    #$6, a7
  005042  207c0000003c         movea.l   #$3c, a0
  005048  43eefee2             lea.l     -$11e(a6), a1
  00504c  a03b                 _Delay    
  00504e  2280                 move.l    d0, (a1)
  005050  4cdf0408             movem.l   (a7)+, d3/a2
  005054  4e5e                 unlk      a6
  005056  4e75                 rts       

;-------------------------------------------------------------
; EndLevelEffect   (seg 1 +005066, 416 bytes)
  005066  4e56fe6c             link.w    a6, #$fe6c
  00506a  48e71e00             movem.l   d3-d6, -(a7)
  00506e  7c00                 moveq     #$0, d6
  005070  7a00                 moveq     #$0, d5
  005072  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005078  48780021             pea.l     $21.w
  00507c  a862                 _ForeColor 
  00507e  7800                 moveq     #$0, d4
  005080  6028                 bra.b     $50aa
  005082  7600                 moveq     #$0, d3
  005084  601c                 bra.b     $50a2
  005086  700e                 moveq     #$e, d0
  005088  c1c4                 muls.w    d4, d0
  00508a  4480                 neg.l     d0
  00508c  3203                 move.w    d3, d1
  00508e  48c1                 ext.l     d1
  005090  9081                 sub.l     d1, d0
  005092  721c                 moveq     #$1c, d1
  005094  c3c3                 muls.w    d3, d1
  005096  41eefe74             lea.l     -$18c(a6), a0
  00509a  d1c1                 adda.l    d1, a0
  00509c  31804200             move.w    d0, (a0, d4.w * 2)
  0050a0  5243                 addq.w    #$1, d3
  0050a2  0c43000e             cmpi.w    #$e, d3
  0050a6  6dde                 blt.b     $5086
  0050a8  5244                 addq.w    #$1, d4
  0050aa  0c440007             cmpi.w    #$7, d4
  0050ae  6dd2                 blt.b     $5082
  0050b0  780d                 moveq     #$d, d4
  0050b2  601c                 bra.b     $50d0
  0050b4  760d                 moveq     #$d, d3
  0050b6  6012                 bra.b     $50ca
  0050b8  701c                 moveq     #$1c, d0
  0050ba  c1c3                 muls.w    d3, d0
  0050bc  41eefe74             lea.l     -$18c(a6), a0
  0050c0  d1c0                 adda.l    d0, a0
  0050c2  31864200             move.w    d6, (a0, d4.w * 2)
  0050c6  5346                 subq.w    #$1, d6
  0050c8  5343                 subq.w    #$1, d3
  0050ca  4a43                 tst.w     d3
  0050cc  6cea                 bge.b     $50b8
  0050ce  5344                 subq.w    #$1, d4
  0050d0  0c440006             cmpi.w    #$6, d4
  0050d4  6ede                 bgt.b     $50b4
  0050d6  60000120             bra.w     $51f8
  0050da  594f                 subq.w    #$4, a7
  0050dc  a975                 _TickCount 
  0050de  201f                 move.l    (a7)+, d0
  0050e0  2c00                 move.l    d0, d6
  0050e2  7800                 moveq     #$0, d4
  0050e4  602e                 bra.b     $5114
  0050e6  7600                 moveq     #$0, d3
  0050e8  6022                 bra.b     $510c
  0050ea  701c                 moveq     #$1c, d0
  0050ec  c1c3                 muls.w    d3, d0
  0050ee  41eefe74             lea.l     -$18c(a6), a0
  0050f2  d1c0                 adda.l    d0, a0
  0050f4  0c7000114200         cmpi.w    #$11, (a0, d4.w * 2)
  0050fa  6c0e                 bge.b     $510a
  0050fc  701c                 moveq     #$1c, d0
  0050fe  c1c3                 muls.w    d3, d0
  005100  41eefe74             lea.l     -$18c(a6), a0
  005104  d1c0                 adda.l    d0, a0
  005106  52704200             addq.w    #$1, (a0, d4.w * 2)
  00510a  5243                 addq.w    #$1, d3
  00510c  0c43000e             cmpi.w    #$e, d3
  005110  6dd8                 blt.b     $50ea
  005112  5244                 addq.w    #$1, d4
  005114  0c44000e             cmpi.w    #$e, d4
  005118  6dcc                 blt.b     $50e6
  00511a  7800                 moveq     #$0, d4
  00511c  60000098             bra.w     $51b6
  005120  7600                 moveq     #$0, d3
  005122  60000088             bra.w     $51ac
  005126  701c                 moveq     #$1c, d0
  005128  c1c3                 muls.w    d3, d0
  00512a  41eefe74             lea.l     -$18c(a6), a0
  00512e  d1c0                 adda.l    d0, a0
  005130  4a704200             tst.w     (a0, d4.w * 2)
  005134  6f74                 ble.b     $51aa
  005136  3003                 move.w    d3, d0
  005138  48c0                 ext.l     d0
  00513a  eb88                 lsl.l     #$5, d0
  00513c  7220                 moveq     #$20, d1
  00513e  d081                 add.l     d1, d0
  005140  3d40fffe             move.w    d0, -$2(a6)
  005144  3004                 move.w    d4, d0
  005146  48c0                 ext.l     d0
  005148  eb88                 lsl.l     #$5, d0
  00514a  7220                 moveq     #$20, d1
  00514c  d081                 add.l     d1, d0
  00514e  3d40fffc             move.w    d0, -$4(a6)
  005152  701c                 moveq     #$1c, d0
  005154  c1c3                 muls.w    d3, d0
  005156  41eefe74             lea.l     -$18c(a6), a0
  00515a  d1c0                 adda.l    d0, a0
  00515c  3a304200             move.w    (a0, d4.w * 2), d5
  005160  0c450010             cmpi.w    #$10, d5
  005164  6e44                 bgt.b     $51aa
  005166  486efe6c             pea.l     -$194(a6)
  00516a  3005                 move.w    d5, d0
  00516c  48c0                 ext.l     d0
  00516e  322efffe             move.w    -$2(a6), d1
  005172  48c1                 ext.l     d1
  005174  9280                 sub.l     d0, d1
  005176  3f01                 move.w    d1, -(a7)
  005178  3005                 move.w    d5, d0
  00517a  48c0                 ext.l     d0
  00517c  322efffc             move.w    -$4(a6), d1
  005180  48c1                 ext.l     d1
  005182  9280                 sub.l     d0, d1
  005184  3f01                 move.w    d1, -(a7)
  005186  3005                 move.w    d5, d0
  005188  48c0                 ext.l     d0
  00518a  322efffe             move.w    -$2(a6), d1
  00518e  48c1                 ext.l     d1
  005190  d280                 add.l     d0, d1
  005192  3f01                 move.w    d1, -(a7)
  005194  3005                 move.w    d5, d0
  005196  48c0                 ext.l     d0
  005198  322efffc             move.w    -$4(a6), d1
  00519c  48c1                 ext.l     d1
  00519e  d280                 add.l     d0, d1
  0051a0  3f01                 move.w    d1, -(a7)
  0051a2  a8a7                 _SetRect  
  0051a4  486efe6c             pea.l     -$194(a6)
  0051a8  a8a1                 _FrameRect 
  0051aa  5243                 addq.w    #$1, d3
  0051ac  0c43000e             cmpi.w    #$e, d3
  0051b0  6d00ff74             blt.w     $5126
  0051b4  5244                 addq.w    #$1, d4
  0051b6  0c44000e             cmpi.w    #$e, d4
  0051ba  6d00ff64             blt.w     $5120
  0051be  7a01                 moveq     #$1, d5
  0051c0  7800                 moveq     #$0, d4
  0051c2  6022                 bra.b     $51e6
  0051c4  7600                 moveq     #$0, d3
  0051c6  6016                 bra.b     $51de
  0051c8  701c                 moveq     #$1c, d0
  0051ca  c1c3                 muls.w    d3, d0
  0051cc  41eefe74             lea.l     -$18c(a6), a0
  0051d0  d1c0                 adda.l    d0, a0
  0051d2  0c7000114200         cmpi.w    #$11, (a0, d4.w * 2)
  0051d8  6702                 beq.b     $51dc
  0051da  7a00                 moveq     #$0, d5
  0051dc  5243                 addq.w    #$1, d3
  0051de  0c43000e             cmpi.w    #$e, d3
  0051e2  6de4                 blt.b     $51c8
  0051e4  5244                 addq.w    #$1, d4
  0051e6  0c44000e             cmpi.w    #$e, d4
  0051ea  6dd8                 blt.b     $51c4
  0051ec  594f                 subq.w    #$4, a7
  0051ee  a975                 _TickCount 
  0051f0  201f                 move.l    (a7)+, d0
  0051f2  5380                 subq.l    #$1, d0
  0051f4  bc80                 cmp.l     d0, d6
  0051f6  62f4                 bhi.b     $51ec
  0051f8  4a05                 tst.b     d5
  0051fa  6700fede             beq.w     $50da
  0051fe  4cdf0078             movem.l   (a7)+, d3-d6
  005202  4e5e                 unlk      a6
  005204  4e75                 rts       

;-------------------------------------------------------------
; ScrollPlot   (seg 1 +005218, 702 bytes)
  005218  4e56ffce             link.w    a6, #$ffce
  00521c  48e71f20             movem.l   d3-d7/a2, -(a7)
  005220  95ca                 suba.l    a2, a2
  005222  7804                 moveq     #$4, d4
  005224  7e01                 moveq     #$1, d7
  005226  42aeffda             clr.l     -$26(a6)
  00522a  95ca                 suba.l    a2, a2
  00522c  3d7c0008ffe6         move.w    #$8, -$1a(a6)
  005232  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  005238  61ffffffb506         bsr.l     $740   ; DisposeSounds
  00523e  13fc000100013c26     move.b    #$1, $13c26.l   ; g_13c26
  005246  43eeffce             lea.l     -$32(a6), a1
  00524a  a11d                 _trap_a11d 
  00524c  2288                 move.l    a0, (a1)
  00524e  2600                 move.l    d0, d3
  005250  594f                 subq.w    #$4, a7
  005252  3f2e0008             move.w    $8(a6), -(a7)
  005256  a9bc                 _GetPicture 
  005258  205f                 movea.l   (a7)+, a0
  00525a  2448                 movea.l   a0, a2
  00525c  200a                 move.l    a2, d0
  00525e  67000254             beq.w     $54b4
  005262  4a92                 tst.l     (a2)
  005264  6700024e             beq.w     $54b4
  005268  554f                 subq.w    #$2, a7
  00526a  a9af                 _ResError 
  00526c  301f                 move.w    (a7)+, d0
  00526e  48c0                 ext.l     d0
  005270  66000242             bne.w     $54b4
  005274  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00527a  204a                 movea.l   a2, a0
  00527c  a029                 _HLock    
  00527e  2052                 movea.l   (a2), a0
  005280  30280002             move.w    $2(a0), d0
  005284  48c0                 ext.l     d0
  005286  2052                 movea.l   (a2), a0
  005288  3a280006             move.w    $6(a0), d5
  00528c  48c5                 ext.l     d5
  00528e  9a80                 sub.l     d0, d5
  005290  426effd4             clr.w     -$2c(a6)
  005294  426effd2             clr.w     -$2e(a6)
  005298  3d7c0190ffd8         move.w    #$190, -$28(a6)
  00529e  3d45ffd6             move.w    d5, -$2a(a6)
  0052a2  554f                 subq.w    #$2, a7
  0052a4  486effda             pea.l     -$26(a6)
  0052a8  3f3c0008             move.w    #$8, -(a7)
  0052ac  486effd2             pea.l     -$2e(a6)
  0052b0  42a7                 clr.l     -(a7)
  0052b2  42a7                 clr.l     -(a7)
  0052b4  42a7                 clr.l     -(a7)
  0052b6  203c00160000         move.l    #$160000, d0
  0052bc  ab1d                 _QDExtensions 
  0052be  301f                 move.w    (a7)+, d0
  0052c0  3600                 move.w    d0, d3
  0052c2  3003                 move.w    d3, d0
  0052c4  48c0                 ext.l     d0
  0052c6  660001ec             bne.w     $54b4
  0052ca  4aaeffda             tst.l     -$26(a6)
  0052ce  670001e4             beq.w     $54b4
  0052d2  554f                 subq.w    #$2, a7
  0052d4  aa40                 _QDError  
  0052d6  301f                 move.w    (a7)+, d0
  0052d8  48c0                 ext.l     d0
  0052da  660001d8             bne.w     $54b4
  0052de  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0052e4  2f2effda             move.l    -$26(a6), -(a7)
  0052e8  42a7                 clr.l     -(a7)
  0052ea  203c00080006         move.l    #$80006, d0
  0052f0  ab1d                 _QDExtensions 
  0052f2  2f0a                 move.l    a2, -(a7)
  0052f4  486effd2             pea.l     -$2e(a6)
  0052f8  a8f6                 _DrawPicture 
  0052fa  204a                 movea.l   a2, a0
  0052fc  a02a                 _HUnlock  
  0052fe  2f0a                 move.l    a2, -(a7)
  005300  a9a3                 _ReleaseResource 
  005302  554f                 subq.w    #$2, a7
  005304  aa40                 _QDError  
  005306  301f                 move.w    (a7)+, d0
  005308  48c0                 ext.l     d0
  00530a  660001a8             bne.w     $54b4
  00530e  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005314  486effe8             pea.l     -$18(a6)
  005318  2f3cfe400000         move.l    #$fe400000, -(a7)
  00531e  48780190             pea.l     $190.w
  005322  a8a7                 _SetRect  
  005324  486effde             pea.l     -$22(a6)
  005328  2f3c00100028         move.l    #$100028, -(a7)
  00532e  2f3c01d001b8         move.l    #$1d001b8, -(a7)
  005334  a8a7                 _SetRect  
  005336  594f                 subq.w    #$4, a7
  005338  2f2effda             move.l    -$26(a6), -(a7)
  00533c  203c00040017         move.l    #$40017, d0
  005342  ab1d                 _QDExtensions 
  005344  205f                 movea.l   (a7)+, a0
  005346  2448                 movea.l   a0, a2
  005348  200a                 move.l    a2, d0
  00534a  67000168             beq.w     $54b4
  00534e  554f                 subq.w    #$2, a7
  005350  2f0a                 move.l    a2, -(a7)
  005352  203c00040001         move.l    #$40001, d0
  005358  ab1d                 _QDExtensions 
  00535a  101f                 move.b    (a7)+, d0
  00535c  4a2e000a             tst.b     $a(a6)
  005360  6744                 beq.b     $53a6
  005362  207900007468         movea.l   $7468.l, a0   ; hWorld
  005368  2050                 movea.l   (a0), a0
  00536a  4a680144             tst.w     $144(a0)
  00536e  6736                 beq.b     $53a6
  005370  363900000eaa         move.w    $eaa.l, d3   ; g_eaa
  005376  48780002             pea.l     $2.w
  00537a  4267                 clr.w     -(a7)
  00537c  61ff00000d20         bsr.l     $609e   ; FadeMusic
  005382  207900007468         movea.l   $7468.l, a0   ; hWorld
  005388  2050                 movea.l   (a0), a0
  00538a  3f280144             move.w    $144(a0), -(a7)
  00538e  4eb900000260         jsr       $260.l   ; SetMusic
  005394  48780002             pea.l     $2.w
  005398  3f3c0001             move.w    #$1, -(a7)
  00539c  61ff00000d00         bsr.l     $609e   ; FadeMusic
  0053a2  4fef000e             lea.l     $e(a7), a7
  0053a6  7c00                 moveq     #$0, d6
  0053a8  600000b8             bra.w     $5462
  0053ac  594f                 subq.w    #$4, a7
  0053ae  a975                 _TickCount 
  0053b0  201f                 move.l    (a7)+, d0
  0053b2  2600                 move.l    d0, d3
  0053b4  df6effe8             add.w     d7, -$18(a6)
  0053b8  df6effec             add.w     d7, -$14(a6)
  0053bc  2d6effe8fff8         move.l    -$18(a6), -$8(a6)
  0053c2  2d6effecfffc         move.l    -$14(a6), -$4(a6)
  0053c8  2d6effdefff0         move.l    -$22(a6), -$10(a6)
  0053ce  2d6effe2fff4         move.l    -$1e(a6), -$c(a6)
  0053d4  4a6efff8             tst.w     -$8(a6)
  0053d8  6c1e                 bge.b     $53f8
  0053da  4a6efff8             tst.w     -$8(a6)
  0053de  6f08                 ble.b     $53e8
  0053e0  302efff8             move.w    -$8(a6), d0
  0053e4  48c0                 ext.l     d0
  0053e6  6008                 bra.b     $53f0
  0053e8  302efff8             move.w    -$8(a6), d0
  0053ec  48c0                 ext.l     d0
  0053ee  4480                 neg.l     d0
  0053f0  d16efff0             add.w     d0, -$10(a6)
  0053f4  426efff8             clr.w     -$8(a6)
  0053f8  ba6efffc             cmp.w     -$4(a6), d5
  0053fc  6c14                 bge.b     $5412
  0053fe  3005                 move.w    d5, d0
  005400  48c0                 ext.l     d0
  005402  322efffc             move.w    -$4(a6), d1
  005406  48c1                 ext.l     d1
  005408  9280                 sub.l     d0, d1
  00540a  936efff4             sub.w     d1, -$c(a6)
  00540e  3d45fffc             move.w    d5, -$4(a6)
  005412  2f12                 move.l    (a2), -(a7)
  005414  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  00541a  20680002             movea.l   $2(a0), a0
  00541e  2f10                 move.l    (a0), -(a7)
  005420  486efff8             pea.l     -$8(a6)
  005424  486efff0             pea.l     -$10(a6)
  005428  4267                 clr.w     -(a7)
  00542a  42a7                 clr.l     -(a7)
  00542c  a8ec                 _CopyBits 
  00542e  4a6effe6             tst.w     -$1a(a6)
  005432  6f04                 ble.b     $5438
  005434  536effe6             subq.w    #$1, -$1a(a6)
  005438  554f                 subq.w    #$2, a7
  00543a  a974                 _Button   
  00543c  101f                 move.b    (a7)+, d0
  00543e  660a                 bne.b     $544a
  005440  4eb900000a78         jsr       $a78.l   ; IsAnyKeyDown
  005446  4a00                 tst.b     d0
  005448  670a                 beq.b     $5454
  00544a  4a6effe6             tst.w     -$1a(a6)
  00544e  6604                 bne.b     $5454
  005450  3c3c61a8             move.w    #$61a8, d6
  005454  594f                 subq.w    #$4, a7
  005456  a975                 _TickCount 
  005458  201f                 move.l    (a7)+, d0
  00545a  9084                 sub.l     d4, d0
  00545c  b680                 cmp.l     d0, d3
  00545e  62f4                 bhi.b     $5454
  005460  dc47                 add.w     d7, d6
  005462  3005                 move.w    d5, d0
  005464  48c0                 ext.l     d0
  005466  0680000001c0         addi.l    #$1c0, d0
  00546c  3206                 move.w    d6, d1
  00546e  48c1                 ext.l     d1
  005470  b280                 cmp.l     d0, d1
  005472  6f00ff38             ble.w     $53ac
  005476  2f0a                 move.l    a2, -(a7)
  005478  203c00040002         move.l    #$40002, d0
  00547e  ab1d                 _QDExtensions 
  005480  4aaeffda             tst.l     -$26(a6)
  005484  670c                 beq.b     $5492
  005486  2f2effda             move.l    -$26(a6), -(a7)
  00548a  203c00040004         move.l    #$40004, d0
  005490  ab1d                 _QDExtensions 
  005492  4a2e000a             tst.b     $a(a6)
  005496  671c                 beq.b     $54b4
  005498  207900007468         movea.l   $7468.l, a0   ; hWorld
  00549e  2050                 movea.l   (a0), a0
  0054a0  4a680144             tst.w     $144(a0)
  0054a4  670e                 beq.b     $54b4
  0054a6  48780002             pea.l     $2.w
  0054aa  4267                 clr.w     -(a7)
  0054ac  61ff00000bf0         bsr.l     $609e   ; FadeMusic
  0054b2  5c4f                 addq.w    #$6, a7
  0054b4  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0054ba  48780021             pea.l     $21.w
  0054be  a862                 _ForeColor 
  0054c0  48790000559a         pea.l     $559a.l   ; g_559a
  0054c6  a8a2                 _PaintRect 
  0054c8  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  0054ce  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  0054d2  4e5e                 unlk      a6
  0054d4  4e75                 rts       

;-------------------------------------------------------------
; Win   (seg 1 +0054e4, 266 bytes)
  0054e4  4e560000             link.w    a6, #$0
  0054e8  2f03                 move.l    d3, -(a7)
  0054ea  207900007468         movea.l   $7468.l, a0   ; hWorld
  0054f0  2050                 movea.l   (a0), a0
  0054f2  4a68014c             tst.w     $14c(a0)
  0054f6  6730                 beq.b     $5528
  0054f8  48780006             pea.l     $6.w
  0054fc  4267                 clr.w     -(a7)
  0054fe  61ff00000b9e         bsr.l     $609e   ; FadeMusic
  005504  207900007468         movea.l   $7468.l, a0   ; hWorld
  00550a  2050                 movea.l   (a0), a0
  00550c  3f28014c             move.w    $14c(a0), -(a7)
  005510  4eb900000260         jsr       $260.l   ; SetMusic
  005516  48780006             pea.l     $6.w
  00551a  3f3c0001             move.w    #$1, -(a7)
  00551e  61ff00000b7e         bsr.l     $609e   ; FadeMusic
  005524  4fef000e             lea.l     $e(a7), a7
  005528  207900007468         movea.l   $7468.l, a0   ; hWorld
  00552e  2050                 movea.l   (a0), a0
  005530  4a680146             tst.w     $146(a0)
  005534  6716                 beq.b     $554c
  005536  4227                 clr.b     -(a7)
  005538  207900007468         movea.l   $7468.l, a0   ; hWorld
  00553e  2050                 movea.l   (a0), a0
  005540  3f280146             move.w    $146(a0), -(a7)
  005544  61fffffffcd2         bsr.l     $5218   ; ScrollPlot
  00554a  584f                 addq.w    #$4, a7
  00554c  3f3c004b             move.w    #$4b, -(a7)
  005550  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  005556  207900007468         movea.l   $7468.l, a0   ; hWorld
  00555c  2050                 movea.l   (a0), a0
  00555e  4a680148             tst.w     $148(a0)
  005562  544f                 addq.w    #$2, a7
  005564  67000082             beq.w     $55e8
  005568  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00556e  48780021             pea.l     $21.w
  005572  a862                 _ForeColor 
  005574  4879000055a2         pea.l     $55a2.l   ; g_55a2
  00557a  a8a2                 _PaintRect 
  00557c  4eb900000cb8         jsr       $cb8.l   ; SetResWorldFile
  005582  207900007468         movea.l   $7468.l, a0   ; hWorld
  005588  2050                 movea.l   (a0), a0
  00558a  3f280148             move.w    $148(a0), -(a7)
  00558e  4eb900000078         jsr       $78.l   ; SATGETANDDRAWPICTRES
  005594  4eb900000cc0         jsr       $cc0.l   ; RestoreResWorldFile
  00559a  3f3c004b             move.w    #$4b, -(a7)
  00559e  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  0055a4  594f                 subq.w    #$4, a7
  0055a6  a975                 _TickCount 
  0055a8  201f                 move.l    (a7)+, d0
  0055aa  207900007468         movea.l   $7468.l, a0   ; hWorld
  0055b0  2050                 movea.l   (a0), a0
  0055b2  723c                 moveq     #$3c, d1
  0055b4  c3e8014a             muls.w    $14a(a0), d1
  0055b8  d280                 add.l     d0, d1
  0055ba  2601                 move.l    d1, d3
  0055bc  544f                 addq.w    #$2, a7
  0055be  6006                 bra.b     $55c6
  0055c0  4eb900000270         jsr       $270.l   ; MusicIdle
  0055c6  594f                 subq.w    #$4, a7
  0055c8  a975                 _TickCount 
  0055ca  201f                 move.l    (a7)+, d0
  0055cc  b083                 cmp.l     d3, d0
  0055ce  65f0                 bcs.b     $55c0
  0055d0  48780006             pea.l     $6.w
  0055d4  4267                 clr.w     -(a7)
  0055d6  61ff00000ac6         bsr.l     $609e   ; FadeMusic
  0055dc  3f3c004b             move.w    #$4b, -(a7)
  0055e0  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  0055e6  504f                 addq.w    #$8, a7
  0055e8  261f                 move.l    (a7)+, d3
  0055ea  4e5e                 unlk      a6
  0055ec  4e75                 rts       

;-------------------------------------------------------------
; UpLevel   (seg 1 +0055f4, 1286 bytes)
  0055f4  4e56fffa             link.w    a6, #$fffa
  0055f8  48e71c00             movem.l   d3-d5, -(a7)
  0055fc  422effff             clr.b     -$1(a6)
  005600  7a00                 moveq     #$0, d5
  005602  7801                 moveq     #$1, d4
  005604  2f3c000a0100         move.l    #$a0100, -(a7)
  00560a  2f390000846a         move.l    $846a.l, -(a7)   ; snd4800_Level_Up
  005610  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  005616  61fffffffa4e         bsr.l     $5066   ; EndLevelEffect
  00561c  504f                 addq.w    #$8, a7
  00561e  605a                 bra.b     $567a
  005620  7800                 moveq     #$0, d4
  005622  7600                 moveq     #$0, d3
  005624  604e                 bra.b     $5674
  005626  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00562c  0c702c853400         cmpi.w    #$2c85, (a0, d3.w * 4)
  005632  671c                 beq.b     $5650
  005634  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00563a  0c702c863400         cmpi.w    #$2c86, (a0, d3.w * 4)
  005640  670e                 beq.b     $5650
  005642  41f900008090         lea.l     $8090.l, a0   ; g_8090
  005648  0c702c873400         cmpi.w    #$2c87, (a0, d3.w * 4)
  00564e  6622                 bne.b     $5672
  005650  41f900008090         lea.l     $8090.l, a0   ; g_8090
  005656  4a703402             tst.w     $2(a0, d3.w * 4)
  00565a  6f16                 ble.b     $5672
  00565c  3803                 move.w    d3, d4
  00565e  3f04                 move.w    d4, -(a7)
  005660  4eb900000448         jsr       $448.l   ; SwitchInvItem
  005666  3f04                 move.w    d4, -(a7)
  005668  4eb900000440         jsr       $440.l   ; RemoveInvItem
  00566e  7801                 moveq     #$1, d4
  005670  584f                 addq.w    #$4, a7
  005672  5243                 addq.w    #$1, d3
  005674  0c43000c             cmpi.w    #$c, d3
  005678  6dac                 blt.b     $5626
  00567a  4a04                 tst.b     d4
  00567c  66a2                 bne.b     $5620
  00567e  61ff00000618         bsr.l     $5c98   ; RestorePreExistingWindowBackground
  005684  207900007468         movea.l   $7468.l, a0   ; hWorld
  00568a  2050                 movea.l   (a0), a0
  00568c  303900008066         move.w    $8066.l, d0   ; curLevel
  005692  b06801c6             cmp.w     $1c6(a0), d0
  005696  6f12                 ble.b     $56aa
  005698  61fffffffe4a         bsr.l     $54e4   ; Win
  00569e  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  0056a6  6000044a             bra.w     $5af2
  0056aa  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0056b0  2250                 movea.l   (a0), a1
  0056b2  203c0001207e         move.l    #$1207e, d0
  0056b8  4a710800             tst.w     (a1, d0.l)
  0056bc  671e                 beq.b     $56dc
  0056be  1f3c0001             move.b    #$1, -(a7)
  0056c2  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0056c8  2250                 movea.l   (a0), a1
  0056ca  203c0001207e         move.l    #$1207e, d0
  0056d0  3f310800             move.w    (a1, d0.l), -(a7)
  0056d4  61fffffffb42         bsr.l     $5218   ; ScrollPlot
  0056da  584f                 addq.w    #$4, a7
  0056dc  0c79ff0100008066     cmpi.w    #$ff01, $8066.l   ; curLevel
  0056e4  6610                 bne.b     $56f6
  0056e6  3039000046c6         move.w    $46c6.l, d0   ; g_46c6
  0056ec  48c0                 ext.l     d0
  0056ee  5280                 addq.l    #$1, d0
  0056f0  33c000008066         move.w    d0, $8066.l   ; curLevel
  0056f6  0c79000600008066     cmpi.w    #$6, $8066.l   ; curLevel
  0056fe  6d00010e             blt.w     $580e
  005702  486effff             pea.l     -$1(a6)
  005706  4eb900000150         jsr       $150.l   ; seg7+609a
  00570c  3600                 move.w    d0, d3
  00570e  4a43                 tst.w     d3
  005710  584f                 addq.w    #$4, a7
  005712  660000de             bne.w     $57f2
  005716  4a2effff             tst.b     -$1(a6)
  00571a  6706                 beq.b     $5722
  00571c  7a01                 moveq     #$1, d5
  00571e  600000f0             bra.w     $5810
  005722  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  005728  4a3900006173         tst.b     $6173.l   ; g_6173
  00572e  670000b2             beq.w     $57e2
  005732  303900008066         move.w    $8066.l, d0   ; curLevel
  005738  48c0                 ext.l     d0
  00573a  5380                 subq.l    #$1, d0
  00573c  4c3c080000001388     muls.l    #$1388, d0
  005744  d1b90000807a         add.l     d0, $807a.l   ; g_807a
  00574a  23f90000807a0000807e move.l    $807a.l, $807e.l   ; g_807a, g_807e
  005754  4227                 clr.b     -(a7)
  005756  61ffffffc822         bsr.l     $1f7a   ; UpdateText
  00575c  33f9000046c40000f6c4 move.w    $46c4.l, $f6c4.l   ; g_46c4, g_f6c4
  005766  33f9000046c20000f6c6 move.w    $46c2.l, $f6c6.l   ; g_46c2, g_f6c6
  005770  33f9000046c00000f6c8 move.w    $46c0.l, $f6c8.l   ; g_46c0, g_f6c8
  00577a  23f90000807a0000f6c0 move.l    $807a.l, $f6c0.l   ; g_807a, g_f6c0
  005784  33f9000080820000f6d0 move.w    $8082.l, $f6d0.l   ; g_8082, g_f6d0
  00578e  33f9000080840000f6d2 move.w    $8084.l, $f6d2.l   ; g_8084, g_f6d2
  005798  33f9000080860000f6d4 move.w    $8086.l, $f6d4.l   ; g_8086, g_f6d4
  0057a2  7600                 moveq     #$0, d3
  0057a4  544f                 addq.w    #$2, a7
  0057a6  6014                 bra.b     $57bc
  0057a8  41f900008090         lea.l     $8090.l, a0   ; g_8090
  0057ae  43f90000f6d8         lea.l     $f6d8.l, a1   ; g_f6d8
  0057b4  23b034003400         move.l    (a0, d3.w * 4), (a1, d3.w * 4)
  0057ba  5243                 addq.w    #$1, d3
  0057bc  0c43000c             cmpi.w    #$c, d3
  0057c0  6de6                 blt.b     $57a8
  0057c2  207900007470         movea.l   $7470.l, a0   ; hSave
  0057c8  2050                 movea.l   (a0), a0
  0057ca  42280004             clr.b     $4(a0)
  0057ce  13fc000100007f1d     move.b    #$1, $7f1d.l   ; g_7f1d
  0057d6  61ff0000493a         bsr.l     $a112   ; DoSaveGame
  0057dc  423900007f1d         clr.b     $7f1d.l   ; g_7f1d
  0057e2  61ff0000705a         bsr.l     $c83e   ; LevelLimit
  0057e8  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  0057f0  601e                 bra.b     $5810
  0057f2  3f03                 move.w    d3, -(a7)
  0057f4  4879000051cc         pea.l     $51cc.l   ; g_51cc
  0057fa  4eb900000be8         jsr       $be8.l   ; ReportError
  005800  7a00                 moveq     #$0, d5
  005802  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  00580a  5c4f                 addq.w    #$6, a7
  00580c  6002                 bra.b     $5810
  00580e  7a01                 moveq     #$1, d5
  005810  4a05                 tst.b     d5
  005812  670002de             beq.w     $5af2
  005816  303900008066         move.w    $8066.l, d0   ; curLevel
  00581c  48c0                 ext.l     d0
  00581e  5380                 subq.l    #$1, d0
  005820  4c3c080000001388     muls.l    #$1388, d0
  005828  d1b90000807a         add.l     d0, $807a.l   ; g_807a
  00582e  23f90000807a0000807e move.l    $807a.l, $807e.l   ; g_807a, g_807e
  005838  4227                 clr.b     -(a7)
  00583a  61ffffffc73e         bsr.l     $1f7a   ; UpdateText
  005840  33f9000046c40000f6c4 move.w    $46c4.l, $f6c4.l   ; g_46c4, g_f6c4
  00584a  33f9000046c20000f6c6 move.w    $46c2.l, $f6c6.l   ; g_46c2, g_f6c6
  005854  33f9000046c00000f6c8 move.w    $46c0.l, $f6c8.l   ; g_46c0, g_f6c8
  00585e  23f90000807a0000f6c0 move.l    $807a.l, $f6c0.l   ; g_807a, g_f6c0
  005868  33f9000080820000f6d0 move.w    $8082.l, $f6d0.l   ; g_8082, g_f6d0
  005872  33f9000080840000f6d2 move.w    $8084.l, $f6d2.l   ; g_8084, g_f6d2
  00587c  33f9000080860000f6d4 move.w    $8086.l, $f6d4.l   ; g_8086, g_f6d4
  005886  7600                 moveq     #$0, d3
  005888  544f                 addq.w    #$2, a7
  00588a  6014                 bra.b     $58a0
  00588c  41f900008090         lea.l     $8090.l, a0   ; g_8090
  005892  43f90000f6d8         lea.l     $f6d8.l, a1   ; g_f6d8
  005898  23b034003400         move.l    (a0, d3.w * 4), (a1, d3.w * 4)
  00589e  5243                 addq.w    #$1, d3
  0058a0  0c43000c             cmpi.w    #$c, d3
  0058a4  6de6                 blt.b     $588c
  0058a6  207900007470         movea.l   $7470.l, a0   ; hSave
  0058ac  2050                 movea.l   (a0), a0
  0058ae  42280004             clr.b     $4(a0)
  0058b2  4a3900006173         tst.b     $6173.l   ; g_6173
  0058b8  671c                 beq.b     $58d6
  0058ba  13fc000100007f1d     move.b    #$1, $7f1d.l   ; g_7f1d
  0058c2  61ff0000484e         bsr.l     $a112   ; DoSaveGame
  0058c8  423900007f1d         clr.b     $7f1d.l   ; g_7f1d
  0058ce  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  0058d6  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0058dc  48780021             pea.l     $21.w
  0058e0  a862                 _ForeColor 
  0058e2  48790000559a         pea.l     $559a.l   ; g_559a
  0058e8  a8a2                 _PaintRect 
  0058ea  4eb900000aa8         jsr       $aa8.l   ; KillAllSprites
  0058f0  487900007f64         pea.l     $7f64.l   ; g_7f64
  0058f6  3f3900008066         move.w    $8066.l, -(a7)   ; curLevel
  0058fc  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  005902  61fffffff4a0         bsr.l     $4da4   ; IntroLevel
  005908  33fc004500008064     move.w    #$45, $8064.l   ; g_8064
  005910  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005916  2250                 movea.l   (a0), a1
  005918  203c000120f6         move.l    #$120f6, d0
  00591e  30310800             move.w    (a1, d0.l), d0
  005922  48c0                 ext.l     d0
  005924  72e0                 moveq     #$e0, d1
  005926  d081                 add.l     d1, d0
  005928  33c000008074         move.w    d0, $8074.l   ; playerH
  00592e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005934  2250                 movea.l   (a0), a1
  005936  203c000120f4         move.l    #$120f4, d0
  00593c  30310800             move.w    (a1, d0.l), d0
  005940  48c0                 ext.l     d0
  005942  72e0                 moveq     #$e0, d1
  005944  d081                 add.l     d1, d0
  005946  33c000008076         move.w    d0, $8076.l   ; playerV
  00594c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005952  2250                 movea.l   (a0), a1
  005954  203c000120f6         move.l    #$120f6, d0
  00595a  30310800             move.w    (a1, d0.l), d0
  00595e  48c0                 ext.l     d0
  005960  0680ffffff10         addi.l    #$ffffff10, d0
  005966  33c00000806e         move.w    d0, $806e.l   ; viewLeft2
  00596c  33c00000806a         move.w    d0, $806a.l   ; viewLeft
  005972  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005978  2250                 movea.l   (a0), a1
  00597a  203c000120f4         move.l    #$120f4, d0
  005980  30310800             move.w    (a1, d0.l), d0
  005984  48c0                 ext.l     d0
  005986  0680ffffff10         addi.l    #$ffffff10, d0
  00598c  33c00000806c         move.w    d0, $806c.l   ; viewTop2
  005992  33c000008068         move.w    d0, $8068.l   ; viewTop
  005998  4227                 clr.b     -(a7)
  00599a  61ffffffc5de         bsr.l     $1f7a   ; UpdateText
  0059a0  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0059a6  2250                 movea.l   (a0), a1
  0059a8  203c00012080         move.l    #$12080, d0
  0059ae  4a710800             tst.w     (a1, d0.l)
  0059b2  504f                 addq.w    #$8, a7
  0059b4  672c                 beq.b     $59e2
  0059b6  48780021             pea.l     $21.w
  0059ba  a862                 _ForeColor 
  0059bc  48790000559a         pea.l     $559a.l   ; g_559a
  0059c2  a8a2                 _PaintRect 
  0059c4  1f3c0001             move.b    #$1, -(a7)
  0059c8  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0059ce  2250                 movea.l   (a0), a1
  0059d0  203c00012080         move.l    #$12080, d0
  0059d6  3f310800             move.w    (a1, d0.l), -(a7)
  0059da  61fffffff83c         bsr.l     $5218   ; ScrollPlot
  0059e0  584f                 addq.w    #$4, a7
  0059e2  61ffffffe6f8         bsr.l     $40dc   ; SetupLevelSprites
  0059e8  3f390000806a         move.w    $806a.l, -(a7)   ; viewLeft
  0059ee  3f3900008068         move.w    $8068.l, -(a7)   ; viewTop
  0059f4  4eb9000002e0         jsr       $2e0.l   ; SCROLLTO
  0059fa  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  005a00  594f                 subq.w    #$4, a7
  005a02  4267                 clr.w     -(a7)
  005a04  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005a0a  2250                 movea.l   (a0), a1
  005a0c  203c000120f6         move.l    #$120f6, d0
  005a12  30310800             move.w    (a1, d0.l), d0
  005a16  48c0                 ext.l     d0
  005a18  72e0                 moveq     #$e0, d1
  005a1a  d081                 add.l     d1, d0
  005a1c  3f00                 move.w    d0, -(a7)
  005a1e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005a24  2250                 movea.l   (a0), a1
  005a26  203c000120f4         move.l    #$120f4, d0
  005a2c  30310800             move.w    (a1, d0.l), d0
  005a30  48c0                 ext.l     d0
  005a32  72e0                 moveq     #$e0, d1
  005a34  d081                 add.l     d1, d0
  005a36  3f00                 move.w    d0, -(a7)
  005a38  487900000460         pea.l     $460.l   ; SETUPPLAYERSPRITE
  005a3e  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  005a44  205f                 movea.l   (a7)+, a0
  005a46  23c800008070         move.l    a0, $8070.l   ; playerSprite
  005a4c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005a52  2250                 movea.l   (a0), a1
  005a54  203c000120f8         move.l    #$120f8, d0
  005a5a  207900008070         movea.l   $8070.l, a0   ; playerSprite
  005a60  317108000066         move.w    (a1, d0.l), $66(a0)
  005a66  594f                 subq.w    #$4, a7
  005a68  4267                 clr.w     -(a7)
  005a6a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005a70  2250                 movea.l   (a0), a1
  005a72  203c000120f6         move.l    #$120f6, d0
  005a78  3f310800             move.w    (a1, d0.l), -(a7)
  005a7c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005a82  2250                 movea.l   (a0), a1
  005a84  203c000120f4         move.l    #$120f4, d0
  005a8a  3f310800             move.w    (a1, d0.l), -(a7)
  005a8e  4879000007b0         pea.l     $7b0.l   ; SETUPHELDWEAPONSPRITE
  005a94  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  005a9a  205f                 movea.l   (a7)+, a0
  005a9c  2d48fffa             move.l    a0, -$6(a6)
  005aa0  20790000746c         movea.l   $746c.l, a0   ; hLevel
  005aa6  2250                 movea.l   (a0), a1
  005aa8  203c000120fa         move.l    #$120fa, d0
  005aae  3f310800             move.w    (a1, d0.l), -(a7)
  005ab2  4eb900000260         jsr       $260.l   ; SetMusic
  005ab8  48780002             pea.l     $2.w
  005abc  3f3c0001             move.w    #$1, -(a7)
  005ac0  61ff000005dc         bsr.l     $609e   ; FadeMusic
  005ac6  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005acc  48780021             pea.l     $21.w
  005ad0  a862                 _ForeColor 
  005ad2  48790000559a         pea.l     $559a.l   ; g_559a
  005ad8  a8a2                 _PaintRect 
  005ada  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  005ae2  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  005aea  4eb900000c90         jsr       $c90.l   ; RedrawGameArea
  005af0  504f                 addq.w    #$8, a7
  005af2  4cdf0038             movem.l   (a7)+, d3-d5
  005af6  4e5e                 unlk      a6
  005af8  4e75                 rts       

;-------------------------------------------------------------
; RestoreWindowBackground   (seg 1 +005b04, 378 bytes)
  005b04  4e56fff8             link.w    a6, #$fff8
  005b08  486efff8             pea.l     -$8(a6)
  005b0c  2f3c00100010         move.l    #$100010, -(a7)
  005b12  2f3c01d001d0         move.l    #$1d001d0, -(a7)
  005b18  a8a7                 _SetRect  
  005b1a  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  005b20  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  005b26  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  005b2c  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  005b32  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  005b38  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  005b3e  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  005b44  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  005b4a  4a3900006174         tst.b     $6174.l   ; prefInterlace
  005b50  670e                 beq.b     $5b60
  005b52  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  005b58  6606                 bne.b     $5b60
  005b5a  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  005b60  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  005b66  48680002             pea.l     $2(a0)
  005b6a  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005b70  48680002             pea.l     $2(a0)
  005b74  486efff8             pea.l     -$8(a6)
  005b78  486efff8             pea.l     -$8(a6)
  005b7c  4267                 clr.w     -(a7)
  005b7e  42a7                 clr.l     -(a7)
  005b80  a8ec                 _CopyBits 
  005b82  486efff8             pea.l     -$8(a6)
  005b86  42a7                 clr.l     -(a7)
  005b88  2f3c00100280         move.l    #$100280, -(a7)
  005b8e  a8a7                 _SetRect  
  005b90  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005b96  48680002             pea.l     $2(a0)
  005b9a  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005ba0  48680002             pea.l     $2(a0)
  005ba4  486efff8             pea.l     -$8(a6)
  005ba8  486efff8             pea.l     -$8(a6)
  005bac  4267                 clr.w     -(a7)
  005bae  42a7                 clr.l     -(a7)
  005bb0  a8ec                 _CopyBits 
  005bb2  486efff8             pea.l     -$8(a6)
  005bb6  2f3c01d00000         move.l    #$1d00000, -(a7)
  005bbc  2f3c01e00280         move.l    #$1e00280, -(a7)
  005bc2  a8a7                 _SetRect  
  005bc4  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005bca  48680002             pea.l     $2(a0)
  005bce  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005bd4  48680002             pea.l     $2(a0)
  005bd8  486efff8             pea.l     -$8(a6)
  005bdc  486efff8             pea.l     -$8(a6)
  005be0  4267                 clr.w     -(a7)
  005be2  42a7                 clr.l     -(a7)
  005be4  a8ec                 _CopyBits 
  005be6  486efff8             pea.l     -$8(a6)
  005bea  42a7                 clr.l     -(a7)
  005bec  2f3c01e00010         move.l    #$1e00010, -(a7)
  005bf2  a8a7                 _SetRect  
  005bf4  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005bfa  48680002             pea.l     $2(a0)
  005bfe  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005c04  48680002             pea.l     $2(a0)
  005c08  486efff8             pea.l     -$8(a6)
  005c0c  486efff8             pea.l     -$8(a6)
  005c10  4267                 clr.w     -(a7)
  005c12  42a7                 clr.l     -(a7)
  005c14  a8ec                 _CopyBits 
  005c16  486efff8             pea.l     -$8(a6)
  005c1a  42a7                 clr.l     -(a7)
  005c1c  2f3c00100280         move.l    #$100280, -(a7)
  005c22  a8a7                 _SetRect  
  005c24  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005c2a  48680002             pea.l     $2(a0)
  005c2e  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005c34  48680002             pea.l     $2(a0)
  005c38  486efff8             pea.l     -$8(a6)
  005c3c  486efff8             pea.l     -$8(a6)
  005c40  4267                 clr.w     -(a7)
  005c42  42a7                 clr.l     -(a7)
  005c44  a8ec                 _CopyBits 
  005c46  486efff8             pea.l     -$8(a6)
  005c4a  2f3c001001d0         move.l    #$1001d0, -(a7)
  005c50  2f3c01d00280         move.l    #$1d00280, -(a7)
  005c56  a8a7                 _SetRect  
  005c58  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005c5e  48680002             pea.l     $2(a0)
  005c62  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005c68  48680002             pea.l     $2(a0)
  005c6c  486efff8             pea.l     -$8(a6)
  005c70  486efff8             pea.l     -$8(a6)
  005c74  4267                 clr.w     -(a7)
  005c76  42a7                 clr.l     -(a7)
  005c78  a8ec                 _CopyBits 
  005c7a  4e5e                 unlk      a6
  005c7c  4e75                 rts       

;-------------------------------------------------------------
; RestorePreExistingWindowBackground   (seg 1 +005c98, 308 bytes)
  005c98  4e56fff8             link.w    a6, #$fff8
  005c9c  486efff8             pea.l     -$8(a6)
  005ca0  2f3c00100010         move.l    #$100010, -(a7)
  005ca6  2f3c01d001d0         move.l    #$1d001d0, -(a7)
  005cac  a8a7                 _SetRect  
  005cae  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  005cb4  48680002             pea.l     $2(a0)
  005cb8  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005cbe  48680002             pea.l     $2(a0)
  005cc2  486efff8             pea.l     -$8(a6)
  005cc6  486efff8             pea.l     -$8(a6)
  005cca  4267                 clr.w     -(a7)
  005ccc  42a7                 clr.l     -(a7)
  005cce  a8ec                 _CopyBits 
  005cd0  486efff8             pea.l     -$8(a6)
  005cd4  42a7                 clr.l     -(a7)
  005cd6  2f3c00100280         move.l    #$100280, -(a7)
  005cdc  a8a7                 _SetRect  
  005cde  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005ce4  48680002             pea.l     $2(a0)
  005ce8  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005cee  48680002             pea.l     $2(a0)
  005cf2  486efff8             pea.l     -$8(a6)
  005cf6  486efff8             pea.l     -$8(a6)
  005cfa  4267                 clr.w     -(a7)
  005cfc  42a7                 clr.l     -(a7)
  005cfe  a8ec                 _CopyBits 
  005d00  486efff8             pea.l     -$8(a6)
  005d04  2f3c01d00000         move.l    #$1d00000, -(a7)
  005d0a  2f3c01e00280         move.l    #$1e00280, -(a7)
  005d10  a8a7                 _SetRect  
  005d12  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005d18  48680002             pea.l     $2(a0)
  005d1c  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005d22  48680002             pea.l     $2(a0)
  005d26  486efff8             pea.l     -$8(a6)
  005d2a  486efff8             pea.l     -$8(a6)
  005d2e  4267                 clr.w     -(a7)
  005d30  42a7                 clr.l     -(a7)
  005d32  a8ec                 _CopyBits 
  005d34  486efff8             pea.l     -$8(a6)
  005d38  42a7                 clr.l     -(a7)
  005d3a  2f3c01e00010         move.l    #$1e00010, -(a7)
  005d40  a8a7                 _SetRect  
  005d42  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005d48  48680002             pea.l     $2(a0)
  005d4c  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005d52  48680002             pea.l     $2(a0)
  005d56  486efff8             pea.l     -$8(a6)
  005d5a  486efff8             pea.l     -$8(a6)
  005d5e  4267                 clr.w     -(a7)
  005d60  42a7                 clr.l     -(a7)
  005d62  a8ec                 _CopyBits 
  005d64  486efff8             pea.l     -$8(a6)
  005d68  42a7                 clr.l     -(a7)
  005d6a  2f3c00100280         move.l    #$100280, -(a7)
  005d70  a8a7                 _SetRect  
  005d72  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005d78  48680002             pea.l     $2(a0)
  005d7c  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005d82  48680002             pea.l     $2(a0)
  005d86  486efff8             pea.l     -$8(a6)
  005d8a  486efff8             pea.l     -$8(a6)
  005d8e  4267                 clr.w     -(a7)
  005d90  42a7                 clr.l     -(a7)
  005d92  a8ec                 _CopyBits 
  005d94  486efff8             pea.l     -$8(a6)
  005d98  2f3c001001d0         move.l    #$1001d0, -(a7)
  005d9e  2f3c01d00280         move.l    #$1d00280, -(a7)
  005da4  a8a7                 _SetRect  
  005da6  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005dac  48680002             pea.l     $2(a0)
  005db0  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005db6  48680002             pea.l     $2(a0)
  005dba  486efff8             pea.l     -$8(a6)
  005dbe  486efff8             pea.l     -$8(a6)
  005dc2  4267                 clr.w     -(a7)
  005dc4  42a7                 clr.l     -(a7)
  005dc6  a8ec                 _CopyBits 
  005dc8  4e5e                 unlk      a6
  005dca  4e75                 rts       

;-------------------------------------------------------------
; CapsLockDown   (seg 1 +005df2, 28 bytes)
  005df2  4e56fff0             link.w    a6, #$fff0
  005df6  486efff0             pea.l     -$10(a6)
  005dfa  a976                 _GetKeys  
  005dfc  554f                 subq.w    #$2, a7
  005dfe  486efff0             pea.l     -$10(a6)
  005e02  4878003e             pea.l     $3e.w
  005e06  a85d                 _BitTst   
  005e08  101f                 move.b    (a7)+, d0
  005e0a  4e5e                 unlk      a6
  005e0c  4e75                 rts       

;-------------------------------------------------------------
; Pause   (seg 1 +005e1e, 632 bytes)
  005e1e  4e56ffe8             link.w    a6, #$ffe8
  005e22  2f03                 move.l    d3, -(a7)
  005e24  760a                 moveq     #$a, d3
  005e26  426efff4             clr.w     -$c(a6)
  005e2a  426efff6             clr.w     -$a(a6)
  005e2e  3d7c0096fff2         move.w    #$96, -$e(a6)
  005e34  3d7c00d2fff0         move.w    #$d2, -$10(a6)
  005e3a  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  005e40  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  005e46  2f3c00640100         move.l    #$640100, -(a7)
  005e4c  2f3900013c2a         move.l    $13c2a.l, -(a7)   ; snd198_pause_snd
  005e52  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  005e58  486effe8             pea.l     -$18(a6)
  005e5c  2f3c00c00080         move.l    #$c00080, -(a7)
  005e62  2f3c01200161         move.l    #$1200161, -(a7)
  005e68  a8a7                 _SetRect  
  005e6a  486efff8             pea.l     -$8(a6)
  005e6e  2f3c00100010         move.l    #$100010, -(a7)
  005e74  2f3c01d001d0         move.l    #$1d001d0, -(a7)
  005e7a  a8a7                 _SetRect  
  005e7c  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  005e82  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  005e88  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  005e8e  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  005e94  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  005e9a  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  005ea0  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  005ea6  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  005eac  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  005eb2  3f3c1339             move.w    #$1339, -(a7)
  005eb6  486effe8             pea.l     -$18(a6)
  005eba  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  005ec0  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  005ec6  48680002             pea.l     $2(a0)
  005eca  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005ed0  48680002             pea.l     $2(a0)
  005ed4  486efff8             pea.l     -$8(a6)
  005ed8  486efff8             pea.l     -$8(a6)
  005edc  4267                 clr.w     -(a7)
  005ede  42a7                 clr.l     -(a7)
  005ee0  a8ec                 _CopyBits 
  005ee2  486efff8             pea.l     -$8(a6)
  005ee6  42a7                 clr.l     -(a7)
  005ee8  2f3c00100280         move.l    #$100280, -(a7)
  005eee  a8a7                 _SetRect  
  005ef0  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005ef6  48680002             pea.l     $2(a0)
  005efa  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005f00  48680002             pea.l     $2(a0)
  005f04  486efff8             pea.l     -$8(a6)
  005f08  486efff8             pea.l     -$8(a6)
  005f0c  4267                 clr.w     -(a7)
  005f0e  42a7                 clr.l     -(a7)
  005f10  a8ec                 _CopyBits 
  005f12  486efff8             pea.l     -$8(a6)
  005f16  2f3c01d00000         move.l    #$1d00000, -(a7)
  005f1c  2f3c01e00280         move.l    #$1e00280, -(a7)
  005f22  a8a7                 _SetRect  
  005f24  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005f2a  48680002             pea.l     $2(a0)
  005f2e  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005f34  48680002             pea.l     $2(a0)
  005f38  486efff8             pea.l     -$8(a6)
  005f3c  486efff8             pea.l     -$8(a6)
  005f40  4267                 clr.w     -(a7)
  005f42  42a7                 clr.l     -(a7)
  005f44  a8ec                 _CopyBits 
  005f46  486efff8             pea.l     -$8(a6)
  005f4a  42a7                 clr.l     -(a7)
  005f4c  2f3c01e00010         move.l    #$1e00010, -(a7)
  005f52  a8a7                 _SetRect  
  005f54  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005f5a  48680002             pea.l     $2(a0)
  005f5e  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005f64  48680002             pea.l     $2(a0)
  005f68  486efff8             pea.l     -$8(a6)
  005f6c  486efff8             pea.l     -$8(a6)
  005f70  4267                 clr.w     -(a7)
  005f72  42a7                 clr.l     -(a7)
  005f74  a8ec                 _CopyBits 
  005f76  486efff8             pea.l     -$8(a6)
  005f7a  42a7                 clr.l     -(a7)
  005f7c  2f3c00100280         move.l    #$100280, -(a7)
  005f82  a8a7                 _SetRect  
  005f84  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005f8a  48680002             pea.l     $2(a0)
  005f8e  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005f94  48680002             pea.l     $2(a0)
  005f98  486efff8             pea.l     -$8(a6)
  005f9c  486efff8             pea.l     -$8(a6)
  005fa0  4267                 clr.w     -(a7)
  005fa2  42a7                 clr.l     -(a7)
  005fa4  a8ec                 _CopyBits 
  005fa6  486efff8             pea.l     -$8(a6)
  005faa  2f3c001001d0         move.l    #$1001d0, -(a7)
  005fb0  2f3c01d00280         move.l    #$1d00280, -(a7)
  005fb6  a8a7                 _SetRect  
  005fb8  207900007474         movea.l   $7474.l, a0   ; gameOffscreen
  005fbe  48680002             pea.l     $2(a0)
  005fc2  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  005fc8  48680002             pea.l     $2(a0)
  005fcc  486efff8             pea.l     -$8(a6)
  005fd0  486efff8             pea.l     -$8(a6)
  005fd4  4267                 clr.w     -(a7)
  005fd6  42a7                 clr.l     -(a7)
  005fd8  a8ec                 _CopyBits 
  005fda  13fc000100007f1d     move.b    #$1, $7f1d.l   ; g_7f1d
  005fe2  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  005fe8  4eb900000130         jsr       $130.l   ; SATSHOWMBAR
  005fee  a937                 _DrawMenuBar 
  005ff0  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  005ff6  4eb9000002f0         jsr       $2f0.l   ; KILLTILESCROLL
  005ffc  4eb900000b30         jsr       $b30.l   ; ResetCursor
  006002  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  006008  504f                 addq.w    #$8, a7
  00600a  6024                 bra.b     $6030
  00600c  61ff00005938         bsr.l     $b946   ; CheckEvent
  006012  7600                 moveq     #$0, d3
  006014  61fffffffddc         bsr.l     $5df2   ; CapsLockDown
  00601a  4a00                 tst.b     d0
  00601c  6612                 bne.b     $6030
  00601e  4a39000046cc         tst.b     $46cc.l   ; g_46cc
  006024  670a                 beq.b     $6030
  006026  4a43                 tst.w     d3
  006028  6606                 bne.b     $6030
  00602a  423900007f1d         clr.b     $7f1d.l   ; g_7f1d
  006030  4a3900007f1d         tst.b     $7f1d.l   ; g_7f1d
  006036  66d4                 bne.b     $600c
  006038  4eb900000b08         jsr       $b08.l   ; SwitchTo8BitColor
  00603e  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  006044  427900013c1c         clr.w     $13c1c.l   ; g_13c1c
  00604a  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  006050  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  006056  4eb900000138         jsr       $138.l   ; SATHIDEMBAR
  00605c  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  006062  4eb9000002e8         jsr       $2e8.l   ; INITTILESCROLL
  006068  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00606e  4eb900000b30         jsr       $b30.l   ; ResetCursor
  006074  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  00607a  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  006082  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00608a  4eb900000c90         jsr       $c90.l   ; RedrawGameArea
  006090  261f                 move.l    (a7)+, d3
  006092  4e5e                 unlk      a6
  006094  4e75                 rts       

;-------------------------------------------------------------
; FadeMusic   (seg 1 +00609e, 280 bytes)
  00609e  4e560000             link.w    a6, #$0
  0060a2  48e71e00             movem.l   d3-d6, -(a7)
  0060a6  282e000a             move.l    $a(a6), d4
  0060aa  4a390000617d         tst.b     $617d.l   ; g_617d
  0060b0  670000fc             beq.w     $61ae
  0060b4  4a6e0008             tst.w     $8(a6)
  0060b8  66000080             bne.w     $613a
  0060bc  4a3900013c2e         tst.b     $13c2e.l   ; g_13c2e
  0060c2  660000ea             bne.w     $61ae
  0060c6  13fc000100013c2e     move.b    #$1, $13c2e.l   ; g_13c2e
  0060ce  303900006180         move.w    $6180.l, d0   ; g_6180
  0060d4  c1fc1c71             muls.w    #$1c71, d0
  0060d8  2f00                 move.l    d0, -(a7)
  0060da  4eb900000268         jsr       $268.l   ; SetMusicVolume
  0060e0  7c00                 moveq     #$0, d6
  0060e2  584f                 addq.w    #$4, a7
  0060e4  6042                 bra.b     $6128
  0060e6  594f                 subq.w    #$4, a7
  0060e8  a975                 _TickCount 
  0060ea  201f                 move.l    (a7)+, d0
  0060ec  2600                 move.l    d0, d3
  0060ee  3a3900006180         move.w    $6180.l, d5   ; g_6180
  0060f4  cbfc1c71             muls.w    #$1c71, d5
  0060f8  3006                 move.w    d6, d0
  0060fa  48c0                 ext.l     d0
  0060fc  7218                 moveq     #$18, d1
  0060fe  9280                 sub.l     d0, d1
  006100  2005                 move.l    d5, d0
  006102  4c010800             muls.l    d1, d0
  006106  2a00                 move.l    d0, d5
  006108  4c7c580500000018     divs.l    #$18, d5
  006110  2f05                 move.l    d5, -(a7)
  006112  4eb900000268         jsr       $268.l   ; SetMusicVolume
  006118  584f                 addq.w    #$4, a7
  00611a  594f                 subq.w    #$4, a7
  00611c  a975                 _TickCount 
  00611e  201f                 move.l    (a7)+, d0
  006120  9084                 sub.l     d4, d0
  006122  b680                 cmp.l     d0, d3
  006124  62f4                 bhi.b     $611a
  006126  5246                 addq.w    #$1, d6
  006128  0c460018             cmpi.w    #$18, d6
  00612c  6db8                 blt.b     $60e6
  00612e  42a7                 clr.l     -(a7)
  006130  4eb900000268         jsr       $268.l   ; SetMusicVolume
  006136  584f                 addq.w    #$4, a7
  006138  6074                 bra.b     $61ae
  00613a  4a3900013c2e         tst.b     $13c2e.l   ; g_13c2e
  006140  676c                 beq.b     $61ae
  006142  423900013c2e         clr.b     $13c2e.l   ; g_13c2e
  006148  42a7                 clr.l     -(a7)
  00614a  4eb900000268         jsr       $268.l   ; SetMusicVolume
  006150  7c00                 moveq     #$0, d6
  006152  584f                 addq.w    #$4, a7
  006154  603e                 bra.b     $6194
  006156  594f                 subq.w    #$4, a7
  006158  a975                 _TickCount 
  00615a  201f                 move.l    (a7)+, d0
  00615c  2600                 move.l    d0, d3
  00615e  3a3900006180         move.w    $6180.l, d5   ; g_6180
  006164  cbfc1c71             muls.w    #$1c71, d5
  006168  3046                 movea.w   d6, a0
  00616a  2005                 move.l    d5, d0
  00616c  2208                 move.l    a0, d1
  00616e  4c010800             muls.l    d1, d0
  006172  2a00                 move.l    d0, d5
  006174  4c7c580500000018     divs.l    #$18, d5
  00617c  2f05                 move.l    d5, -(a7)
  00617e  4eb900000268         jsr       $268.l   ; SetMusicVolume
  006184  584f                 addq.w    #$4, a7
  006186  594f                 subq.w    #$4, a7
  006188  a975                 _TickCount 
  00618a  201f                 move.l    (a7)+, d0
  00618c  9084                 sub.l     d4, d0
  00618e  b680                 cmp.l     d0, d3
  006190  62f4                 bhi.b     $6186
  006192  5246                 addq.w    #$1, d6
  006194  0c460018             cmpi.w    #$18, d6
  006198  6dbc                 blt.b     $6156
  00619a  303900006180         move.w    $6180.l, d0   ; g_6180
  0061a0  c1fc1c71             muls.w    #$1c71, d0
  0061a4  2f00                 move.l    d0, -(a7)
  0061a6  4eb900000268         jsr       $268.l   ; SetMusicVolume
  0061ac  584f                 addq.w    #$4, a7
  0061ae  4cdf0078             movem.l   (a7)+, d3-d6
  0061b2  4e5e                 unlk      a6
  0061b4  4e75                 rts       

;-------------------------------------------------------------
; CheckGameEvents   (seg 1 +0061c2, 54 bytes)
  0061c2  4e560000             link.w    a6, #$0
  0061c6  303900013c1e         move.w    $13c1e.l, d0   ; curLevel2
  0061cc  b07900008066         cmp.w     $8066.l, d0   ; curLevel
  0061d2  6706                 beq.b     $61da
  0061d4  61fffffff41e         bsr.l     $55f4   ; UpLevel
  0061da  4a39000080c4         tst.b     $80c4.l   ; g_80c4
  0061e0  6708                 beq.b     $61ea
  0061e2  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  0061ea  33f90000806600013c1e move.w    $8066.l, $13c1e.l   ; curLevel, curLevel2
  0061f4  4e5e                 unlk      a6
  0061f6  4e75                 rts       

;-------------------------------------------------------------
; ConfirmAbortGameDialog   (seg 1 +00620a, 214 bytes)
  00620a  4e56ffec             link.w    a6, #$ffec
  00620e  48e71c20             movem.l   d3-d5/a2, -(a7)
  006212  7600                 moveq     #$0, d3
  006214  7800                 moveq     #$0, d4
  006216  7a00                 moveq     #$0, d5
  006218  7001                 moveq     #$1, d0
  00621a  2d40ffec             move.l    d0, -$14(a6)
  00621e  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  006224  594f                 subq.w    #$4, a7
  006226  3f3c00ca             move.w    #$ca, -(a7)
  00622a  42a7                 clr.l     -(a7)
  00622c  4878ffff             pea.l     $ffff.w
  006230  a97c                 _GetNewDialog 
  006232  205f                 movea.l   (a7)+, a0
  006234  2448                 movea.l   a0, a2
  006236  2f0a                 move.l    a2, -(a7)
  006238  a873                 _SetPort  
  00623a  2f0a                 move.l    a2, -(a7)
  00623c  a922                 _BeginUpdate 
  00623e  2f0a                 move.l    a2, -(a7)
  006240  3f3c0001             move.w    #$1, -(a7)
  006244  486efff4             pea.l     -$c(a6)
  006248  486efff0             pea.l     -$10(a6)
  00624c  486efff6             pea.l     -$a(a6)
  006250  a98d                 _GetDialogItem 
  006252  486efff6             pea.l     -$a(a6)
  006256  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00625c  a8a9                 _InsetRect 
  00625e  2f3c00030003         move.l    #$30003, -(a7)
  006264  a89b                 _PenSize  
  006266  486efff6             pea.l     -$a(a6)
  00626a  2f3c000f000f         move.l    #$f000f, -(a7)
  006270  a8b0                 _FrameRoundRect 
  006272  2f0a                 move.l    a2, -(a7)
  006274  a923                 _EndUpdate 
  006276  2f0a                 move.l    a2, -(a7)
  006278  a981                 _DrawDialog 
  00627a  2f0a                 move.l    a2, -(a7)
  00627c  a915                 _ShowWindow 
  00627e  2f0a                 move.l    a2, -(a7)
  006280  a91f                 _SelectWindow 
  006282  602c                 bra.b     $62b0
  006284  42a7                 clr.l     -(a7)
  006286  486efffe             pea.l     -$2(a6)
  00628a  a991                 _ModalDialog 
  00628c  302efffe             move.w    -$2(a6), d0
  006290  48c0                 ext.l     d0
  006292  5380                 subq.l    #$1, d0
  006294  670a                 beq.b     $62a0
  006296  5380                 subq.l    #$1, d0
  006298  670a                 beq.b     $62a4
  00629a  5780                 subq.l    #$3, d0
  00629c  670c                 beq.b     $62aa
  00629e  6010                 bra.b     $62b0
  0062a0  7601                 moveq     #$1, d3
  0062a2  600c                 bra.b     $62b0
  0062a4  7601                 moveq     #$1, d3
  0062a6  7801                 moveq     #$1, d4
  0062a8  6006                 bra.b     $62b0
  0062aa  7601                 moveq     #$1, d3
  0062ac  7801                 moveq     #$1, d4
  0062ae  7a01                 moveq     #$1, d5
  0062b0  4a03                 tst.b     d3
  0062b2  67d0                 beq.b     $6284
  0062b4  2f0a                 move.l    a2, -(a7)
  0062b6  a983                 _DisposeDialog 
  0062b8  4a05                 tst.b     d5
  0062ba  6714                 beq.b     $62d0
  0062bc  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  0062c2  61ff00003e4e         bsr.l     $a112   ; DoSaveGame
  0062c8  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  0062d0  1004                 move.b    d4, d0
  0062d2  57c0                 seq.b     d0
  0062d4  4400                 neg.b     d0
  0062d6  49c0                 extb.l    d0
  0062d8  4cdf0438             movem.l   (a7)+, d3-d5/a2
  0062dc  4e5e                 unlk      a6
  0062de  4e75                 rts       

;-------------------------------------------------------------
; AskToContinue   (seg 1 +0062fa, 368 bytes)
  0062fa  4e56fff0             link.w    a6, #$fff0
  0062fe  48e71c20             movem.l   d3-d5/a2, -(a7)
  006302  7600                 moveq     #$0, d3
  006304  7800                 moveq     #$0, d4
  006306  7a00                 moveq     #$0, d5
  006308  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00630e  201f                 move.l    (a7)+, d0
  006310  a032                 _FlushEvents 
  006312  4a7900006194         tst.w     $6194.l   ; g_6194
  006318  6608                 bne.b     $6322
  00631a  4a39000070cf         tst.b     $70cf.l   ; g_70cf
  006320  6606                 bne.b     $6328
  006322  7000                 moveq     #$0, d0
  006324  6000013c             bra.w     $6462
  006328  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00632e  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  006334  594f                 subq.w    #$4, a7
  006336  3f3c00cb             move.w    #$cb, -(a7)
  00633a  42a7                 clr.l     -(a7)
  00633c  4878ffff             pea.l     $ffff.w
  006340  a97c                 _GetNewDialog 
  006342  205f                 movea.l   (a7)+, a0
  006344  2448                 movea.l   a0, a2
  006346  2f0a                 move.l    a2, -(a7)
  006348  a873                 _SetPort  
  00634a  2f0a                 move.l    a2, -(a7)
  00634c  a922                 _BeginUpdate 
  00634e  2f0a                 move.l    a2, -(a7)
  006350  3f3c0001             move.w    #$1, -(a7)
  006354  486efff4             pea.l     -$c(a6)
  006358  486efff0             pea.l     -$10(a6)
  00635c  486efff6             pea.l     -$a(a6)
  006360  a98d                 _GetDialogItem 
  006362  486efff6             pea.l     -$a(a6)
  006366  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00636c  a8a9                 _InsetRect 
  00636e  2f3c00030003         move.l    #$30003, -(a7)
  006374  a89b                 _PenSize  
  006376  486efff6             pea.l     -$a(a6)
  00637a  2f3c000f000f         move.l    #$f000f, -(a7)
  006380  a8b0                 _FrameRoundRect 
  006382  2f0a                 move.l    a2, -(a7)
  006384  a923                 _EndUpdate 
  006386  2f0a                 move.l    a2, -(a7)
  006388  a981                 _DrawDialog 
  00638a  2f0a                 move.l    a2, -(a7)
  00638c  a915                 _ShowWindow 
  00638e  2f0a                 move.l    a2, -(a7)
  006390  a91f                 _SelectWindow 
  006392  602c                 bra.b     $63c0
  006394  42a7                 clr.l     -(a7)
  006396  486efffe             pea.l     -$2(a6)
  00639a  a991                 _ModalDialog 
  00639c  302efffe             move.w    -$2(a6), d0
  0063a0  48c0                 ext.l     d0
  0063a2  5380                 subq.l    #$1, d0
  0063a4  670a                 beq.b     $63b0
  0063a6  5380                 subq.l    #$1, d0
  0063a8  670a                 beq.b     $63b4
  0063aa  5780                 subq.l    #$3, d0
  0063ac  670c                 beq.b     $63ba
  0063ae  6010                 bra.b     $63c0
  0063b0  7601                 moveq     #$1, d3
  0063b2  600c                 bra.b     $63c0
  0063b4  7601                 moveq     #$1, d3
  0063b6  7801                 moveq     #$1, d4
  0063b8  6006                 bra.b     $63c0
  0063ba  7601                 moveq     #$1, d3
  0063bc  7801                 moveq     #$1, d4
  0063be  7a01                 moveq     #$1, d5
  0063c0  4a03                 tst.b     d3
  0063c2  67d0                 beq.b     $6394
  0063c4  2f0a                 move.l    a2, -(a7)
  0063c6  a983                 _DisposeDialog 
  0063c8  4a05                 tst.b     d5
  0063ca  6700008e             beq.w     $645a
  0063ce  48790000f70a         pea.l     $f70a.l   ; g_f70a
  0063d4  48790000f708         pea.l     $f708.l   ; g_f708
  0063da  2f3c70726566         move.l    #$70726566, -(a7)
  0063e0  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  0063e6  4879000051c0         pea.l     $51c0.l   ; g_51c0
  0063ec  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  0063f2  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  0063f8  4fef0014             lea.l     $14(a7), a7
  0063fc  6708                 beq.b     $6406
  0063fe  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  006404  a998                 _UseResFile 
  006406  61ff00005944         bsr.l     $bd4c   ; InitPrefs
  00640c  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  006412  a998                 _UseResFile 
  006414  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00641a  2050                 movea.l   (a0), a0
  00641c  317c00010022         move.w    #$1, $22(a0)
  006422  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  006428  a9aa                 _ChangedResource 
  00642a  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  006430  a9b0                 _WriteResource 
  006432  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  006438  61ff00004d4e         bsr.l     $b188   ; MakeCurrPrefs
  00643e  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  006444  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00644a  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  006450  a998                 _UseResFile 
  006452  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  006458  a99a                 _CloseResFile 
  00645a  1004                 move.b    d4, d0
  00645c  57c0                 seq.b     d0
  00645e  4400                 neg.b     d0
  006460  49c0                 extb.l    d0
  006462  4cdf0438             movem.l   (a7)+, d3-d5/a2
  006466  4e5e                 unlk      a6
  006468  4e75                 rts       

;-------------------------------------------------------------
; CheckGameLoopKeys   (seg 1 +00647a, 854 bytes)
  00647a  4e560000             link.w    a6, #$0
  00647e  3f3c0037             move.w    #$37, -(a7)
  006482  4eb900000b60         jsr       $b60.l   ; IsPressed
  006488  4a00                 tst.b     d0
  00648a  544f                 addq.w    #$2, a7
  00648c  670001e2             beq.w     $6670
  006490  3f3c0001             move.w    #$1, -(a7)
  006494  4eb900000b60         jsr       $b60.l   ; IsPressed
  00649a  4a00                 tst.b     d0
  00649c  544f                 addq.w    #$2, a7
  00649e  6732                 beq.b     $64d2
  0064a0  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  0064a6  61ff00003c6a         bsr.l     $a112   ; DoSaveGame
  0064ac  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  0064b4  4a3900006174         tst.b     $6174.l   ; prefInterlace
  0064ba  6700028a             beq.w     $6746
  0064be  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  0064c4  66000280             bne.w     $6746
  0064c8  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  0064ce  60000276             bra.w     $6746
  0064d2  3f3c000c             move.w    #$c, -(a7)
  0064d6  4eb900000b60         jsr       $b60.l   ; IsPressed
  0064dc  4a00                 tst.b     d0
  0064de  544f                 addq.w    #$2, a7
  0064e0  67000088             beq.w     $656a
  0064e4  61fffffff61e         bsr.l     $5b04   ; RestoreWindowBackground
  0064ea  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  0064f0  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  0064f6  201f                 move.l    (a7)+, d0
  0064f8  a032                 _FlushEvents 
  0064fa  4879000051a1         pea.l     $51a1.l   ; g_51a1
  006500  4879000051a0         pea.l     $51a0.l   ; g_51a0
  006506  4879000051a0         pea.l     $51a0.l   ; g_51a0
  00650c  4879000051a0         pea.l     $51a0.l   ; g_51a0
  006512  a98b                 _ParamText 
  006514  61fffffffcf4         bsr.l     $620a   ; ConfirmAbortGameDialog
  00651a  4a00                 tst.b     d0
  00651c  6722                 beq.b     $6540
  00651e  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  006524  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  00652c  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  006532  201f                 move.l    (a7)+, d0
  006534  a032                 _FlushEvents 
  006536  61ff0000536a         bsr.l     $b8a2   ; Quit
  00653c  60000208             bra.w     $6746
  006540  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  006546  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00654c  4a3900006174         tst.b     $6174.l   ; prefInterlace
  006552  670001f2             beq.w     $6746
  006556  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  00655c  660001e8             bne.w     $6746
  006560  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  006566  600001de             bra.w     $6746
  00656a  3f3c000d             move.w    #$d, -(a7)
  00656e  4eb900000b60         jsr       $b60.l   ; IsPressed
  006574  4a00                 tst.b     d0
  006576  544f                 addq.w    #$2, a7
  006578  67000082             beq.w     $65fc
  00657c  61fffffff586         bsr.l     $5b04   ; RestoreWindowBackground
  006582  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  006588  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00658e  201f                 move.l    (a7)+, d0
  006590  a032                 _FlushEvents 
  006592  487900005176         pea.l     $5176.l   ; g_5176
  006598  4879000051a0         pea.l     $51a0.l   ; g_51a0
  00659e  4879000051a0         pea.l     $51a0.l   ; g_51a0
  0065a4  4879000051a0         pea.l     $51a0.l   ; g_51a0
  0065aa  a98b                 _ParamText 
  0065ac  61fffffffc5c         bsr.l     $620a   ; ConfirmAbortGameDialog
  0065b2  4a00                 tst.b     d0
  0065b4  671c                 beq.b     $65d2
  0065b6  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  0065bc  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  0065c4  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  0065ca  201f                 move.l    (a7)+, d0
  0065cc  a032                 _FlushEvents 
  0065ce  60000176             bra.w     $6746
  0065d2  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  0065d8  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  0065de  4a3900006174         tst.b     $6174.l   ; prefInterlace
  0065e4  67000160             beq.w     $6746
  0065e8  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  0065ee  66000156             bne.w     $6746
  0065f2  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  0065f8  6000014c             bra.w     $6746
  0065fc  3f3c0022             move.w    #$22, -(a7)
  006600  4eb900000b60         jsr       $b60.l   ; IsPressed
  006606  4a00                 tst.b     d0
  006608  544f                 addq.w    #$2, a7
  00660a  6700013a             beq.w     $6746
  00660e  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  006614  201f                 move.l    (a7)+, d0
  006616  a032                 _FlushEvents 
  006618  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00661e  61fffffff4e4         bsr.l     $5b04   ; RestoreWindowBackground
  006624  61ff00004d38         bsr.l     $b35e   ; Options
  00662a  3f390000806a         move.w    $806a.l, -(a7)   ; viewLeft
  006630  3f3900008068         move.w    $8068.l, -(a7)   ; viewTop
  006636  4eb9000002e0         jsr       $2e0.l   ; SCROLLTO
  00663c  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  006642  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  00664a  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  006652  4a3900006174         tst.b     $6174.l   ; prefInterlace
  006658  670000ec             beq.w     $6746
  00665c  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  006662  660000e2             bne.w     $6746
  006666  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  00666c  600000d8             bra.w     $6746
  006670  3f3c0035             move.w    #$35, -(a7)
  006674  4eb900000b60         jsr       $b60.l   ; IsPressed
  00667a  4a00                 tst.b     d0
  00667c  544f                 addq.w    #$2, a7
  00667e  6778                 beq.b     $66f8
  006680  61fffffff482         bsr.l     $5b04   ; RestoreWindowBackground
  006686  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00668c  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  006692  201f                 move.l    (a7)+, d0
  006694  a032                 _FlushEvents 
  006696  487900005176         pea.l     $5176.l   ; g_5176
  00669c  4879000051a0         pea.l     $51a0.l   ; g_51a0
  0066a2  4879000051a0         pea.l     $51a0.l   ; g_51a0
  0066a8  4879000051a0         pea.l     $51a0.l   ; g_51a0
  0066ae  a98b                 _ParamText 
  0066b0  61fffffffb58         bsr.l     $620a   ; ConfirmAbortGameDialog
  0066b6  4a00                 tst.b     d0
  0066b8  671a                 beq.b     $66d4
  0066ba  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  0066c0  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  0066c8  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  0066ce  201f                 move.l    (a7)+, d0
  0066d0  a032                 _FlushEvents 
  0066d2  6072                 bra.b     $6746
  0066d4  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  0066da  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  0066e0  4a3900006174         tst.b     $6174.l   ; prefInterlace
  0066e6  675e                 beq.b     $6746
  0066e8  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  0066ee  6656                 bne.b     $6746
  0066f0  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  0066f6  604e                 bra.b     $6746
  0066f8  3f3c0067             move.w    #$67, -(a7)
  0066fc  4eb900000b60         jsr       $b60.l   ; IsPressed
  006702  4a00                 tst.b     d0
  006704  544f                 addq.w    #$2, a7
  006706  6710                 beq.b     $6718
  006708  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  00670e  6708                 beq.b     $6718
  006710  527900008066         addq.w    #$1, $8066.l   ; curLevel
  006716  602e                 bra.b     $6746
  006718  3f3c0008             move.w    #$8, -(a7)
  00671c  4eb900000b60         jsr       $b60.l   ; IsPressed
  006722  4a00                 tst.b     d0
  006724  544f                 addq.w    #$2, a7
  006726  671e                 beq.b     $6746
  006728  3f3c0001             move.w    #$1, -(a7)
  00672c  4eb900000b60         jsr       $b60.l   ; IsPressed
  006732  4a00                 tst.b     d0
  006734  544f                 addq.w    #$2, a7
  006736  670e                 beq.b     $6746
  006738  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  00673e  6706                 beq.b     $6746
  006740  61ff00003e14         bsr.l     $a556   ; CopierSave
  006746  4a7900013c1a         tst.w     $13c1a.l   ; g_13c1a
  00674c  6f06                 ble.b     $6754
  00674e  537900013c1a         subq.w    #$1, $13c1a.l   ; g_13c1a
  006754  3f3900006190         move.w    $6190.l, -(a7)   ; g_6190
  00675a  4eb900000b60         jsr       $b60.l   ; IsPressed
  006760  4a00                 tst.b     d0
  006762  544f                 addq.w    #$2, a7
  006764  6722                 beq.b     $6788
  006766  4a7900013c1a         tst.w     $13c1a.l   ; g_13c1a
  00676c  661a                 bne.b     $6788
  00676e  61ffffffe2ac         bsr.l     $4a1c   ; ShowMap
  006774  33fc000600013c1a     move.w    #$6, $13c1a.l   ; g_13c1a
  00677c  48790000559a         pea.l     $559a.l   ; g_559a
  006782  4eb9000000f0         jsr       $f0.l   ; SATBACKCHANGED
  006788  4a7900013c1c         tst.w     $13c1c.l   ; g_13c1c
  00678e  6f06                 ble.b     $6796
  006790  537900013c1c         subq.w    #$1, $13c1c.l   ; g_13c1c
  006796  61fffffff65a         bsr.l     $5df2   ; CapsLockDown
  00679c  4a00                 tst.b     d0
  00679e  670e                 beq.b     $67ae
  0067a0  4a7900013c1c         tst.w     $13c1c.l   ; g_13c1c
  0067a6  6606                 bne.b     $67ae
  0067a8  61fffffff674         bsr.l     $5e1e   ; Pause
  0067ae  3f3c006b             move.w    #$6b, -(a7)
  0067b2  4eb900000b60         jsr       $b60.l   ; IsPressed
  0067b8  4a00                 tst.b     d0
  0067ba  544f                 addq.w    #$2, a7
  0067bc  670e                 beq.b     $67cc
  0067be  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  0067c4  6706                 beq.b     $67cc
  0067c6  4eb900000280         jsr       $280.l   ; ImportMovie
  0067cc  4e5e                 unlk      a6
  0067ce  4e75                 rts       

;-------------------------------------------------------------
; CheckPlayerCollision   (seg 1 +0067e4, 294 bytes)
  0067e4  4e56ffe8             link.w    a6, #$ffe8
  0067e8  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  0067ec  97cb                 suba.l    a3, a3
  0067ee  7600                 moveq     #$0, d3
  0067f0  7800                 moveq     #$0, d4
  0067f2  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  0067f8  6014                 bra.b     $680e
  0067fa  41f900000468         lea.l     $468.l, a0   ; HANDLEPLAYERSPRITE
  006800  b1ea001a             cmpa.l    $1a(a2), a0
  006804  6604                 bne.b     $680a
  006806  264a                 movea.l   a2, a3
  006808  7601                 moveq     #$1, d3
  00680a  246a002e             movea.l   $2e(a2), a2
  00680e  200a                 move.l    a2, d0
  006810  6704                 beq.b     $6816
  006812  4a03                 tst.b     d3
  006814  67e4                 beq.b     $67fa
  006816  200b                 move.l    a3, d0
  006818  670000e8             beq.w     $6902
  00681c  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  006822  600000d8             bra.w     $68fc
  006826  41f900000468         lea.l     $468.l, a0   ; HANDLEPLAYERSPRITE
  00682c  b1ea001a             cmpa.l    $1a(a2), a0
  006830  670000c6             beq.w     $68f8
  006834  4aaa001a             tst.l     $1a(a2)
  006838  670000be             beq.w     $68f8
  00683c  b5cb                 cmpa.l    a3, a2
  00683e  670000b8             beq.w     $68f8
  006842  302b005c             move.w    $5c(a3), d0
  006846  48c0                 ext.l     d0
  006848  322b0008             move.w    $8(a3), d1
  00684c  48c1                 ext.l     d1
  00684e  d280                 add.l     d0, d1
  006850  3d41fffa             move.w    d1, -$6(a6)
  006854  302b005a             move.w    $5a(a3), d0
  006858  48c0                 ext.l     d0
  00685a  322b0006             move.w    $6(a3), d1
  00685e  48c1                 ext.l     d1
  006860  d280                 add.l     d0, d1
  006862  3d41fff8             move.w    d1, -$8(a6)
  006866  302b005c             move.w    $5c(a3), d0
  00686a  48c0                 ext.l     d0
  00686c  322b000c             move.w    $c(a3), d1
  006870  48c1                 ext.l     d1
  006872  d280                 add.l     d0, d1
  006874  3d41fffe             move.w    d1, -$2(a6)
  006878  302b005a             move.w    $5a(a3), d0
  00687c  48c0                 ext.l     d0
  00687e  322b000a             move.w    $a(a3), d1
  006882  48c1                 ext.l     d1
  006884  d280                 add.l     d0, d1
  006886  3d41fffc             move.w    d1, -$4(a6)
  00688a  302a005c             move.w    $5c(a2), d0
  00688e  48c0                 ext.l     d0
  006890  322a0008             move.w    $8(a2), d1
  006894  48c1                 ext.l     d1
  006896  d280                 add.l     d0, d1
  006898  3d41fff2             move.w    d1, -$e(a6)
  00689c  302a005a             move.w    $5a(a2), d0
  0068a0  48c0                 ext.l     d0
  0068a2  322a0006             move.w    $6(a2), d1
  0068a6  48c1                 ext.l     d1
  0068a8  d280                 add.l     d0, d1
  0068aa  3d41fff0             move.w    d1, -$10(a6)
  0068ae  302a005c             move.w    $5c(a2), d0
  0068b2  48c0                 ext.l     d0
  0068b4  322a000c             move.w    $c(a2), d1
  0068b8  48c1                 ext.l     d1
  0068ba  d280                 add.l     d0, d1
  0068bc  3d41fff6             move.w    d1, -$a(a6)
  0068c0  302a005a             move.w    $5a(a2), d0
  0068c4  48c0                 ext.l     d0
  0068c6  322a000a             move.w    $a(a2), d1
  0068ca  48c1                 ext.l     d1
  0068cc  d280                 add.l     d0, d1
  0068ce  3d41fff4             move.w    d1, -$c(a6)
  0068d2  486effe8             pea.l     -$18(a6)
  0068d6  486efff0             pea.l     -$10(a6)
  0068da  486efff8             pea.l     -$8(a6)
  0068de  61ffffffd932         bsr.l     $4212   ; DoSectRect
  0068e4  4a00                 tst.b     d0
  0068e6  4fef000c             lea.l     $c(a7), a7
  0068ea  670c                 beq.b     $68f8
  0068ec  2f0b                 move.l    a3, -(a7)
  0068ee  2f0a                 move.l    a2, -(a7)
  0068f0  4eb900000480         jsr       $480.l   ; HITPLAYERSPRITE
  0068f6  7801                 moveq     #$1, d4
  0068f8  246a002e             movea.l   $2e(a2), a2
  0068fc  200a                 move.l    a2, d0
  0068fe  6600ff26             bne.w     $6826
  006902  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  006906  4e5e                 unlk      a6
  006908  4e75                 rts       

;-------------------------------------------------------------
; DoSATSkip   (seg 1 +006922, 14 bytes)
  006922  4e560000             link.w    a6, #$0
  006926  4eb900000110         jsr       $110.l   ; SATSKIP
  00692c  4e5e                 unlk      a6
  00692e  4e75                 rts       

;-------------------------------------------------------------
; HandleSprites   (seg 1 +00693c, 28 bytes)
  00693c  4e560000             link.w    a6, #$0
  006940  61ffffffffe0         bsr.l     $6922   ; DoSATSkip
  006946  4a39000080c4         tst.b     $80c4.l   ; g_80c4
  00694c  6606                 bne.b     $6954
  00694e  61fffffffe94         bsr.l     $67e4   ; CheckPlayerCollision
  006954  4e5e                 unlk      a6
  006956  4e75                 rts       

;-------------------------------------------------------------
; InitIdleSprites   (seg 1 +006968, 438 bytes)
  006968  4e560000             link.w    a6, #$0
  00696c  7200                 moveq     #$0, d1
  00696e  600001a2             bra.w     $6b12
  006972  7044                 moveq     #$44, d0
  006974  c1c1                 muls.w    d1, d0
  006976  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00697c  42300800             clr.b     (a0, d0.l)
  006980  7044                 moveq     #$44, d0
  006982  c1c1                 muls.w    d1, d0
  006984  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00698a  42300801             clr.b     $1(a0, d0.l)
  00698e  7044                 moveq     #$44, d0
  006990  c1c1                 muls.w    d1, d0
  006992  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006998  42b00804             clr.l     $4(a0, d0.l)
  00699c  7044                 moveq     #$44, d0
  00699e  c1c1                 muls.w    d1, d0
  0069a0  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069a6  4270081e             clr.w     $1e(a0, d0.l)
  0069aa  7044                 moveq     #$44, d0
  0069ac  c1c1                 muls.w    d1, d0
  0069ae  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069b4  42b00808             clr.l     $8(a0, d0.l)
  0069b8  7044                 moveq     #$44, d0
  0069ba  c1c1                 muls.w    d1, d0
  0069bc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069c2  4230080c             clr.b     $c(a0, d0.l)
  0069c6  7044                 moveq     #$44, d0
  0069c8  c1c1                 muls.w    d1, d0
  0069ca  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069d0  31bcffff080e         move.w    #$ffff, $e(a0, d0.l)
  0069d6  7044                 moveq     #$44, d0
  0069d8  c1c1                 muls.w    d1, d0
  0069da  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069e0  42700810             clr.w     $10(a0, d0.l)
  0069e4  7044                 moveq     #$44, d0
  0069e6  c1c1                 muls.w    d1, d0
  0069e8  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069ee  42700812             clr.w     $12(a0, d0.l)
  0069f2  7044                 moveq     #$44, d0
  0069f4  c1c1                 muls.w    d1, d0
  0069f6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0069fc  42700814             clr.w     $14(a0, d0.l)
  006a00  7044                 moveq     #$44, d0
  006a02  c1c1                 muls.w    d1, d0
  006a04  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a0a  42700816             clr.w     $16(a0, d0.l)
  006a0e  7044                 moveq     #$44, d0
  006a10  c1c1                 muls.w    d1, d0
  006a12  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a18  31bcffff0818         move.w    #$ffff, $18(a0, d0.l)
  006a1e  7044                 moveq     #$44, d0
  006a20  c1c1                 muls.w    d1, d0
  006a22  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a28  4270081a             clr.w     $1a(a0, d0.l)
  006a2c  7044                 moveq     #$44, d0
  006a2e  c1c1                 muls.w    d1, d0
  006a30  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a36  4270081c             clr.w     $1c(a0, d0.l)
  006a3a  7044                 moveq     #$44, d0
  006a3c  c1c1                 muls.w    d1, d0
  006a3e  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a44  42700822             clr.w     $22(a0, d0.l)
  006a48  7044                 moveq     #$44, d0
  006a4a  c1c1                 muls.w    d1, d0
  006a4c  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a52  42700820             clr.w     $20(a0, d0.l)
  006a56  7044                 moveq     #$44, d0
  006a58  c1c1                 muls.w    d1, d0
  006a5a  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a60  42700826             clr.w     $26(a0, d0.l)
  006a64  7044                 moveq     #$44, d0
  006a66  c1c1                 muls.w    d1, d0
  006a68  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a6e  42700824             clr.w     $24(a0, d0.l)
  006a72  7044                 moveq     #$44, d0
  006a74  c1c1                 muls.w    d1, d0
  006a76  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a7c  4270082a             clr.w     $2a(a0, d0.l)
  006a80  7044                 moveq     #$44, d0
  006a82  c1c1                 muls.w    d1, d0
  006a84  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a8a  42700828             clr.w     $28(a0, d0.l)
  006a8e  7044                 moveq     #$44, d0
  006a90  c1c1                 muls.w    d1, d0
  006a92  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006a98  42b0082c             clr.l     $2c(a0, d0.l)
  006a9c  7044                 moveq     #$44, d0
  006a9e  c1c1                 muls.w    d1, d0
  006aa0  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006aa6  42300830             clr.b     $30(a0, d0.l)
  006aaa  7044                 moveq     #$44, d0
  006aac  c1c1                 muls.w    d1, d0
  006aae  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ab4  42300831             clr.b     $31(a0, d0.l)
  006ab8  7044                 moveq     #$44, d0
  006aba  c1c1                 muls.w    d1, d0
  006abc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ac2  31bc01000834         move.w    #$100, $34(a0, d0.l)
  006ac8  7044                 moveq     #$44, d0
  006aca  c1c1                 muls.w    d1, d0
  006acc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ad2  31bc01000832         move.w    #$100, $32(a0, d0.l)
  006ad8  7044                 moveq     #$44, d0
  006ada  c1c1                 muls.w    d1, d0
  006adc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ae2  42700836             clr.w     $36(a0, d0.l)
  006ae6  7044                 moveq     #$44, d0
  006ae8  c1c1                 muls.w    d1, d0
  006aea  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006af0  42b00838             clr.l     $38(a0, d0.l)
  006af4  7044                 moveq     #$44, d0
  006af6  c1c1                 muls.w    d1, d0
  006af8  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006afe  42b0083c             clr.l     $3c(a0, d0.l)
  006b02  7044                 moveq     #$44, d0
  006b04  c1c1                 muls.w    d1, d0
  006b06  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006b0c  42b00840             clr.l     $40(a0, d0.l)
  006b10  5241                 addq.w    #$1, d1
  006b12  0c4100ff             cmpi.w    #$ff, d1
  006b16  6d00fe5a             blt.w     $6972
  006b1a  4e5e                 unlk      a6
  006b1c  4e75                 rts       

;-------------------------------------------------------------
; AddIdleSprite   (seg 1 +006b30, 282 bytes)
  006b30  4e560000             link.w    a6, #$0
  006b34  48e71f30             movem.l   d3-d7/a2-a3, -(a7)
  006b38  3e2e0008             move.w    $8(a6), d7
  006b3c  3c2e000a             move.w    $a(a6), d6
  006b40  3a2e000c             move.w    $c(a6), d5
  006b44  266e0010             movea.l   $10(a6), a3
  006b48  78ff                 moveq     #$ff, d4
  006b4a  95ca                 suba.l    a2, a2
  006b4c  7600                 moveq     #$0, d3
  006b4e  6018                 bra.b     $6b68
  006b50  7044                 moveq     #$44, d0
  006b52  c1c3                 muls.w    d3, d0
  006b54  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006b5a  4a300800             tst.b     (a0, d0.l)
  006b5e  6606                 bne.b     $6b66
  006b60  3803                 move.w    d3, d4
  006b62  363c0100             move.w    #$100, d3
  006b66  5243                 addq.w    #$1, d3
  006b68  0c4300ff             cmpi.w    #$ff, d3
  006b6c  6de2                 blt.b     $6b50
  006b6e  0c44ffff             cmpi.w    #$ffff, d4
  006b72  670000c0             beq.w     $6c34
  006b76  594f                 subq.w    #$4, a7
  006b78  3f07                 move.w    d7, -(a7)
  006b7a  3f06                 move.w    d6, -(a7)
  006b7c  3f05                 move.w    d5, -(a7)
  006b7e  2f2e0014             move.l    $14(a6), -(a7)
  006b82  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  006b88  205f                 movea.l   (a7)+, a0
  006b8a  2448                 movea.l   a0, a2
  006b8c  200a                 move.l    a2, d0
  006b8e  67000094             beq.w     $6c24
  006b92  7044                 moveq     #$44, d0
  006b94  c1c4                 muls.w    d4, d0
  006b96  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006b9c  11bc00010800         move.b    #$1, (a0, d0.l)
  006ba2  7044                 moveq     #$44, d0
  006ba4  c1c4                 muls.w    d4, d0
  006ba6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006bac  218a0804             move.l    a2, $4(a0, d0.l)
  006bb0  4227                 clr.b     -(a7)
  006bb2  3f04                 move.w    d4, -(a7)
  006bb4  61ff000000a4         bsr.l     $6c5a   ; ActiveToIdleSprite
  006bba  7044                 moveq     #$44, d0
  006bbc  c1c4                 muls.w    d4, d0
  006bbe  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006bc4  3187080e             move.w    d7, $e(a0, d0.l)
  006bc8  7044                 moveq     #$44, d0
  006bca  c1c4                 muls.w    d4, d0
  006bcc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006bd2  31860814             move.w    d6, $14(a0, d0.l)
  006bd6  7044                 moveq     #$44, d0
  006bd8  c1c4                 muls.w    d4, d0
  006bda  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006be0  31850816             move.w    d5, $16(a0, d0.l)
  006be4  7044                 moveq     #$44, d0
  006be6  c1c4                 muls.w    d4, d0
  006be8  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006bee  31ae000e0818         move.w    $e(a6), $18(a0, d0.l)
  006bf4  200b                 move.l    a3, d0
  006bf6  584f                 addq.w    #$4, a7
  006bf8  6710                 beq.b     $6c0a
  006bfa  7044                 moveq     #$44, d0
  006bfc  c1c4                 muls.w    d4, d0
  006bfe  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006c04  218b0808             move.l    a3, $8(a0, d0.l)
  006c08  6010                 bra.b     $6c1a
  006c0a  7044                 moveq     #$44, d0
  006c0c  c1c4                 muls.w    d4, d0
  006c0e  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006c14  21aa007e0808         move.l    $7e(a2), $8(a0, d0.l)
  006c1a  2f0a                 move.l    a2, -(a7)
  006c1c  4eb900000068         jsr       $68.l   ; SATKILLSPRITE
  006c22  601e                 bra.b     $6c42
  006c24  487900005154         pea.l     $5154.l   ; g_5154
  006c2a  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  006c30  584f                 addq.w    #$4, a7
  006c32  600e                 bra.b     $6c42
  006c34  487900005104         pea.l     $5104.l   ; g_5104
  006c3a  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  006c40  584f                 addq.w    #$4, a7
  006c42  4cdf0cf8             movem.l   (a7)+, d3-d7/a2-a3
  006c46  4e5e                 unlk      a6
  006c48  4e75                 rts       

;-------------------------------------------------------------
; ActiveToIdleSprite   (seg 1 +006c5a, 840 bytes)
  006c5a  4e560000             link.w    a6, #$0
  006c5e  322e0008             move.w    $8(a6), d1
  006c62  7044                 moveq     #$44, d0
  006c64  c1c1                 muls.w    d1, d0
  006c66  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006c6c  20700804             movea.l   $4(a0, d0.l), a0
  006c70  7044                 moveq     #$44, d0
  006c72  c1c1                 muls.w    d1, d0
  006c74  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006c7a  23a8007e0808         move.l    $7e(a0), $8(a1, d0.l)
  006c80  7044                 moveq     #$44, d0
  006c82  c1c1                 muls.w    d1, d0
  006c84  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006c8a  20700804             movea.l   $4(a0, d0.l), a0
  006c8e  7044                 moveq     #$44, d0
  006c90  c1c1                 muls.w    d1, d0
  006c92  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006c98  13a8008a080c         move.b    $8a(a0), $c(a1, d0.l)
  006c9e  7044                 moveq     #$44, d0
  006ca0  c1c1                 muls.w    d1, d0
  006ca2  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ca8  20700804             movea.l   $4(a0, d0.l), a0
  006cac  7044                 moveq     #$44, d0
  006cae  c1c1                 muls.w    d1, d0
  006cb0  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006cb6  33a8007c081e         move.w    $7c(a0), $1e(a1, d0.l)
  006cbc  7044                 moveq     #$44, d0
  006cbe  c1c1                 muls.w    d1, d0
  006cc0  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006cc6  20700804             movea.l   $4(a0, d0.l), a0
  006cca  7044                 moveq     #$44, d0
  006ccc  c1c1                 muls.w    d1, d0
  006cce  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006cd4  3390080e             move.w    (a0), $e(a1, d0.l)
  006cd8  7044                 moveq     #$44, d0
  006cda  c1c1                 muls.w    d1, d0
  006cdc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ce2  20700804             movea.l   $4(a0, d0.l), a0
  006ce6  7044                 moveq     #$44, d0
  006ce8  c1c1                 muls.w    d1, d0
  006cea  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006cf0  33a800660810         move.w    $66(a0), $10(a1, d0.l)
  006cf6  7044                 moveq     #$44, d0
  006cf8  c1c1                 muls.w    d1, d0
  006cfa  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d00  20700804             movea.l   $4(a0, d0.l), a0
  006d04  7044                 moveq     #$44, d0
  006d06  c1c1                 muls.w    d1, d0
  006d08  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006d0e  33a8004c0812         move.w    $4c(a0), $12(a1, d0.l)
  006d14  7044                 moveq     #$44, d0
  006d16  c1c1                 muls.w    d1, d0
  006d18  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d1e  20700804             movea.l   $4(a0, d0.l), a0
  006d22  7044                 moveq     #$44, d0
  006d24  c1c1                 muls.w    d1, d0
  006d26  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006d2c  33a8005c0814         move.w    $5c(a0), $14(a1, d0.l)
  006d32  7044                 moveq     #$44, d0
  006d34  c1c1                 muls.w    d1, d0
  006d36  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d3c  20700804             movea.l   $4(a0, d0.l), a0
  006d40  7044                 moveq     #$44, d0
  006d42  c1c1                 muls.w    d1, d0
  006d44  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006d4a  33a8005a0816         move.w    $5a(a0), $16(a1, d0.l)
  006d50  7044                 moveq     #$44, d0
  006d52  c1c1                 muls.w    d1, d0
  006d54  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d5a  20700804             movea.l   $4(a0, d0.l), a0
  006d5e  7044                 moveq     #$44, d0
  006d60  c1c1                 muls.w    d1, d0
  006d62  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006d68  33a800680818         move.w    $68(a0), $18(a1, d0.l)
  006d6e  7044                 moveq     #$44, d0
  006d70  c1c1                 muls.w    d1, d0
  006d72  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d78  20700804             movea.l   $4(a0, d0.l), a0
  006d7c  7044                 moveq     #$44, d0
  006d7e  c1c1                 muls.w    d1, d0
  006d80  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006d86  33a80072081a         move.w    $72(a0), $1a(a1, d0.l)
  006d8c  7044                 moveq     #$44, d0
  006d8e  c1c1                 muls.w    d1, d0
  006d90  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006d96  20700804             movea.l   $4(a0, d0.l), a0
  006d9a  7044                 moveq     #$44, d0
  006d9c  c1c1                 muls.w    d1, d0
  006d9e  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006da4  33a80074081c         move.w    $74(a0), $1c(a1, d0.l)
  006daa  7044                 moveq     #$44, d0
  006dac  c1c1                 muls.w    d1, d0
  006dae  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006db4  20700804             movea.l   $4(a0, d0.l), a0
  006db8  7044                 moveq     #$44, d0
  006dba  c1c1                 muls.w    d1, d0
  006dbc  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006dc2  33a800080822         move.w    $8(a0), $22(a1, d0.l)
  006dc8  7044                 moveq     #$44, d0
  006dca  c1c1                 muls.w    d1, d0
  006dcc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006dd2  20700804             movea.l   $4(a0, d0.l), a0
  006dd6  7044                 moveq     #$44, d0
  006dd8  c1c1                 muls.w    d1, d0
  006dda  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006de0  33a800060820         move.w    $6(a0), $20(a1, d0.l)
  006de6  7044                 moveq     #$44, d0
  006de8  c1c1                 muls.w    d1, d0
  006dea  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006df0  20700804             movea.l   $4(a0, d0.l), a0
  006df4  7044                 moveq     #$44, d0
  006df6  c1c1                 muls.w    d1, d0
  006df8  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006dfe  33a8000c0826         move.w    $c(a0), $26(a1, d0.l)
  006e04  7044                 moveq     #$44, d0
  006e06  c1c1                 muls.w    d1, d0
  006e08  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006e0e  20700804             movea.l   $4(a0, d0.l), a0
  006e12  7044                 moveq     #$44, d0
  006e14  c1c1                 muls.w    d1, d0
  006e16  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006e1c  33a8000a0824         move.w    $a(a0), $24(a1, d0.l)
  006e22  7044                 moveq     #$44, d0
  006e24  c1c1                 muls.w    d1, d0
  006e26  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006e2c  20700804             movea.l   $4(a0, d0.l), a0
  006e30  7044                 moveq     #$44, d0
  006e32  c1c1                 muls.w    d1, d0
  006e34  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006e3a  33a80050082a         move.w    $50(a0), $2a(a1, d0.l)
  006e40  7044                 moveq     #$44, d0
  006e42  c1c1                 muls.w    d1, d0
  006e44  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006e4a  20700804             movea.l   $4(a0, d0.l), a0
  006e4e  7044                 moveq     #$44, d0
  006e50  c1c1                 muls.w    d1, d0
  006e52  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006e58  33a8004e0828         move.w    $4e(a0), $28(a1, d0.l)
  006e5e  7044                 moveq     #$44, d0
  006e60  c1c1                 muls.w    d1, d0
  006e62  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006e68  20700804             movea.l   $4(a0, d0.l), a0
  006e6c  7044                 moveq     #$44, d0
  006e6e  c1c1                 muls.w    d1, d0
  006e70  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006e76  23a8006e082c         move.l    $6e(a0), $2c(a1, d0.l)
  006e7c  7044                 moveq     #$44, d0
  006e7e  c1c1                 muls.w    d1, d0
  006e80  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006e86  20700804             movea.l   $4(a0, d0.l), a0
  006e8a  7044                 moveq     #$44, d0
  006e8c  c1c1                 muls.w    d1, d0
  006e8e  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006e94  13a8008b0830         move.b    $8b(a0), $30(a1, d0.l)
  006e9a  7044                 moveq     #$44, d0
  006e9c  c1c1                 muls.w    d1, d0
  006e9e  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ea4  20700804             movea.l   $4(a0, d0.l), a0
  006ea8  7044                 moveq     #$44, d0
  006eaa  c1c1                 muls.w    d1, d0
  006eac  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006eb2  13a8008c0831         move.b    $8c(a0), $31(a1, d0.l)
  006eb8  7044                 moveq     #$44, d0
  006eba  c1c1                 muls.w    d1, d0
  006ebc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ec2  20700804             movea.l   $4(a0, d0.l), a0
  006ec6  7044                 moveq     #$44, d0
  006ec8  c1c1                 muls.w    d1, d0
  006eca  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006ed0  33a800520832         move.w    $52(a0), $32(a1, d0.l)
  006ed6  7044                 moveq     #$44, d0
  006ed8  c1c1                 muls.w    d1, d0
  006eda  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006ee0  20700804             movea.l   $4(a0, d0.l), a0
  006ee4  7044                 moveq     #$44, d0
  006ee6  c1c1                 muls.w    d1, d0
  006ee8  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006eee  33a800540834         move.w    $54(a0), $34(a1, d0.l)
  006ef4  7044                 moveq     #$44, d0
  006ef6  c1c1                 muls.w    d1, d0
  006ef8  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006efe  20700804             movea.l   $4(a0, d0.l), a0
  006f02  7044                 moveq     #$44, d0
  006f04  c1c1                 muls.w    d1, d0
  006f06  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006f0c  33a8008e0836         move.w    $8e(a0), $36(a1, d0.l)
  006f12  7044                 moveq     #$44, d0
  006f14  c1c1                 muls.w    d1, d0
  006f16  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f1c  20700804             movea.l   $4(a0, d0.l), a0
  006f20  7044                 moveq     #$44, d0
  006f22  c1c1                 muls.w    d1, d0
  006f24  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006f2a  23a8001a0838         move.l    $1a(a0), $38(a1, d0.l)
  006f30  7044                 moveq     #$44, d0
  006f32  c1c1                 muls.w    d1, d0
  006f34  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f3a  20700804             movea.l   $4(a0, d0.l), a0
  006f3e  7044                 moveq     #$44, d0
  006f40  c1c1                 muls.w    d1, d0
  006f42  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006f48  23a8001e083c         move.l    $1e(a0), $3c(a1, d0.l)
  006f4e  7044                 moveq     #$44, d0
  006f50  c1c1                 muls.w    d1, d0
  006f52  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f58  20700804             movea.l   $4(a0, d0.l), a0
  006f5c  7044                 moveq     #$44, d0
  006f5e  c1c1                 muls.w    d1, d0
  006f60  43f900014294         lea.l     $14294.l, a1   ; idleSprites
  006f66  23a8009e0840         move.l    $9e(a0), $40(a1, d0.l)
  006f6c  7044                 moveq     #$44, d0
  006f6e  c1c1                 muls.w    d1, d0
  006f70  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f76  20700804             movea.l   $4(a0, d0.l), a0
  006f7a  42a8001a             clr.l     $1a(a0)
  006f7e  7044                 moveq     #$44, d0
  006f80  c1c1                 muls.w    d1, d0
  006f82  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f88  20700804             movea.l   $4(a0, d0.l), a0
  006f8c  42280092             clr.b     $92(a0)
  006f90  7044                 moveq     #$44, d0
  006f92  c1c1                 muls.w    d1, d0
  006f94  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006f9a  42b00804             clr.l     $4(a0, d0.l)
  006f9e  4e5e                 unlk      a6
  006fa0  4e75                 rts       

;-------------------------------------------------------------
; IdleToActiveSprite   (seg 1 +006fb8, 546 bytes)
  006fb8  4e560000             link.w    a6, #$0
  006fbc  48e71020             movem.l   d3/a2, -(a7)
  006fc0  362e0008             move.w    $8(a6), d3
  006fc4  594f                 subq.w    #$4, a7
  006fc6  7044                 moveq     #$44, d0
  006fc8  c1c3                 muls.w    d3, d0
  006fca  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006fd0  3f30080e             move.w    $e(a0, d0.l), -(a7)
  006fd4  7044                 moveq     #$44, d0
  006fd6  c1c3                 muls.w    d3, d0
  006fd8  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006fde  3f300814             move.w    $14(a0, d0.l), -(a7)
  006fe2  7044                 moveq     #$44, d0
  006fe4  c1c3                 muls.w    d3, d0
  006fe6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  006fec  3f300816             move.w    $16(a0, d0.l), -(a7)
  006ff0  42a7                 clr.l     -(a7)
  006ff2  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  006ff8  205f                 movea.l   (a7)+, a0
  006ffa  2448                 movea.l   a0, a2
  006ffc  7044                 moveq     #$44, d0
  006ffe  c1c3                 muls.w    d3, d0
  007000  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007006  218a0804             move.l    a2, $4(a0, d0.l)
  00700a  42aa0016             clr.l     $16(a2)
  00700e  42aa0086             clr.l     $86(a2)
  007012  157c0001008a         move.b    #$1, $8a(a2)
  007018  7044                 moveq     #$44, d0
  00701a  c1c3                 muls.w    d3, d0
  00701c  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007022  25700808007e         move.l    $8(a0, d0.l), $7e(a2)
  007028  7044                 moveq     #$44, d0
  00702a  c1c3                 muls.w    d3, d0
  00702c  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007032  3570081e007c         move.w    $1e(a0, d0.l), $7c(a2)
  007038  357cffff0082         move.w    #$ffff, $82(a2)
  00703e  357cffff0084         move.w    #$ffff, $84(a2)
  007044  7044                 moveq     #$44, d0
  007046  c1c3                 muls.w    d3, d0
  007048  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00704e  34b0080e             move.w    $e(a0, d0.l), (a2)
  007052  7044                 moveq     #$44, d0
  007054  c1c3                 muls.w    d3, d0
  007056  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00705c  357008100066         move.w    $10(a0, d0.l), $66(a2)
  007062  7044                 moveq     #$44, d0
  007064  c1c3                 muls.w    d3, d0
  007066  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00706c  35700812004c         move.w    $12(a0, d0.l), $4c(a2)
  007072  7044                 moveq     #$44, d0
  007074  c1c3                 muls.w    d3, d0
  007076  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00707c  35700814005c         move.w    $14(a0, d0.l), $5c(a2)
  007082  7044                 moveq     #$44, d0
  007084  c1c3                 muls.w    d3, d0
  007086  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00708c  35700816005a         move.w    $16(a0, d0.l), $5a(a2)
  007092  7044                 moveq     #$44, d0
  007094  c1c3                 muls.w    d3, d0
  007096  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00709c  357008180068         move.w    $18(a0, d0.l), $68(a2)
  0070a2  7044                 moveq     #$44, d0
  0070a4  c1c3                 muls.w    d3, d0
  0070a6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070ac  3570081a0072         move.w    $1a(a0, d0.l), $72(a2)
  0070b2  7044                 moveq     #$44, d0
  0070b4  c1c3                 muls.w    d3, d0
  0070b6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070bc  3570081c0074         move.w    $1c(a0, d0.l), $74(a2)
  0070c2  7044                 moveq     #$44, d0
  0070c4  c1c3                 muls.w    d3, d0
  0070c6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070cc  357008220008         move.w    $22(a0, d0.l), $8(a2)
  0070d2  7044                 moveq     #$44, d0
  0070d4  c1c3                 muls.w    d3, d0
  0070d6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070dc  357008200006         move.w    $20(a0, d0.l), $6(a2)
  0070e2  7044                 moveq     #$44, d0
  0070e4  c1c3                 muls.w    d3, d0
  0070e6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070ec  35700826000c         move.w    $26(a0, d0.l), $c(a2)
  0070f2  7044                 moveq     #$44, d0
  0070f4  c1c3                 muls.w    d3, d0
  0070f6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0070fc  35700824000a         move.w    $24(a0, d0.l), $a(a2)
  007102  7044                 moveq     #$44, d0
  007104  c1c3                 muls.w    d3, d0
  007106  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00710c  3570082a0050         move.w    $2a(a0, d0.l), $50(a2)
  007112  7044                 moveq     #$44, d0
  007114  c1c3                 muls.w    d3, d0
  007116  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00711c  35700828004e         move.w    $28(a0, d0.l), $4e(a2)
  007122  7044                 moveq     #$44, d0
  007124  c1c3                 muls.w    d3, d0
  007126  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00712c  2570082c006e         move.l    $2c(a0, d0.l), $6e(a2)
  007132  7044                 moveq     #$44, d0
  007134  c1c3                 muls.w    d3, d0
  007136  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00713c  15700830008b         move.b    $30(a0, d0.l), $8b(a2)
  007142  7044                 moveq     #$44, d0
  007144  c1c3                 muls.w    d3, d0
  007146  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00714c  15700831008c         move.b    $31(a0, d0.l), $8c(a2)
  007152  7044                 moveq     #$44, d0
  007154  c1c3                 muls.w    d3, d0
  007156  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00715c  357008320052         move.w    $32(a0, d0.l), $52(a2)
  007162  7044                 moveq     #$44, d0
  007164  c1c3                 muls.w    d3, d0
  007166  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00716c  357008340054         move.w    $34(a0, d0.l), $54(a2)
  007172  7044                 moveq     #$44, d0
  007174  c1c3                 muls.w    d3, d0
  007176  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00717c  35700836008e         move.w    $36(a0, d0.l), $8e(a2)
  007182  7044                 moveq     #$44, d0
  007184  c1c3                 muls.w    d3, d0
  007186  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00718c  25700838001a         move.l    $38(a0, d0.l), $1a(a2)
  007192  7044                 moveq     #$44, d0
  007194  c1c3                 muls.w    d3, d0
  007196  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00719c  2570083c001e         move.l    $3c(a0, d0.l), $1e(a2)
  0071a2  7044                 moveq     #$44, d0
  0071a4  c1c3                 muls.w    d3, d0
  0071a6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0071ac  25700840009e         move.l    $40(a0, d0.l), $9e(a2)
  0071b2  302a005c             move.w    $5c(a2), d0
  0071b6  48c0                 ext.l     d0
  0071b8  e188                 lsl.l     #$8, d0
  0071ba  2540005e             move.l    d0, $5e(a2)
  0071be  302a005a             move.w    $5a(a2), d0
  0071c2  48c0                 ext.l     d0
  0071c4  e188                 lsl.l     #$8, d0
  0071c6  25400062             move.l    d0, $62(a2)
  0071ca  422a0092             clr.b     $92(a2)
  0071ce  35430076             move.w    d3, $76(a2)
  0071d2  4cdf0408             movem.l   (a7)+, d3/a2
  0071d6  4e5e                 unlk      a6
  0071d8  4e75                 rts       

;-------------------------------------------------------------
; HandleIdleSprites   (seg 1 +0071f0, 500 bytes)
  0071f0  4e56ffe8             link.w    a6, #$ffe8
  0071f4  48e71f00             movem.l   d3-d7, -(a7)
  0071f8  486efff0             pea.l     -$10(a6)
  0071fc  3f390000806a         move.w    $806a.l, -(a7)   ; viewLeft
  007202  3f3900008068         move.w    $8068.l, -(a7)   ; viewTop
  007208  30390000806a         move.w    $806a.l, d0   ; viewLeft
  00720e  48c0                 ext.l     d0
  007210  0680000001c0         addi.l    #$1c0, d0
  007216  3f00                 move.w    d0, -(a7)
  007218  303900008068         move.w    $8068.l, d0   ; viewTop
  00721e  48c0                 ext.l     d0
  007220  0680000001c0         addi.l    #$1c0, d0
  007226  3f00                 move.w    d0, -(a7)
  007228  a8a7                 _SetRect  
  00722a  3c390000806a         move.w    $806a.l, d6   ; viewLeft
  007230  48c6                 ext.l     d6
  007232  0686000000e0         addi.l    #$e0, d6
  007238  3e3900008068         move.w    $8068.l, d7   ; viewTop
  00723e  48c7                 ext.l     d7
  007240  0687000000e0         addi.l    #$e0, d7
  007246  7600                 moveq     #$0, d3
  007248  60000188             bra.w     $73d2
  00724c  7044                 moveq     #$44, d0
  00724e  4c030800             muls.l    d3, d0
  007252  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007258  4a300800             tst.b     (a0, d0.l)
  00725c  67000172             beq.w     $73d0
  007260  7044                 moveq     #$44, d0
  007262  4c030800             muls.l    d3, d0
  007266  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00726c  30300814             move.w    $14(a0, d0.l), d0
  007270  48c0                 ext.l     d0
  007272  2806                 move.l    d6, d4
  007274  9880                 sub.l     d0, d4
  007276  70e8                 moveq     #$e8, d0
  007278  d880                 add.l     d0, d4
  00727a  7044                 moveq     #$44, d0
  00727c  4c030800             muls.l    d3, d0
  007280  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007286  30300816             move.w    $16(a0, d0.l), d0
  00728a  48c0                 ext.l     d0
  00728c  2a07                 move.l    d7, d5
  00728e  9a80                 sub.l     d0, d5
  007290  70e8                 moveq     #$e8, d0
  007292  da80                 add.l     d0, d5
  007294  4a84                 tst.l     d4
  007296  6c02                 bge.b     $729a
  007298  4484                 neg.l     d4
  00729a  4a85                 tst.l     d5
  00729c  6c02                 bge.b     $72a0
  00729e  4485                 neg.l     d5
  0072a0  7044                 moveq     #$44, d0
  0072a2  4c030800             muls.l    d3, d0
  0072a6  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0072ac  4ab00804             tst.l     $4(a0, d0.l)
  0072b0  6622                 bne.b     $72d4
  0072b2  0c840000015c         cmpi.l    #$15c, d4
  0072b8  6c000116             bge.w     $73d0
  0072bc  0c850000015c         cmpi.l    #$15c, d5
  0072c2  6c00010c             bge.w     $73d0
  0072c6  3f03                 move.w    d3, -(a7)
  0072c8  61fffffffcee         bsr.l     $6fb8   ; IdleToActiveSprite
  0072ce  544f                 addq.w    #$2, a7
  0072d0  600000fe             bra.w     $73d0
  0072d4  0c840000015c         cmpi.l    #$15c, d4
  0072da  6e0a                 bgt.b     $72e6
  0072dc  0c850000015c         cmpi.l    #$15c, d5
  0072e2  6f0000ec             ble.w     $73d0
  0072e6  7044                 moveq     #$44, d0
  0072e8  4c030800             muls.l    d3, d0
  0072ec  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0072f2  20700804             movea.l   $4(a0, d0.l), a0
  0072f6  3028005c             move.w    $5c(a0), d0
  0072fa  48c0                 ext.l     d0
  0072fc  7244                 moveq     #$44, d1
  0072fe  4c031800             muls.l    d3, d1
  007302  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007308  20701804             movea.l   $4(a0, d1.l), a0
  00730c  32280008             move.w    $8(a0), d1
  007310  48c1                 ext.l     d1
  007312  d280                 add.l     d0, d1
  007314  3d41fffa             move.w    d1, -$6(a6)
  007318  7044                 moveq     #$44, d0
  00731a  4c030800             muls.l    d3, d0
  00731e  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007324  20700804             movea.l   $4(a0, d0.l), a0
  007328  3028005a             move.w    $5a(a0), d0
  00732c  48c0                 ext.l     d0
  00732e  7244                 moveq     #$44, d1
  007330  4c031800             muls.l    d3, d1
  007334  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00733a  20701804             movea.l   $4(a0, d1.l), a0
  00733e  32280006             move.w    $6(a0), d1
  007342  48c1                 ext.l     d1
  007344  d280                 add.l     d0, d1
  007346  3d41fff8             move.w    d1, -$8(a6)
  00734a  7044                 moveq     #$44, d0
  00734c  4c030800             muls.l    d3, d0
  007350  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007356  20700804             movea.l   $4(a0, d0.l), a0
  00735a  3028005c             move.w    $5c(a0), d0
  00735e  48c0                 ext.l     d0
  007360  7244                 moveq     #$44, d1
  007362  4c031800             muls.l    d3, d1
  007366  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00736c  20701804             movea.l   $4(a0, d1.l), a0
  007370  3228000c             move.w    $c(a0), d1
  007374  48c1                 ext.l     d1
  007376  d280                 add.l     d0, d1
  007378  3d41fffe             move.w    d1, -$2(a6)
  00737c  7044                 moveq     #$44, d0
  00737e  4c030800             muls.l    d3, d0
  007382  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  007388  20700804             movea.l   $4(a0, d0.l), a0
  00738c  3028005a             move.w    $5a(a0), d0
  007390  48c0                 ext.l     d0
  007392  7244                 moveq     #$44, d1
  007394  4c031800             muls.l    d3, d1
  007398  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  00739e  20701804             movea.l   $4(a0, d1.l), a0
  0073a2  3228000a             move.w    $a(a0), d1
  0073a6  48c1                 ext.l     d1
  0073a8  d280                 add.l     d0, d1
  0073aa  3d41fffc             move.w    d1, -$4(a6)
  0073ae  554f                 subq.w    #$2, a7
  0073b0  486efff0             pea.l     -$10(a6)
  0073b4  486efff8             pea.l     -$8(a6)
  0073b8  486effe8             pea.l     -$18(a6)
  0073bc  a8aa                 _SectRect 
  0073be  101f                 move.b    (a7)+, d0
  0073c0  660e                 bne.b     $73d0
  0073c2  1f3c0001             move.b    #$1, -(a7)
  0073c6  3f03                 move.w    d3, -(a7)
  0073c8  61fffffff890         bsr.l     $6c5a   ; ActiveToIdleSprite
  0073ce  584f                 addq.w    #$4, a7
  0073d0  5283                 addq.l    #$1, d3
  0073d2  0c83000000ff         cmpi.l    #$ff, d3
  0073d8  6d00fe72             blt.w     $724c
  0073dc  4cdf00f8             movem.l   (a7)+, d3-d7
  0073e0  4e5e                 unlk      a6
  0073e2  4e75                 rts       

;-------------------------------------------------------------
; GameLoop   (seg 1 +0073f8, 1338 bytes)
  0073f8  4e56ffee             link.w    a6, #$ffee
  0073fc  48e71f30             movem.l   d3-d7/a2-a3, -(a7)
  007400  362e000a             move.w    $a(a6), d3
  007404  95ca                 suba.l    a2, a2
  007406  422effff             clr.b     -$1(a6)
  00740a  7a00                 moveq     #$0, d5
  00740c  2d7c41f00000fff6     move.l    #$41f00000, -$a(a6)
  007414  2d79000050fcffee     move.l    $50fc.l, -$12(a6)   ; g_50fc
  00741c  2d7900005100fff2     move.l    $5100.l, -$e(a6)   ; g_5100
  007424  2d7900018654fffa     move.l    $18654.l, -$6(a6)   ; g_18654
  00742c  7800                 moveq     #$0, d4
  00742e  7c00                 moveq     #$0, d6
  007430  7e00                 moveq     #$0, d7
  007432  487900007474         pea.l     $7474.l   ; gameOffscreen
  007438  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  00743e  3f3c0081             move.w    #$81, -(a7)
  007442  4eb900000078         jsr       $78.l   ; SATGETANDDRAWPICTRES
  007448  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00744e  4eb9000002e8         jsr       $2e8.l   ; INITTILESCROLL
  007454  2f3c00100010         move.l    #$100010, -(a7)
  00745a  4eb9000002f8         jsr       $2f8.l   ; SETTILESCROLLDRAWPOINT
  007460  48780004             pea.l     $4.w
  007464  4267                 clr.w     -(a7)
  007466  61ffffffec36         bsr.l     $609e   ; FadeMusic
  00746c  61ffffffcc6e         bsr.l     $40dc   ; SetupLevelSprites
  007472  4267                 clr.w     -(a7)
  007474  3f2e0008             move.w    $8(a6), -(a7)
  007478  3f03                 move.w    d3, -(a7)
  00747a  487900000460         pea.l     $460.l   ; SETUPPLAYERSPRITE
  007480  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  007486  205f                 movea.l   (a7)+, a0
  007488  23c800008070         move.l    a0, $8070.l   ; playerSprite
  00748e  207900008070         movea.l   $8070.l, a0   ; playerSprite
  007494  316e000c0066         move.w    $c(a6), $66(a0)
  00749a  302e0008             move.w    $8(a6), d0
  00749e  48c0                 ext.l     d0
  0074a0  72e0                 moveq     #$e0, d1
  0074a2  d081                 add.l     d1, d0
  0074a4  33c000008074         move.w    d0, $8074.l   ; playerH
  0074aa  3003                 move.w    d3, d0
  0074ac  48c0                 ext.l     d0
  0074ae  72e0                 moveq     #$e0, d1
  0074b0  d081                 add.l     d1, d0
  0074b2  33c000008076         move.w    d0, $8076.l   ; playerV
  0074b8  302e0008             move.w    $8(a6), d0
  0074bc  48c0                 ext.l     d0
  0074be  0680ffffff30         addi.l    #$ffffff30, d0
  0074c4  33c00000806e         move.w    d0, $806e.l   ; viewLeft2
  0074ca  33c000006aae         move.w    d0, $6aae.l   ; g_6aae
  0074d0  33c00000806a         move.w    d0, $806a.l   ; viewLeft
  0074d6  3003                 move.w    d3, d0
  0074d8  48c0                 ext.l     d0
  0074da  0680ffffff30         addi.l    #$ffffff30, d0
  0074e0  33c00000806c         move.w    d0, $806c.l   ; viewTop2
  0074e6  33c000006aac         move.w    d0, $6aac.l   ; g_6aac
  0074ec  33c000008068         move.w    d0, $8068.l   ; viewTop
  0074f2  594f                 subq.w    #$4, a7
  0074f4  4267                 clr.w     -(a7)
  0074f6  3f2e0008             move.w    $8(a6), -(a7)
  0074fa  3f03                 move.w    d3, -(a7)
  0074fc  4879000007b0         pea.l     $7b0.l   ; SETUPHELDWEAPONSPRITE
  007502  4eb900000100         jsr       $100.l   ; SATNEWSPRITE
  007508  205f                 movea.l   (a7)+, a0
  00750a  2448                 movea.l   a0, a2
  00750c  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  007512  4227                 clr.b     -(a7)
  007514  61ffffffac22         bsr.l     $2138   ; UpdateMeters
  00751a  4227                 clr.b     -(a7)
  00751c  61ffffffaa5c         bsr.l     $1f7a   ; UpdateText
  007522  4a2e000e             tst.b     $e(a6)
  007526  5c4f                 addq.w    #$6, a7
  007528  6746                 beq.b     $7570
  00752a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  007530  2250                 movea.l   (a0), a1
  007532  203c00012080         move.l    #$12080, d0
  007538  4a710800             tst.w     (a1, d0.l)
  00753c  6732                 beq.b     $7570
  00753e  3f3c0008             move.w    #$8, -(a7)
  007542  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  007548  1f3c0001             move.b    #$1, -(a7)
  00754c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  007552  2250                 movea.l   (a0), a1
  007554  203c00012080         move.l    #$12080, d0
  00755a  3f310800             move.w    (a1, d0.l), -(a7)
  00755e  61ffffffdcb8         bsr.l     $5218   ; ScrollPlot
  007564  3f3c0008             move.w    #$8, -(a7)
  007568  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00756e  504f                 addq.w    #$8, a7
  007570  61ffffffd832         bsr.l     $4da4   ; IntroLevel
  007576  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00757c  2250                 movea.l   (a0), a1
  00757e  203c000120fa         move.l    #$120fa, d0
  007584  3f310800             move.w    (a1, d0.l), -(a7)
  007588  4eb900000260         jsr       $260.l   ; SetMusic
  00758e  48780002             pea.l     $2.w
  007592  3f3c0001             move.w    #$1, -(a7)
  007596  61ffffffeb06         bsr.l     $609e   ; FadeMusic
  00759c  61ffffffc78c         bsr.l     $3d2a   ; LoadLevelSounds
  0075a2  4239000046ce         clr.b     $46ce.l   ; levelDone
  0075a8  48780021             pea.l     $21.w
  0075ac  a862                 _ForeColor 
  0075ae  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0075b4  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  0075ba  a975                 _TickCount 
  0075bc  201f                 move.l    (a7)+, d0
  0075be  2640                 movea.l   d0, a3
  0075c0  95ca                 suba.l    a2, a2
  0075c2  4eb9000009b8         jsr       $9b8.l   ; BuildTintTable
  0075c8  61ff00002414         bsr.l     $99de   ; FindUpperLeftCorner
  0075ce  3f390000806a         move.w    $806a.l, -(a7)   ; viewLeft
  0075d4  3f3900008068         move.w    $8068.l, -(a7)   ; viewTop
  0075da  4eb9000002e0         jsr       $2e0.l   ; SCROLLTO
  0075e0  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  0075e6  4eb900000c90         jsr       $c90.l   ; RedrawGameArea
  0075ec  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  0075f2  486efffa             pea.l     -$6(a6)
  0075f6  a870                 _LocalToGlobal 
  0075f8  33f900006aae00006ab2 move.w    $6aae.l, $6ab2.l   ; g_6aae, g_6ab2
  007602  33f900006aac00006ab0 move.w    $6aac.l, $6ab0.l   ; g_6aac, g_6ab0
  00760c  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  007614  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00761c  584f                 addq.w    #$4, a7
  00761e  600002cc             bra.w     $78ec
  007622  594f                 subq.w    #$4, a7
  007624  a975                 _TickCount 
  007626  201f                 move.l    (a7)+, d0
  007628  2600                 move.l    d0, d3
  00762a  422effff             clr.b     -$1(a6)
  00762e  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  007634  61fffffffbba         bsr.l     $71f0   ; HandleIdleSprites
  00763a  61fffffff300         bsr.l     $693c   ; HandleSprites
  007640  528a                 addq.l    #$1, a2
  007642  61ff0000239a         bsr.l     $99de   ; FindUpperLeftCorner
  007648  4a3900006172         tst.b     $6172.l   ; prefReduceFrameRate
  00764e  6704                 beq.b     $7654
  007650  4a05                 tst.b     d5
  007652  6726                 beq.b     $767a
  007654  3f390000806a         move.w    $806a.l, -(a7)   ; viewLeft
  00765a  3f3900008068         move.w    $8068.l, -(a7)   ; viewTop
  007660  4eb9000002e0         jsr       $2e0.l   ; SCROLLTO
  007666  4a3900013c2f         tst.b     $13c2f.l   ; g_13c2f
  00766c  670c                 beq.b     $767a
  00766e  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  007674  423900013c2f         clr.b     $13c2f.l   ; g_13c2f
  00767a  61ffffffcbbe         bsr.l     $423a   ; CheckTileCollisions
  007680  4a3900006172         tst.b     $6172.l   ; prefReduceFrameRate
  007686  6704                 beq.b     $768c
  007688  4a05                 tst.b     d5
  00768a  6718                 beq.b     $76a4
  00768c  61ff00001c14         bsr.l     $92a2   ; EraseSprites
  007692  61ff0000121a         bsr.l     $88ae   ; DrawSpritesBehindTiles
  007698  61ff000016e2         bsr.l     $8d7c   ; RedrawFGTiles
  00769e  61ff00001508         bsr.l     $8ba8   ; DrawSpritesAboveTiles
  0076a4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0076aa  2250                 movea.l   (a0), a1
  0076ac  203c0001208c         move.l    #$1208c, d0
  0076b2  30710800             movea.w   (a1, d0.l), a0
  0076b6  2008                 move.l    a0, d0
  0076b8  d1b90000f682         add.l     d0, $f682.l   ; g_f682
  0076be  4a3900006172         tst.b     $6172.l   ; prefReduceFrameRate
  0076c4  670000da             beq.w     $77a0
  0076c8  4a05                 tst.b     d5
  0076ca  670000c6             beq.w     $7792
  0076ce  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  0076d4  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  0076da  6620                 bne.b     $76fc
  0076dc  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  0076e2  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  0076e8  6612                 bne.b     $76fc
  0076ea  4a39000046af         tst.b     $46af.l   ; g_46af
  0076f0  660a                 bne.b     $76fc
  0076f2  4a04                 tst.b     d4
  0076f4  6606                 bne.b     $76fc
  0076f6  4a06                 tst.b     d6
  0076f8  67000086             beq.w     $7780
  0076fc  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  007702  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  007708  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  00770e  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  007714  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  00771a  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  007720  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  007726  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  00772c  4a390000f686         tst.b     $f686.l   ; g_f686
  007732  6714                 beq.b     $7748
  007734  4a3900006174         tst.b     $6174.l   ; prefInterlace
  00773a  670c                 beq.b     $7748
  00773c  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  007742  6704                 beq.b     $7748
  007744  7805                 moveq     #$5, d4
  007746  6006                 bra.b     $774e
  007748  4a04                 tst.b     d4
  00774a  6702                 beq.b     $774e
  00774c  5304                 subq.b    #$1, d4
  00774e  4239000046af         clr.b     $46af.l   ; g_46af
  007754  42390000f686         clr.b     $f686.l   ; g_f686
  00775a  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  007760  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  007766  660e                 bne.b     $7776
  007768  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  00776e  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  007774  6704                 beq.b     $777a
  007776  7c01                 moveq     #$1, d6
  007778  6002                 bra.b     $777c
  00777a  7c00                 moveq     #$0, d6
  00777c  7e01                 moveq     #$1, d7
  00777e  6012                 bra.b     $7792
  007780  4a07                 tst.b     d7
  007782  6706                 beq.b     $778a
  007784  61ff00000d56         bsr.l     $84dc   ; ExpandDirtyRects
  00778a  7e00                 moveq     #$0, d7
  00778c  61ff00000d9c         bsr.l     $852a   ; DrawDirtyRects
  007792  1005                 move.b    d5, d0
  007794  57c0                 seq.b     d0
  007796  4400                 neg.b     d0
  007798  49c0                 extb.l    d0
  00779a  1a00                 move.b    d0, d5
  00779c  600000c6             bra.w     $7864
  0077a0  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  0077a6  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  0077ac  6620                 bne.b     $77ce
  0077ae  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  0077b4  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  0077ba  6612                 bne.b     $77ce
  0077bc  4a39000046af         tst.b     $46af.l   ; g_46af
  0077c2  660a                 bne.b     $77ce
  0077c4  4a04                 tst.b     d4
  0077c6  6606                 bne.b     $77ce
  0077c8  4a06                 tst.b     d6
  0077ca  67000086             beq.w     $7852
  0077ce  3f3900006aae         move.w    $6aae.l, -(a7)   ; g_6aae
  0077d4  3f3900006aac         move.w    $6aac.l, -(a7)   ; g_6aac
  0077da  3f3900006aaa         move.w    $6aaa.l, -(a7)   ; g_6aaa
  0077e0  3f3900006aa8         move.w    $6aa8.l, -(a7)   ; g_6aa8
  0077e6  1f39000046cd         move.b    $46cd.l, -(a7)   ; g_46cd
  0077ec  1f3900006174         move.b    $6174.l, -(a7)   ; prefInterlace
  0077f2  1f3900006175         move.b    $6175.l, -(a7)   ; prefLineSkip
  0077f8  4eb9000002b8         jsr       $2b8.l   ; WRAPCOPY
  0077fe  4a390000f686         tst.b     $f686.l   ; g_f686
  007804  6714                 beq.b     $781a
  007806  4a3900006174         tst.b     $6174.l   ; prefInterlace
  00780c  670c                 beq.b     $781a
  00780e  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  007814  6704                 beq.b     $781a
  007816  7805                 moveq     #$5, d4
  007818  6006                 bra.b     $7820
  00781a  4a04                 tst.b     d4
  00781c  6702                 beq.b     $7820
  00781e  5304                 subq.b    #$1, d4
  007820  4239000046af         clr.b     $46af.l   ; g_46af
  007826  42390000f686         clr.b     $f686.l   ; g_f686
  00782c  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  007832  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  007838  660e                 bne.b     $7848
  00783a  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  007840  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  007846  6704                 beq.b     $784c
  007848  7c01                 moveq     #$1, d6
  00784a  6002                 bra.b     $784e
  00784c  7c00                 moveq     #$0, d6
  00784e  7e01                 moveq     #$1, d7
  007850  6012                 bra.b     $7864
  007852  4a07                 tst.b     d7
  007854  6706                 beq.b     $785c
  007856  61ff00000c84         bsr.l     $84dc   ; ExpandDirtyRects
  00785c  7e00                 moveq     #$0, d7
  00785e  61ff00000cca         bsr.l     $852a   ; DrawDirtyRects
  007864  1f3c0001             move.b    #$1, -(a7)
  007868  61ffffffa710         bsr.l     $1f7a   ; UpdateText
  00786e  1f3c0001             move.b    #$1, -(a7)
  007872  61ffffffa8c4         bsr.l     $2138   ; UpdateMeters
  007878  1f3c0001             move.b    #$1, -(a7)
  00787c  61ffffffaf24         bsr.l     $27a2   ; UpdateAmmo
  007882  61ffffffe93e         bsr.l     $61c2   ; CheckGameEvents
  007888  61ffffffebf0         bsr.l     $647a   ; CheckGameLoopKeys
  00788e  4eb900000bc0         jsr       $bc0.l   ; UpdateDynamicSounds
  007894  61ffffffd0ec         bsr.l     $4982   ; UpdateTrackMap
  00789a  4a3900006177         tst.b     $6177.l   ; g_6177
  0078a0  5c4f                 addq.w    #$6, a7
  0078a2  6702                 beq.b     $78a6
  0078a4  a9b4                 _SystemTask 
  0078a6  4a3900006172         tst.b     $6172.l   ; prefReduceFrameRate
  0078ac  6704                 beq.b     $78b2
  0078ae  4a05                 tst.b     d5
  0078b0  6714                 beq.b     $78c6
  0078b2  33f900006aae00006ab2 move.w    $6aae.l, $6ab2.l   ; g_6aae, g_6ab2
  0078bc  33f900006aac00006ab0 move.w    $6aac.l, $6ab0.l   ; g_6aac, g_6ab0
  0078c6  4a3900006172         tst.b     $6172.l   ; prefReduceFrameRate
  0078cc  6712                 beq.b     $78e0
  0078ce  4a05                 tst.b     d5
  0078d0  671a                 beq.b     $78ec
  0078d2  594f                 subq.w    #$4, a7
  0078d4  a975                 _TickCount 
  0078d6  201f                 move.l    (a7)+, d0
  0078d8  5980                 subq.l    #$4, d0
  0078da  b680                 cmp.l     d0, d3
  0078dc  62f4                 bhi.b     $78d2
  0078de  600c                 bra.b     $78ec
  0078e0  594f                 subq.w    #$4, a7
  0078e2  a975                 _TickCount 
  0078e4  201f                 move.l    (a7)+, d0
  0078e6  5580                 subq.l    #$2, d0
  0078e8  b680                 cmp.l     d0, d3
  0078ea  62f4                 bhi.b     $78e0
  0078ec  4a39000046ce         tst.b     $46ce.l   ; levelDone
  0078f2  6700fd2e             beq.w     $7622
  0078f6  4eb9000002f0         jsr       $2f0.l   ; KILLTILESCROLL
  0078fc  594f                 subq.w    #$4, a7
  0078fe  a975                 _TickCount 
  007900  201f                 move.l    (a7)+, d0
  007902  908b                 sub.l     a3, d0
  007904  2600                 move.l    d0, d3
  007906  4a79000046c4         tst.w     $46c4.l   ; g_46c4
  00790c  6e08                 bgt.b     $7916
  00790e  61ffffffd756         bsr.l     $5066   ; EndLevelEffect
  007914  600e                 bra.b     $7924
  007916  4a79000046c0         tst.w     $46c0.l   ; g_46c0
  00791c  6e06                 bgt.b     $7924
  00791e  61ffffffd746         bsr.l     $5066   ; EndLevelEffect
  007924  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00792a  4cdf0cf8             movem.l   (a7)+, d3-d7/a2-a3
  00792e  4e5e                 unlk      a6
  007930  4e75                 rts       

;-------------------------------------------------------------
; WarpDialog   (seg 1 +00793e, 242 bytes)
  00793e  4e56feec             link.w    a6, #$feec
  007942  48e71020             movem.l   d3/a2, -(a7)
  007946  7600                 moveq     #$0, d3
  007948  7001                 moveq     #$1, d0
  00794a  2d40fffa             move.l    d0, -$6(a6)
  00794e  a850                 _InitCursor 
  007950  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  007956  594f                 subq.w    #$4, a7
  007958  3f3c0190             move.w    #$190, -(a7)
  00795c  42a7                 clr.l     -(a7)
  00795e  4878ffff             pea.l     $ffff.w
  007962  a97c                 _GetNewDialog 
  007964  205f                 movea.l   (a7)+, a0
  007966  2448                 movea.l   a0, a2
  007968  4879000050b4         pea.l     $50b4.l   ; g_50b4
  00796e  3f3c0002             move.w    #$2, -(a7)
  007972  2f0a                 move.l    a2, -(a7)
  007974  4eb900000248         jsr       $248.l   ; SetTextDItem
  00797a  2f0a                 move.l    a2, -(a7)
  00797c  48780002             pea.l     $2.w
  007980  3f3c00ff             move.w    #$ff, -(a7)
  007984  a97e                 _SelectDialogItemText 
  007986  2f0a                 move.l    a2, -(a7)
  007988  a873                 _SetPort  
  00798a  2f0a                 move.l    a2, -(a7)
  00798c  a922                 _BeginUpdate 
  00798e  2f0a                 move.l    a2, -(a7)
  007990  3f3c0001             move.w    #$1, -(a7)
  007994  486efef0             pea.l     -$110(a6)
  007998  486efeec             pea.l     -$114(a6)
  00799c  486efff2             pea.l     -$e(a6)
  0079a0  a98d                 _GetDialogItem 
  0079a2  486efff2             pea.l     -$e(a6)
  0079a6  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  0079ac  a8a9                 _InsetRect 
  0079ae  2f3c00030003         move.l    #$30003, -(a7)
  0079b4  a89b                 _PenSize  
  0079b6  486efff2             pea.l     -$e(a6)
  0079ba  2f3c000f000f         move.l    #$f000f, -(a7)
  0079c0  a8b0                 _FrameRoundRect 
  0079c2  2f0a                 move.l    a2, -(a7)
  0079c4  a923                 _EndUpdate 
  0079c6  2f0a                 move.l    a2, -(a7)
  0079c8  a981                 _DrawDialog 
  0079ca  2f0a                 move.l    a2, -(a7)
  0079cc  a915                 _ShowWindow 
  0079ce  2f0a                 move.l    a2, -(a7)
  0079d0  a91f                 _SelectWindow 
  0079d2  4fef000a             lea.l     $a(a7), a7
  0079d6  6016                 bra.b     $79ee
  0079d8  42a7                 clr.l     -(a7)
  0079da  486efffe             pea.l     -$2(a6)
  0079de  a991                 _ModalDialog 
  0079e0  302efffe             move.w    -$2(a6), d0
  0079e4  48c0                 ext.l     d0
  0079e6  5380                 subq.l    #$1, d0
  0079e8  6702                 beq.b     $79ec
  0079ea  6002                 bra.b     $79ee
  0079ec  7601                 moveq     #$1, d3
  0079ee  4a03                 tst.b     d3
  0079f0  67e6                 beq.b     $79d8
  0079f2  486efef2             pea.l     -$10e(a6)
  0079f6  3f3c0002             move.w    #$2, -(a7)
  0079fa  2f0a                 move.l    a2, -(a7)
  0079fc  4eb900000250         jsr       $250.l   ; GetTextDItem
  007a02  486efef2             pea.l     -$10e(a6)
  007a06  486efffa             pea.l     -$6(a6)
  007a0a  4eb9000003e0         jsr       $3e0.l   ; seg4+9de
  007a10  2f0a                 move.l    a2, -(a7)
  007a12  a983                 _DisposeDialog 
  007a14  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  007a1a  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007a20  202efffa             move.l    -$6(a6), d0
  007a24  4fef000a             lea.l     $a(a7), a7
  007a28  4cdf0408             movem.l   (a7)+, d3/a2
  007a2c  4e5e                 unlk      a6
  007a2e  4e75                 rts       

;-------------------------------------------------------------
; NewGame   (seg 1 +007a3e, 852 bytes)
  007a3e  4e56fffe             link.w    a6, #$fffe
  007a42  2f03                 move.l    d3, -(a7)
  007a44  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  007a4a  201f                 move.l    (a7)+, d0
  007a4c  a032                 _FlushEvents 
  007a4e  4eb900000aa8         jsr       $aa8.l   ; KillAllSprites
  007a54  61ffffff9c5a         bsr.l     $16b0   ; InitGameGlobals
  007a5a  4239000070cf         clr.b     $70cf.l   ; g_70cf
  007a60  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  007a66  6712                 beq.b     $7a7a
  007a68  487900007f24         pea.l     $7f24.l   ; g_7f24
  007a6e  4eb900000cd0         jsr       $cd0.l   ; OpenDefaultWorld
  007a74  1600                 move.b    d0, d3
  007a76  584f                 addq.w    #$4, a7
  007a78  6064                 bra.b     $7ade
  007a7a  422effff             clr.b     -$1(a6)
  007a7e  7600                 moveq     #$0, d3
  007a80  486effff             pea.l     -$1(a6)
  007a84  4eb900000150         jsr       $150.l   ; seg7+609a
  007a8a  3600                 move.w    d0, d3
  007a8c  4a43                 tst.w     d3
  007a8e  584f                 addq.w    #$4, a7
  007a90  663a                 bne.b     $7acc
  007a92  4a2effff             tst.b     -$1(a6)
  007a96  672a                 beq.b     $7ac2
  007a98  423900007f22         clr.b     $7f22.l   ; g_7f22
  007a9e  4879000051a0         pea.l     $51a0.l   ; g_51a0
  007aa4  4879000050b6         pea.l     $50b6.l   ; g_50b6
  007aaa  1f3c0001             move.b    #$1, -(a7)
  007aae  4eb900000cc8         jsr       $cc8.l   ; OpenWorld
  007ab4  1600                 move.b    d0, d3
  007ab6  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007abc  4fef000a             lea.l     $a(a7), a7
  007ac0  601c                 bra.b     $7ade
  007ac2  61ff00004d7a         bsr.l     $c83e   ; LevelLimit
  007ac8  7600                 moveq     #$0, d3
  007aca  6012                 bra.b     $7ade
  007acc  3f03                 move.w    d3, -(a7)
  007ace  4879000051cc         pea.l     $51cc.l   ; g_51cc
  007ad4  4eb900000be8         jsr       $be8.l   ; ReportError
  007ada  7600                 moveq     #$0, d3
  007adc  5c4f                 addq.w    #$6, a7
  007ade  4a03                 tst.b     d3
  007ae0  670002aa             beq.w     $7d8c
  007ae4  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  007aea  670000c4             beq.w     $7bb0
  007aee  4eb900000b58         jsr       $b58.l   ; IsOptionPressed
  007af4  4a00                 tst.b     d0
  007af6  6756                 beq.b     $7b4e
  007af8  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  007afe  671a                 beq.b     $7b1a
  007b00  487900007f64         pea.l     $7f64.l   ; g_7f64
  007b06  61fffffffe36         bsr.l     $793e   ; WarpDialog
  007b0c  3f00                 move.w    d0, -(a7)
  007b0e  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007b14  5c4f                 addq.w    #$6, a7
  007b16  60000106             bra.w     $7c1e
  007b1a  487900005097         pea.l     $5097.l   ; g_5097
  007b20  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  007b26  487900007f64         pea.l     $7f64.l   ; g_7f64
  007b2c  3f3c0001             move.w    #$1, -(a7)
  007b30  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007b36  33fc000100013c1e     move.w    #$1, $13c1e.l   ; curLevel2
  007b3e  33fc000100008066     move.w    #$1, $8066.l   ; curLevel
  007b46  4fef000a             lea.l     $a(a7), a7
  007b4a  600000d2             bra.w     $7c1e
  007b4e  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  007b54  6736                 beq.b     $7b8c
  007b56  487900007f64         pea.l     $7f64.l   ; g_7f64
  007b5c  207900007468         movea.l   $7468.l, a0   ; hWorld
  007b62  2050                 movea.l   (a0), a0
  007b64  3f2801c4             move.w    $1c4(a0), -(a7)
  007b68  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007b6e  207900007468         movea.l   $7468.l, a0   ; hWorld
  007b74  2050                 movea.l   (a0), a0
  007b76  33e801c400013c1e     move.w    $1c4(a0), $13c1e.l   ; curLevel2
  007b7e  33e801c400008066     move.w    $1c4(a0), $8066.l   ; curLevel
  007b86  5c4f                 addq.w    #$6, a7
  007b88  60000094             bra.w     $7c1e
  007b8c  487900007f64         pea.l     $7f64.l   ; g_7f64
  007b92  3f3c0001             move.w    #$1, -(a7)
  007b96  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007b9c  33fc000100013c1e     move.w    #$1, $13c1e.l   ; curLevel2
  007ba4  33fc000100008066     move.w    #$1, $8066.l   ; curLevel
  007bac  5c4f                 addq.w    #$6, a7
  007bae  606e                 bra.b     $7c1e
  007bb0  4eb900000b58         jsr       $b58.l   ; IsOptionPressed
  007bb6  4a00                 tst.b     d0
  007bb8  674a                 beq.b     $7c04
  007bba  4a3900007f1a         tst.b     $7f1a.l   ; g_7f1a
  007bc0  6718                 beq.b     $7bda
  007bc2  487900007f64         pea.l     $7f64.l   ; g_7f64
  007bc8  61fffffffd74         bsr.l     $793e   ; WarpDialog
  007bce  3f00                 move.w    d0, -(a7)
  007bd0  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007bd6  5c4f                 addq.w    #$6, a7
  007bd8  6044                 bra.b     $7c1e
  007bda  487900005097         pea.l     $5097.l   ; g_5097
  007be0  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  007be6  487900007f64         pea.l     $7f64.l   ; g_7f64
  007bec  207900007468         movea.l   $7468.l, a0   ; hWorld
  007bf2  2050                 movea.l   (a0), a0
  007bf4  3f2801c4             move.w    $1c4(a0), -(a7)
  007bf8  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007bfe  4fef000a             lea.l     $a(a7), a7
  007c02  601a                 bra.b     $7c1e
  007c04  487900007f64         pea.l     $7f64.l   ; g_7f64
  007c0a  207900007468         movea.l   $7468.l, a0   ; hWorld
  007c10  2050                 movea.l   (a0), a0
  007c12  3f2801c4             move.w    $1c4(a0), -(a7)
  007c16  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  007c1c  5c4f                 addq.w    #$6, a7
  007c1e  4ab90000746c         tst.l     $746c.l   ; hLevel
  007c24  67000158             beq.w     $7d7e
  007c28  207900007468         movea.l   $7468.l, a0   ; hWorld
  007c2e  2050                 movea.l   (a0), a0
  007c30  33e801c400013c1e     move.w    $1c4(a0), $13c1e.l   ; curLevel2
  007c38  33e801c400008066     move.w    $1c4(a0), $8066.l   ; curLevel
  007c40  3f3c0008             move.w    #$8, -(a7)
  007c44  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  007c4a  4879000055a2         pea.l     $55a2.l   ; g_55a2
  007c50  3f3c0081             move.w    #$81, -(a7)
  007c54  4eb900000ab0         jsr       $ab0.l   ; DrawPICTToBackScreen
  007c5a  4eb900000b30         jsr       $b30.l   ; ResetCursor
  007c60  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  007c66  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  007c6c  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007c72  1f3c0001             move.b    #$1, -(a7)
  007c76  20790000746c         movea.l   $746c.l, a0   ; hLevel
  007c7c  2250                 movea.l   (a0), a1
  007c7e  203c000120f8         move.l    #$120f8, d0
  007c84  3f310800             move.w    (a1, d0.l), -(a7)
  007c88  20790000746c         movea.l   $746c.l, a0   ; hLevel
  007c8e  2250                 movea.l   (a0), a1
  007c90  203c000120f4         move.l    #$120f4, d0
  007c96  30310800             move.w    (a1, d0.l), d0
  007c9a  48c0                 ext.l     d0
  007c9c  72e0                 moveq     #$e0, d1
  007c9e  d081                 add.l     d1, d0
  007ca0  3f00                 move.w    d0, -(a7)
  007ca2  20790000746c         movea.l   $746c.l, a0   ; hLevel
  007ca8  2250                 movea.l   (a0), a1
  007caa  203c000120f6         move.l    #$120f6, d0
  007cb0  30310800             move.w    (a1, d0.l), d0
  007cb4  48c0                 ext.l     d0
  007cb6  72e0                 moveq     #$e0, d1
  007cb8  d081                 add.l     d1, d0
  007cba  3f00                 move.w    d0, -(a7)
  007cbc  61fffffff73a         bsr.l     $73f8   ; GameLoop
  007cc2  4a79000046c4         tst.w     $46c4.l   ; g_46c4
  007cc8  4fef0010             lea.l     $10(a7), a7
  007ccc  6f08                 ble.b     $7cd6
  007cce  4a79000046c0         tst.w     $46c0.l   ; g_46c0
  007cd4  6e3c                 bgt.b     $7d12
  007cd6  61ffffffdfc0         bsr.l     $5c98   ; RestorePreExistingWindowBackground
  007cdc  61ffffffe61c         bsr.l     $62fa   ; AskToContinue
  007ce2  4a00                 tst.b     d0
  007ce4  671e                 beq.b     $7d04
  007ce6  3f3c0008             move.w    #$8, -(a7)
  007cea  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  007cf0  13fc000100013c28     move.b    #$1, $13c28.l   ; g_13c28
  007cf8  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007cfe  544f                 addq.w    #$2, a7
  007d00  6000008a             bra.w     $7d8c
  007d04  423900013c28         clr.b     $13c28.l   ; g_13c28
  007d0a  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007d10  6006                 bra.b     $7d18
  007d12  423900013c28         clr.b     $13c28.l   ; g_13c28
  007d18  3f3c0008             move.w    #$8, -(a7)
  007d1c  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  007d22  61ffffffb2ae         bsr.l     $2fd2   ; DrawMainMenu
  007d28  4a3900013c2e         tst.b     $13c2e.l   ; g_13c2e
  007d2e  544f                 addq.w    #$2, a7
  007d30  671a                 beq.b     $7d4c
  007d32  3f3c0258             move.w    #$258, -(a7)
  007d36  4eb900000260         jsr       $260.l   ; SetMusic
  007d3c  48780002             pea.l     $2.w
  007d40  3f3c0001             move.w    #$1, -(a7)
  007d44  61ffffffe358         bsr.l     $609e   ; FadeMusic
  007d4a  504f                 addq.w    #$8, a7
  007d4c  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  007d52  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  007d58  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  007d5e  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  007d64  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  007d6a  3f3c0008             move.w    #$8, -(a7)
  007d6e  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  007d74  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  007d7a  544f                 addq.w    #$2, a7
  007d7c  600e                 bra.b     $7d8c
  007d7e  487900005044         pea.l     $5044.l   ; g_5044
  007d84  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  007d8a  584f                 addq.w    #$4, a7
  007d8c  261f                 move.l    (a7)+, d3
  007d8e  4e5e                 unlk      a6
  007d90  4e75                 rts       

;-------------------------------------------------------------
; AddBGProp   (seg 1 +007d9c, 112 bytes)
  007d9c  4e560000             link.w    a6, #$0
  007da0  74ff                 moveq     #$ff, d2
  007da2  7200                 moveq     #$0, d1
  007da4  6016                 bra.b     $7dbc
  007da6  700c                 moveq     #$c, d0
  007da8  c1c1                 muls.w    d1, d0
  007daa  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  007db0  4a300800             tst.b     (a0, d0.l)
  007db4  6604                 bne.b     $7dba
  007db6  3401                 move.w    d1, d2
  007db8  7240                 moveq     #$40, d1
  007dba  5241                 addq.w    #$1, d1
  007dbc  0c410040             cmpi.w    #$40, d1
  007dc0  6de4                 blt.b     $7da6
  007dc2  0c42ffff             cmpi.w    #$ffff, d2
  007dc6  6740                 beq.b     $7e08
  007dc8  700c                 moveq     #$c, d0
  007dca  c1c2                 muls.w    d2, d0
  007dcc  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  007dd2  31ae000a0804         move.w    $a(a6), $4(a0, d0.l)
  007dd8  700c                 moveq     #$c, d0
  007dda  c1c2                 muls.w    d2, d0
  007ddc  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  007de2  31ae00080802         move.w    $8(a6), $2(a0, d0.l)
  007de8  700c                 moveq     #$c, d0
  007dea  c1c2                 muls.w    d2, d0
  007dec  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  007df2  21ae000c0808         move.l    $c(a6), $8(a0, d0.l)
  007df8  700c                 moveq     #$c, d0
  007dfa  c1c2                 muls.w    d2, d0
  007dfc  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  007e02  11bc00010800         move.b    #$1, (a0, d0.l)
  007e08  4e5e                 unlk      a6
  007e0a  4e75                 rts       

;-------------------------------------------------------------
; AddFGProp   (seg 1 +007e18, 112 bytes)
  007e18  4e560000             link.w    a6, #$0
  007e1c  74ff                 moveq     #$ff, d2
  007e1e  7200                 moveq     #$0, d1
  007e20  6016                 bra.b     $7e38
  007e22  700c                 moveq     #$c, d0
  007e24  c1c1                 muls.w    d1, d0
  007e26  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  007e2c  4a300800             tst.b     (a0, d0.l)
  007e30  6604                 bne.b     $7e36
  007e32  3401                 move.w    d1, d2
  007e34  7240                 moveq     #$40, d1
  007e36  5241                 addq.w    #$1, d1
  007e38  0c410040             cmpi.w    #$40, d1
  007e3c  6de4                 blt.b     $7e22
  007e3e  0c42ffff             cmpi.w    #$ffff, d2
  007e42  6740                 beq.b     $7e84
  007e44  700c                 moveq     #$c, d0
  007e46  c1c2                 muls.w    d2, d0
  007e48  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  007e4e  31ae000a0804         move.w    $a(a6), $4(a0, d0.l)
  007e54  700c                 moveq     #$c, d0
  007e56  c1c2                 muls.w    d2, d0
  007e58  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  007e5e  31ae00080802         move.w    $8(a6), $2(a0, d0.l)
  007e64  700c                 moveq     #$c, d0
  007e66  c1c2                 muls.w    d2, d0
  007e68  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  007e6e  21ae000c0808         move.l    $c(a6), $8(a0, d0.l)
  007e74  700c                 moveq     #$c, d0
  007e76  c1c2                 muls.w    d2, d0
  007e78  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  007e7e  11bc00010800         move.b    #$1, (a0, d0.l)
  007e84  4e5e                 unlk      a6
  007e86  4e75                 rts       

;-------------------------------------------------------------
; FindScaledPosAndBounds   (seg 1 +007e94, 154 bytes)
  007e94  4e560000             link.w    a6, #$0
  007e98  48e70e08             movem.l   d4-d6/a4, -(a7)
  007e9c  206e000c             movea.l   $c(a6), a0
  007ea0  286e0014             movea.l   $14(a6), a4
  007ea4  226e0018             movea.l   $18(a6), a1
  007ea8  30280002             move.w    $2(a0), d0
  007eac  48c0                 ext.l     d0
  007eae  34280006             move.w    $6(a0), d2
  007eb2  48c2                 ext.l     d2
  007eb4  9480                 sub.l     d0, d2
  007eb6  3010                 move.w    (a0), d0
  007eb8  48c0                 ext.l     d0
  007eba  38280004             move.w    $4(a0), d4
  007ebe  48c4                 ext.l     d4
  007ec0  9880                 sub.l     d0, d4
  007ec2  3a02                 move.w    d2, d5
  007ec4  cbee0010             muls.w    $10(a6), d5
  007ec8  e085                 asr.l     #$8, d5
  007eca  3c04                 move.w    d4, d6
  007ecc  cdee0012             muls.w    $12(a6), d6
  007ed0  e086                 asr.l     #$8, d6
  007ed2  3005                 move.w    d5, d0
  007ed4  48c0                 ext.l     d0
  007ed6  3202                 move.w    d2, d1
  007ed8  48c1                 ext.l     d1
  007eda  9280                 sub.l     d0, d1
  007edc  e281                 asr.l     #$1, d1
  007ede  302e000a             move.w    $a(a6), d0
  007ee2  48c0                 ext.l     d0
  007ee4  d081                 add.l     d1, d0
  007ee6  39400002             move.w    d0, $2(a4)
  007eea  3006                 move.w    d6, d0
  007eec  48c0                 ext.l     d0
  007eee  3204                 move.w    d4, d1
  007ef0  48c1                 ext.l     d1
  007ef2  9280                 sub.l     d0, d1
  007ef4  e281                 asr.l     #$1, d1
  007ef6  302e0008             move.w    $8(a6), d0
  007efa  48c0                 ext.l     d0
  007efc  d081                 add.l     d1, d0
  007efe  3880                 move.w    d0, (a4)
  007f00  336800020002         move.w    $2(a0), $2(a1)
  007f06  3290                 move.w    (a0), (a1)
  007f08  3005                 move.w    d5, d0
  007f0a  48c0                 ext.l     d0
  007f0c  32280002             move.w    $2(a0), d1
  007f10  48c1                 ext.l     d1
  007f12  d280                 add.l     d0, d1
  007f14  33410006             move.w    d1, $6(a1)
  007f18  3006                 move.w    d6, d0
  007f1a  48c0                 ext.l     d0
  007f1c  3210                 move.w    (a0), d1
  007f1e  48c1                 ext.l     d1
  007f20  d280                 add.l     d0, d1
  007f22  33410004             move.w    d1, $4(a1)
  007f26  4cdf1070             movem.l   (a7)+, d4-d6/a4
  007f2a  4e5e                 unlk      a6
  007f2c  4e75                 rts       

;-------------------------------------------------------------
; WRAPDRAWSPRITE   (seg 1 +007f48, 1410 bytes)
  007f48  4e56ffea             link.w    a6, #$ffea
  007f4c  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  007f50  246e001c             movea.l   $1c(a6), a2
  007f54  286e0018             movea.l   $18(a6), a4
  007f58  266e0014             movea.l   $14(a6), a3
  007f5c  362e000a             move.w    $a(a6), d3
  007f60  382e0008             move.w    $8(a6), d4
  007f64  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  007f6a  48c0                 ext.l     d0
  007f6c  3203                 move.w    d3, d1
  007f6e  48c1                 ext.l     d1
  007f70  342e000e             move.w    $e(a6), d2
  007f74  48c2                 ext.l     d2
  007f76  d481                 add.l     d1, d2
  007f78  b480                 cmp.l     d0, d2
  007f7a  6d000544             blt.w     $84c0
  007f7e  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  007f84  48c0                 ext.l     d0
  007f86  3204                 move.w    d4, d1
  007f88  48c1                 ext.l     d1
  007f8a  342e000c             move.w    $c(a6), d2
  007f8e  48c2                 ext.l     d2
  007f90  d481                 add.l     d1, d2
  007f92  b480                 cmp.l     d0, d2
  007f94  6d00052a             blt.w     $84c0
  007f98  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  007f9e  48c0                 ext.l     d0
  007fa0  0680000001c0         addi.l    #$1c0, d0
  007fa6  322e000e             move.w    $e(a6), d1
  007faa  48c1                 ext.l     d1
  007fac  b280                 cmp.l     d0, d1
  007fae  6e000510             bgt.w     $84c0
  007fb2  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  007fb8  48c0                 ext.l     d0
  007fba  0680000001c0         addi.l    #$1c0, d0
  007fc0  322e000c             move.w    $c(a6), d1
  007fc4  48c1                 ext.l     d1
  007fc6  b280                 cmp.l     d0, d1
  007fc8  6e0004f6             bgt.w     $84c0
  007fcc  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  007fd2  48c0                 ext.l     d0
  007fd4  0680000001c0         addi.l    #$1c0, d0
  007fda  3204                 move.w    d4, d1
  007fdc  48c1                 ext.l     d1
  007fde  342e000c             move.w    $c(a6), d2
  007fe2  48c2                 ext.l     d2
  007fe4  d481                 add.l     d1, d2
  007fe6  b480                 cmp.l     d0, d2
  007fe8  6f16                 ble.b     $8000
  007fea  302e000c             move.w    $c(a6), d0
  007fee  48c0                 ext.l     d0
  007ff0  383900006aac         move.w    $6aac.l, d4   ; g_6aac
  007ff6  48c4                 ext.l     d4
  007ff8  0684000001c0         addi.l    #$1c0, d4
  007ffe  9880                 sub.l     d0, d4
  008000  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  008006  48c0                 ext.l     d0
  008008  0680000001e0         addi.l    #$1e0, d0
  00800e  3203                 move.w    d3, d1
  008010  48c1                 ext.l     d1
  008012  342e000e             move.w    $e(a6), d2
  008016  48c2                 ext.l     d2
  008018  d481                 add.l     d1, d2
  00801a  b480                 cmp.l     d0, d2
  00801c  6f16                 ble.b     $8034
  00801e  302e000e             move.w    $e(a6), d0
  008022  48c0                 ext.l     d0
  008024  363900006aae         move.w    $6aae.l, d3   ; g_6aae
  00802a  48c3                 ext.l     d3
  00802c  0683000001e0         addi.l    #$1e0, d3
  008032  9680                 sub.l     d0, d3
  008034  302e000e             move.w    $e(a6), d0
  008038  b07900006aae         cmp.w     $6aae.l, d0   ; g_6aae
  00803e  6c3c                 bge.b     $807c
  008040  302e000e             move.w    $e(a6), d0
  008044  48c0                 ext.l     d0
  008046  323900006aae         move.w    $6aae.l, d1   ; g_6aae
  00804c  48c1                 ext.l     d1
  00804e  9280                 sub.l     d0, d1
  008050  3003                 move.w    d3, d0
  008052  48c0                 ext.l     d0
  008054  9081                 sub.l     d1, d0
  008056  3600                 move.w    d0, d3
  008058  302e000e             move.w    $e(a6), d0
  00805c  48c0                 ext.l     d0
  00805e  323900006aae         move.w    $6aae.l, d1   ; g_6aae
  008064  48c1                 ext.l     d1
  008066  9280                 sub.l     d0, d1
  008068  302e0012             move.w    $12(a6), d0
  00806c  48c0                 ext.l     d0
  00806e  d081                 add.l     d1, d0
  008070  3d400012             move.w    d0, $12(a6)
  008074  3d7900006aae000e     move.w    $6aae.l, $e(a6)   ; g_6aae
  00807c  302e000c             move.w    $c(a6), d0
  008080  b07900006aac         cmp.w     $6aac.l, d0   ; g_6aac
  008086  6c3c                 bge.b     $80c4
  008088  302e000c             move.w    $c(a6), d0
  00808c  48c0                 ext.l     d0
  00808e  323900006aac         move.w    $6aac.l, d1   ; g_6aac
  008094  48c1                 ext.l     d1
  008096  9280                 sub.l     d0, d1
  008098  3004                 move.w    d4, d0
  00809a  48c0                 ext.l     d0
  00809c  9081                 sub.l     d1, d0
  00809e  3800                 move.w    d0, d4
  0080a0  302e000c             move.w    $c(a6), d0
  0080a4  48c0                 ext.l     d0
  0080a6  323900006aac         move.w    $6aac.l, d1   ; g_6aac
  0080ac  48c1                 ext.l     d1
  0080ae  9280                 sub.l     d0, d1
  0080b0  302e0010             move.w    $10(a6), d0
  0080b4  48c0                 ext.l     d0
  0080b6  d081                 add.l     d1, d0
  0080b8  3d400010             move.w    d0, $10(a6)
  0080bc  3d7900006aac000c     move.w    $6aac.l, $c(a6)   ; g_6aac
  0080c4  3a03                 move.w    d3, d5
  0080c6  3c04                 move.w    d4, d6
  0080c8  302e000e             move.w    $e(a6), d0
  0080cc  48c0                 ext.l     d0
  0080ce  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  0080d6  3d41000e             move.w    d1, $e(a6)
  0080da  302e000c             move.w    $c(a6), d0
  0080de  48c0                 ext.l     d0
  0080e0  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  0080e8  3d41000c             move.w    d1, $c(a6)
  0080ec  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  0080f2  48c0                 ext.l     d0
  0080f4  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  0080fc  3e01                 move.w    d1, d7
  0080fe  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  008104  48c0                 ext.l     d0
  008106  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  00810e  3e01                 move.w    d1, d7
  008110  200c                 move.l    a4, d0
  008112  672c                 beq.b     $8140
  008114  554f                 subq.w    #$2, a7
  008116  2f0c                 move.l    a4, -(a7)
  008118  4eb9000009f8         jsr       $9f8.l   ; SHOULDSCALE
  00811e  101f                 move.b    (a7)+, d0
  008120  661e                 bne.b     $8140
  008122  4a6e000e             tst.w     $e(a6)
  008126  6d00011a             blt.w     $8242
  00812a  3003                 move.w    d3, d0
  00812c  48c0                 ext.l     d0
  00812e  322e000e             move.w    $e(a6), d1
  008132  48c1                 ext.l     d1
  008134  d280                 add.l     d0, d1
  008136  0c81000001e0         cmpi.l    #$1e0, d1
  00813c  6c000104             bge.w     $8242
  008140  2f0a                 move.l    a2, -(a7)
  008142  2f0c                 move.l    a4, -(a7)
  008144  2f0b                 move.l    a3, -(a7)
  008146  2f2e0010             move.l    $10(a6), -(a7)
  00814a  2f2e000c             move.l    $c(a6), -(a7)
  00814e  3f03                 move.w    d3, -(a7)
  008150  3f04                 move.w    d4, -(a7)
  008152  206a0018             movea.l   $18(a2), a0
  008156  4e90                 jsr       (a0)
  008158  3806                 move.w    d6, d4
  00815a  3605                 move.w    d5, d3
  00815c  302e000c             move.w    $c(a6), d0
  008160  48c0                 ext.l     d0
  008162  0680fffffe20         addi.l    #$fffffe20, d0
  008168  3d40000c             move.w    d0, $c(a6)
  00816c  3004                 move.w    d4, d0
  00816e  48c0                 ext.l     d0
  008170  322e000c             move.w    $c(a6), d1
  008174  48c1                 ext.l     d1
  008176  d280                 add.l     d0, d1
  008178  4a81                 tst.l     d1
  00817a  6f18                 ble.b     $8194
  00817c  2f0a                 move.l    a2, -(a7)
  00817e  2f0c                 move.l    a4, -(a7)
  008180  2f0b                 move.l    a3, -(a7)
  008182  2f2e0010             move.l    $10(a6), -(a7)
  008186  2f2e000c             move.l    $c(a6), -(a7)
  00818a  3f03                 move.w    d3, -(a7)
  00818c  3f04                 move.w    d4, -(a7)
  00818e  206a0018             movea.l   $18(a2), a0
  008192  4e90                 jsr       (a0)
  008194  302e000c             move.w    $c(a6), d0
  008198  48c0                 ext.l     d0
  00819a  0680000001e0         addi.l    #$1e0, d0
  0081a0  3d40000c             move.w    d0, $c(a6)
  0081a4  3806                 move.w    d6, d4
  0081a6  3605                 move.w    d5, d3
  0081a8  302e000e             move.w    $e(a6), d0
  0081ac  48c0                 ext.l     d0
  0081ae  0680fffffe20         addi.l    #$fffffe20, d0
  0081b4  3d40000e             move.w    d0, $e(a6)
  0081b8  3003                 move.w    d3, d0
  0081ba  48c0                 ext.l     d0
  0081bc  322e000e             move.w    $e(a6), d1
  0081c0  48c1                 ext.l     d1
  0081c2  d280                 add.l     d0, d1
  0081c4  4a81                 tst.l     d1
  0081c6  6f1e                 ble.b     $81e6
  0081c8  4aaa0018             tst.l     $18(a2)
  0081cc  6718                 beq.b     $81e6
  0081ce  2f0a                 move.l    a2, -(a7)
  0081d0  2f0c                 move.l    a4, -(a7)
  0081d2  2f0b                 move.l    a3, -(a7)
  0081d4  2f2e0010             move.l    $10(a6), -(a7)
  0081d8  2f2e000c             move.l    $c(a6), -(a7)
  0081dc  3f03                 move.w    d3, -(a7)
  0081de  3f04                 move.w    d4, -(a7)
  0081e0  206a0018             movea.l   $18(a2), a0
  0081e4  4e90                 jsr       (a0)
  0081e6  3806                 move.w    d6, d4
  0081e8  3605                 move.w    d5, d3
  0081ea  302e000c             move.w    $c(a6), d0
  0081ee  48c0                 ext.l     d0
  0081f0  0680fffffe20         addi.l    #$fffffe20, d0
  0081f6  3d40000c             move.w    d0, $c(a6)
  0081fa  3003                 move.w    d3, d0
  0081fc  48c0                 ext.l     d0
  0081fe  322e000e             move.w    $e(a6), d1
  008202  48c1                 ext.l     d1
  008204  d280                 add.l     d0, d1
  008206  4a81                 tst.l     d1
  008208  6f0002b6             ble.w     $84c0
  00820c  3004                 move.w    d4, d0
  00820e  48c0                 ext.l     d0
  008210  322e000c             move.w    $c(a6), d1
  008214  48c1                 ext.l     d1
  008216  d280                 add.l     d0, d1
  008218  4a81                 tst.l     d1
  00821a  6f0002a4             ble.w     $84c0
  00821e  4aaa0018             tst.l     $18(a2)
  008222  6700029c             beq.w     $84c0
  008226  2f0a                 move.l    a2, -(a7)
  008228  2f0c                 move.l    a4, -(a7)
  00822a  2f0b                 move.l    a3, -(a7)
  00822c  2f2e0010             move.l    $10(a6), -(a7)
  008230  2f2e000c             move.l    $c(a6), -(a7)
  008234  3f03                 move.w    d3, -(a7)
  008236  3f04                 move.w    d4, -(a7)
  008238  206a0018             movea.l   $18(a2), a0
  00823c  4e90                 jsr       (a0)
  00823e  60000280             bra.w     $84c0
  008242  486efffc             pea.l     -$4(a6)
  008246  4eb9000009f0         jsr       $9f0.l   ; GETSCALEPORT
  00824c  3e2e000e             move.w    $e(a6), d7
  008250  3d6e000cfffa         move.w    $c(a6), -$6(a6)
  008256  4eb9000009e0         jsr       $9e0.l   ; DEBUGHOOK
  00825c  4aaa0018             tst.l     $18(a2)
  008260  6714                 beq.b     $8276
  008262  2f0b                 move.l    a3, -(a7)
  008264  2f2e0010             move.l    $10(a6), -(a7)
  008268  2f2e000c             move.l    $c(a6), -(a7)
  00826c  3f03                 move.w    d3, -(a7)
  00826e  3f04                 move.w    d4, -(a7)
  008270  4eb9000009d0         jsr       $9d0.l   ; COPYTOSCALEPORT
  008276  302e000c             move.w    $c(a6), d0
  00827a  48c0                 ext.l     d0
  00827c  0680fffffe20         addi.l    #$fffffe20, d0
  008282  3d40000c             move.w    d0, $c(a6)
  008286  3004                 move.w    d4, d0
  008288  48c0                 ext.l     d0
  00828a  322e000c             move.w    $c(a6), d1
  00828e  48c1                 ext.l     d1
  008290  d280                 add.l     d0, d1
  008292  4a81                 tst.l     d1
  008294  6f14                 ble.b     $82aa
  008296  2f0b                 move.l    a3, -(a7)
  008298  2f2e0010             move.l    $10(a6), -(a7)
  00829c  2f2e000c             move.l    $c(a6), -(a7)
  0082a0  3f03                 move.w    d3, -(a7)
  0082a2  3f04                 move.w    d4, -(a7)
  0082a4  4eb9000009d0         jsr       $9d0.l   ; COPYTOSCALEPORT
  0082aa  302e000c             move.w    $c(a6), d0
  0082ae  48c0                 ext.l     d0
  0082b0  0680000001e0         addi.l    #$1e0, d0
  0082b6  3d40000c             move.w    d0, $c(a6)
  0082ba  3806                 move.w    d6, d4
  0082bc  3605                 move.w    d5, d3
  0082be  302e000e             move.w    $e(a6), d0
  0082c2  48c0                 ext.l     d0
  0082c4  0680fffffe20         addi.l    #$fffffe20, d0
  0082ca  3d40000e             move.w    d0, $e(a6)
  0082ce  3003                 move.w    d3, d0
  0082d0  48c0                 ext.l     d0
  0082d2  322e000e             move.w    $e(a6), d1
  0082d6  48c1                 ext.l     d1
  0082d8  d280                 add.l     d0, d1
  0082da  4a81                 tst.l     d1
  0082dc  6f14                 ble.b     $82f2
  0082de  2f0b                 move.l    a3, -(a7)
  0082e0  2f2e0010             move.l    $10(a6), -(a7)
  0082e4  2f2e000c             move.l    $c(a6), -(a7)
  0082e8  3f03                 move.w    d3, -(a7)
  0082ea  3f04                 move.w    d4, -(a7)
  0082ec  4eb9000009d0         jsr       $9d0.l   ; COPYTOSCALEPORT
  0082f2  3806                 move.w    d6, d4
  0082f4  3605                 move.w    d5, d3
  0082f6  302e000c             move.w    $c(a6), d0
  0082fa  48c0                 ext.l     d0
  0082fc  0680fffffe20         addi.l    #$fffffe20, d0
  008302  3d40000c             move.w    d0, $c(a6)
  008306  3003                 move.w    d3, d0
  008308  48c0                 ext.l     d0
  00830a  322e000e             move.w    $e(a6), d1
  00830e  48c1                 ext.l     d1
  008310  d280                 add.l     d0, d1
  008312  4a81                 tst.l     d1
  008314  6f24                 ble.b     $833a
  008316  3004                 move.w    d4, d0
  008318  48c0                 ext.l     d0
  00831a  322e000c             move.w    $c(a6), d1
  00831e  48c1                 ext.l     d1
  008320  d280                 add.l     d0, d1
  008322  4a81                 tst.l     d1
  008324  6f14                 ble.b     $833a
  008326  2f0b                 move.l    a3, -(a7)
  008328  2f2e0010             move.l    $10(a6), -(a7)
  00832c  2f2e000c             move.l    $c(a6), -(a7)
  008330  3f03                 move.w    d3, -(a7)
  008332  3f04                 move.w    d4, -(a7)
  008334  4eb9000009d0         jsr       $9d0.l   ; COPYTOSCALEPORT
  00833a  426e000e             clr.w     $e(a6)
  00833e  426e000c             clr.w     $c(a6)
  008342  3806                 move.w    d6, d4
  008344  3605                 move.w    d5, d3
  008346  4aaa0018             tst.l     $18(a2)
  00834a  671a                 beq.b     $8366
  00834c  2f0a                 move.l    a2, -(a7)
  00834e  2f0c                 move.l    a4, -(a7)
  008350  2f2efffc             move.l    -$4(a6), -(a7)
  008354  2f2e0010             move.l    $10(a6), -(a7)
  008358  2f2e0010             move.l    $10(a6), -(a7)
  00835c  3f03                 move.w    d3, -(a7)
  00835e  3f04                 move.w    d4, -(a7)
  008360  206a0018             movea.l   $18(a2), a0
  008364  4e90                 jsr       (a0)
  008366  3d47000e             move.w    d7, $e(a6)
  00836a  3d6efffa000c         move.w    -$6(a6), $c(a6)
  008370  486efff2             pea.l     -$e(a6)
  008374  3f2e0012             move.w    $12(a6), -(a7)
  008378  3f2e0010             move.w    $10(a6), -(a7)
  00837c  3003                 move.w    d3, d0
  00837e  48c0                 ext.l     d0
  008380  322e0012             move.w    $12(a6), d1
  008384  48c1                 ext.l     d1
  008386  d280                 add.l     d0, d1
  008388  3f01                 move.w    d1, -(a7)
  00838a  3004                 move.w    d4, d0
  00838c  48c0                 ext.l     d0
  00838e  322e0010             move.w    $10(a6), d1
  008392  48c1                 ext.l     d1
  008394  d280                 add.l     d0, d1
  008396  3f01                 move.w    d1, -(a7)
  008398  a8a7                 _SetRect  
  00839a  486effea             pea.l     -$16(a6)
  00839e  3f2e000e             move.w    $e(a6), -(a7)
  0083a2  3f2e000c             move.w    $c(a6), -(a7)
  0083a6  3003                 move.w    d3, d0
  0083a8  48c0                 ext.l     d0
  0083aa  322e000e             move.w    $e(a6), d1
  0083ae  48c1                 ext.l     d1
  0083b0  d280                 add.l     d0, d1
  0083b2  3f01                 move.w    d1, -(a7)
  0083b4  3004                 move.w    d4, d0
  0083b6  48c0                 ext.l     d0
  0083b8  322e000c             move.w    $c(a6), d1
  0083bc  48c1                 ext.l     d1
  0083be  d280                 add.l     d0, d1
  0083c0  3f01                 move.w    d1, -(a7)
  0083c2  a8a7                 _SetRect  
  0083c4  4aaa0018             tst.l     $18(a2)
  0083c8  6716                 beq.b     $83e0
  0083ca  2f2efffc             move.l    -$4(a6), -(a7)
  0083ce  2f2e0010             move.l    $10(a6), -(a7)
  0083d2  2f2e000c             move.l    $c(a6), -(a7)
  0083d6  3f03                 move.w    d3, -(a7)
  0083d8  3f04                 move.w    d4, -(a7)
  0083da  4eb9000009e8         jsr       $9e8.l   ; COPYSCALEPORTBACK
  0083e0  3806                 move.w    d6, d4
  0083e2  3605                 move.w    d5, d3
  0083e4  302e000c             move.w    $c(a6), d0
  0083e8  48c0                 ext.l     d0
  0083ea  0680fffffe20         addi.l    #$fffffe20, d0
  0083f0  3d40000c             move.w    d0, $c(a6)
  0083f4  3004                 move.w    d4, d0
  0083f6  48c0                 ext.l     d0
  0083f8  322e000c             move.w    $c(a6), d1
  0083fc  48c1                 ext.l     d1
  0083fe  d280                 add.l     d0, d1
  008400  4a81                 tst.l     d1
  008402  6f1c                 ble.b     $8420
  008404  4aaa0018             tst.l     $18(a2)
  008408  6716                 beq.b     $8420
  00840a  2f2efffc             move.l    -$4(a6), -(a7)
  00840e  2f2e0010             move.l    $10(a6), -(a7)
  008412  2f2e000c             move.l    $c(a6), -(a7)
  008416  3f03                 move.w    d3, -(a7)
  008418  3f04                 move.w    d4, -(a7)
  00841a  4eb9000009e8         jsr       $9e8.l   ; COPYSCALEPORTBACK
  008420  302e000c             move.w    $c(a6), d0
  008424  48c0                 ext.l     d0
  008426  0680000001e0         addi.l    #$1e0, d0
  00842c  3d40000c             move.w    d0, $c(a6)
  008430  3806                 move.w    d6, d4
  008432  3605                 move.w    d5, d3
  008434  302e000e             move.w    $e(a6), d0
  008438  48c0                 ext.l     d0
  00843a  0680fffffe20         addi.l    #$fffffe20, d0
  008440  3d40000e             move.w    d0, $e(a6)
  008444  3003                 move.w    d3, d0
  008446  48c0                 ext.l     d0
  008448  322e000e             move.w    $e(a6), d1
  00844c  48c1                 ext.l     d1
  00844e  d280                 add.l     d0, d1
  008450  4a81                 tst.l     d1
  008452  6f1c                 ble.b     $8470
  008454  4aaa0018             tst.l     $18(a2)
  008458  6716                 beq.b     $8470
  00845a  2f2efffc             move.l    -$4(a6), -(a7)
  00845e  2f2e0010             move.l    $10(a6), -(a7)
  008462  2f2e000c             move.l    $c(a6), -(a7)
  008466  3f03                 move.w    d3, -(a7)
  008468  3f04                 move.w    d4, -(a7)
  00846a  4eb9000009e8         jsr       $9e8.l   ; COPYSCALEPORTBACK
  008470  3806                 move.w    d6, d4
  008472  3605                 move.w    d5, d3
  008474  302e000c             move.w    $c(a6), d0
  008478  48c0                 ext.l     d0
  00847a  0680fffffe20         addi.l    #$fffffe20, d0
  008480  3d40000c             move.w    d0, $c(a6)
  008484  3003                 move.w    d3, d0
  008486  48c0                 ext.l     d0
  008488  322e000e             move.w    $e(a6), d1
  00848c  48c1                 ext.l     d1
  00848e  d280                 add.l     d0, d1
  008490  4a81                 tst.l     d1
  008492  6f2c                 ble.b     $84c0
  008494  3004                 move.w    d4, d0
  008496  48c0                 ext.l     d0
  008498  322e000c             move.w    $c(a6), d1
  00849c  48c1                 ext.l     d1
  00849e  d280                 add.l     d0, d1
  0084a0  4a81                 tst.l     d1
  0084a2  6f1c                 ble.b     $84c0
  0084a4  4aaa0018             tst.l     $18(a2)
  0084a8  6716                 beq.b     $84c0
  0084aa  2f2efffc             move.l    -$4(a6), -(a7)
  0084ae  2f2e0010             move.l    $10(a6), -(a7)
  0084b2  2f2e000c             move.l    $c(a6), -(a7)
  0084b6  3f03                 move.w    d3, -(a7)
  0084b8  3f04                 move.w    d4, -(a7)
  0084ba  4eb9000009e8         jsr       $9e8.l   ; COPYSCALEPORTBACK
  0084c0  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0084c4  4e5e                 unlk      a6
  0084c6  4e740018             rtd       #$18

;-------------------------------------------------------------
; ExpandDirtyRects   (seg 1 +0084dc, 58 bytes)
  0084dc  4e560000             link.w    a6, #$0
  0084e0  2f03                 move.l    d3, -(a7)
  0084e2  7600                 moveq     #$0, d3
  0084e4  601e                 bra.b     $8504
  0084e6  48780014             pea.l     $14.w
  0084ea  3043                 movea.w   d3, a0
  0084ec  2008                 move.l    a0, d0
  0084ee  e788                 lsl.l     #$3, d0
  0084f0  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0084f6  d1c0                 adda.l    d0, a0
  0084f8  4850                 pea.l     (a0)
  0084fa  4eb900000aa0         jsr       $aa0.l   ; ExpandRect
  008500  5243                 addq.w    #$1, d3
  008502  504f                 addq.w    #$8, a7
  008504  3003                 move.w    d3, d0
  008506  48c0                 ext.l     d0
  008508  b0b900013c80         cmp.l     $13c80.l, d0   ; g_13c80
  00850e  6dd6                 blt.b     $84e6
  008510  261f                 move.l    (a7)+, d3
  008512  4e5e                 unlk      a6
  008514  4e75                 rts       

;-------------------------------------------------------------
; DrawDirtyRects   (seg 1 +00852a, 882 bytes)
  00852a  4e56fff0             link.w    a6, #$fff0
  00852e  48e71f00             movem.l   d3-d7, -(a7)
  008532  303900006aae         move.w    $6aae.l, d0   ; g_6aae
  008538  48c0                 ext.l     d0
  00853a  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  008542  3601                 move.w    d1, d3
  008544  303900006aac         move.w    $6aac.l, d0   ; g_6aac
  00854a  48c0                 ext.l     d0
  00854c  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  008554  3601                 move.w    d1, d3
  008556  7a00                 moveq     #$0, d5
  008558  6000032c             bra.w     $8886
  00855c  7c01                 moveq     #$1, d6
  00855e  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  008564  30305602             move.w    $2(a0, d5.w * 8), d0
  008568  48c0                 ext.l     d0
  00856a  7210                 moveq     #$10, d1
  00856c  d081                 add.l     d1, d0
  00856e  32390000806a         move.w    $806a.l, d1   ; viewLeft
  008574  48c1                 ext.l     d1
  008576  9081                 sub.l     d1, d0
  008578  3d40fffa             move.w    d0, -$6(a6)
  00857c  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  008582  30305600             move.w    (a0, d5.w * 8), d0
  008586  48c0                 ext.l     d0
  008588  7210                 moveq     #$10, d1
  00858a  d081                 add.l     d1, d0
  00858c  323900008068         move.w    $8068.l, d1   ; viewTop
  008592  48c1                 ext.l     d1
  008594  9081                 sub.l     d1, d0
  008596  3d40fff8             move.w    d0, -$8(a6)
  00859a  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085a0  3d705602fffe         move.w    $2(a0, d5.w * 8), -$2(a6)
  0085a6  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085ac  3d705600fffc         move.w    (a0, d5.w * 8), -$4(a6)
  0085b2  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085b8  30305602             move.w    $2(a0, d5.w * 8), d0
  0085bc  48c0                 ext.l     d0
  0085be  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085c4  36305606             move.w    $6(a0, d5.w * 8), d3
  0085c8  48c3                 ext.l     d3
  0085ca  9680                 sub.l     d0, d3
  0085cc  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085d2  30305600             move.w    (a0, d5.w * 8), d0
  0085d6  48c0                 ext.l     d0
  0085d8  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0085de  38305604             move.w    $4(a0, d5.w * 8), d4
  0085e2  48c4                 ext.l     d4
  0085e4  9880                 sub.l     d0, d4
  0085e6  303900006ab2         move.w    $6ab2.l, d0   ; g_6ab2
  0085ec  48c0                 ext.l     d0
  0085ee  3203                 move.w    d3, d1
  0085f0  48c1                 ext.l     d1
  0085f2  342efffe             move.w    -$2(a6), d2
  0085f6  48c2                 ext.l     d2
  0085f8  d481                 add.l     d1, d2
  0085fa  b480                 cmp.l     d0, d2
  0085fc  6c02                 bge.b     $8600
  0085fe  7c00                 moveq     #$0, d6
  008600  303900006ab0         move.w    $6ab0.l, d0   ; g_6ab0
  008606  48c0                 ext.l     d0
  008608  3204                 move.w    d4, d1
  00860a  48c1                 ext.l     d1
  00860c  342efffc             move.w    -$4(a6), d2
  008610  48c2                 ext.l     d2
  008612  d481                 add.l     d1, d2
  008614  b480                 cmp.l     d0, d2
  008616  6c02                 bge.b     $861a
  008618  7c00                 moveq     #$0, d6
  00861a  303900006ab2         move.w    $6ab2.l, d0   ; g_6ab2
  008620  48c0                 ext.l     d0
  008622  0680000001c0         addi.l    #$1c0, d0
  008628  322efffe             move.w    -$2(a6), d1
  00862c  48c1                 ext.l     d1
  00862e  b280                 cmp.l     d0, d1
  008630  6f02                 ble.b     $8634
  008632  7c00                 moveq     #$0, d6
  008634  303900006ab0         move.w    $6ab0.l, d0   ; g_6ab0
  00863a  48c0                 ext.l     d0
  00863c  0680000001c0         addi.l    #$1c0, d0
  008642  322efffc             move.w    -$4(a6), d1
  008646  48c1                 ext.l     d1
  008648  b280                 cmp.l     d0, d1
  00864a  6f02                 ble.b     $864e
  00864c  7c00                 moveq     #$0, d6
  00864e  4a06                 tst.b     d6
  008650  67000232             beq.w     $8884
  008654  303900006ab0         move.w    $6ab0.l, d0   ; g_6ab0
  00865a  48c0                 ext.l     d0
  00865c  0680000001c0         addi.l    #$1c0, d0
  008662  3204                 move.w    d4, d1
  008664  48c1                 ext.l     d1
  008666  342efffc             move.w    -$4(a6), d2
  00866a  48c2                 ext.l     d2
  00866c  d481                 add.l     d1, d2
  00866e  b480                 cmp.l     d0, d2
  008670  6f16                 ble.b     $8688
  008672  302efffc             move.w    -$4(a6), d0
  008676  48c0                 ext.l     d0
  008678  383900006ab0         move.w    $6ab0.l, d4   ; g_6ab0
  00867e  48c4                 ext.l     d4
  008680  0684000001c0         addi.l    #$1c0, d4
  008686  9880                 sub.l     d0, d4
  008688  303900006ab2         move.w    $6ab2.l, d0   ; g_6ab2
  00868e  48c0                 ext.l     d0
  008690  0680000001e0         addi.l    #$1e0, d0
  008696  3203                 move.w    d3, d1
  008698  48c1                 ext.l     d1
  00869a  342efffe             move.w    -$2(a6), d2
  00869e  48c2                 ext.l     d2
  0086a0  d481                 add.l     d1, d2
  0086a2  b480                 cmp.l     d0, d2
  0086a4  6f16                 ble.b     $86bc
  0086a6  302efffe             move.w    -$2(a6), d0
  0086aa  48c0                 ext.l     d0
  0086ac  363900006ab2         move.w    $6ab2.l, d3   ; g_6ab2
  0086b2  48c3                 ext.l     d3
  0086b4  0683000001e0         addi.l    #$1e0, d3
  0086ba  9680                 sub.l     d0, d3
  0086bc  302efffe             move.w    -$2(a6), d0
  0086c0  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  0086c6  6c3c                 bge.b     $8704
  0086c8  302efffe             move.w    -$2(a6), d0
  0086cc  48c0                 ext.l     d0
  0086ce  323900006ab2         move.w    $6ab2.l, d1   ; g_6ab2
  0086d4  48c1                 ext.l     d1
  0086d6  9280                 sub.l     d0, d1
  0086d8  3003                 move.w    d3, d0
  0086da  48c0                 ext.l     d0
  0086dc  9081                 sub.l     d1, d0
  0086de  3600                 move.w    d0, d3
  0086e0  302efffe             move.w    -$2(a6), d0
  0086e4  48c0                 ext.l     d0
  0086e6  323900006ab2         move.w    $6ab2.l, d1   ; g_6ab2
  0086ec  48c1                 ext.l     d1
  0086ee  9280                 sub.l     d0, d1
  0086f0  302efffa             move.w    -$6(a6), d0
  0086f4  48c0                 ext.l     d0
  0086f6  d081                 add.l     d1, d0
  0086f8  3d40fffa             move.w    d0, -$6(a6)
  0086fc  3d7900006ab2fffe     move.w    $6ab2.l, -$2(a6)   ; g_6ab2
  008704  302efffc             move.w    -$4(a6), d0
  008708  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  00870e  6c3c                 bge.b     $874c
  008710  302efffc             move.w    -$4(a6), d0
  008714  48c0                 ext.l     d0
  008716  323900006ab0         move.w    $6ab0.l, d1   ; g_6ab0
  00871c  48c1                 ext.l     d1
  00871e  9280                 sub.l     d0, d1
  008720  3004                 move.w    d4, d0
  008722  48c0                 ext.l     d0
  008724  9081                 sub.l     d1, d0
  008726  3800                 move.w    d0, d4
  008728  302efffc             move.w    -$4(a6), d0
  00872c  48c0                 ext.l     d0
  00872e  323900006ab0         move.w    $6ab0.l, d1   ; g_6ab0
  008734  48c1                 ext.l     d1
  008736  9280                 sub.l     d0, d1
  008738  302efff8             move.w    -$8(a6), d0
  00873c  48c0                 ext.l     d0
  00873e  d081                 add.l     d1, d0
  008740  3d40fff8             move.w    d0, -$8(a6)
  008744  3d7900006ab0fffc     move.w    $6ab0.l, -$4(a6)   ; g_6ab0
  00874c  3c03                 move.w    d3, d6
  00874e  3e04                 move.w    d4, d7
  008750  302efffe             move.w    -$2(a6), d0
  008754  48c0                 ext.l     d0
  008756  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  00875e  3d41fffe             move.w    d1, -$2(a6)
  008762  302efffc             move.w    -$4(a6), d0
  008766  48c0                 ext.l     d0
  008768  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  008770  3d41fffc             move.w    d1, -$4(a6)
  008774  486efff0             pea.l     -$10(a6)
  008778  4eb9000009f0         jsr       $9f0.l   ; GETSCALEPORT
  00877e  3d6efffefff6         move.w    -$2(a6), -$a(a6)
  008784  3d6efffcfff4         move.w    -$4(a6), -$c(a6)
  00878a  4eb9000009e0         jsr       $9e0.l   ; DEBUGHOOK
  008790  4879ffffe7ee         pea.l     $ffffe7ee.l   ; g_-1812
  008796  2f2efff8             move.l    -$8(a6), -(a7)
  00879a  2f2efffc             move.l    -$4(a6), -(a7)
  00879e  3f03                 move.w    d3, -(a7)
  0087a0  3f04                 move.w    d4, -(a7)
  0087a2  4eb9000009d8         jsr       $9d8.l   ; COPYDIRTYRECT
  0087a8  302efffc             move.w    -$4(a6), d0
  0087ac  48c0                 ext.l     d0
  0087ae  0680fffffe20         addi.l    #$fffffe20, d0
  0087b4  3d40fffc             move.w    d0, -$4(a6)
  0087b8  3004                 move.w    d4, d0
  0087ba  48c0                 ext.l     d0
  0087bc  322efffc             move.w    -$4(a6), d1
  0087c0  48c1                 ext.l     d1
  0087c2  d280                 add.l     d0, d1
  0087c4  4a81                 tst.l     d1
  0087c6  6f18                 ble.b     $87e0
  0087c8  4879ffffe7ee         pea.l     $ffffe7ee.l   ; g_-1812
  0087ce  2f2efff8             move.l    -$8(a6), -(a7)
  0087d2  2f2efffc             move.l    -$4(a6), -(a7)
  0087d6  3f03                 move.w    d3, -(a7)
  0087d8  3f04                 move.w    d4, -(a7)
  0087da  4eb9000009d8         jsr       $9d8.l   ; COPYDIRTYRECT
  0087e0  302efffc             move.w    -$4(a6), d0
  0087e4  48c0                 ext.l     d0
  0087e6  0680000001e0         addi.l    #$1e0, d0
  0087ec  3d40fffc             move.w    d0, -$4(a6)
  0087f0  3807                 move.w    d7, d4
  0087f2  3606                 move.w    d6, d3
  0087f4  302efffe             move.w    -$2(a6), d0
  0087f8  48c0                 ext.l     d0
  0087fa  0680fffffe20         addi.l    #$fffffe20, d0
  008800  3d40fffe             move.w    d0, -$2(a6)
  008804  3003                 move.w    d3, d0
  008806  48c0                 ext.l     d0
  008808  322efffe             move.w    -$2(a6), d1
  00880c  48c1                 ext.l     d1
  00880e  d280                 add.l     d0, d1
  008810  4a81                 tst.l     d1
  008812  6f18                 ble.b     $882c
  008814  4879ffffe7ee         pea.l     $ffffe7ee.l   ; g_-1812
  00881a  2f2efff8             move.l    -$8(a6), -(a7)
  00881e  2f2efffc             move.l    -$4(a6), -(a7)
  008822  3f03                 move.w    d3, -(a7)
  008824  3f04                 move.w    d4, -(a7)
  008826  4eb9000009d8         jsr       $9d8.l   ; COPYDIRTYRECT
  00882c  3807                 move.w    d7, d4
  00882e  3606                 move.w    d6, d3
  008830  302efffc             move.w    -$4(a6), d0
  008834  48c0                 ext.l     d0
  008836  0680fffffe20         addi.l    #$fffffe20, d0
  00883c  3d40fffc             move.w    d0, -$4(a6)
  008840  3003                 move.w    d3, d0
  008842  48c0                 ext.l     d0
  008844  322efffe             move.w    -$2(a6), d1
  008848  48c1                 ext.l     d1
  00884a  d280                 add.l     d0, d1
  00884c  4a81                 tst.l     d1
  00884e  6f28                 ble.b     $8878
  008850  3004                 move.w    d4, d0
  008852  48c0                 ext.l     d0
  008854  322efffc             move.w    -$4(a6), d1
  008858  48c1                 ext.l     d1
  00885a  d280                 add.l     d0, d1
  00885c  4a81                 tst.l     d1
  00885e  6f18                 ble.b     $8878
  008860  4879ffffe7ee         pea.l     $ffffe7ee.l   ; g_-1812
  008866  2f2efff8             move.l    -$8(a6), -(a7)
  00886a  2f2efffc             move.l    -$4(a6), -(a7)
  00886e  3f03                 move.w    d3, -(a7)
  008870  3f04                 move.w    d4, -(a7)
  008872  4eb9000009d8         jsr       $9d8.l   ; COPYDIRTYRECT
  008878  426efffe             clr.w     -$2(a6)
  00887c  426efffc             clr.w     -$4(a6)
  008880  3807                 move.w    d7, d4
  008882  3606                 move.w    d6, d3
  008884  5245                 addq.w    #$1, d5
  008886  3005                 move.w    d5, d0
  008888  48c0                 ext.l     d0
  00888a  b0b900013c80         cmp.l     $13c80.l, d0   ; g_13c80
  008890  6d00fcca             blt.w     $855c
  008894  4cdf00f8             movem.l   (a7)+, d3-d7
  008898  4e5e                 unlk      a6
  00889a  4e75                 rts       

;-------------------------------------------------------------
; DrawSpritesBehindTiles   (seg 1 +0088ae, 736 bytes)
  0088ae  4e56ffdc             link.w    a6, #$ffdc
  0088b2  2f03                 move.l    d3, -(a7)
  0088b4  2d7900018658fff8     move.l    $18658.l, -$8(a6)   ; g_18658
  0088bc  2d790000503cfff0     move.l    $503c.l, -$10(a6)   ; g_503c
  0088c4  2d7900005040fff4     move.l    $5040.l, -$c(a6)   ; g_5040
  0088cc  3d7c0010ffde         move.w    #$10, -$22(a6)
  0088d2  3d7c0010ffdc         move.w    #$10, -$24(a6)
  0088d8  3d7c01d0ffe2         move.w    #$1d0, -$1e(a6)
  0088de  3d7c01d0ffe0         move.w    #$1d0, -$20(a6)
  0088e4  2d79ffffe866fffc     move.l    $ffffe866.l, -$4(a6)   ; g_-179a
  0088ec  30390000806a         move.w    $806a.l, d0   ; viewLeft
  0088f2  d16efff2             add.w     d0, -$e(a6)
  0088f6  303900008068         move.w    $8068.l, d0   ; viewTop
  0088fc  d16efff0             add.w     d0, -$10(a6)
  008900  30390000806a         move.w    $806a.l, d0   ; viewLeft
  008906  d16efff6             add.w     d0, -$a(a6)
  00890a  303900008068         move.w    $8068.l, d0   ; viewTop
  008910  d16efff4             add.w     d0, -$c(a6)
  008914  7600                 moveq     #$0, d3
  008916  60000084             bra.w     $899c
  00891a  700c                 moveq     #$c, d0
  00891c  c1c3                 muls.w    d3, d0
  00891e  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  008924  4a300800             tst.b     (a0, d0.l)
  008928  676e                 beq.b     $8998
  00892a  554f                 subq.w    #$2, a7
  00892c  700c                 moveq     #$c, d0
  00892e  c1c3                 muls.w    d3, d0
  008930  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  008936  2f300802             move.l    $2(a0, d0.l), -(a7)
  00893a  486efff0             pea.l     -$10(a6)
  00893e  a8ad                 _PtInRect 
  008940  101f                 move.b    (a7)+, d0
  008942  6756                 beq.b     $899a
  008944  700c                 moveq     #$c, d0
  008946  c1c3                 muls.w    d3, d0
  008948  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  00894e  2f300808             move.l    $8(a0, d0.l), -(a7)
  008952  42a7                 clr.l     -(a7)
  008954  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  00895a  2f2efff8             move.l    -$8(a6), -(a7)
  00895e  700c                 moveq     #$c, d0
  008960  c1c3                 muls.w    d3, d0
  008962  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  008968  2f300802             move.l    $2(a0, d0.l), -(a7)
  00896c  700c                 moveq     #$c, d0
  00896e  c1c3                 muls.w    d3, d0
  008970  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  008976  20700808             movea.l   $8(a0, d0.l), a0
  00897a  3f280006             move.w    $6(a0), -(a7)
  00897e  700c                 moveq     #$c, d0
  008980  c1c3                 muls.w    d3, d0
  008982  41f900013c94         lea.l     $13c94.l, a0   ; g_13c94
  008988  20700808             movea.l   $8(a0, d0.l), a0
  00898c  3f280004             move.w    $4(a0), -(a7)
  008990  61fffffff5b6         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008996  6002                 bra.b     $899a
  008998  7640                 moveq     #$40, d3
  00899a  5243                 addq.w    #$1, d3
  00899c  0c430040             cmpi.w    #$40, d3
  0089a0  6d00ff78             blt.w     $891a
  0089a4  6000014a             bra.w     $8af0
  0089a8  206efffc             movea.l   -$4(a6), a0
  0089ac  4aa8001a             tst.l     $1a(a0)
  0089b0  67000134             beq.w     $8ae6
  0089b4  206efffc             movea.l   -$4(a6), a0
  0089b8  4aa8007e             tst.l     $7e(a0)
  0089bc  67000128             beq.w     $8ae6
  0089c0  206efffc             movea.l   -$4(a6), a0
  0089c4  4a28008b             tst.b     $8b(a0)
  0089c8  6700011c             beq.w     $8ae6
  0089cc  554f                 subq.w    #$2, a7
  0089ce  206efffc             movea.l   -$4(a6), a0
  0089d2  2f28005a             move.l    $5a(a0), -(a7)
  0089d6  486efff0             pea.l     -$10(a6)
  0089da  a8ad                 _PtInRect 
  0089dc  101f                 move.b    (a7)+, d0
  0089de  67000106             beq.w     $8ae6
  0089e2  206efffc             movea.l   -$4(a6), a0
  0089e6  0c6801000052         cmpi.w    #$100, $52(a0)
  0089ec  664c                 bne.b     $8a3a
  0089ee  206efffc             movea.l   -$4(a6), a0
  0089f2  0c6801000054         cmpi.w    #$100, $54(a0)
  0089f8  6640                 bne.b     $8a3a
  0089fa  206efffc             movea.l   -$4(a6), a0
  0089fe  2f28007e             move.l    $7e(a0), -(a7)
  008a02  2f2efffc             move.l    -$4(a6), -(a7)
  008a06  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008a0c  2f2efff8             move.l    -$8(a6), -(a7)
  008a10  206efffc             movea.l   -$4(a6), a0
  008a14  2f28005a             move.l    $5a(a0), -(a7)
  008a18  206efffc             movea.l   -$4(a6), a0
  008a1c  2068007e             movea.l   $7e(a0), a0
  008a20  3f280006             move.w    $6(a0), -(a7)
  008a24  206efffc             movea.l   -$4(a6), a0
  008a28  2068007e             movea.l   $7e(a0), a0
  008a2c  3f280004             move.w    $4(a0), -(a7)
  008a30  61fffffff516         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008a36  600000ae             bra.w     $8ae6
  008a3a  486effe4             pea.l     -$1c(a6)
  008a3e  486effec             pea.l     -$14(a6)
  008a42  206efffc             movea.l   -$4(a6), a0
  008a46  3f280054             move.w    $54(a0), -(a7)
  008a4a  206efffc             movea.l   -$4(a6), a0
  008a4e  3f280052             move.w    $52(a0), -(a7)
  008a52  206efffc             movea.l   -$4(a6), a0
  008a56  2f28007e             move.l    $7e(a0), -(a7)
  008a5a  206efffc             movea.l   -$4(a6), a0
  008a5e  2f28005a             move.l    $5a(a0), -(a7)
  008a62  61fffffff430         bsr.l     $7e94   ; FindScaledPosAndBounds
  008a68  206efffc             movea.l   -$4(a6), a0
  008a6c  0c6801000052         cmpi.w    #$100, $52(a0)
  008a72  4fef0014             lea.l     $14(a7), a7
  008a76  6e0c                 bgt.b     $8a84
  008a78  206efffc             movea.l   -$4(a6), a0
  008a7c  0c6801000054         cmpi.w    #$100, $54(a0)
  008a82  6f2a                 ble.b     $8aae
  008a84  206efffc             movea.l   -$4(a6), a0
  008a88  2f28007e             move.l    $7e(a0), -(a7)
  008a8c  2f2efffc             move.l    -$4(a6), -(a7)
  008a90  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008a96  2f2efff8             move.l    -$8(a6), -(a7)
  008a9a  2f2effec             move.l    -$14(a6), -(a7)
  008a9e  3f2effea             move.w    -$16(a6), -(a7)
  008aa2  3f2effe8             move.w    -$18(a6), -(a7)
  008aa6  61fffffff4a0         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008aac  6038                 bra.b     $8ae6
  008aae  206efffc             movea.l   -$4(a6), a0
  008ab2  2f28007e             move.l    $7e(a0), -(a7)
  008ab6  2f2efffc             move.l    -$4(a6), -(a7)
  008aba  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008ac0  2f2efff8             move.l    -$8(a6), -(a7)
  008ac4  2f2effec             move.l    -$14(a6), -(a7)
  008ac8  206efffc             movea.l   -$4(a6), a0
  008acc  2068007e             movea.l   $7e(a0), a0
  008ad0  3f280006             move.w    $6(a0), -(a7)
  008ad4  206efffc             movea.l   -$4(a6), a0
  008ad8  2068007e             movea.l   $7e(a0), a0
  008adc  3f280004             move.w    $4(a0), -(a7)
  008ae0  61fffffff466         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008ae6  206efffc             movea.l   -$4(a6), a0
  008aea  2d68002efffc         move.l    $2e(a0), -$4(a6)
  008af0  4aaefffc             tst.l     -$4(a6)
  008af4  6600feb2             bne.w     $89a8
  008af8  7600                 moveq     #$0, d3
  008afa  60000084             bra.w     $8b80
  008afe  700c                 moveq     #$c, d0
  008b00  c1c3                 muls.w    d3, d0
  008b02  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b08  4a300800             tst.b     (a0, d0.l)
  008b0c  676e                 beq.b     $8b7c
  008b0e  554f                 subq.w    #$2, a7
  008b10  700c                 moveq     #$c, d0
  008b12  c1c3                 muls.w    d3, d0
  008b14  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b1a  2f300802             move.l    $2(a0, d0.l), -(a7)
  008b1e  486efff0             pea.l     -$10(a6)
  008b22  a8ad                 _PtInRect 
  008b24  101f                 move.b    (a7)+, d0
  008b26  6756                 beq.b     $8b7e
  008b28  700c                 moveq     #$c, d0
  008b2a  c1c3                 muls.w    d3, d0
  008b2c  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b32  2f300808             move.l    $8(a0, d0.l), -(a7)
  008b36  42a7                 clr.l     -(a7)
  008b38  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008b3e  2f2efff8             move.l    -$8(a6), -(a7)
  008b42  700c                 moveq     #$c, d0
  008b44  c1c3                 muls.w    d3, d0
  008b46  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b4c  2f300802             move.l    $2(a0, d0.l), -(a7)
  008b50  700c                 moveq     #$c, d0
  008b52  c1c3                 muls.w    d3, d0
  008b54  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b5a  20700808             movea.l   $8(a0, d0.l), a0
  008b5e  3f280006             move.w    $6(a0), -(a7)
  008b62  700c                 moveq     #$c, d0
  008b64  c1c3                 muls.w    d3, d0
  008b66  41f900013f94         lea.l     $13f94.l, a0   ; g_13f94
  008b6c  20700808             movea.l   $8(a0, d0.l), a0
  008b70  3f280004             move.w    $4(a0), -(a7)
  008b74  61fffffff3d2         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008b7a  6002                 bra.b     $8b7e
  008b7c  7640                 moveq     #$40, d3
  008b7e  5243                 addq.w    #$1, d3
  008b80  0c430040             cmpi.w    #$40, d3
  008b84  6d00ff78             blt.w     $8afe
  008b88  261f                 move.l    (a7)+, d3
  008b8a  4e5e                 unlk      a6
  008b8c  4e75                 rts       

;-------------------------------------------------------------
; DrawSpritesAboveTiles   (seg 1 +008ba8, 444 bytes)
  008ba8  4e56ffdc             link.w    a6, #$ffdc
  008bac  2d790001865cfff8     move.l    $1865c.l, -$8(a6)   ; g_1865c
  008bb4  2d7900005034ffe4     move.l    $5034.l, -$1c(a6)   ; g_5034
  008bbc  2d7900005038ffe8     move.l    $5038.l, -$18(a6)   ; g_5038
  008bc4  3d7c0010ffde         move.w    #$10, -$22(a6)
  008bca  3d7c0010ffdc         move.w    #$10, -$24(a6)
  008bd0  3d7c01d0ffe2         move.w    #$1d0, -$1e(a6)
  008bd6  3d7c01d0ffe0         move.w    #$1d0, -$20(a6)
  008bdc  2d79ffffe866fffc     move.l    $ffffe866.l, -$4(a6)   ; g_-179a
  008be4  30390000806a         move.w    $806a.l, d0   ; viewLeft
  008bea  d16effe6             add.w     d0, -$1a(a6)
  008bee  303900008068         move.w    $8068.l, d0   ; viewTop
  008bf4  d16effe4             add.w     d0, -$1c(a6)
  008bf8  30390000806a         move.w    $806a.l, d0   ; viewLeft
  008bfe  d16effea             add.w     d0, -$16(a6)
  008c02  303900008068         move.w    $8068.l, d0   ; viewTop
  008c08  d16effe8             add.w     d0, -$18(a6)
  008c0c  6000014a             bra.w     $8d58
  008c10  206efffc             movea.l   -$4(a6), a0
  008c14  4aa8001a             tst.l     $1a(a0)
  008c18  67000134             beq.w     $8d4e
  008c1c  206efffc             movea.l   -$4(a6), a0
  008c20  4aa8007e             tst.l     $7e(a0)
  008c24  67000128             beq.w     $8d4e
  008c28  206efffc             movea.l   -$4(a6), a0
  008c2c  4a28008b             tst.b     $8b(a0)
  008c30  6600011c             bne.w     $8d4e
  008c34  554f                 subq.w    #$2, a7
  008c36  206efffc             movea.l   -$4(a6), a0
  008c3a  2f28005a             move.l    $5a(a0), -(a7)
  008c3e  486effe4             pea.l     -$1c(a6)
  008c42  a8ad                 _PtInRect 
  008c44  101f                 move.b    (a7)+, d0
  008c46  67000106             beq.w     $8d4e
  008c4a  206efffc             movea.l   -$4(a6), a0
  008c4e  0c6801000052         cmpi.w    #$100, $52(a0)
  008c54  664c                 bne.b     $8ca2
  008c56  206efffc             movea.l   -$4(a6), a0
  008c5a  0c6801000054         cmpi.w    #$100, $54(a0)
  008c60  6640                 bne.b     $8ca2
  008c62  206efffc             movea.l   -$4(a6), a0
  008c66  2f28007e             move.l    $7e(a0), -(a7)
  008c6a  2f2efffc             move.l    -$4(a6), -(a7)
  008c6e  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008c74  2f2efff8             move.l    -$8(a6), -(a7)
  008c78  206efffc             movea.l   -$4(a6), a0
  008c7c  2f28005a             move.l    $5a(a0), -(a7)
  008c80  206efffc             movea.l   -$4(a6), a0
  008c84  2068007e             movea.l   $7e(a0), a0
  008c88  3f280006             move.w    $6(a0), -(a7)
  008c8c  206efffc             movea.l   -$4(a6), a0
  008c90  2068007e             movea.l   $7e(a0), a0
  008c94  3f280004             move.w    $4(a0), -(a7)
  008c98  61fffffff2ae         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008c9e  600000ae             bra.w     $8d4e
  008ca2  486effec             pea.l     -$14(a6)
  008ca6  486efff4             pea.l     -$c(a6)
  008caa  206efffc             movea.l   -$4(a6), a0
  008cae  3f280054             move.w    $54(a0), -(a7)
  008cb2  206efffc             movea.l   -$4(a6), a0
  008cb6  3f280052             move.w    $52(a0), -(a7)
  008cba  206efffc             movea.l   -$4(a6), a0
  008cbe  2f28007e             move.l    $7e(a0), -(a7)
  008cc2  206efffc             movea.l   -$4(a6), a0
  008cc6  2f28005a             move.l    $5a(a0), -(a7)
  008cca  61fffffff1c8         bsr.l     $7e94   ; FindScaledPosAndBounds
  008cd0  206efffc             movea.l   -$4(a6), a0
  008cd4  0c6801000052         cmpi.w    #$100, $52(a0)
  008cda  4fef0014             lea.l     $14(a7), a7
  008cde  6e0c                 bgt.b     $8cec
  008ce0  206efffc             movea.l   -$4(a6), a0
  008ce4  0c6801000054         cmpi.w    #$100, $54(a0)
  008cea  6f2a                 ble.b     $8d16
  008cec  206efffc             movea.l   -$4(a6), a0
  008cf0  2f28007e             move.l    $7e(a0), -(a7)
  008cf4  2f2efffc             move.l    -$4(a6), -(a7)
  008cf8  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008cfe  2f2efff8             move.l    -$8(a6), -(a7)
  008d02  2f2efff4             move.l    -$c(a6), -(a7)
  008d06  3f2efff2             move.w    -$e(a6), -(a7)
  008d0a  3f2efff0             move.w    -$10(a6), -(a7)
  008d0e  61fffffff238         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008d14  6038                 bra.b     $8d4e
  008d16  206efffc             movea.l   -$4(a6), a0
  008d1a  2f28007e             move.l    $7e(a0), -(a7)
  008d1e  2f2efffc             move.l    -$4(a6), -(a7)
  008d22  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008d28  2f2efff8             move.l    -$8(a6), -(a7)
  008d2c  2f2efff4             move.l    -$c(a6), -(a7)
  008d30  206efffc             movea.l   -$4(a6), a0
  008d34  2068007e             movea.l   $7e(a0), a0
  008d38  3f280006             move.w    $6(a0), -(a7)
  008d3c  206efffc             movea.l   -$4(a6), a0
  008d40  2068007e             movea.l   $7e(a0), a0
  008d44  3f280004             move.w    $4(a0), -(a7)
  008d48  61fffffff1fe         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008d4e  206efffc             movea.l   -$4(a6), a0
  008d52  2d68002efffc         move.l    $2e(a0), -$4(a6)
  008d58  4aaefffc             tst.l     -$4(a6)
  008d5c  6600feb2             bne.w     $8c10
  008d60  4e5e                 unlk      a6
  008d62  4e75                 rts       

;-------------------------------------------------------------
; RedrawFGTiles   (seg 1 +008d7c, 326 bytes)
  008d7c  4e56fff8             link.w    a6, #$fff8
  008d80  48e71e20             movem.l   d3-d6/a2, -(a7)
  008d84  2d7900018660fffc     move.l    $18660.l, -$4(a6)   ; g_18660
  008d8c  7600                 moveq     #$0, d3
  008d8e  60000120             bra.w     $8eb0
  008d92  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008d98  30303400             move.w    (a0, d3.w * 4), d0
  008d9c  48c0                 ext.l     d0
  008d9e  ea80                 asr.l     #$5, d0
  008da0  d080                 add.l     d0, d0
  008da2  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008da8  32303402             move.w    $2(a0, d3.w * 4), d1
  008dac  48c1                 ext.l     d1
  008dae  ea81                 asr.l     #$5, d1
  008db0  e189                 lsl.l     #$8, d1
  008db2  20790000746c         movea.l   $746c.l, a0   ; hLevel
  008db8  2050                 movea.l   (a0), a0
  008dba  d1c1                 adda.l    d1, a0
  008dbc  d1c0                 adda.l    d0, a0
  008dbe  203c00008000         move.l    #$8000, d0
  008dc4  0c70ffff0800         cmpi.w    #$ffff, (a0, d0.l)
  008dca  6f0000e2             ble.w     $8eae
  008dce  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008dd4  38303402             move.w    $2(a0, d3.w * 4), d4
  008dd8  48c4                 ext.l     d4
  008dda  ea84                 asr.l     #$5, d4
  008ddc  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008de2  3a303400             move.w    (a0, d3.w * 4), d5
  008de6  48c5                 ext.l     d5
  008de8  ea85                 asr.l     #$5, d5
  008dea  3445                 movea.w   d5, a2
  008dec  200a                 move.l    a2, d0
  008dee  d080                 add.l     d0, d0
  008df0  3444                 movea.w   d4, a2
  008df2  220a                 move.l    a2, d1
  008df4  e189                 lsl.l     #$8, d1
  008df6  24790000746c         movea.l   $746c.l, a2   ; hLevel
  008dfc  2452                 movea.l   (a2), a2
  008dfe  d5c1                 adda.l    d1, a2
  008e00  d5c0                 adda.l    d0, a2
  008e02  203c00008000         move.l    #$8000, d0
  008e08  721c                 moveq     #$1c, d1
  008e0a  c3f20800             muls.w    (a2, d0.l), d1
  008e0e  247900007e12         movea.l   $7e12.l, a2   ; fgTileFaces
  008e14  d5c1                 adda.l    d1, a2
  008e16  eb4c                 lsl.w     #$5, d4
  008e18  eb4d                 lsl.w     #$5, d5
  008e1a  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e20  3d703602fffa         move.w    $2(a0, d3.w * 8), -$6(a6)
  008e26  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e2c  3d703600fff8         move.w    (a0, d3.w * 8), -$8(a6)
  008e32  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e38  30303602             move.w    $2(a0, d3.w * 8), d0
  008e3c  48c0                 ext.l     d0
  008e3e  3204                 move.w    d4, d1
  008e40  48c1                 ext.l     d1
  008e42  9081                 sub.l     d1, d0
  008e44  3d40fffe             move.w    d0, -$2(a6)
  008e48  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e4e  30303600             move.w    (a0, d3.w * 8), d0
  008e52  48c0                 ext.l     d0
  008e54  3205                 move.w    d5, d1
  008e56  48c1                 ext.l     d1
  008e58  9081                 sub.l     d1, d0
  008e5a  3d40fffc             move.w    d0, -$4(a6)
  008e5e  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e64  3c303606             move.w    $6(a0, d3.w * 8), d6
  008e68  48c6                 ext.l     d6
  008e6a  3204                 move.w    d4, d1
  008e6c  48c1                 ext.l     d1
  008e6e  9c81                 sub.l     d1, d6
  008e70  322efffe             move.w    -$2(a6), d1
  008e74  48c1                 ext.l     d1
  008e76  9c81                 sub.l     d1, d6
  008e78  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008e7e  38303604             move.w    $4(a0, d3.w * 8), d4
  008e82  48c4                 ext.l     d4
  008e84  3205                 move.w    d5, d1
  008e86  48c1                 ext.l     d1
  008e88  9881                 sub.l     d1, d4
  008e8a  322efffc             move.w    -$4(a6), d1
  008e8e  48c1                 ext.l     d1
  008e90  9881                 sub.l     d1, d4
  008e92  2f0a                 move.l    a2, -(a7)
  008e94  42a7                 clr.l     -(a7)
  008e96  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  008e9c  2f2efffc             move.l    -$4(a6), -(a7)
  008ea0  2f2efff8             move.l    -$8(a6), -(a7)
  008ea4  3f06                 move.w    d6, -(a7)
  008ea6  3f04                 move.w    d4, -(a7)
  008ea8  61fffffff09e         bsr.l     $7f48   ; WRAPDRAWSPRITE
  008eae  5243                 addq.w    #$1, d3
  008eb0  b6790000fc10         cmp.w     $fc10.l, d3   ; g_fc10
  008eb6  6f00feda             ble.w     $8d92
  008eba  4cdf0478             movem.l   (a7)+, d3-d6/a2
  008ebe  4e5e                 unlk      a6
  008ec0  4e75                 rts       

;-------------------------------------------------------------
; AddFGRedraw   (seg 1 +008ed2, 134 bytes)
  008ed2  4e560000             link.w    a6, #$0
  008ed6  226e000c             movea.l   $c(a6), a1
  008eda  0c7900640000fc10     cmpi.w    #$64, $fc10.l   ; g_fc10
  008ee2  6c70                 bge.b     $8f54
  008ee4  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008eea  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008ef0  31ae000a0402         move.w    $a(a6), $2(a0, d0.w * 4)
  008ef6  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  008efc  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008f02  31ae00080400         move.w    $8(a6), (a0, d0.w * 4)
  008f08  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008f0e  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008f14  31a900020602         move.w    $2(a1), $2(a0, d0.w * 8)
  008f1a  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008f20  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008f26  31910600             move.w    (a1), (a0, d0.w * 8)
  008f2a  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008f30  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008f36  31a900060606         move.w    $6(a1), $6(a0, d0.w * 8)
  008f3c  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  008f42  30390000fc10         move.w    $fc10.l, d0   ; g_fc10
  008f48  31a900040604         move.w    $4(a1), $4(a0, d0.w * 8)
  008f4e  52790000fc10         addq.w    #$1, $fc10.l   ; g_fc10
  008f54  4e5e                 unlk      a6
  008f56  4e75                 rts       

;-------------------------------------------------------------
; AlignRect   (seg 1 +008f66, 44 bytes)
  008f66  4e560000             link.w    a6, #$0
  008f6a  206e0008             movea.l   $8(a6), a0
  008f6e  30280002             move.w    $2(a0), d0
  008f72  02800000fffc         andi.l    #$fffc, d0
  008f78  31400002             move.w    d0, $2(a0)
  008f7c  30280006             move.w    $6(a0), d0
  008f80  48c0                 ext.l     d0
  008f82  5680                 addq.l    #$3, d0
  008f84  02800000fffc         andi.l    #$fffc, d0
  008f8a  31400006             move.w    d0, $6(a0)
  008f8e  4e5e                 unlk      a6
  008f90  4e75                 rts       

;-------------------------------------------------------------
; AddRectToUpdate   (seg 1 +008f9e, 754 bytes)
  008f9e  4e56ffe4             link.w    a6, #$ffe4
  008fa2  48e71e00             movem.l   d3-d6, -(a7)
  008fa6  206e0008             movea.l   $8(a6), a0
  008faa  2d50fff8             move.l    (a0), -$8(a6)
  008fae  2d680004fffc         move.l    $4(a0), -$4(a6)
  008fb4  486efff8             pea.l     -$8(a6)
  008fb8  61ffffffffac         bsr.l     $8f66   ; AlignRect
  008fbe  7600                 moveq     #$0, d3
  008fc0  584f                 addq.w    #$4, a7
  008fc2  6000015c             bra.w     $9120
  008fc6  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  008fcc  302efffa             move.w    -$6(a6), d0
  008fd0  b0703e02             cmp.w     $2(a0, d3.l * 8), d0
  008fd4  6c18                 bge.b     $8fee
  008fd6  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  008fdc  302efffe             move.w    -$2(a6), d0
  008fe0  b0703e02             cmp.w     $2(a0, d3.l * 8), d0
  008fe4  6d04                 blt.b     $8fea
  008fe6  7801                 moveq     #$1, d4
  008fe8  601a                 bra.b     $9004
  008fea  7800                 moveq     #$0, d4
  008fec  6016                 bra.b     $9004
  008fee  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  008ff4  30303e06             move.w    $6(a0, d3.l * 8), d0
  008ff8  b06efffa             cmp.w     -$6(a6), d0
  008ffc  6d04                 blt.b     $9002
  008ffe  7801                 moveq     #$1, d4
  009000  6002                 bra.b     $9004
  009002  7800                 moveq     #$0, d4
  009004  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00900a  302efff8             move.w    -$8(a6), d0
  00900e  b0703e00             cmp.w     (a0, d3.l * 8), d0
  009012  6c18                 bge.b     $902c
  009014  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00901a  302efffc             move.w    -$4(a6), d0
  00901e  b0703e00             cmp.w     (a0, d3.l * 8), d0
  009022  6d04                 blt.b     $9028
  009024  7a01                 moveq     #$1, d5
  009026  601a                 bra.b     $9042
  009028  7a00                 moveq     #$0, d5
  00902a  6016                 bra.b     $9042
  00902c  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009032  30303e04             move.w    $4(a0, d3.l * 8), d0
  009036  b06efff8             cmp.w     -$8(a6), d0
  00903a  6d04                 blt.b     $9040
  00903c  7a01                 moveq     #$1, d5
  00903e  6002                 bra.b     $9042
  009040  7a00                 moveq     #$0, d5
  009042  4a05                 tst.b     d5
  009044  670000d8             beq.w     $911e
  009048  4a04                 tst.b     d4
  00904a  670000d2             beq.w     $911e
  00904e  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009054  302efffa             move.w    -$6(a6), d0
  009058  b0703e02             cmp.w     $2(a0, d3.l * 8), d0
  00905c  6c06                 bge.b     $9064
  00905e  302efffa             move.w    -$6(a6), d0
  009062  600a                 bra.b     $906e
  009064  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00906a  30303e02             move.w    $2(a0, d3.l * 8), d0
  00906e  3d40fffa             move.w    d0, -$6(a6)
  009072  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009078  302efff8             move.w    -$8(a6), d0
  00907c  b0703e00             cmp.w     (a0, d3.l * 8), d0
  009080  6c06                 bge.b     $9088
  009082  302efff8             move.w    -$8(a6), d0
  009086  600a                 bra.b     $9092
  009088  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00908e  30303e00             move.w    (a0, d3.l * 8), d0
  009092  3d40fff8             move.w    d0, -$8(a6)
  009096  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00909c  302efffe             move.w    -$2(a6), d0
  0090a0  b0703e06             cmp.w     $6(a0, d3.l * 8), d0
  0090a4  6f06                 ble.b     $90ac
  0090a6  302efffe             move.w    -$2(a6), d0
  0090aa  600a                 bra.b     $90b6
  0090ac  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0090b2  30303e06             move.w    $6(a0, d3.l * 8), d0
  0090b6  3d40fffe             move.w    d0, -$2(a6)
  0090ba  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0090c0  302efffc             move.w    -$4(a6), d0
  0090c4  b0703e04             cmp.w     $4(a0, d3.l * 8), d0
  0090c8  6f06                 ble.b     $90d0
  0090ca  302efffc             move.w    -$4(a6), d0
  0090ce  600a                 bra.b     $90da
  0090d0  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0090d6  30303e04             move.w    $4(a0, d3.l * 8), d0
  0090da  3d40fffc             move.w    d0, -$4(a6)
  0090de  53b900013c80         subq.l    #$1, $13c80.l   ; g_13c80
  0090e4  6020                 bra.b     $9106
  0090e6  2003                 move.l    d3, d0
  0090e8  5280                 addq.l    #$1, d0
  0090ea  e788                 lsl.l     #$3, d0
  0090ec  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0090f2  d1c0                 adda.l    d0, a0
  0090f4  2003                 move.l    d3, d0
  0090f6  e788                 lsl.l     #$3, d0
  0090f8  43f900013c30         lea.l     $13c30.l, a1   ; g_13c30
  0090fe  d3c0                 adda.l    d0, a1
  009100  22d8                 move.l    (a0)+, (a1)+
  009102  22d8                 move.l    (a0)+, (a1)+
  009104  5283                 addq.l    #$1, d3
  009106  b6b900013c80         cmp.l     $13c80.l, d3   ; g_13c80
  00910c  65d8                 bcs.b     $90e6
  00910e  486efff8             pea.l     -$8(a6)
  009112  61fffffffe8a         bsr.l     $8f9e   ; AddRectToUpdate
  009118  584f                 addq.w    #$4, a7
  00911a  6000016c             bra.w     $9288
  00911e  5283                 addq.l    #$1, d3
  009120  b6b900013c80         cmp.l     $13c80.l, d3   ; g_13c80
  009126  6500fe9e             bcs.w     $8fc6
  00912a  700a                 moveq     #$a, d0
  00912c  b0b900013c80         cmp.l     $13c80.l, d0   ; g_13c80
  009132  6f24                 ble.b     $9158
  009134  203900013c80         move.l    $13c80.l, d0   ; g_13c80
  00913a  e788                 lsl.l     #$3, d0
  00913c  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009142  d1c0                 adda.l    d0, a0
  009144  20aefff8             move.l    -$8(a6), (a0)
  009148  216efffc0004         move.l    -$4(a6), $4(a0)
  00914e  52b900013c80         addq.l    #$1, $13c80.l   ; g_13c80
  009154  60000132             bra.w     $9288
  009158  7c00                 moveq     #$0, d6
  00915a  7aff                 moveq     #$ff, d5
  00915c  7600                 moveq     #$0, d3
  00915e  60000108             bra.w     $9268
  009162  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009168  302efffa             move.w    -$6(a6), d0
  00916c  b0703e02             cmp.w     $2(a0, d3.l * 8), d0
  009170  6c06                 bge.b     $9178
  009172  302efffa             move.w    -$6(a6), d0
  009176  600a                 bra.b     $9182
  009178  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00917e  30303e02             move.w    $2(a0, d3.l * 8), d0
  009182  3d40fff2             move.w    d0, -$e(a6)
  009186  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00918c  302efff8             move.w    -$8(a6), d0
  009190  b0703e00             cmp.w     (a0, d3.l * 8), d0
  009194  6c06                 bge.b     $919c
  009196  302efff8             move.w    -$8(a6), d0
  00919a  600a                 bra.b     $91a6
  00919c  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091a2  30303e00             move.w    (a0, d3.l * 8), d0
  0091a6  3d40fff0             move.w    d0, -$10(a6)
  0091aa  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091b0  302efffe             move.w    -$2(a6), d0
  0091b4  b0703e06             cmp.w     $6(a0, d3.l * 8), d0
  0091b8  6f06                 ble.b     $91c0
  0091ba  302efffe             move.w    -$2(a6), d0
  0091be  600a                 bra.b     $91ca
  0091c0  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091c6  30303e06             move.w    $6(a0, d3.l * 8), d0
  0091ca  3d40fff6             move.w    d0, -$a(a6)
  0091ce  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091d4  302efffc             move.w    -$4(a6), d0
  0091d8  b0703e04             cmp.w     $4(a0, d3.l * 8), d0
  0091dc  6f06                 ble.b     $91e4
  0091de  302efffc             move.w    -$4(a6), d0
  0091e2  600a                 bra.b     $91ee
  0091e4  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091ea  30303e04             move.w    $4(a0, d3.l * 8), d0
  0091ee  3d40fff4             move.w    d0, -$c(a6)
  0091f2  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  0091f8  38303e00             move.w    (a0, d3.l * 8), d4
  0091fc  48c4                 ext.l     d4
  0091fe  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009204  32303e04             move.w    $4(a0, d3.l * 8), d1
  009208  48c1                 ext.l     d1
  00920a  9284                 sub.l     d4, d1
  00920c  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  009212  38303e02             move.w    $2(a0, d3.l * 8), d4
  009216  48c4                 ext.l     d4
  009218  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00921e  34303e06             move.w    $6(a0, d3.l * 8), d2
  009222  48c2                 ext.l     d2
  009224  9484                 sub.l     d4, d2
  009226  4c012800             muls.l    d1, d2
  00922a  382efff0             move.w    -$10(a6), d4
  00922e  48c4                 ext.l     d4
  009230  322efff4             move.w    -$c(a6), d1
  009234  48c1                 ext.l     d1
  009236  9284                 sub.l     d4, d1
  009238  382efff2             move.w    -$e(a6), d4
  00923c  48c4                 ext.l     d4
  00923e  2d44ffe4             move.l    d4, -$1c(a6)
  009242  382efff6             move.w    -$a(a6), d4
  009246  48c4                 ext.l     d4
  009248  98aeffe4             sub.l     -$1c(a6), d4
  00924c  4c014800             muls.l    d1, d4
  009250  9882                 sub.l     d2, d4
  009252  b885                 cmp.l     d5, d4
  009254  6410                 bcc.b     $9266
  009256  2a04                 move.l    d4, d5
  009258  2c03                 move.l    d3, d6
  00925a  2d6efff0ffe8         move.l    -$10(a6), -$18(a6)
  009260  2d6efff4ffec         move.l    -$c(a6), -$14(a6)
  009266  5283                 addq.l    #$1, d3
  009268  b6b900013c80         cmp.l     $13c80.l, d3   ; g_13c80
  00926e  6500fef2             bcs.w     $9162
  009272  2006                 move.l    d6, d0
  009274  e788                 lsl.l     #$3, d0
  009276  41f900013c30         lea.l     $13c30.l, a0   ; g_13c30
  00927c  d1c0                 adda.l    d0, a0
  00927e  20aeffe8             move.l    -$18(a6), (a0)
  009282  216effec0004         move.l    -$14(a6), $4(a0)
  009288  4cdf0078             movem.l   (a7)+, d3-d6
  00928c  4e5e                 unlk      a6
  00928e  4e75                 rts       

;-------------------------------------------------------------
; EraseSprites   (seg 1 +0092a2, 1836 bytes)
  0092a2  4e56ffb8             link.w    a6, #$ffb8
  0092a6  48e71e30             movem.l   d3-d6/a2-a3, -(a7)
  0092aa  2d7900018664ffc0     move.l    $18664.l, -$40(a6)   ; g_18664
  0092b2  2d790000502cffb8     move.l    $502c.l, -$48(a6)   ; g_502c
  0092ba  2d7900005030ffbc     move.l    $5030.l, -$44(a6)   ; g_5030
  0092c2  7600                 moveq     #$0, d3
  0092c4  2479ffffe866         movea.l   $ffffe866.l, a2   ; g_-179a
  0092ca  30390000806a         move.w    $806a.l, d0   ; viewLeft
  0092d0  d16effba             add.w     d0, -$46(a6)
  0092d4  303900008068         move.w    $8068.l, d0   ; viewTop
  0092da  d16effb8             add.w     d0, -$48(a6)
  0092de  30390000806a         move.w    $806a.l, d0   ; viewLeft
  0092e4  d16effbe             add.w     d0, -$42(a6)
  0092e8  303900008068         move.w    $8068.l, d0   ; viewTop
  0092ee  d16effbc             add.w     d0, -$44(a6)
  0092f2  42b900013c80         clr.l     $13c80.l   ; g_13c80
  0092f8  6000059e             bra.w     $9898
  0092fc  554f                 subq.w    #$2, a7
  0092fe  2f2a0082             move.l    $82(a2), -(a7)
  009302  486effb8             pea.l     -$48(a6)
  009306  a8ad                 _PtInRect 
  009308  101f                 move.b    (a7)+, d0
  00930a  67000458             beq.w     $9764
  00930e  b5f900008070         cmpa.l    $8070.l, a2   ; playerSprite
  009314  6612                 bne.b     $9328
  009316  3f3c000e             move.w    #$e, -(a7)
  00931a  4eb900000b60         jsr       $b60.l   ; IsPressed
  009320  4a00                 tst.b     d0
  009322  544f                 addq.w    #$2, a7
  009324  6702                 beq.b     $9328
  009326  7600                 moveq     #$0, d3
  009328  302a005c             move.w    $5c(a2), d0
  00932c  b06a0084             cmp.w     $84(a2), d0
  009330  6656                 bne.b     $9388
  009332  302a005a             move.w    $5a(a2), d0
  009336  b06a0082             cmp.w     $82(a2), d0
  00933a  664c                 bne.b     $9388
  00933c  206a0086             movea.l   $86(a2), a0
  009340  b1ea007e             cmpa.l    $7e(a2), a0
  009344  6642                 bne.b     $9388
  009346  4aaa001a             tst.l     $1a(a2)
  00934a  673c                 beq.b     $9388
  00934c  4aaa007e             tst.l     $7e(a2)
  009350  6736                 beq.b     $9388
  009352  4a2a008a             tst.b     $8a(a2)
  009356  6630                 bne.b     $9388
  009358  4a2a0092             tst.b     $92(a2)
  00935c  662a                 bne.b     $9388
  00935e  302a0056             move.w    $56(a2), d0
  009362  b06a0052             cmp.w     $52(a2), d0
  009366  6620                 bne.b     $9388
  009368  302a0058             move.w    $58(a2), d0
  00936c  b06a0054             cmp.w     $54(a2), d0
  009370  6616                 bne.b     $9388
  009372  41f9000006c0         lea.l     $6c0.l, a0   ; HANDLEEFFECTSPRITE
  009378  b1ea001a             cmpa.l    $1a(a2), a0
  00937c  660003e6             bne.w     $9764
  009380  0c52ffff             cmpi.w    #$ffff, (a2)
  009384  660003de             bne.w     $9764
  009388  426efffa             clr.w     -$6(a6)
  00938c  426efff8             clr.w     -$8(a6)
  009390  426efffe             clr.w     -$2(a6)
  009394  426efffc             clr.w     -$4(a6)
  009398  426efff2             clr.w     -$e(a6)
  00939c  426efff0             clr.w     -$10(a6)
  0093a0  426efff6             clr.w     -$a(a6)
  0093a4  426efff4             clr.w     -$c(a6)
  0093a8  426effd2             clr.w     -$2e(a6)
  0093ac  426effd0             clr.w     -$30(a6)
  0093b0  426effd6             clr.w     -$2a(a6)
  0093b4  426effd4             clr.w     -$2c(a6)
  0093b8  426effca             clr.w     -$36(a6)
  0093bc  426effc8             clr.w     -$38(a6)
  0093c0  426effce             clr.w     -$32(a6)
  0093c4  426effcc             clr.w     -$34(a6)
  0093c8  4aaa0086             tst.l     $86(a2)
  0093cc  670002a6             beq.w     $9674
  0093d0  0c6a01000056         cmpi.w    #$100, $56(a2)
  0093d6  6620                 bne.b     $93f8
  0093d8  0c6a01000058         cmpi.w    #$100, $58(a2)
  0093de  6618                 bne.b     $93f8
  0093e0  2d6a0082ffd8         move.l    $82(a2), -$28(a6)
  0093e6  206a0086             movea.l   $86(a2), a0
  0093ea  2d680008ffe8         move.l    $8(a0), -$18(a6)
  0093f0  2d68000cffec         move.l    $c(a0), -$14(a6)
  0093f6  6048                 bra.b     $9440
  0093f8  486effe8             pea.l     -$18(a6)
  0093fc  486effd8             pea.l     -$28(a6)
  009400  3f2a0058             move.w    $58(a2), -(a7)
  009404  3f2a0056             move.w    $56(a2), -(a7)
  009408  2f2a0086             move.l    $86(a2), -(a7)
  00940c  2f2a0082             move.l    $82(a2), -(a7)
  009410  61ffffffea82         bsr.l     $7e94   ; FindScaledPosAndBounds
  009416  0c6a01000056         cmpi.w    #$100, $56(a2)
  00941c  4fef0014             lea.l     $14(a7), a7
  009420  6c1e                 bge.b     $9440
  009422  206a0086             movea.l   $86(a2), a0
  009426  2d50ffe8             move.l    (a0), -$18(a6)
  00942a  2d680004ffec         move.l    $4(a0), -$14(a6)
  009430  556effea             subq.w    #$2, -$16(a6)
  009434  546effee             addq.w    #$2, -$12(a6)
  009438  556effe8             subq.w    #$2, -$18(a6)
  00943c  546effec             addq.w    #$2, -$14(a6)
  009440  4aaa007e             tst.l     $7e(a2)
  009444  674c                 beq.b     $9492
  009446  0c6a01000052         cmpi.w    #$100, $52(a2)
  00944c  6620                 bne.b     $946e
  00944e  0c6a01000054         cmpi.w    #$100, $54(a2)
  009454  6618                 bne.b     $946e
  009456  2d6a005affe4         move.l    $5a(a2), -$1c(a6)
  00945c  206a007e             movea.l   $7e(a2), a0
  009460  2d680008ffdc         move.l    $8(a0), -$24(a6)
  009466  2d68000cffe0         move.l    $c(a0), -$20(a6)
  00946c  606e                 bra.b     $94dc
  00946e  486effdc             pea.l     -$24(a6)
  009472  486effe4             pea.l     -$1c(a6)
  009476  3f2a0054             move.w    $54(a2), -(a7)
  00947a  3f2a0052             move.w    $52(a2), -(a7)
  00947e  2f2a007e             move.l    $7e(a2), -(a7)
  009482  2f2a005a             move.l    $5a(a2), -(a7)
  009486  61ffffffea0c         bsr.l     $7e94   ; FindScaledPosAndBounds
  00948c  4fef0014             lea.l     $14(a7), a7
  009490  604a                 bra.b     $94dc
  009492  0c6a01000052         cmpi.w    #$100, $52(a2)
  009498  6620                 bne.b     $94ba
  00949a  0c6a01000054         cmpi.w    #$100, $54(a2)
  0094a0  6618                 bne.b     $94ba
  0094a2  2d6a005affe4         move.l    $5a(a2), -$1c(a6)
  0094a8  206a0086             movea.l   $86(a2), a0
  0094ac  2d680008ffdc         move.l    $8(a0), -$24(a6)
  0094b2  2d68000cffe0         move.l    $c(a0), -$20(a6)
  0094b8  6022                 bra.b     $94dc
  0094ba  486effdc             pea.l     -$24(a6)
  0094be  486effe4             pea.l     -$1c(a6)
  0094c2  3f2a0054             move.w    $54(a2), -(a7)
  0094c6  3f2a0052             move.w    $52(a2), -(a7)
  0094ca  2f2a0086             move.l    $86(a2), -(a7)
  0094ce  2f2a005a             move.l    $5a(a2), -(a7)
  0094d2  61ffffffe9c0         bsr.l     $7e94   ; FindScaledPosAndBounds
  0094d8  4fef0014             lea.l     $14(a7), a7
  0094dc  302effda             move.w    -$26(a6), d0
  0094e0  48c0                 ext.l     d0
  0094e2  322effea             move.w    -$16(a6), d1
  0094e6  48c1                 ext.l     d1
  0094e8  d280                 add.l     d0, d1
  0094ea  3d41fffa             move.w    d1, -$6(a6)
  0094ee  302effd8             move.w    -$28(a6), d0
  0094f2  48c0                 ext.l     d0
  0094f4  322effe8             move.w    -$18(a6), d1
  0094f8  48c1                 ext.l     d1
  0094fa  d280                 add.l     d0, d1
  0094fc  5381                 subq.l    #$1, d1
  0094fe  3d41fff8             move.w    d1, -$8(a6)
  009502  302effda             move.w    -$26(a6), d0
  009506  48c0                 ext.l     d0
  009508  322effee             move.w    -$12(a6), d1
  00950c  48c1                 ext.l     d1
  00950e  d280                 add.l     d0, d1
  009510  3d41fffe             move.w    d1, -$2(a6)
  009514  302effd8             move.w    -$28(a6), d0
  009518  48c0                 ext.l     d0
  00951a  322effec             move.w    -$14(a6), d1
  00951e  48c1                 ext.l     d1
  009520  d280                 add.l     d0, d1
  009522  5281                 addq.l    #$1, d1
  009524  3d41fffc             move.w    d1, -$4(a6)
  009528  302effe6             move.w    -$1a(a6), d0
  00952c  48c0                 ext.l     d0
  00952e  322effea             move.w    -$16(a6), d1
  009532  48c1                 ext.l     d1
  009534  d280                 add.l     d0, d1
  009536  3d41fff2             move.w    d1, -$e(a6)
  00953a  302effe4             move.w    -$1c(a6), d0
  00953e  48c0                 ext.l     d0
  009540  322effe8             move.w    -$18(a6), d1
  009544  48c1                 ext.l     d1
  009546  d280                 add.l     d0, d1
  009548  5381                 subq.l    #$1, d1
  00954a  3d41fff0             move.w    d1, -$10(a6)
  00954e  302effe6             move.w    -$1a(a6), d0
  009552  48c0                 ext.l     d0
  009554  322effee             move.w    -$12(a6), d1
  009558  48c1                 ext.l     d1
  00955a  d280                 add.l     d0, d1
  00955c  3d41fff6             move.w    d1, -$a(a6)
  009560  302effe4             move.w    -$1c(a6), d0
  009564  48c0                 ext.l     d0
  009566  322effec             move.w    -$14(a6), d1
  00956a  48c1                 ext.l     d1
  00956c  d280                 add.l     d0, d1
  00956e  5281                 addq.l    #$1, d1
  009570  3d41fff4             move.w    d1, -$c(a6)
  009574  4aaa007e             tst.l     $7e(a2)
  009578  670000c6             beq.w     $9640
  00957c  302effda             move.w    -$26(a6), d0
  009580  48c0                 ext.l     d0
  009582  322effde             move.w    -$22(a6), d1
  009586  48c1                 ext.l     d1
  009588  d280                 add.l     d0, d1
  00958a  3d41ffd2             move.w    d1, -$2e(a6)
  00958e  302effd8             move.w    -$28(a6), d0
  009592  48c0                 ext.l     d0
  009594  322effdc             move.w    -$24(a6), d1
  009598  48c1                 ext.l     d1
  00959a  d280                 add.l     d0, d1
  00959c  5381                 subq.l    #$1, d1
  00959e  3d41ffd0             move.w    d1, -$30(a6)
  0095a2  302effda             move.w    -$26(a6), d0
  0095a6  48c0                 ext.l     d0
  0095a8  322effe2             move.w    -$1e(a6), d1
  0095ac  48c1                 ext.l     d1
  0095ae  d280                 add.l     d0, d1
  0095b0  3d41ffd6             move.w    d1, -$2a(a6)
  0095b4  302effd8             move.w    -$28(a6), d0
  0095b8  48c0                 ext.l     d0
  0095ba  322effe0             move.w    -$20(a6), d1
  0095be  48c1                 ext.l     d1
  0095c0  d280                 add.l     d0, d1
  0095c2  5281                 addq.l    #$1, d1
  0095c4  3d41ffd4             move.w    d1, -$2c(a6)
  0095c8  302effe6             move.w    -$1a(a6), d0
  0095cc  48c0                 ext.l     d0
  0095ce  322effde             move.w    -$22(a6), d1
  0095d2  48c1                 ext.l     d1
  0095d4  d280                 add.l     d0, d1
  0095d6  3d41ffca             move.w    d1, -$36(a6)
  0095da  302effe4             move.w    -$1c(a6), d0
  0095de  48c0                 ext.l     d0
  0095e0  322effdc             move.w    -$24(a6), d1
  0095e4  48c1                 ext.l     d1
  0095e6  d280                 add.l     d0, d1
  0095e8  5381                 subq.l    #$1, d1
  0095ea  3d41ffc8             move.w    d1, -$38(a6)
  0095ee  302effe6             move.w    -$1a(a6), d0
  0095f2  48c0                 ext.l     d0
  0095f4  322effe2             move.w    -$1e(a6), d1
  0095f8  48c1                 ext.l     d1
  0095fa  d280                 add.l     d0, d1
  0095fc  3d41ffce             move.w    d1, -$32(a6)
  009600  302effe4             move.w    -$1c(a6), d0
  009604  48c0                 ext.l     d0
  009606  322effe0             move.w    -$20(a6), d1
  00960a  48c1                 ext.l     d1
  00960c  d280                 add.l     d0, d1
  00960e  5281                 addq.l    #$1, d1
  009610  3d41ffcc             move.w    d1, -$34(a6)
  009614  486efff8             pea.l     -$8(a6)
  009618  486efff0             pea.l     -$10(a6)
  00961c  486efff8             pea.l     -$8(a6)
  009620  a8ab                 _UnionRect 
  009622  486efff8             pea.l     -$8(a6)
  009626  486effd0             pea.l     -$30(a6)
  00962a  486efff8             pea.l     -$8(a6)
  00962e  a8ab                 _UnionRect 
  009630  486efff8             pea.l     -$8(a6)
  009634  486effc8             pea.l     -$38(a6)
  009638  486efff8             pea.l     -$8(a6)
  00963c  a8ab                 _UnionRect 
  00963e  600e                 bra.b     $964e
  009640  486efff8             pea.l     -$8(a6)
  009644  486efff0             pea.l     -$10(a6)
  009648  486efff8             pea.l     -$8(a6)
  00964c  a8ab                 _UnionRect 
  00964e  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  009654  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  00965a  486efff8             pea.l     -$8(a6)
  00965e  4eb9000002d0         jsr       $2d0.l   ; SAFEWRAPRECTBLIT
  009664  486efff8             pea.l     -$8(a6)
  009668  61fffffff934         bsr.l     $8f9e   ; AddRectToUpdate
  00966e  584f                 addq.w    #$4, a7
  009670  600000f2             bra.w     $9764
  009674  4aaa007e             tst.l     $7e(a2)
  009678  670000ea             beq.w     $9764
  00967c  302a0084             move.w    $84(a2), d0
  009680  48c0                 ext.l     d0
  009682  206a007e             movea.l   $7e(a2), a0
  009686  3228000a             move.w    $a(a0), d1
  00968a  48c1                 ext.l     d1
  00968c  d280                 add.l     d0, d1
  00968e  3d41fffa             move.w    d1, -$6(a6)
  009692  302a0082             move.w    $82(a2), d0
  009696  48c0                 ext.l     d0
  009698  206a007e             movea.l   $7e(a2), a0
  00969c  32280008             move.w    $8(a0), d1
  0096a0  48c1                 ext.l     d1
  0096a2  d280                 add.l     d0, d1
  0096a4  5381                 subq.l    #$1, d1
  0096a6  3d41fff8             move.w    d1, -$8(a6)
  0096aa  302a0084             move.w    $84(a2), d0
  0096ae  48c0                 ext.l     d0
  0096b0  206a007e             movea.l   $7e(a2), a0
  0096b4  3228000e             move.w    $e(a0), d1
  0096b8  48c1                 ext.l     d1
  0096ba  d280                 add.l     d0, d1
  0096bc  3d41fffe             move.w    d1, -$2(a6)
  0096c0  302a0082             move.w    $82(a2), d0
  0096c4  48c0                 ext.l     d0
  0096c6  206a007e             movea.l   $7e(a2), a0
  0096ca  3228000c             move.w    $c(a0), d1
  0096ce  48c1                 ext.l     d1
  0096d0  d280                 add.l     d0, d1
  0096d2  5281                 addq.l    #$1, d1
  0096d4  3d41fffc             move.w    d1, -$4(a6)
  0096d8  302a005c             move.w    $5c(a2), d0
  0096dc  48c0                 ext.l     d0
  0096de  206a007e             movea.l   $7e(a2), a0
  0096e2  3228000a             move.w    $a(a0), d1
  0096e6  48c1                 ext.l     d1
  0096e8  d280                 add.l     d0, d1
  0096ea  3d41fff2             move.w    d1, -$e(a6)
  0096ee  302a005a             move.w    $5a(a2), d0
  0096f2  48c0                 ext.l     d0
  0096f4  206a007e             movea.l   $7e(a2), a0
  0096f8  32280008             move.w    $8(a0), d1
  0096fc  48c1                 ext.l     d1
  0096fe  d280                 add.l     d0, d1
  009700  5381                 subq.l    #$1, d1
  009702  3d41fff0             move.w    d1, -$10(a6)
  009706  302a005c             move.w    $5c(a2), d0
  00970a  48c0                 ext.l     d0
  00970c  206a007e             movea.l   $7e(a2), a0
  009710  3228000e             move.w    $e(a0), d1
  009714  48c1                 ext.l     d1
  009716  d280                 add.l     d0, d1
  009718  3d41fff6             move.w    d1, -$a(a6)
  00971c  302a005a             move.w    $5a(a2), d0
  009720  48c0                 ext.l     d0
  009722  206a007e             movea.l   $7e(a2), a0
  009726  3228000c             move.w    $c(a0), d1
  00972a  48c1                 ext.l     d1
  00972c  d280                 add.l     d0, d1
  00972e  5281                 addq.l    #$1, d1
  009730  3d41fff4             move.w    d1, -$c(a6)
  009734  486efff8             pea.l     -$8(a6)
  009738  486efff0             pea.l     -$10(a6)
  00973c  486efff8             pea.l     -$8(a6)
  009740  a8ab                 _UnionRect 
  009742  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  009748  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  00974e  486efff8             pea.l     -$8(a6)
  009752  4eb9000002d0         jsr       $2d0.l   ; SAFEWRAPRECTBLIT
  009758  486efff8             pea.l     -$8(a6)
  00975c  61fffffff840         bsr.l     $8f9e   ; AddRectToUpdate
  009762  584f                 addq.w    #$4, a7
  009764  4aaa001a             tst.l     $1a(a2)
  009768  6706                 beq.b     $9770
  00976a  4a2a0092             tst.b     $92(a2)
  00976e  6778                 beq.b     $97e8
  009770  4a2a0092             tst.b     $92(a2)
  009774  6760                 beq.b     $97d6
  009776  4a6a0068             tst.w     $68(a2)
  00977a  6d0c                 blt.b     $9788
  00977c  0c6a00ff0068         cmpi.w    #$ff, $68(a2)
  009782  6e04                 bgt.b     $9788
  009784  7001                 moveq     #$1, d0
  009786  6002                 bra.b     $978a
  009788  7000                 moveq     #$0, d0
  00978a  4a80                 tst.l     d0
  00978c  6748                 beq.b     $97d6
  00978e  4a6a0068             tst.w     $68(a2)
  009792  6d24                 blt.b     $97b8
  009794  0c6a00ff0068         cmpi.w    #$ff, $68(a2)
  00979a  6e1c                 bgt.b     $97b8
  00979c  306a0068             movea.w   $68(a2), a0
  0097a0  2008                 move.l    a0, d0
  0097a2  e988                 lsl.l     #$4, d0
  0097a4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0097aa  2050                 movea.l   (a0), a0
  0097ac  d1c0                 adda.l    d0, a0
  0097ae  203c00010000         move.l    #$10000, d0
  0097b4  42300800             clr.b     (a0, d0.l)
  0097b8  4a6a0076             tst.w     $76(a2)
  0097bc  6d18                 blt.b     $97d6
  0097be  0c6a00ff0076         cmpi.w    #$ff, $76(a2)
  0097c4  6e10                 bgt.b     $97d6
  0097c6  7044                 moveq     #$44, d0
  0097c8  c1ea0076             muls.w    $76(a2), d0
  0097cc  41f900014294         lea.l     $14294.l, a0   ; idleSprites
  0097d2  42300800             clr.b     (a0, d0.l)
  0097d6  266a002e             movea.l   $2e(a2), a3
  0097da  2f0a                 move.l    a2, -(a7)
  0097dc  4eb900000068         jsr       $68.l   ; SATKILLSPRITE
  0097e2  244b                 movea.l   a3, a2
  0097e4  600000b2             bra.w     $9898
  0097e8  422a008a             clr.b     $8a(a2)
  0097ec  422a004a             clr.b     $4a(a2)
  0097f0  256a007e0086         move.l    $7e(a2), $86(a2)
  0097f6  356a005c0084         move.w    $5c(a2), $84(a2)
  0097fc  356a005a0082         move.w    $5a(a2), $82(a2)
  009802  356a00520056         move.w    $52(a2), $56(a2)
  009808  356a00540058         move.w    $54(a2), $58(a2)
  00980e  4a6a0094             tst.w     $94(a2)
  009812  6704                 beq.b     $9818
  009814  536a0094             subq.w    #$1, $94(a2)
  009818  4a6a0096             tst.w     $96(a2)
  00981c  6704                 beq.b     $9822
  00981e  536a0096             subq.w    #$1, $96(a2)
  009822  4a6a0068             tst.w     $68(a2)
  009826  6d6c                 blt.b     $9894
  009828  0c6a00ff0068         cmpi.w    #$ff, $68(a2)
  00982e  6e64                 bgt.b     $9894
  009830  306a0068             movea.w   $68(a2), a0
  009834  2008                 move.l    a0, d0
  009836  e988                 lsl.l     #$4, d0
  009838  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00983e  2050                 movea.l   (a0), a0
  009840  d1c0                 adda.l    d0, a0
  009842  203c00010002         move.l    #$10002, d0
  009848  31920800             move.w    (a2), (a0, d0.l)
  00984c  302a005c             move.w    $5c(a2), d0
  009850  48c0                 ext.l     d0
  009852  5c80                 addq.l    #$6, d0
  009854  306a0068             movea.w   $68(a2), a0
  009858  2208                 move.l    a0, d1
  00985a  e989                 lsl.l     #$4, d1
  00985c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  009862  2050                 movea.l   (a0), a0
  009864  d1c1                 adda.l    d1, a0
  009866  223c0001000e         move.l    #$1000e, d1
  00986c  31801800             move.w    d0, (a0, d1.l)
  009870  302a005a             move.w    $5a(a2), d0
  009874  48c0                 ext.l     d0
  009876  5c80                 addq.l    #$6, d0
  009878  306a0068             movea.w   $68(a2), a0
  00987c  2208                 move.l    a0, d1
  00987e  e989                 lsl.l     #$4, d1
  009880  20790000746c         movea.l   $746c.l, a0   ; hLevel
  009886  2050                 movea.l   (a0), a0
  009888  d1c1                 adda.l    d1, a0
  00988a  223c0001000c         move.l    #$1000c, d1
  009890  31801800             move.w    d0, (a0, d1.l)
  009894  246a002e             movea.l   $2e(a2), a2
  009898  200a                 move.l    a2, d0
  00989a  6600fa60             bne.w     $92fc
  00989e  7600                 moveq     #$0, d3
  0098a0  6000011a             bra.w     $99bc
  0098a4  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  0098aa  30303400             move.w    (a0, d3.w * 4), d0
  0098ae  48c0                 ext.l     d0
  0098b0  ea80                 asr.l     #$5, d0
  0098b2  d080                 add.l     d0, d0
  0098b4  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  0098ba  32303402             move.w    $2(a0, d3.w * 4), d1
  0098be  48c1                 ext.l     d1
  0098c0  ea81                 asr.l     #$5, d1
  0098c2  e189                 lsl.l     #$8, d1
  0098c4  20790000746c         movea.l   $746c.l, a0   ; hLevel
  0098ca  2050                 movea.l   (a0), a0
  0098cc  d1c1                 adda.l    d1, a0
  0098ce  d1c0                 adda.l    d0, a0
  0098d0  203c00008000         move.l    #$8000, d0
  0098d6  0c70ffff0800         cmpi.w    #$ffff, (a0, d0.l)
  0098dc  6f0000dc             ble.w     $99ba
  0098e0  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  0098e6  38303402             move.w    $2(a0, d3.w * 4), d4
  0098ea  48c4                 ext.l     d4
  0098ec  ea84                 asr.l     #$5, d4
  0098ee  41f90000fa80         lea.l     $fa80.l, a0   ; g_fa80
  0098f4  3a303400             move.w    (a0, d3.w * 4), d5
  0098f8  48c5                 ext.l     d5
  0098fa  ea85                 asr.l     #$5, d5
  0098fc  eb4c                 lsl.w     #$5, d4
  0098fe  eb4d                 lsl.w     #$5, d5
  009900  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  009906  3d703602ffc6         move.w    $2(a0, d3.w * 8), -$3a(a6)
  00990c  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  009912  3d703600ffc4         move.w    (a0, d3.w * 8), -$3c(a6)
  009918  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  00991e  30303602             move.w    $2(a0, d3.w * 8), d0
  009922  48c0                 ext.l     d0
  009924  3204                 move.w    d4, d1
  009926  48c1                 ext.l     d1
  009928  9081                 sub.l     d1, d0
  00992a  3d40ffc2             move.w    d0, -$3e(a6)
  00992e  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  009934  30303600             move.w    (a0, d3.w * 8), d0
  009938  48c0                 ext.l     d0
  00993a  3205                 move.w    d5, d1
  00993c  48c1                 ext.l     d1
  00993e  9081                 sub.l     d1, d0
  009940  3d40ffc0             move.w    d0, -$40(a6)
  009944  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  00994a  3c303606             move.w    $6(a0, d3.w * 8), d6
  00994e  48c6                 ext.l     d6
  009950  3204                 move.w    d4, d1
  009952  48c1                 ext.l     d1
  009954  9c81                 sub.l     d1, d6
  009956  322effc2             move.w    -$3e(a6), d1
  00995a  48c1                 ext.l     d1
  00995c  9c81                 sub.l     d1, d6
  00995e  41f90000f760         lea.l     $f760.l, a0   ; g_f760
  009964  38303604             move.w    $4(a0, d3.w * 8), d4
  009968  48c4                 ext.l     d4
  00996a  3205                 move.w    d5, d1
  00996c  48c1                 ext.l     d1
  00996e  9881                 sub.l     d1, d4
  009970  322effc0             move.w    -$40(a6), d1
  009974  48c1                 ext.l     d1
  009976  9881                 sub.l     d1, d4
  009978  3d6effc6fffa         move.w    -$3a(a6), -$6(a6)
  00997e  3d6effc4fff8         move.w    -$3c(a6), -$8(a6)
  009984  3006                 move.w    d6, d0
  009986  48c0                 ext.l     d0
  009988  322effc6             move.w    -$3a(a6), d1
  00998c  48c1                 ext.l     d1
  00998e  d280                 add.l     d0, d1
  009990  3d41fffe             move.w    d1, -$2(a6)
  009994  3004                 move.w    d4, d0
  009996  48c0                 ext.l     d0
  009998  322effc4             move.w    -$3c(a6), d1
  00999c  48c1                 ext.l     d1
  00999e  d280                 add.l     d0, d1
  0099a0  3d41fffc             move.w    d1, -$4(a6)
  0099a4  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  0099aa  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  0099b0  486efff8             pea.l     -$8(a6)
  0099b4  4eb9000002d0         jsr       $2d0.l   ; SAFEWRAPRECTBLIT
  0099ba  5243                 addq.w    #$1, d3
  0099bc  b6790000fc10         cmp.w     $fc10.l, d3   ; g_fc10
  0099c2  6f00fee0             ble.w     $98a4
  0099c6  4cdf0c78             movem.l   (a7)+, d3-d6/a2-a3
  0099ca  4e5e                 unlk      a6
  0099cc  4e75                 rts       

;-------------------------------------------------------------
; FindUpperLeftCorner   (seg 1 +0099de, 1710 bytes)
  0099de  4e560000             link.w    a6, #$0
  0099e2  48e71f00             movem.l   d3-d7, -(a7)
  0099e6  383900008074         move.w    $8074.l, d4   ; playerH
  0099ec  48c4                 ext.l     d4
  0099ee  7220                 moveq     #$20, d1
  0099f0  d881                 add.l     d1, d4
  0099f2  3a3900008076         move.w    $8076.l, d5   ; playerV
  0099f8  48c5                 ext.l     d5
  0099fa  7220                 moveq     #$20, d1
  0099fc  da81                 add.l     d1, d5
  0099fe  3c390000806a         move.w    $806a.l, d6   ; viewLeft
  009a04  48c6                 ext.l     d6
  009a06  0686000000e0         addi.l    #$e0, d6
  009a0c  3e3900008068         move.w    $8068.l, d7   ; viewTop
  009a12  48c7                 ext.l     d7
  009a14  0687000000e0         addi.l    #$e0, d7
  009a1a  0c7900030000617a     cmpi.w    #$3, $617a.l   ; prefScrollMode
  009a22  6c0001ca             bge.w     $9bee
  009a26  303900008074         move.w    $8074.l, d0   ; playerH
  009a2c  48c0                 ext.l     d0
  009a2e  0680ffffff30         addi.l    #$ffffff30, d0
  009a34  32390000806e         move.w    $806e.l, d1   ; viewLeft2
  009a3a  48c1                 ext.l     d1
  009a3c  b280                 cmp.l     d0, d1
  009a3e  6c38                 bge.b     $9a78
  009a40  36390000806e         move.w    $806e.l, d3   ; viewLeft2
  009a46  48c3                 ext.l     d3
  009a48  323900008074         move.w    $8074.l, d1   ; playerH
  009a4e  48c1                 ext.l     d1
  009a50  0681ffffff30         addi.l    #$ffffff30, d1
  009a56  9283                 sub.l     d3, d1
  009a58  2601                 move.l    d1, d3
  009a5a  e683                 asr.l     #$3, d3
  009a5c  e08b                 lsr.l     #$8, d3
  009a5e  e08b                 lsr.l     #$8, d3
  009a60  e08b                 lsr.l     #$8, d3
  009a62  e88b                 lsr.l     #$4, d3
  009a64  d681                 add.l     d1, d3
  009a66  e883                 asr.l     #$4, d3
  009a68  0c430001             cmpi.w    #$1, d3
  009a6c  6c02                 bge.b     $9a70
  009a6e  7601                 moveq     #$1, d3
  009a70  d7790000806e         add.w     d3, $806e.l   ; viewLeft2
  009a76  6050                 bra.b     $9ac8
  009a78  303900008074         move.w    $8074.l, d0   ; playerH
  009a7e  48c0                 ext.l     d0
  009a80  0680ffffff30         addi.l    #$ffffff30, d0
  009a86  32390000806e         move.w    $806e.l, d1   ; viewLeft2
  009a8c  48c1                 ext.l     d1
  009a8e  b280                 cmp.l     d0, d1
  009a90  6f36                 ble.b     $9ac8
  009a92  363900008074         move.w    $8074.l, d3   ; playerH
  009a98  48c3                 ext.l     d3
  009a9a  0683ffffff30         addi.l    #$ffffff30, d3
  009aa0  32390000806e         move.w    $806e.l, d1   ; viewLeft2
  009aa6  48c1                 ext.l     d1
  009aa8  9283                 sub.l     d3, d1
  009aaa  2601                 move.l    d1, d3
  009aac  e683                 asr.l     #$3, d3
  009aae  e08b                 lsr.l     #$8, d3
  009ab0  e08b                 lsr.l     #$8, d3
  009ab2  e08b                 lsr.l     #$8, d3
  009ab4  e88b                 lsr.l     #$4, d3
  009ab6  d681                 add.l     d1, d3
  009ab8  e883                 asr.l     #$4, d3
  009aba  0c430001             cmpi.w    #$1, d3
  009abe  6c02                 bge.b     $9ac2
  009ac0  7601                 moveq     #$1, d3
  009ac2  97790000806e         sub.w     d3, $806e.l   ; viewLeft2
  009ac8  303900008076         move.w    $8076.l, d0   ; playerV
  009ace  48c0                 ext.l     d0
  009ad0  0680ffffff30         addi.l    #$ffffff30, d0
  009ad6  32390000806c         move.w    $806c.l, d1   ; viewTop2
  009adc  48c1                 ext.l     d1
  009ade  b280                 cmp.l     d0, d1
  009ae0  6c38                 bge.b     $9b1a
  009ae2  36390000806c         move.w    $806c.l, d3   ; viewTop2
  009ae8  48c3                 ext.l     d3
  009aea  323900008076         move.w    $8076.l, d1   ; playerV
  009af0  48c1                 ext.l     d1
  009af2  0681ffffff30         addi.l    #$ffffff30, d1
  009af8  9283                 sub.l     d3, d1
  009afa  2601                 move.l    d1, d3
  009afc  e683                 asr.l     #$3, d3
  009afe  e08b                 lsr.l     #$8, d3
  009b00  e08b                 lsr.l     #$8, d3
  009b02  e08b                 lsr.l     #$8, d3
  009b04  e88b                 lsr.l     #$4, d3
  009b06  d681                 add.l     d1, d3
  009b08  e883                 asr.l     #$4, d3
  009b0a  0c430001             cmpi.w    #$1, d3
  009b0e  6c02                 bge.b     $9b12
  009b10  7601                 moveq     #$1, d3
  009b12  d7790000806c         add.w     d3, $806c.l   ; viewTop2
  009b18  6050                 bra.b     $9b6a
  009b1a  303900008076         move.w    $8076.l, d0   ; playerV
  009b20  48c0                 ext.l     d0
  009b22  0680ffffff30         addi.l    #$ffffff30, d0
  009b28  32390000806c         move.w    $806c.l, d1   ; viewTop2
  009b2e  48c1                 ext.l     d1
  009b30  b280                 cmp.l     d0, d1
  009b32  6f36                 ble.b     $9b6a
  009b34  363900008076         move.w    $8076.l, d3   ; playerV
  009b3a  48c3                 ext.l     d3
  009b3c  0683ffffff30         addi.l    #$ffffff30, d3
  009b42  32390000806c         move.w    $806c.l, d1   ; viewTop2
  009b48  48c1                 ext.l     d1
  009b4a  9283                 sub.l     d3, d1
  009b4c  2601                 move.l    d1, d3
  009b4e  e683                 asr.l     #$3, d3
  009b50  e08b                 lsr.l     #$8, d3
  009b52  e08b                 lsr.l     #$8, d3
  009b54  e08b                 lsr.l     #$8, d3
  009b56  e88b                 lsr.l     #$4, d3
  009b58  d681                 add.l     d1, d3
  009b5a  e883                 asr.l     #$4, d3
  009b5c  0c430001             cmpi.w    #$1, d3
  009b60  6c02                 bge.b     $9b64
  009b62  7601                 moveq     #$1, d3
  009b64  97790000806c         sub.w     d3, $806c.l   ; viewTop2
  009b6a  30390000617a         move.w    $617a.l, d0   ; prefScrollMode
  009b70  48c0                 ext.l     d0
  009b72  5380                 subq.l    #$1, d0
  009b74  6708                 beq.b     $9b7e
  009b76  5380                 subq.l    #$1, d0
  009b78  671c                 beq.b     $9b96
  009b7a  600003c4             bra.w     $9f40
  009b7e  33f90000806e0000806a move.w    $806e.l, $806a.l   ; viewLeft2, viewLeft
  009b88  33f90000806c00008068 move.w    $806c.l, $8068.l   ; viewTop2, viewTop
  009b92  600003ac             bra.w     $9f40
  009b96  303900008074         move.w    $8074.l, d0   ; playerH
  009b9c  48c0                 ext.l     d0
  009b9e  0680ffffff30         addi.l    #$ffffff30, d0
  009ba4  32390000806e         move.w    $806e.l, d1   ; viewLeft2
  009baa  48c1                 ext.l     d1
  009bac  9280                 sub.l     d0, d1
  009bae  d281                 add.l     d1, d1
  009bb0  30390000806e         move.w    $806e.l, d0   ; viewLeft2
  009bb6  48c0                 ext.l     d0
  009bb8  9081                 sub.l     d1, d0
  009bba  33c00000806a         move.w    d0, $806a.l   ; viewLeft
  009bc0  303900008076         move.w    $8076.l, d0   ; playerV
  009bc6  48c0                 ext.l     d0
  009bc8  0680ffffff30         addi.l    #$ffffff30, d0
  009bce  32390000806c         move.w    $806c.l, d1   ; viewTop2
  009bd4  48c1                 ext.l     d1
  009bd6  9280                 sub.l     d0, d1
  009bd8  d281                 add.l     d1, d1
  009bda  30390000806c         move.w    $806c.l, d0   ; viewTop2
  009be0  48c0                 ext.l     d0
  009be2  9081                 sub.l     d1, d0
  009be4  33c000008068         move.w    d0, $8068.l   ; viewTop
  009bea  60000354             bra.w     $9f40
  009bee  4a7900013c22         tst.w     $13c22.l   ; scrollStepCount
  009bf4  66000224             bne.w     $9e1a
  009bf8  4a7900013c24         tst.w     $13c24.l   ; scrollCooldown
  009bfe  6f06                 ble.b     $9c06
  009c00  537900013c24         subq.w    #$1, $13c24.l   ; scrollCooldown
  009c06  3006                 move.w    d6, d0
  009c08  48c0                 ext.l     d0
  009c0a  3204                 move.w    d4, d1
  009c0c  48c1                 ext.l     d1
  009c0e  9280                 sub.l     d0, d1
  009c10  4a81                 tst.l     d1
  009c12  6f0e                 ble.b     $9c22
  009c14  3006                 move.w    d6, d0
  009c16  48c0                 ext.l     d0
  009c18  3204                 move.w    d4, d1
  009c1a  48c1                 ext.l     d1
  009c1c  9280                 sub.l     d0, d1
  009c1e  2001                 move.l    d1, d0
  009c20  600e                 bra.b     $9c30
  009c22  3006                 move.w    d6, d0
  009c24  48c0                 ext.l     d0
  009c26  3204                 move.w    d4, d1
  009c28  48c1                 ext.l     d1
  009c2a  9280                 sub.l     d0, d1
  009c2c  4481                 neg.l     d1
  009c2e  2001                 move.l    d1, d0
  009c30  0c8000000090         cmpi.l    #$90, d0
  009c36  6f0000d8             ble.w     $9d10
  009c3a  0c7900030000617a     cmpi.w    #$3, $617a.l   ; prefScrollMode
  009c42  660a                 bne.b     $9c4e
  009c44  33fc000c00013c22     move.w    #$c, $13c22.l   ; scrollStepCount
  009c4c  6012                 bra.b     $9c60
  009c4e  0c7900040000617a     cmpi.w    #$4, $617a.l   ; prefScrollMode
  009c56  6608                 bne.b     $9c60
  009c58  33fc000600013c22     move.w    #$6, $13c22.l   ; scrollStepCount
  009c60  3007                 move.w    d7, d0
  009c62  48c0                 ext.l     d0
  009c64  3205                 move.w    d5, d1
  009c66  48c1                 ext.l     d1
  009c68  9280                 sub.l     d0, d1
  009c6a  4a81                 tst.l     d1
  009c6c  6f0e                 ble.b     $9c7c
  009c6e  3007                 move.w    d7, d0
  009c70  48c0                 ext.l     d0
  009c72  3205                 move.w    d5, d1
  009c74  48c1                 ext.l     d1
  009c76  9280                 sub.l     d0, d1
  009c78  2001                 move.l    d1, d0
  009c7a  600e                 bra.b     $9c8a
  009c7c  3007                 move.w    d7, d0
  009c7e  48c0                 ext.l     d0
  009c80  3205                 move.w    d5, d1
  009c82  48c1                 ext.l     d1
  009c84  9280                 sub.l     d0, d1
  009c86  4481                 neg.l     d1
  009c88  2001                 move.l    d1, d0
  009c8a  7248                 moveq     #$48, d1
  009c8c  b081                 cmp.l     d1, d0
  009c8e  6f5a                 ble.b     $9cea
  009c90  3006                 move.w    d6, d0
  009c92  48c0                 ext.l     d0
  009c94  3204                 move.w    d4, d1
  009c96  48c1                 ext.l     d1
  009c98  9280                 sub.l     d0, d1
  009c9a  4a81                 tst.l     d1
  009c9c  6f26                 ble.b     $9cc4
  009c9e  3007                 move.w    d7, d0
  009ca0  48c0                 ext.l     d0
  009ca2  3205                 move.w    d5, d1
  009ca4  48c1                 ext.l     d1
  009ca6  9280                 sub.l     d0, d1
  009ca8  4a81                 tst.l     d1
  009caa  6f0c                 ble.b     $9cb8
  009cac  33fc000500013c20     move.w    #$5, $13c20.l   ; scrollDir
  009cb4  6000028a             bra.w     $9f40
  009cb8  33fc000600013c20     move.w    #$6, $13c20.l   ; scrollDir
  009cc0  6000027e             bra.w     $9f40
  009cc4  3007                 move.w    d7, d0
  009cc6  48c0                 ext.l     d0
  009cc8  3205                 move.w    d5, d1
  009cca  48c1                 ext.l     d1
  009ccc  9280                 sub.l     d0, d1
  009cce  4a81                 tst.l     d1
  009cd0  6f0c                 ble.b     $9cde
  009cd2  33fc000700013c20     move.w    #$7, $13c20.l   ; scrollDir
  009cda  60000264             bra.w     $9f40
  009cde  33fc000800013c20     move.w    #$8, $13c20.l   ; scrollDir
  009ce6  60000258             bra.w     $9f40
  009cea  3006                 move.w    d6, d0
  009cec  48c0                 ext.l     d0
  009cee  3204                 move.w    d4, d1
  009cf0  48c1                 ext.l     d1
  009cf2  9280                 sub.l     d0, d1
  009cf4  4a81                 tst.l     d1
  009cf6  6f0c                 ble.b     $9d04
  009cf8  33fc000100013c20     move.w    #$1, $13c20.l   ; scrollDir
  009d00  6000023e             bra.w     $9f40
  009d04  33fc000200013c20     move.w    #$2, $13c20.l   ; scrollDir
  009d0c  60000232             bra.w     $9f40
  009d10  3007                 move.w    d7, d0
  009d12  48c0                 ext.l     d0
  009d14  3205                 move.w    d5, d1
  009d16  48c1                 ext.l     d1
  009d18  9280                 sub.l     d0, d1
  009d1a  4a81                 tst.l     d1
  009d1c  6f0e                 ble.b     $9d2c
  009d1e  3007                 move.w    d7, d0
  009d20  48c0                 ext.l     d0
  009d22  3205                 move.w    d5, d1
  009d24  48c1                 ext.l     d1
  009d26  9280                 sub.l     d0, d1
  009d28  2001                 move.l    d1, d0
  009d2a  600e                 bra.b     $9d3a
  009d2c  3007                 move.w    d7, d0
  009d2e  48c0                 ext.l     d0
  009d30  3205                 move.w    d5, d1
  009d32  48c1                 ext.l     d1
  009d34  9280                 sub.l     d0, d1
  009d36  4481                 neg.l     d1
  009d38  2001                 move.l    d1, d0
  009d3a  0c8000000090         cmpi.l    #$90, d0
  009d40  6f0001fe             ble.w     $9f40
  009d44  0c7900030000617a     cmpi.w    #$3, $617a.l   ; prefScrollMode
  009d4c  660a                 bne.b     $9d58
  009d4e  33fc000c00013c22     move.w    #$c, $13c22.l   ; scrollStepCount
  009d56  6012                 bra.b     $9d6a
  009d58  0c7900040000617a     cmpi.w    #$4, $617a.l   ; prefScrollMode
  009d60  6608                 bne.b     $9d6a
  009d62  33fc000600013c22     move.w    #$6, $13c22.l   ; scrollStepCount
  009d6a  3006                 move.w    d6, d0
  009d6c  48c0                 ext.l     d0
  009d6e  3204                 move.w    d4, d1
  009d70  48c1                 ext.l     d1
  009d72  9280                 sub.l     d0, d1
  009d74  4a81                 tst.l     d1
  009d76  6f0e                 ble.b     $9d86
  009d78  3006                 move.w    d6, d0
  009d7a  48c0                 ext.l     d0
  009d7c  3204                 move.w    d4, d1
  009d7e  48c1                 ext.l     d1
  009d80  9280                 sub.l     d0, d1
  009d82  2001                 move.l    d1, d0
  009d84  600e                 bra.b     $9d94
  009d86  3006                 move.w    d6, d0
  009d88  48c0                 ext.l     d0
  009d8a  3204                 move.w    d4, d1
  009d8c  48c1                 ext.l     d1
  009d8e  9280                 sub.l     d0, d1
  009d90  4481                 neg.l     d1
  009d92  2001                 move.l    d1, d0
  009d94  7248                 moveq     #$48, d1
  009d96  b081                 cmp.l     d1, d0
  009d98  6f5a                 ble.b     $9df4
  009d9a  3007                 move.w    d7, d0
  009d9c  48c0                 ext.l     d0
  009d9e  3205                 move.w    d5, d1
  009da0  48c1                 ext.l     d1
  009da2  9280                 sub.l     d0, d1
  009da4  4a81                 tst.l     d1
  009da6  6f26                 ble.b     $9dce
  009da8  3006                 move.w    d6, d0
  009daa  48c0                 ext.l     d0
  009dac  3204                 move.w    d4, d1
  009dae  48c1                 ext.l     d1
  009db0  9280                 sub.l     d0, d1
  009db2  4a81                 tst.l     d1
  009db4  6f0c                 ble.b     $9dc2
  009db6  33fc000500013c20     move.w    #$5, $13c20.l   ; scrollDir
  009dbe  60000180             bra.w     $9f40
  009dc2  33fc000700013c20     move.w    #$7, $13c20.l   ; scrollDir
  009dca  60000174             bra.w     $9f40
  009dce  3006                 move.w    d6, d0
  009dd0  48c0                 ext.l     d0
  009dd2  3204                 move.w    d4, d1
  009dd4  48c1                 ext.l     d1
  009dd6  9280                 sub.l     d0, d1
  009dd8  4a81                 tst.l     d1
  009dda  6f0c                 ble.b     $9de8
  009ddc  33fc000600013c20     move.w    #$6, $13c20.l   ; scrollDir
  009de4  6000015a             bra.w     $9f40
  009de8  33fc000800013c20     move.w    #$8, $13c20.l   ; scrollDir
  009df0  6000014e             bra.w     $9f40
  009df4  3007                 move.w    d7, d0
  009df6  48c0                 ext.l     d0
  009df8  3205                 move.w    d5, d1
  009dfa  48c1                 ext.l     d1
  009dfc  9280                 sub.l     d0, d1
  009dfe  4a81                 tst.l     d1
  009e00  6f0c                 ble.b     $9e0e
  009e02  33fc000300013c20     move.w    #$3, $13c20.l   ; scrollDir
  009e0a  60000134             bra.w     $9f40
  009e0e  33fc000400013c20     move.w    #$4, $13c20.l   ; scrollDir
  009e16  60000128             bra.w     $9f40
  009e1a  0c7900030000617a     cmpi.w    #$3, $617a.l   ; prefScrollMode
  009e22  661a                 bne.b     $9e3e
  009e24  7610                 moveq     #$10, d3
  009e26  0c79000c00013c22     cmpi.w    #$c, $13c22.l   ; scrollStepCount
  009e2e  670a                 beq.b     $9e3a
  009e30  0c79000100013c22     cmpi.w    #$1, $13c22.l   ; scrollStepCount
  009e38  6626                 bne.b     $9e60
  009e3a  e243                 asr.w     #$1, d3
  009e3c  6022                 bra.b     $9e60
  009e3e  0c7900040000617a     cmpi.w    #$4, $617a.l   ; prefScrollMode
  009e46  6618                 bne.b     $9e60
  009e48  7620                 moveq     #$20, d3
  009e4a  0c79000600013c22     cmpi.w    #$6, $13c22.l   ; scrollStepCount
  009e52  670a                 beq.b     $9e5e
  009e54  0c79000100013c22     cmpi.w    #$1, $13c22.l   ; scrollStepCount
  009e5c  6602                 bne.b     $9e60
  009e5e  e243                 asr.w     #$1, d3
  009e60  33fc000200013c24     move.w    #$2, $13c24.l   ; scrollCooldown
  009e68  537900013c22         subq.w    #$1, $13c22.l   ; scrollStepCount
  009e6e  303900013c20         move.w    $13c20.l, d0   ; scrollDir
  009e74  48c0                 ext.l     d0
  009e76  0c8000000008         cmpi.l    #$8, d0
  009e7c  6270                 bhi.b     $9eee
  009e7e  303b0206             move.w    $9e86(pc, d0.w * 2), d0
  009e82  4efb0002             jmp       $9e86(pc, d0.w)
  009e86  00680012001a0022002a00320040004e cases     0:$9eee 1:$9e98 2:$9ea0 3:$9ea8 4:$9eb0 5:$9eb8 6:$9ec6 7:$9ed4
  009e96  005c                 cases     8:$9ee2
  009e98  d7790000806a         add.w     d3, $806a.l   ; viewLeft
  009e9e  604e                 bra.b     $9eee
  009ea0  97790000806a         sub.w     d3, $806a.l   ; viewLeft
  009ea6  6046                 bra.b     $9eee
  009ea8  d77900008068         add.w     d3, $8068.l   ; viewTop
  009eae  603e                 bra.b     $9eee
  009eb0  977900008068         sub.w     d3, $8068.l   ; viewTop
  009eb6  6036                 bra.b     $9eee
  009eb8  d77900008068         add.w     d3, $8068.l   ; viewTop
  009ebe  d7790000806a         add.w     d3, $806a.l   ; viewLeft
  009ec4  6028                 bra.b     $9eee
  009ec6  977900008068         sub.w     d3, $8068.l   ; viewTop
  009ecc  d7790000806a         add.w     d3, $806a.l   ; viewLeft
  009ed2  601a                 bra.b     $9eee
  009ed4  d77900008068         add.w     d3, $8068.l   ; viewTop
  009eda  97790000806a         sub.w     d3, $806a.l   ; viewLeft
  009ee0  600c                 bra.b     $9eee
  009ee2  977900008068         sub.w     d3, $8068.l   ; viewTop
  009ee8  97790000806a         sub.w     d3, $806a.l   ; viewLeft
  009eee  4a7900013c22         tst.w     $13c22.l   ; scrollStepCount
  009ef4  6612                 bne.b     $9f08
  009ef6  0c7900040000617a     cmpi.w    #$4, $617a.l   ; prefScrollMode
  009efe  6608                 bne.b     $9f08
  009f00  13fc000100013c2f     move.b    #$1, $13c2f.l   ; g_13c2f
  009f08  4a3900006174         tst.b     $6174.l   ; prefInterlace
  009f0e  671a                 beq.b     $9f2a
  009f10  4a3900006175         tst.b     $6175.l   ; prefLineSkip
  009f16  6712                 beq.b     $9f2a
  009f18  4a7900013c22         tst.w     $13c22.l   ; scrollStepCount
  009f1e  660a                 bne.b     $9f2a
  009f20  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  009f28  6016                 bra.b     $9f40
  009f2a  4a3900006174         tst.b     $6174.l   ; prefInterlace
  009f30  670e                 beq.b     $9f40
  009f32  4a7900013c22         tst.w     $13c22.l   ; scrollStepCount
  009f38  6606                 bne.b     $9f40
  009f3a  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  009f40  4a3900006174         tst.b     $6174.l   ; prefInterlace
  009f46  6712                 beq.b     $9f5a
  009f48  303900008068         move.w    $8068.l, d0   ; viewTop
  009f4e  48c0                 ext.l     d0
  009f50  e280                 asr.l     #$1, d0
  009f52  d080                 add.l     d0, d0
  009f54  33c000008068         move.w    d0, $8068.l   ; viewTop
  009f5a  4a79000080c0         tst.w     $80c0.l   ; screenShake
  009f60  6f3e                 ble.b     $9fa0
  009f62  0c7900030000617a     cmpi.w    #$3, $617a.l   ; prefScrollMode
  009f6a  6c2e                 bge.b     $9f9a
  009f6c  3039000080c0         move.w    $80c0.l, d0   ; screenShake
  009f72  7201                 moveq     #$1, d1
  009f74  c081                 and.l     d1, d0
  009f76  6712                 beq.b     $9f8a
  009f78  3039000080c0         move.w    $80c0.l, d0   ; screenShake
  009f7e  48c0                 ext.l     d0
  009f80  e280                 asr.l     #$1, d0
  009f82  91790000806a         sub.w     d0, $806a.l   ; viewLeft
  009f88  6010                 bra.b     $9f9a
  009f8a  3039000080c0         move.w    $80c0.l, d0   ; screenShake
  009f90  48c0                 ext.l     d0
  009f92  e280                 asr.l     #$1, d0
  009f94  d1790000806a         add.w     d0, $806a.l   ; viewLeft
  009f9a  5379000080c0         subq.w    #$1, $80c0.l   ; screenShake
  009fa0  3006                 move.w    d6, d0
  009fa2  48c0                 ext.l     d0
  009fa4  0680ffffff3c         addi.l    #$ffffff3c, d0
  009faa  3204                 move.w    d4, d1
  009fac  48c1                 ext.l     d1
  009fae  b280                 cmp.l     d0, d1
  009fb0  6c16                 bge.b     $9fc8
  009fb2  3004                 move.w    d4, d0
  009fb4  48c0                 ext.l     d0
  009fb6  3206                 move.w    d6, d1
  009fb8  48c1                 ext.l     d1
  009fba  0681ffffff3c         addi.l    #$ffffff3c, d1
  009fc0  9280                 sub.l     d0, d1
  009fc2  d3790000806a         add.w     d1, $806a.l   ; viewLeft
  009fc8  3006                 move.w    d6, d0
  009fca  48c0                 ext.l     d0
  009fcc  0680000000c4         addi.l    #$c4, d0
  009fd2  3204                 move.w    d4, d1
  009fd4  48c1                 ext.l     d1
  009fd6  b280                 cmp.l     d0, d1
  009fd8  6f16                 ble.b     $9ff0
  009fda  3006                 move.w    d6, d0
  009fdc  48c0                 ext.l     d0
  009fde  0680000000c4         addi.l    #$c4, d0
  009fe4  3204                 move.w    d4, d1
  009fe6  48c1                 ext.l     d1
  009fe8  9280                 sub.l     d0, d1
  009fea  93790000806a         sub.w     d1, $806a.l   ; viewLeft
  009ff0  3007                 move.w    d7, d0
  009ff2  48c0                 ext.l     d0
  009ff4  0680ffffff3c         addi.l    #$ffffff3c, d0
  009ffa  3205                 move.w    d5, d1
  009ffc  48c1                 ext.l     d1
  009ffe  b280                 cmp.l     d0, d1
  00a000  6c16                 bge.b     $a018
  00a002  3005                 move.w    d5, d0
  00a004  48c0                 ext.l     d0
  00a006  3207                 move.w    d7, d1
  00a008  48c1                 ext.l     d1
  00a00a  0681ffffff3c         addi.l    #$ffffff3c, d1
  00a010  9280                 sub.l     d0, d1
  00a012  d37900008068         add.w     d1, $8068.l   ; viewTop
  00a018  3007                 move.w    d7, d0
  00a01a  48c0                 ext.l     d0
  00a01c  0680000000c4         addi.l    #$c4, d0
  00a022  3205                 move.w    d5, d1
  00a024  48c1                 ext.l     d1
  00a026  b280                 cmp.l     d0, d1
  00a028  6f16                 ble.b     $a040
  00a02a  3007                 move.w    d7, d0
  00a02c  48c0                 ext.l     d0
  00a02e  0680000000c4         addi.l    #$c4, d0
  00a034  3205                 move.w    d5, d1
  00a036  48c1                 ext.l     d1
  00a038  9280                 sub.l     d0, d1
  00a03a  937900008068         sub.w     d1, $8068.l   ; viewTop
  00a040  4a790000806a         tst.w     $806a.l   ; viewLeft
  00a046  6c08                 bge.b     $a050
  00a048  42790000806a         clr.w     $806a.l   ; viewLeft
  00a04e  6012                 bra.b     $a062
  00a050  0c790e400000806a     cmpi.w    #$e40, $806a.l   ; viewLeft
  00a058  6f08                 ble.b     $a062
  00a05a  33fc0e400000806a     move.w    #$e40, $806a.l   ; viewLeft
  00a062  4a7900008068         tst.w     $8068.l   ; viewTop
  00a068  6c08                 bge.b     $a072
  00a06a  427900008068         clr.w     $8068.l   ; viewTop
  00a070  6012                 bra.b     $a084
  00a072  0c790e4000008068     cmpi.w    #$e40, $8068.l   ; viewTop
  00a07a  6f08                 ble.b     $a084
  00a07c  33fc0e4000008068     move.w    #$e40, $8068.l   ; viewTop
  00a084  4cdf00f8             movem.l   (a7)+, d3-d7
  00a088  4e5e                 unlk      a6
  00a08a  4e75                 rts       

;-------------------------------------------------------------
; AbortGame   (seg 1 +00a0a2, 100 bytes)
  00a0a2  4e560000             link.w    a6, #$0
  00a0a6  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00a0ac  201f                 move.l    (a7)+, d0
  00a0ae  a032                 _FlushEvents 
  00a0b0  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00a0b6  61ffffffc152         bsr.l     $620a   ; ConfirmAbortGameDialog
  00a0bc  4a00                 tst.b     d0
  00a0be  6720                 beq.b     $a0e0
  00a0c0  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a0c6  13fc0001000046ce     move.b    #$1, $46ce.l   ; levelDone
  00a0ce  423900007f1d         clr.b     $7f1d.l   ; g_7f1d
  00a0d4  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00a0da  201f                 move.l    (a7)+, d0
  00a0dc  a032                 _FlushEvents 
  00a0de  6022                 bra.b     $a102
  00a0e0  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a0e6  4a3900007f1d         tst.b     $7f1d.l   ; g_7f1d
  00a0ec  6614                 bne.b     $a102
  00a0ee  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00a0f4  4a3900006174         tst.b     $6174.l   ; prefInterlace
  00a0fa  6706                 beq.b     $a102
  00a0fc  4eb9000009a8         jsr       $9a8.l   ; DrawBlackLines
  00a102  4e5e                 unlk      a6
  00a104  4e75                 rts       

;-------------------------------------------------------------
; DoSaveGame   (seg 1 +00a112, 302 bytes)
  00a112  4e560000             link.w    a6, #$0
  00a116  2f03                 move.l    d3, -(a7)
  00a118  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00a11e  201f                 move.l    (a7)+, d0
  00a120  a032                 _FlushEvents 
  00a122  207900007470         movea.l   $7470.l, a0   ; hSave
  00a128  2050                 movea.l   (a0), a0
  00a12a  48685518             pea.l     $5518(a0)
  00a12e  487900007f64         pea.l     $7f64.l   ; g_7f64
  00a134  4eb900000a88         jsr       $a88.l   ; CopyPString
  00a13a  207900007468         movea.l   $7468.l, a0   ; hWorld
  00a140  2050                 movea.l   (a0), a0
  00a142  227900007470         movea.l   $7470.l, a1   ; hSave
  00a148  2251                 movea.l   (a1), a1
  00a14a  22a80100             move.l    $100(a0), (a1)
  00a14e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a154  2050                 movea.l   (a0), a0
  00a156  41e84050             lea.l     $4050(a0), a0
  00a15a  20b8020c             move.l    $20c.w, (a0)
  00a15e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a164  2050                 movea.l   (a0), a0
  00a166  3179000080660006     move.w    $8066.l, $6(a0)   ; curLevel
  00a16e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a174  2050                 movea.l   (a0), a0
  00a176  31790000f6c4000c     move.w    $f6c4.l, $c(a0)   ; g_f6c4
  00a17e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a184  2050                 movea.l   (a0), a0
  00a186  31790000f6c6000e     move.w    $f6c6.l, $e(a0)   ; g_f6c6
  00a18e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a194  2050                 movea.l   (a0), a0
  00a196  31790000f6c80010     move.w    $f6c8.l, $10(a0)   ; g_f6c8
  00a19e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a1a4  2050                 movea.l   (a0), a0
  00a1a6  21790000f6c00008     move.l    $f6c0.l, $8(a0)   ; g_f6c0
  00a1ae  207900007470         movea.l   $7470.l, a0   ; hSave
  00a1b4  2050                 movea.l   (a0), a0
  00a1b6  31790000f6d00048     move.w    $f6d0.l, $48(a0)   ; g_f6d0
  00a1be  207900007470         movea.l   $7470.l, a0   ; hSave
  00a1c4  2050                 movea.l   (a0), a0
  00a1c6  31790000f6d2004a     move.w    $f6d2.l, $4a(a0)   ; g_f6d2
  00a1ce  207900007470         movea.l   $7470.l, a0   ; hSave
  00a1d4  2050                 movea.l   (a0), a0
  00a1d6  31790000f6d4004c     move.w    $f6d4.l, $4c(a0)   ; g_f6d4
  00a1de  7600                 moveq     #$0, d3
  00a1e0  504f                 addq.w    #$8, a7
  00a1e2  6018                 bra.b     $a1fc
  00a1e4  41f90000f6d8         lea.l     $f6d8.l, a0   ; g_f6d8
  00a1ea  227900007470         movea.l   $7470.l, a1   ; hSave
  00a1f0  2011                 move.l    (a1), d0
  00a1f2  2240                 movea.l   d0, a1
  00a1f4  23b034003412         move.l    (a0, d3.w * 4), $12(a1, d3.w * 4)
  00a1fa  5243                 addq.w    #$1, d3
  00a1fc  0c43000c             cmpi.w    #$c, d3
  00a200  6de2                 blt.b     $a1e4
  00a202  4eb900000ca0         jsr       $ca0.l   ; SaveSG
  00a208  4a3900007f1d         tst.b     $7f1d.l   ; g_7f1d
  00a20e  6708                 beq.b     $a218
  00a210  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a216  6022                 bra.b     $a23a
  00a218  61ffffffb8ea         bsr.l     $5b04   ; RestoreWindowBackground
  00a21e  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a224  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00a22a  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  00a232  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00a23a  261f                 move.l    (a7)+, d3
  00a23c  4e5e                 unlk      a6
  00a23e  4e75                 rts       

;-------------------------------------------------------------
; DoCopierSaveGame   (seg 1 +00a24e, 756 bytes)
  00a24e  4e560000             link.w    a6, #$0
  00a252  48e71800             movem.l   d3-d4, -(a7)
  00a256  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00a25c  201f                 move.l    (a7)+, d0
  00a25e  a032                 _FlushEvents 
  00a260  207900007468         movea.l   $7468.l, a0   ; hWorld
  00a266  2050                 movea.l   (a0), a0
  00a268  227900007470         movea.l   $7470.l, a1   ; hSave
  00a26e  2251                 movea.l   (a1), a1
  00a270  22a80100             move.l    $100(a0), (a1)
  00a274  207900007470         movea.l   $7470.l, a0   ; hSave
  00a27a  2050                 movea.l   (a0), a0
  00a27c  41e84050             lea.l     $4050(a0), a0
  00a280  20b8020c             move.l    $20c.w, (a0)
  00a284  207900007470         movea.l   $7470.l, a0   ; hSave
  00a28a  2050                 movea.l   (a0), a0
  00a28c  117c00010004         move.b    #$1, $4(a0)
  00a292  207900007470         movea.l   $7470.l, a0   ; hSave
  00a298  2050                 movea.l   (a0), a0
  00a29a  3179000080660006     move.w    $8066.l, $6(a0)   ; curLevel
  00a2a2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2a8  2050                 movea.l   (a0), a0
  00a2aa  3179000046c4000c     move.w    $46c4.l, $c(a0)   ; g_46c4
  00a2b2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2b8  2050                 movea.l   (a0), a0
  00a2ba  3179000046c2000e     move.w    $46c2.l, $e(a0)   ; g_46c2
  00a2c2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2c8  2050                 movea.l   (a0), a0
  00a2ca  3179000046c00010     move.w    $46c0.l, $10(a0)   ; g_46c0
  00a2d2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2d8  2050                 movea.l   (a0), a0
  00a2da  21790000807a0008     move.l    $807a.l, $8(a0)   ; g_807a
  00a2e2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2e8  2050                 movea.l   (a0), a0
  00a2ea  3179000080820048     move.w    $8082.l, $48(a0)   ; g_8082
  00a2f2  207900007470         movea.l   $7470.l, a0   ; hSave
  00a2f8  2050                 movea.l   (a0), a0
  00a2fa  317900008084004a     move.w    $8084.l, $4a(a0)   ; g_8084
  00a302  207900007470         movea.l   $7470.l, a0   ; hSave
  00a308  2050                 movea.l   (a0), a0
  00a30a  317900008086004c     move.w    $8086.l, $4c(a0)   ; g_8086
  00a312  33f9000046c40000f6c4 move.w    $46c4.l, $f6c4.l   ; g_46c4, g_f6c4
  00a31c  33f9000046c20000f6c6 move.w    $46c2.l, $f6c6.l   ; g_46c2, g_f6c6
  00a326  33f9000046c00000f6c8 move.w    $46c0.l, $f6c8.l   ; g_46c0, g_f6c8
  00a330  23f90000807a0000f6c0 move.l    $807a.l, $f6c0.l   ; g_807a, g_f6c0
  00a33a  33f9000080820000f6d0 move.w    $8082.l, $f6d0.l   ; g_8082, g_f6d0
  00a344  33f9000080840000f6d2 move.w    $8084.l, $f6d2.l   ; g_8084, g_f6d2
  00a34e  33f9000080860000f6d4 move.w    $8086.l, $f6d4.l   ; g_8086, g_f6d4
  00a358  207900007470         movea.l   $7470.l, a0   ; hSave
  00a35e  2050                 movea.l   (a0), a0
  00a360  3179000080740042     move.w    $8074.l, $42(a0)   ; playerH
  00a368  207900007470         movea.l   $7470.l, a0   ; hSave
  00a36e  2050                 movea.l   (a0), a0
  00a370  3179000080760044     move.w    $8076.l, $44(a0)   ; playerV
  00a378  207900008070         movea.l   $8070.l, a0   ; playerSprite
  00a37e  227900007470         movea.l   $7470.l, a1   ; hSave
  00a384  2251                 movea.l   (a1), a1
  00a386  336800660046         move.w    $66(a0), $46(a1)
  00a38c  7600                 moveq     #$0, d3
  00a38e  6052                 bra.b     $a3e2
  00a390  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00a396  227900007470         movea.l   $7470.l, a1   ; hSave
  00a39c  2011                 move.l    (a1), d0
  00a39e  2240                 movea.l   d0, a1
  00a3a0  33b034003412         move.w    (a0, d3.w * 4), $12(a1, d3.w * 4)
  00a3a6  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00a3ac  227900007470         movea.l   $7470.l, a1   ; hSave
  00a3b2  2011                 move.l    (a1), d0
  00a3b4  2240                 movea.l   d0, a1
  00a3b6  33b034023414         move.w    $2(a0, d3.w * 4), $14(a1, d3.w * 4)
  00a3bc  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00a3c2  43f90000f6d8         lea.l     $f6d8.l, a1   ; g_f6d8
  00a3c8  33b034003400         move.w    (a0, d3.w * 4), (a1, d3.w * 4)
  00a3ce  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00a3d4  43f90000f6d8         lea.l     $f6d8.l, a1   ; g_f6d8
  00a3da  33b034023402         move.w    $2(a0, d3.w * 4), $2(a1, d3.w * 4)
  00a3e0  5243                 addq.w    #$1, d3
  00a3e2  0c43000c             cmpi.w    #$c, d3
  00a3e6  6da8                 blt.b     $a390
  00a3e8  7600                 moveq     #$0, d3
  00a3ea  6032                 bra.b     $a41e
  00a3ec  7800                 moveq     #$0, d4
  00a3ee  6026                 bra.b     $a416
  00a3f0  3043                 movea.w   d3, a0
  00a3f2  2008                 move.l    a0, d0
  00a3f4  ef88                 lsl.l     #$7, d0
  00a3f6  41f90000fc12         lea.l     $fc12.l, a0   ; trackMap
  00a3fc  d1c0                 adda.l    d0, a0
  00a3fe  3243                 movea.w   d3, a1
  00a400  2009                 move.l    a1, d0
  00a402  ef88                 lsl.l     #$7, d0
  00a404  227900007470         movea.l   $7470.l, a1   ; hSave
  00a40a  2251                 movea.l   (a1), a1
  00a40c  d3c0                 adda.l    d0, a1
  00a40e  13b04000404e         move.b    (a0, d4.w), $4e(a1, d4.w)
  00a414  5244                 addq.w    #$1, d4
  00a416  0c440080             cmpi.w    #$80, d4
  00a41a  6dd4                 blt.b     $a3f0
  00a41c  5243                 addq.w    #$1, d3
  00a41e  0c430080             cmpi.w    #$80, d3
  00a422  6dc8                 blt.b     $a3ec
  00a424  7600                 moveq     #$0, d3
  00a426  605c                 bra.b     $a484
  00a428  3043                 movea.w   d3, a0
  00a42a  2008                 move.l    a0, d0
  00a42c  e988                 lsl.l     #$4, d0
  00a42e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00a434  2050                 movea.l   (a0), a0
  00a436  d1c0                 adda.l    d0, a0
  00a438  d1fc00010000         adda.l    #$10000, a0
  00a43e  3243                 movea.w   d3, a1
  00a440  2009                 move.l    a1, d0
  00a442  e988                 lsl.l     #$4, d0
  00a444  227900007470         movea.l   $7470.l, a1   ; hSave
  00a44a  2251                 movea.l   (a1), a1
  00a44c  d3c0                 adda.l    d0, a1
  00a44e  43e94058             lea.l     $4058(a1), a1
  00a452  22d8                 move.l    (a0)+, (a1)+
  00a454  22d8                 move.l    (a0)+, (a1)+
  00a456  22d8                 move.l    (a0)+, (a1)+
  00a458  22d8                 move.l    (a0)+, (a1)+
  00a45a  3043                 movea.w   d3, a0
  00a45c  2008                 move.l    a0, d0
  00a45e  e988                 lsl.l     #$4, d0
  00a460  207900007470         movea.l   $7470.l, a0   ; hSave
  00a466  2050                 movea.l   (a0), a0
  00a468  d1c0                 adda.l    d0, a0
  00a46a  5d684066             subq.w    #$6, $4066(a0)
  00a46e  3043                 movea.w   d3, a0
  00a470  2008                 move.l    a0, d0
  00a472  e988                 lsl.l     #$4, d0
  00a474  207900007470         movea.l   $7470.l, a0   ; hSave
  00a47a  2050                 movea.l   (a0), a0
  00a47c  d1c0                 adda.l    d0, a0
  00a47e  5d684064             subq.w    #$6, $4064(a0)
  00a482  5243                 addq.w    #$1, d3
  00a484  0c430100             cmpi.w    #$100, d3
  00a488  6d9e                 blt.b     $a428
  00a48a  7600                 moveq     #$0, d3
  00a48c  6030                 bra.b     $a4be
  00a48e  7034                 moveq     #$34, d0
  00a490  c1c3                 muls.w    d3, d0
  00a492  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00a498  2050                 movea.l   (a0), a0
  00a49a  d1c0                 adda.l    d0, a0
  00a49c  d1fc00011000         adda.l    #$11000, a0
  00a4a2  7034                 moveq     #$34, d0
  00a4a4  c1c3                 muls.w    d3, d0
  00a4a6  227900007470         movea.l   $7470.l, a1   ; hSave
  00a4ac  2251                 movea.l   (a1), a1
  00a4ae  d3c0                 adda.l    d0, a1
  00a4b0  43e95058             lea.l     $5058(a1), a1
  00a4b4  700c                 moveq     #$c, d0
  00a4b6  22d8                 move.l    (a0)+, (a1)+
  00a4b8  51c8fffc             dbra      d0, $a4b6
  00a4bc  5243                 addq.w    #$1, d3
  00a4be  0c430010             cmpi.w    #$10, d3
  00a4c2  6dca                 blt.b     $a48e
  00a4c4  7600                 moveq     #$0, d3
  00a4c6  6030                 bra.b     $a4f8
  00a4c8  7018                 moveq     #$18, d0
  00a4ca  c1c3                 muls.w    d3, d0
  00a4cc  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00a4d2  2050                 movea.l   (a0), a0
  00a4d4  d1c0                 adda.l    d0, a0
  00a4d6  d1fc00011340         adda.l    #$11340, a0
  00a4dc  7018                 moveq     #$18, d0
  00a4de  c1c3                 muls.w    d3, d0
  00a4e0  227900007470         movea.l   $7470.l, a1   ; hSave
  00a4e6  2251                 movea.l   (a1), a1
  00a4e8  d3c0                 adda.l    d0, a1
  00a4ea  43e95398             lea.l     $5398(a1), a1
  00a4ee  7005                 moveq     #$5, d0
  00a4f0  22d8                 move.l    (a0)+, (a1)+
  00a4f2  51c8fffc             dbra      d0, $a4f0
  00a4f6  5243                 addq.w    #$1, d3
  00a4f8  0c430010             cmpi.w    #$10, d3
  00a4fc  6dca                 blt.b     $a4c8
  00a4fe  4eb900000ca0         jsr       $ca0.l   ; SaveSG
  00a504  1600                 move.b    d0, d3
  00a506  4a3900007f1d         tst.b     $7f1d.l   ; g_7f1d
  00a50c  6708                 beq.b     $a516
  00a50e  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a514  6022                 bra.b     $a538
  00a516  61ffffffb5ec         bsr.l     $5b04   ; RestoreWindowBackground
  00a51c  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a522  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  00a52a  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00a532  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00a538  1003                 move.b    d3, d0
  00a53a  4cdf0018             movem.l   (a7)+, d3-d4
  00a53e  4e5e                 unlk      a6
  00a540  4e75                 rts       

;-------------------------------------------------------------
; CopierSave   (seg 1 +00a556, 232 bytes)
  00a556  4e56fff0             link.w    a6, #$fff0
  00a55a  48e71820             movem.l   d3-d4/a2, -(a7)
  00a55e  7600                 moveq     #$0, d3
  00a560  7800                 moveq     #$0, d4
  00a562  61ffffffb5a0         bsr.l     $5b04   ; RestoreWindowBackground
  00a568  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00a56e  594f                 subq.w    #$4, a7
  00a570  3f3c00a0             move.w    #$a0, -(a7)
  00a574  42a7                 clr.l     -(a7)
  00a576  4878ffff             pea.l     $ffff.w
  00a57a  a97c                 _GetNewDialog 
  00a57c  205f                 movea.l   (a7)+, a0
  00a57e  2448                 movea.l   a0, a2
  00a580  2f0a                 move.l    a2, -(a7)
  00a582  a873                 _SetPort  
  00a584  2f0a                 move.l    a2, -(a7)
  00a586  a922                 _BeginUpdate 
  00a588  2f0a                 move.l    a2, -(a7)
  00a58a  3f3c0001             move.w    #$1, -(a7)
  00a58e  486efff4             pea.l     -$c(a6)
  00a592  486efff0             pea.l     -$10(a6)
  00a596  486efff6             pea.l     -$a(a6)
  00a59a  a98d                 _GetDialogItem 
  00a59c  486efff6             pea.l     -$a(a6)
  00a5a0  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00a5a6  a8a9                 _InsetRect 
  00a5a8  2f3c00030003         move.l    #$30003, -(a7)
  00a5ae  a89b                 _PenSize  
  00a5b0  486efff6             pea.l     -$a(a6)
  00a5b4  2f3c000f000f         move.l    #$f000f, -(a7)
  00a5ba  a8b0                 _FrameRoundRect 
  00a5bc  2f0a                 move.l    a2, -(a7)
  00a5be  a923                 _EndUpdate 
  00a5c0  2f0a                 move.l    a2, -(a7)
  00a5c2  a981                 _DrawDialog 
  00a5c4  2f0a                 move.l    a2, -(a7)
  00a5c6  a915                 _ShowWindow 
  00a5c8  2f0a                 move.l    a2, -(a7)
  00a5ca  a91f                 _SelectWindow 
  00a5cc  6020                 bra.b     $a5ee
  00a5ce  42a7                 clr.l     -(a7)
  00a5d0  486efffe             pea.l     -$2(a6)
  00a5d4  a991                 _ModalDialog 
  00a5d6  302efffe             move.w    -$2(a6), d0
  00a5da  48c0                 ext.l     d0
  00a5dc  5380                 subq.l    #$1, d0
  00a5de  6706                 beq.b     $a5e6
  00a5e0  5380                 subq.l    #$1, d0
  00a5e2  6706                 beq.b     $a5ea
  00a5e4  6008                 bra.b     $a5ee
  00a5e6  7601                 moveq     #$1, d3
  00a5e8  6004                 bra.b     $a5ee
  00a5ea  7601                 moveq     #$1, d3
  00a5ec  7801                 moveq     #$1, d4
  00a5ee  4a03                 tst.b     d3
  00a5f0  67dc                 beq.b     $a5ce
  00a5f2  2f0a                 move.l    a2, -(a7)
  00a5f4  a983                 _DisposeDialog 
  00a5f6  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a5fc  4eb900000300         jsr       $300.l   ; REDRAWWHOLEGRID
  00a602  4a04                 tst.b     d4
  00a604  6712                 beq.b     $a618
  00a606  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  00a60c  7600                 moveq     #$0, d3
  00a60e  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00a616  601c                 bra.b     $a634
  00a618  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00a61e  61fffffffc2e         bsr.l     $a24e   ; DoCopierSaveGame
  00a624  1600                 move.b    d0, d3
  00a626  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  00a62c  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00a634  1003                 move.b    d3, d0
  00a636  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00a63a  4e5e                 unlk      a6
  00a63c  4e75                 rts       

;-------------------------------------------------------------
; ContinueGame   (seg 1 +00a64c, 2018 bytes)
  00a64c  4e56fffe             link.w    a6, #$fffe
  00a650  48e71800             movem.l   d3-d4, -(a7)
  00a654  7600                 moveq     #$0, d3
  00a656  7801                 moveq     #$1, d4
  00a658  1d7c0001ffff         move.b    #$1, -$1(a6)
  00a65e  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00a664  201f                 move.l    (a7)+, d0
  00a666  a032                 _FlushEvents 
  00a668  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00a66e  a915                 _ShowWindow 
  00a670  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00a676  a91f                 _SelectWindow 
  00a678  61ffffff7036         bsr.l     $16b0   ; InitGameGlobals
  00a67e  2f2e0008             move.l    $8(a6), -(a7)
  00a682  4eb900000ca8         jsr       $ca8.l   ; OpenSG
  00a688  4a00                 tst.b     d0
  00a68a  584f                 addq.w    #$4, a7
  00a68c  67000792             beq.w     $ae20
  00a690  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a696  4eb900000aa8         jsr       $aa8.l   ; KillAllSprites
  00a69c  207900007470         movea.l   $7470.l, a0   ; hSave
  00a6a2  2050                 movea.l   (a0), a0
  00a6a4  0c900b07cf71         cmpi.l    #$b07cf71, (a0)
  00a6aa  57c0                 seq.b     d0
  00a6ac  4400                 neg.b     d0
  00a6ae  49c0                 extb.l    d0
  00a6b0  13c000007f22         move.b    d0, $7f22.l   ; g_7f22
  00a6b6  207900007470         movea.l   $7470.l, a0   ; hSave
  00a6bc  2050                 movea.l   (a0), a0
  00a6be  33e8000600013c1e     move.w    $6(a0), $13c1e.l   ; curLevel2
  00a6c6  33e8000600008066     move.w    $6(a0), $8066.l   ; curLevel
  00a6ce  207900007470         movea.l   $7470.l, a0   ; hSave
  00a6d4  2050                 movea.l   (a0), a0
  00a6d6  33e8000c000046be     move.w    $c(a0), $46be.l   ; g_46be
  00a6de  33e8000c0000f6c4     move.w    $c(a0), $f6c4.l   ; g_f6c4
  00a6e6  33e8000c000046c4     move.w    $c(a0), $46c4.l   ; g_46c4
  00a6ee  207900007470         movea.l   $7470.l, a0   ; hSave
  00a6f4  2050                 movea.l   (a0), a0
  00a6f6  23e800080000807e     move.l    $8(a0), $807e.l   ; g_807e
  00a6fe  23e800080000f6c0     move.l    $8(a0), $f6c0.l   ; g_f6c0
  00a706  23e800080000807a     move.l    $8(a0), $807a.l   ; g_807a
  00a70e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a714  2050                 movea.l   (a0), a0
  00a716  33e80010000046ba     move.w    $10(a0), $46ba.l   ; g_46ba
  00a71e  33e800100000f6c8     move.w    $10(a0), $f6c8.l   ; g_f6c8
  00a726  33e80010000046c0     move.w    $10(a0), $46c0.l   ; g_46c0
  00a72e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a734  2050                 movea.l   (a0), a0
  00a736  33e8000e000046bc     move.w    $e(a0), $46bc.l   ; g_46bc
  00a73e  33e8000e0000f6c6     move.w    $e(a0), $f6c6.l   ; g_f6c6
  00a746  33e8000e000046c2     move.w    $e(a0), $46c2.l   ; g_46c2
  00a74e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a754  2050                 movea.l   (a0), a0
  00a756  33e800480000f6d0     move.w    $48(a0), $f6d0.l   ; g_f6d0
  00a75e  33e8004800008082     move.w    $48(a0), $8082.l   ; g_8082
  00a766  207900007470         movea.l   $7470.l, a0   ; hSave
  00a76c  2050                 movea.l   (a0), a0
  00a76e  33e8004a0000f6d2     move.w    $4a(a0), $f6d2.l   ; g_f6d2
  00a776  33e8004a00008084     move.w    $4a(a0), $8084.l   ; g_8084
  00a77e  207900007470         movea.l   $7470.l, a0   ; hSave
  00a784  2050                 movea.l   (a0), a0
  00a786  33e8004c0000f6d4     move.w    $4c(a0), $f6d4.l   ; g_f6d4
  00a78e  33e8004c00008086     move.w    $4c(a0), $8086.l   ; g_8086
  00a796  7600                 moveq     #$0, d3
  00a798  602a                 bra.b     $a7c4
  00a79a  207900007470         movea.l   $7470.l, a0   ; hSave
  00a7a0  2250                 movea.l   (a0), a1
  00a7a2  41f900008090         lea.l     $8090.l, a0   ; g_8090
  00a7a8  21b134123400         move.l    $12(a1, d3.w * 4), (a0, d3.w * 4)
  00a7ae  207900007470         movea.l   $7470.l, a0   ; hSave
  00a7b4  2250                 movea.l   (a0), a1
  00a7b6  41f90000f6d8         lea.l     $f6d8.l, a0   ; g_f6d8
  00a7bc  21b134123400         move.l    $12(a1, d3.w * 4), (a0, d3.w * 4)
  00a7c2  5243                 addq.w    #$1, d3
  00a7c4  0c43000c             cmpi.w    #$c, d3
  00a7c8  6dd0                 blt.b     $a79a
  00a7ca  13fc000100007f1e     move.b    #$1, $7f1e.l   ; g_7f1e
  00a7d2  0c79000600008066     cmpi.w    #$6, $8066.l   ; curLevel
  00a7da  6c08                 bge.b     $a7e4
  00a7dc  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  00a7e2  662a                 bne.b     $a80e
  00a7e4  486effff             pea.l     -$1(a6)
  00a7e8  4eb900000150         jsr       $150.l   ; seg7+609a
  00a7ee  3600                 move.w    d0, d3
  00a7f0  4a43                 tst.w     d3
  00a7f2  584f                 addq.w    #$4, a7
  00a7f4  6618                 bne.b     $a80e
  00a7f6  4a2effff             tst.b     -$1(a6)
  00a7fa  6704                 beq.b     $a800
  00a7fc  7801                 moveq     #$1, d4
  00a7fe  600e                 bra.b     $a80e
  00a800  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00a806  61ff00002036         bsr.l     $c83e   ; LevelLimit
  00a80c  7800                 moveq     #$0, d4
  00a80e  4a04                 tst.b     d4
  00a810  660a                 bne.b     $a81c
  00a812  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a818  6000060c             bra.w     $ae26
  00a81c  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  00a822  670002bc             beq.w     $aae0
  00a826  487900007f24         pea.l     $7f24.l   ; g_7f24
  00a82c  4eb900000cd0         jsr       $cd0.l   ; OpenDefaultWorld
  00a832  4a00                 tst.b     d0
  00a834  584f                 addq.w    #$4, a7
  00a836  670002a8             beq.w     $aae0
  00a83a  487900007f64         pea.l     $7f64.l   ; g_7f64
  00a840  3f3900008066         move.w    $8066.l, -(a7)   ; curLevel
  00a846  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  00a84c  207900007470         movea.l   $7470.l, a0   ; hSave
  00a852  2050                 movea.l   (a0), a0
  00a854  4a280004             tst.b     $4(a0)
  00a858  5c4f                 addq.w    #$6, a7
  00a85a  67000130             beq.w     $a98c
  00a85e  13fc000100013c27     move.b    #$1, $13c27.l   ; g_13c27
  00a866  7600                 moveq     #$0, d3
  00a868  6032                 bra.b     $a89c
  00a86a  7800                 moveq     #$0, d4
  00a86c  6026                 bra.b     $a894
  00a86e  3043                 movea.w   d3, a0
  00a870  2008                 move.l    a0, d0
  00a872  ef88                 lsl.l     #$7, d0
  00a874  207900007470         movea.l   $7470.l, a0   ; hSave
  00a87a  2050                 movea.l   (a0), a0
  00a87c  d1c0                 adda.l    d0, a0
  00a87e  3243                 movea.w   d3, a1
  00a880  2009                 move.l    a1, d0
  00a882  ef88                 lsl.l     #$7, d0
  00a884  43f90000fc12         lea.l     $fc12.l, a1   ; trackMap
  00a88a  d3c0                 adda.l    d0, a1
  00a88c  13b0404e4000         move.b    $4e(a0, d4.w), (a1, d4.w)
  00a892  5244                 addq.w    #$1, d4
  00a894  0c440080             cmpi.w    #$80, d4
  00a898  6dd4                 blt.b     $a86e
  00a89a  5243                 addq.w    #$1, d3
  00a89c  0c430080             cmpi.w    #$80, d3
  00a8a0  6dc8                 blt.b     $a86a
  00a8a2  7600                 moveq     #$0, d3
  00a8a4  606c                 bra.b     $a912
  00a8a6  3043                 movea.w   d3, a0
  00a8a8  2008                 move.l    a0, d0
  00a8aa  e988                 lsl.l     #$4, d0
  00a8ac  207900007470         movea.l   $7470.l, a0   ; hSave
  00a8b2  2050                 movea.l   (a0), a0
  00a8b4  d1c0                 adda.l    d0, a0
  00a8b6  3243                 movea.w   d3, a1
  00a8b8  2009                 move.l    a1, d0
  00a8ba  e988                 lsl.l     #$4, d0
  00a8bc  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00a8c2  2251                 movea.l   (a1), a1
  00a8c4  d3c0                 adda.l    d0, a1
  00a8c6  d3fc00010000         adda.l    #$10000, a1
  00a8cc  41e84058             lea.l     $4058(a0), a0
  00a8d0  22d8                 move.l    (a0)+, (a1)+
  00a8d2  22d8                 move.l    (a0)+, (a1)+
  00a8d4  22d8                 move.l    (a0)+, (a1)+
  00a8d6  22d8                 move.l    (a0)+, (a1)+
  00a8d8  3043                 movea.w   d3, a0
  00a8da  2008                 move.l    a0, d0
  00a8dc  e988                 lsl.l     #$4, d0
  00a8de  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00a8e4  2050                 movea.l   (a0), a0
  00a8e6  d1c0                 adda.l    d0, a0
  00a8e8  203c0001000e         move.l    #$1000e, d0
  00a8ee  41f00800             lea.l     (a0, d0.l), a0
  00a8f2  5c50                 addq.w    #$6, (a0)
  00a8f4  3043                 movea.w   d3, a0
  00a8f6  2008                 move.l    a0, d0
  00a8f8  e988                 lsl.l     #$4, d0
  00a8fa  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00a900  2050                 movea.l   (a0), a0
  00a902  d1c0                 adda.l    d0, a0
  00a904  203c0001000c         move.l    #$1000c, d0
  00a90a  41f00800             lea.l     (a0, d0.l), a0
  00a90e  5c50                 addq.w    #$6, (a0)
  00a910  5243                 addq.w    #$1, d3
  00a912  0c430100             cmpi.w    #$100, d3
  00a916  6d8e                 blt.b     $a8a6
  00a918  7600                 moveq     #$0, d3
  00a91a  6030                 bra.b     $a94c
  00a91c  7034                 moveq     #$34, d0
  00a91e  c1c3                 muls.w    d3, d0
  00a920  207900007470         movea.l   $7470.l, a0   ; hSave
  00a926  2050                 movea.l   (a0), a0
  00a928  d1c0                 adda.l    d0, a0
  00a92a  7034                 moveq     #$34, d0
  00a92c  c1c3                 muls.w    d3, d0
  00a92e  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00a934  2251                 movea.l   (a1), a1
  00a936  d3c0                 adda.l    d0, a1
  00a938  d3fc00011000         adda.l    #$11000, a1
  00a93e  41e85058             lea.l     $5058(a0), a0
  00a942  700c                 moveq     #$c, d0
  00a944  22d8                 move.l    (a0)+, (a1)+
  00a946  51c8fffc             dbra      d0, $a944
  00a94a  5243                 addq.w    #$1, d3
  00a94c  0c430010             cmpi.w    #$10, d3
  00a950  6dca                 blt.b     $a91c
  00a952  7600                 moveq     #$0, d3
  00a954  6030                 bra.b     $a986
  00a956  7018                 moveq     #$18, d0
  00a958  c1c3                 muls.w    d3, d0
  00a95a  207900007470         movea.l   $7470.l, a0   ; hSave
  00a960  2050                 movea.l   (a0), a0
  00a962  d1c0                 adda.l    d0, a0
  00a964  7018                 moveq     #$18, d0
  00a966  c1c3                 muls.w    d3, d0
  00a968  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00a96e  2251                 movea.l   (a1), a1
  00a970  d3c0                 adda.l    d0, a1
  00a972  d3fc00011340         adda.l    #$11340, a1
  00a978  41e85398             lea.l     $5398(a0), a0
  00a97c  7005                 moveq     #$5, d0
  00a97e  22d8                 move.l    (a0)+, (a1)+
  00a980  51c8fffc             dbra      d0, $a97e
  00a984  5243                 addq.w    #$1, d3
  00a986  0c430010             cmpi.w    #$10, d3
  00a98a  6dca                 blt.b     $a956
  00a98c  3f3c0008             move.w    #$8, -(a7)
  00a990  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00a996  4879000055a2         pea.l     $55a2.l   ; g_55a2
  00a99c  3f3c0081             move.w    #$81, -(a7)
  00a9a0  4eb900000ab0         jsr       $ab0.l   ; DrawPICTToBackScreen
  00a9a6  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00a9ac  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00a9b2  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00a9b8  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00a9be  207900007470         movea.l   $7470.l, a0   ; hSave
  00a9c4  2050                 movea.l   (a0), a0
  00a9c6  4a280004             tst.b     $4(a0)
  00a9ca  504f                 addq.w    #$8, a7
  00a9cc  6730                 beq.b     $a9fe
  00a9ce  4227                 clr.b     -(a7)
  00a9d0  207900007470         movea.l   $7470.l, a0   ; hSave
  00a9d6  2050                 movea.l   (a0), a0
  00a9d8  3f280046             move.w    $46(a0), -(a7)
  00a9dc  207900007470         movea.l   $7470.l, a0   ; hSave
  00a9e2  2050                 movea.l   (a0), a0
  00a9e4  3f280044             move.w    $44(a0), -(a7)
  00a9e8  207900007470         movea.l   $7470.l, a0   ; hSave
  00a9ee  2050                 movea.l   (a0), a0
  00a9f0  3f280042             move.w    $42(a0), -(a7)
  00a9f4  61ffffffca02         bsr.l     $73f8   ; GameLoop
  00a9fa  504f                 addq.w    #$8, a7
  00a9fc  6052                 bra.b     $aa50
  00a9fe  1f3c0001             move.b    #$1, -(a7)
  00aa02  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00aa08  2250                 movea.l   (a0), a1
  00aa0a  203c000120f8         move.l    #$120f8, d0
  00aa10  3f310800             move.w    (a1, d0.l), -(a7)
  00aa14  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00aa1a  2250                 movea.l   (a0), a1
  00aa1c  203c000120f4         move.l    #$120f4, d0
  00aa22  30310800             move.w    (a1, d0.l), d0
  00aa26  48c0                 ext.l     d0
  00aa28  72e0                 moveq     #$e0, d1
  00aa2a  d081                 add.l     d1, d0
  00aa2c  3f00                 move.w    d0, -(a7)
  00aa2e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00aa34  2250                 movea.l   (a0), a1
  00aa36  203c000120f6         move.l    #$120f6, d0
  00aa3c  30310800             move.w    (a1, d0.l), d0
  00aa40  48c0                 ext.l     d0
  00aa42  72e0                 moveq     #$e0, d1
  00aa44  d081                 add.l     d1, d0
  00aa46  3f00                 move.w    d0, -(a7)
  00aa48  61ffffffc9ae         bsr.l     $73f8   ; GameLoop
  00aa4e  504f                 addq.w    #$8, a7
  00aa50  4a79000046c4         tst.w     $46c4.l   ; g_46c4
  00aa56  6f08                 ble.b     $aa60
  00aa58  4a79000046c0         tst.w     $46c0.l   ; g_46c0
  00aa5e  6e3c                 bgt.b     $aa9c
  00aa60  61ffffffb236         bsr.l     $5c98   ; RestorePreExistingWindowBackground
  00aa66  61ffffffb892         bsr.l     $62fa   ; AskToContinue
  00aa6c  4a00                 tst.b     d0
  00aa6e  671e                 beq.b     $aa8e
  00aa70  3f3c0008             move.w    #$8, -(a7)
  00aa74  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00aa7a  13fc000100013c28     move.b    #$1, $13c28.l   ; g_13c28
  00aa82  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00aa88  544f                 addq.w    #$2, a7
  00aa8a  6000039a             bra.w     $ae26
  00aa8e  423900013c28         clr.b     $13c28.l   ; g_13c28
  00aa94  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00aa9a  6006                 bra.b     $aaa2
  00aa9c  423900013c28         clr.b     $13c28.l   ; g_13c28
  00aaa2  3f3c0008             move.w    #$8, -(a7)
  00aaa6  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00aaac  61ffffff8524         bsr.l     $2fd2   ; DrawMainMenu
  00aab2  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00aab8  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00aabe  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00aac4  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00aaca  3f3c0008             move.w    #$8, -(a7)
  00aace  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00aad4  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00aada  584f                 addq.w    #$4, a7
  00aadc  60000348             bra.w     $ae26
  00aae0  422efffe             clr.b     -$2(a6)
  00aae4  7600                 moveq     #$0, d3
  00aae6  7600                 moveq     #$0, d3
  00aae8  486efffe             pea.l     -$2(a6)
  00aaec  4eb900000150         jsr       $150.l   ; seg7+609a
  00aaf2  3600                 move.w    d0, d3
  00aaf4  4a43                 tst.w     d3
  00aaf6  584f                 addq.w    #$4, a7
  00aaf8  66000314             bne.w     $ae0e
  00aafc  4a2efffe             tst.b     -$2(a6)
  00ab00  6704                 beq.b     $ab06
  00ab02  7601                 moveq     #$1, d3
  00ab04  6010                 bra.b     $ab16
  00ab06  487900004f79         pea.l     $4f79.l   ; g_4f79
  00ab0c  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00ab12  7600                 moveq     #$0, d3
  00ab14  584f                 addq.w    #$4, a7
  00ab16  4a03                 tst.b     d3
  00ab18  6700030c             beq.w     $ae26
  00ab1c  423900007f22         clr.b     $7f22.l   ; g_7f22
  00ab22  207900007470         movea.l   $7470.l, a0   ; hSave
  00ab28  2050                 movea.l   (a0), a0
  00ab2a  48685518             pea.l     $5518(a0)
  00ab2e  4eb900000cd0         jsr       $cd0.l   ; OpenDefaultWorld
  00ab34  4a00                 tst.b     d0
  00ab36  584f                 addq.w    #$4, a7
  00ab38  670002ec             beq.w     $ae26
  00ab3c  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00ab42  207900007470         movea.l   $7470.l, a0   ; hSave
  00ab48  2050                 movea.l   (a0), a0
  00ab4a  227900007468         movea.l   $7468.l, a1   ; hWorld
  00ab50  2251                 movea.l   (a1), a1
  00ab52  20290100             move.l    $100(a1), d0
  00ab56  b090                 cmp.l     (a0), d0
  00ab58  6712                 beq.b     $ab6c
  00ab5a  487900004f32         pea.l     $4f32.l   ; g_4f32
  00ab60  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00ab66  584f                 addq.w    #$4, a7
  00ab68  600002bc             bra.w     $ae26
  00ab6c  487900007f64         pea.l     $7f64.l   ; g_7f64
  00ab72  3f3900008066         move.w    $8066.l, -(a7)   ; curLevel
  00ab78  4eb900000cb0         jsr       $cb0.l   ; OpenDefaultWorldLevel
  00ab7e  207900007470         movea.l   $7470.l, a0   ; hSave
  00ab84  2050                 movea.l   (a0), a0
  00ab86  4a280004             tst.b     $4(a0)
  00ab8a  5c4f                 addq.w    #$6, a7
  00ab8c  67000130             beq.w     $acbe
  00ab90  13fc000100013c27     move.b    #$1, $13c27.l   ; g_13c27
  00ab98  7600                 moveq     #$0, d3
  00ab9a  6032                 bra.b     $abce
  00ab9c  7800                 moveq     #$0, d4
  00ab9e  6026                 bra.b     $abc6
  00aba0  3043                 movea.w   d3, a0
  00aba2  2008                 move.l    a0, d0
  00aba4  ef88                 lsl.l     #$7, d0
  00aba6  207900007470         movea.l   $7470.l, a0   ; hSave
  00abac  2050                 movea.l   (a0), a0
  00abae  d1c0                 adda.l    d0, a0
  00abb0  3243                 movea.w   d3, a1
  00abb2  2009                 move.l    a1, d0
  00abb4  ef88                 lsl.l     #$7, d0
  00abb6  43f90000fc12         lea.l     $fc12.l, a1   ; trackMap
  00abbc  d3c0                 adda.l    d0, a1
  00abbe  13b0404e4000         move.b    $4e(a0, d4.w), (a1, d4.w)
  00abc4  5244                 addq.w    #$1, d4
  00abc6  0c440080             cmpi.w    #$80, d4
  00abca  6dd4                 blt.b     $aba0
  00abcc  5243                 addq.w    #$1, d3
  00abce  0c430080             cmpi.w    #$80, d3
  00abd2  6dc8                 blt.b     $ab9c
  00abd4  7600                 moveq     #$0, d3
  00abd6  606c                 bra.b     $ac44
  00abd8  3043                 movea.w   d3, a0
  00abda  2008                 move.l    a0, d0
  00abdc  e988                 lsl.l     #$4, d0
  00abde  207900007470         movea.l   $7470.l, a0   ; hSave
  00abe4  2050                 movea.l   (a0), a0
  00abe6  d1c0                 adda.l    d0, a0
  00abe8  3243                 movea.w   d3, a1
  00abea  2009                 move.l    a1, d0
  00abec  e988                 lsl.l     #$4, d0
  00abee  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00abf4  2251                 movea.l   (a1), a1
  00abf6  d3c0                 adda.l    d0, a1
  00abf8  d3fc00010000         adda.l    #$10000, a1
  00abfe  41e84058             lea.l     $4058(a0), a0
  00ac02  22d8                 move.l    (a0)+, (a1)+
  00ac04  22d8                 move.l    (a0)+, (a1)+
  00ac06  22d8                 move.l    (a0)+, (a1)+
  00ac08  22d8                 move.l    (a0)+, (a1)+
  00ac0a  3043                 movea.w   d3, a0
  00ac0c  2008                 move.l    a0, d0
  00ac0e  e988                 lsl.l     #$4, d0
  00ac10  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ac16  2050                 movea.l   (a0), a0
  00ac18  d1c0                 adda.l    d0, a0
  00ac1a  203c0001000e         move.l    #$1000e, d0
  00ac20  41f00800             lea.l     (a0, d0.l), a0
  00ac24  5c50                 addq.w    #$6, (a0)
  00ac26  3043                 movea.w   d3, a0
  00ac28  2008                 move.l    a0, d0
  00ac2a  e988                 lsl.l     #$4, d0
  00ac2c  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ac32  2050                 movea.l   (a0), a0
  00ac34  d1c0                 adda.l    d0, a0
  00ac36  203c0001000c         move.l    #$1000c, d0
  00ac3c  41f00800             lea.l     (a0, d0.l), a0
  00ac40  5c50                 addq.w    #$6, (a0)
  00ac42  5243                 addq.w    #$1, d3
  00ac44  0c430100             cmpi.w    #$100, d3
  00ac48  6d8e                 blt.b     $abd8
  00ac4a  7600                 moveq     #$0, d3
  00ac4c  6030                 bra.b     $ac7e
  00ac4e  7034                 moveq     #$34, d0
  00ac50  c1c3                 muls.w    d3, d0
  00ac52  207900007470         movea.l   $7470.l, a0   ; hSave
  00ac58  2050                 movea.l   (a0), a0
  00ac5a  d1c0                 adda.l    d0, a0
  00ac5c  7034                 moveq     #$34, d0
  00ac5e  c1c3                 muls.w    d3, d0
  00ac60  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00ac66  2251                 movea.l   (a1), a1
  00ac68  d3c0                 adda.l    d0, a1
  00ac6a  d3fc00011000         adda.l    #$11000, a1
  00ac70  41e85058             lea.l     $5058(a0), a0
  00ac74  700c                 moveq     #$c, d0
  00ac76  22d8                 move.l    (a0)+, (a1)+
  00ac78  51c8fffc             dbra      d0, $ac76
  00ac7c  5243                 addq.w    #$1, d3
  00ac7e  0c430010             cmpi.w    #$10, d3
  00ac82  6dca                 blt.b     $ac4e
  00ac84  7600                 moveq     #$0, d3
  00ac86  6030                 bra.b     $acb8
  00ac88  7018                 moveq     #$18, d0
  00ac8a  c1c3                 muls.w    d3, d0
  00ac8c  207900007470         movea.l   $7470.l, a0   ; hSave
  00ac92  2050                 movea.l   (a0), a0
  00ac94  d1c0                 adda.l    d0, a0
  00ac96  7018                 moveq     #$18, d0
  00ac98  c1c3                 muls.w    d3, d0
  00ac9a  22790000746c         movea.l   $746c.l, a1   ; hLevel
  00aca0  2251                 movea.l   (a1), a1
  00aca2  d3c0                 adda.l    d0, a1
  00aca4  d3fc00011340         adda.l    #$11340, a1
  00acaa  41e85398             lea.l     $5398(a0), a0
  00acae  7005                 moveq     #$5, d0
  00acb0  22d8                 move.l    (a0)+, (a1)+
  00acb2  51c8fffc             dbra      d0, $acb0
  00acb6  5243                 addq.w    #$1, d3
  00acb8  0c430010             cmpi.w    #$10, d3
  00acbc  6dca                 blt.b     $ac88
  00acbe  3f3c0008             move.w    #$8, -(a7)
  00acc2  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00acc8  4879000055a2         pea.l     $55a2.l   ; g_55a2
  00acce  3f3c0081             move.w    #$81, -(a7)
  00acd2  4eb900000ab0         jsr       $ab0.l   ; DrawPICTToBackScreen
  00acd8  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00acde  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00ace4  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00acea  207900007470         movea.l   $7470.l, a0   ; hSave
  00acf0  2050                 movea.l   (a0), a0
  00acf2  4a280004             tst.b     $4(a0)
  00acf6  504f                 addq.w    #$8, a7
  00acf8  6730                 beq.b     $ad2a
  00acfa  4227                 clr.b     -(a7)
  00acfc  207900007470         movea.l   $7470.l, a0   ; hSave
  00ad02  2050                 movea.l   (a0), a0
  00ad04  3f280046             move.w    $46(a0), -(a7)
  00ad08  207900007470         movea.l   $7470.l, a0   ; hSave
  00ad0e  2050                 movea.l   (a0), a0
  00ad10  3f280044             move.w    $44(a0), -(a7)
  00ad14  207900007470         movea.l   $7470.l, a0   ; hSave
  00ad1a  2050                 movea.l   (a0), a0
  00ad1c  3f280042             move.w    $42(a0), -(a7)
  00ad20  61ffffffc6d6         bsr.l     $73f8   ; GameLoop
  00ad26  504f                 addq.w    #$8, a7
  00ad28  6052                 bra.b     $ad7c
  00ad2a  1f3c0001             move.b    #$1, -(a7)
  00ad2e  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ad34  2250                 movea.l   (a0), a1
  00ad36  203c000120f8         move.l    #$120f8, d0
  00ad3c  3f310800             move.w    (a1, d0.l), -(a7)
  00ad40  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ad46  2250                 movea.l   (a0), a1
  00ad48  203c000120f4         move.l    #$120f4, d0
  00ad4e  30310800             move.w    (a1, d0.l), d0
  00ad52  48c0                 ext.l     d0
  00ad54  72e0                 moveq     #$e0, d1
  00ad56  d081                 add.l     d1, d0
  00ad58  3f00                 move.w    d0, -(a7)
  00ad5a  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00ad60  2250                 movea.l   (a0), a1
  00ad62  203c000120f6         move.l    #$120f6, d0
  00ad68  30310800             move.w    (a1, d0.l), d0
  00ad6c  48c0                 ext.l     d0
  00ad6e  72e0                 moveq     #$e0, d1
  00ad70  d081                 add.l     d1, d0
  00ad72  3f00                 move.w    d0, -(a7)
  00ad74  61ffffffc682         bsr.l     $73f8   ; GameLoop
  00ad7a  504f                 addq.w    #$8, a7
  00ad7c  4a79000046c4         tst.w     $46c4.l   ; g_46c4
  00ad82  6f08                 ble.b     $ad8c
  00ad84  4a79000046c0         tst.w     $46c0.l   ; g_46c0
  00ad8a  6e3a                 bgt.b     $adc6
  00ad8c  61ffffffaf0a         bsr.l     $5c98   ; RestorePreExistingWindowBackground
  00ad92  61ffffffb566         bsr.l     $62fa   ; AskToContinue
  00ad98  4a00                 tst.b     d0
  00ad9a  671c                 beq.b     $adb8
  00ad9c  3f3c0008             move.w    #$8, -(a7)
  00ada0  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00ada6  13fc000100013c28     move.b    #$1, $13c28.l   ; g_13c28
  00adae  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00adb4  544f                 addq.w    #$2, a7
  00adb6  606e                 bra.b     $ae26
  00adb8  423900013c28         clr.b     $13c28.l   ; g_13c28
  00adbe  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00adc4  6006                 bra.b     $adcc
  00adc6  423900013c28         clr.b     $13c28.l   ; g_13c28
  00adcc  3f3c0008             move.w    #$8, -(a7)
  00add0  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00add6  61ffffff81fa         bsr.l     $2fd2   ; DrawMainMenu
  00addc  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00ade2  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00ade8  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00adee  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00adf4  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00adfa  3f3c0008             move.w    #$8, -(a7)
  00adfe  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00ae04  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00ae0a  584f                 addq.w    #$4, a7
  00ae0c  6018                 bra.b     $ae26
  00ae0e  3f03                 move.w    d3, -(a7)
  00ae10  4879000051cc         pea.l     $51cc.l   ; g_51cc
  00ae16  4eb900000be8         jsr       $be8.l   ; ReportError
  00ae1c  5c4f                 addq.w    #$6, a7
  00ae1e  6006                 bra.b     $ae26
  00ae20  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00ae26  4cdf0018             movem.l   (a7)+, d3-d4
  00ae2a  4e5e                 unlk      a6
  00ae2c  4e75                 rts       

;-------------------------------------------------------------
; Instructions   (seg 1 +00ae3e, 224 bytes)
  00ae3e  4e56fff8             link.w    a6, #$fff8
  00ae42  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00ae48  201f                 move.l    (a7)+, d0
  00ae4a  a032                 _FlushEvents 
  00ae4c  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00ae52  4a39000046ce         tst.b     $46ce.l   ; levelDone
  00ae58  6738                 beq.b     $ae92
  00ae5a  486efff8             pea.l     -$8(a6)
  00ae5e  2f3c00290020         move.l    #$290020, -(a7)
  00ae64  2f3c01b501b3         move.l    #$1b501b3, -(a7)
  00ae6a  a8a7                 _SetRect  
  00ae6c  3f3c0084             move.w    #$84, -(a7)
  00ae70  486efff8             pea.l     -$8(a6)
  00ae74  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  00ae7a  4eb9000000d0         jsr       $d0.l   ; SATSETPORTOFFSCREEN
  00ae80  3f3c0084             move.w    #$84, -(a7)
  00ae84  486efff8             pea.l     -$8(a6)
  00ae88  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  00ae8e  60000084             bra.w     $af14
  00ae92  486efff8             pea.l     -$8(a6)
  00ae96  2f3c00100010         move.l    #$100010, -(a7)
  00ae9c  2f3c01d001d0         move.l    #$1d001d0, -(a7)
  00aea2  a8a7                 _SetRect  
  00aea4  48780021             pea.l     $21.w
  00aea8  a862                 _ForeColor 
  00aeaa  486efff8             pea.l     -$8(a6)
  00aeae  a8a2                 _PaintRect 
  00aeb0  486efff8             pea.l     -$8(a6)
  00aeb4  2f3c00290026         move.l    #$290026, -(a7)
  00aeba  2f3c01b501b9         move.l    #$1b501b9, -(a7)
  00aec0  a8a7                 _SetRect  
  00aec2  3f3c0084             move.w    #$84, -(a7)
  00aec6  486efff8             pea.l     -$8(a6)
  00aeca  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  00aed0  4eb9000000d0         jsr       $d0.l   ; SATSETPORTOFFSCREEN
  00aed6  486efff8             pea.l     -$8(a6)
  00aeda  2f3c00100010         move.l    #$100010, -(a7)
  00aee0  2f3c01d001d0         move.l    #$1d001d0, -(a7)
  00aee6  a8a7                 _SetRect  
  00aee8  48780021             pea.l     $21.w
  00aeec  a862                 _ForeColor 
  00aeee  486efff8             pea.l     -$8(a6)
  00aef2  a8a2                 _PaintRect 
  00aef4  486efff8             pea.l     -$8(a6)
  00aef8  2f3c00290026         move.l    #$290026, -(a7)
  00aefe  2f3c01b501b9         move.l    #$1b501b9, -(a7)
  00af04  a8a7                 _SetRect  
  00af06  3f3c0084             move.w    #$84, -(a7)
  00af0a  486efff8             pea.l     -$8(a6)
  00af0e  4eb900000080         jsr       $80.l   ; SATGETANDDRAWPICTRESINRECT
  00af14  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00af1a  4e5e                 unlk      a6
  00af1c  4e75                 rts       

;-------------------------------------------------------------
; ToggleMusic   (seg 1 +00af2e, 240 bytes)
  00af2e  4e560000             link.w    a6, #$0
  00af32  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00af38  48790000f708         pea.l     $f708.l   ; g_f708
  00af3e  2f3c70726566         move.l    #$70726566, -(a7)
  00af44  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00af4a  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00af50  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00af56  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00af5c  4fef0014             lea.l     $14(a7), a7
  00af60  6708                 beq.b     $af6a
  00af62  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00af68  a998                 _UseResFile 
  00af6a  61ff00000de0         bsr.l     $bd4c   ; InitPrefs
  00af70  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00af76  a998                 _UseResFile 
  00af78  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00af7e  2050                 movea.l   (a0), a0
  00af80  4a28000b             tst.b     $b(a0)
  00af84  6714                 beq.b     $af9a
  00af86  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00af8c  2050                 movea.l   (a0), a0
  00af8e  4228000b             clr.b     $b(a0)
  00af92  4eb900000278         jsr       $278.l   ; ShutDownMusic
  00af98  6048                 bra.b     $afe2
  00af9a  4eb900000288         jsr       $288.l   ; IsQuickTimeInstalled
  00afa0  4a00                 tst.b     d0
  00afa2  6730                 beq.b     $afd4
  00afa4  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00afaa  2050                 movea.l   (a0), a0
  00afac  117c0001000b         move.b    #$1, $b(a0)
  00afb2  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00afb8  4eb900000258         jsr       $258.l   ; InitMusic
  00afbe  3f3900000eaa         move.w    $eaa.l, -(a7)   ; g_eaa
  00afc4  4eb900000260         jsr       $260.l   ; SetMusic
  00afca  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00afd0  544f                 addq.w    #$2, a7
  00afd2  600e                 bra.b     $afe2
  00afd4  487900004ef0         pea.l     $4ef0.l   ; g_4ef0
  00afda  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00afe0  584f                 addq.w    #$4, a7
  00afe2  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00afe8  a9aa                 _ChangedResource 
  00afea  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00aff0  a9b0                 _WriteResource 
  00aff2  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00aff8  61ff0000018e         bsr.l     $b188   ; MakeCurrPrefs
  00affe  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00b004  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00b00a  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b010  a998                 _UseResFile 
  00b012  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b018  a99a                 _CloseResFile 
  00b01a  4e5e                 unlk      a6
  00b01c  4e75                 rts       

;-------------------------------------------------------------
; UpdateSGString   (seg 1 +00b02c, 152 bytes)
  00b02c  4e560000             link.w    a6, #$0
  00b030  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00b036  48790000f708         pea.l     $f708.l   ; g_f708
  00b03c  2f3c70726566         move.l    #$70726566, -(a7)
  00b042  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00b048  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00b04e  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00b054  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00b05a  4fef0014             lea.l     $14(a7), a7
  00b05e  6708                 beq.b     $b068
  00b060  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b066  a998                 _UseResFile 
  00b068  61ff00000ce2         bsr.l     $bd4c   ; InitPrefs
  00b06e  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b074  a998                 _UseResFile 
  00b076  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b07c  2050                 movea.l   (a0), a0
  00b07e  48680030             pea.l     $30(a0)
  00b082  4879000061a2         pea.l     $61a2.l   ; g_61a2
  00b088  4eb900000a88         jsr       $a88.l   ; CopyPString
  00b08e  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b094  a9aa                 _ChangedResource 
  00b096  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b09c  a9b0                 _WriteResource 
  00b09e  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00b0a4  61ff000000e2         bsr.l     $b188   ; MakeCurrPrefs
  00b0aa  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00b0b0  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b0b6  a998                 _UseResFile 
  00b0b8  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b0be  a99a                 _CloseResFile 
  00b0c0  4e5e                 unlk      a6
  00b0c2  4e75                 rts       

;-------------------------------------------------------------
; ToggleSound   (seg 1 +00b0d6, 164 bytes)
  00b0d6  4e560000             link.w    a6, #$0
  00b0da  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00b0e0  48790000f708         pea.l     $f708.l   ; g_f708
  00b0e6  2f3c70726566         move.l    #$70726566, -(a7)
  00b0ec  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00b0f2  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00b0f8  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00b0fe  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00b104  4fef0014             lea.l     $14(a7), a7
  00b108  6708                 beq.b     $b112
  00b10a  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b110  a998                 _UseResFile 
  00b112  61ff00000c38         bsr.l     $bd4c   ; InitPrefs
  00b118  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b11e  a998                 _UseResFile 
  00b120  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b126  2050                 movea.l   (a0), a0
  00b128  1028000a             move.b    $a(a0), d0
  00b12c  57c0                 seq.b     d0
  00b12e  4400                 neg.b     d0
  00b130  49c0                 extb.l    d0
  00b132  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b138  2050                 movea.l   (a0), a0
  00b13a  1140000a             move.b    d0, $a(a0)
  00b13e  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b144  a9aa                 _ChangedResource 
  00b146  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b14c  a9b0                 _WriteResource 
  00b14e  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00b154  61ff00000032         bsr.l     $b188   ; MakeCurrPrefs
  00b15a  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00b160  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00b166  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b16c  a998                 _UseResFile 
  00b16e  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b174  a99a                 _CloseResFile 
  00b176  4e5e                 unlk      a6
  00b178  4e75                 rts       

;-------------------------------------------------------------
; MakeCurrPrefs   (seg 1 +00b188, 454 bytes)
  00b188  4e560000             link.w    a6, #$0
  00b18c  2f03                 move.l    d3, -(a7)
  00b18e  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b194  2050                 movea.l   (a0), a0
  00b196  13d000006172         move.b    (a0), $6172.l   ; prefReduceFrameRate
  00b19c  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1a2  2050                 movea.l   (a0), a0
  00b1a4  13e8000100006173     move.b    $1(a0), $6173.l   ; g_6173
  00b1ac  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1b2  2050                 movea.l   (a0), a0
  00b1b4  13e8000200006174     move.b    $2(a0), $6174.l   ; prefInterlace
  00b1bc  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1c2  2050                 movea.l   (a0), a0
  00b1c4  13e8000300006175     move.b    $3(a0), $6175.l   ; prefLineSkip
  00b1cc  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1d2  2050                 movea.l   (a0), a0
  00b1d4  13e8000400006176     move.b    $4(a0), $6176.l   ; g_6176
  00b1dc  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1e2  2050                 movea.l   (a0), a0
  00b1e4  33e800080000617a     move.w    $8(a0), $617a.l   ; prefScrollMode
  00b1ec  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b1f2  2050                 movea.l   (a0), a0
  00b1f4  13e8000600006178     move.b    $6(a0), $6178.l   ; g_6178
  00b1fc  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b202  2050                 movea.l   (a0), a0
  00b204  13e8000700006179     move.b    $7(a0), $6179.l   ; g_6179
  00b20c  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b212  2050                 movea.l   (a0), a0
  00b214  13e8000a0000617c     move.b    $a(a0), $617c.l   ; g_617c
  00b21c  4a390000617c         tst.b     $617c.l   ; g_617c
  00b222  6718                 beq.b     $b23c
  00b224  2f3c56220000         move.l    #$56220000, -(a7)
  00b22a  1f3c0001             move.b    #$1, -(a7)
  00b22e  3f3c0008             move.w    #$8, -(a7)
  00b232  4eb900000198         jsr       $198.l   ; seg7+818e
  00b238  504f                 addq.w    #$8, a7
  00b23a  6006                 bra.b     $b242
  00b23c  4eb9000001a0         jsr       $1a0.l   ; seg7+8350
  00b242  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b248  2050                 movea.l   (a0), a0
  00b24a  13e8000b0000617d     move.b    $b(a0), $617d.l   ; g_617d
  00b252  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b258  2050                 movea.l   (a0), a0
  00b25a  33e8000c0000617e     move.w    $c(a0), $617e.l   ; g_617e
  00b262  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b268  2050                 movea.l   (a0), a0
  00b26a  33e8000e00006180     move.w    $e(a0), $6180.l   ; g_6180
  00b272  7600                 moveq     #$0, d3
  00b274  6016                 bra.b     $b28c
  00b276  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b27c  2250                 movea.l   (a0), a1
  00b27e  41f900006172         lea.l     $6172.l, a0   ; prefReduceFrameRate
  00b284  31b132103210         move.w    $10(a1, d3.w * 2), $10(a0, d3.w * 2)
  00b28a  5243                 addq.w    #$1, d3
  00b28c  0c430008             cmpi.w    #$8, d3
  00b290  6de4                 blt.b     $b276
  00b292  7600                 moveq     #$0, d3
  00b294  6016                 bra.b     $b2ac
  00b296  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b29c  2250                 movea.l   (a0), a1
  00b29e  41f900006172         lea.l     $6172.l, a0   ; prefReduceFrameRate
  00b2a4  31b132203220         move.w    $20(a1, d3.w * 2), $20(a0, d3.w * 2)
  00b2aa  5243                 addq.w    #$1, d3
  00b2ac  0c430008             cmpi.w    #$8, d3
  00b2b0  6de4                 blt.b     $b296
  00b2b2  4879000061a2         pea.l     $61a2.l   ; g_61a2
  00b2b8  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b2be  2050                 movea.l   (a0), a0
  00b2c0  48680030             pea.l     $30(a0)
  00b2c4  4eb900000a88         jsr       $a88.l   ; CopyPString
  00b2ca  7600                 moveq     #$0, d3
  00b2cc  504f                 addq.w    #$8, a7
  00b2ce  6030                 bra.b     $b300
  00b2d0  3043                 movea.w   d3, a0
  00b2d2  2008                 move.l    a0, d0
  00b2d4  e188                 lsl.l     #$8, d0
  00b2d6  41f900006172         lea.l     $6172.l, a0   ; prefReduceFrameRate
  00b2dc  d1c0                 adda.l    d0, a0
  00b2de  48680130             pea.l     $130(a0)
  00b2e2  3043                 movea.w   d3, a0
  00b2e4  2008                 move.l    a0, d0
  00b2e6  e188                 lsl.l     #$8, d0
  00b2e8  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00b2ee  2050                 movea.l   (a0), a0
  00b2f0  d1c0                 adda.l    d0, a0
  00b2f2  48680130             pea.l     $130(a0)
  00b2f6  4eb900000a88         jsr       $a88.l   ; CopyPString
  00b2fc  5243                 addq.w    #$1, d3
  00b2fe  504f                 addq.w    #$8, a7
  00b300  0c430008             cmpi.w    #$8, d3
  00b304  6dca                 blt.b     $b2d0
  00b306  103900006176         move.b    $6176.l, d0   ; g_6176
  00b30c  57c0                 seq.b     d0
  00b30e  4400                 neg.b     d0
  00b310  49c0                 extb.l    d0
  00b312  13c0000046cd         move.b    d0, $46cd.l   ; g_46cd
  00b318  303900006180         move.w    $6180.l, d0   ; g_6180
  00b31e  c1fc1c71             muls.w    #$1c71, d0
  00b322  2f00                 move.l    d0, -(a7)
  00b324  4eb900000268         jsr       $268.l   ; SetMusicVolume
  00b32a  701c                 moveq     #$1c, d0
  00b32c  c1f90000617e         muls.w    $617e.l, d0   ; g_617e
  00b332  23c0000046c8         move.l    d0, $46c8.l   ; g_46c8
  00b338  7000                 moveq     #$0, d0
  00b33a  10390000617d         move.b    $617d.l, d0   ; g_617d
  00b340  33c00000f6d6         move.w    d0, $f6d6.l   ; g_f6d6
  00b346  584f                 addq.w    #$4, a7
  00b348  261f                 move.l    (a7)+, d3
  00b34a  4e5e                 unlk      a6
  00b34c  4e75                 rts       

;-------------------------------------------------------------
; Options   (seg 1 +00b35e, 250 bytes)
  00b35e  4e56fffe             link.w    a6, #$fffe
  00b362  3d790000617afffe     move.w    $617a.l, -$2(a6)   ; prefScrollMode
  00b36a  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00b370  201f                 move.l    (a7)+, d0
  00b372  a032                 _FlushEvents 
  00b374  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00b37a  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00b380  48790000f708         pea.l     $f708.l   ; g_f708
  00b386  2f3c70726566         move.l    #$70726566, -(a7)
  00b38c  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00b392  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00b398  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00b39e  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00b3a4  4fef0014             lea.l     $14(a7), a7
  00b3a8  6708                 beq.b     $b3b2
  00b3aa  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b3b0  a998                 _UseResFile 
  00b3b2  61ff00000998         bsr.l     $bd4c   ; InitPrefs
  00b3b8  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b3be  a998                 _UseResFile 
  00b3c0  4eb900000320         jsr       $320.l   ; PreferencesDialog
  00b3c6  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b3cc  a9aa                 _ChangedResource 
  00b3ce  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00b3d4  a9b0                 _WriteResource 
  00b3d6  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00b3dc  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00b3e2  61fffffffda4         bsr.l     $b188   ; MakeCurrPrefs
  00b3e8  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00b3ee  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00b3f4  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00b3fa  a998                 _UseResFile 
  00b3fc  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00b402  a99a                 _CloseResFile 
  00b404  302efffe             move.w    -$2(a6), d0
  00b408  b0790000617a         cmp.w     $617a.l, d0   ; prefScrollMode
  00b40e  6734                 beq.b     $b444
  00b410  303900008074         move.w    $8074.l, d0   ; playerH
  00b416  48c0                 ext.l     d0
  00b418  0680ffffff30         addi.l    #$ffffff30, d0
  00b41e  33c00000806e         move.w    d0, $806e.l   ; viewLeft2
  00b424  33c00000806a         move.w    d0, $806a.l   ; viewLeft
  00b42a  303900008076         move.w    $8076.l, d0   ; playerV
  00b430  48c0                 ext.l     d0
  00b432  0680ffffff30         addi.l    #$ffffff30, d0
  00b438  33c00000806c         move.w    d0, $806c.l   ; viewTop2
  00b43e  33c000008068         move.w    d0, $8068.l   ; viewTop
  00b444  13fc00010000f686     move.b    #$1, $f686.l   ; g_f686
  00b44c  13fc0001000046af     move.b    #$1, $46af.l   ; g_46af
  00b454  4e5e                 unlk      a6
  00b456  4e75                 rts       

;-------------------------------------------------------------
; Credits   (seg 1 +00b462, 36 bytes)
  00b462  4e560000             link.w    a6, #$0
  00b466  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00b46c  201f                 move.l    (a7)+, d0
  00b46e  a032                 _FlushEvents 
  00b470  2f3c12c30258         move.l    #$12c30258, -(a7)
  00b476  4eb900000210         jsr       $210.l   ; DOABOUTDIALOG
  00b47c  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00b482  4e5e                 unlk      a6
  00b484  4e75                 rts       

;-------------------------------------------------------------
; MainMenu   (seg 1 +00b490, 1030 bytes)
  00b490  4e56ffea             link.w    a6, #$ffea
  00b494  48e71c00             movem.l   d3-d5, -(a7)
  00b498  7800                 moveq     #$0, d4
  00b49a  422efffb             clr.b     -$5(a6)
  00b49e  7a00                 moveq     #$0, d5
  00b4a0  7600                 moveq     #$0, d3
  00b4a2  554f                 subq.w    #$2, a7
  00b4a4  3f3cffff             move.w    #$ffff, -(a7)
  00b4a8  486effea             pea.l     -$16(a6)
  00b4ac  4878003c             pea.l     $3c.w
  00b4b0  42a7                 clr.l     -(a7)
  00b4b2  a860                 _WaitNextEvent 
  00b4b4  101f                 move.b    (a7)+, d0
  00b4b6  3f3c0008             move.w    #$8, -(a7)
  00b4ba  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00b4c0  61ffffff7b10         bsr.l     $2fd2   ; DrawMainMenu
  00b4c6  3f3c0008             move.w    #$8, -(a7)
  00b4ca  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00b4d0  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00b4d6  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00b4dc  0c79025800000eaa     cmpi.w    #$258, $eaa.l   ; g_eaa
  00b4e4  584f                 addq.w    #$4, a7
  00b4e6  670c                 beq.b     $b4f4
  00b4e8  3f3c0258             move.w    #$258, -(a7)
  00b4ec  4eb900000260         jsr       $260.l   ; SetMusic
  00b4f2  544f                 addq.w    #$2, a7
  00b4f4  486efffb             pea.l     -$5(a6)
  00b4f8  4eb900000150         jsr       $150.l   ; seg7+609a
  00b4fe  3a00                 move.w    d0, d5
  00b500  3005                 move.w    d5, d0
  00b502  48c0                 ext.l     d0
  00b504  584f                 addq.w    #$4, a7
  00b506  6630                 bne.b     $b538
  00b508  4a2efffb             tst.b     -$5(a6)
  00b50c  6600037a             bne.w     $b888
  00b510  1f3c0001             move.b    #$1, -(a7)
  00b514  4eb900000158         jsr       $158.l   ; seg7+6114
  00b51a  3a00                 move.w    d0, d5
  00b51c  4a45                 tst.w     d5
  00b51e  544f                 addq.w    #$2, a7
  00b520  67000366             beq.w     $b888
  00b524  3f05                 move.w    d5, -(a7)
  00b526  4879000051cc         pea.l     $51cc.l   ; g_51cc
  00b52c  4eb900000be8         jsr       $be8.l   ; ReportError
  00b532  5c4f                 addq.w    #$6, a7
  00b534  60000352             bra.w     $b888
  00b538  3f05                 move.w    d5, -(a7)
  00b53a  4879000051cc         pea.l     $51cc.l   ; g_51cc
  00b540  4eb900000be8         jsr       $be8.l   ; ReportError
  00b546  5c4f                 addq.w    #$6, a7
  00b548  6000033e             bra.w     $b888
  00b54c  4a39000046cc         tst.b     $46cc.l   ; g_46cc
  00b552  6700030c             beq.w     $b860
  00b556  0c79025800000eaa     cmpi.w    #$258, $eaa.l   ; g_eaa
  00b55e  670c                 beq.b     $b56c
  00b560  3f3c0258             move.w    #$258, -(a7)
  00b564  4eb900000260         jsr       $260.l   ; SetMusic
  00b56a  544f                 addq.w    #$2, a7
  00b56c  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00b572  486efffc             pea.l     -$4(a6)
  00b576  a972                 _GetMouse 
  00b578  2f3c025a0045         move.l    #$25a0045, -(a7)
  00b57e  2f3c01ec002c         move.l    #$1ec002c, -(a7)
  00b584  2f2efffc             move.l    -$4(a6), -(a7)
  00b588  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b58e  4a00                 tst.b     d0
  00b590  4fef000c             lea.l     $c(a7), a7
  00b594  6728                 beq.b     $b5be
  00b596  1f3c0001             move.b    #$1, -(a7)
  00b59a  3f3c0001             move.w    #$1, -(a7)
  00b59e  61ffffff67e0         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b5a4  4a00                 tst.b     d0
  00b5a6  584f                 addq.w    #$4, a7
  00b5a8  67000168             beq.w     $b712
  00b5ac  13fc000100007f22     move.b    #$1, $7f22.l   ; g_7f22
  00b5b4  61ffffffc488         bsr.l     $7a3e   ; NewGame
  00b5ba  60000156             bra.w     $b712
  00b5be  2f3c025a0064         move.l    #$25a0064, -(a7)
  00b5c4  2f3c01ec004b         move.l    #$1ec004b, -(a7)
  00b5ca  2f2efffc             move.l    -$4(a6), -(a7)
  00b5ce  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b5d4  4a00                 tst.b     d0
  00b5d6  4fef000c             lea.l     $c(a7), a7
  00b5da  6724                 beq.b     $b600
  00b5dc  1f3c0001             move.b    #$1, -(a7)
  00b5e0  3f3c0002             move.w    #$2, -(a7)
  00b5e4  61ffffff679a         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b5ea  4a00                 tst.b     d0
  00b5ec  584f                 addq.w    #$4, a7
  00b5ee  67000122             beq.w     $b712
  00b5f2  42a7                 clr.l     -(a7)
  00b5f4  61fffffff056         bsr.l     $a64c   ; ContinueGame
  00b5fa  584f                 addq.w    #$4, a7
  00b5fc  60000114             bra.w     $b712
  00b600  2f3c025a0083         move.l    #$25a0083, -(a7)
  00b606  2f3c01ec006a         move.l    #$1ec006a, -(a7)
  00b60c  2f2efffc             move.l    -$4(a6), -(a7)
  00b610  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b616  4a00                 tst.b     d0
  00b618  4fef000c             lea.l     $c(a7), a7
  00b61c  6720                 beq.b     $b63e
  00b61e  1f3c0001             move.b    #$1, -(a7)
  00b622  3f3c0003             move.w    #$3, -(a7)
  00b626  61ffffff6758         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b62c  4a00                 tst.b     d0
  00b62e  584f                 addq.w    #$4, a7
  00b630  670000e0             beq.w     $b712
  00b634  61fffffff808         bsr.l     $ae3e   ; Instructions
  00b63a  600000d6             bra.w     $b712
  00b63e  2f3c025a00a2         move.l    #$25a00a2, -(a7)
  00b644  2f3c01ec0089         move.l    #$1ec0089, -(a7)
  00b64a  2f2efffc             move.l    -$4(a6), -(a7)
  00b64e  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b654  4a00                 tst.b     d0
  00b656  4fef000c             lea.l     $c(a7), a7
  00b65a  6720                 beq.b     $b67c
  00b65c  1f3c0001             move.b    #$1, -(a7)
  00b660  3f3c0004             move.w    #$4, -(a7)
  00b664  61ffffff671a         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b66a  4a00                 tst.b     d0
  00b66c  584f                 addq.w    #$4, a7
  00b66e  670000a2             beq.w     $b712
  00b672  61fffffffcea         bsr.l     $b35e   ; Options
  00b678  60000098             bra.w     $b712
  00b67c  2f3c025a00c2         move.l    #$25a00c2, -(a7)
  00b682  2f3c01ec00a8         move.l    #$1ec00a8, -(a7)
  00b688  2f2efffc             move.l    -$4(a6), -(a7)
  00b68c  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b692  4a00                 tst.b     d0
  00b694  4fef000c             lea.l     $c(a7), a7
  00b698  671c                 beq.b     $b6b6
  00b69a  1f3c0001             move.b    #$1, -(a7)
  00b69e  3f3c0005             move.w    #$5, -(a7)
  00b6a2  61ffffff66dc         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b6a8  4a00                 tst.b     d0
  00b6aa  584f                 addq.w    #$4, a7
  00b6ac  6764                 beq.b     $b712
  00b6ae  61fffffffdb2         bsr.l     $b462   ; Credits
  00b6b4  605c                 bra.b     $b712
  00b6b6  2f3c025a00e1         move.l    #$25a00e1, -(a7)
  00b6bc  2f3c01ec00c8         move.l    #$1ec00c8, -(a7)
  00b6c2  2f2efffc             move.l    -$4(a6), -(a7)
  00b6c6  4eb900000ae0         jsr       $ae0.l   ; PointInRect
  00b6cc  4a00                 tst.b     d0
  00b6ce  4fef000c             lea.l     $c(a7), a7
  00b6d2  6722                 beq.b     $b6f6
  00b6d4  1f3c0001             move.b    #$1, -(a7)
  00b6d8  3f3c0006             move.w    #$6, -(a7)
  00b6dc  61ffffff66a2         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b6e2  4a00                 tst.b     d0
  00b6e4  584f                 addq.w    #$4, a7
  00b6e6  672a                 beq.b     $b712
  00b6e8  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00b6ee  61ff000001b2         bsr.l     $b8a2   ; Quit
  00b6f4  601c                 bra.b     $b712
  00b6f6  486efffc             pea.l     -$4(a6)
  00b6fa  a870                 _LocalToGlobal 
  00b6fc  0c6e0014fffc         cmpi.w    #$14, -$4(a6)
  00b702  6e08                 bgt.b     $b70c
  00b704  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00b70a  6006                 bra.b     $b712
  00b70c  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00b712  3f3c002d             move.w    #$2d, -(a7)
  00b716  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b71c  4a00                 tst.b     d0
  00b71e  544f                 addq.w    #$2, a7
  00b720  6720                 beq.b     $b742
  00b722  4227                 clr.b     -(a7)
  00b724  3f3c0001             move.w    #$1, -(a7)
  00b728  61ffffff6656         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b72e  13fc000100007f22     move.b    #$1, $7f22.l   ; g_7f22
  00b736  61ffffffc306         bsr.l     $7a3e   ; NewGame
  00b73c  584f                 addq.w    #$4, a7
  00b73e  60000120             bra.w     $b860
  00b742  3f3c001f             move.w    #$1f, -(a7)
  00b746  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b74c  4a00                 tst.b     d0
  00b74e  544f                 addq.w    #$2, a7
  00b750  6610                 bne.b     $b762
  00b752  3f3c000f             move.w    #$f, -(a7)
  00b756  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b75c  4a00                 tst.b     d0
  00b75e  544f                 addq.w    #$2, a7
  00b760  671a                 beq.b     $b77c
  00b762  4227                 clr.b     -(a7)
  00b764  3f3c0002             move.w    #$2, -(a7)
  00b768  61ffffff6616         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b76e  42a7                 clr.l     -(a7)
  00b770  61ffffffeeda         bsr.l     $a64c   ; ContinueGame
  00b776  504f                 addq.w    #$8, a7
  00b778  600000e6             bra.w     $b860
  00b77c  3f3c0022             move.w    #$22, -(a7)
  00b780  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b786  4a00                 tst.b     d0
  00b788  544f                 addq.w    #$2, a7
  00b78a  6718                 beq.b     $b7a4
  00b78c  4227                 clr.b     -(a7)
  00b78e  3f3c0003             move.w    #$3, -(a7)
  00b792  61ffffff65ec         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b798  61fffffff6a4         bsr.l     $ae3e   ; Instructions
  00b79e  584f                 addq.w    #$4, a7
  00b7a0  600000be             bra.w     $b860
  00b7a4  3f3c0022             move.w    #$22, -(a7)
  00b7a8  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b7ae  4a00                 tst.b     d0
  00b7b0  544f                 addq.w    #$2, a7
  00b7b2  6610                 bne.b     $b7c4
  00b7b4  3f3c0023             move.w    #$23, -(a7)
  00b7b8  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b7be  4a00                 tst.b     d0
  00b7c0  544f                 addq.w    #$2, a7
  00b7c2  6718                 beq.b     $b7dc
  00b7c4  4227                 clr.b     -(a7)
  00b7c6  3f3c0004             move.w    #$4, -(a7)
  00b7ca  61ffffff65b4         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b7d0  61fffffffb8c         bsr.l     $b35e   ; Options
  00b7d6  584f                 addq.w    #$4, a7
  00b7d8  60000086             bra.w     $b860
  00b7dc  3f3c0008             move.w    #$8, -(a7)
  00b7e0  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b7e6  4a00                 tst.b     d0
  00b7e8  544f                 addq.w    #$2, a7
  00b7ea  6716                 beq.b     $b802
  00b7ec  4227                 clr.b     -(a7)
  00b7ee  3f3c0005             move.w    #$5, -(a7)
  00b7f2  61ffffff658c         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b7f8  61fffffffc68         bsr.l     $b462   ; Credits
  00b7fe  584f                 addq.w    #$4, a7
  00b800  605e                 bra.b     $b860
  00b802  3f3c000c             move.w    #$c, -(a7)
  00b806  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b80c  4a00                 tst.b     d0
  00b80e  544f                 addq.w    #$2, a7
  00b810  6716                 beq.b     $b828
  00b812  4227                 clr.b     -(a7)
  00b814  3f3c0006             move.w    #$6, -(a7)
  00b818  61ffffff6566         bsr.l     $1d80   ; TrackClickOnCommandButton
  00b81e  61ff00000082         bsr.l     $b8a2   ; Quit
  00b824  584f                 addq.w    #$4, a7
  00b826  6038                 bra.b     $b860
  00b828  3f3c0007             move.w    #$7, -(a7)
  00b82c  4eb900000b60         jsr       $b60.l   ; IsPressed
  00b832  4a00                 tst.b     d0
  00b834  544f                 addq.w    #$2, a7
  00b836  6728                 beq.b     $b860
  00b838  4a43                 tst.w     d3
  00b83a  6624                 bne.b     $b860
  00b83c  761e                 moveq     #$1e, d3
  00b83e  2f3c000a0100         move.l    #$a0100, -(a7)
  00b844  2f390000836a         move.l    $836a.l, -(a7)   ; snd206_Harry
  00b84a  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  00b850  487900004e8a         pea.l     $4e8a.l   ; g_4e8a
  00b856  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00b85c  4fef000c             lea.l     $c(a7), a7
  00b860  4a3900013c28         tst.b     $13c28.l   ; g_13c28
  00b866  670e                 beq.b     $b876
  00b868  48790000712a         pea.l     $712a.l   ; g_712a
  00b86e  61ffffffeddc         bsr.l     $a64c   ; ContinueGame
  00b874  584f                 addq.w    #$4, a7
  00b876  4a43                 tst.w     d3
  00b878  6f02                 ble.b     $b87c
  00b87a  5343                 subq.w    #$1, d3
  00b87c  61ff000000c8         bsr.l     $b946   ; CheckEvent
  00b882  4eb900000270         jsr       $270.l   ; MusicIdle
  00b888  4a04                 tst.b     d4
  00b88a  6700fcc0             beq.w     $b54c
  00b88e  4cdf0038             movem.l   (a7)+, d3-d5
  00b892  4e5e                 unlk      a6
  00b894  4e75                 rts       

;-------------------------------------------------------------
; Quit   (seg 1 +00b8a2, 156 bytes)
  00b8a2  4e560000             link.w    a6, #$0
  00b8a6  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00b8ac  a850                 _InitCursor 
  00b8ae  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00b8b4  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00b8ba  2f3c0000ff7f         move.l    #$ff7f, -(a7)
  00b8c0  201f                 move.l    (a7)+, d0
  00b8c2  a032                 _FlushEvents 
  00b8c4  4eb900000148         jsr       $148.l   ; seg7+604a
  00b8ca  48780001             pea.l     $1.w
  00b8ce  4267                 clr.w     -(a7)
  00b8d0  61ffffffa7cc         bsr.l     $609e   ; FadeMusic
  00b8d6  4eb900000278         jsr       $278.l   ; ShutDownMusic
  00b8dc  61ff000009dc         bsr.l     $c2ba   ; CloseResourceFiles
  00b8e2  3f3c0008             move.w    #$8, -(a7)
  00b8e6  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00b8ec  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00b8f2  a937                 _DrawMenuBar 
  00b8f4  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00b8fa  a916                 _HideWindow 
  00b8fc  4eb900000b10         jsr       $b10.l   ; SwitchToOldDepth
  00b902  4a3900007f1b         tst.b     $7f1b.l   ; g_7f1b
  00b908  504f                 addq.w    #$8, a7
  00b90a  6708                 beq.b     $b914
  00b90c  4eb900000ac8         jsr       $ac8.l   ; FinalGammaFadeIn
  00b912  6006                 bra.b     $b91a
  00b914  4eb900000ad0         jsr       $ad0.l   ; FinalGammaRestore
  00b91a  4eb900000298         jsr       $298.l   ; DisposeGammaTools
  00b920  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00b926  4eb900000b40         jsr       $b40.l   ; CleanUpCursors
  00b92c  4eb9000001a0         jsr       $1a0.l   ; seg7+8350
  00b932  4eb900000040         jsr       $40.l   ; SATSOUNDSHUTUP
  00b938  a9f4                 _ExitToShell 
  00b93a  4e5e                 unlk      a6
  00b93c  4e75                 rts       

;-------------------------------------------------------------
; CheckEvent   (seg 1 +00b946, 50 bytes)
  00b946  4e56ffee             link.w    a6, #$ffee
  00b94a  554f                 subq.w    #$2, a7
  00b94c  3f3cffff             move.w    #$ffff, -(a7)
  00b950  486efff0             pea.l     -$10(a6)
  00b954  48780001             pea.l     $1.w
  00b958  42a7                 clr.l     -(a7)
  00b95a  a860                 _WaitNextEvent 
  00b95c  101f                 move.b    (a7)+, d0
  00b95e  1d40ffef             move.b    d0, -$11(a6)
  00b962  4a2effef             tst.b     -$11(a6)
  00b966  670c                 beq.b     $b974
  00b968  486efff0             pea.l     -$10(a6)
  00b96c  61ff00000018         bsr.l     $b986   ; HandleEvent
  00b972  584f                 addq.w    #$4, a7
  00b974  4e5e                 unlk      a6
  00b976  4e75                 rts       

;-------------------------------------------------------------
; HandleEvent   (seg 1 +00b986, 146 bytes)
  00b986  4e56fffe             link.w    a6, #$fffe
  00b98a  2f0a                 move.l    a2, -(a7)
  00b98c  246e0008             movea.l   $8(a6), a2
  00b990  7000                 moveq     #$0, d0
  00b992  3012                 move.w    (a2), d0
  00b994  5380                 subq.l    #$1, d0
  00b996  671a                 beq.b     $b9b2
  00b998  5580                 subq.l    #$2, d0
  00b99a  6722                 beq.b     $b9be
  00b99c  5580                 subq.l    #$2, d0
  00b99e  671e                 beq.b     $b9be
  00b9a0  5380                 subq.l    #$1, d0
  00b9a2  6746                 beq.b     $b9ea
  00b9a4  5580                 subq.l    #$2, d0
  00b9a6  676a                 beq.b     $ba12
  00b9a8  5f80                 subq.l    #$7, d0
  00b9aa  674a                 beq.b     $b9f6
  00b9ac  5180                 subq.l    #$8, d0
  00b9ae  6752                 beq.b     $ba02
  00b9b0  6060                 bra.b     $ba12
  00b9b2  2f0a                 move.l    a2, -(a7)
  00b9b4  61ff00000070         bsr.l     $ba26   ; HandleMouseEvent
  00b9ba  584f                 addq.w    #$4, a7
  00b9bc  6054                 bra.b     $ba12
  00b9be  302a000e             move.w    $e(a2), d0
  00b9c2  028000000100         andi.l    #$100, d0
  00b9c8  6748                 beq.b     $ba12
  00b9ca  594f                 subq.w    #$4, a7
  00b9cc  202a0002             move.l    $2(a2), d0
  00b9d0  0280000000ff         andi.l    #$ff, d0
  00b9d6  4880                 ext.w     d0
  00b9d8  3f00                 move.w    d0, -(a7)
  00b9da  a93e                 _MenuKey  
  00b9dc  201f                 move.l    (a7)+, d0
  00b9de  2f00                 move.l    d0, -(a7)
  00b9e0  4eb900000a48         jsr       $a48.l   ; HandleMenuSelection
  00b9e6  584f                 addq.w    #$4, a7
  00b9e8  6028                 bra.b     $ba12
  00b9ea  2f0a                 move.l    a2, -(a7)
  00b9ec  61ff0000024e         bsr.l     $bc3c   ; HandleUpdateEvent
  00b9f2  584f                 addq.w    #$4, a7
  00b9f4  601c                 bra.b     $ba12
  00b9f6  2f0a                 move.l    a2, -(a7)
  00b9f8  61ff0000028e         bsr.l     $bc88   ; HandleOSEvent
  00b9fe  584f                 addq.w    #$4, a7
  00ba00  6010                 bra.b     $ba12
  00ba02  554f                 subq.w    #$2, a7
  00ba04  2f0a                 move.l    a2, -(a7)
  00ba06  303c021b             move.w    #$21b, d0
  00ba0a  a816                 _trap_a816 
  00ba0c  301f                 move.w    (a7)+, d0
  00ba0e  3d40fffe             move.w    d0, -$2(a6)
  00ba12  245f                 movea.l   (a7)+, a2
  00ba14  4e5e                 unlk      a6
  00ba16  4e75                 rts       

;-------------------------------------------------------------
; HandleMouseEvent   (seg 1 +00ba26, 52 bytes)
  00ba26  4e560000             link.w    a6, #$0
  00ba2a  4a39000046cc         tst.b     $46cc.l   ; g_46cc
  00ba30  6724                 beq.b     $ba56
  00ba32  206e0008             movea.l   $8(a6), a0
  00ba36  0c680014000a         cmpi.w    #$14, $a(a0)
  00ba3c  6c18                 bge.b     $ba56
  00ba3e  594f                 subq.w    #$4, a7
  00ba40  206e0008             movea.l   $8(a6), a0
  00ba44  2f28000a             move.l    $a(a0), -(a7)
  00ba48  a93d                 _MenuSelect 
  00ba4a  201f                 move.l    (a7)+, d0
  00ba4c  2f00                 move.l    d0, -(a7)
  00ba4e  4eb900000a48         jsr       $a48.l   ; HandleMenuSelection
  00ba54  584f                 addq.w    #$4, a7
  00ba56  4e5e                 unlk      a6
  00ba58  4e75                 rts       

;-------------------------------------------------------------
; HandleResSwitch   (seg 1 +00ba6e, 444 bytes)
  00ba6e  4e56fff0             link.w    a6, #$fff0
  00ba72  2f0a                 move.l    a2, -(a7)
  00ba74  594f                 subq.w    #$4, a7
  00ba76  aa2a                 _GetMainDevice 
  00ba78  205f                 movea.l   (a7)+, a0
  00ba7a  2448                 movea.l   a0, a2
  00ba7c  2052                 movea.l   (a2), a0
  00ba7e  20680016             movea.l   $16(a0), a0
  00ba82  2050                 movea.l   (a0), a0
  00ba84  2d680006fff8         move.l    $6(a0), -$8(a6)
  00ba8a  2d68000afffc         move.l    $a(a0), -$4(a6)
  00ba90  554f                 subq.w    #$2, a7
  00ba92  487900013c84         pea.l     $13c84.l   ; g_13c84
  00ba98  486efff8             pea.l     -$8(a6)
  00ba9c  a8a6                 _EqualRect 
  00ba9e  101f                 move.b    (a7)+, d0
  00baa0  66000182             bne.w     $bc24
  00baa4  303900013c86         move.w    $13c86.l, d0   ; g_13c86
  00baaa  48c0                 ext.l     d0
  00baac  323900013c8a         move.w    $13c8a.l, d1   ; g_13c8a
  00bab2  48c1                 ext.l     d1
  00bab4  9280                 sub.l     d0, d1
  00bab6  0c8100000280         cmpi.l    #$280, d1
  00babc  6d1a                 blt.b     $bad8
  00babe  303900013c84         move.w    $13c84.l, d0   ; g_13c84
  00bac4  48c0                 ext.l     d0
  00bac6  323900013c88         move.w    $13c88.l, d1   ; g_13c88
  00bacc  48c1                 ext.l     d1
  00bace  9280                 sub.l     d0, d1
  00bad0  0c81000001e0         cmpi.l    #$1e0, d1
  00bad6  6c14                 bge.b     $baec
  00bad8  487900004e1c         pea.l     $4e1c.l   ; g_4e1c
  00bade  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00bae4  61fffffffdbc         bsr.l     $b8a2   ; Quit
  00baea  584f                 addq.w    #$4, a7
  00baec  2052                 movea.l   (a2), a0
  00baee  20680016             movea.l   $16(a0), a0
  00baf2  2050                 movea.l   (a0), a0
  00baf4  30280004             move.w    $4(a0), d0
  00baf8  028000003fff         andi.l    #$3fff, d0
  00bafe  23c0000082f6         move.l    d0, $82f6.l   ; g_82f6
  00bb04  302efffa             move.w    -$6(a6), d0
  00bb08  48c0                 ext.l     d0
  00bb0a  322efffe             move.w    -$2(a6), d1
  00bb0e  48c1                 ext.l     d1
  00bb10  9280                 sub.l     d0, d1
  00bb12  0681fffffd80         addi.l    #$fffffd80, d1
  00bb18  2001                 move.l    d1, d0
  00bb1a  e088                 lsr.l     #$8, d0
  00bb1c  e088                 lsr.l     #$8, d0
  00bb1e  e088                 lsr.l     #$8, d0
  00bb20  ee88                 lsr.l     #$7, d0
  00bb22  d081                 add.l     d1, d0
  00bb24  e280                 asr.l     #$1, d0
  00bb26  322efff8             move.w    -$8(a6), d1
  00bb2a  48c1                 ext.l     d1
  00bb2c  342efffc             move.w    -$4(a6), d2
  00bb30  48c2                 ext.l     d2
  00bb32  9481                 sub.l     d1, d2
  00bb34  0682fffffe20         addi.l    #$fffffe20, d2
  00bb3a  2202                 move.l    d2, d1
  00bb3c  e089                 lsr.l     #$8, d1
  00bb3e  e089                 lsr.l     #$8, d1
  00bb40  e089                 lsr.l     #$8, d1
  00bb42  ee89                 lsr.l     #$7, d1
  00bb44  d282                 add.l     d2, d1
  00bb46  e281                 asr.l     #$1, d1
  00bb48  4c391800000082f6     muls.l    $82f6.l, d1   ; g_82f6
  00bb50  2d40fff0             move.l    d0, -$10(a6)
  00bb54  2d41fff4             move.l    d1, -$c(a6)
  00bb58  594f                 subq.w    #$4, a7
  00bb5a  2052                 movea.l   (a2), a0
  00bb5c  2f280016             move.l    $16(a0), -(a7)
  00bb60  203c0004000f         move.l    #$4000f, d0
  00bb66  ab1d                 _QDExtensions 
  00bb68  205f                 movea.l   (a7)+, a0
  00bb6a  d1eefff4             adda.l    -$c(a6), a0
  00bb6e  d1eefff0             adda.l    -$10(a6), a0
  00bb72  23c8000082f2         move.l    a0, $82f2.l   ; g_82f2
  00bb78  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bb7e  302efffa             move.w    -$6(a6), d0
  00bb82  48c0                 ext.l     d0
  00bb84  322efffe             move.w    -$2(a6), d1
  00bb88  48c1                 ext.l     d1
  00bb8a  9280                 sub.l     d0, d1
  00bb8c  3f01                 move.w    d1, -(a7)
  00bb8e  302efff8             move.w    -$8(a6), d0
  00bb92  48c0                 ext.l     d0
  00bb94  322efffc             move.w    -$4(a6), d1
  00bb98  48c1                 ext.l     d1
  00bb9a  9280                 sub.l     d0, d1
  00bb9c  3f01                 move.w    d1, -(a7)
  00bb9e  1f3c0001             move.b    #$1, -(a7)
  00bba2  a91d                 _SizeWindow 
  00bba4  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bbaa  42a7                 clr.l     -(a7)
  00bbac  1f3c0001             move.b    #$1, -(a7)
  00bbb0  a91b                 _MoveWindow 
  00bbb2  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00bbb8  302efffa             move.w    -$6(a6), d0
  00bbbc  48c0                 ext.l     d0
  00bbbe  322efffe             move.w    -$2(a6), d1
  00bbc2  48c1                 ext.l     d1
  00bbc4  9280                 sub.l     d0, d1
  00bbc6  0681fffffd80         addi.l    #$fffffd80, d1
  00bbcc  2001                 move.l    d1, d0
  00bbce  e088                 lsr.l     #$8, d0
  00bbd0  e088                 lsr.l     #$8, d0
  00bbd2  e088                 lsr.l     #$8, d0
  00bbd4  ee88                 lsr.l     #$7, d0
  00bbd6  d081                 add.l     d1, d0
  00bbd8  e280                 asr.l     #$1, d0
  00bbda  4480                 neg.l     d0
  00bbdc  3f00                 move.w    d0, -(a7)
  00bbde  302efff8             move.w    -$8(a6), d0
  00bbe2  48c0                 ext.l     d0
  00bbe4  322efffc             move.w    -$4(a6), d1
  00bbe8  48c1                 ext.l     d1
  00bbea  9280                 sub.l     d0, d1
  00bbec  0681fffffe20         addi.l    #$fffffe20, d1
  00bbf2  2001                 move.l    d1, d0
  00bbf4  e088                 lsr.l     #$8, d0
  00bbf6  e088                 lsr.l     #$8, d0
  00bbf8  e088                 lsr.l     #$8, d0
  00bbfa  ee88                 lsr.l     #$7, d0
  00bbfc  d081                 add.l     d1, d0
  00bbfe  e280                 asr.l     #$1, d0
  00bc00  4480                 neg.l     d0
  00bc02  3f00                 move.w    d0, -(a7)
  00bc04  a878                 _SetOrigin 
  00bc06  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00bc0c  2052                 movea.l   (a2), a0
  00bc0e  20680016             movea.l   $16(a0), a0
  00bc12  2050                 movea.l   (a0), a0
  00bc14  23e8000600013c84     move.l    $6(a0), $13c84.l   ; g_13c84
  00bc1c  23e8000a00013c88     move.l    $a(a0), $13c88.l   ; g_13c88
  00bc24  245f                 movea.l   (a7)+, a2
  00bc26  4e5e                 unlk      a6
  00bc28  4e75                 rts       

;-------------------------------------------------------------
; HandleUpdateEvent   (seg 1 +00bc3c, 56 bytes)
  00bc3c  4e560000             link.w    a6, #$0
  00bc40  4a39000046cc         tst.b     $46cc.l   ; g_46cc
  00bc46  6728                 beq.b     $bc70
  00bc48  4eb900000b08         jsr       $b08.l   ; SwitchTo8BitColor
  00bc4e  61fffffffe1e         bsr.l     $ba6e   ; HandleResSwitch
  00bc54  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00bc5a  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bc60  a922                 _BeginUpdate 
  00bc62  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00bc68  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bc6e  a923                 _EndUpdate 
  00bc70  4e5e                 unlk      a6
  00bc72  4e75                 rts       

;-------------------------------------------------------------
; HandleOSEvent   (seg 1 +00bc88, 180 bytes)
  00bc88  4e56fffa             link.w    a6, #$fffa
  00bc8c  48e71020             movem.l   d3/a2, -(a7)
  00bc90  246e0008             movea.l   $8(a6), a2
  00bc94  7600                 moveq     #$0, d3
  00bc96  422effff             clr.b     -$1(a6)
  00bc9a  262a0002             move.l    $2(a2), d3
  00bc9e  7218                 moveq     #$18, d1
  00bca0  e2ab                 lsr.l     d1, d3
  00bca2  7001                 moveq     #$1, d0
  00bca4  b680                 cmp.l     d0, d3
  00bca6  6600008c             bne.w     $bd34
  00bcaa  594f                 subq.w    #$4, a7
  00bcac  a924                 _FrontWindow 
  00bcae  205f                 movea.l   (a7)+, a0
  00bcb0  2d48fffa             move.l    a0, -$6(a6)
  00bcb4  7001                 moveq     #$1, d0
  00bcb6  c0aa0002             and.l     $2(a2), d0
  00bcba  6754                 beq.b     $bd10
  00bcbc  486effff             pea.l     -$1(a6)
  00bcc0  4eb900000150         jsr       $150.l   ; seg7+609a
  00bcc6  3600                 move.w    d0, d3
  00bcc8  4a43                 tst.w     d3
  00bcca  584f                 addq.w    #$4, a7
  00bccc  6614                 bne.b     $bce2
  00bcce  4a2effff             tst.b     -$1(a6)
  00bcd2  670e                 beq.b     $bce2
  00bcd4  4a39000046ce         tst.b     $46ce.l   ; levelDone
  00bcda  6706                 beq.b     $bce2
  00bcdc  61ffffff72f4         bsr.l     $2fd2   ; DrawMainMenu
  00bce2  a850                 _InitCursor 
  00bce4  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bcea  a915                 _ShowWindow 
  00bcec  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00bcf2  303900006180         move.w    $6180.l, d0   ; g_6180
  00bcf8  c1fc1c71             muls.w    #$1c71, d0
  00bcfc  2f00                 move.l    d0, -(a7)
  00bcfe  4eb900000268         jsr       $268.l   ; SetMusicVolume
  00bd04  13fc0001000046cc     move.b    #$1, $46cc.l   ; g_46cc
  00bd0c  584f                 addq.w    #$4, a7
  00bd0e  6024                 bra.b     $bd34
  00bd10  42a7                 clr.l     -(a7)
  00bd12  4eb900000268         jsr       $268.l   ; SetMusicVolume
  00bd18  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00bd1e  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00bd24  a916                 _HideWindow 
  00bd26  4eb900000b48         jsr       $b48.l   ; ShowMenuBar
  00bd2c  4239000046cc         clr.b     $46cc.l   ; g_46cc
  00bd32  584f                 addq.w    #$4, a7
  00bd34  4cdf0408             movem.l   (a7)+, d3/a2
  00bd38  4e5e                 unlk      a6
  00bd3a  4e75                 rts       

;-------------------------------------------------------------
; InitPrefs   (seg 1 +00bd4c, 520 bytes)
  00bd4c  4e560000             link.w    a6, #$0
  00bd50  2f03                 move.l    d3, -(a7)
  00bd52  594f                 subq.w    #$4, a7
  00bd54  2f3c50726566         move.l    #$50726566, -(a7)
  00bd5a  4267                 clr.w     -(a7)
  00bd5c  a81f                 _Get1Resource 
  00bd5e  205f                 movea.l   (a7)+, a0
  00bd60  23c80000583e         move.l    a0, $583e.l   ; g_583e
  00bd66  4ab90000583e         tst.l     $583e.l   ; g_583e
  00bd6c  660001ba             bne.w     $bf28
  00bd70  203c00000930         move.l    #$930, d0
  00bd76  a122                 _NewHandle 
  00bd78  23c80000583e         move.l    a0, $583e.l   ; g_583e
  00bd7e  4ab90000583e         tst.l     $583e.l   ; g_583e
  00bd84  6606                 bne.b     $bd8c
  00bd86  61fffffffb1a         bsr.l     $b8a2   ; Quit
  00bd8c  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bd92  2050                 movea.l   (a0), a0
  00bd94  4210                 clr.b     (a0)
  00bd96  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bd9c  2050                 movea.l   (a0), a0
  00bd9e  42280001             clr.b     $1(a0)
  00bda2  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bda8  2050                 movea.l   (a0), a0
  00bdaa  42280002             clr.b     $2(a0)
  00bdae  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bdb4  2050                 movea.l   (a0), a0
  00bdb6  42280003             clr.b     $3(a0)
  00bdba  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bdc0  2050                 movea.l   (a0), a0
  00bdc2  42280004             clr.b     $4(a0)
  00bdc6  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bdcc  2050                 movea.l   (a0), a0
  00bdce  317c00030008         move.w    #$3, $8(a0)
  00bdd4  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bdda  2050                 movea.l   (a0), a0
  00bddc  117c0001000a         move.b    #$1, $a(a0)
  00bde2  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bde8  2050                 movea.l   (a0), a0
  00bdea  117c0001000b         move.b    #$1, $b(a0)
  00bdf0  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bdf6  2050                 movea.l   (a0), a0
  00bdf8  317c0009000c         move.w    #$9, $c(a0)
  00bdfe  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be04  2050                 movea.l   (a0), a0
  00be06  317c0007000e         move.w    #$7, $e(a0)
  00be0c  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be12  2050                 movea.l   (a0), a0
  00be14  317c007b0010         move.w    #$7b, $10(a0)
  00be1a  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be20  2050                 movea.l   (a0), a0
  00be22  317c007c0012         move.w    #$7c, $12(a0)
  00be28  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be2e  2050                 movea.l   (a0), a0
  00be30  317c007d0014         move.w    #$7d, $14(a0)
  00be36  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be3c  2050                 movea.l   (a0), a0
  00be3e  317c007e0016         move.w    #$7e, $16(a0)
  00be44  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be4a  2050                 movea.l   (a0), a0
  00be4c  317c00310018         move.w    #$31, $18(a0)
  00be52  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be58  2050                 movea.l   (a0), a0
  00be5a  317c003b001a         move.w    #$3b, $1a(a0)
  00be60  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be66  2050                 movea.l   (a0), a0
  00be68  317c003a001c         move.w    #$3a, $1c(a0)
  00be6e  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be74  2050                 movea.l   (a0), a0
  00be76  317c0030001e         move.w    #$30, $1e(a0)
  00be7c  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be82  2050                 movea.l   (a0), a0
  00be84  42280005             clr.b     $5(a0)
  00be88  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be8e  2050                 movea.l   (a0), a0
  00be90  42280006             clr.b     $6(a0)
  00be94  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00be9a  2050                 movea.l   (a0), a0
  00be9c  42280007             clr.b     $7(a0)
  00bea0  7600                 moveq     #$0, d3
  00bea2  600e                 bra.b     $beb2
  00bea4  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00beaa  2250                 movea.l   (a0), a1
  00beac  42713220             clr.w     $20(a1, d3.w * 2)
  00beb0  5243                 addq.w    #$1, d3
  00beb2  0c430008             cmpi.w    #$8, d3
  00beb6  6dec                 blt.b     $bea4
  00beb8  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bebe  2050                 movea.l   (a0), a0
  00bec0  48680030             pea.l     $30(a0)
  00bec4  487900004e0a         pea.l     $4e0a.l   ; g_4e0a
  00beca  4eb900000a88         jsr       $a88.l   ; CopyPString
  00bed0  7600                 moveq     #$0, d3
  00bed2  504f                 addq.w    #$8, a7
  00bed4  6024                 bra.b     $befa
  00bed6  3043                 movea.w   d3, a0
  00bed8  2008                 move.l    a0, d0
  00beda  e188                 lsl.l     #$8, d0
  00bedc  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bee2  2050                 movea.l   (a0), a0
  00bee4  d1c0                 adda.l    d0, a0
  00bee6  48680130             pea.l     $130(a0)
  00beea  4879000051a0         pea.l     $51a0.l   ; g_51a0
  00bef0  4eb900000a88         jsr       $a88.l   ; CopyPString
  00bef6  5243                 addq.w    #$1, d3
  00bef8  504f                 addq.w    #$8, a7
  00befa  0c430008             cmpi.w    #$8, d3
  00befe  6dd6                 blt.b     $bed6
  00bf00  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00bf06  2f3c50726566         move.l    #$50726566, -(a7)
  00bf0c  4267                 clr.w     -(a7)
  00bf0e  487900004dfe         pea.l     $4dfe.l   ; g_4dfe
  00bf14  a9ab                 _AddResource 
  00bf16  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00bf1c  a9aa                 _ChangedResource 
  00bf1e  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00bf24  a9b0                 _WriteResource 
  00bf26  6026                 bra.b     $bf4e
  00bf28  594f                 subq.w    #$4, a7
  00bf2a  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00bf30  4eb900000370         jsr       $370.l   ; seg4+6a2
  00bf36  201f                 move.l    (a7)+, d0
  00bf38  0c8000000930         cmpi.l    #$930, d0
  00bf3e  640e                 bcc.b     $bf4e
  00bf40  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00bf46  203c00000930         move.l    #$930, d0
  00bf4c  a024                 _SetHandleSize 
  00bf4e  261f                 move.l    (a7)+, d3
  00bf50  4e5e                 unlk      a6
  00bf52  4e75                 rts       

;-------------------------------------------------------------
; REDRAWGRID   (seg 1 +00bf60, 376 bytes)
  00bf60  4e56ffe0             link.w    a6, #$ffe0
  00bf64  48e71f00             movem.l   d3-d7, -(a7)
  00bf68  206e0008             movea.l   $8(a6), a0
  00bf6c  2d50ffe0             move.l    (a0), -$20(a6)
  00bf70  2d680004ffe4         move.l    $4(a0), -$1c(a6)
  00bf76  2d7900018668ffe8     move.l    $18668.l, -$18(a6)   ; g_18668
  00bf7e  7c01                 moveq     #$1, d6
  00bf80  382effe0             move.w    -$20(a6), d4
  00bf84  60000126             bra.w     $c0ac
  00bf88  362effe2             move.w    -$1e(a6), d3
  00bf8c  60000114             bra.w     $c0a2
  00bf90  3003                 move.w    d3, d0
  00bf92  48c0                 ext.l     d0
  00bf94  eb88                 lsl.l     #$5, d0
  00bf96  3d40fffa             move.w    d0, -$6(a6)
  00bf9a  3004                 move.w    d4, d0
  00bf9c  48c0                 ext.l     d0
  00bf9e  eb88                 lsl.l     #$5, d0
  00bfa0  3d40fff8             move.w    d0, -$8(a6)
  00bfa4  302efffa             move.w    -$6(a6), d0
  00bfa8  48c0                 ext.l     d0
  00bfaa  7220                 moveq     #$20, d1
  00bfac  d081                 add.l     d1, d0
  00bfae  3d40fffe             move.w    d0, -$2(a6)
  00bfb2  302efff8             move.w    -$8(a6), d0
  00bfb6  48c0                 ext.l     d0
  00bfb8  7220                 moveq     #$20, d1
  00bfba  d081                 add.l     d1, d0
  00bfbc  3d40fffc             move.w    d0, -$4(a6)
  00bfc0  0c430080             cmpi.w    #$80, d3
  00bfc4  6c0000b8             bge.w     $c07e
  00bfc8  4a43                 tst.w     d3
  00bfca  6d0000b2             blt.w     $c07e
  00bfce  0c440080             cmpi.w    #$80, d4
  00bfd2  6c0000aa             bge.w     $c07e
  00bfd6  4a44                 tst.w     d4
  00bfd8  6d0000a4             blt.w     $c07e
  00bfdc  3044                 movea.w   d4, a0
  00bfde  2008                 move.l    a0, d0
  00bfe0  d080                 add.l     d0, d0
  00bfe2  3043                 movea.w   d3, a0
  00bfe4  2208                 move.l    a0, d1
  00bfe6  e189                 lsl.l     #$8, d1
  00bfe8  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00bfee  2050                 movea.l   (a0), a0
  00bff0  d1c1                 adda.l    d1, a0
  00bff2  d1c0                 adda.l    d0, a0
  00bff4  203c00008000         move.l    #$8000, d0
  00bffa  3a300800             move.w    (a0, d0.l), d5
  00bffe  3043                 movea.w   d3, a0
  00c000  2008                 move.l    a0, d0
  00c002  e188                 lsl.l     #$8, d0
  00c004  20790000746c         movea.l   $746c.l, a0   ; hLevel
  00c00a  2050                 movea.l   (a0), a0
  00c00c  d1c0                 adda.l    d0, a0
  00c00e  3e304200             move.w    (a0, d4.w * 2), d7
  00c012  3d6efffafff6         move.w    -$6(a6), -$a(a6)
  00c018  3d6efff8fff4         move.w    -$8(a6), -$c(a6)
  00c01e  0c450038             cmpi.w    #$38, d5
  00c022  6c2a                 bge.b     $c04e
  00c024  701c                 moveq     #$1c, d0
  00c026  c1c7                 muls.w    d7, d0
  00c028  207900007e0e         movea.l   $7e0e.l, a0   ; bgTileFaces
  00c02e  d1c0                 adda.l    d0, a0
  00c030  4850                 pea.l     (a0)
  00c032  42a7                 clr.l     -(a7)
  00c034  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  00c03a  2f2effe8             move.l    -$18(a6), -(a7)
  00c03e  2f2efff4             move.l    -$c(a6), -(a7)
  00c042  2f3c00200020         move.l    #$200020, -(a7)
  00c048  4eb9000002c8         jsr       $2c8.l   ; WRAPDRAWENCTILEPROC
  00c04e  0c45ffff             cmpi.w    #$ffff, d5
  00c052  6f2a                 ble.b     $c07e
  00c054  701c                 moveq     #$1c, d0
  00c056  c1c5                 muls.w    d5, d0
  00c058  207900007e12         movea.l   $7e12.l, a0   ; fgTileFaces
  00c05e  d1c0                 adda.l    d0, a0
  00c060  4850                 pea.l     (a0)
  00c062  42a7                 clr.l     -(a7)
  00c064  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  00c06a  2f2effe8             move.l    -$18(a6), -(a7)
  00c06e  2f2efff4             move.l    -$c(a6), -(a7)
  00c072  2f3c00200020         move.l    #$200020, -(a7)
  00c078  4eb9000002c8         jsr       $2c8.l   ; WRAPDRAWENCTILEPROC
  00c07e  4a06                 tst.b     d6
  00c080  670e                 beq.b     $c090
  00c082  2d6efff8ffec         move.l    -$8(a6), -$14(a6)
  00c088  2d6efffcfff0         move.l    -$4(a6), -$10(a6)
  00c08e  600e                 bra.b     $c09e
  00c090  486effec             pea.l     -$14(a6)
  00c094  486efff8             pea.l     -$8(a6)
  00c098  486effec             pea.l     -$14(a6)
  00c09c  a8ab                 _UnionRect 
  00c09e  7c00                 moveq     #$0, d6
  00c0a0  5243                 addq.w    #$1, d3
  00c0a2  b66effe6             cmp.w     -$1a(a6), d3
  00c0a6  6f00fee8             ble.w     $bf90
  00c0aa  5244                 addq.w    #$1, d4
  00c0ac  b86effe4             cmp.w     -$1c(a6), d4
  00c0b0  6f00fed6             ble.w     $bf88
  00c0b4  4a06                 tst.b     d6
  00c0b6  6616                 bne.b     $c0ce
  00c0b8  4879ffffe826         pea.l     $ffffe826.l   ; g_-17da
  00c0be  4879ffffe80c         pea.l     $ffffe80c.l   ; g_-17f4
  00c0c4  486effec             pea.l     -$14(a6)
  00c0c8  4eb9000002d8         jsr       $2d8.l   ; SAFEWRAPRECTBLIT2
  00c0ce  4cdf00f8             movem.l   (a7)+, d3-d7
  00c0d2  4e5e                 unlk      a6
  00c0d4  4e740004             rtd       #$4

;-------------------------------------------------------------
; CheckSysVersion   (seg 1 +00c0e6, 72 bytes)
  00c0e6  4e56fffa             link.w    a6, #$fffa
  00c0ea  70ff                 moveq     #$ff, d0
  00c0ec  2d40fffc             move.l    d0, -$4(a6)
  00c0f0  554f                 subq.w    #$2, a7
  00c0f2  2f3c73797376         move.l    #$73797376, -(a7)
  00c0f8  486efffc             pea.l     -$4(a6)
  00c0fc  4eb900000368         jsr       $368.l   ; seg4+494
  00c102  301f                 move.w    (a7)+, d0
  00c104  3d40fffa             move.w    d0, -$6(a6)
  00c108  302efffa             move.w    -$6(a6), d0
  00c10c  48c0                 ext.l     d0
  00c10e  660a                 bne.b     $c11a
  00c110  0cae00000700fffc     cmpi.l    #$700, -$4(a6)
  00c118  6c10                 bge.b     $c12a
  00c11a  487900004dd2         pea.l     $4dd2.l   ; g_4dd2
  00c120  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c126  a9f4                 _ExitToShell 
  00c128  584f                 addq.w    #$4, a7
  00c12a  4e5e                 unlk      a6
  00c12c  4e75                 rts       

;-------------------------------------------------------------
; GetProcessorInfo   (seg 1 +00c140, 78 bytes)
  00c140  4e56fffa             link.w    a6, #$fffa
  00c144  70ff                 moveq     #$ff, d0
  00c146  2d40fffc             move.l    d0, -$4(a6)
  00c14a  554f                 subq.w    #$2, a7
  00c14c  2f3c63707574         move.l    #$63707574, -(a7)
  00c152  486efffc             pea.l     -$4(a6)
  00c156  4eb900000368         jsr       $368.l   ; seg4+494
  00c15c  301f                 move.w    (a7)+, d0
  00c15e  3d40fffa             move.w    d0, -$6(a6)
  00c162  33eefffe000046b2     move.w    -$2(a6), $46b2.l   ; g_46b2
  00c16a  554f                 subq.w    #$2, a7
  00c16c  2f3c70636c6b         move.l    #$70636c6b, -(a7)
  00c172  486efffc             pea.l     -$4(a6)
  00c176  4eb900000368         jsr       $368.l   ; seg4+494
  00c17c  301f                 move.w    (a7)+, d0
  00c17e  3d40fffa             move.w    d0, -$6(a6)
  00c182  33eefffe000046b0     move.w    -$2(a6), $46b0.l   ; g_46b0
  00c18a  4e5e                 unlk      a6
  00c18c  4e75                 rts       

;-------------------------------------------------------------
; OpenResourceFiles   (seg 1 +00c1a2, 260 bytes)
  00c1a2  4e560000             link.w    a6, #$0
  00c1a6  48e71800             movem.l   d3-d4, -(a7)
  00c1aa  7600                 moveq     #$0, d3
  00c1ac  554f                 subq.w    #$2, a7
  00c1ae  487900004dc5         pea.l     $4dc5.l   ; g_4dc5
  00c1b4  a997                 _OpenResFile 
  00c1b6  301f                 move.w    (a7)+, d0
  00c1b8  3600                 move.w    d0, d3
  00c1ba  554f                 subq.w    #$2, a7
  00c1bc  a9af                 _ResError 
  00c1be  301f                 move.w    (a7)+, d0
  00c1c0  3800                 move.w    d0, d4
  00c1c2  3004                 move.w    d4, d0
  00c1c4  48c0                 ext.l     d0
  00c1c6  6604                 bne.b     $c1cc
  00c1c8  4a43                 tst.w     d3
  00c1ca  6612                 bne.b     $c1de
  00c1cc  487900004d1e         pea.l     $4d1e.l   ; g_4d1e
  00c1d2  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c1d8  a9f4                 _ExitToShell 
  00c1da  584f                 addq.w    #$4, a7
  00c1dc  6008                 bra.b     $c1e6
  00c1de  33c300005596         move.w    d3, $5596.l   ; g_5596
  00c1e4  7600                 moveq     #$0, d3
  00c1e6  554f                 subq.w    #$2, a7
  00c1e8  487900004d11         pea.l     $4d11.l   ; g_4d11
  00c1ee  a997                 _OpenResFile 
  00c1f0  301f                 move.w    (a7)+, d0
  00c1f2  3600                 move.w    d0, d3
  00c1f4  554f                 subq.w    #$2, a7
  00c1f6  a9af                 _ResError 
  00c1f8  301f                 move.w    (a7)+, d0
  00c1fa  3800                 move.w    d0, d4
  00c1fc  3004                 move.w    d4, d0
  00c1fe  48c0                 ext.l     d0
  00c200  6604                 bne.b     $c206
  00c202  4a43                 tst.w     d3
  00c204  6612                 bne.b     $c218
  00c206  487900004c6a         pea.l     $4c6a.l   ; g_4c6a
  00c20c  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c212  a9f4                 _ExitToShell 
  00c214  584f                 addq.w    #$4, a7
  00c216  6008                 bra.b     $c220
  00c218  33c300005594         move.w    d3, $5594.l   ; g_5594
  00c21e  7600                 moveq     #$0, d3
  00c220  554f                 subq.w    #$2, a7
  00c222  487900004c5e         pea.l     $4c5e.l   ; g_4c5e
  00c228  a997                 _OpenResFile 
  00c22a  301f                 move.w    (a7)+, d0
  00c22c  3600                 move.w    d0, d3
  00c22e  554f                 subq.w    #$2, a7
  00c230  a9af                 _ResError 
  00c232  301f                 move.w    (a7)+, d0
  00c234  3800                 move.w    d0, d4
  00c236  3004                 move.w    d4, d0
  00c238  48c0                 ext.l     d0
  00c23a  6604                 bne.b     $c240
  00c23c  4a43                 tst.w     d3
  00c23e  6616                 bne.b     $c256
  00c240  487900004c1a         pea.l     $4c1a.l   ; g_4c1a
  00c246  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c24c  42390000617d         clr.b     $617d.l   ; g_617d
  00c252  584f                 addq.w    #$4, a7
  00c254  6008                 bra.b     $c25e
  00c256  33c300005592         move.w    d3, $5592.l   ; g_5592
  00c25c  7600                 moveq     #$0, d3
  00c25e  554f                 subq.w    #$2, a7
  00c260  487900004c0b         pea.l     $4c0b.l   ; g_4c0b
  00c266  a997                 _OpenResFile 
  00c268  301f                 move.w    (a7)+, d0
  00c26a  3600                 move.w    d0, d3
  00c26c  554f                 subq.w    #$2, a7
  00c26e  a9af                 _ResError 
  00c270  301f                 move.w    (a7)+, d0
  00c272  3800                 move.w    d0, d4
  00c274  3004                 move.w    d4, d0
  00c276  48c0                 ext.l     d0
  00c278  6604                 bne.b     $c27e
  00c27a  4a43                 tst.w     d3
  00c27c  6612                 bne.b     $c290
  00c27e  487900004b62         pea.l     $4b62.l   ; g_4b62
  00c284  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c28a  a9f4                 _ExitToShell 
  00c28c  584f                 addq.w    #$4, a7
  00c28e  600e                 bra.b     $c29e
  00c290  33c300005598         move.w    d3, $5598.l   ; g_5598
  00c296  33c3000080cc         move.w    d3, $80cc.l   ; g_80cc
  00c29c  7600                 moveq     #$0, d3
  00c29e  4cdf0018             movem.l   (a7)+, d3-d4
  00c2a2  4e5e                 unlk      a6
  00c2a4  4e75                 rts       

;-------------------------------------------------------------
; CloseResourceFiles   (seg 1 +00c2ba, 40 bytes)
  00c2ba  4e560000             link.w    a6, #$0
  00c2be  3f3900005598         move.w    $5598.l, -(a7)   ; g_5598
  00c2c4  a99a                 _CloseResFile 
  00c2c6  3f3900005596         move.w    $5596.l, -(a7)   ; g_5596
  00c2cc  a99a                 _CloseResFile 
  00c2ce  3f3900005594         move.w    $5594.l, -(a7)   ; g_5594
  00c2d4  a99a                 _CloseResFile 
  00c2d6  3f3900005592         move.w    $5592.l, -(a7)   ; g_5592
  00c2dc  a99a                 _CloseResFile 
  00c2de  4e5e                 unlk      a6
  00c2e0  4e75                 rts       

;-------------------------------------------------------------
; InitFaces   (seg 1 +00c2f8, 978 bytes)
  00c2f8  4e560000             link.w    a6, #$0
  00c2fc  2f03                 move.l    d3, -(a7)
  00c2fe  594f                 subq.w    #$4, a7
  00c300  2f3c00a000a0         move.l    #$a000a0, -(a7)
  00c306  2f3c00200020         move.l    #$200020, -(a7)
  00c30c  2f3c00080020         move.l    #$80020, -(a7)
  00c312  1f3c0001             move.b    #$1, -(a7)
  00c316  4227                 clr.b     -(a7)
  00c318  4eb900000328         jsr       $328.l   ; LOAD2DFACEARRAY
  00c31e  205f                 movea.l   (a7)+, a0
  00c320  23c800007e16         move.l    a0, $7e16.l   ; g_7e16
  00c326  594f                 subq.w    #$4, a7
  00c328  3f3c0122             move.w    #$122, -(a7)
  00c32c  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c332  205f                 movea.l   (a7)+, a0
  00c334  23c800007e1a         move.l    a0, $7e1a.l   ; g_7e1a
  00c33a  594f                 subq.w    #$4, a7
  00c33c  3f3c2797             move.w    #$2797, -(a7)
  00c340  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c346  205f                 movea.l   (a7)+, a0
  00c348  23c80000f70c         move.l    a0, $f70c.l   ; g_f70c
  00c34e  594f                 subq.w    #$4, a7
  00c350  3f3c2798             move.w    #$2798, -(a7)
  00c354  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c35a  205f                 movea.l   (a7)+, a0
  00c35c  23c80000f710         move.l    a0, $f710.l   ; g_f710
  00c362  594f                 subq.w    #$4, a7
  00c364  3f3c2799             move.w    #$2799, -(a7)
  00c368  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c36e  205f                 movea.l   (a7)+, a0
  00c370  23c80000f714         move.l    a0, $f714.l   ; g_f714
  00c376  594f                 subq.w    #$4, a7
  00c378  3f3c01f2             move.w    #$1f2, -(a7)
  00c37c  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c382  205f                 movea.l   (a7)+, a0
  00c384  23c80000f718         move.l    a0, $f718.l   ; g_f718
  00c38a  594f                 subq.w    #$4, a7
  00c38c  3f3c01f3             move.w    #$1f3, -(a7)
  00c390  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c396  205f                 movea.l   (a7)+, a0
  00c398  23c80000f71c         move.l    a0, $f71c.l   ; g_f71c
  00c39e  7600                 moveq     #$0, d3
  00c3a0  6026                 bra.b     $c3c8
  00c3a2  3f3c1771             move.w    #$1771, -(a7)
  00c3a6  4227                 clr.b     -(a7)
  00c3a8  3003                 move.w    d3, d0
  00c3aa  48c0                 ext.l     d0
  00c3ac  06800000012d         addi.l    #$12d, d0
  00c3b2  3f00                 move.w    d0, -(a7)
  00c3b4  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c3ba  43f900008212         lea.l     $8212.l, a1   ; g_8212
  00c3c0  23883400             move.l    a0, (a1, d3.w * 4)
  00c3c4  5243                 addq.w    #$1, d3
  00c3c6  5c4f                 addq.w    #$6, a7
  00c3c8  0c430005             cmpi.w    #$5, d3
  00c3cc  6dd4                 blt.b     $c3a2
  00c3ce  7600                 moveq     #$0, d3
  00c3d0  6026                 bra.b     $c3f8
  00c3d2  3f3c177b             move.w    #$177b, -(a7)
  00c3d6  4227                 clr.b     -(a7)
  00c3d8  3003                 move.w    d3, d0
  00c3da  48c0                 ext.l     d0
  00c3dc  068000000137         addi.l    #$137, d0
  00c3e2  3f00                 move.w    d0, -(a7)
  00c3e4  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c3ea  43f90000823a         lea.l     $823a.l, a1   ; g_823a
  00c3f0  23883400             move.l    a0, (a1, d3.w * 4)
  00c3f4  5243                 addq.w    #$1, d3
  00c3f6  5c4f                 addq.w    #$6, a7
  00c3f8  0c430005             cmpi.w    #$5, d3
  00c3fc  6dd4                 blt.b     $c3d2
  00c3fe  3f3c1785             move.w    #$1785, -(a7)
  00c402  1f3c0001             move.b    #$1, -(a7)
  00c406  3f3c012c             move.w    #$12c, -(a7)
  00c40a  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c410  23c800008262         move.l    a0, $8262.l   ; g_8262
  00c416  3f3c1786             move.w    #$1786, -(a7)
  00c41a  1f3c0001             move.b    #$1, -(a7)
  00c41e  3f3c0136             move.w    #$136, -(a7)
  00c422  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c428  23c800008266         move.l    a0, $8266.l   ; g_8266
  00c42e  3f3c178f             move.w    #$178f, -(a7)
  00c432  4227                 clr.b     -(a7)
  00c434  3f3c07d1             move.w    #$7d1, -(a7)
  00c438  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c43e  23c80000f724         move.l    a0, $f724.l   ; g_f724
  00c444  3f3c1790             move.w    #$1790, -(a7)
  00c448  4227                 clr.b     -(a7)
  00c44a  3f3c0bb9             move.w    #$bb9, -(a7)
  00c44e  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c454  23c80000f728         move.l    a0, $f728.l   ; g_f728
  00c45a  3f3c1792             move.w    #$1792, -(a7)
  00c45e  4227                 clr.b     -(a7)
  00c460  3f3c03fb             move.w    #$3fb, -(a7)
  00c464  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c46a  23c80000f72c         move.l    a0, $f72c.l   ; g_f72c
  00c470  3f3c1793             move.w    #$1793, -(a7)
  00c474  4227                 clr.b     -(a7)
  00c476  3f3c0405             move.w    #$405, -(a7)
  00c47a  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c480  23c80000f730         move.l    a0, $f730.l   ; g_f730
  00c486  3f3c1794             move.w    #$1794, -(a7)
  00c48a  4227                 clr.b     -(a7)
  00c48c  3f3c040f             move.w    #$40f, -(a7)
  00c490  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c496  23c80000f734         move.l    a0, $f734.l   ; g_f734
  00c49c  3f3c1795             move.w    #$1795, -(a7)
  00c4a0  4227                 clr.b     -(a7)
  00c4a2  3f3c0419             move.w    #$419, -(a7)
  00c4a6  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c4ac  23c80000f738         move.l    a0, $f738.l   ; g_f738
  00c4b2  4ab90000f734         tst.l     $f734.l   ; g_f734
  00c4b8  4fef0030             lea.l     $30(a7), a7
  00c4bc  6710                 beq.b     $c4ce
  00c4be  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c4c4  22790000f734         movea.l   $f734.l, a1   ; g_f734
  00c4ca  23480018             move.l    a0, $18(a1)
  00c4ce  4ab90000f738         tst.l     $f738.l   ; g_f738
  00c4d4  6710                 beq.b     $c4e6
  00c4d6  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c4dc  22790000f738         movea.l   $f738.l, a1   ; g_f738
  00c4e2  23480018             move.l    a0, $18(a1)
  00c4e6  4ab90000f72c         tst.l     $f72c.l   ; g_f72c
  00c4ec  6710                 beq.b     $c4fe
  00c4ee  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c4f4  22790000f72c         movea.l   $f72c.l, a1   ; g_f72c
  00c4fa  23480018             move.l    a0, $18(a1)
  00c4fe  4ab90000f730         tst.l     $f730.l   ; g_f730
  00c504  6710                 beq.b     $c516
  00c506  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c50c  22790000f730         movea.l   $f730.l, a1   ; g_f730
  00c512  23480018             move.l    a0, $18(a1)
  00c516  3f3c1799             move.w    #$1799, -(a7)
  00c51a  4227                 clr.b     -(a7)
  00c51c  3f3c1069             move.w    #$1069, -(a7)
  00c520  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c526  23c80000f73c         move.l    a0, $f73c.l   ; g_f73c
  00c52c  3f3c179a             move.w    #$179a, -(a7)
  00c530  4227                 clr.b     -(a7)
  00c532  3f3c106a             move.w    #$106a, -(a7)
  00c536  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c53c  23c80000f740         move.l    a0, $f740.l   ; g_f740
  00c542  3f3c179b             move.w    #$179b, -(a7)
  00c546  4227                 clr.b     -(a7)
  00c548  3f3c106b             move.w    #$106b, -(a7)
  00c54c  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c552  23c80000f744         move.l    a0, $f744.l   ; g_f744
  00c558  3f3c179c             move.w    #$179c, -(a7)
  00c55c  4227                 clr.b     -(a7)
  00c55e  3f3c106c             move.w    #$106c, -(a7)
  00c562  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c568  23c80000f748         move.l    a0, $f748.l   ; g_f748
  00c56e  4ab90000f73c         tst.l     $f73c.l   ; g_f73c
  00c574  4fef0018             lea.l     $18(a7), a7
  00c578  6710                 beq.b     $c58a
  00c57a  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c580  22790000f73c         movea.l   $f73c.l, a1   ; g_f73c
  00c586  23480018             move.l    a0, $18(a1)
  00c58a  4ab90000f740         tst.l     $f740.l   ; g_f740
  00c590  6710                 beq.b     $c5a2
  00c592  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c598  22790000f740         movea.l   $f740.l, a1   ; g_f740
  00c59e  23480018             move.l    a0, $18(a1)
  00c5a2  4ab90000f744         tst.l     $f744.l   ; g_f744
  00c5a8  6710                 beq.b     $c5ba
  00c5aa  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c5b0  22790000f744         movea.l   $f744.l, a1   ; g_f744
  00c5b6  23480018             move.l    a0, $18(a1)
  00c5ba  4ab90000f748         tst.l     $f748.l   ; g_f748
  00c5c0  6710                 beq.b     $c5d2
  00c5c2  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c5c8  22790000f748         movea.l   $f748.l, a1   ; g_f748
  00c5ce  23480018             move.l    a0, $18(a1)
  00c5d2  3f3c17a3             move.w    #$17a3, -(a7)
  00c5d6  4227                 clr.b     -(a7)
  00c5d8  3f3c0649             move.w    #$649, -(a7)
  00c5dc  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c5e2  23c80000f74c         move.l    a0, $f74c.l   ; g_f74c
  00c5e8  3f3c17a4             move.w    #$17a4, -(a7)
  00c5ec  4227                 clr.b     -(a7)
  00c5ee  3f3c0653             move.w    #$653, -(a7)
  00c5f2  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c5f8  23c80000f750         move.l    a0, $f750.l   ; g_f750
  00c5fe  3f3c17a5             move.w    #$17a5, -(a7)
  00c602  4227                 clr.b     -(a7)
  00c604  3f3c065d             move.w    #$65d, -(a7)
  00c608  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c60e  23c80000f754         move.l    a0, $f754.l   ; g_f754
  00c614  3f3c17a6             move.w    #$17a6, -(a7)
  00c618  4227                 clr.b     -(a7)
  00c61a  3f3c0667             move.w    #$667, -(a7)
  00c61e  4eb900000a20         jsr       $a20.l   ; Load1EncFaceFromCicn
  00c624  23c80000f758         move.l    a0, $f758.l   ; g_f758
  00c62a  4ab90000f74c         tst.l     $f74c.l   ; g_f74c
  00c630  4fef0018             lea.l     $18(a7), a7
  00c634  6710                 beq.b     $c646
  00c636  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c63c  22790000f74c         movea.l   $f74c.l, a1   ; g_f74c
  00c642  23480018             move.l    a0, $18(a1)
  00c646  4ab90000f750         tst.l     $f750.l   ; g_f750
  00c64c  6710                 beq.b     $c65e
  00c64e  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c654  22790000f750         movea.l   $f750.l, a1   ; g_f750
  00c65a  23480018             move.l    a0, $18(a1)
  00c65e  4ab90000f754         tst.l     $f754.l   ; g_f754
  00c664  6710                 beq.b     $c676
  00c666  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c66c  22790000f754         movea.l   $f754.l, a1   ; g_f754
  00c672  23480018             move.l    a0, $18(a1)
  00c676  4ab90000f758         tst.l     $f758.l   ; g_f758
  00c67c  6710                 beq.b     $c68e
  00c67e  41f900000588         lea.l     $588.l, a0   ; USERTINTABLESPRITEDRAWPROC
  00c684  22790000f758         movea.l   $f758.l, a1   ; g_f758
  00c68a  23480018             move.l    a0, $18(a1)
  00c68e  42a7                 clr.l     -(a7)
  00c690  2f3c00080000         move.l    #$80000, -(a7)
  00c696  2f3c00040004         move.l    #$40004, -(a7)
  00c69c  2f3c00aa0020         move.l    #$aa0020, -(a7)
  00c6a2  4eb900000a28         jsr       $a28.l   ; LoadEncFaceSetFromPICT
  00c6a8  23c80000f75c         move.l    a0, $f75c.l   ; g_f75c
  00c6ae  3f3c00c8             move.w    #$c8, -(a7)
  00c6b2  4eb9000000b8         jsr       $b8.l   ; SATGETFACE
  00c6b8  205f                 movea.l   (a7)+, a0
  00c6ba  23c80000f720         move.l    a0, $f720.l   ; g_f720
  00c6c0  4fef000c             lea.l     $c(a7), a7
  00c6c4  261f                 move.l    (a7)+, d3
  00c6c6  4e5e                 unlk      a6
  00c6c8  4e75                 rts       

;-------------------------------------------------------------
; Warning030   (seg 1 +00c6d6, 346 bytes)
  00c6d6  4e56ffec             link.w    a6, #$ffec
  00c6da  48e71c20             movem.l   d3-d5/a2, -(a7)
  00c6de  7600                 moveq     #$0, d3
  00c6e0  7800                 moveq     #$0, d4
  00c6e2  7a00                 moveq     #$0, d5
  00c6e4  7001                 moveq     #$1, d0
  00c6e6  2d40ffec             move.l    d0, -$14(a6)
  00c6ea  4a7900006192         tst.w     $6192.l   ; g_6192
  00c6f0  66000136             bne.w     $c828
  00c6f4  a850                 _InitCursor 
  00c6f6  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00c6fc  594f                 subq.w    #$4, a7
  00c6fe  3f3c0096             move.w    #$96, -(a7)
  00c702  42a7                 clr.l     -(a7)
  00c704  4878ffff             pea.l     $ffff.w
  00c708  a97c                 _GetNewDialog 
  00c70a  205f                 movea.l   (a7)+, a0
  00c70c  2448                 movea.l   a0, a2
  00c70e  2f0a                 move.l    a2, -(a7)
  00c710  a873                 _SetPort  
  00c712  2f0a                 move.l    a2, -(a7)
  00c714  a922                 _BeginUpdate 
  00c716  2f0a                 move.l    a2, -(a7)
  00c718  3f3c0001             move.w    #$1, -(a7)
  00c71c  486efff4             pea.l     -$c(a6)
  00c720  486efff0             pea.l     -$10(a6)
  00c724  486efff6             pea.l     -$a(a6)
  00c728  a98d                 _GetDialogItem 
  00c72a  486efff6             pea.l     -$a(a6)
  00c72e  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00c734  a8a9                 _InsetRect 
  00c736  2f3c00030003         move.l    #$30003, -(a7)
  00c73c  a89b                 _PenSize  
  00c73e  486efff6             pea.l     -$a(a6)
  00c742  2f3c000f000f         move.l    #$f000f, -(a7)
  00c748  a8b0                 _FrameRoundRect 
  00c74a  2f0a                 move.l    a2, -(a7)
  00c74c  a923                 _EndUpdate 
  00c74e  2f0a                 move.l    a2, -(a7)
  00c750  a981                 _DrawDialog 
  00c752  2f0a                 move.l    a2, -(a7)
  00c754  a915                 _ShowWindow 
  00c756  2f0a                 move.l    a2, -(a7)
  00c758  a91f                 _SelectWindow 
  00c75a  602c                 bra.b     $c788
  00c75c  42a7                 clr.l     -(a7)
  00c75e  486efffe             pea.l     -$2(a6)
  00c762  a991                 _ModalDialog 
  00c764  302efffe             move.w    -$2(a6), d0
  00c768  48c0                 ext.l     d0
  00c76a  5380                 subq.l    #$1, d0
  00c76c  670a                 beq.b     $c778
  00c76e  5380                 subq.l    #$1, d0
  00c770  670a                 beq.b     $c77c
  00c772  5980                 subq.l    #$4, d0
  00c774  670c                 beq.b     $c782
  00c776  6010                 bra.b     $c788
  00c778  7601                 moveq     #$1, d3
  00c77a  600c                 bra.b     $c788
  00c77c  7601                 moveq     #$1, d3
  00c77e  7801                 moveq     #$1, d4
  00c780  6006                 bra.b     $c788
  00c782  7601                 moveq     #$1, d3
  00c784  7801                 moveq     #$1, d4
  00c786  7a01                 moveq     #$1, d5
  00c788  4a03                 tst.b     d3
  00c78a  67d0                 beq.b     $c75c
  00c78c  2f0a                 move.l    a2, -(a7)
  00c78e  a983                 _DisposeDialog 
  00c790  4a04                 tst.b     d4
  00c792  6602                 bne.b     $c796
  00c794  a9f4                 _ExitToShell 
  00c796  4a05                 tst.b     d5
  00c798  6700008e             beq.w     $c828
  00c79c  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00c7a2  48790000f708         pea.l     $f708.l   ; g_f708
  00c7a8  2f3c70726566         move.l    #$70726566, -(a7)
  00c7ae  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00c7b4  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00c7ba  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00c7c0  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00c7c6  4fef0014             lea.l     $14(a7), a7
  00c7ca  6708                 beq.b     $c7d4
  00c7cc  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00c7d2  a998                 _UseResFile 
  00c7d4  61fffffff576         bsr.l     $bd4c   ; InitPrefs
  00c7da  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00c7e0  a998                 _UseResFile 
  00c7e2  20790000583e         movea.l   $583e.l, a0   ; g_583e
  00c7e8  2050                 movea.l   (a0), a0
  00c7ea  317c00010020         move.w    #$1, $20(a0)
  00c7f0  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00c7f6  a9aa                 _ChangedResource 
  00c7f8  2f390000583e         move.l    $583e.l, -(a7)   ; g_583e
  00c7fe  a9b0                 _WriteResource 
  00c800  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00c806  61ffffffe980         bsr.l     $b188   ; MakeCurrPrefs
  00c80c  4eb900000a40         jsr       $a40.l   ; UpdateMenus
  00c812  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00c818  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00c81e  a998                 _UseResFile 
  00c820  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00c826  a99a                 _CloseResFile 
  00c828  4cdf0438             movem.l   (a7)+, d3-d5/a2
  00c82c  4e5e                 unlk      a6
  00c82e  4e75                 rts       

;-------------------------------------------------------------
; LevelLimit   (seg 1 +00c83e, 200 bytes)
  00c83e  4e56ffec             link.w    a6, #$ffec
  00c842  48e71820             movem.l   d3-d4/a2, -(a7)
  00c846  7600                 moveq     #$0, d3
  00c848  7800                 moveq     #$0, d4
  00c84a  7001                 moveq     #$1, d0
  00c84c  2d40ffec             move.l    d0, -$14(a6)
  00c850  a850                 _InitCursor 
  00c852  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  00c858  594f                 subq.w    #$4, a7
  00c85a  3f3c00aa             move.w    #$aa, -(a7)
  00c85e  42a7                 clr.l     -(a7)
  00c860  4878ffff             pea.l     $ffff.w
  00c864  a97c                 _GetNewDialog 
  00c866  205f                 movea.l   (a7)+, a0
  00c868  2448                 movea.l   a0, a2
  00c86a  2f0a                 move.l    a2, -(a7)
  00c86c  a873                 _SetPort  
  00c86e  2f0a                 move.l    a2, -(a7)
  00c870  a922                 _BeginUpdate 
  00c872  2f0a                 move.l    a2, -(a7)
  00c874  3f3c0001             move.w    #$1, -(a7)
  00c878  486efff4             pea.l     -$c(a6)
  00c87c  486efff0             pea.l     -$10(a6)
  00c880  486efff6             pea.l     -$a(a6)
  00c884  a98d                 _GetDialogItem 
  00c886  486efff6             pea.l     -$a(a6)
  00c88a  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  00c890  a8a9                 _InsetRect 
  00c892  2f3c00030003         move.l    #$30003, -(a7)
  00c898  a89b                 _PenSize  
  00c89a  486efff6             pea.l     -$a(a6)
  00c89e  2f3c000f000f         move.l    #$f000f, -(a7)
  00c8a4  a8b0                 _FrameRoundRect 
  00c8a6  2f0a                 move.l    a2, -(a7)
  00c8a8  a923                 _EndUpdate 
  00c8aa  2f0a                 move.l    a2, -(a7)
  00c8ac  a981                 _DrawDialog 
  00c8ae  2f0a                 move.l    a2, -(a7)
  00c8b0  a915                 _ShowWindow 
  00c8b2  2f0a                 move.l    a2, -(a7)
  00c8b4  a91f                 _SelectWindow 
  00c8b6  6020                 bra.b     $c8d8
  00c8b8  42a7                 clr.l     -(a7)
  00c8ba  486efffe             pea.l     -$2(a6)
  00c8be  a991                 _ModalDialog 
  00c8c0  302efffe             move.w    -$2(a6), d0
  00c8c4  48c0                 ext.l     d0
  00c8c6  5380                 subq.l    #$1, d0
  00c8c8  6706                 beq.b     $c8d0
  00c8ca  5380                 subq.l    #$1, d0
  00c8cc  6706                 beq.b     $c8d4
  00c8ce  6008                 bra.b     $c8d8
  00c8d0  7601                 moveq     #$1, d3
  00c8d2  6004                 bra.b     $c8d8
  00c8d4  7601                 moveq     #$1, d3
  00c8d6  7801                 moveq     #$1, d4
  00c8d8  4a03                 tst.b     d3
  00c8da  67dc                 beq.b     $c8b8
  00c8dc  2f0a                 move.l    a2, -(a7)
  00c8de  a983                 _DisposeDialog 
  00c8e0  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00c8e6  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00c8ec  4a04                 tst.b     d4
  00c8ee  660e                 bne.b     $c8fe
  00c8f0  1f3c0001             move.b    #$1, -(a7)
  00c8f4  4eb900000158         jsr       $158.l   ; seg7+6114
  00c8fa  3600                 move.w    d0, d3
  00c8fc  544f                 addq.w    #$2, a7
  00c8fe  4cdf0418             movem.l   (a7)+, d3-d4/a2
  00c902  4e5e                 unlk      a6
  00c904  4e75                 rts       

;-------------------------------------------------------------
; main   (seg 1 +00c914, 878 bytes)
  00c914  4e56fff8             link.w    a6, #$fff8
  00c918  2f03                 move.l    d3, -(a7)
  00c91a  7600                 moveq     #$0, d3
  00c91c  594f                 subq.w    #$4, a7
  00c91e  aa2a                 _GetMainDevice 
  00c920  205f                 movea.l   (a7)+, a0
  00c922  2050                 movea.l   (a0), a0
  00c924  20680016             movea.l   $16(a0), a0
  00c928  2050                 movea.l   (a0), a0
  00c92a  2d680006fff8         move.l    $6(a0), -$8(a6)
  00c930  2d68000afffc         move.l    $a(a0), -$4(a6)
  00c936  4eb900000060         jsr       $60.l   ; SATINITTOOLBOX
  00c93c  4eb900000308         jsr       $308.l   ; Randomize
  00c942  4eb9000001f8         jsr       $1f8.l   ; InitBuzzwords
  00c948  3600                 move.w    d0, d3
  00c94a  3003                 move.w    d3, d0
  00c94c  48c0                 ext.l     d0
  00c94e  6710                 beq.b     $c960
  00c950  3f03                 move.w    d3, -(a7)
  00c952  487900004b44         pea.l     $4b44.l   ; g_4b44
  00c958  4eb900000be8         jsr       $be8.l   ; ReportError
  00c95e  5c4f                 addq.w    #$6, a7
  00c960  61fffffff784         bsr.l     $c0e6   ; CheckSysVersion
  00c966  61fffffff7d8         bsr.l     $c140   ; GetProcessorInfo
  00c96c  554f                 subq.w    #$2, a7
  00c96e  a994                 _CurResFile 
  00c970  301f                 move.w    (a7)+, d0
  00c972  33c00000f708         move.w    d0, $f708.l   ; g_f708
  00c978  48790000f70a         pea.l     $f70a.l   ; g_f70a
  00c97e  48790000f708         pea.l     $f708.l   ; g_f708
  00c984  2f3c70726566         move.l    #$70726566, -(a7)
  00c98a  2f3c3f3f3f3f         move.l    #$3f3f3f3f, -(a7)
  00c990  4879000051c0         pea.l     $51c0.l   ; g_51c0
  00c996  4eb9000002a0         jsr       $2a0.l   ; SetPrefFile
  00c99c  4a790000f70a         tst.w     $f70a.l   ; g_f70a
  00c9a2  4fef0014             lea.l     $14(a7), a7
  00c9a6  6708                 beq.b     $c9b0
  00c9a8  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00c9ae  a998                 _UseResFile 
  00c9b0  61fffffff39a         bsr.l     $bd4c   ; InitPrefs
  00c9b6  61ffffffe7d0         bsr.l     $b188   ; MakeCurrPrefs
  00c9bc  302efffa             move.w    -$6(a6), d0
  00c9c0  48c0                 ext.l     d0
  00c9c2  322efffe             move.w    -$2(a6), d1
  00c9c6  48c1                 ext.l     d1
  00c9c8  9280                 sub.l     d0, d1
  00c9ca  0c8100000280         cmpi.l    #$280, d1
  00c9d0  6d16                 blt.b     $c9e8
  00c9d2  302efff8             move.w    -$8(a6), d0
  00c9d6  48c0                 ext.l     d0
  00c9d8  322efffc             move.w    -$4(a6), d1
  00c9dc  48c1                 ext.l     d1
  00c9de  9280                 sub.l     d0, d1
  00c9e0  0c81000001e0         cmpi.l    #$1e0, d1
  00c9e6  6c10                 bge.b     $c9f8
  00c9e8  487900004af2         pea.l     $4af2.l   ; g_4af2
  00c9ee  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00c9f4  a9f4                 _ExitToShell 
  00c9f6  584f                 addq.w    #$4, a7
  00c9f8  0c790003000046b2     cmpi.w    #$3, $46b2.l   ; g_46b2
  00ca00  6e06                 bgt.b     $ca08
  00ca02  61fffffffcd2         bsr.l     $c6d6   ; Warning030
  00ca08  3f390000f708         move.w    $f708.l, -(a7)   ; g_f708
  00ca0e  a998                 _UseResFile 
  00ca10  3f390000f70a         move.w    $f70a.l, -(a7)   ; g_f70a
  00ca16  a99a                 _CloseResFile 
  00ca18  61fffffff788         bsr.l     $c1a2   ; OpenResourceFiles
  00ca1e  4eb900000a70         jsr       $a70.l   ; InstallAppleEvents
  00ca24  4eb900000290         jsr       $290.l   ; SetupGammaTools
  00ca2a  4eb900000b18         jsr       $b18.l   ; InitCursorUtils
  00ca30  4eb900000b00         jsr       $b00.l   ; InitDepthSwitch
  00ca36  1f3c0001             move.b    #$1, -(a7)
  00ca3a  4eb900000140         jsr       $140.l   ; _tail_5fd0
  00ca40  3600                 move.w    d0, d3
  00ca42  4a43                 tst.w     d3
  00ca44  544f                 addq.w    #$2, a7
  00ca46  6710                 beq.b     $ca58
  00ca48  3f03                 move.w    d3, -(a7)
  00ca4a  487900004aa6         pea.l     $4aa6.l   ; g_4aa6
  00ca50  4eb900000be8         jsr       $be8.l   ; ReportError
  00ca56  5c4f                 addq.w    #$6, a7
  00ca58  4eb900000a38         jsr       $a38.l   ; LoadMenuBar
  00ca5e  4a00                 tst.b     d0
  00ca60  6710                 beq.b     $ca72
  00ca62  487900004a8e         pea.l     $4a8e.l   ; g_4a8e
  00ca68  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00ca6e  a9f4                 _ExitToShell 
  00ca70  584f                 addq.w    #$4, a7
  00ca72  3f3c0008             move.w    #$8, -(a7)
  00ca76  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00ca7c  4eb900000b08         jsr       $b08.l   ; SwitchTo8BitColor
  00ca82  61ffffff3b76         bsr.l     $5fa
  00ca88  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00ca8e  a915                 _ShowWindow 
  00ca90  2f39ffffe7ee         move.l    $ffffe7ee.l, -(a7)   ; g_-1812
  00ca96  a91f                 _SelectWindow 
  00ca98  4eb900000b50         jsr       $b50.l   ; HideMenuBar
  00ca9e  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00caa4  3f3c0008             move.w    #$8, -(a7)
  00caa8  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00caae  3f3c002d             move.w    #$2d, -(a7)
  00cab2  4eb900000b60         jsr       $b60.l   ; IsPressed
  00cab8  4a00                 tst.b     d0
  00caba  5c4f                 addq.w    #$6, a7
  00cabc  6724                 beq.b     $cae2
  00cabe  3f3c0003             move.w    #$3, -(a7)
  00cac2  4eb900000b60         jsr       $b60.l   ; IsPressed
  00cac8  4a00                 tst.b     d0
  00caca  544f                 addq.w    #$2, a7
  00cacc  6714                 beq.b     $cae2
  00cace  4239000045f7         clr.b     $45f7.l   ; g_45f7
  00cad4  487900004a7c         pea.l     $4a7c.l   ; g_4a7c
  00cada  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00cae0  584f                 addq.w    #$4, a7
  00cae2  3f3c007a             move.w    #$7a, -(a7)
  00cae6  4eb900000b60         jsr       $b60.l   ; IsPressed
  00caec  4a00                 tst.b     d0
  00caee  544f                 addq.w    #$2, a7
  00caf0  6714                 beq.b     $cb06
  00caf2  487900004a62         pea.l     $4a62.l   ; g_4a62
  00caf8  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00cafe  423900005590         clr.b     $5590.l   ; g_5590
  00cb04  584f                 addq.w    #$4, a7
  00cb06  2f3c56220000         move.l    #$56220000, -(a7)
  00cb0c  1f3c0001             move.b    #$1, -(a7)
  00cb10  3f3c0008             move.w    #$8, -(a7)
  00cb14  4eb900000198         jsr       $198.l   ; seg7+818e
  00cb1a  3600                 move.w    d0, d3
  00cb1c  3003                 move.w    d3, d0
  00cb1e  48c0                 ext.l     d0
  00cb20  504f                 addq.w    #$8, a7
  00cb22  6716                 beq.b     $cb3a
  00cb24  0c43fc17             cmpi.w    #$fc17, d3
  00cb28  6710                 beq.b     $cb3a
  00cb2a  487900004a48         pea.l     $4a48.l   ; g_4a48
  00cb30  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00cb36  a9f4                 _ExitToShell 
  00cb38  584f                 addq.w    #$4, a7
  00cb3a  4eb9000001b0         jsr       $1b0.l   ; seg7+83fc
  00cb40  3f00                 move.w    d0, -(a7)
  00cb42  4eb9000001a8         jsr       $1a8.l   ; seg7+83a8
  00cb48  7000                 moveq     #$0, d0
  00cb4a  10390000617d         move.b    $617d.l, d0   ; g_617d
  00cb50  33c00000f6d6         move.w    d0, $f6d6.l   ; g_f6d6
  00cb56  4eb900000258         jsr       $258.l   ; InitMusic
  00cb5c  4eb900000288         jsr       $288.l   ; IsQuickTimeInstalled
  00cb62  4a00                 tst.b     d0
  00cb64  544f                 addq.w    #$2, a7
  00cb66  660c                 bne.b     $cb74
  00cb68  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  00cb6e  42390000617d         clr.b     $617d.l   ; g_617d
  00cb74  303900006180         move.w    $6180.l, d0   ; g_6180
  00cb7a  c1fc1c71             muls.w    #$1c71, d0
  00cb7e  2f00                 move.l    d0, -(a7)
  00cb80  4eb900000268         jsr       $268.l   ; SetMusicVolume
  00cb86  3f3c0258             move.w    #$258, -(a7)
  00cb8a  4eb900000260         jsr       $260.l   ; SetMusic
  00cb90  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00cb96  61ffffff3d4c         bsr.l     $8e4   ; InitNonLevelSounds
  00cb9c  61ffffff420e         bsr.l     $dac   ; InitSounds
  00cba2  61ffffff48e6         bsr.l     $148a   ; InitAppGlobals
  00cba8  3f3c0008             move.w    #$8, -(a7)
  00cbac  4eb900000ab8         jsr       $ab8.l   ; GammaFadeOut
  00cbb2  4879000055a2         pea.l     $55a2.l   ; g_55a2
  00cbb8  3f3c0080             move.w    #$80, -(a7)
  00cbbc  4eb900000ab0         jsr       $ab0.l   ; DrawPICTToBackScreen
  00cbc2  3f3c0008             move.w    #$8, -(a7)
  00cbc6  4eb900000ac0         jsr       $ac0.l   ; GammaFadeIn
  00cbcc  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  00cbd2  4eb9000000e8         jsr       $e8.l   ; SATREDRAW
  00cbd8  3f3c000e             move.w    #$e, -(a7)
  00cbdc  4eb900000b60         jsr       $b60.l   ; IsPressed
  00cbe2  4a00                 tst.b     d0
  00cbe4  4fef0012             lea.l     $12(a7), a7
  00cbe8  6726                 beq.b     $cc10
  00cbea  3f3c0001             move.w    #$1, -(a7)
  00cbee  4eb900000b60         jsr       $b60.l   ; IsPressed
  00cbf4  4a00                 tst.b     d0
  00cbf6  544f                 addq.w    #$2, a7
  00cbf8  6716                 beq.b     $cc10
  00cbfa  13fc0001000080ca     move.b    #$1, $80ca.l   ; g_80ca
  00cc02  487900004a00         pea.l     $4a00.l   ; g_4a00
  00cc08  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00cc0e  584f                 addq.w    #$4, a7
  00cc10  3f3c00e4             move.w    #$e4, -(a7)
  00cc14  2f3c00cd01a7         move.l    #$cd01a7, -(a7)
  00cc1a  4eb900000ae8         jsr       $ae8.l   ; Init3DProgBar
  00cc20  61ffffff3a30         bsr.l     $652   ; InitSprites
  00cc26  61fffffff6d0         bsr.l     $c2f8   ; InitFaces
  00cc2c  61ffffff4b96         bsr.l     $17c4   ; InitTiles
  00cc32  61ffffff4d96         bsr.l     $19ca   ; InitTileHotRects
  00cc38  2f3c00010000         move.l    #$10000, -(a7)
  00cc3e  4eb900000af0         jsr       $af0.l   ; Update3DProgBar
  00cc44  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00cc4a  4a39000080ca         tst.b     $80ca.l   ; g_80ca
  00cc50  4fef000a             lea.l     $a(a7), a7
  00cc54  6714                 beq.b     $cc6a
  00cc56  4879000049d0         pea.l     $49d0.l   ; g_49d0
  00cc5c  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00cc62  61ffffffec3e         bsr.l     $b8a2   ; Quit
  00cc68  584f                 addq.w    #$4, a7
  00cc6a  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  00cc70  61ffffffe81e         bsr.l     $b490   ; MainMenu
  00cc76  61ffffffec2a         bsr.l     $b8a2   ; Quit
  00cc7c  261f                 move.l    (a7)+, d3
  00cc7e  4e5e                 unlk      a6
  00cc80  4e75                 rts       
