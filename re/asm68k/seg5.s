
;-------------------------------------------------------------
; _tail_c   (seg 5 +00000c, 406 bytes)
  00000c  4ab90000583a         tst.l     $583a.l   ; g_583a
  000012  664e                 bne.b     $62
  000014  42a7                 clr.l     -(a7)
  000016  4eb9000000d8         jsr       $d8.l   ; seg5+d8
  00001c  584f                 addq.w    #$4, a7
  00001e  601a                 bra.b     $3a
  000020  53b90000572a         subq.l    #$1, $572a.l   ; g_572a
  000026  20390000572a         move.l    $572a.l, d0   ; g_572a
  00002c  e588                 lsl.l     #$2, d0
  00002e  41f90000562a         lea.l     $562a.l, a0   ; g_562a
  000034  20700800             movea.l   (a0, d0.l), a0
  000038  4e90                 jsr       (a0)
  00003a  4ab90000572a         tst.l     $572a.l   ; g_572a
  000040  6ede                 bgt.b     $20
  000042  42a7                 clr.l     -(a7)
  000044  4eb9000000da         jsr       $da.l   ; seg5+da
  00004a  4ab900005832         tst.l     $5832.l   ; g_5832
  000050  584f                 addq.w    #$4, a7
  000052  670e                 beq.b     $62
  000054  207900005832         movea.l   $5832.l, a0   ; g_5832
  00005a  4e90                 jsr       (a0)
  00005c  42b900005832         clr.l     $5832.l   ; g_5832
  000062  2f2f0004             move.l    $4(a7), -(a7)
  000066  4eb900000070         jsr       $70.l   ; seg5+70
  00006c  584f                 addq.w    #$4, a7
  00006e  4e75                 rts       
  000070  4ab90000583a         tst.l     $583a.l   ; g_583a
  000076  6606                 bne.b     $7e
  000078  4eb9000004ae         jsr       $4ae.l   ; seg1+4ae
  00007e  42a7                 clr.l     -(a7)
  000080  4eb9000000d8         jsr       $d8.l   ; seg5+d8
  000086  584f                 addq.w    #$4, a7
  000088  601a                 bra.b     $a4
  00008a  53b90000582e         subq.l    #$1, $582e.l   ; g_582e
  000090  20390000582e         move.l    $582e.l, d0   ; g_582e
  000096  e588                 lsl.l     #$2, d0
  000098  41f90000572e         lea.l     $572e.l, a0   ; g_572e
  00009e  20700800             movea.l   (a0, d0.l), a0
  0000a2  4e90                 jsr       (a0)
  0000a4  4ab90000582e         tst.l     $582e.l   ; g_582e
  0000aa  6ede                 bgt.b     $8a
  0000ac  42a7                 clr.l     -(a7)
  0000ae  4eb9000000da         jsr       $da.l   ; seg5+da
  0000b4  4eb9000000d6         jsr       $d6.l   ; seg5+d6
  0000ba  4ab900005836         tst.l     $5836.l   ; g_5836
  0000c0  584f                 addq.w    #$4, a7
  0000c2  670e                 beq.b     $d2
  0000c4  207900005836         movea.l   $5836.l, a0   ; g_5836
  0000ca  4e90                 jsr       (a0)
  0000cc  42b900005836         clr.l     $5836.l   ; g_5836
  0000d2  a9f4                 _ExitToShell 
  0000d4  4e75                 rts       
  0000d6  4e75                 rts       
  0000d8  4e75                 rts       
  0000da  4e75                 rts       
  0000dc  2f2f000c             move.l    $c(a7), -(a7)
  0000e0  2f2f000c             move.l    $c(a7), -(a7)
  0000e4  2f2f000c             move.l    $c(a7), -(a7)
  0000e8  4eb9000000f8         jsr       $f8.l   ; seg5+f8
  0000ee  206f0010             movea.l   $10(a7), a0
  0000f2  4fef000c             lea.l     $c(a7), a7
  0000f6  4e75                 rts       
  0000f8  48e71c00             movem.l   d3-d5, -(a7)
  0000fc  206f0010             movea.l   $10(a7), a0
  000100  2a2f0018             move.l    $18(a7), d5
  000104  7600                 moveq     #$0, d3
  000106  162f0017             move.b    $17(a7), d3
  00010a  7020                 moveq     #$20, d0
  00010c  ba80                 cmp.l     d0, d5
  00010e  655e                 bcs.b     $16e
  000110  7003                 moveq     #$3, d0
  000112  2808                 move.l    a0, d4
  000114  4484                 neg.l     d4
  000116  c880                 and.l     d0, d4
  000118  4a84                 tst.l     d4
  00011a  6708                 beq.b     $124
  00011c  9a84                 sub.l     d4, d5
  00011e  10c3                 move.b    d3, (a0)+
  000120  5384                 subq.l    #$1, d4
  000122  66fa                 bne.b     $11e
  000124  4a83                 tst.l     d3
  000126  6716                 beq.b     $13e
  000128  2003                 move.l    d3, d0
  00012a  7210                 moveq     #$10, d1
  00012c  e3a8                 lsl.l     d1, d0
  00012e  2203                 move.l    d3, d1
  000130  7418                 moveq     #$18, d2
  000132  e5a9                 lsl.l     d2, d1
  000134  8280                 or.l      d0, d1
  000136  2003                 move.l    d3, d0
  000138  e188                 lsl.l     #$8, d0
  00013a  8081                 or.l      d1, d0
  00013c  8680                 or.l      d0, d3
  00013e  2805                 move.l    d5, d4
  000140  ea8c                 lsr.l     #$5, d4
  000142  4a84                 tst.l     d4
  000144  6714                 beq.b     $15a
  000146  20c3                 move.l    d3, (a0)+
  000148  20c3                 move.l    d3, (a0)+
  00014a  20c3                 move.l    d3, (a0)+
  00014c  20c3                 move.l    d3, (a0)+
  00014e  20c3                 move.l    d3, (a0)+
  000150  20c3                 move.l    d3, (a0)+
  000152  20c3                 move.l    d3, (a0)+
  000154  20c3                 move.l    d3, (a0)+
  000156  5384                 subq.l    #$1, d4
  000158  66ec                 bne.b     $146
  00015a  781f                 moveq     #$1f, d4
  00015c  c885                 and.l     d5, d4
  00015e  e48c                 lsr.l     #$2, d4
  000160  4a84                 tst.l     d4
  000162  6706                 beq.b     $16a
  000164  20c3                 move.l    d3, (a0)+
  000166  5384                 subq.l    #$1, d4
  000168  66fa                 bne.b     $164
  00016a  7003                 moveq     #$3, d0
  00016c  ca80                 and.l     d0, d5
  00016e  4a85                 tst.l     d5
  000170  6706                 beq.b     $178
  000172  10c3                 move.b    d3, (a0)+
  000174  5385                 subq.l    #$1, d5
  000176  66fa                 bne.b     $172
  000178  4cdf0038             movem.l   (a7)+, d3-d5
  00017c  4e75                 rts       
  00017e  00000010             ori.b     #$10, d0
  000182  8797                 or.l      d3, (a7)
  000184  f6fd8797fcfb         fbf.l     $8797fe81
  00018a  939a                 sub.l     d1, (a2)+
  00018c  f6fd879afcfb         fbf.l     $879afe89
  000192  00000001             ori.b     #$1, d0
  000196  bd00                 eor.b     d6, d0
  000198  0000078c             ori.b     #$8c, d0
  00019c  9791                 sub.l     d3, (a1)
  00019e  8d97                 or.l      d6, (a7)
  0001a0  839a                 or.l      d1, (a2)+
