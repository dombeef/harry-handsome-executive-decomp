
;-------------------------------------------------------------
; InitBuzzwords   (seg 6 +00000c, 196 bytes)
  00000c  4e56fffc             link.w    a6, #$fffc
  000010  48e71800             movem.l   d3-d4, -(a7)
  000014  7800                 moveq     #$0, d4
  000016  42aefffc             clr.l     -$4(a6)
  00001a  7600                 moveq     #$0, d3
  00001c  604c                 bra.b     $6a
  00001e  594f                 subq.w    #$4, a7
  000020  2f3c53545223         move.l    #$53545223, -(a7)
  000026  3003                 move.w    d3, d0
  000028  48c0                 ext.l     d0
  00002a  068000001af4         addi.l    #$1af4, d0
  000030  3f00                 move.w    d0, -(a7)
  000032  a81f                 _Get1Resource 
  000034  205f                 movea.l   (a7)+, a0
  000036  43f900006b44         lea.l     $6b44.l, a1   ; g_6b44
  00003c  23883400             move.l    a0, (a1, d3.w * 4)
  000040  2008                 move.l    a0, d0
  000042  671a                 beq.b     $5e
  000044  41f900006b44         lea.l     $6b44.l, a0   ; g_6b44
  00004a  20703400             movea.l   (a0, d3.w * 4), a0
  00004e  a04a                 _HNoPurge 
  000050  41f900006b44         lea.l     $6b44.l, a0   ; g_6b44
  000056  2f303400             move.l    (a0, d3.w * 4), -(a7)
  00005a  a992                 _DetachResource 
  00005c  600a                 bra.b     $68
  00005e  554f                 subq.w    #$2, a7
  000060  a9af                 _ResError 
  000062  301f                 move.w    (a7)+, d0
  000064  3800                 move.w    d0, d4
  000066  6008                 bra.b     $70
  000068  5243                 addq.w    #$1, d3
  00006a  0c430005             cmpi.w    #$5, d3
  00006e  6fae                 ble.b     $1e
  000070  7600                 moveq     #$0, d3
  000072  604c                 bra.b     $c0
  000074  594f                 subq.w    #$4, a7
  000076  2f3c53545223         move.l    #$53545223, -(a7)
  00007c  3003                 move.w    d3, d0
  00007e  48c0                 ext.l     d0
  000080  068000001a90         addi.l    #$1a90, d0
  000086  3f00                 move.w    d0, -(a7)
  000088  a81f                 _Get1Resource 
  00008a  205f                 movea.l   (a7)+, a0
  00008c  43f900006b5c         lea.l     $6b5c.l, a1   ; g_6b5c
  000092  23883400             move.l    a0, (a1, d3.w * 4)
  000096  2008                 move.l    a0, d0
  000098  671a                 beq.b     $b4
  00009a  41f900006b5c         lea.l     $6b5c.l, a0   ; g_6b5c
  0000a0  20703400             movea.l   (a0, d3.w * 4), a0
  0000a4  a04a                 _HNoPurge 
  0000a6  41f900006b5c         lea.l     $6b5c.l, a0   ; g_6b5c
  0000ac  2f303400             move.l    (a0, d3.w * 4), -(a7)
  0000b0  a992                 _DetachResource 
  0000b2  600a                 bra.b     $be
  0000b4  554f                 subq.w    #$2, a7
  0000b6  a9af                 _ResError 
  0000b8  301f                 move.w    (a7)+, d0
  0000ba  3800                 move.w    d0, d4
  0000bc  6008                 bra.b     $c6
  0000be  5243                 addq.w    #$1, d3
  0000c0  0c430001             cmpi.w    #$1, d3
  0000c4  6fae                 ble.b     $74
  0000c6  3004                 move.w    d4, d0
  0000c8  4cdf0018             movem.l   (a7)+, d3-d4
  0000cc  4e5e                 unlk      a6
  0000ce  4e75                 rts       

;-------------------------------------------------------------
; GenerateBuzzwords   (seg 6 +0000e0, 582 bytes)
  0000e0  4e56fef8             link.w    a6, #$fef8
  0000e4  48e71820             movem.l   d3-d4/a2, -(a7)
  0000e8  246e0008             movea.l   $8(a6), a2
  0000ec  7800                 moveq     #$0, d4
  0000ee  42aefefc             clr.l     -$104(a6)
  0000f2  2d7900000eb0fef8     move.l    $eb0.l, -$108(a6)   ; g_eb0
  0000fa  4212                 clr.b     (a2)
  0000fc  487900006b64         pea.l     $6b64.l   ; g_6b64
  000102  486eff00             pea.l     -$100(a6)
  000106  2f3900006b44         move.l    $6b44.l, -(a7)   ; g_6b44
  00010c  61ff00000370         bsr.l     $47e   ; PickAString
  000112  486eff01             pea.l     -$ff(a6)
  000116  486efefc             pea.l     -$104(a6)
  00011a  7000                 moveq     #$0, d0
  00011c  102eff00             move.b    -$100(a6), d0
  000120  2f00                 move.l    d0, -(a7)
  000122  4eb900000400         jsr       $400.l   ; seg4+a34
  000128  301f                 move.w    (a7)+, d0
  00012a  3800                 move.w    d0, d4
  00012c  4fef000a             lea.l     $a(a7), a7
  000130  660001ea             bne.w     $31c
  000134  7600                 moveq     #$0, d3
  000136  1d7c0030fef9         move.b    #$30, -$107(a6)
  00013c  6038                 bra.b     $176
  00013e  487900006b66         pea.l     $6b66.l   ; g_6b66
  000144  486eff00             pea.l     -$100(a6)
  000148  2f3900006b48         move.l    $6b48.l, -(a7)   ; g_6b48
  00014e  61ff0000032e         bsr.l     $47e   ; PickAString
  000154  2f2efefc             move.l    -$104(a6), -(a7)
  000158  2f03                 move.l    d3, -(a7)
  00015a  486efef8             pea.l     -$108(a6)
  00015e  48780002             pea.l     $2.w
  000162  486eff01             pea.l     -$ff(a6)
  000166  7000                 moveq     #$0, d0
  000168  102eff00             move.b    -$100(a6), d0
  00016c  2f00                 move.l    d0, -(a7)
  00016e  a9e0                 _Munger   
  000170  201f                 move.l    (a7)+, d0
  000172  2600                 move.l    d0, d3
  000174  504f                 addq.w    #$8, a7
  000176  4a83                 tst.l     d3
  000178  6cc4                 bge.b     $13e
  00017a  7600                 moveq     #$0, d3
  00017c  1d7c0031fef9         move.b    #$31, -$107(a6)
  000182  6038                 bra.b     $1bc
  000184  487900006b68         pea.l     $6b68.l   ; g_6b68
  00018a  486eff00             pea.l     -$100(a6)
  00018e  2f3900006b4c         move.l    $6b4c.l, -(a7)   ; g_6b4c
  000194  61ff000002e8         bsr.l     $47e   ; PickAString
  00019a  2f2efefc             move.l    -$104(a6), -(a7)
  00019e  2f03                 move.l    d3, -(a7)
  0001a0  486efef8             pea.l     -$108(a6)
  0001a4  48780002             pea.l     $2.w
  0001a8  486eff01             pea.l     -$ff(a6)
  0001ac  7000                 moveq     #$0, d0
  0001ae  102eff00             move.b    -$100(a6), d0
  0001b2  2f00                 move.l    d0, -(a7)
  0001b4  a9e0                 _Munger   
  0001b6  201f                 move.l    (a7)+, d0
  0001b8  2600                 move.l    d0, d3
  0001ba  504f                 addq.w    #$8, a7
  0001bc  4a83                 tst.l     d3
  0001be  6cc4                 bge.b     $184
  0001c0  7600                 moveq     #$0, d3
  0001c2  1d7c0032fef9         move.b    #$32, -$107(a6)
  0001c8  6038                 bra.b     $202
  0001ca  487900006b6a         pea.l     $6b6a.l   ; g_6b6a
  0001d0  486eff00             pea.l     -$100(a6)
  0001d4  2f3900006b50         move.l    $6b50.l, -(a7)   ; g_6b50
  0001da  61ff000002a2         bsr.l     $47e   ; PickAString
  0001e0  2f2efefc             move.l    -$104(a6), -(a7)
  0001e4  2f03                 move.l    d3, -(a7)
  0001e6  486efef8             pea.l     -$108(a6)
  0001ea  48780002             pea.l     $2.w
  0001ee  486eff01             pea.l     -$ff(a6)
  0001f2  7000                 moveq     #$0, d0
  0001f4  102eff00             move.b    -$100(a6), d0
  0001f8  2f00                 move.l    d0, -(a7)
  0001fa  a9e0                 _Munger   
  0001fc  201f                 move.l    (a7)+, d0
  0001fe  2600                 move.l    d0, d3
  000200  504f                 addq.w    #$8, a7
  000202  4a83                 tst.l     d3
  000204  6cc4                 bge.b     $1ca
  000206  7600                 moveq     #$0, d3
  000208  1d7c0033fef9         move.b    #$33, -$107(a6)
  00020e  6038                 bra.b     $248
  000210  487900006b6c         pea.l     $6b6c.l   ; g_6b6c
  000216  486eff00             pea.l     -$100(a6)
  00021a  2f3900006b54         move.l    $6b54.l, -(a7)   ; g_6b54
  000220  61ff0000025c         bsr.l     $47e   ; PickAString
  000226  2f2efefc             move.l    -$104(a6), -(a7)
  00022a  2f03                 move.l    d3, -(a7)
  00022c  486efef8             pea.l     -$108(a6)
  000230  48780002             pea.l     $2.w
  000234  486eff01             pea.l     -$ff(a6)
  000238  7000                 moveq     #$0, d0
  00023a  102eff00             move.b    -$100(a6), d0
  00023e  2f00                 move.l    d0, -(a7)
  000240  a9e0                 _Munger   
  000242  201f                 move.l    (a7)+, d0
  000244  2600                 move.l    d0, d3
  000246  504f                 addq.w    #$8, a7
  000248  4a83                 tst.l     d3
  00024a  6cc4                 bge.b     $210
  00024c  7600                 moveq     #$0, d3
  00024e  1d7c0034fef9         move.b    #$34, -$107(a6)
  000254  6038                 bra.b     $28e
  000256  487900006b6e         pea.l     $6b6e.l   ; g_6b6e
  00025c  486eff00             pea.l     -$100(a6)
  000260  2f3900006b58         move.l    $6b58.l, -(a7)   ; g_6b58
  000266  61ff00000216         bsr.l     $47e   ; PickAString
  00026c  2f2efefc             move.l    -$104(a6), -(a7)
  000270  2f03                 move.l    d3, -(a7)
  000272  486efef8             pea.l     -$108(a6)
  000276  48780002             pea.l     $2.w
  00027a  486eff01             pea.l     -$ff(a6)
  00027e  7000                 moveq     #$0, d0
  000280  102eff00             move.b    -$100(a6), d0
  000284  2f00                 move.l    d0, -(a7)
  000286  a9e0                 _Munger   
  000288  201f                 move.l    (a7)+, d0
  00028a  2600                 move.l    d0, d3
  00028c  504f                 addq.w    #$8, a7
  00028e  4a83                 tst.l     d3
  000290  6cc4                 bge.b     $256
  000292  206efefc             movea.l   -$104(a6), a0
  000296  2050                 movea.l   (a0), a0
  000298  0c100061             cmpi.b    #$61, (a0)
  00029c  6d16                 blt.b     $2b4
  00029e  206efefc             movea.l   -$104(a6), a0
  0002a2  2050                 movea.l   (a0), a0
  0002a4  0c10007a             cmpi.b    #$7a, (a0)
  0002a8  6e0a                 bgt.b     $2b4
  0002aa  206efefc             movea.l   -$104(a6), a0
  0002ae  2050                 movea.l   (a0), a0
  0002b0  0610ffe0             addi.b    #$e0, (a0)
  0002b4  206efefc             movea.l   -$104(a6), a0
  0002b8  2050                 movea.l   (a0), a0
  0002ba  0c100022             cmpi.b    #$22, (a0)
  0002be  670c                 beq.b     $2cc
  0002c0  206efefc             movea.l   -$104(a6), a0
  0002c4  2050                 movea.l   (a0), a0
  0002c6  0c10ffd2             cmpi.b    #$d2, (a0)
  0002ca  6628                 bne.b     $2f4
  0002cc  206efefc             movea.l   -$104(a6), a0
  0002d0  2050                 movea.l   (a0), a0
  0002d2  0c2800610001         cmpi.b    #$61, $1(a0)
  0002d8  6d1a                 blt.b     $2f4
  0002da  206efefc             movea.l   -$104(a6), a0
  0002de  2050                 movea.l   (a0), a0
  0002e0  0c28007a0001         cmpi.b    #$7a, $1(a0)
  0002e6  6e0c                 bgt.b     $2f4
  0002e8  206efefc             movea.l   -$104(a6), a0
  0002ec  2050                 movea.l   (a0), a0
  0002ee  0628ffe00001         addi.b    #$e0, $1(a0)
  0002f4  594f                 subq.w    #$4, a7
  0002f6  2f2efefc             move.l    -$104(a6), -(a7)
  0002fa  4eb900000370         jsr       $370.l   ; seg4+6a2
  000300  201f                 move.l    (a7)+, d0
  000302  1480                 move.b    d0, (a2)
  000304  7200                 moveq     #$0, d1
  000306  1200                 move.b    d0, d1
  000308  2001                 move.l    d1, d0
  00030a  206efefc             movea.l   -$104(a6), a0
  00030e  2050                 movea.l   (a0), a0
  000310  43ea0001             lea.l     $1(a2), a1
  000314  a22e                 _BlockMove 
  000316  206efefc             movea.l   -$104(a6), a0
  00031a  a023                 _DisposeHandle 
  00031c  3004                 move.w    d4, d0
  00031e  4cdf0418             movem.l   (a7)+, d3-d4/a2
  000322  4e5e                 unlk      a6
  000324  4e75                 rts       

;-------------------------------------------------------------
; GeneratePhonewords   (seg 6 +00033a, 302 bytes)
  00033a  4e56fef8             link.w    a6, #$fef8
  00033e  48e71820             movem.l   d3-d4/a2, -(a7)
  000342  246e0008             movea.l   $8(a6), a2
  000346  7800                 moveq     #$0, d4
  000348  42aefefc             clr.l     -$104(a6)
  00034c  2d7900000eacfef8     move.l    $eac.l, -$108(a6)   ; g_eac
  000354  4212                 clr.b     (a2)
  000356  487900006b70         pea.l     $6b70.l   ; g_6b70
  00035c  486eff00             pea.l     -$100(a6)
  000360  2f3900006b5c         move.l    $6b5c.l, -(a7)   ; g_6b5c
  000366  61ff00000116         bsr.l     $47e   ; PickAString
  00036c  486eff01             pea.l     -$ff(a6)
  000370  486efefc             pea.l     -$104(a6)
  000374  7000                 moveq     #$0, d0
  000376  102eff00             move.b    -$100(a6), d0
  00037a  2f00                 move.l    d0, -(a7)
  00037c  4eb900000400         jsr       $400.l   ; seg4+a34
  000382  301f                 move.w    (a7)+, d0
  000384  3800                 move.w    d0, d4
  000386  4fef000a             lea.l     $a(a7), a7
  00038a  660000d2             bne.w     $45e
  00038e  7600                 moveq     #$0, d3
  000390  1d7c0030fef9         move.b    #$30, -$107(a6)
  000396  6038                 bra.b     $3d0
  000398  487900006b72         pea.l     $6b72.l   ; g_6b72
  00039e  486eff00             pea.l     -$100(a6)
  0003a2  2f3900006b60         move.l    $6b60.l, -(a7)   ; g_6b60
  0003a8  61ff000000d4         bsr.l     $47e   ; PickAString
  0003ae  2f2efefc             move.l    -$104(a6), -(a7)
  0003b2  2f03                 move.l    d3, -(a7)
  0003b4  486efef8             pea.l     -$108(a6)
  0003b8  48780002             pea.l     $2.w
  0003bc  486eff01             pea.l     -$ff(a6)
  0003c0  7000                 moveq     #$0, d0
  0003c2  102eff00             move.b    -$100(a6), d0
  0003c6  2f00                 move.l    d0, -(a7)
  0003c8  a9e0                 _Munger   
  0003ca  201f                 move.l    (a7)+, d0
  0003cc  2600                 move.l    d0, d3
  0003ce  504f                 addq.w    #$8, a7
  0003d0  4a83                 tst.l     d3
  0003d2  6cc4                 bge.b     $398
  0003d4  206efefc             movea.l   -$104(a6), a0
  0003d8  2050                 movea.l   (a0), a0
  0003da  0c100061             cmpi.b    #$61, (a0)
  0003de  6d16                 blt.b     $3f6
  0003e0  206efefc             movea.l   -$104(a6), a0
  0003e4  2050                 movea.l   (a0), a0
  0003e6  0c10007a             cmpi.b    #$7a, (a0)
  0003ea  6e0a                 bgt.b     $3f6
  0003ec  206efefc             movea.l   -$104(a6), a0
  0003f0  2050                 movea.l   (a0), a0
  0003f2  0610ffe0             addi.b    #$e0, (a0)
  0003f6  206efefc             movea.l   -$104(a6), a0
  0003fa  2050                 movea.l   (a0), a0
  0003fc  0c100022             cmpi.b    #$22, (a0)
  000400  670c                 beq.b     $40e
  000402  206efefc             movea.l   -$104(a6), a0
  000406  2050                 movea.l   (a0), a0
  000408  0c10ffd2             cmpi.b    #$d2, (a0)
  00040c  6628                 bne.b     $436
  00040e  206efefc             movea.l   -$104(a6), a0
  000412  2050                 movea.l   (a0), a0
  000414  0c2800610001         cmpi.b    #$61, $1(a0)
  00041a  6d1a                 blt.b     $436
  00041c  206efefc             movea.l   -$104(a6), a0
  000420  2050                 movea.l   (a0), a0
  000422  0c28007a0001         cmpi.b    #$7a, $1(a0)
  000428  6e0c                 bgt.b     $436
  00042a  206efefc             movea.l   -$104(a6), a0
  00042e  2050                 movea.l   (a0), a0
  000430  0628ffe00001         addi.b    #$e0, $1(a0)
  000436  594f                 subq.w    #$4, a7
  000438  2f2efefc             move.l    -$104(a6), -(a7)
  00043c  4eb900000370         jsr       $370.l   ; seg4+6a2
  000442  201f                 move.l    (a7)+, d0
  000444  1480                 move.b    d0, (a2)
  000446  7200                 moveq     #$0, d1
  000448  1200                 move.b    d0, d1
  00044a  2001                 move.l    d1, d0
  00044c  206efefc             movea.l   -$104(a6), a0
  000450  2050                 movea.l   (a0), a0
  000452  43ea0001             lea.l     $1(a2), a1
  000456  a22e                 _BlockMove 
  000458  206efefc             movea.l   -$104(a6), a0
  00045c  a023                 _DisposeHandle 
  00045e  3004                 move.w    d4, d0
  000460  4cdf0418             movem.l   (a7)+, d3-d4/a2
  000464  4e5e                 unlk      a6
  000466  4e75                 rts       

;-------------------------------------------------------------
; PickAString   (seg 6 +00047e, 98 bytes)
  00047e  4e56fffc             link.w    a6, #$fffc
  000482  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  000486  286e0008             movea.l   $8(a6), a4
  00048a  266e000c             movea.l   $c(a6), a3
  00048e  246e0010             movea.l   $10(a6), a2
  000492  4213                 clr.b     (a3)
  000494  2f0c                 move.l    a4, -(a7)
  000496  61ff00000056         bsr.l     $4ee   ; CountIndexedStringsInHandle
  00049c  3800                 move.w    d0, d4
  00049e  584f                 addq.w    #$4, a7
  0004a0  6736                 beq.b     $4d8
  0004a2  7000                 moveq     #$0, d0
  0004a4  3004                 move.w    d4, d0
  0004a6  2d40fffc             move.l    d0, -$4(a6)
  0004aa  554f                 subq.w    #$2, a7
  0004ac  a861                 _Random   
  0004ae  301f                 move.w    (a7)+, d0
  0004b0  7200                 moveq     #$0, d1
  0004b2  3200                 move.w    d0, d1
  0004b4  4c6e1800fffc         divsl.l   -$4(a6), d0:d1
  0004ba  3600                 move.w    d0, d3
  0004bc  b652                 cmp.w     (a2), d3
  0004be  67e2                 beq.b     $4a2
  0004c0  3483                 move.w    d3, (a2)
  0004c2  7000                 moveq     #$0, d0
  0004c4  3003                 move.w    d3, d0
  0004c6  5280                 addq.l    #$1, d0
  0004c8  3f00                 move.w    d0, -(a7)
  0004ca  2f0c                 move.l    a4, -(a7)
  0004cc  2f0b                 move.l    a3, -(a7)
  0004ce  61ff0000006e         bsr.l     $53e   ; GetIndexedStringInHandle
  0004d4  4fef000a             lea.l     $a(a7), a7
  0004d8  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  0004dc  4e5e                 unlk      a6
  0004de  4e75                 rts       

;-------------------------------------------------------------
; CountIndexedStringsInHandle   (seg 6 +0004ee, 50 bytes)
  0004ee  4e560000             link.w    a6, #$0
  0004f2  2f0a                 move.l    a2, -(a7)
  0004f4  246e0008             movea.l   $8(a6), a2
  0004f8  200a                 move.l    a2, d0
  0004fa  4a80                 tst.l     d0
  0004fc  671a                 beq.b     $518
  0004fe  594f                 subq.w    #$4, a7
  000500  2f0a                 move.l    a2, -(a7)
  000502  4eb900000370         jsr       $370.l   ; seg4+6a2
  000508  201f                 move.l    (a7)+, d0
  00050a  7202                 moveq     #$2, d1
  00050c  b081                 cmp.l     d1, d0
  00050e  6508                 bcs.b     $518
  000510  2052                 movea.l   (a2), a0
  000512  3010                 move.w    (a0), d0
  000514  48c0                 ext.l     d0
  000516  6002                 bra.b     $51a
  000518  7000                 moveq     #$0, d0
  00051a  245f                 movea.l   (a7)+, a2
  00051c  4e5e                 unlk      a6
  00051e  4e75                 rts       

;-------------------------------------------------------------
; GetIndexedStringInHandle   (seg 6 +00053e, 118 bytes)
  00053e  4e560000             link.w    a6, #$0
  000542  48e71e30             movem.l   d3-d6/a2-a3, -(a7)
  000546  266e0008             movea.l   $8(a6), a3
  00054a  246e000c             movea.l   $c(a6), a2
  00054e  3a2e0010             move.w    $10(a6), d5
  000552  4213                 clr.b     (a3)
  000554  4a45                 tst.w     d5
  000556  6f54                 ble.b     $5ac
  000558  2f0a                 move.l    a2, -(a7)
  00055a  61ffffffff92         bsr.l     $4ee   ; CountIndexedStringsInHandle
  000560  ba40                 cmp.w     d0, d5
  000562  584f                 addq.w    #$4, a7
  000564  6e46                 bgt.b     $5ac
  000566  594f                 subq.w    #$4, a7
  000568  2f0a                 move.l    a2, -(a7)
  00056a  4eb900000370         jsr       $370.l   ; seg4+6a2
  000570  201f                 move.l    (a7)+, d0
  000572  2c00                 move.l    d0, d6
  000574  7801                 moveq     #$1, d4
  000576  7602                 moveq     #$2, d3
  000578  600e                 bra.b     $588
  00057a  5244                 addq.w    #$1, d4
  00057c  2052                 movea.l   (a2), a0
  00057e  7000                 moveq     #$0, d0
  000580  10303800             move.b    (a0, d3.l), d0
  000584  5280                 addq.l    #$1, d0
  000586  d680                 add.l     d0, d3
  000588  b845                 cmp.w     d5, d4
  00058a  6c04                 bge.b     $590
  00058c  b686                 cmp.l     d6, d3
  00058e  6dea                 blt.b     $57a
  000590  b845                 cmp.w     d5, d4
  000592  6618                 bne.b     $5ac
  000594  b686                 cmp.l     d6, d3
  000596  6c14                 bge.b     $5ac
  000598  2052                 movea.l   (a2), a0
  00059a  7000                 moveq     #$0, d0
  00059c  10303800             move.b    (a0, d3.l), d0
  0005a0  5280                 addq.l    #$1, d0
  0005a2  2052                 movea.l   (a2), a0
  0005a4  41f03800             lea.l     (a0, d3.l), a0
  0005a8  224b                 movea.l   a3, a1
  0005aa  a22e                 _BlockMove 
  0005ac  4cdf0c78             movem.l   (a7)+, d3-d6/a2-a3
  0005b0  4e5e                 unlk      a6
  0005b2  4e75                 rts       

;-------------------------------------------------------------
; DOABOUTDIALOG   (seg 6 +0005d0, 1210 bytes)
  0005d0  4e560000             link.w    a6, #$0
  0005d4  2f03                 move.l    d3, -(a7)
  0005d6  362e0008             move.w    $8(a6), d3
  0005da  33fcfffd00006ada     move.w    #$fffd, $6ada.l   ; g_6ada
  0005e2  594f                 subq.w    #$4, a7
  0005e4  3f2e000a             move.w    $a(a6), -(a7)
  0005e8  48780000             pea.l     $0.w
  0005ec  4878ffff             pea.l     $ffff.w
  0005f0  a97c                 _GetNewDialog 
  0005f2  205f                 movea.l   (a7)+, a0
  0005f4  23c800006ad6         move.l    a0, $6ad6.l   ; g_6ad6
  0005fa  4ab900006ad6         tst.l     $6ad6.l   ; g_6ad6
  000600  6606                 bne.b     $608
  000602  3f3c0019             move.w    #$19, -(a7)
  000606  a9c8                 _SysBeep  
  000608  33fc010e00006ae4     move.w    #$10e, $6ae4.l   ; g_6ae4
  000610  33fc00aa00006ae6     move.w    #$aa, $6ae6.l   ; g_6ae6
  000618  487900006adc         pea.l     $6adc.l   ; g_6adc
  00061e  2f3c00780022         move.l    #$780022, -(a7)
  000624  3f3900006ae6         move.w    $6ae6.l, -(a7)   ; g_6ae6
  00062a  3f3900006ae4         move.w    $6ae4.l, -(a7)   ; g_6ae4
  000630  a8a7                 _SetRect  
  000632  2f3900006ad6         move.l    $6ad6.l, -(a7)   ; g_6ad6
  000638  a873                 _SetPort  
  00063a  2f3900006ad6         move.l    $6ad6.l, -(a7)   ; g_6ad6
  000640  a915                 _ShowWindow 
  000642  2f3900006ad6         move.l    $6ad6.l, -(a7)   ; g_6ad6
  000648  a981                 _DrawDialog 
  00064a  594f                 subq.w    #$4, a7
  00064c  3f03                 move.w    d3, -(a7)
  00064e  a9bc                 _GetPicture 
  000650  205f                 movea.l   (a7)+, a0
  000652  23c800006aec         move.l    a0, $6aec.l   ; g_6aec
  000658  4ab900006aec         tst.l     $6aec.l   ; g_6aec
  00065e  6606                 bne.b     $666
  000660  3f3c0019             move.w    #$19, -(a7)
  000664  a9c8                 _SysBeep  
  000666  207900006aec         movea.l   $6aec.l, a0   ; g_6aec
  00066c  2050                 movea.l   (a0), a0
  00066e  227900006aec         movea.l   $6aec.l, a1   ; g_6aec
  000674  2251                 movea.l   (a1), a1
  000676  30290006             move.w    $6(a1), d0
  00067a  90680002             sub.w     $2(a0), d0
  00067e  33c000006af0         move.w    d0, $6af0.l   ; g_6af0
  000684  207900006aec         movea.l   $6aec.l, a0   ; g_6aec
  00068a  2050                 movea.l   (a0), a0
  00068c  227900006aec         movea.l   $6aec.l, a1   ; g_6aec
  000692  2251                 movea.l   (a1), a1
  000694  30290008             move.w    $8(a1), d0
  000698  90680004             sub.w     $4(a0), d0
  00069c  33c000006af2         move.w    d0, $6af2.l   ; g_6af2
  0006a2  487900006afe         pea.l     $6afe.l   ; g_6afe
  0006a8  487900006b02         pea.l     $6b02.l   ; g_6b02
  0006ae  203c00080005         move.l    #$80005, d0
  0006b4  ab1d                 _QDExtensions 
  0006b6  487900006b24         pea.l     $6b24.l   ; g_6b24
  0006bc  2f3c010e0022         move.l    #$10e0022, -(a7)
  0006c2  7022                 moveq     #$22, d0
  0006c4  d07900006af2         add.w     $6af2.l, d0   ; g_6af2
  0006ca  3f00                 move.w    d0, -(a7)
  0006cc  303c0096             move.w    #$96, d0
  0006d0  d07900006af0         add.w     $6af0.l, d0   ; g_6af0
  0006d6  06400078             addi.w    #$78, d0
  0006da  3f00                 move.w    d0, -(a7)
  0006dc  a8a7                 _SetRect  
  0006de  487900006b3c         pea.l     $6b3c.l   ; g_6b3c
  0006e4  42a7                 clr.l     -(a7)
  0006e6  2f3c00960088         move.l    #$960088, -(a7)
  0006ec  a8a7                 _SetRect  
  0006ee  554f                 subq.w    #$2, a7
  0006f0  487900006af4         pea.l     $6af4.l   ; g_6af4
  0006f6  3f3c0008             move.w    #$8, -(a7)
  0006fa  207900006aec         movea.l   $6aec.l, a0   ; g_6aec
  000700  2050                 movea.l   (a0), a0
  000702  48680002             pea.l     $2(a0)
  000706  48780000             pea.l     $0.w
  00070a  48780000             pea.l     $0.w
  00070e  42a7                 clr.l     -(a7)
  000710  203c00160000         move.l    #$160000, d0
  000716  ab1d                 _QDExtensions 
  000718  301f                 move.w    (a7)+, d0
  00071a  33c000006afc         move.w    d0, $6afc.l   ; g_6afc
  000720  554f                 subq.w    #$2, a7
  000722  487900006af8         pea.l     $6af8.l   ; g_6af8
  000728  3f3c0001             move.w    #$1, -(a7)
  00072c  487900006b24         pea.l     $6b24.l   ; g_6b24
  000732  48780000             pea.l     $0.w
  000736  48780000             pea.l     $0.w
  00073a  42a7                 clr.l     -(a7)
  00073c  203c00160000         move.l    #$160000, d0
  000742  ab1d                 _QDExtensions 
  000744  301f                 move.w    (a7)+, d0
  000746  33c000006afc         move.w    d0, $6afc.l   ; g_6afc
  00074c  4ab900006af4         tst.l     $6af4.l   ; g_6af4
  000752  6708                 beq.b     $75c
  000754  4a7900006afc         tst.w     $6afc.l   ; g_6afc
  00075a  6706                 beq.b     $762
  00075c  3f3c0019             move.w    #$19, -(a7)
  000760  a9c8                 _SysBeep  
  000762  2f3900006af8         move.l    $6af8.l, -(a7)   ; g_6af8
  000768  48780000             pea.l     $0.w
  00076c  203c00080006         move.l    #$80006, d0
  000772  ab1d                 _QDExtensions 
  000774  7600                 moveq     #$0, d3
  000776  6056                 bra.b     $7ce
  000778  3f3900006b26         move.w    $6b26.l, -(a7)   ; g_6b26
  00077e  303900006b24         move.w    $6b24.l, d0   ; g_6b24
  000784  d07900006b34         add.w     $6b34.l, d0   ; g_6b34
  00078a  3f00                 move.w    d0, -(a7)
  00078c  a893                 _MoveTo   
  00078e  3003                 move.w    d3, d0
  000790  c1fc1900             muls.w    #$1900, d0
  000794  33c000006b36         move.w    d0, $6b36.l   ; g_6b36
  00079a  33f900006b3600006b38 move.w    $6b36.l, $6b38.l   ; g_6b36, g_6b38
  0007a4  33f900006b3600006b3a move.w    $6b36.l, $6b3a.l   ; g_6b36, g_6b3a
  0007ae  487900006b36         pea.l     $6b36.l   ; g_6b36
  0007b4  aa14                 _RGBForeColor 
  0007b6  3f3900006b2a         move.w    $6b2a.l, -(a7)   ; g_6b2a
  0007bc  303900006b24         move.w    $6b24.l, d0   ; g_6b24
  0007c2  d07900006b34         add.w     $6b34.l, d0   ; g_6b34
  0007c8  3f00                 move.w    d0, -(a7)
  0007ca  a891                 _LineTo   
  0007cc  5243                 addq.w    #$1, d3
  0007ce  0c43000a             cmpi.w    #$a, d3
  0007d2  6fa4                 ble.b     $778
  0007d4  7600                 moveq     #$0, d3
  0007d6  6056                 bra.b     $82e
  0007d8  3f3900006b26         move.w    $6b26.l, -(a7)   ; g_6b26
  0007de  303900006b28         move.w    $6b28.l, d0   ; g_6b28
  0007e4  907900006b34         sub.w     $6b34.l, d0   ; g_6b34
  0007ea  3f00                 move.w    d0, -(a7)
  0007ec  a893                 _MoveTo   
  0007ee  3003                 move.w    d3, d0
  0007f0  c1fc1900             muls.w    #$1900, d0
  0007f4  33c000006b36         move.w    d0, $6b36.l   ; g_6b36
  0007fa  33f900006b3600006b38 move.w    $6b36.l, $6b38.l   ; g_6b36, g_6b38
  000804  33f900006b3600006b3a move.w    $6b36.l, $6b3a.l   ; g_6b36, g_6b3a
  00080e  487900006b36         pea.l     $6b36.l   ; g_6b36
  000814  aa14                 _RGBForeColor 
  000816  3f3900006b2a         move.w    $6b2a.l, -(a7)   ; g_6b2a
  00081c  303900006b28         move.w    $6b28.l, d0   ; g_6b28
  000822  907900006b34         sub.w     $6b34.l, d0   ; g_6b34
  000828  3f00                 move.w    d0, -(a7)
  00082a  a891                 _LineTo   
  00082c  5243                 addq.w    #$1, d3
  00082e  0c43000a             cmpi.w    #$a, d3
  000832  6fa4                 ble.b     $7d8
  000834  2f3900006af4         move.l    $6af4.l, -(a7)   ; g_6af4
  00083a  48780000             pea.l     $0.w
  00083e  203c00080006         move.l    #$80006, d0
  000844  ab1d                 _QDExtensions 
  000846  554f                 subq.w    #$2, a7
  000848  594f                 subq.w    #$4, a7
  00084a  2f3900006af4         move.l    $6af4.l, -(a7)   ; g_6af4
  000850  203c00040017         move.l    #$40017, d0
  000856  ab1d                 _QDExtensions 
  000858  205f                 movea.l   (a7)+, a0
  00085a  2f08                 move.l    a0, -(a7)
  00085c  203c00040001         move.l    #$40001, d0
  000862  ab1d                 _QDExtensions 
  000864  101f                 move.b    (a7)+, d0
  000866  5300                 subq.b    #$1, d0
  000868  6706                 beq.b     $870
  00086a  3f3c0019             move.w    #$19, -(a7)
  00086e  a9c8                 _SysBeep  
  000870  207900006af4         movea.l   $6af4.l, a0   ; g_6af4
  000876  48680010             pea.l     $10(a0)
  00087a  a8a3                 _EraseRect 
  00087c  2f3900006aec         move.l    $6aec.l, -(a7)   ; g_6aec
  000882  207900006af4         movea.l   $6af4.l, a0   ; g_6af4
  000888  48680010             pea.l     $10(a0)
  00088c  a8f6                 _DrawPicture 
  00088e  594f                 subq.w    #$4, a7
  000890  2f3900006af4         move.l    $6af4.l, -(a7)   ; g_6af4
  000896  203c00040017         move.l    #$40017, d0
  00089c  ab1d                 _QDExtensions 
  00089e  205f                 movea.l   (a7)+, a0
  0008a0  2f08                 move.l    a0, -(a7)
  0008a2  203c00040002         move.l    #$40002, d0
  0008a8  ab1d                 _QDExtensions 
  0008aa  2f3900006aec         move.l    $6aec.l, -(a7)   ; g_6aec
  0008b0  a9a3                 _ReleaseResource 
  0008b2  2f3900006afe         move.l    $6afe.l, -(a7)   ; g_6afe
  0008b8  2f3900006b02         move.l    $6b02.l, -(a7)   ; g_6b02
  0008be  203c00080006         move.l    #$80006, d0
  0008c4  ab1d                 _QDExtensions 
  0008c6  594f                 subq.w    #$4, a7
  0008c8  a8d8                 _NewRgn   
  0008ca  205f                 movea.l   (a7)+, a0
  0008cc  23c800006b06         move.l    a0, $6b06.l   ; g_6b06
  0008d2  2f3900006b06         move.l    $6b06.l, -(a7)   ; g_6b06
  0008d8  a87a                 _GetClip  
  0008da  487900006adc         pea.l     $6adc.l   ; g_6adc
  0008e0  a87b                 _ClipRect 
  0008e2  427900006b22         clr.w     $6b22.l   ; g_6b22
  0008e8  303c0096             move.w    #$96, d0
  0008ec  d07900006af0         add.w     $6af0.l, d0   ; g_6af0
  0008f2  33c000006b2c         move.w    d0, $6b2c.l   ; g_6b2c
  0008f8  427900006b2e         clr.w     $6b2e.l   ; g_6b2e
  0008fe  427900006b1c         clr.w     $6b1c.l   ; g_6b1c
  000904  427900006b1e         clr.w     $6b1e.l   ; g_6b1e
  00090a  427900006b20         clr.w     $6b20.l   ; g_6b20
  000910  33fcffff00006b16     move.w    #$ffff, $6b16.l   ; g_6b16
  000918  33fcffff00006b18     move.w    #$ffff, $6b18.l   ; g_6b18
  000920  33fcffff00006b1a     move.w    #$ffff, $6b1a.l   ; g_6b1a
  000928  487900006b0a         pea.l     $6b0a.l   ; g_6b0a
  00092e  aa19                 _GetForeColor 
  000930  487900006b10         pea.l     $6b10.l   ; g_6b10
  000936  aa1a                 _GetBackColor 
  000938  487900006b1c         pea.l     $6b1c.l   ; g_6b1c
  00093e  aa14                 _RGBForeColor 
  000940  487900006b16         pea.l     $6b16.l   ; g_6b16
  000946  aa15                 _RGBBackColor 
  000948  600000f2             bra.w     $a3c
  00094c  207900006af4         movea.l   $6af4.l, a0   ; g_6af4
  000952  48680002             pea.l     $2(a0)
  000956  207900006ad6         movea.l   $6ad6.l, a0   ; g_6ad6
  00095c  48680002             pea.l     $2(a0)
  000960  207900006af4         movea.l   $6af4.l, a0   ; g_6af4
  000966  48680010             pea.l     $10(a0)
  00096a  487900006b24         pea.l     $6b24.l   ; g_6b24
  000970  4267                 clr.w     -(a7)
  000972  48780000             pea.l     $0.w
  000976  a8ec                 _CopyBits 
  000978  487900006b24         pea.l     $6b24.l   ; g_6b24
  00097e  4267                 clr.w     -(a7)
  000980  7001                 moveq     #$1, d0
  000982  d07900006b22         add.w     $6b22.l, d0   ; g_6b22
  000988  4440                 neg.w     d0
  00098a  3f00                 move.w    d0, -(a7)
  00098c  a8a8                 _OffsetRect 
  00098e  7001                 moveq     #$1, d0
  000990  d07900006b2e         add.w     $6b2e.l, d0   ; g_6b2e
  000996  33c000006b2e         move.w    d0, $6b2e.l   ; g_6b2e
  00099c  48780003             pea.l     $3.w
  0009a0  487900006b30         pea.l     $6b30.l   ; g_6b30
  0009a6  225f                 movea.l   (a7)+, a1
  0009a8  205f                 movea.l   (a7)+, a0
  0009aa  a03b                 _Delay    
  0009ac  2280                 move.l    d0, (a1)
  0009ae  554f                 subq.w    #$2, a7
  0009b0  a974                 _Button   
  0009b2  101f                 move.b    (a7)+, d0
  0009b4  6738                 beq.b     $9ee
  0009b6  487900006ae8         pea.l     $6ae8.l   ; g_6ae8
  0009bc  a972                 _GetMouse 
  0009be  48780002             pea.l     $2.w
  0009c2  201f                 move.l    (a7)+, d0
  0009c4  a032                 _FlushEvents 
  0009c6  554f                 subq.w    #$2, a7
  0009c8  2f3900006ae8         move.l    $6ae8.l, -(a7)   ; g_6ae8
  0009ce  207900006ad6         movea.l   $6ad6.l, a0   ; g_6ad6
  0009d4  48680010             pea.l     $10(a0)
  0009d8  a8ad                 _PtInRect 
  0009da  101f                 move.b    (a7)+, d0
  0009dc  670a                 beq.b     $9e8
  0009de  33fc000100006ada     move.w    #$1, $6ada.l   ; g_6ada
  0009e6  6006                 bra.b     $9ee
  0009e8  3f3c0019             move.w    #$19, -(a7)
  0009ec  a9c8                 _SysBeep  
  0009ee  0c79000100006ada     cmpi.w    #$1, $6ada.l   ; g_6ada
  0009f6  6710                 beq.b     $a08
  0009f8  303900006b2e         move.w    $6b2e.l, d0   ; g_6b2e
  0009fe  b07900006b2c         cmp.w     $6b2c.l, d0   ; g_6b2c
  000a04  6d00ff46             blt.w     $94c
  000a08  427900006b2e         clr.w     $6b2e.l   ; g_6b2e
  000a0e  427900006b22         clr.w     $6b22.l   ; g_6b22
  000a14  487900006b24         pea.l     $6b24.l   ; g_6b24
  000a1a  2f3c010e0022         move.l    #$10e0022, -(a7)
  000a20  7022                 moveq     #$22, d0
  000a22  d07900006af2         add.w     $6af2.l, d0   ; g_6af2
  000a28  3f00                 move.w    d0, -(a7)
  000a2a  303c0096             move.w    #$96, d0
  000a2e  d07900006af0         add.w     $6af0.l, d0   ; g_6af0
  000a34  06400078             addi.w    #$78, d0
  000a38  3f00                 move.w    d0, -(a7)
  000a3a  a8a7                 _SetRect  
  000a3c  0c79000100006ada     cmpi.w    #$1, $6ada.l   ; g_6ada
  000a44  66a8                 bne.b     $9ee
  000a46  487900006b0a         pea.l     $6b0a.l   ; g_6b0a
  000a4c  aa14                 _RGBForeColor 
  000a4e  487900006b10         pea.l     $6b10.l   ; g_6b10
  000a54  aa15                 _RGBBackColor 
  000a56  2f3900006b06         move.l    $6b06.l, -(a7)   ; g_6b06
  000a5c  a879                 _SetClip  
  000a5e  2f3900006ad6         move.l    $6ad6.l, -(a7)   ; g_6ad6
  000a64  a983                 _DisposeDialog 
  000a66  2f3900006af4         move.l    $6af4.l, -(a7)   ; g_6af4
  000a6c  203c00040004         move.l    #$40004, d0
  000a72  ab1d                 _QDExtensions 
  000a74  2f3900006af8         move.l    $6af8.l, -(a7)   ; g_6af8
  000a7a  203c00040004         move.l    #$40004, d0
  000a80  ab1d                 _QDExtensions 
  000a82  261f                 move.l    (a7)+, d3
  000a84  4e5e                 unlk      a6
  000a86  4e740004             rtd       #$4

;-------------------------------------------------------------
; ISCOLORGAMMAAVAILABLE   (seg 6 +000a9a, 70 bytes)
  000a9a  4e560000             link.w    a6, #$0
  000a9e  4ab900006ad0         tst.l     $6ad0.l   ; g_6ad0
  000aa4  670a                 beq.b     $ab0
  000aa6  1f7900006ad30008     move.b    $6ad3.l, $8(a7)   ; g_6ad3
  000aae  602c                 bra.b     $adc
  000ab0  3f3caa29             move.w    #$aa29, -(a7)
  000ab4  61ff00000b40         bsr.l     $15f6   ; ColorGamma_TrapAvailable
  000aba  4a00                 tst.b     d0
  000abc  544f                 addq.w    #$2, a7
  000abe  660e                 bne.b     $ace
  000ac0  7001                 moveq     #$1, d0
  000ac2  23c000006ad0         move.l    d0, $6ad0.l   ; g_6ad0
  000ac8  422f0008             clr.b     $8(a7)
  000acc  600e                 bra.b     $adc
  000ace  7002                 moveq     #$2, d0
  000ad0  23c000006ad0         move.l    d0, $6ad0.l   ; g_6ad0
  000ad6  1f7c00010008         move.b    #$1, $8(a7)
  000adc  4e5e                 unlk      a6
  000ade  4e75                 rts       

;-------------------------------------------------------------
; STARTFADING   (seg 6 +000af8, 34 bytes)
  000af8  4e560000             link.w    a6, #$0
  000afc  594f                 subq.w    #$4, a7
  000afe  61ff00000062         bsr.l     $b62   ; GETMONITORSTATE
  000b04  205f                 movea.l   (a7)+, a0
  000b06  226e0008             movea.l   $8(a6), a1
  000b0a  2288                 move.l    a0, (a1)
  000b0c  3f7900006ad4000c     move.w    $6ad4.l, $c(a7)   ; g_6ad4
  000b14  4e5e                 unlk      a6
  000b16  4e740004             rtd       #$4

;-------------------------------------------------------------
; STOPFADING   (seg 6 +000b28, 44 bytes)
  000b28  4e560000             link.w    a6, #$0
  000b2c  4a2e0008             tst.b     $8(a6)
  000b30  670e                 beq.b     $b40
  000b32  554f                 subq.w    #$2, a7
  000b34  2f2e000a             move.l    $a(a6), -(a7)
  000b38  61ff00000336         bsr.l     $e70   ; SETMONITORSTATE
  000b3e  301f                 move.w    (a7)+, d0
  000b40  554f                 subq.w    #$2, a7
  000b42  2f2e000a             move.l    $a(a6), -(a7)
  000b46  61ff0000037e         bsr.l     $ec6   ; DISPOSEGAMMAREF
  000b4c  301f                 move.w    (a7)+, d0
  000b4e  4e5e                 unlk      a6
  000b50  4e740006             rtd       #$6

;-------------------------------------------------------------
; GETMONITORSTATE   (seg 6 +000b62, 124 bytes)
  000b62  4e560000             link.w    a6, #$0
  000b66  48e70038             movem.l   a2-a4, -(a7)
  000b6a  99cc                 suba.l    a4, a4
  000b6c  4ab900006ad0         tst.l     $6ad0.l   ; g_6ad0
  000b72  660a                 bne.b     $b7e
  000b74  554f                 subq.w    #$2, a7
  000b76  61ffffffff22         bsr.l     $a9a   ; ISCOLORGAMMAAVAILABLE
  000b7c  101f                 move.b    (a7)+, d0
  000b7e  7001                 moveq     #$1, d0
  000b80  b0b900006ad0         cmp.l     $6ad0.l, d0   ; g_6ad0
  000b86  660e                 bne.b     $b96
  000b88  33fcff3700006ad4     move.w    #$ff37, $6ad4.l   ; g_6ad4
  000b90  42af0014             clr.l     $14(a7)
  000b94  6040                 bra.b     $bd6
  000b96  594f                 subq.w    #$4, a7
  000b98  aa29                 _GetDeviceList 
  000b9a  205f                 movea.l   (a7)+, a0
  000b9c  2448                 movea.l   a0, a2
  000b9e  6022                 bra.b     $bc2
  000ba0  594f                 subq.w    #$4, a7
  000ba2  2f0a                 move.l    a2, -(a7)
  000ba4  61ff0000004a         bsr.l     $bf0   ; GET1MONITORSTATE
  000baa  205f                 movea.l   (a7)+, a0
  000bac  2648                 movea.l   a0, a3
  000bae  200b                 move.l    a3, d0
  000bb0  6706                 beq.b     $bb8
  000bb2  2053                 movea.l   (a3), a0
  000bb4  208c                 move.l    a4, (a0)
  000bb6  284b                 movea.l   a3, a4
  000bb8  594f                 subq.w    #$4, a7
  000bba  2f0a                 move.l    a2, -(a7)
  000bbc  aa2b                 _GetNextDevice 
  000bbe  205f                 movea.l   (a7)+, a0
  000bc0  2448                 movea.l   a0, a2
  000bc2  200a                 move.l    a2, d0
  000bc4  66da                 bne.b     $ba0
  000bc6  200c                 move.l    a4, d0
  000bc8  6608                 bne.b     $bd2
  000bca  33fcb43800006ad4     move.w    #$b438, $6ad4.l   ; g_6ad4
  000bd2  2f4c0014             move.l    a4, $14(a7)
  000bd6  4cdf1c00             movem.l   (a7)+, a2-a4
  000bda  4e5e                 unlk      a6
  000bdc  4e75                 rts       

;-------------------------------------------------------------
; GET1MONITORSTATE   (seg 6 +000bf0, 620 bytes)
  000bf0  4e56fff8             link.w    a6, #$fff8
  000bf4  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  000bf8  286e0008             movea.l   $8(a6), a4
  000bfc  97cb                 suba.l    a3, a3
  000bfe  42aefffc             clr.l     -$4(a6)
  000c02  95ca                 suba.l    a2, a2
  000c04  7c00                 moveq     #$0, d6
  000c06  7600                 moveq     #$0, d3
  000c08  4ab900006ad0         tst.l     $6ad0.l   ; g_6ad0
  000c0e  660a                 bne.b     $c1a
  000c10  554f                 subq.w    #$2, a7
  000c12  61fffffffe86         bsr.l     $a9a   ; ISCOLORGAMMAAVAILABLE
  000c18  101f                 move.b    (a7)+, d0
  000c1a  7001                 moveq     #$1, d0
  000c1c  b0b900006ad0         cmp.l     $6ad0.l, d0   ; g_6ad0
  000c22  6610                 bne.b     $c34
  000c24  33fcff3700006ad4     move.w    #$ff37, $6ad4.l   ; g_6ad4
  000c2c  42af0030             clr.l     $30(a7)
  000c30  60000220             bra.w     $e52
  000c34  554f                 subq.w    #$2, a7
  000c36  2f0c                 move.l    a4, -(a7)
  000c38  3f3c000d             move.w    #$d, -(a7)
  000c3c  aa2c                 _TestDeviceAttribute 
  000c3e  101f                 move.b    (a7)+, d0
  000c40  6718                 beq.b     $c5a
  000c42  554f                 subq.w    #$2, a7
  000c44  2f0c                 move.l    a4, -(a7)
  000c46  3f3c000e             move.w    #$e, -(a7)
  000c4a  aa2c                 _TestDeviceAttribute 
  000c4c  101f                 move.b    (a7)+, d0
  000c4e  660a                 bne.b     $c5a
  000c50  2054                 movea.l   (a4), a0
  000c52  0c6800010004         cmpi.w    #$1, $4(a0)
  000c58  6610                 bne.b     $c6a
  000c5a  33fcff6500006ad4     move.w    #$ff65, $6ad4.l   ; g_6ad4
  000c62  42af0030             clr.l     $30(a7)
  000c66  600001ea             bra.w     $e52
  000c6a  486efff8             pea.l     -$8(a6)
  000c6e  2f0c                 move.l    a4, -(a7)
  000c70  61ff0000089a         bsr.l     $150c   ; GetDeviceGammaTable
  000c76  3a00                 move.w    d0, d5
  000c78  4a45                 tst.w     d5
  000c7a  504f                 addq.w    #$8, a7
  000c7c  670e                 beq.b     $c8c
  000c7e  33c500006ad4         move.w    d5, $6ad4.l   ; g_6ad4
  000c84  42af0030             clr.l     $30(a7)
  000c88  600001c8             bra.w     $e52
  000c8c  206efff8             movea.l   -$8(a6), a0
  000c90  226efff8             movea.l   -$8(a6), a1
  000c94  30290006             move.w    $6(a1), d0
  000c98  c1e80008             muls.w    $8(a0), d0
  000c9c  206efff8             movea.l   -$8(a6), a0
  000ca0  3628000a             move.w    $a(a0), d3
  000ca4  48c3                 ext.l     d3
  000ca6  4c003800             muls.l    d0, d3
  000caa  2003                 move.l    d3, d0
  000cac  e480                 asr.l     #$2, d0
  000cae  e088                 lsr.l     #$8, d0
  000cb0  e088                 lsr.l     #$8, d0
  000cb2  e088                 lsr.l     #$8, d0
  000cb4  ea88                 lsr.l     #$5, d0
  000cb6  d083                 add.l     d3, d0
  000cb8  e680                 asr.l     #$3, d0
  000cba  206efff8             movea.l   -$8(a6), a0
  000cbe  36280004             move.w    $4(a0), d3
  000cc2  48c3                 ext.l     d3
  000cc4  740e                 moveq     #$e, d2
  000cc6  d682                 add.l     d2, d3
  000cc8  d680                 add.l     d0, d3
  000cca  7018                 moveq     #$18, d0
  000ccc  a122                 _NewHandle 
  000cce  2648                 movea.l   a0, a3
  000cd0  7000                 moveq     #$0, d0
  000cd2  3003                 move.w    d3, d0
  000cd4  a122                 _NewHandle 
  000cd6  2d48fffc             move.l    a0, -$4(a6)
  000cda  7000                 moveq     #$0, d0
  000cdc  3003                 move.w    d3, d0
  000cde  a122                 _NewHandle 
  000ce0  2448                 movea.l   a0, a2
  000ce2  200b                 move.l    a3, d0
  000ce4  670a                 beq.b     $cf0
  000ce6  4aaefffc             tst.l     -$4(a6)
  000cea  6704                 beq.b     $cf0
  000cec  200a                 move.l    a2, d0
  000cee  6644                 bne.b     $d34
  000cf0  554f                 subq.w    #$2, a7
  000cf2  3eb80220             move.w    $220.w, (a7)
  000cf6  301f                 move.w    (a7)+, d0
  000cf8  33c000006ad4         move.w    d0, $6ad4.l   ; g_6ad4
  000cfe  303900006ad4         move.w    $6ad4.l, d0   ; g_6ad4
  000d04  48c0                 ext.l     d0
  000d06  6608                 bne.b     $d10
  000d08  33fcff9400006ad4     move.w    #$ff94, $6ad4.l   ; g_6ad4
  000d10  200b                 move.l    a3, d0
  000d12  6704                 beq.b     $d18
  000d14  204b                 movea.l   a3, a0
  000d16  a023                 _DisposeHandle 
  000d18  4aaefffc             tst.l     -$4(a6)
  000d1c  6706                 beq.b     $d24
  000d1e  206efffc             movea.l   -$4(a6), a0
  000d22  a023                 _DisposeHandle 
  000d24  200a                 move.l    a2, d0
  000d26  6704                 beq.b     $d2c
  000d28  204a                 movea.l   a2, a0
  000d2a  a023                 _DisposeHandle 
  000d2c  42af0030             clr.l     $30(a7)
  000d30  60000120             bra.w     $e52
  000d34  206efff8             movea.l   -$8(a6), a0
  000d38  226efffc             movea.l   -$4(a6), a1
  000d3c  2251                 movea.l   (a1), a1
  000d3e  7000                 moveq     #$0, d0
  000d40  3003                 move.w    d3, d0
  000d42  a22e                 _BlockMove 
  000d44  206efffc             movea.l   -$4(a6), a0
  000d48  2050                 movea.l   (a0), a0
  000d4a  0c6800010006         cmpi.w    #$1, $6(a0)
  000d50  660000be             bne.w     $e10
  000d54  206efffc             movea.l   -$4(a6), a0
  000d58  2050                 movea.l   (a0), a0
  000d5a  2252                 movea.l   (a2), a1
  000d5c  7000                 moveq     #$0, d0
  000d5e  3003                 move.w    d3, d0
  000d60  a22e                 _BlockMove 
  000d62  206efffc             movea.l   -$4(a6), a0
  000d66  2050                 movea.l   (a0), a0
  000d68  2252                 movea.l   (a2), a1
  000d6a  7000                 moveq     #$0, d0
  000d6c  3003                 move.w    d3, d0
  000d6e  a22e                 _BlockMove 
  000d70  206efffc             movea.l   -$4(a6), a0
  000d74  2050                 movea.l   (a0), a0
  000d76  226efffc             movea.l   -$4(a6), a1
  000d7a  2251                 movea.l   (a1), a1
  000d7c  30290008             move.w    $8(a1), d0
  000d80  c1e8000a             muls.w    $a(a0), d0
  000d84  2800                 move.l    d0, d4
  000d86  e484                 asr.l     #$2, d4
  000d88  e08c                 lsr.l     #$8, d4
  000d8a  e08c                 lsr.l     #$8, d4
  000d8c  e08c                 lsr.l     #$8, d4
  000d8e  ea8c                 lsr.l     #$5, d4
  000d90  d880                 add.l     d0, d4
  000d92  e684                 asr.l     #$3, d4
  000d94  7003                 moveq     #$3, d0
  000d96  4c040000             mulu.l    d4, d0
  000d9a  206efffc             movea.l   -$4(a6), a0
  000d9e  2050                 movea.l   (a0), a0
  000da0  32280004             move.w    $4(a0), d1
  000da4  48c1                 ext.l     d1
  000da6  740e                 moveq     #$e, d2
  000da8  d282                 add.l     d2, d1
  000daa  d280                 add.l     d0, d1
  000dac  2001                 move.l    d1, d0
  000dae  204a                 movea.l   a2, a0
  000db0  a024                 _SetHandleSize 
  000db2  2052                 movea.l   (a2), a0
  000db4  2252                 movea.l   (a2), a1
  000db6  5089                 addq.l    #$8, a1
  000db8  5889                 addq.l    #$4, a1
  000dba  d2e80004             adda.w    $4(a0), a1
  000dbe  2a09                 move.l    a1, d5
  000dc0  2045                 movea.l   d5, a0
  000dc2  2245                 movea.l   d5, a1
  000dc4  43f14800             lea.l     (a1, d4.l), a1
  000dc8  2004                 move.l    d4, d0
  000dca  a22e                 _BlockMove 
  000dcc  2045                 movea.l   d5, a0
  000dce  2245                 movea.l   d5, a1
  000dd0  43f14a00             lea.l     (a1, d4.l * 2), a1
  000dd4  2004                 move.l    d4, d0
  000dd6  a22e                 _BlockMove 
  000dd8  2052                 movea.l   (a2), a0
  000dda  317c00030006         move.w    #$3, $6(a0)
  000de0  2f0a                 move.l    a2, -(a7)
  000de2  2f0c                 move.l    a4, -(a7)
  000de4  61ff00000784         bsr.l     $156a   ; SetDeviceGammaTable
  000dea  3a00                 move.w    d0, d5
  000dec  3005                 move.w    d5, d0
  000dee  48c0                 ext.l     d0
  000df0  504f                 addq.w    #$8, a7
  000df2  661c                 bne.b     $e10
  000df4  2c2efffc             move.l    -$4(a6), d6
  000df8  2d4afffc             move.l    a2, -$4(a6)
  000dfc  554f                 subq.w    #$2, a7
  000dfe  486efffc             pea.l     -$4(a6)
  000e02  4eb9000003f8         jsr       $3f8.l   ; seg4+a1e
  000e08  301f                 move.w    (a7)+, d0
  000e0a  2004                 move.l    d4, d0
  000e0c  d080                 add.l     d0, d0
  000e0e  d640                 add.w     d0, d3
  000e10  2053                 movea.l   (a3), a0
  000e12  4290                 clr.l     (a0)
  000e14  2053                 movea.l   (a3), a0
  000e16  214c0004             move.l    a4, $4(a0)
  000e1a  2053                 movea.l   (a3), a0
  000e1c  216efffc0008         move.l    -$4(a6), $8(a0)
  000e22  2053                 movea.l   (a3), a0
  000e24  2146000c             move.l    d6, $c(a0)
  000e28  2053                 movea.l   (a3), a0
  000e2a  214a0010             move.l    a2, $10(a0)
  000e2e  2053                 movea.l   (a3), a0
  000e30  31430014             move.w    d3, $14(a0)
  000e34  206efffc             movea.l   -$4(a6), a0
  000e38  2050                 movea.l   (a0), a0
  000e3a  0c6800030006         cmpi.w    #$3, $6(a0)
  000e40  6604                 bne.b     $e46
  000e42  7001                 moveq     #$1, d0
  000e44  6002                 bra.b     $e48
  000e46  7000                 moveq     #$0, d0
  000e48  2053                 movea.l   (a3), a0
  000e4a  11400016             move.b    d0, $16(a0)
  000e4e  2f4b0030             move.l    a3, $30(a7)
  000e52  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  000e56  4e5e                 unlk      a6
  000e58  4e740004             rtd       #$4

;-------------------------------------------------------------
; SETMONITORSTATE   (seg 6 +000e70, 68 bytes)
  000e70  4e560000             link.w    a6, #$0
  000e74  48e70030             movem.l   a2-a3, -(a7)
  000e78  246e0008             movea.l   $8(a6), a2
  000e7c  6024                 bra.b     $ea2
  000e7e  2052                 movea.l   (a2), a0
  000e80  2668000c             movea.l   $c(a0), a3
  000e84  200b                 move.l    a3, d0
  000e86  6606                 bne.b     $e8e
  000e88  2052                 movea.l   (a2), a0
  000e8a  26680008             movea.l   $8(a0), a3
  000e8e  2f0b                 move.l    a3, -(a7)
  000e90  2052                 movea.l   (a2), a0
  000e92  2f280004             move.l    $4(a0), -(a7)
  000e96  61ff000006d2         bsr.l     $156a   ; SetDeviceGammaTable
  000e9c  2052                 movea.l   (a2), a0
  000e9e  2450                 movea.l   (a0), a2
  000ea0  504f                 addq.w    #$8, a7
  000ea2  200a                 move.l    a2, d0
  000ea4  66d8                 bne.b     $e7e
  000ea6  426f0014             clr.w     $14(a7)
  000eaa  4cdf0c00             movem.l   (a7)+, a2-a3
  000eae  4e5e                 unlk      a6
  000eb0  4e740004             rtd       #$4

;-------------------------------------------------------------
; DISPOSEGAMMAREF   (seg 6 +000ec6, 84 bytes)
  000ec6  4e560000             link.w    a6, #$0
  000eca  48e70030             movem.l   a2-a3, -(a7)
  000ece  246e0008             movea.l   $8(a6), a2
  000ed2  200a                 move.l    a2, d0
  000ed4  6632                 bne.b     $f08
  000ed6  3f7cff930014         move.w    #$ff93, $14(a7)
  000edc  6032                 bra.b     $f10
  000ede  2052                 movea.l   (a2), a0
  000ee0  2650                 movea.l   (a0), a3
  000ee2  2052                 movea.l   (a2), a0
  000ee4  4aa8000c             tst.l     $c(a0)
  000ee8  6708                 beq.b     $ef2
  000eea  2052                 movea.l   (a2), a0
  000eec  2068000c             movea.l   $c(a0), a0
  000ef0  a023                 _DisposeHandle 
  000ef2  2052                 movea.l   (a2), a0
  000ef4  20680008             movea.l   $8(a0), a0
  000ef8  a023                 _DisposeHandle 
  000efa  2052                 movea.l   (a2), a0
  000efc  20680010             movea.l   $10(a0), a0
  000f00  a023                 _DisposeHandle 
  000f02  204a                 movea.l   a2, a0
  000f04  a023                 _DisposeHandle 
  000f06  244b                 movea.l   a3, a2
  000f08  200a                 move.l    a2, d0
  000f0a  66d2                 bne.b     $ede
  000f0c  426f0014             clr.w     $14(a7)
  000f10  4cdf0c00             movem.l   (a7)+, a2-a3
  000f14  4e5e                 unlk      a6
  000f16  4e740004             rtd       #$4

;-------------------------------------------------------------
; FADETOGAMMA   (seg 6 +000f2c, 38 bytes)
  000f2c  4e560000             link.w    a6, #$0
  000f30  3f2e0008             move.w    $8(a6), -(a7)
  000f34  3f2e000a             move.w    $a(a6), -(a7)
  000f38  2f2e000c             move.l    $c(a6), -(a7)
  000f3c  1f3c0001             move.b    #$1, -(a7)
  000f40  42a7                 clr.l     -(a7)
  000f42  61ff0000001c         bsr.l     $f60   ; XHighLevelFade
  000f48  3f40001e             move.w    d0, $1e(a7)
  000f4c  4e5e                 unlk      a6
  000f4e  4e740008             rtd       #$8

;-------------------------------------------------------------
; XHighLevelFade   (seg 6 +000f60, 296 bytes)
  000f60  4e560000             link.w    a6, #$0
  000f64  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  000f68  286e0008             movea.l   $8(a6), a4
  000f6c  266e000e             movea.l   $e(a6), a3
  000f70  3e2e0012             move.w    $12(a6), d7
  000f74  3a3cb437             move.w    #$b437, d5
  000f78  302e0014             move.w    $14(a6), d0
  000f7c  7204                 moveq     #$4, d1
  000f7e  c081                 and.l     d1, d0
  000f80  670a                 beq.b     $f8c
  000f82  6002                 bra.b     $f86
  000f84  e24f                 lsr.w     #$1, d7
  000f86  0c470100             cmpi.w    #$100, d7
  000f8a  62f8                 bhi.b     $f84
  000f8c  7000                 moveq     #$0, d0
  000f8e  302e0014             move.w    $14(a6), d0
  000f92  5580                 subq.l    #$2, d0
  000f94  670a                 beq.b     $fa0
  000f96  5580                 subq.l    #$2, d0
  000f98  670c                 beq.b     $fa6
  000f9a  5380                 subq.l    #$1, d0
  000f9c  6708                 beq.b     $fa6
  000f9e  6014                 bra.b     $fb4
  000fa0  7c00                 moveq     #$0, d6
  000fa2  3c07                 move.w    d7, d6
  000fa4  6016                 bra.b     $fbc
  000fa6  7000                 moveq     #$0, d0
  000fa8  3007                 move.w    d7, d0
  000faa  7c00                 moveq     #$0, d6
  000fac  3c07                 move.w    d7, d6
  000fae  4c006800             muls.l    d0, d6
  000fb2  6008                 bra.b     $fbc
  000fb4  303cb437             move.w    #$b437, d0
  000fb8  600000c6             bra.w     $1080
  000fbc  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  000fc2  200c                 move.l    a4, d0
  000fc4  6710                 beq.b     $fd6
  000fc6  594f                 subq.w    #$4, a7
  000fc8  2f0c                 move.l    a4, -(a7)
  000fca  61fffffffc24         bsr.l     $bf0   ; GET1MONITORSTATE
  000fd0  205f                 movea.l   (a7)+, a0
  000fd2  2448                 movea.l   a0, a2
  000fd4  600c                 bra.b     $fe2
  000fd6  594f                 subq.w    #$4, a7
  000fd8  61fffffffb88         bsr.l     $b62   ; GETMONITORSTATE
  000fde  205f                 movea.l   (a7)+, a0
  000fe0  2448                 movea.l   a0, a2
  000fe2  200a                 move.l    a2, d0
  000fe4  660a                 bne.b     $ff0
  000fe6  303900006ad4         move.w    $6ad4.l, d0   ; g_6ad4
  000fec  60000092             bra.w     $1080
  000ff0  7600                 moveq     #$0, d3
  000ff2  606a                 bra.b     $105e
  000ff4  7000                 moveq     #$0, d0
  000ff6  302e0014             move.w    $14(a6), d0
  000ffa  5580                 subq.l    #$2, d0
  000ffc  670a                 beq.b     $1008
  000ffe  5580                 subq.l    #$2, d0
  001000  670a                 beq.b     $100c
  001002  5380                 subq.l    #$1, d0
  001004  670e                 beq.b     $1014
  001006  6020                 bra.b     $1028
  001008  2803                 move.l    d3, d4
  00100a  601c                 bra.b     $1028
  00100c  2803                 move.l    d3, d4
  00100e  4c034000             mulu.l    d3, d4
  001012  6014                 bra.b     $1028
  001014  7800                 moveq     #$0, d4
  001016  3807                 move.w    d7, d4
  001018  9883                 sub.l     d3, d4
  00101a  7200                 moveq     #$0, d1
  00101c  3207                 move.w    d7, d1
  00101e  9283                 sub.l     d3, d1
  001020  4c041000             mulu.l    d4, d1
  001024  2806                 move.l    d6, d4
  001026  9881                 sub.l     d1, d4
  001028  4a2e000c             tst.b     $c(a6)
  00102c  6616                 bne.b     $1044
  00102e  554f                 subq.w    #$2, a7
  001030  2f0a                 move.l    a2, -(a7)
  001032  2f0b                 move.l    a3, -(a7)
  001034  3f04                 move.w    d4, -(a7)
  001036  3f06                 move.w    d6, -(a7)
  001038  61ff00000060         bsr.l     $109a   ; FADEFROMGAMMATOCOLOR
  00103e  301f                 move.w    (a7)+, d0
  001040  3a00                 move.w    d0, d5
  001042  6014                 bra.b     $1058
  001044  554f                 subq.w    #$2, a7
  001046  2f0a                 move.l    a2, -(a7)
  001048  2f0b                 move.l    a3, -(a7)
  00104a  3f04                 move.w    d4, -(a7)
  00104c  3f06                 move.w    d6, -(a7)
  00104e  61ff000000dc         bsr.l     $112c   ; FADEFROMGAMMATOGAMMA
  001054  301f                 move.w    (a7)+, d0
  001056  3a00                 move.w    d0, d5
  001058  4a45                 tst.w     d5
  00105a  660a                 bne.b     $1066
  00105c  5283                 addq.l    #$1, d3
  00105e  7000                 moveq     #$0, d0
  001060  3007                 move.w    d7, d0
  001062  b680                 cmp.l     d0, d3
  001064  638e                 bls.b     $ff4
  001066  554f                 subq.w    #$2, a7
  001068  2f0a                 move.l    a2, -(a7)
  00106a  61fffffffe5a         bsr.l     $ec6   ; DISPOSEGAMMAREF
  001070  301f                 move.w    (a7)+, d0
  001072  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  001078  33c500006ad4         move.w    d5, $6ad4.l   ; g_6ad4
  00107e  3005                 move.w    d5, d0
  001080  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001084  4e5e                 unlk      a6
  001086  4e75                 rts       

;-------------------------------------------------------------
; FADEFROMGAMMATOCOLOR   (seg 6 +00109a, 122 bytes)
  00109a  4e560000             link.w    a6, #$0
  00109e  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  0010a2  246e0010             movea.l   $10(a6), a2
  0010a6  266e000c             movea.l   $c(a6), a3
  0010aa  3a2e000a             move.w    $a(a6), d5
  0010ae  382e0008             move.w    $8(a6), d4
  0010b2  427900006ad4         clr.w     $6ad4.l   ; g_6ad4
  0010b8  6044                 bra.b     $10fe
  0010ba  3f04                 move.w    d4, -(a7)
  0010bc  3f05                 move.w    d5, -(a7)
  0010be  2f0b                 move.l    a3, -(a7)
  0010c0  2f0a                 move.l    a2, -(a7)
  0010c2  61ff000001fc         bsr.l     $12c0   ; XCalcFadeToColor
  0010c8  3600                 move.w    d0, d3
  0010ca  4a43                 tst.w     d3
  0010cc  4fef000c             lea.l     $c(a7), a7
  0010d0  6708                 beq.b     $10da
  0010d2  33c300006ad4         move.w    d3, $6ad4.l   ; g_6ad4
  0010d8  6020                 bra.b     $10fa
  0010da  2052                 movea.l   (a2), a0
  0010dc  2f280010             move.l    $10(a0), -(a7)
  0010e0  2052                 movea.l   (a2), a0
  0010e2  2f280004             move.l    $4(a0), -(a7)
  0010e6  61ff00000482         bsr.l     $156a   ; SetDeviceGammaTable
  0010ec  3600                 move.w    d0, d3
  0010ee  4a43                 tst.w     d3
  0010f0  504f                 addq.w    #$8, a7
  0010f2  6706                 beq.b     $10fa
  0010f4  33c300006ad4         move.w    d3, $6ad4.l   ; g_6ad4
  0010fa  2052                 movea.l   (a2), a0
  0010fc  2450                 movea.l   (a0), a2
  0010fe  200a                 move.l    a2, d0
  001100  66b8                 bne.b     $10ba
  001102  3f7900006ad40028     move.w    $6ad4.l, $28(a7)   ; g_6ad4
  00110a  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  00110e  4e5e                 unlk      a6
  001110  4e74000c             rtd       #$c

;-------------------------------------------------------------
; FADEFROMGAMMATOGAMMA   (seg 6 +00112c, 122 bytes)
  00112c  4e560000             link.w    a6, #$0
  001130  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  001134  246e0010             movea.l   $10(a6), a2
  001138  266e000c             movea.l   $c(a6), a3
  00113c  3a2e000a             move.w    $a(a6), d5
  001140  382e0008             move.w    $8(a6), d4
  001144  427900006ad4         clr.w     $6ad4.l   ; g_6ad4
  00114a  6044                 bra.b     $1190
  00114c  3f04                 move.w    d4, -(a7)
  00114e  3f05                 move.w    d5, -(a7)
  001150  2f0b                 move.l    a3, -(a7)
  001152  2f0a                 move.l    a2, -(a7)
  001154  61ff00000286         bsr.l     $13dc   ; XCalcFadeToGamma
  00115a  3600                 move.w    d0, d3
  00115c  4a43                 tst.w     d3
  00115e  4fef000c             lea.l     $c(a7), a7
  001162  6708                 beq.b     $116c
  001164  33c300006ad4         move.w    d3, $6ad4.l   ; g_6ad4
  00116a  6020                 bra.b     $118c
  00116c  2052                 movea.l   (a2), a0
  00116e  2f280010             move.l    $10(a0), -(a7)
  001172  2052                 movea.l   (a2), a0
  001174  2f280004             move.l    $4(a0), -(a7)
  001178  61ff000003f0         bsr.l     $156a   ; SetDeviceGammaTable
  00117e  3600                 move.w    d0, d3
  001180  4a43                 tst.w     d3
  001182  504f                 addq.w    #$8, a7
  001184  6706                 beq.b     $118c
  001186  33c300006ad4         move.w    d3, $6ad4.l   ; g_6ad4
  00118c  2052                 movea.l   (a2), a0
  00118e  2450                 movea.l   (a0), a2
  001190  200a                 move.l    a2, d0
  001192  66b8                 bne.b     $114c
  001194  3f7900006ad40028     move.w    $6ad4.l, $28(a7)   ; g_6ad4
  00119c  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  0011a0  4e5e                 unlk      a6
  0011a2  4e74000c             rtd       #$c

;-------------------------------------------------------------
; CALCFADETOCOLOR   (seg 6 +0011be, 240 bytes)
  0011be  4e560000             link.w    a6, #$0
  0011c2  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0011c6  262e0010             move.l    $10(a6), d3
  0011ca  7e00                 moveq     #$0, d7
  0011cc  95ca                 suba.l    a2, a2
  0011ce  427900006ad4         clr.w     $6ad4.l   ; g_6ad4
  0011d4  600000c4             bra.w     $129a
  0011d8  2043                 movea.l   d3, a0
  0011da  2050                 movea.l   (a0), a0
  0011dc  3a280014             move.w    $14(a0), d5
  0011e0  3f2e0008             move.w    $8(a6), -(a7)
  0011e4  3f2e000a             move.w    $a(a6), -(a7)
  0011e8  2f2e000c             move.l    $c(a6), -(a7)
  0011ec  2f03                 move.l    d3, -(a7)
  0011ee  61ff000000d0         bsr.l     $12c0   ; XCalcFadeToColor
  0011f4  3800                 move.w    d0, d4
  0011f6  7018                 moveq     #$18, d0
  0011f8  a122                 _NewHandle 
  0011fa  2648                 movea.l   a0, a3
  0011fc  7000                 moveq     #$0, d0
  0011fe  3005                 move.w    d5, d0
  001200  a122                 _NewHandle 
  001202  2848                 movea.l   a0, a4
  001204  7000                 moveq     #$0, d0
  001206  3005                 move.w    d5, d0
  001208  a122                 _NewHandle 
  00120a  2808                 move.l    a0, d4
  00120c  200b                 move.l    a3, d0
  00120e  4fef000c             lea.l     $c(a7), a7
  001212  6708                 beq.b     $121c
  001214  200c                 move.l    a4, d0
  001216  6704                 beq.b     $121c
  001218  4a84                 tst.l     d4
  00121a  663e                 bne.b     $125a
  00121c  554f                 subq.w    #$2, a7
  00121e  3eb80220             move.w    $220.w, (a7)
  001222  301f                 move.w    (a7)+, d0
  001224  33c000006ad4         move.w    d0, $6ad4.l   ; g_6ad4
  00122a  303900006ad4         move.w    $6ad4.l, d0   ; g_6ad4
  001230  48c0                 ext.l     d0
  001232  6608                 bne.b     $123c
  001234  33fcff9400006ad4     move.w    #$ff94, $6ad4.l   ; g_6ad4
  00123c  200b                 move.l    a3, d0
  00123e  6704                 beq.b     $1244
  001240  204b                 movea.l   a3, a0
  001242  a023                 _DisposeHandle 
  001244  200c                 move.l    a4, d0
  001246  6704                 beq.b     $124c
  001248  204c                 movea.l   a4, a0
  00124a  a023                 _DisposeHandle 
  00124c  4a84                 tst.l     d4
  00124e  6704                 beq.b     $1254
  001250  2044                 movea.l   d4, a0
  001252  a023                 _DisposeHandle 
  001254  2f470034             move.l    d7, $34(a7)
  001258  604a                 bra.b     $12a4
  00125a  2043                 movea.l   d3, a0
  00125c  2c10                 move.l    (a0), d6
  00125e  2453                 movea.l   (a3), a2
  001260  2046                 movea.l   d6, a0
  001262  20680010             movea.l   $10(a0), a0
  001266  2050                 movea.l   (a0), a0
  001268  2254                 movea.l   (a4), a1
  00126a  7000                 moveq     #$0, d0
  00126c  3005                 move.w    d5, d0
  00126e  a22e                 _BlockMove 
  001270  2487                 move.l    d7, (a2)
  001272  2046                 movea.l   d6, a0
  001274  256800040004         move.l    $4(a0), $4(a2)
  00127a  254c0008             move.l    a4, $8(a2)
  00127e  25440010             move.l    d4, $10(a2)
  001282  42aa000c             clr.l     $c(a2)
  001286  35450014             move.w    d5, $14(a2)
  00128a  2046                 movea.l   d6, a0
  00128c  156800160016         move.b    $16(a0), $16(a2)
  001292  2e0b                 move.l    a3, d7
  001294  2043                 movea.l   d3, a0
  001296  2050                 movea.l   (a0), a0
  001298  2610                 move.l    (a0), d3
  00129a  4a83                 tst.l     d3
  00129c  6600ff3a             bne.w     $11d8
  0012a0  2f470034             move.l    d7, $34(a7)
  0012a4  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0012a8  4e5e                 unlk      a6
  0012aa  4e74000c             rtd       #$c

;-------------------------------------------------------------
; XCalcFadeToColor   (seg 6 +0012c0, 264 bytes)
  0012c0  4e560000             link.w    a6, #$0
  0012c4  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  0012c8  246e0008             movea.l   $8(a6), a2
  0012cc  2052                 movea.l   (a2), a0
  0012ce  26680004             movea.l   $4(a0), a3
  0012d2  2052                 movea.l   (a2), a0
  0012d4  26680008             movea.l   $8(a0), a3
  0012d8  2052                 movea.l   (a2), a0
  0012da  28680010             movea.l   $10(a0), a4
  0012de  2052                 movea.l   (a2), a0
  0012e0  4a280016             tst.b     $16(a0)
  0012e4  6608                 bne.b     $12ee
  0012e6  303cb436             move.w    #$b436, d0
  0012ea  600000d4             bra.w     $13c0
  0012ee  2053                 movea.l   (a3), a0
  0012f0  30280004             move.w    $4(a0), d0
  0012f4  48c0                 ext.l     d0
  0012f6  720e                 moveq     #$e, d1
  0012f8  d081                 add.l     d1, d0
  0012fa  2053                 movea.l   (a3), a0
  0012fc  2254                 movea.l   (a4), a1
  0012fe  a22e                 _BlockMove 
  001300  2054                 movea.l   (a4), a0
  001302  3028000a             move.w    $a(a0), d0
  001306  48c0                 ext.l     d0
  001308  7e01                 moveq     #$1, d7
  00130a  e1af                 lsl.l     d0, d7
  00130c  5387                 subq.l    #$1, d7
  00130e  0c6e01000012         cmpi.w    #$100, $12(a6)
  001314  631c                 bls.b     $1332
  001316  7000                 moveq     #$0, d0
  001318  302e0012             move.w    $12(a6), d0
  00131c  7200                 moveq     #$0, d1
  00131e  322e0010             move.w    $10(a6), d1
  001322  e189                 lsl.l     #$8, d1
  001324  4c401801             divs.l    d0, d1
  001328  3d410010             move.w    d1, $10(a6)
  00132c  3d7c01000012         move.w    #$100, $12(a6)
  001332  2053                 movea.l   (a3), a0
  001334  2453                 movea.l   (a3), a2
  001336  508a                 addq.l    #$8, a2
  001338  588a                 addq.l    #$4, a2
  00133a  d4e80004             adda.w    $4(a0), a2
  00133e  2054                 movea.l   (a4), a0
  001340  2654                 movea.l   (a4), a3
  001342  508b                 addq.l    #$8, a3
  001344  588b                 addq.l    #$4, a3
  001346  d6e80004             adda.w    $4(a0), a3
  00134a  2054                 movea.l   (a4), a0
  00134c  32680008             movea.w   $8(a0), a1
  001350  2809                 move.l    a1, d4
  001352  7c00                 moveq     #$0, d6
  001354  605c                 bra.b     $13b2
  001356  7003                 moveq     #$3, d0
  001358  bc80                 cmp.l     d0, d6
  00135a  6404                 bcc.b     $1360
  00135c  2006                 move.l    d6, d0
  00135e  6002                 bra.b     $1362
  001360  7002                 moveq     #$2, d0
  001362  2600                 move.l    d0, d3
  001364  206e000c             movea.l   $c(a6), a0
  001368  7a00                 moveq     #$0, d5
  00136a  3a303a00             move.w    (a0, d3.l * 2), d5
  00136e  4c075000             mulu.l    d7, d5
  001372  4c7c50050000ffff     divu.l    #$ffff, d5
  00137a  7600                 moveq     #$0, d3
  00137c  602a                 bra.b     $13a8
  00137e  7000                 moveq     #$0, d0
  001380  302e0012             move.w    $12(a6), d0
  001384  7200                 moveq     #$0, d1
  001386  12323800             move.b    (a2, d3.l), d1
  00138a  9285                 sub.l     d5, d1
  00138c  7400                 moveq     #$0, d2
  00138e  342e0010             move.w    $10(a6), d2
  001392  4c012800             muls.l    d1, d2
  001396  4c402802             divs.l    d0, d2
  00139a  7000                 moveq     #$0, d0
  00139c  10323800             move.b    (a2, d3.l), d0
  0013a0  9082                 sub.l     d2, d0
  0013a2  17803800             move.b    d0, (a3, d3.l)
  0013a6  5283                 addq.l    #$1, d3
  0013a8  b684                 cmp.l     d4, d3
  0013aa  65d2                 bcs.b     $137e
  0013ac  d5c4                 adda.l    d4, a2
  0013ae  d7c4                 adda.l    d4, a3
  0013b0  5286                 addq.l    #$1, d6
  0013b2  2054                 movea.l   (a4), a0
  0013b4  30280006             move.w    $6(a0), d0
  0013b8  48c0                 ext.l     d0
  0013ba  bc80                 cmp.l     d0, d6
  0013bc  6598                 bcs.b     $1356
  0013be  7000                 moveq     #$0, d0
  0013c0  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  0013c4  4e5e                 unlk      a6
  0013c6  4e75                 rts       

;-------------------------------------------------------------
; XCalcFadeToGamma   (seg 6 +0013dc, 284 bytes)
  0013dc  4e560000             link.w    a6, #$0
  0013e0  48e71e38             movem.l   d3-d6/a2-a4, -(a7)
  0013e4  246e0008             movea.l   $8(a6), a2
  0013e8  3c2e0010             move.w    $10(a6), d6
  0013ec  3a2e0012             move.w    $12(a6), d5
  0013f0  2052                 movea.l   (a2), a0
  0013f2  26680004             movea.l   $4(a0), a3
  0013f6  2052                 movea.l   (a2), a0
  0013f8  28680008             movea.l   $8(a0), a4
  0013fc  2052                 movea.l   (a2), a0
  0013fe  26280010             move.l    $10(a0), d3
  001402  246e000c             movea.l   $c(a6), a2
  001406  600c                 bra.b     $1414
  001408  2052                 movea.l   (a2), a0
  00140a  b7e80004             cmpa.l    $4(a0), a3
  00140e  6708                 beq.b     $1418
  001410  2052                 movea.l   (a2), a0
  001412  2450                 movea.l   (a0), a2
  001414  200a                 move.l    a2, d0
  001416  66f0                 bne.b     $1408
  001418  200a                 move.l    a2, d0
  00141a  6606                 bne.b     $1422
  00141c  70d5                 moveq     #$d5, d0
  00141e  600000d0             bra.w     $14f0
  001422  2052                 movea.l   (a2), a0
  001424  28280008             move.l    $8(a0), d4
  001428  2054                 movea.l   (a4), a0
  00142a  2244                 movea.l   d4, a1
  00142c  2251                 movea.l   (a1), a1
  00142e  30290006             move.w    $6(a1), d0
  001432  b0680006             cmp.w     $6(a0), d0
  001436  6610                 bne.b     $1448
  001438  2054                 movea.l   (a4), a0
  00143a  2244                 movea.l   d4, a1
  00143c  2251                 movea.l   (a1), a1
  00143e  30290008             move.w    $8(a1), d0
  001442  b0680008             cmp.w     $8(a0), d0
  001446  6708                 beq.b     $1450
  001448  303cff65             move.w    #$ff65, d0
  00144c  600000a2             bra.w     $14f0
  001450  2054                 movea.l   (a4), a0
  001452  30280004             move.w    $4(a0), d0
  001456  48c0                 ext.l     d0
  001458  720e                 moveq     #$e, d1
  00145a  d081                 add.l     d1, d0
  00145c  2054                 movea.l   (a4), a0
  00145e  2243                 movea.l   d3, a1
  001460  2251                 movea.l   (a1), a1
  001462  a22e                 _BlockMove 
  001464  0c450100             cmpi.w    #$100, d5
  001468  6314                 bls.b     $147e
  00146a  7000                 moveq     #$0, d0
  00146c  3005                 move.w    d5, d0
  00146e  7200                 moveq     #$0, d1
  001470  3206                 move.w    d6, d1
  001472  e189                 lsl.l     #$8, d1
  001474  4c401801             divs.l    d0, d1
  001478  3c01                 move.w    d1, d6
  00147a  3a3c0100             move.w    #$100, d5
  00147e  2054                 movea.l   (a4), a0
  001480  2454                 movea.l   (a4), a2
  001482  508a                 addq.l    #$8, a2
  001484  588a                 addq.l    #$4, a2
  001486  d4e80004             adda.w    $4(a0), a2
  00148a  2044                 movea.l   d4, a0
  00148c  2050                 movea.l   (a0), a0
  00148e  2644                 movea.l   d4, a3
  001490  2653                 movea.l   (a3), a3
  001492  508b                 addq.l    #$8, a3
  001494  588b                 addq.l    #$4, a3
  001496  d6e80004             adda.w    $4(a0), a3
  00149a  2043                 movea.l   d3, a0
  00149c  2050                 movea.l   (a0), a0
  00149e  2843                 movea.l   d3, a4
  0014a0  2854                 movea.l   (a4), a4
  0014a2  508c                 addq.l    #$8, a4
  0014a4  588c                 addq.l    #$4, a4
  0014a6  d8e80004             adda.w    $4(a0), a4
  0014aa  2043                 movea.l   d3, a0
  0014ac  2050                 movea.l   (a0), a0
  0014ae  2243                 movea.l   d3, a1
  0014b0  2251                 movea.l   (a1), a1
  0014b2  38290008             move.w    $8(a1), d4
  0014b6  c9e80006             muls.w    $6(a0), d4
  0014ba  7600                 moveq     #$0, d3
  0014bc  602c                 bra.b     $14ea
  0014be  7000                 moveq     #$0, d0
  0014c0  3005                 move.w    d5, d0
  0014c2  7200                 moveq     #$0, d1
  0014c4  12333800             move.b    (a3, d3.l), d1
  0014c8  7400                 moveq     #$0, d2
  0014ca  14323800             move.b    (a2, d3.l), d2
  0014ce  9481                 sub.l     d1, d2
  0014d0  7200                 moveq     #$0, d1
  0014d2  3206                 move.w    d6, d1
  0014d4  4c021800             muls.l    d2, d1
  0014d8  4c401801             divs.l    d0, d1
  0014dc  7000                 moveq     #$0, d0
  0014de  10323800             move.b    (a2, d3.l), d0
  0014e2  9081                 sub.l     d1, d0
  0014e4  19803800             move.b    d0, (a4, d3.l)
  0014e8  5283                 addq.l    #$1, d3
  0014ea  b684                 cmp.l     d4, d3
  0014ec  65d0                 bcs.b     $14be
  0014ee  7000                 moveq     #$0, d0
  0014f0  4cdf1c78             movem.l   (a7)+, d3-d6/a2-a4
  0014f4  4e5e                 unlk      a6
  0014f6  4e75                 rts       

;-------------------------------------------------------------
; GetDeviceGammaTable   (seg 6 +00150c, 72 bytes)
  00150c  4e56ffce             link.w    a6, #$ffce
  001510  2f03                 move.l    d3, -(a7)
  001512  7600                 moveq     #$0, d3
  001514  206e000c             movea.l   $c(a6), a0
  001518  4290                 clr.l     (a0)
  00151a  48780032             pea.l     $32.w
  00151e  42a7                 clr.l     -(a7)
  001520  486effce             pea.l     -$32(a6)
  001524  4eb900000338         jsr       $338.l   ; seg5+dc
  00152a  3d7c0008ffe8         move.w    #$8, -$18(a6)
  001530  206e0008             movea.l   $8(a6), a0
  001534  2050                 movea.l   (a0), a0
  001536  3d50ffe6             move.w    (a0), -$1a(a6)
  00153a  2d6e000cffea         move.l    $c(a6), -$16(a6)
  001540  41eeffce             lea.l     -$32(a6), a0
  001544  a005                 _Status   
  001546  3600                 move.w    d0, d3
  001548  3003                 move.w    d3, d0
  00154a  4fef000c             lea.l     $c(a7), a7
  00154e  261f                 move.l    (a7)+, d3
  001550  4e5e                 unlk      a6
  001552  4e75                 rts       

;-------------------------------------------------------------
; SetDeviceGammaTable   (seg 6 +00156a, 118 bytes)
  00156a  4e56ffce             link.w    a6, #$ffce
  00156e  48e71038             movem.l   d3/a2-a4, -(a7)
  001572  286e0008             movea.l   $8(a6), a4
  001576  7600                 moveq     #$0, d3
  001578  48780032             pea.l     $32.w
  00157c  42a7                 clr.l     -(a7)
  00157e  486effce             pea.l     -$32(a6)
  001582  4eb900000338         jsr       $338.l   ; seg5+dc
  001588  3d7c0004ffe8         move.w    #$4, -$18(a6)
  00158e  2054                 movea.l   (a4), a0
  001590  3d50ffe6             move.w    (a0), -$1a(a6)
  001594  2d6e000cffea         move.l    $c(a6), -$16(a6)
  00159a  41eeffce             lea.l     -$32(a6), a0
  00159e  a004                 _Control  
  0015a0  3600                 move.w    d0, d3
  0015a2  3003                 move.w    d3, d0
  0015a4  48c0                 ext.l     d0
  0015a6  4fef000c             lea.l     $c(a7), a7
  0015aa  662a                 bne.b     $15d6
  0015ac  594f                 subq.w    #$4, a7
  0015ae  aa32                 _GetGDevice 
  0015b0  205f                 movea.l   (a7)+, a0
  0015b2  2648                 movea.l   a0, a3
  0015b4  2f0c                 move.l    a4, -(a7)
  0015b6  aa31                 _SetGDevice 
  0015b8  2054                 movea.l   (a4), a0
  0015ba  20680016             movea.l   $16(a0), a0
  0015be  2050                 movea.l   (a0), a0
  0015c0  2068002a             movea.l   $2a(a0), a0
  0015c4  2450                 movea.l   (a0), a2
  0015c6  4267                 clr.w     -(a7)
  0015c8  3f2a0006             move.w    $6(a2), -(a7)
  0015cc  486a0008             pea.l     $8(a2)
  0015d0  aa3f                 _SetEntries 
  0015d2  2f0b                 move.l    a3, -(a7)
  0015d4  aa31                 _SetGDevice 
  0015d6  3003                 move.w    d3, d0
  0015d8  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  0015dc  4e5e                 unlk      a6
  0015de  4e75                 rts       

;-------------------------------------------------------------
; ColorGamma_TrapAvailable   (seg 6 +0015f6, 70 bytes)
  0015f6  4e56fffc             link.w    a6, #$fffc
  0015fa  594f                 subq.w    #$4, a7
  0015fc  3f3ca89f             move.w    #$a89f, -(a7)
  001600  1f3c0001             move.b    #$1, -(a7)
  001604  4eb900000378         jsr       $378.l   ; seg4+6b0
  00160a  205f                 movea.l   (a7)+, a0
  00160c  2d48fffc             move.l    a0, -$4(a6)
  001610  594f                 subq.w    #$4, a7
  001612  3f2e0008             move.w    $8(a6), -(a7)
  001616  082e00030008         btst.b    #$3, $8(a6)
  00161c  6704                 beq.b     $1622
  00161e  7001                 moveq     #$1, d0
  001620  6002                 bra.b     $1624
  001622  7000                 moveq     #$0, d0
  001624  1f00                 move.b    d0, -(a7)
  001626  4eb900000378         jsr       $378.l   ; seg4+6b0
  00162c  205f                 movea.l   (a7)+, a0
  00162e  b1eefffc             cmpa.l    -$4(a6), a0
  001632  56c0                 sne.b     d0
  001634  4400                 neg.b     d0
  001636  49c0                 extb.l    d0
  001638  4e5e                 unlk      a6
  00163a  4e75                 rts       

;-------------------------------------------------------------
; SetTextDItem   (seg 6 +001658, 106 bytes)
  001658  4e56fff2             link.w    a6, #$fff2
  00165c  2f2e0008             move.l    $8(a6), -(a7)
  001660  3f2e000c             move.w    $c(a6), -(a7)
  001664  486efffe             pea.l     -$2(a6)
  001668  486efffa             pea.l     -$6(a6)
  00166c  486efff2             pea.l     -$e(a6)
  001670  a98d                 _GetDialogItem 
  001672  302efffe             move.w    -$2(a6), d0
  001676  727f                 moveq     #$7f, d1
  001678  c081                 and.l     d1, d0
  00167a  3d40fffe             move.w    d0, -$2(a6)
  00167e  302efffe             move.w    -$2(a6), d0
  001682  48c0                 ext.l     d0
  001684  0c8000000010         cmpi.l    #$10, d0
  00168a  622c                 bhi.b     $16b8
  00168c  5740                 subq.w    #$3, d0
  00168e  6d1c                 blt.b     $16ac
  001690  6726                 beq.b     $16b8
  001692  5940                 subq.w    #$4, d0
  001694  6d16                 blt.b     $16ac
  001696  6720                 beq.b     $16b8
  001698  5340                 subq.w    #$1, d0
  00169a  6704                 beq.b     $16a0
  00169c  5140                 subq.w    #$8, d0
  00169e  6d18                 blt.b     $16b8
  0016a0  2f2efffa             move.l    -$6(a6), -(a7)
  0016a4  2f2e000e             move.l    $e(a6), -(a7)
  0016a8  a98f                 _SetDialogItemText 
  0016aa  6012                 bra.b     $16be
  0016ac  2f2efffa             move.l    -$6(a6), -(a7)
  0016b0  2f2e000e             move.l    $e(a6), -(a7)
  0016b4  a95f                 _trap_a95f 
  0016b6  6006                 bra.b     $16be
  0016b8  3f3c0001             move.w    #$1, -(a7)
  0016bc  a9c8                 _SysBeep  
  0016be  4e5e                 unlk      a6
  0016c0  4e75                 rts       

;-------------------------------------------------------------
; GetTextDItem   (seg 6 +0016d2, 112 bytes)
  0016d2  4e56fff2             link.w    a6, #$fff2
  0016d6  2f0a                 move.l    a2, -(a7)
  0016d8  246e000e             movea.l   $e(a6), a2
  0016dc  2f2e0008             move.l    $8(a6), -(a7)
  0016e0  3f2e000c             move.w    $c(a6), -(a7)
  0016e4  486efffe             pea.l     -$2(a6)
  0016e8  486efffa             pea.l     -$6(a6)
  0016ec  486efff2             pea.l     -$e(a6)
  0016f0  a98d                 _GetDialogItem 
  0016f2  302efffe             move.w    -$2(a6), d0
  0016f6  727f                 moveq     #$7f, d1
  0016f8  c081                 and.l     d1, d0
  0016fa  3d40fffe             move.w    d0, -$2(a6)
  0016fe  4212                 clr.b     (a2)
  001700  302efffe             move.w    -$2(a6), d0
  001704  48c0                 ext.l     d0
  001706  0c8000000010         cmpi.l    #$10, d0
  00170c  6228                 bhi.b     $1736
  00170e  5740                 subq.w    #$3, d0
  001710  6d1a                 blt.b     $172c
  001712  6722                 beq.b     $1736
  001714  5940                 subq.w    #$4, d0
  001716  6d14                 blt.b     $172c
  001718  671c                 beq.b     $1736
  00171a  5340                 subq.w    #$1, d0
  00171c  6704                 beq.b     $1722
  00171e  5140                 subq.w    #$8, d0
  001720  6d14                 blt.b     $1736
  001722  2f2efffa             move.l    -$6(a6), -(a7)
  001726  2f0a                 move.l    a2, -(a7)
  001728  a990                 _GetDialogItemText 
  00172a  6010                 bra.b     $173c
  00172c  2f2efffa             move.l    -$6(a6), -(a7)
  001730  2f0a                 move.l    a2, -(a7)
  001732  a95e                 _trap_a95e 
  001734  6006                 bra.b     $173c
  001736  3f3c0001             move.w    #$1, -(a7)
  00173a  a9c8                 _SysBeep  
  00173c  245f                 movea.l   (a7)+, a2
  00173e  4e5e                 unlk      a6
  001740  4e75                 rts       

;-------------------------------------------------------------
; InitMusic   (seg 6 +001752, 260 bytes)
  001752  4e56fffe             link.w    a6, #$fffe
  001756  426efffe             clr.w     -$2(a6)
  00175a  4a3900006abe         tst.b     $6abe.l   ; g_6abe
  001760  660000f0             bne.w     $1852
  001764  423900006abe         clr.b     $6abe.l   ; g_6abe
  00176a  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  001770  675e                 beq.b     $17d0
  001772  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  001778  672a                 beq.b     $17a4
  00177a  594f                 subq.w    #$4, a7
  00177c  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001782  42a7                 clr.l     -(a7)
  001784  2f3c0004000d         move.l    #$4000d, -(a7)
  00178a  7000                 moveq     #$0, d0
  00178c  a82a                 _ComponentDispatch 
  00178e  201f                 move.l    (a7)+, d0
  001790  554f                 subq.w    #$2, a7
  001792  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001798  7008                 moveq     #$8, d0
  00179a  a82a                 _ComponentDispatch 
  00179c  301f                 move.w    (a7)+, d0
  00179e  42b900006aca         clr.l     $6aca.l   ; g_6aca
  0017a4  4ab900006ac6         tst.l     $6ac6.l   ; g_6ac6
  0017aa  670e                 beq.b     $17ba
  0017ac  207900006ac6         movea.l   $6ac6.l, a0   ; g_6ac6
  0017b2  a01f                 _DisposePtr 
  0017b4  42b900006ac6         clr.l     $6ac6.l   ; g_6ac6
  0017ba  4ab900006ac2         tst.l     $6ac2.l   ; g_6ac2
  0017c0  670e                 beq.b     $17d0
  0017c2  207900006ac2         movea.l   $6ac2.l, a0   ; g_6ac2
  0017c8  a01f                 _DisposePtr 
  0017ca  42b900006ac2         clr.l     $6ac2.l   ; g_6ac2
  0017d0  42b900006ac2         clr.l     $6ac2.l   ; g_6ac2
  0017d6  42b900006ac6         clr.l     $6ac6.l   ; g_6ac6
  0017dc  42b900006aca         clr.l     $6aca.l   ; g_6aca
  0017e2  61ff0000081c         bsr.l     $2000   ; IsQuickTimeInstalled
  0017e8  4a00                 tst.b     d0
  0017ea  670a                 beq.b     $17f6
  0017ec  13fc000100006ac0     move.b    #$1, $6ac0.l   ; g_6ac0
  0017f4  6006                 bra.b     $17fc
  0017f6  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  0017fc  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  001802  674e                 beq.b     $1852
  001804  4a3900006ac1         tst.b     $6ac1.l   ; g_6ac1
  00180a  6610                 bne.b     $181c
  00180c  554f                 subq.w    #$2, a7
  00180e  7001                 moveq     #$1, d0
  001810  aaaa                 _trap_aaaa 
  001812  301f                 move.w    (a7)+, d0
  001814  13fc000100006ac1     move.b    #$1, $6ac1.l   ; g_6ac1
  00181c  594f                 subq.w    #$4, a7
  00181e  2f3c74756e65         move.l    #$74756e65, -(a7)
  001824  42a7                 clr.l     -(a7)
  001826  7021                 moveq     #$21, d0
  001828  a82a                 _ComponentDispatch 
  00182a  205f                 movea.l   (a7)+, a0
  00182c  23c800006aca         move.l    a0, $6aca.l   ; g_6aca
  001832  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  001838  6608                 bne.b     $1842
  00183a  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  001840  6010                 bra.b     $1852
  001842  13fc000100006abe     move.b    #$1, $6abe.l   ; g_6abe
  00184a  13fc000100006abf     move.b    #$1, $6abf.l   ; g_6abf
  001852  4e5e                 unlk      a6
  001854  4e75                 rts       

;-------------------------------------------------------------
; SetMusic   (seg 6 +001862, 678 bytes)
  001862  4e56fffc             link.w    a6, #$fffc
  001866  48e71f20             movem.l   d3-d7/a2, -(a7)
  00186a  382e0008             move.w    $8(a6), d4
  00186e  7645                 moveq     #$45, d3
  001870  7a00                 moveq     #$0, d5
  001872  33c400000eaa         move.w    d4, $eaa.l   ; g_eaa
  001878  4a3900006abe         tst.b     $6abe.l   ; g_6abe
  00187e  67000280             beq.w     $1b00
  001882  4a390000617d         tst.b     $617d.l   ; g_617d
  001888  67000276             beq.w     $1b00
  00188c  554f                 subq.w    #$2, a7
  00188e  a994                 _CurResFile 
  001890  301f                 move.w    (a7)+, d0
  001892  3c00                 move.w    d0, d6
  001894  4a3900007f22         tst.b     $7f22.l   ; g_7f22
  00189a  6714                 beq.b     $18b0
  00189c  554f                 subq.w    #$2, a7
  00189e  487900007f24         pea.l     $7f24.l   ; g_7f24
  0018a4  a997                 _OpenResFile 
  0018a6  301f                 move.w    (a7)+, d0
  0018a8  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  0018ae  6018                 bra.b     $18c8
  0018b0  554f                 subq.w    #$2, a7
  0018b2  4879000070d8         pea.l     $70d8.l   ; g_70d8
  0018b8  1f3c0001             move.b    #$1, -(a7)
  0018bc  700d                 moveq     #$d, d0
  0018be  aa52                 _HighLevelFSDispatch 
  0018c0  301f                 move.w    (a7)+, d0
  0018c2  33c000007f20         move.w    d0, $7f20.l   ; g_7f20
  0018c8  3f3900007f20         move.w    $7f20.l, -(a7)   ; g_7f20
  0018ce  a998                 _UseResFile 
  0018d0  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  0018d6  6700021c             beq.w     $1af4
  0018da  4a3900006ac1         tst.b     $6ac1.l   ; g_6ac1
  0018e0  67000212             beq.w     $1af4
  0018e4  4a3900006abf         tst.b     $6abf.l   ; g_6abf
  0018ea  67000208             beq.w     $1af4
  0018ee  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  0018f4  670001fe             beq.w     $1af4
  0018f8  61ff000002e6         bsr.l     $1be0   ; ShutDownMusic
  0018fe  61fffffffe52         bsr.l     $1752   ; InitMusic
  001904  4ab900006ac6         tst.l     $6ac6.l   ; g_6ac6
  00190a  670e                 beq.b     $191a
  00190c  207900006ac6         movea.l   $6ac6.l, a0   ; g_6ac6
  001912  a01f                 _DisposePtr 
  001914  42b900006ac6         clr.l     $6ac6.l   ; g_6ac6
  00191a  4ab900006ac2         tst.l     $6ac2.l   ; g_6ac2
  001920  670e                 beq.b     $1930
  001922  207900006ac2         movea.l   $6ac2.l, a0   ; g_6ac2
  001928  a01f                 _DisposePtr 
  00192a  42b900006ac2         clr.l     $6ac2.l   ; g_6ac2
  001930  0c44ffff             cmpi.w    #$ffff, d4
  001934  670001ae             beq.w     $1ae4
  001938  594f                 subq.w    #$4, a7
  00193a  2f3c54756e65         move.l    #$54756e65, -(a7)
  001940  3f04                 move.w    d4, -(a7)
  001942  a9a0                 _GetResource 
  001944  205f                 movea.l   (a7)+, a0
  001946  2448                 movea.l   a0, a2
  001948  554f                 subq.w    #$2, a7
  00194a  a9af                 _ResError 
  00194c  301f                 move.w    (a7)+, d0
  00194e  6600019e             bne.w     $1aee
  001952  200a                 move.l    a2, d0
  001954  67000198             beq.w     $1aee
  001958  594f                 subq.w    #$4, a7
  00195a  2f0a                 move.l    a2, -(a7)
  00195c  a9a5                 _SizeRsrc 
  00195e  201f                 move.l    (a7)+, d0
  001960  2e00                 move.l    d0, d7
  001962  554f                 subq.w    #$2, a7
  001964  a9af                 _ResError 
  001966  301f                 move.w    (a7)+, d0
  001968  671a                 beq.b     $1984
  00196a  3f03                 move.w    d3, -(a7)
  00196c  487900000e66         pea.l     $e66.l   ; g_e66
  001972  4eb900000be8         jsr       $be8.l   ; ReportError
  001978  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  00197e  5c4f                 addq.w    #$6, a7
  001980  60000172             bra.w     $1af4
  001984  204a                 movea.l   a2, a0
  001986  a064                 _MoveHHi  
  001988  a029                 _HLock    
  00198a  204a                 movea.l   a2, a0
  00198c  a04a                 _HNoPurge 
  00198e  2052                 movea.l   (a2), a0
  001990  43eefffc             lea.l     -$4(a6), a1
  001994  7004                 moveq     #$4, d0
  001996  a22e                 _BlockMove 
  001998  202efffc             move.l    -$4(a6), d0
  00199c  a11e                 _NewPtr   
  00199e  23c800006ac6         move.l    a0, $6ac6.l   ; g_6ac6
  0019a4  4ab900006ac6         tst.l     $6ac6.l   ; g_6ac6
  0019aa  661a                 bne.b     $19c6
  0019ac  3f03                 move.w    d3, -(a7)
  0019ae  487900000e66         pea.l     $e66.l   ; g_e66
  0019b4  4eb900000be8         jsr       $be8.l   ; ReportError
  0019ba  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  0019c0  5c4f                 addq.w    #$6, a7
  0019c2  60000130             bra.w     $1af4
  0019c6  2052                 movea.l   (a2), a0
  0019c8  227900006ac6         movea.l   $6ac6.l, a1   ; g_6ac6
  0019ce  202efffc             move.l    -$4(a6), d0
  0019d2  a22e                 _BlockMove 
  0019d4  594f                 subq.w    #$4, a7
  0019d6  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  0019dc  2f3900006ac6         move.l    $6ac6.l, -(a7)   ; g_6ac6
  0019e2  2f2efffc             move.l    -$4(a6), -(a7)
  0019e6  2f3c0008001c         move.l    #$8001c, -(a7)
  0019ec  7000                 moveq     #$0, d0
  0019ee  a82a                 _ComponentDispatch 
  0019f0  201f                 move.l    (a7)+, d0
  0019f2  3600                 move.w    d0, d3
  0019f4  3003                 move.w    d3, d0
  0019f6  48c0                 ext.l     d0
  0019f8  671a                 beq.b     $1a14
  0019fa  3f03                 move.w    d3, -(a7)
  0019fc  487900000e12         pea.l     $e12.l   ; g_e12
  001a02  4eb900000be8         jsr       $be8.l   ; ReportError
  001a08  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  001a0e  5c4f                 addq.w    #$6, a7
  001a10  600000e2             bra.w     $1af4
  001a14  2a07                 move.l    d7, d5
  001a16  9aaefffc             sub.l     -$4(a6), d5
  001a1a  2005                 move.l    d5, d0
  001a1c  a11e                 _NewPtr   
  001a1e  23c800006ac2         move.l    a0, $6ac2.l   ; g_6ac2
  001a24  4ab900006ac2         tst.l     $6ac2.l   ; g_6ac2
  001a2a  661a                 bne.b     $1a46
  001a2c  3f03                 move.w    d3, -(a7)
  001a2e  487900000e66         pea.l     $e66.l   ; g_e66
  001a34  4eb900000be8         jsr       $be8.l   ; ReportError
  001a3a  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  001a40  5c4f                 addq.w    #$6, a7
  001a42  600000b0             bra.w     $1af4
  001a46  2052                 movea.l   (a2), a0
  001a48  202efffc             move.l    -$4(a6), d0
  001a4c  41f00800             lea.l     (a0, d0.l), a0
  001a50  227900006ac2         movea.l   $6ac2.l, a1   ; g_6ac2
  001a56  2005                 move.l    d5, d0
  001a58  a22e                 _BlockMove 
  001a5a  4a3900013c2e         tst.b     $13c2e.l   ; g_13c2e
  001a60  6616                 bne.b     $1a78
  001a62  303900006180         move.w    $6180.l, d0   ; g_6180
  001a68  c1fc1c71             muls.w    #$1c71, d0
  001a6c  2f00                 move.l    d0, -(a7)
  001a6e  61ff000000a4         bsr.l     $1b14   ; SetMusicVolume
  001a74  584f                 addq.w    #$4, a7
  001a76  600a                 bra.b     $1a82
  001a78  42a7                 clr.l     -(a7)
  001a7a  61ff00000098         bsr.l     $1b14   ; SetMusicVolume
  001a80  584f                 addq.w    #$4, a7
  001a82  4a3900006abf         tst.b     $6abf.l   ; g_6abf
  001a88  6750                 beq.b     $1ada
  001a8a  594f                 subq.w    #$4, a7
  001a8c  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001a92  2f3900006ac2         move.l    $6ac2.l, -(a7)   ; g_6ac2
  001a98  2f3c00010000         move.l    #$10000, -(a7)
  001a9e  42a7                 clr.l     -(a7)
  001aa0  2f3c7fffffff         move.l    #$7fffffff, -(a7)
  001aa6  48780016             pea.l     $16.w
  001aaa  42a7                 clr.l     -(a7)
  001aac  42a7                 clr.l     -(a7)
  001aae  2f3c001c000a         move.l    #$1c000a, -(a7)
  001ab4  7000                 moveq     #$0, d0
  001ab6  a82a                 _ComponentDispatch 
  001ab8  201f                 move.l    (a7)+, d0
  001aba  3600                 move.w    d0, d3
  001abc  3003                 move.w    d3, d0
  001abe  48c0                 ext.l     d0
  001ac0  6718                 beq.b     $1ada
  001ac2  3f03                 move.w    d3, -(a7)
  001ac4  487900000e12         pea.l     $e12.l   ; g_e12
  001aca  4eb900000be8         jsr       $be8.l   ; ReportError
  001ad0  423900006ac0         clr.b     $6ac0.l   ; g_6ac0
  001ad6  5c4f                 addq.w    #$6, a7
  001ad8  601a                 bra.b     $1af4
  001ada  204a                 movea.l   a2, a0
  001adc  a02a                 _HUnlock  
  001ade  2f0a                 move.l    a2, -(a7)
  001ae0  a9a3                 _ReleaseResource 
  001ae2  600a                 bra.b     $1aee
  001ae4  42a7                 clr.l     -(a7)
  001ae6  61ff0000002c         bsr.l     $1b14   ; SetMusicVolume
  001aec  584f                 addq.w    #$4, a7
  001aee  33c400000eaa         move.w    d4, $eaa.l   ; g_eaa
  001af4  3f06                 move.w    d6, -(a7)
  001af6  a998                 _UseResFile 
  001af8  3f3900007f20         move.w    $7f20.l, -(a7)   ; g_7f20
  001afe  a99a                 _CloseResFile 
  001b00  4cdf04f8             movem.l   (a7)+, d3-d7/a2
  001b04  4e5e                 unlk      a6
  001b06  4e75                 rts       

;-------------------------------------------------------------
; SetMusicVolume   (seg 6 +001b14, 96 bytes)
  001b14  4e56fffc             link.w    a6, #$fffc
  001b18  2f03                 move.l    d3, -(a7)
  001b1a  262e0008             move.l    $8(a6), d3
  001b1e  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  001b24  6748                 beq.b     $1b6e
  001b26  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  001b2c  6740                 beq.b     $1b6e
  001b2e  4a3900006abf         tst.b     $6abf.l   ; g_6abf
  001b34  6738                 beq.b     $1b6e
  001b36  4a3900006ac1         tst.b     $6ac1.l   ; g_6ac1
  001b3c  6730                 beq.b     $1b6e
  001b3e  2003                 move.l    d3, d0
  001b40  0680fffff448         addi.l    #$fffff448, d0
  001b46  4a80                 tst.l     d0
  001b48  6c04                 bge.b     $1b4e
  001b4a  7600                 moveq     #$0, d3
  001b4c  6006                 bra.b     $1b54
  001b4e  0683fffff448         addi.l    #$fffff448, d3
  001b54  594f                 subq.w    #$4, a7
  001b56  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001b5c  2f03                 move.l    d3, -(a7)
  001b5e  2f3c00040010         move.l    #$40010, -(a7)
  001b64  7000                 moveq     #$0, d0
  001b66  a82a                 _ComponentDispatch 
  001b68  201f                 move.l    (a7)+, d0
  001b6a  2d40fffc             move.l    d0, -$4(a6)
  001b6e  261f                 move.l    (a7)+, d3
  001b70  4e5e                 unlk      a6
  001b72  4e75                 rts       

;-------------------------------------------------------------
; MusicIdle   (seg 6 +001b86, 78 bytes)
  001b86  4e56fffe             link.w    a6, #$fffe
  001b8a  426efffe             clr.w     -$2(a6)
  001b8e  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  001b94  673a                 beq.b     $1bd0
  001b96  4a3900006abf         tst.b     $6abf.l   ; g_6abf
  001b9c  6732                 beq.b     $1bd0
  001b9e  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  001ba4  672a                 beq.b     $1bd0
  001ba6  527900006ace         addq.w    #$1, $6ace.l   ; g_6ace
  001bac  0c79002800006ace     cmpi.w    #$28, $6ace.l   ; g_6ace
  001bb4  6d1a                 blt.b     $1bd0
  001bb6  594f                 subq.w    #$4, a7
  001bb8  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001bbe  2f3c00000019         move.l    #$19, -(a7)
  001bc4  7000                 moveq     #$0, d0
  001bc6  a82a                 _ComponentDispatch 
  001bc8  201f                 move.l    (a7)+, d0
  001bca  427900006ace         clr.w     $6ace.l   ; g_6ace
  001bd0  4e5e                 unlk      a6
  001bd2  4e75                 rts       

;-------------------------------------------------------------
; ShutDownMusic   (seg 6 +001be0, 160 bytes)
  001be0  4e560000             link.w    a6, #$0
  001be4  423900006abe         clr.b     $6abe.l   ; g_6abe
  001bea  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  001bf0  6700008a             beq.w     $1c7c
  001bf4  4a3900006ac1         tst.b     $6ac1.l   ; g_6ac1
  001bfa  67000080             beq.w     $1c7c
  001bfe  4a3900006abf         tst.b     $6abf.l   ; g_6abf
  001c04  6776                 beq.b     $1c7c
  001c06  4ab900006aca         tst.l     $6aca.l   ; g_6aca
  001c0c  672a                 beq.b     $1c38
  001c0e  594f                 subq.w    #$4, a7
  001c10  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001c16  42a7                 clr.l     -(a7)
  001c18  2f3c0004000d         move.l    #$4000d, -(a7)
  001c1e  7000                 moveq     #$0, d0
  001c20  a82a                 _ComponentDispatch 
  001c22  201f                 move.l    (a7)+, d0
  001c24  554f                 subq.w    #$2, a7
  001c26  2f3900006aca         move.l    $6aca.l, -(a7)   ; g_6aca
  001c2c  7008                 moveq     #$8, d0
  001c2e  a82a                 _ComponentDispatch 
  001c30  301f                 move.w    (a7)+, d0
  001c32  42b900006aca         clr.l     $6aca.l   ; g_6aca
  001c38  4ab900006ac6         tst.l     $6ac6.l   ; g_6ac6
  001c3e  670e                 beq.b     $1c4e
  001c40  207900006ac6         movea.l   $6ac6.l, a0   ; g_6ac6
  001c46  a01f                 _DisposePtr 
  001c48  42b900006ac6         clr.l     $6ac6.l   ; g_6ac6
  001c4e  4ab900006ac2         tst.l     $6ac2.l   ; g_6ac2
  001c54  670e                 beq.b     $1c64
  001c56  207900006ac2         movea.l   $6ac2.l, a0   ; g_6ac2
  001c5c  a01f                 _DisposePtr 
  001c5e  42b900006ac2         clr.l     $6ac2.l   ; g_6ac2
  001c64  4a3900006ac1         tst.b     $6ac1.l   ; g_6ac1
  001c6a  670a                 beq.b     $1c76
  001c6c  7002                 moveq     #$2, d0
  001c6e  aaaa                 _trap_aaaa 
  001c70  423900006ac1         clr.b     $6ac1.l   ; g_6ac1
  001c76  423900006abf         clr.b     $6abf.l   ; g_6abf
  001c7c  4e5e                 unlk      a6
  001c7e  4e75                 rts       

;-------------------------------------------------------------
; ImportMovie   (seg 6 +001c90, 772 bytes)
  001c90  4e56fe8a             link.w    a6, #$fe8a
  001c94  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  001c98  42aeff94             clr.l     -$6c(a6)
  001c9c  97cb                 suba.l    a3, a3
  001c9e  42aeff9c             clr.l     -$64(a6)
  001ca2  7600                 moveq     #$0, d3
  001ca4  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  001caa  2d7c4d6f6f56fe8a     move.l    #$4d6f6f56, -$176(a6)
  001cb2  42a7                 clr.l     -(a7)
  001cb4  3f3c0001             move.w    #$1, -(a7)
  001cb8  486efe8a             pea.l     -$176(a6)
  001cbc  486effa0             pea.l     -$60(a6)
  001cc0  7043                 moveq     #$43, d0
  001cc2  aaa3                 _trap_aaa3 
  001cc4  4a2effa0             tst.b     -$60(a6)
  001cc8  660c                 bne.b     $1cd6
  001cca  3f3c0007             move.w    #$7, -(a7)
  001cce  4eb900000af8         jsr       $af8.l   ; FatalError
  001cd4  544f                 addq.w    #$2, a7
  001cd6  4eb900000b28         jsr       $b28.l   ; HideCursorSafe
  001cdc  486efe8e             pea.l     -$172(a6)
  001ce0  2f3c0004012c         move.l    #$4012c, -(a7)
  001ce6  4eb900000408         jsr       $408.l   ; seg4+a50
  001cec  600c                 bra.b     $1cfa
  001cee  3f3c0012             move.w    #$12, -(a7)
  001cf2  4eb900000af8         jsr       $af8.l   ; FatalError
  001cf8  544f                 addq.w    #$2, a7
  001cfa  486efe8e             pea.l     -$172(a6)
  001cfe  486effac             pea.l     -$54(a6)
  001d02  42a7                 clr.l     -(a7)
  001d04  42a7                 clr.l     -(a7)
  001d06  a98b                 _ParamText 
  001d08  426eff8e             clr.w     -$72(a6)
  001d0c  554f                 subq.w    #$2, a7
  001d0e  486effa6             pea.l     -$5a(a6)
  001d12  486eff8e             pea.l     -$72(a6)
  001d16  1f3c0001             move.b    #$1, -(a7)
  001d1a  303c0192             move.w    #$192, d0
  001d1e  aaaa                 _trap_aaaa 
  001d20  301f                 move.w    (a7)+, d0
  001d22  3a00                 move.w    d0, d5
  001d24  4a45                 tst.w     d5
  001d26  670c                 beq.b     $1d34
  001d28  3f3c0008             move.w    #$8, -(a7)
  001d2c  4eb900000af8         jsr       $af8.l   ; FatalError
  001d32  544f                 addq.w    #$2, a7
  001d34  42aeff94             clr.l     -$6c(a6)
  001d38  554f                 subq.w    #$2, a7
  001d3a  486eff94             pea.l     -$6c(a6)
  001d3e  3f2eff8e             move.w    -$72(a6), -(a7)
  001d42  42a7                 clr.l     -(a7)
  001d44  42a7                 clr.l     -(a7)
  001d46  4267                 clr.w     -(a7)
  001d48  42a7                 clr.l     -(a7)
  001d4a  303c00f0             move.w    #$f0, d0
  001d4e  aaaa                 _trap_aaaa 
  001d50  301f                 move.w    (a7)+, d0
  001d52  3a00                 move.w    d0, d5
  001d54  4a45                 tst.w     d5
  001d56  670c                 beq.b     $1d64
  001d58  3f3c0009             move.w    #$9, -(a7)
  001d5c  4eb900000af8         jsr       $af8.l   ; FatalError
  001d62  544f                 addq.w    #$2, a7
  001d64  594f                 subq.w    #$4, a7
  001d66  2f2eff94             move.l    -$6c(a6), -(a7)
  001d6a  703f                 moveq     #$3f, d0
  001d6c  aaaa                 _trap_aaaa 
  001d6e  201f                 move.l    (a7)+, d0
  001d70  2d40ff90             move.l    d0, -$70(a6)
  001d74  554f                 subq.w    #$2, a7
  001d76  7003                 moveq     #$3, d0
  001d78  aaaa                 _trap_aaaa 
  001d7a  301f                 move.w    (a7)+, d0
  001d7c  3a00                 move.w    d0, d5
  001d7e  4a45                 tst.w     d5
  001d80  670c                 beq.b     $1d8e
  001d82  3f3c000a             move.w    #$a, -(a7)
  001d86  4eb900000af8         jsr       $af8.l   ; FatalError
  001d8c  544f                 addq.w    #$2, a7
  001d8e  7e01                 moveq     #$1, d7
  001d90  600001f2             bra.w     $1f84
  001d94  594f                 subq.w    #$4, a7
  001d96  2f2eff94             move.l    -$6c(a6), -(a7)
  001d9a  2f07                 move.l    d7, -(a7)
  001d9c  303c0117             move.w    #$117, d0
  001da0  aaaa                 _trap_aaaa 
  001da2  205f                 movea.l   (a7)+, a0
  001da4  2448                 movea.l   a0, a2
  001da6  554f                 subq.w    #$2, a7
  001da8  7003                 moveq     #$3, d0
  001daa  aaaa                 _trap_aaaa 
  001dac  301f                 move.w    (a7)+, d0
  001dae  3a00                 move.w    d0, d5
  001db0  4a45                 tst.w     d5
  001db2  670c                 beq.b     $1dc0
  001db4  3f3c000a             move.w    #$a, -(a7)
  001db8  4eb900000af8         jsr       $af8.l   ; FatalError
  001dbe  544f                 addq.w    #$2, a7
  001dc0  486eff98             pea.l     -$68(a6)
  001dc4  2f0a                 move.l    a2, -(a7)
  001dc6  61ff000001da         bsr.l     $1fa2   ; GetTrackType
  001dcc  3a00                 move.w    d0, d5
  001dce  4a45                 tst.w     d5
  001dd0  504f                 addq.w    #$8, a7
  001dd2  670c                 beq.b     $1de0
  001dd4  3f3c000b             move.w    #$b, -(a7)
  001dd8  4eb900000af8         jsr       $af8.l   ; FatalError
  001dde  544f                 addq.w    #$2, a7
  001de0  4aaeff9c             tst.l     -$64(a6)
  001de4  6600019c             bne.w     $1f82
  001de8  0cae6d757369ff98     cmpi.l    #$6d757369, -$68(a6)
  001df0  66000190             bne.w     $1f82
  001df4  97cb                 suba.l    a3, a3
  001df6  2d47ff9c             move.l    d7, -$64(a6)
  001dfa  264a                 movea.l   a2, a3
  001dfc  594f                 subq.w    #$4, a7
  001dfe  2f0a                 move.l    a2, -(a7)
  001e00  7062                 moveq     #$62, d0
  001e02  aaaa                 _trap_aaaa 
  001e04  205f                 movea.l   (a7)+, a0
  001e06  2648                 movea.l   a0, a3
  001e08  200b                 move.l    a3, d0
  001e0a  660c                 bne.b     $1e18
  001e0c  3f3c000c             move.w    #$c, -(a7)
  001e10  4eb900000af8         jsr       $af8.l   ; FatalError
  001e16  544f                 addq.w    #$2, a7
  001e18  99cc                 suba.l    a4, a4
  001e1a  95ca                 suba.l    a2, a2
  001e1c  7002                 moveq     #$2, d0
  001e1e  a122                 _NewHandle 
  001e20  2848                 movea.l   a0, a4
  001e22  2f0b                 move.l    a3, -(a7)
  001e24  2f2eff9c             move.l    -$64(a6), -(a7)
  001e28  2f0c                 move.l    a4, -(a7)
  001e2a  7078                 moveq     #$78, d0
  001e2c  aaaa                 _trap_aaaa 
  001e2e  204c                 movea.l   a4, a0
  001e30  a064                 _MoveHHi  
  001e32  a029                 _HLock    
  001e34  594f                 subq.w    #$4, a7
  001e36  2f3c54756e65         move.l    #$54756e65, -(a7)
  001e3c  3f3c1af4             move.w    #$1af4, -(a7)
  001e40  a9a0                 _GetResource 
  001e42  205f                 movea.l   (a7)+, a0
  001e44  2448                 movea.l   a0, a2
  001e46  200a                 move.l    a2, d0
  001e48  660c                 bne.b     $1e56
  001e4a  3f3c000f             move.w    #$f, -(a7)
  001e4e  4eb900000af8         jsr       $af8.l   ; FatalError
  001e54  544f                 addq.w    #$2, a7
  001e56  594f                 subq.w    #$4, a7
  001e58  2f0c                 move.l    a4, -(a7)
  001e5a  4eb900000370         jsr       $370.l   ; seg4+6a2
  001e60  201f                 move.l    (a7)+, d0
  001e62  2a00                 move.l    d0, d5
  001e64  2f0a                 move.l    a2, -(a7)
  001e66  2f05                 move.l    d5, -(a7)
  001e68  7003                 moveq     #$3, d0
  001e6a  a822                 _ResourceDispatch 
  001e6c  2f0a                 move.l    a2, -(a7)
  001e6e  3f3c1af4             move.w    #$1af4, -(a7)
  001e72  486effac             pea.l     -$54(a6)
  001e76  a9a9                 _SetResInfo 
  001e78  204a                 movea.l   a2, a0
  001e7a  a064                 _MoveHHi  
  001e7c  a029                 _HLock    
  001e7e  2f0a                 move.l    a2, -(a7)
  001e80  42a7                 clr.l     -(a7)
  001e82  2f14                 move.l    (a4), -(a7)
  001e84  2f05                 move.l    d5, -(a7)
  001e86  7002                 moveq     #$2, d0
  001e88  a822                 _ResourceDispatch 
  001e8a  204a                 movea.l   a2, a0
  001e8c  a02a                 _HUnlock  
  001e8e  554f                 subq.w    #$2, a7
  001e90  a994                 _CurResFile 
  001e92  301f                 move.w    (a7)+, d0
  001e94  3f00                 move.w    d0, -(a7)
  001e96  a999                 _UpdateResFile 
  001e98  2f0a                 move.l    a2, -(a7)
  001e9a  a9a3                 _ReleaseResource 
  001e9c  204c                 movea.l   a4, a0
  001e9e  a02a                 _HUnlock  
  001ea0  204c                 movea.l   a4, a0
  001ea2  a023                 _DisposeHandle 
  001ea4  7801                 moveq     #$1, d4
  001ea6  2605                 move.l    d5, d3
  001ea8  7002                 moveq     #$2, d0
  001eaa  a122                 _NewHandle 
  001eac  2848                 movea.l   a0, a4
  001eae  594f                 subq.w    #$4, a7
  001eb0  2f0b                 move.l    a3, -(a7)
  001eb2  7079                 moveq     #$79, d0
  001eb4  aaaa                 _trap_aaaa 
  001eb6  201f                 move.l    (a7)+, d0
  001eb8  2c00                 move.l    d0, d6
  001eba  600000b8             bra.w     $1f74
  001ebe  2f0b                 move.l    a3, -(a7)
  001ec0  2f04                 move.l    d4, -(a7)
  001ec2  486efff8             pea.l     -$8(a6)
  001ec6  42a7                 clr.l     -(a7)
  001ec8  707a                 moveq     #$7a, d0
  001eca  aaaa                 _trap_aaaa 
  001ecc  554f                 subq.w    #$2, a7
  001ece  2f0b                 move.l    a3, -(a7)
  001ed0  2f0c                 move.l    a4, -(a7)
  001ed2  42a7                 clr.l     -(a7)
  001ed4  486efffc             pea.l     -$4(a6)
  001ed8  2f2efff8             move.l    -$8(a6), -(a7)
  001edc  42a7                 clr.l     -(a7)
  001ede  42a7                 clr.l     -(a7)
  001ee0  42a7                 clr.l     -(a7)
  001ee2  42a7                 clr.l     -(a7)
  001ee4  48780001             pea.l     $1.w
  001ee8  42a7                 clr.l     -(a7)
  001eea  42a7                 clr.l     -(a7)
  001eec  707e                 moveq     #$7e, d0
  001eee  aaaa                 _trap_aaaa 
  001ef0  301f                 move.w    (a7)+, d0
  001ef2  3a00                 move.w    d0, d5
  001ef4  3005                 move.w    d5, d0
  001ef6  48c0                 ext.l     d0
  001ef8  670c                 beq.b     $1f06
  001efa  3f3c000d             move.w    #$d, -(a7)
  001efe  4eb900000af8         jsr       $af8.l   ; FatalError
  001f04  544f                 addq.w    #$2, a7
  001f06  b886                 cmp.l     d6, d4
  001f08  670a                 beq.b     $1f14
  001f0a  202efffc             move.l    -$4(a6), d0
  001f0e  5980                 subq.l    #$4, d0
  001f10  2d40fffc             move.l    d0, -$4(a6)
  001f14  95ca                 suba.l    a2, a2
  001f16  594f                 subq.w    #$4, a7
  001f18  2f3c54756e65         move.l    #$54756e65, -(a7)
  001f1e  3f3c1af4             move.w    #$1af4, -(a7)
  001f22  a9a0                 _GetResource 
  001f24  205f                 movea.l   (a7)+, a0
  001f26  2448                 movea.l   a0, a2
  001f28  200a                 move.l    a2, d0
  001f2a  660c                 bne.b     $1f38
  001f2c  3f3c000e             move.w    #$e, -(a7)
  001f30  4eb900000af8         jsr       $af8.l   ; FatalError
  001f36  544f                 addq.w    #$2, a7
  001f38  d6aefffc             add.l     -$4(a6), d3
  001f3c  2f0a                 move.l    a2, -(a7)
  001f3e  2f03                 move.l    d3, -(a7)
  001f40  7003                 moveq     #$3, d0
  001f42  a822                 _ResourceDispatch 
  001f44  2f0a                 move.l    a2, -(a7)
  001f46  3f3c1af4             move.w    #$1af4, -(a7)
  001f4a  486effac             pea.l     -$54(a6)
  001f4e  a9a9                 _SetResInfo 
  001f50  204a                 movea.l   a2, a0
  001f52  a064                 _MoveHHi  
  001f54  a029                 _HLock    
  001f56  2f0a                 move.l    a2, -(a7)
  001f58  2003                 move.l    d3, d0
  001f5a  90aefffc             sub.l     -$4(a6), d0
  001f5e  2f00                 move.l    d0, -(a7)
  001f60  2f14                 move.l    (a4), -(a7)
  001f62  2f2efffc             move.l    -$4(a6), -(a7)
  001f66  7002                 moveq     #$2, d0
  001f68  a822                 _ResourceDispatch 
  001f6a  204a                 movea.l   a2, a0
  001f6c  a02a                 _HUnlock  
  001f6e  2f0a                 move.l    a2, -(a7)
  001f70  a9a3                 _ReleaseResource 
  001f72  5284                 addq.l    #$1, d4
  001f74  2006                 move.l    d6, d0
  001f76  5280                 addq.l    #$1, d0
  001f78  b880                 cmp.l     d0, d4
  001f7a  6d00ff42             blt.w     $1ebe
  001f7e  204c                 movea.l   a4, a0
  001f80  a023                 _DisposeHandle 
  001f82  5287                 addq.l    #$1, d7
  001f84  beaeff90             cmp.l     -$70(a6), d7
  001f88  6f00fe0a             ble.w     $1d94
  001f8c  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  001f90  4e5e                 unlk      a6
  001f92  4e75                 rts       

;-------------------------------------------------------------
; GetTrackType   (seg 6 +001fa2, 78 bytes)
  001fa2  4e56fff8             link.w    a6, #$fff8
  001fa6  42aefffc             clr.l     -$4(a6)
  001faa  594f                 subq.w    #$4, a7
  001fac  2f2e0008             move.l    $8(a6), -(a7)
  001fb0  7062                 moveq     #$62, d0
  001fb2  aaaa                 _trap_aaaa 
  001fb4  205f                 movea.l   (a7)+, a0
  001fb6  2d48fff8             move.l    a0, -$8(a6)
  001fba  554f                 subq.w    #$2, a7
  001fbc  7003                 moveq     #$3, d0
  001fbe  aaaa                 _trap_aaaa 
  001fc0  301f                 move.w    (a7)+, d0
  001fc2  48c0                 ext.l     d0
  001fc4  6610                 bne.b     $1fd6
  001fc6  2f2efff8             move.l    -$8(a6), -(a7)
  001fca  486efffc             pea.l     -$4(a6)
  001fce  42a7                 clr.l     -(a7)
  001fd0  42a7                 clr.l     -(a7)
  001fd2  706f                 moveq     #$6f, d0
  001fd4  aaaa                 _trap_aaaa 
  001fd6  554f                 subq.w    #$2, a7
  001fd8  7003                 moveq     #$3, d0
  001fda  aaaa                 _trap_aaaa 
  001fdc  301f                 move.w    (a7)+, d0
  001fde  48c0                 ext.l     d0
  001fe0  6608                 bne.b     $1fea
  001fe2  206e000c             movea.l   $c(a6), a0
  001fe6  20aefffc             move.l    -$4(a6), (a0)
  001fea  7000                 moveq     #$0, d0
  001fec  4e5e                 unlk      a6
  001fee  4e75                 rts       

;-------------------------------------------------------------
; IsQuickTimeInstalled   (seg 6 +002000, 98 bytes)
  002000  4e56fffc             link.w    a6, #$fffc
  002004  2f03                 move.l    d3, -(a7)
  002006  554f                 subq.w    #$2, a7
  002008  2f3c7174696d         move.l    #$7174696d, -(a7)
  00200e  486efffc             pea.l     -$4(a6)
  002012  4eb900000368         jsr       $368.l   ; seg4+494
  002018  301f                 move.w    (a7)+, d0
  00201a  3600                 move.w    d0, d3
  00201c  3003                 move.w    d3, d0
  00201e  48c0                 ext.l     d0
  002020  660a                 bne.b     $202c
  002022  0cae02000000fffc     cmpi.l    #$2000000, -$4(a6)
  00202a  6c04                 bge.b     $2030
  00202c  7000                 moveq     #$0, d0
  00202e  602c                 bra.b     $205c
  002030  554f                 subq.w    #$2, a7
  002032  2f3c7174696d         move.l    #$7174696d, -(a7)
  002038  486efffc             pea.l     -$4(a6)
  00203c  4eb900000368         jsr       $368.l   ; seg4+494
  002042  301f                 move.w    (a7)+, d0
  002044  3600                 move.w    d0, d3
  002046  3003                 move.w    d3, d0
  002048  48c0                 ext.l     d0
  00204a  660a                 bne.b     $2056
  00204c  0cae02500000fffc     cmpi.l    #$2500000, -$4(a6)
  002054  6c04                 bge.b     $205a
  002056  7000                 moveq     #$0, d0
  002058  6002                 bra.b     $205c
  00205a  7001                 moveq     #$1, d0
  00205c  261f                 move.l    (a7)+, d3
  00205e  4e5e                 unlk      a6
  002060  4e75                 rts       

;-------------------------------------------------------------
; IsOneGammaAvailable   (seg 6 +00207a, 98 bytes)
  00207a  4e56fffc             link.w    a6, #$fffc
  00207e  594f                 subq.w    #$4, a7
  002080  3f3ca89f             move.w    #$a89f, -(a7)
  002084  1f3c0001             move.b    #$1, -(a7)
  002088  4eb900000378         jsr       $378.l   ; seg4+6b0
  00208e  205f                 movea.l   (a7)+, a0
  002090  2d48fffc             move.l    a0, -$4(a6)
  002094  594f                 subq.w    #$4, a7
  002096  3f3caa29             move.w    #$aa29, -(a7)
  00209a  1f3c0001             move.b    #$1, -(a7)
  00209e  4eb900000378         jsr       $378.l   ; seg4+6b0
  0020a4  205f                 movea.l   (a7)+, a0
  0020a6  b1eefffc             cmpa.l    -$4(a6), a0
  0020aa  6604                 bne.b     $20b0
  0020ac  7000                 moveq     #$0, d0
  0020ae  6028                 bra.b     $20d8
  0020b0  554f                 subq.w    #$2, a7
  0020b2  2f2e0008             move.l    $8(a6), -(a7)
  0020b6  3f3c000d             move.w    #$d, -(a7)
  0020ba  aa2c                 _TestDeviceAttribute 
  0020bc  101f                 move.b    (a7)+, d0
  0020be  6714                 beq.b     $20d4
  0020c0  554f                 subq.w    #$2, a7
  0020c2  2f2e0008             move.l    $8(a6), -(a7)
  0020c6  3f3c000e             move.w    #$e, -(a7)
  0020ca  aa2c                 _TestDeviceAttribute 
  0020cc  101f                 move.b    (a7)+, d0
  0020ce  6704                 beq.b     $20d4
  0020d0  7000                 moveq     #$0, d0
  0020d2  6004                 bra.b     $20d8
  0020d4  103c00ff             move.b    #$ff, d0
  0020d8  4e5e                 unlk      a6
  0020da  4e75                 rts       

;-------------------------------------------------------------
; SetupGammaTools   (seg 6 +0020f2, 318 bytes)
  0020f2  4e56fffc             link.w    a6, #$fffc
  0020f6  48e71030             movem.l   d3/a2-a3, -(a7)
  0020fa  7600                 moveq     #$0, d3
  0020fc  0cb947414d4100006ab6 cmpi.l    #$47414d41, $6ab6.l   ; g_6ab6
  002106  6606                 bne.b     $210e
  002108  70ff                 moveq     #$ff, d0
  00210a  6000011c             bra.w     $2228
  00210e  42b900006aba         clr.l     $6aba.l   ; g_6aba
  002114  23fc47414d4100006ab6 move.l    #$47414d41, $6ab6.l   ; g_6ab6
  00211e  594f                 subq.w    #$4, a7
  002120  aa29                 _GetDeviceList 
  002122  205f                 movea.l   (a7)+, a0
  002124  2648                 movea.l   a0, a3
  002126  600000f8             bra.w     $2220
  00212a  486efffc             pea.l     -$4(a6)
  00212e  2f0b                 move.l    a3, -(a7)
  002130  61ff00000174         bsr.l     $22a6   ; GetDevGammaTable
  002136  3600                 move.w    d0, d3
  002138  504f                 addq.w    #$8, a7
  00213a  6706                 beq.b     $2142
  00213c  3003                 move.w    d3, d0
  00213e  600000e8             bra.w     $2228
  002142  7014                 moveq     #$14, d0
  002144  a122                 _NewHandle 
  002146  2448                 movea.l   a0, a2
  002148  200a                 move.l    a2, d0
  00214a  660e                 bne.b     $215a
  00214c  554f                 subq.w    #$2, a7
  00214e  3eb80220             move.w    $220.w, (a7)
  002152  301f                 move.w    (a7)+, d0
  002154  3600                 move.w    d0, d3
  002156  600000d0             bra.w     $2228
  00215a  206efffc             movea.l   -$4(a6), a0
  00215e  226efffc             movea.l   -$4(a6), a1
  002162  30290006             move.w    $6(a1), d0
  002166  c1e80008             muls.w    $8(a0), d0
  00216a  206efffc             movea.l   -$4(a6), a0
  00216e  3228000a             move.w    $a(a0), d1
  002172  48c1                 ext.l     d1
  002174  4c001800             muls.l    d0, d1
  002178  2001                 move.l    d1, d0
  00217a  e480                 asr.l     #$2, d0
  00217c  e088                 lsr.l     #$8, d0
  00217e  e088                 lsr.l     #$8, d0
  002180  e088                 lsr.l     #$8, d0
  002182  ea88                 lsr.l     #$5, d0
  002184  d081                 add.l     d1, d0
  002186  e680                 asr.l     #$3, d0
  002188  206efffc             movea.l   -$4(a6), a0
  00218c  32280004             move.w    $4(a0), d1
  002190  48c1                 ext.l     d1
  002192  740e                 moveq     #$e, d2
  002194  d282                 add.l     d2, d1
  002196  d280                 add.l     d0, d1
  002198  2052                 movea.l   (a2), a0
  00219a  3081                 move.w    d1, (a0)
  00219c  206efffc             movea.l   -$4(a6), a0
  0021a0  2252                 movea.l   (a2), a1
  0021a2  336800040002         move.w    $4(a0), $2(a1)
  0021a8  2052                 movea.l   (a2), a0
  0021aa  214b000c             move.l    a3, $c(a0)
  0021ae  2052                 movea.l   (a2), a0
  0021b0  3250                 movea.w   (a0), a1
  0021b2  2009                 move.l    a1, d0
  0021b4  a122                 _NewHandle 
  0021b6  2252                 movea.l   (a2), a1
  0021b8  23480004             move.l    a0, $4(a1)
  0021bc  2052                 movea.l   (a2), a0
  0021be  4aa80004             tst.l     $4(a0)
  0021c2  660c                 bne.b     $21d0
  0021c4  554f                 subq.w    #$2, a7
  0021c6  3eb80220             move.w    $220.w, (a7)
  0021ca  301f                 move.w    (a7)+, d0
  0021cc  3600                 move.w    d0, d3
  0021ce  6058                 bra.b     $2228
  0021d0  2052                 movea.l   (a2), a0
  0021d2  3250                 movea.w   (a0), a1
  0021d4  2009                 move.l    a1, d0
  0021d6  a122                 _NewHandle 
  0021d8  2252                 movea.l   (a2), a1
  0021da  23480008             move.l    a0, $8(a1)
  0021de  2052                 movea.l   (a2), a0
  0021e0  4aa80008             tst.l     $8(a0)
  0021e4  660c                 bne.b     $21f2
  0021e6  554f                 subq.w    #$2, a7
  0021e8  3eb80220             move.w    $220.w, (a7)
  0021ec  301f                 move.w    (a7)+, d0
  0021ee  3600                 move.w    d0, d3
  0021f0  6036                 bra.b     $2228
  0021f2  2052                 movea.l   (a2), a0
  0021f4  3250                 movea.w   (a0), a1
  0021f6  2009                 move.l    a1, d0
  0021f8  206efffc             movea.l   -$4(a6), a0
  0021fc  2252                 movea.l   (a2), a1
  0021fe  22690004             movea.l   $4(a1), a1
  002202  2251                 movea.l   (a1), a1
  002204  a02e                 _BlockMove 
  002206  2052                 movea.l   (a2), a0
  002208  217900006aba0010     move.l    $6aba.l, $10(a0)   ; g_6aba
  002210  23ca00006aba         move.l    a2, $6aba.l   ; g_6aba
  002216  594f                 subq.w    #$4, a7
  002218  2f0b                 move.l    a3, -(a7)
  00221a  aa2b                 _GetNextDevice 
  00221c  205f                 movea.l   (a7)+, a0
  00221e  2648                 movea.l   a0, a3
  002220  200b                 move.l    a3, d0
  002222  6600ff06             bne.w     $212a
  002226  7000                 moveq     #$0, d0
  002228  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  00222c  4e5e                 unlk      a6
  00222e  4e75                 rts       

;-------------------------------------------------------------
; DisposeGammaTools   (seg 6 +002242, 80 bytes)
  002242  4e560000             link.w    a6, #$0
  002246  48e70030             movem.l   a2-a3, -(a7)
  00224a  0cb947414d4100006ab6 cmpi.l    #$47414d41, $6ab6.l   ; g_6ab6
  002254  6704                 beq.b     $225a
  002256  70ff                 moveq     #$ff, d0
  002258  6030                 bra.b     $228a
  00225a  247900006aba         movea.l   $6aba.l, a2   ; g_6aba
  002260  601c                 bra.b     $227e
  002262  2052                 movea.l   (a2), a0
  002264  26680010             movea.l   $10(a0), a3
  002268  2052                 movea.l   (a2), a0
  00226a  20680004             movea.l   $4(a0), a0
  00226e  a023                 _DisposeHandle 
  002270  2052                 movea.l   (a2), a0
  002272  20680008             movea.l   $8(a0), a0
  002276  a023                 _DisposeHandle 
  002278  204a                 movea.l   a2, a0
  00227a  a023                 _DisposeHandle 
  00227c  244b                 movea.l   a3, a2
  00227e  200a                 move.l    a2, d0
  002280  66e0                 bne.b     $2262
  002282  42b900006ab6         clr.l     $6ab6.l   ; g_6ab6
  002288  7000                 moveq     #$0, d0
  00228a  4cdf0c00             movem.l   (a7)+, a2-a3
  00228e  4e5e                 unlk      a6
  002290  4e75                 rts       

;-------------------------------------------------------------
; GetDevGammaTable   (seg 6 +0022a6, 94 bytes)
  0022a6  4e560000             link.w    a6, #$0
  0022aa  48e71038             movem.l   d3/a2-a4, -(a7)
  0022ae  286e0008             movea.l   $8(a6), a4
  0022b2  266e000c             movea.l   $c(a6), a3
  0022b6  7600                 moveq     #$0, d3
  0022b8  4293                 clr.l     (a3)
  0022ba  2f0c                 move.l    a4, -(a7)
  0022bc  61fffffffdbc         bsr.l     $207a   ; IsOneGammaAvailable
  0022c2  4a00                 tst.b     d0
  0022c4  584f                 addq.w    #$4, a7
  0022c6  6604                 bne.b     $22cc
  0022c8  70ff                 moveq     #$ff, d0
  0022ca  6030                 bra.b     $22fc
  0022cc  7032                 moveq     #$32, d0
  0022ce  a31e                 _NewPtr   
  0022d0  2448                 movea.l   a0, a2
  0022d2  2008                 move.l    a0, d0
  0022d4  660a                 bne.b     $22e0
  0022d6  554f                 subq.w    #$2, a7
  0022d8  3eb80220             move.w    $220.w, (a7)
  0022dc  301f                 move.w    (a7)+, d0
  0022de  601c                 bra.b     $22fc
  0022e0  357c0008001a         move.w    #$8, $1a(a2)
  0022e6  2054                 movea.l   (a4), a0
  0022e8  35500018             move.w    (a0), $18(a2)
  0022ec  254b001c             move.l    a3, $1c(a2)
  0022f0  204a                 movea.l   a2, a0
  0022f2  a005                 _Status   
  0022f4  3600                 move.w    d0, d3
  0022f6  204a                 movea.l   a2, a0
  0022f8  a01f                 _DisposePtr 
  0022fa  3003                 move.w    d3, d0
  0022fc  4cdf1c08             movem.l   (a7)+, d3/a2-a4
  002300  4e5e                 unlk      a6
  002302  4e75                 rts       

;-------------------------------------------------------------
; SetPrefFile   (seg 6 +002318, 218 bytes)
  002318  4e56ffb4             link.w    a6, #$ffb4
  00231c  48e71e20             movem.l   d3-d6/a2, -(a7)
  002320  2c2e000c             move.l    $c(a6), d6
  002324  2a2e0010             move.l    $10(a6), d5
  002328  246e0018             movea.l   $18(a6), a2
  00232c  7800                 moveq     #$0, d4
  00232e  554f                 subq.w    #$2, a7
  002330  a994                 _CurResFile 
  002332  301f                 move.w    (a7)+, d0
  002334  206e0014             movea.l   $14(a6), a0
  002338  3080                 move.w    d0, (a0)
  00233a  4252                 clr.w     (a2)
  00233c  554f                 subq.w    #$2, a7
  00233e  3f3c8000             move.w    #$8000, -(a7)
  002342  2f3c70726566         move.l    #$70726566, -(a7)
  002348  1f3c0001             move.b    #$1, -(a7)
  00234c  486effb4             pea.l     -$4c(a6)
  002350  486effb6             pea.l     -$4a(a6)
  002354  4eb900000438         jsr       $438.l   ; seg4+c28
  00235a  301f                 move.w    (a7)+, d0
  00235c  3600                 move.w    d0, d3
  00235e  554f                 subq.w    #$2, a7
  002360  3f2effb4             move.w    -$4c(a6), -(a7)
  002364  2f2effb6             move.l    -$4a(a6), -(a7)
  002368  2f2e0008             move.l    $8(a6), -(a7)
  00236c  486effba             pea.l     -$46(a6)
  002370  7001                 moveq     #$1, d0
  002372  aa52                 _HighLevelFSDispatch 
  002374  301f                 move.w    (a7)+, d0
  002376  3600                 move.w    d0, d3
  002378  554f                 subq.w    #$2, a7
  00237a  486effba             pea.l     -$46(a6)
  00237e  1f3c0003             move.b    #$3, -(a7)
  002382  700d                 moveq     #$d, d0
  002384  aa52                 _HighLevelFSDispatch 
  002386  301f                 move.w    (a7)+, d0
  002388  3480                 move.w    d0, (a2)
  00238a  554f                 subq.w    #$2, a7
  00238c  a9af                 _ResError 
  00238e  301f                 move.w    (a7)+, d0
  002390  48c0                 ext.l     d0
  002392  6754                 beq.b     $23e8
  002394  4252                 clr.w     (a2)
  002396  554f                 subq.w    #$2, a7
  002398  486effba             pea.l     -$46(a6)
  00239c  2f06                 move.l    d6, -(a7)
  00239e  2f05                 move.l    d5, -(a7)
  0023a0  4267                 clr.w     -(a7)
  0023a2  7004                 moveq     #$4, d0
  0023a4  aa52                 _HighLevelFSDispatch 
  0023a6  301f                 move.w    (a7)+, d0
  0023a8  3600                 move.w    d0, d3
  0023aa  3003                 move.w    d3, d0
  0023ac  48c0                 ext.l     d0
  0023ae  6638                 bne.b     $23e8
  0023b0  486effba             pea.l     -$46(a6)
  0023b4  2f06                 move.l    d6, -(a7)
  0023b6  2f05                 move.l    d5, -(a7)
  0023b8  4267                 clr.w     -(a7)
  0023ba  700e                 moveq     #$e, d0
  0023bc  aa52                 _HighLevelFSDispatch 
  0023be  554f                 subq.w    #$2, a7
  0023c0  a9af                 _ResError 
  0023c2  301f                 move.w    (a7)+, d0
  0023c4  48c0                 ext.l     d0
  0023c6  6612                 bne.b     $23da
  0023c8  554f                 subq.w    #$2, a7
  0023ca  486effba             pea.l     -$46(a6)
  0023ce  1f3c0003             move.b    #$3, -(a7)
  0023d2  700d                 moveq     #$d, d0
  0023d4  aa52                 _HighLevelFSDispatch 
  0023d6  301f                 move.w    (a7)+, d0
  0023d8  3480                 move.w    d0, (a2)
  0023da  554f                 subq.w    #$2, a7
  0023dc  a9af                 _ResError 
  0023de  301f                 move.w    (a7)+, d0
  0023e0  48c0                 ext.l     d0
  0023e2  6604                 bne.b     $23e8
  0023e4  7001                 moveq     #$1, d0
  0023e6  6002                 bra.b     $23ea
  0023e8  1004                 move.b    d4, d0
  0023ea  4cdf0478             movem.l   (a7)+, d3-d6/a2
  0023ee  4e5e                 unlk      a6
  0023f0  4e75                 rts       

;-------------------------------------------------------------
; RectSeparate   (seg 6 +002400, 320 bytes)
  002400  4e56ffe4             link.w    a6, #$ffe4
  002404  48e71c30             movem.l   d3-d5/a2-a3, -(a7)
  002408  246e0008             movea.l   $8(a6), a2
  00240c  266e000c             movea.l   $c(a6), a3
  002410  2d6a0006fff0         move.l    $6(a2), -$10(a6)
  002416  2d6a000afff4         move.l    $a(a2), -$c(a6)
  00241c  486efff0             pea.l     -$10(a6)
  002420  3f2a0004             move.w    $4(a2), -(a7)
  002424  3f2a0002             move.w    $2(a2), -(a7)
  002428  a8a8                 _OffsetRect 
  00242a  2d6b0006ffe8         move.l    $6(a3), -$18(a6)
  002430  2d6b000affec         move.l    $a(a3), -$14(a6)
  002436  486effe8             pea.l     -$18(a6)
  00243a  3f2b0004             move.w    $4(a3), -(a7)
  00243e  3f2b0002             move.w    $2(a3), -(a7)
  002442  a8a8                 _OffsetRect 
  002444  302efff4             move.w    -$c(a6), d0
  002448  48c0                 ext.l     d0
  00244a  322effe8             move.w    -$18(a6), d1
  00244e  48c1                 ext.l     d1
  002450  9280                 sub.l     d0, d1
  002452  3d41fff8             move.w    d1, -$8(a6)
  002456  302efff0             move.w    -$10(a6), d0
  00245a  48c0                 ext.l     d0
  00245c  322effec             move.w    -$14(a6), d1
  002460  48c1                 ext.l     d1
  002462  9280                 sub.l     d0, d1
  002464  3d41fffa             move.w    d1, -$6(a6)
  002468  302efff2             move.w    -$e(a6), d0
  00246c  48c0                 ext.l     d0
  00246e  322effee             move.w    -$12(a6), d1
  002472  48c1                 ext.l     d1
  002474  9280                 sub.l     d0, d1
  002476  3d41fffc             move.w    d1, -$4(a6)
  00247a  302efff6             move.w    -$a(a6), d0
  00247e  48c0                 ext.l     d0
  002480  322effea             move.w    -$16(a6), d1
  002484  48c1                 ext.l     d1
  002486  9280                 sub.l     d0, d1
  002488  3d41fffe             move.w    d1, -$2(a6)
  00248c  7a00                 moveq     #$0, d5
  00248e  4a6efff8             tst.w     -$8(a6)
  002492  6f08                 ble.b     $249c
  002494  302efff8             move.w    -$8(a6), d0
  002498  48c0                 ext.l     d0
  00249a  6008                 bra.b     $24a4
  00249c  302efff8             move.w    -$8(a6), d0
  0024a0  48c0                 ext.l     d0
  0024a2  4480                 neg.l     d0
  0024a4  3800                 move.w    d0, d4
  0024a6  7601                 moveq     #$1, d3
  0024a8  6058                 bra.b     $2502
  0024aa  3004                 move.w    d4, d0
  0024ac  48c0                 ext.l     d0
  0024ae  2d40ffe4             move.l    d0, -$1c(a6)
  0024b2  41eefff8             lea.l     -$8(a6), a0
  0024b6  4a703200             tst.w     (a0, d3.w * 2)
  0024ba  6f0c                 ble.b     $24c8
  0024bc  41eefff8             lea.l     -$8(a6), a0
  0024c0  30303200             move.w    (a0, d3.w * 2), d0
  0024c4  48c0                 ext.l     d0
  0024c6  600c                 bra.b     $24d4
  0024c8  41eefff8             lea.l     -$8(a6), a0
  0024cc  30303200             move.w    (a0, d3.w * 2), d0
  0024d0  48c0                 ext.l     d0
  0024d2  4480                 neg.l     d0
  0024d4  b0aeffe4             cmp.l     -$1c(a6), d0
  0024d8  6c26                 bge.b     $2500
  0024da  3a03                 move.w    d3, d5
  0024dc  41eefff8             lea.l     -$8(a6), a0
  0024e0  4a703200             tst.w     (a0, d3.w * 2)
  0024e4  6f0c                 ble.b     $24f2
  0024e6  41eefff8             lea.l     -$8(a6), a0
  0024ea  30303200             move.w    (a0, d3.w * 2), d0
  0024ee  48c0                 ext.l     d0
  0024f0  600c                 bra.b     $24fe
  0024f2  41eefff8             lea.l     -$8(a6), a0
  0024f6  30303200             move.w    (a0, d3.w * 2), d0
  0024fa  48c0                 ext.l     d0
  0024fc  4480                 neg.l     d0
  0024fe  3800                 move.w    d0, d4
  002500  5243                 addq.w    #$1, d3
  002502  0c430004             cmpi.w    #$4, d3
  002506  6da2                 blt.b     $24aa
  002508  3005                 move.w    d5, d0
  00250a  48c0                 ext.l     d0
  00250c  670e                 beq.b     $251c
  00250e  5380                 subq.l    #$1, d0
  002510  670a                 beq.b     $251c
  002512  5380                 subq.l    #$1, d0
  002514  6714                 beq.b     $252a
  002516  5380                 subq.l    #$1, d0
  002518  6710                 beq.b     $252a
  00251a  601a                 bra.b     $2536
  00251c  41eefff8             lea.l     -$8(a6), a0
  002520  30305200             move.w    (a0, d5.w * 2), d0
  002524  d16a0002             add.w     d0, $2(a2)
  002528  600c                 bra.b     $2536
  00252a  41eefff8             lea.l     -$8(a6), a0
  00252e  30305200             move.w    (a0, d5.w * 2), d0
  002532  d16a0004             add.w     d0, $4(a2)
  002536  3005                 move.w    d5, d0
  002538  4cdf0c38             movem.l   (a7)+, d3-d5/a2-a3
  00253c  4e5e                 unlk      a6
  00253e  4e75                 rts       

;-------------------------------------------------------------
; Sgn0   (seg 6 +002550, 42 bytes)
  002550  4e560000             link.w    a6, #$0
  002554  4a6e000c             tst.w     $c(a6)
  002558  6f08                 ble.b     $2562
  00255a  3d7c0001000e         move.w    #$1, $e(a6)
  002560  6012                 bra.b     $2574
  002562  4a6e000c             tst.w     $c(a6)
  002566  6c08                 bge.b     $2570
  002568  3d7cffff000e         move.w    #$ffff, $e(a6)
  00256e  6004                 bra.b     $2574
  002570  426e000e             clr.w     $e(a6)
  002574  4e5e                 unlk      a6
  002576  4e740006             rtd       #$6

;-------------------------------------------------------------
; REGIONSEPARATE   (seg 6 +002582, 410 bytes)
  002582  4e56fff8             link.w    a6, #$fff8
  002586  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  00258a  246e0018             movea.l   $18(a6), a2
  00258e  266e0010             movea.l   $10(a6), a3
  002592  282e0008             move.l    $8(a6), d4
  002596  594f                 subq.w    #$4, a7
  002598  a8d8                 _NewRgn   
  00259a  205f                 movea.l   (a7)+, a0
  00259c  2848                 movea.l   a0, a4
  00259e  7600                 moveq     #$0, d3
  0025a0  302a0004             move.w    $4(a2), d0
  0025a4  906e0016             sub.w     $16(a6), d0
  0025a8  3d40fffa             move.w    d0, -$6(a6)
  0025ac  302a0002             move.w    $2(a2), d0
  0025b0  906e0014             sub.w     $14(a6), d0
  0025b4  3d40fff8             move.w    d0, -$8(a6)
  0025b8  2053                 movea.l   (a3), a0
  0025ba  2253                 movea.l   (a3), a1
  0025bc  30290008             move.w    $8(a1), d0
  0025c0  d0680004             add.w     $4(a0), d0
  0025c4  48c0                 ext.l     d0
  0025c6  2200                 move.l    d0, d1
  0025c8  e089                 lsr.l     #$8, d1
  0025ca  e089                 lsr.l     #$8, d1
  0025cc  e089                 lsr.l     #$8, d1
  0025ce  ee89                 lsr.l     #$7, d1
  0025d0  d280                 add.l     d0, d1
  0025d2  e281                 asr.l     #$1, d1
  0025d4  2044                 movea.l   d4, a0
  0025d6  2050                 movea.l   (a0), a0
  0025d8  2244                 movea.l   d4, a1
  0025da  2251                 movea.l   (a1), a1
  0025dc  30290008             move.w    $8(a1), d0
  0025e0  d0680004             add.w     $4(a0), d0
  0025e4  48c0                 ext.l     d0
  0025e6  2400                 move.l    d0, d2
  0025e8  e08a                 lsr.l     #$8, d2
  0025ea  e08a                 lsr.l     #$8, d2
  0025ec  e08a                 lsr.l     #$8, d2
  0025ee  ee8a                 lsr.l     #$7, d2
  0025f0  d480                 add.l     d0, d2
  0025f2  e282                 asr.l     #$1, d2
  0025f4  4482                 neg.l     d2
  0025f6  d481                 add.l     d1, d2
  0025f8  3d42fffa             move.w    d2, -$6(a6)
  0025fc  2053                 movea.l   (a3), a0
  0025fe  2253                 movea.l   (a3), a1
  002600  30290006             move.w    $6(a1), d0
  002604  d0680002             add.w     $2(a0), d0
  002608  48c0                 ext.l     d0
  00260a  2200                 move.l    d0, d1
  00260c  e089                 lsr.l     #$8, d1
  00260e  e089                 lsr.l     #$8, d1
  002610  e089                 lsr.l     #$8, d1
  002612  ee89                 lsr.l     #$7, d1
  002614  d280                 add.l     d0, d1
  002616  e281                 asr.l     #$1, d1
  002618  2044                 movea.l   d4, a0
  00261a  2050                 movea.l   (a0), a0
  00261c  2244                 movea.l   d4, a1
  00261e  2251                 movea.l   (a1), a1
  002620  30290006             move.w    $6(a1), d0
  002624  d0680002             add.w     $2(a0), d0
  002628  48c0                 ext.l     d0
  00262a  2400                 move.l    d0, d2
  00262c  e08a                 lsr.l     #$8, d2
  00262e  e08a                 lsr.l     #$8, d2
  002630  e08a                 lsr.l     #$8, d2
  002632  ee8a                 lsr.l     #$7, d2
  002634  d480                 add.l     d0, d2
  002636  e282                 asr.l     #$1, d2
  002638  4482                 neg.l     d2
  00263a  d481                 add.l     d1, d2
  00263c  3d42fff8             move.w    d2, -$8(a6)
  002640  3a2efffa             move.w    -$6(a6), d5
  002644  382efff8             move.w    -$8(a6), d4
  002648  4a45                 tst.w     d5
  00264a  6c02                 bge.b     $264e
  00264c  4445                 neg.w     d5
  00264e  4a44                 tst.w     d4
  002650  6c02                 bge.b     $2654
  002652  4444                 neg.w     d4
  002654  554f                 subq.w    #$2, a7
  002656  3f2efffa             move.w    -$6(a6), -(a7)
  00265a  2f0e                 move.l    a6, -(a7)
  00265c  61fffffffef2         bsr.l     $2550   ; Sgn0
  002662  301f                 move.w    (a7)+, d0
  002664  3e00                 move.w    d0, d7
  002666  554f                 subq.w    #$2, a7
  002668  3f2efff8             move.w    -$8(a6), -(a7)
  00266c  2f0e                 move.l    a6, -(a7)
  00266e  61fffffffee0         bsr.l     $2550   ; Sgn0
  002674  301f                 move.w    (a7)+, d0
  002676  3c00                 move.w    d0, d6
  002678  4a47                 tst.w     d7
  00267a  6606                 bne.b     $2682
  00267c  4a46                 tst.w     d6
  00267e  6602                 bne.b     $2682
  002680  7c01                 moveq     #$1, d6
  002682  ba44                 cmp.w     d4, d5
  002684  6f2e                 ble.b     $26b4
  002686  302a0004             move.w    $4(a2), d0
  00268a  d047                 add.w     d7, d0
  00268c  35400004             move.w    d0, $4(a2)
  002690  2f0b                 move.l    a3, -(a7)
  002692  3f07                 move.w    d7, -(a7)
  002694  4267                 clr.w     -(a7)
  002696  a8e0                 _OffsetRgn 
  002698  d644                 add.w     d4, d3
  00269a  b645                 cmp.w     d5, d3
  00269c  6f42                 ble.b     $26e0
  00269e  302a0002             move.w    $2(a2), d0
  0026a2  d046                 add.w     d6, d0
  0026a4  35400002             move.w    d0, $2(a2)
  0026a8  2f0b                 move.l    a3, -(a7)
  0026aa  4267                 clr.w     -(a7)
  0026ac  3f06                 move.w    d6, -(a7)
  0026ae  a8e0                 _OffsetRgn 
  0026b0  9645                 sub.w     d5, d3
  0026b2  602c                 bra.b     $26e0
  0026b4  302a0002             move.w    $2(a2), d0
  0026b8  d046                 add.w     d6, d0
  0026ba  35400002             move.w    d0, $2(a2)
  0026be  2f0b                 move.l    a3, -(a7)
  0026c0  4267                 clr.w     -(a7)
  0026c2  3f06                 move.w    d6, -(a7)
  0026c4  a8e0                 _OffsetRgn 
  0026c6  d645                 add.w     d5, d3
  0026c8  b644                 cmp.w     d4, d3
  0026ca  6f14                 ble.b     $26e0
  0026cc  302a0004             move.w    $4(a2), d0
  0026d0  d047                 add.w     d7, d0
  0026d2  35400004             move.w    d0, $4(a2)
  0026d6  2f0b                 move.l    a3, -(a7)
  0026d8  3f07                 move.w    d7, -(a7)
  0026da  4267                 clr.w     -(a7)
  0026dc  a8e0                 _OffsetRgn 
  0026de  9644                 sub.w     d4, d3
  0026e0  302a0004             move.w    $4(a2), d0
  0026e4  906e0016             sub.w     $16(a6), d0
  0026e8  3d40fffe             move.w    d0, -$2(a6)
  0026ec  302a0002             move.w    $2(a2), d0
  0026f0  906e0014             sub.w     $14(a6), d0
  0026f4  3d40fffc             move.w    d0, -$4(a6)
  0026f8  2f0b                 move.l    a3, -(a7)
  0026fa  2f2e000c             move.l    $c(a6), -(a7)
  0026fe  2f0c                 move.l    a4, -(a7)
  002700  a8e4                 _SectRgn  
  002702  554f                 subq.w    #$2, a7
  002704  2f0c                 move.l    a4, -(a7)
  002706  a8e2                 _EmptyRgn 
  002708  101f                 move.b    (a7)+, d0
  00270a  6700ff76             beq.w     $2682
  00270e  2f0c                 move.l    a4, -(a7)
  002710  a8d9                 _DisposeRgn 
  002712  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  002716  4e5e                 unlk      a6
  002718  4e740014             rtd       #$14

;-------------------------------------------------------------
; REGIONBOUNCE   (seg 6 +00272e, 318 bytes)
  00272e  4e56fff8             link.w    a6, #$fff8
  002732  48e71c38             movem.l   d3-d5/a2-a4, -(a7)
  002736  262e0016             move.l    $16(a6), d3
  00273a  2a2e000c             move.l    $c(a6), d5
  00273e  282e0008             move.l    $8(a6), d4
  002742  306e0010             movea.w   $10(a6), a0
  002746  2d48fff8             move.l    a0, -$8(a6)
  00274a  422e001a             clr.b     $1a(a6)
  00274e  4a84                 tst.l     d4
  002750  57c0                 seq.b     d0
  002752  4400                 neg.b     d0
  002754  4a85                 tst.l     d5
  002756  57c1                 seq.b     d1
  002758  4401                 neg.b     d1
  00275a  8200                 or.b      d0, d1
  00275c  6710                 beq.b     $276e
  00275e  487900000dfa         pea.l     $dfa.l   ; g_dfa
  002764  4eb900000030         jsr       $30.l   ; SATREPORTSTR
  00276a  600000f6             bra.w     $2862
  00276e  594f                 subq.w    #$4, a7
  002770  a8d8                 _NewRgn   
  002772  205f                 movea.l   (a7)+, a0
  002774  2448                 movea.l   a0, a2
  002776  594f                 subq.w    #$4, a7
  002778  a8d8                 _NewRgn   
  00277a  205f                 movea.l   (a7)+, a0
  00277c  2848                 movea.l   a0, a4
  00277e  594f                 subq.w    #$4, a7
  002780  a8d8                 _NewRgn   
  002782  205f                 movea.l   (a7)+, a0
  002784  2648                 movea.l   a0, a3
  002786  2f05                 move.l    d5, -(a7)
  002788  2f0a                 move.l    a2, -(a7)
  00278a  a8dc                 _CopyRgn  
  00278c  2f04                 move.l    d4, -(a7)
  00278e  2f0c                 move.l    a4, -(a7)
  002790  a8dc                 _CopyRgn  
  002792  2f0a                 move.l    a2, -(a7)
  002794  2043                 movea.l   d3, a0
  002796  3f280004             move.w    $4(a0), -(a7)
  00279a  2043                 movea.l   d3, a0
  00279c  3f280002             move.w    $2(a0), -(a7)
  0027a0  a8e0                 _OffsetRgn 
  0027a2  2f0c                 move.l    a4, -(a7)
  0027a4  3f2e0014             move.w    $14(a6), -(a7)
  0027a8  3f2e0012             move.w    $12(a6), -(a7)
  0027ac  a8e0                 _OffsetRgn 
  0027ae  2f0a                 move.l    a2, -(a7)
  0027b0  2f0c                 move.l    a4, -(a7)
  0027b2  2f0b                 move.l    a3, -(a7)
  0027b4  a8e4                 _SectRgn  
  0027b6  554f                 subq.w    #$2, a7
  0027b8  2f0b                 move.l    a3, -(a7)
  0027ba  a8e2                 _EmptyRgn 
  0027bc  101f                 move.b    (a7)+, d0
  0027be  66000096             bne.w     $2856
  0027c2  2052                 movea.l   (a2), a0
  0027c4  2252                 movea.l   (a2), a1
  0027c6  30290008             move.w    $8(a1), d0
  0027ca  d0680004             add.w     $4(a0), d0
  0027ce  48c0                 ext.l     d0
  0027d0  2200                 move.l    d0, d1
  0027d2  e089                 lsr.l     #$8, d1
  0027d4  e089                 lsr.l     #$8, d1
  0027d6  e089                 lsr.l     #$8, d1
  0027d8  ee89                 lsr.l     #$7, d1
  0027da  d280                 add.l     d0, d1
  0027dc  e281                 asr.l     #$1, d1
  0027de  2053                 movea.l   (a3), a0
  0027e0  2253                 movea.l   (a3), a1
  0027e2  30290008             move.w    $8(a1), d0
  0027e6  d0680004             add.w     $4(a0), d0
  0027ea  48c0                 ext.l     d0
  0027ec  2400                 move.l    d0, d2
  0027ee  e08a                 lsr.l     #$8, d2
  0027f0  e08a                 lsr.l     #$8, d2
  0027f2  e08a                 lsr.l     #$8, d2
  0027f4  ee8a                 lsr.l     #$7, d2
  0027f6  d480                 add.l     d0, d2
  0027f8  e282                 asr.l     #$1, d2
  0027fa  9481                 sub.l     d1, d2
  0027fc  3d42fffe             move.w    d2, -$2(a6)
  002800  2052                 movea.l   (a2), a0
  002802  2252                 movea.l   (a2), a1
  002804  30290006             move.w    $6(a1), d0
  002808  d0680002             add.w     $2(a0), d0
  00280c  48c0                 ext.l     d0
  00280e  2200                 move.l    d0, d1
  002810  e089                 lsr.l     #$8, d1
  002812  e089                 lsr.l     #$8, d1
  002814  e089                 lsr.l     #$8, d1
  002816  ee89                 lsr.l     #$7, d1
  002818  d280                 add.l     d0, d1
  00281a  e281                 asr.l     #$1, d1
  00281c  2053                 movea.l   (a3), a0
  00281e  2253                 movea.l   (a3), a1
  002820  30290006             move.w    $6(a1), d0
  002824  d0680002             add.w     $2(a0), d0
  002828  48c0                 ext.l     d0
  00282a  2400                 move.l    d0, d2
  00282c  e08a                 lsr.l     #$8, d2
  00282e  e08a                 lsr.l     #$8, d2
  002830  e08a                 lsr.l     #$8, d2
  002832  ee8a                 lsr.l     #$7, d2
  002834  d480                 add.l     d0, d2
  002836  e282                 asr.l     #$1, d2
  002838  9481                 sub.l     d1, d2
  00283a  3d42fffc             move.w    d2, -$4(a6)
  00283e  2f03                 move.l    d3, -(a7)
  002840  2f2e0012             move.l    $12(a6), -(a7)
  002844  2f0a                 move.l    a2, -(a7)
  002846  2f0c                 move.l    a4, -(a7)
  002848  2f0b                 move.l    a3, -(a7)
  00284a  61fffffffd36         bsr.l     $2582   ; REGIONSEPARATE
  002850  1d7c0001001a         move.b    #$1, $1a(a6)
  002856  2f0a                 move.l    a2, -(a7)
  002858  a8d9                 _DisposeRgn 
  00285a  2f0c                 move.l    a4, -(a7)
  00285c  a8d9                 _DisposeRgn 
  00285e  2f0b                 move.l    a3, -(a7)
  002860  a8d9                 _DisposeRgn 
  002862  4cdf1c38             movem.l   (a7)+, d3-d5/a2-a4
  002866  4e5e                 unlk      a6
  002868  4e740012             rtd       #$12

;-------------------------------------------------------------
; WRAPCOPY   (seg 6 +00287c, 878 bytes)
  00287c  4e56ffcc             link.w    a6, #$ffcc
  002880  48e71f00             movem.l   d3-d7, -(a7)
  002884  0c39000100006ab4     cmpi.b    #$1, $6ab4.l   ; g_6ab4
  00288c  6608                 bne.b     $2896
  00288e  423900006ab4         clr.b     $6ab4.l   ; g_6ab4
  002894  6008                 bra.b     $289e
  002896  13fc000100006ab4     move.b    #$1, $6ab4.l   ; g_6ab4
  00289e  422effcd             clr.b     -$33(a6)
  0028a2  306e0012             movea.w   $12(a6), a0
  0028a6  2008                 move.l    a0, d0
  0028a8  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  0028b0  3801                 move.w    d1, d4
  0028b2  3c04                 move.w    d4, d6
  0028b4  04460020             subi.w    #$20, d6
  0028b8  306e0014             movea.w   $14(a6), a0
  0028bc  2008                 move.l    a0, d0
  0028be  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  0028c6  3601                 move.w    d1, d3
  0028c8  3a03                 move.w    d3, d5
  0028ca  04450020             subi.w    #$20, d5
  0028ce  303c01e0             move.w    #$1e0, d0
  0028d2  9043                 sub.w     d3, d0
  0028d4  d06e0010             add.w     $10(a6), d0
  0028d8  3d40ffce             move.w    d0, -$32(a6)
  0028dc  3e3c01e0             move.w    #$1e0, d7
  0028e0  9e44                 sub.w     d4, d7
  0028e2  de6e000e             add.w     $e(a6), d7
  0028e6  426effd8             clr.w     -$28(a6)
  0028ea  3d46ffdc             move.w    d6, -$24(a6)
  0028ee  426effda             clr.w     -$26(a6)
  0028f2  3d45ffde             move.w    d5, -$22(a6)
  0028f6  426effe8             clr.w     -$18(a6)
  0028fa  3d46ffec             move.w    d6, -$14(a6)
  0028fe  3d43ffea             move.w    d3, -$16(a6)
  002902  3d7c01e0ffee         move.w    #$1e0, -$12(a6)
  002908  3d44ffe0             move.w    d4, -$20(a6)
  00290c  3d7c01e0ffe4         move.w    #$1e0, -$1c(a6)
  002912  426effe2             clr.w     -$1e(a6)
  002916  3d45ffe6             move.w    d5, -$1a(a6)
  00291a  3d44fff0             move.w    d4, -$10(a6)
  00291e  3d7c01e0fff4         move.w    #$1e0, -$c(a6)
  002924  3d43fff2             move.w    d3, -$e(a6)
  002928  3d7c01e0fff6         move.w    #$1e0, -$a(a6)
  00292e  4a46                 tst.w     d6
  002930  6e1c                 bgt.b     $294e
  002932  303c01e0             move.w    #$1e0, d0
  002936  d044                 add.w     d4, d0
  002938  04400020             subi.w    #$20, d0
  00293c  3d40fff4             move.w    d0, -$c(a6)
  002940  303c01e0             move.w    #$1e0, d0
  002944  d044                 add.w     d4, d0
  002946  04400020             subi.w    #$20, d0
  00294a  3d40ffe4             move.w    d0, -$1c(a6)
  00294e  4a45                 tst.w     d5
  002950  6e1c                 bgt.b     $296e
  002952  303c01e0             move.w    #$1e0, d0
  002956  d043                 add.w     d3, d0
  002958  04400020             subi.w    #$20, d0
  00295c  3d40fff6             move.w    d0, -$a(a6)
  002960  303c01e0             move.w    #$1e0, d0
  002964  d043                 add.w     d3, d0
  002966  04400020             subi.w    #$20, d0
  00296a  3d40ffee             move.w    d0, -$12(a6)
  00296e  0c2e0001000c         cmpi.b    #$1, $c(a6)
  002974  660000e0             bne.w     $2a56
  002978  4a45                 tst.w     d5
  00297a  5ec0                 sgt.b     d0
  00297c  4400                 neg.b     d0
  00297e  0c790008ffffe860     cmpi.w    #$8, $ffffe860.l   ; g_-17a0
  002986  57c1                 seq.b     d1
  002988  4401                 neg.b     d1
  00298a  c200                 and.b     d0, d1
  00298c  670000c0             beq.w     $2a4e
  002990  2d6efff0fff8         move.l    -$10(a6), -$8(a6)
  002996  2d6efff4fffc         move.l    -$c(a6), -$4(a6)
  00299c  486efff8             pea.l     -$8(a6)
  0029a0  3003                 move.w    d3, d0
  0029a2  4440                 neg.w     d0
  0029a4  d06e0010             add.w     $10(a6), d0
  0029a8  3f00                 move.w    d0, -(a7)
  0029aa  3004                 move.w    d4, d0
  0029ac  4440                 neg.w     d0
  0029ae  d06e000e             add.w     $e(a6), d0
  0029b2  3f00                 move.w    d0, -(a7)
  0029b4  a8a8                 _OffsetRect 
  0029b6  2d6effe0ffd0         move.l    -$20(a6), -$30(a6)
  0029bc  2d6effe4ffd4         move.l    -$1c(a6), -$2c(a6)
  0029c2  486effd0             pea.l     -$30(a6)
  0029c6  3f2effce             move.w    -$32(a6), -(a7)
  0029ca  3004                 move.w    d4, d0
  0029cc  4440                 neg.w     d0
  0029ce  d06e000e             add.w     $e(a6), d0
  0029d2  3f00                 move.w    d0, -(a7)
  0029d4  a8a8                 _OffsetRect 
  0029d6  486efff0             pea.l     -$10(a6)
  0029da  486effe0             pea.l     -$20(a6)
  0029de  486efff8             pea.l     -$8(a6)
  0029e2  486effd0             pea.l     -$30(a6)
  0029e6  1f2e000a             move.b    $a(a6), -(a7)
  0029ea  1f2e0008             move.b    $8(a6), -(a7)
  0029ee  4eb9000009c0         jsr       $9c0.l   ; DOUBLEBLITUNIVERSAL
  0029f4  4a46                 tst.w     d6
  0029f6  6f64                 ble.b     $2a5c
  0029f8  2d6effe8fff8         move.l    -$18(a6), -$8(a6)
  0029fe  2d6effecfffc         move.l    -$14(a6), -$4(a6)
  002a04  486efff8             pea.l     -$8(a6)
  002a08  3003                 move.w    d3, d0
  002a0a  4440                 neg.w     d0
  002a0c  d06e0010             add.w     $10(a6), d0
  002a10  3f00                 move.w    d0, -(a7)
  002a12  3f07                 move.w    d7, -(a7)
  002a14  a8a8                 _OffsetRect 
  002a16  2d6effd8ffd0         move.l    -$28(a6), -$30(a6)
  002a1c  2d6effdcffd4         move.l    -$24(a6), -$2c(a6)
  002a22  486effd0             pea.l     -$30(a6)
  002a26  3f2effce             move.w    -$32(a6), -(a7)
  002a2a  3f07                 move.w    d7, -(a7)
  002a2c  a8a8                 _OffsetRect 
  002a2e  486effe8             pea.l     -$18(a6)
  002a32  486effd8             pea.l     -$28(a6)
  002a36  486efff8             pea.l     -$8(a6)
  002a3a  486effd0             pea.l     -$30(a6)
  002a3e  1f2e000a             move.b    $a(a6), -(a7)
  002a42  1f2e0008             move.b    $8(a6), -(a7)
  002a46  4eb9000009c0         jsr       $9c0.l   ; DOUBLEBLITUNIVERSAL
  002a4c  600e                 bra.b     $2a5c
  002a4e  1d7c0001ffcd         move.b    #$1, -$33(a6)
  002a54  6006                 bra.b     $2a5c
  002a56  1d7c0001ffcd         move.b    #$1, -$33(a6)
  002a5c  0c2e0001ffcd         cmpi.b    #$1, -$33(a6)
  002a62  6600017c             bne.w     $2be0
  002a66  4eb9000000e0         jsr       $e0.l   ; SATSETPORTSCREEN
  002a6c  2d6efff0fff8         move.l    -$10(a6), -$8(a6)
  002a72  2d6efff4fffc         move.l    -$c(a6), -$4(a6)
  002a78  486efff8             pea.l     -$8(a6)
  002a7c  3003                 move.w    d3, d0
  002a7e  4440                 neg.w     d0
  002a80  d06e0010             add.w     $10(a6), d0
  002a84  3f00                 move.w    d0, -(a7)
  002a86  3004                 move.w    d4, d0
  002a88  4440                 neg.w     d0
  002a8a  d06e000e             add.w     $e(a6), d0
  002a8e  3f00                 move.w    d0, -(a7)
  002a90  a8a8                 _OffsetRect 
  002a92  4a2e000c             tst.b     $c(a6)
  002a96  6626                 bne.b     $2abe
  002a98  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  002a9e  48680002             pea.l     $2(a0)
  002aa2  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  002aa8  48680002             pea.l     $2(a0)
  002aac  486efff0             pea.l     -$10(a6)
  002ab0  486efff8             pea.l     -$8(a6)
  002ab4  4267                 clr.w     -(a7)
  002ab6  48780000             pea.l     $0.w
  002aba  a8ec                 _CopyBits 
  002abc  601e                 bra.b     $2adc
  002abe  486efff0             pea.l     -$10(a6)
  002ac2  48780000             pea.l     $0.w
  002ac6  486efff8             pea.l     -$8(a6)
  002aca  48780000             pea.l     $0.w
  002ace  1f2e000a             move.b    $a(a6), -(a7)
  002ad2  1f2e0008             move.b    $8(a6), -(a7)
  002ad6  4eb9000009c0         jsr       $9c0.l   ; DOUBLEBLITUNIVERSAL
  002adc  4a45                 tst.w     d5
  002ade  6f4a                 ble.b     $2b2a
  002ae0  2d6effe0fff8         move.l    -$20(a6), -$8(a6)
  002ae6  2d6effe4fffc         move.l    -$1c(a6), -$4(a6)
  002aec  486efff8             pea.l     -$8(a6)
  002af0  3f2effce             move.w    -$32(a6), -(a7)
  002af4  3004                 move.w    d4, d0
  002af6  4440                 neg.w     d0
  002af8  d06e000e             add.w     $e(a6), d0
  002afc  3f00                 move.w    d0, -(a7)
  002afe  a8a8                 _OffsetRect 
  002b00  4a2e000c             tst.b     $c(a6)
  002b04  6624                 bne.b     $2b2a
  002b06  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  002b0c  48680002             pea.l     $2(a0)
  002b10  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  002b16  48680002             pea.l     $2(a0)
  002b1a  486effe0             pea.l     -$20(a6)
  002b1e  486efff8             pea.l     -$8(a6)
  002b22  4267                 clr.w     -(a7)
  002b24  48780000             pea.l     $0.w
  002b28  a8ec                 _CopyBits 
  002b2a  4a46                 tst.w     d6
  002b2c  6f68                 ble.b     $2b96
  002b2e  2d6effe8fff8         move.l    -$18(a6), -$8(a6)
  002b34  2d6effecfffc         move.l    -$14(a6), -$4(a6)
  002b3a  486efff8             pea.l     -$8(a6)
  002b3e  3003                 move.w    d3, d0
  002b40  4440                 neg.w     d0
  002b42  d06e0010             add.w     $10(a6), d0
  002b46  3f00                 move.w    d0, -(a7)
  002b48  3f07                 move.w    d7, -(a7)
  002b4a  a8a8                 _OffsetRect 
  002b4c  4a2e000c             tst.b     $c(a6)
  002b50  6626                 bne.b     $2b78
  002b52  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  002b58  48680002             pea.l     $2(a0)
  002b5c  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  002b62  48680002             pea.l     $2(a0)
  002b66  486effe8             pea.l     -$18(a6)
  002b6a  486efff8             pea.l     -$8(a6)
  002b6e  4267                 clr.w     -(a7)
  002b70  48780000             pea.l     $0.w
  002b74  a8ec                 _CopyBits 
  002b76  601e                 bra.b     $2b96
  002b78  486effe8             pea.l     -$18(a6)
  002b7c  48780000             pea.l     $0.w
  002b80  486efff8             pea.l     -$8(a6)
  002b84  48780000             pea.l     $0.w
  002b88  1f2e000a             move.b    $a(a6), -(a7)
  002b8c  1f2e0008             move.b    $8(a6), -(a7)
  002b90  4eb9000009c0         jsr       $9c0.l   ; DOUBLEBLITUNIVERSAL
  002b96  4a46                 tst.w     d6
  002b98  6f46                 ble.b     $2be0
  002b9a  4a45                 tst.w     d5
  002b9c  6f42                 ble.b     $2be0
  002b9e  2d6effd8fff8         move.l    -$28(a6), -$8(a6)
  002ba4  2d6effdcfffc         move.l    -$24(a6), -$4(a6)
  002baa  486efff8             pea.l     -$8(a6)
  002bae  3f2effce             move.w    -$32(a6), -(a7)
  002bb2  3f07                 move.w    d7, -(a7)
  002bb4  a8a8                 _OffsetRect 
  002bb6  4a2e000c             tst.b     $c(a6)
  002bba  6624                 bne.b     $2be0
  002bbc  2079ffffe80c         movea.l   $ffffe80c.l, a0   ; g_-17f4
  002bc2  48680002             pea.l     $2(a0)
  002bc6  2079ffffe7ee         movea.l   $ffffe7ee.l, a0   ; g_-1812
  002bcc  48680002             pea.l     $2(a0)
  002bd0  486effd8             pea.l     -$28(a6)
  002bd4  486efff8             pea.l     -$8(a6)
  002bd8  4267                 clr.w     -(a7)
  002bda  48780000             pea.l     $0.w
  002bde  a8ec                 _CopyBits 
  002be0  4cdf00f8             movem.l   (a7)+, d3-d7
  002be4  4e5e                 unlk      a6
  002be6  4e74000e             rtd       #$e

;-------------------------------------------------------------
; TILESCROLLSYNCH   (seg 6 +002bf6, 16 bytes)
  002bf6  4e560000             link.w    a6, #$0
  002bfa  1d7c00010008         move.b    #$1, $8(a6)
  002c00  4e5e                 unlk      a6
  002c02  205f                 movea.l   (a7)+, a0
  002c04  4ed0                 jmp       (a0)

;-------------------------------------------------------------
; WRAPDRAWENCTILEPROC   (seg 6 +002c18, 334 bytes)
  002c18  4e560000             link.w    a6, #$0
  002c1c  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  002c20  286e001c             movea.l   $1c(a6), a4
  002c24  266e0018             movea.l   $18(a6), a3
  002c28  246e0014             movea.l   $14(a6), a2
  002c2c  382e000a             move.w    $a(a6), d4
  002c30  362e0008             move.w    $8(a6), d3
  002c34  7020                 moveq     #$20, d0
  002c36  d06e000e             add.w     $e(a6), d0
  002c3a  b07900006aae         cmp.w     $6aae.l, d0   ; g_6aae
  002c40  6d00011a             blt.w     $2d5c
  002c44  7020                 moveq     #$20, d0
  002c46  d06e000c             add.w     $c(a6), d0
  002c4a  b07900006aac         cmp.w     $6aac.l, d0   ; g_6aac
  002c50  6d00010a             blt.w     $2d5c
  002c54  303c01e0             move.w    #$1e0, d0
  002c58  d07900006aae         add.w     $6aae.l, d0   ; g_6aae
  002c5e  04400020             subi.w    #$20, d0
  002c62  b06e000e             cmp.w     $e(a6), d0
  002c66  6d0000f4             blt.w     $2d5c
  002c6a  303c01e0             move.w    #$1e0, d0
  002c6e  d07900006aac         add.w     $6aac.l, d0   ; g_6aac
  002c74  04400020             subi.w    #$20, d0
  002c78  b06e000c             cmp.w     $c(a6), d0
  002c7c  6d0000de             blt.w     $2d5c
  002c80  306e000e             movea.w   $e(a6), a0
  002c84  2008                 move.l    a0, d0
  002c86  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002c8e  3d41000e             move.w    d1, $e(a6)
  002c92  306e000c             movea.w   $c(a6), a0
  002c96  2008                 move.l    a0, d0
  002c98  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002ca0  3d41000c             move.w    d1, $c(a6)
  002ca4  2f0c                 move.l    a4, -(a7)
  002ca6  2f0b                 move.l    a3, -(a7)
  002ca8  2f0a                 move.l    a2, -(a7)
  002caa  2f2e0010             move.l    $10(a6), -(a7)
  002cae  2f2e000c             move.l    $c(a6), -(a7)
  002cb2  3f04                 move.w    d4, -(a7)
  002cb4  3f03                 move.w    d3, -(a7)
  002cb6  4eb900000a08         jsr       $a08.l   ; BLITENCFACEPROC
  002cbc  302e000c             move.w    $c(a6), d0
  002cc0  044001e0             subi.w    #$1e0, d0
  002cc4  3d40000c             move.w    d0, $c(a6)
  002cc8  302e000c             move.w    $c(a6), d0
  002ccc  d043                 add.w     d3, d0
  002cce  4a40                 tst.w     d0
  002cd0  6f18                 ble.b     $2cea
  002cd2  2f0c                 move.l    a4, -(a7)
  002cd4  2f0b                 move.l    a3, -(a7)
  002cd6  2f0a                 move.l    a2, -(a7)
  002cd8  2f2e0010             move.l    $10(a6), -(a7)
  002cdc  2f2e000c             move.l    $c(a6), -(a7)
  002ce0  3f04                 move.w    d4, -(a7)
  002ce2  3f03                 move.w    d3, -(a7)
  002ce4  4eb900000a08         jsr       $a08.l   ; BLITENCFACEPROC
  002cea  303c01e0             move.w    #$1e0, d0
  002cee  d06e000c             add.w     $c(a6), d0
  002cf2  3d40000c             move.w    d0, $c(a6)
  002cf6  302e000e             move.w    $e(a6), d0
  002cfa  044001e0             subi.w    #$1e0, d0
  002cfe  3d40000e             move.w    d0, $e(a6)
  002d02  302e000e             move.w    $e(a6), d0
  002d06  d044                 add.w     d4, d0
  002d08  4a40                 tst.w     d0
  002d0a  6f18                 ble.b     $2d24
  002d0c  2f0c                 move.l    a4, -(a7)
  002d0e  2f0b                 move.l    a3, -(a7)
  002d10  2f0a                 move.l    a2, -(a7)
  002d12  2f2e0010             move.l    $10(a6), -(a7)
  002d16  2f2e000c             move.l    $c(a6), -(a7)
  002d1a  3f04                 move.w    d4, -(a7)
  002d1c  3f03                 move.w    d3, -(a7)
  002d1e  4eb900000a08         jsr       $a08.l   ; BLITENCFACEPROC
  002d24  302e000c             move.w    $c(a6), d0
  002d28  044001e0             subi.w    #$1e0, d0
  002d2c  3d40000c             move.w    d0, $c(a6)
  002d30  302e000e             move.w    $e(a6), d0
  002d34  d044                 add.w     d4, d0
  002d36  4a40                 tst.w     d0
  002d38  6f22                 ble.b     $2d5c
  002d3a  302e000c             move.w    $c(a6), d0
  002d3e  d043                 add.w     d3, d0
  002d40  4a40                 tst.w     d0
  002d42  6f18                 ble.b     $2d5c
  002d44  2f0c                 move.l    a4, -(a7)
  002d46  2f0b                 move.l    a3, -(a7)
  002d48  2f0a                 move.l    a2, -(a7)
  002d4a  2f2e0010             move.l    $10(a6), -(a7)
  002d4e  2f2e000c             move.l    $c(a6), -(a7)
  002d52  3f04                 move.w    d4, -(a7)
  002d54  3f03                 move.w    d3, -(a7)
  002d56  4eb900000a08         jsr       $a08.l   ; BLITENCFACEPROC
  002d5c  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  002d60  4e5e                 unlk      a6
  002d62  4e740018             rtd       #$18

;-------------------------------------------------------------
; SAFEWRAPRECTBLIT   (seg 6 +002d7c, 304 bytes)
  002d7c  4e56ffde             link.w    a6, #$ffde
  002d80  48e70038             movem.l   a2-a4, -(a7)
  002d84  286e0010             movea.l   $10(a6), a4
  002d88  266e000c             movea.l   $c(a6), a3
  002d8c  246e0008             movea.l   $8(a6), a2
  002d90  302a0006             move.w    $6(a2), d0
  002d94  b07900006ab2         cmp.w     $6ab2.l, d0   ; g_6ab2
  002d9a  6d000106             blt.w     $2ea2
  002d9e  302a0004             move.w    $4(a2), d0
  002da2  b07900006ab0         cmp.w     $6ab0.l, d0   ; g_6ab0
  002da8  6d0000f8             blt.w     $2ea2
  002dac  303c01e0             move.w    #$1e0, d0
  002db0  d07900006ab2         add.w     $6ab2.l, d0   ; g_6ab2
  002db6  b06a0002             cmp.w     $2(a2), d0
  002dba  6d0000e6             blt.w     $2ea2
  002dbe  303c01e0             move.w    #$1e0, d0
  002dc2  d07900006ab0         add.w     $6ab0.l, d0   ; g_6ab0
  002dc8  b052                 cmp.w     (a2), d0
  002dca  6d0000d6             blt.w     $2ea2
  002dce  486effde             pea.l     -$22(a6)
  002dd2  4eb9000000c0         jsr       $c0.l   ; SATGETPORT
  002dd8  2f0b                 move.l    a3, -(a7)
  002dda  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  002de0  3052                 movea.w   (a2), a0
  002de2  2008                 move.l    a0, d0
  002de4  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002dec  3d41fff8             move.w    d1, -$8(a6)
  002df0  306a0002             movea.w   $2(a2), a0
  002df4  2008                 move.l    a0, d0
  002df6  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002dfe  3d41fffa             move.w    d1, -$6(a6)
  002e02  302efff8             move.w    -$8(a6), d0
  002e06  d06a0004             add.w     $4(a2), d0
  002e0a  9052                 sub.w     (a2), d0
  002e0c  3d40fffc             move.w    d0, -$4(a6)
  002e10  302efffa             move.w    -$6(a6), d0
  002e14  d06a0006             add.w     $6(a2), d0
  002e18  906a0002             sub.w     $2(a2), d0
  002e1c  3d40fffe             move.w    d0, -$2(a6)
  002e20  2f0c                 move.l    a4, -(a7)
  002e22  2f0b                 move.l    a3, -(a7)
  002e24  486efff8             pea.l     -$8(a6)
  002e28  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002e2e  205f                 movea.l   (a7)+, a0
  002e30  4e90                 jsr       (a0)
  002e32  486efff8             pea.l     -$8(a6)
  002e36  2f3cfe200000         move.l    #$fe200000, -(a7)
  002e3c  a8a8                 _OffsetRect 
  002e3e  2f0c                 move.l    a4, -(a7)
  002e40  2f0b                 move.l    a3, -(a7)
  002e42  486efff8             pea.l     -$8(a6)
  002e46  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002e4c  205f                 movea.l   (a7)+, a0
  002e4e  4e90                 jsr       (a0)
  002e50  486efff8             pea.l     -$8(a6)
  002e54  2f3c01e00000         move.l    #$1e00000, -(a7)
  002e5a  a8a8                 _OffsetRect 
  002e5c  486efff8             pea.l     -$8(a6)
  002e60  2f3c0000fe20         move.l    #$fe20, -(a7)
  002e66  a8a8                 _OffsetRect 
  002e68  2f0c                 move.l    a4, -(a7)
  002e6a  2f0b                 move.l    a3, -(a7)
  002e6c  486efff8             pea.l     -$8(a6)
  002e70  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002e76  205f                 movea.l   (a7)+, a0
  002e78  4e90                 jsr       (a0)
  002e7a  486efff8             pea.l     -$8(a6)
  002e7e  2f3cfe200000         move.l    #$fe200000, -(a7)
  002e84  a8a8                 _OffsetRect 
  002e86  2f0c                 move.l    a4, -(a7)
  002e88  2f0b                 move.l    a3, -(a7)
  002e8a  486efff8             pea.l     -$8(a6)
  002e8e  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002e94  205f                 movea.l   (a7)+, a0
  002e96  4e90                 jsr       (a0)
  002e98  486effde             pea.l     -$22(a6)
  002e9c  4eb9000000c0         jsr       $c0.l   ; SATGETPORT
  002ea2  4cdf1c00             movem.l   (a7)+, a2-a4
  002ea6  4e5e                 unlk      a6
  002ea8  4e74000c             rtd       #$c

;-------------------------------------------------------------
; SAFEWRAPRECTBLIT2   (seg 6 +002ec0, 304 bytes)
  002ec0  4e56ffde             link.w    a6, #$ffde
  002ec4  48e70038             movem.l   a2-a4, -(a7)
  002ec8  286e0010             movea.l   $10(a6), a4
  002ecc  266e000c             movea.l   $c(a6), a3
  002ed0  246e0008             movea.l   $8(a6), a2
  002ed4  302a0006             move.w    $6(a2), d0
  002ed8  b07900006aae         cmp.w     $6aae.l, d0   ; g_6aae
  002ede  6d000106             blt.w     $2fe6
  002ee2  302a0004             move.w    $4(a2), d0
  002ee6  b07900006aac         cmp.w     $6aac.l, d0   ; g_6aac
  002eec  6d0000f8             blt.w     $2fe6
  002ef0  303c01e0             move.w    #$1e0, d0
  002ef4  d07900006aae         add.w     $6aae.l, d0   ; g_6aae
  002efa  b06a0002             cmp.w     $2(a2), d0
  002efe  6d0000e6             blt.w     $2fe6
  002f02  303c01e0             move.w    #$1e0, d0
  002f06  d07900006aac         add.w     $6aac.l, d0   ; g_6aac
  002f0c  b052                 cmp.w     (a2), d0
  002f0e  6d0000d6             blt.w     $2fe6
  002f12  486effde             pea.l     -$22(a6)
  002f16  4eb9000000c0         jsr       $c0.l   ; SATGETPORT
  002f1c  2f0b                 move.l    a3, -(a7)
  002f1e  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  002f24  3052                 movea.w   (a2), a0
  002f26  2008                 move.l    a0, d0
  002f28  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002f30  3d41fff8             move.w    d1, -$8(a6)
  002f34  306a0002             movea.w   $2(a2), a0
  002f38  2008                 move.l    a0, d0
  002f3a  4c7c0801000001e0     divsl.l   #$1e0, d1:d0
  002f42  3d41fffa             move.w    d1, -$6(a6)
  002f46  302efff8             move.w    -$8(a6), d0
  002f4a  d06a0004             add.w     $4(a2), d0
  002f4e  9052                 sub.w     (a2), d0
  002f50  3d40fffc             move.w    d0, -$4(a6)
  002f54  302efffa             move.w    -$6(a6), d0
  002f58  d06a0006             add.w     $6(a2), d0
  002f5c  906a0002             sub.w     $2(a2), d0
  002f60  3d40fffe             move.w    d0, -$2(a6)
  002f64  2f0c                 move.l    a4, -(a7)
  002f66  2f0b                 move.l    a3, -(a7)
  002f68  486efff8             pea.l     -$8(a6)
  002f6c  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002f72  205f                 movea.l   (a7)+, a0
  002f74  4e90                 jsr       (a0)
  002f76  486efff8             pea.l     -$8(a6)
  002f7a  2f3cfe200000         move.l    #$fe200000, -(a7)
  002f80  a8a8                 _OffsetRect 
  002f82  2f0c                 move.l    a4, -(a7)
  002f84  2f0b                 move.l    a3, -(a7)
  002f86  486efff8             pea.l     -$8(a6)
  002f8a  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002f90  205f                 movea.l   (a7)+, a0
  002f92  4e90                 jsr       (a0)
  002f94  486efff8             pea.l     -$8(a6)
  002f98  2f3c01e00000         move.l    #$1e00000, -(a7)
  002f9e  a8a8                 _OffsetRect 
  002fa0  486efff8             pea.l     -$8(a6)
  002fa4  2f3c0000fe20         move.l    #$fe20, -(a7)
  002faa  a8a8                 _OffsetRect 
  002fac  2f0c                 move.l    a4, -(a7)
  002fae  2f0b                 move.l    a3, -(a7)
  002fb0  486efff8             pea.l     -$8(a6)
  002fb4  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002fba  205f                 movea.l   (a7)+, a0
  002fbc  4e90                 jsr       (a0)
  002fbe  486efff8             pea.l     -$8(a6)
  002fc2  2f3cfe200000         move.l    #$fe200000, -(a7)
  002fc8  a8a8                 _OffsetRect 
  002fca  2f0c                 move.l    a4, -(a7)
  002fcc  2f0b                 move.l    a3, -(a7)
  002fce  486efff8             pea.l     -$8(a6)
  002fd2  2f3900006aa4         move.l    $6aa4.l, -(a7)   ; g_6aa4
  002fd8  205f                 movea.l   (a7)+, a0
  002fda  4e90                 jsr       (a0)
  002fdc  486effde             pea.l     -$22(a6)
  002fe0  4eb9000000c0         jsr       $c0.l   ; SATGETPORT
  002fe6  4cdf1c00             movem.l   (a7)+, a2-a4
  002fea  4e5e                 unlk      a6
  002fec  4e74000c             rtd       #$c

;-------------------------------------------------------------
; SCROLLTO   (seg 6 +003004, 550 bytes)
  003004  4e56fff0             link.w    a6, #$fff0
  003008  48e71800             movem.l   d3-d4, -(a7)
  00300c  382e000a             move.w    $a(a6), d4
  003010  362e0008             move.w    $8(a6), d3
  003014  4a44                 tst.w     d4
  003016  6c02                 bge.b     $301a
  003018  7800                 moveq     #$0, d4
  00301a  4a43                 tst.w     d3
  00301c  6c02                 bge.b     $3020
  00301e  7600                 moveq     #$0, d3
  003020  303c01e0             move.w    #$1e0, d0
  003024  d044                 add.w     d4, d0
  003026  48c0                 ext.l     d0
  003028  2200                 move.l    d0, d1
  00302a  e881                 asr.l     #$4, d1
  00302c  e089                 lsr.l     #$8, d1
  00302e  e089                 lsr.l     #$8, d1
  003030  e089                 lsr.l     #$8, d1
  003032  e689                 lsr.l     #$3, d1
  003034  d280                 add.l     d0, d1
  003036  ea81                 asr.l     #$5, d1
  003038  0c8100000080         cmpi.l    #$80, d1
  00303e  6f04                 ble.b     $3044
  003040  383c0e40             move.w    #$e40, d4
  003044  303c01e0             move.w    #$1e0, d0
  003048  d043                 add.w     d3, d0
  00304a  48c0                 ext.l     d0
  00304c  2200                 move.l    d0, d1
  00304e  e881                 asr.l     #$4, d1
  003050  e089                 lsr.l     #$8, d1
  003052  e089                 lsr.l     #$8, d1
  003054  e089                 lsr.l     #$8, d1
  003056  e689                 lsr.l     #$3, d1
  003058  d280                 add.l     d0, d1
  00305a  ea81                 asr.l     #$5, d1
  00305c  0c8100000080         cmpi.l    #$80, d1
  003062  6f04                 ble.b     $3068
  003064  363c0e40             move.w    #$e40, d3
  003068  486efff0             pea.l     -$10(a6)
  00306c  42a7                 clr.l     -(a7)
  00306e  4878ffff             pea.l     $ffff.w
  003072  a8a7                 _SetRect  
  003074  486efff8             pea.l     -$8(a6)
  003078  42a7                 clr.l     -(a7)
  00307a  4878ffff             pea.l     $ffff.w
  00307e  a8a7                 _SetRect  
  003080  b67900006aac         cmp.w     $6aac.l, d3   ; g_6aac
  003086  670000b0             beq.w     $3138
  00308a  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  003090  2008                 move.l    a0, d0
  003092  e880                 asr.l     #$4, d0
  003094  e088                 lsr.l     #$8, d0
  003096  e088                 lsr.l     #$8, d0
  003098  e088                 lsr.l     #$8, d0
  00309a  e688                 lsr.l     #$3, d0
  00309c  d088                 add.l     a0, d0
  00309e  ea80                 asr.l     #$5, d0
  0030a0  3d40fff2             move.w    d0, -$e(a6)
  0030a4  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  0030aa  2008                 move.l    a0, d0
  0030ac  e880                 asr.l     #$4, d0
  0030ae  e088                 lsr.l     #$8, d0
  0030b0  e088                 lsr.l     #$8, d0
  0030b2  e088                 lsr.l     #$8, d0
  0030b4  e688                 lsr.l     #$3, d0
  0030b6  d088                 add.l     a0, d0
  0030b8  ea80                 asr.l     #$5, d0
  0030ba  5080                 addq.l    #$8, d0
  0030bc  5e80                 addq.l    #$7, d0
  0030be  3d40fff6             move.w    d0, -$a(a6)
  0030c2  b67900006aac         cmp.w     $6aac.l, d3   ; g_6aac
  0030c8  6f3c                 ble.b     $3106
  0030ca  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  0030d0  2008                 move.l    a0, d0
  0030d2  e880                 asr.l     #$4, d0
  0030d4  e088                 lsr.l     #$8, d0
  0030d6  e088                 lsr.l     #$8, d0
  0030d8  e088                 lsr.l     #$8, d0
  0030da  e688                 lsr.l     #$3, d0
  0030dc  d088                 add.l     a0, d0
  0030de  ea80                 asr.l     #$5, d0
  0030e0  5080                 addq.l    #$8, d0
  0030e2  5e80                 addq.l    #$7, d0
  0030e4  3d40fff0             move.w    d0, -$10(a6)
  0030e8  3043                 movea.w   d3, a0
  0030ea  2008                 move.l    a0, d0
  0030ec  e880                 asr.l     #$4, d0
  0030ee  e088                 lsr.l     #$8, d0
  0030f0  e088                 lsr.l     #$8, d0
  0030f2  e088                 lsr.l     #$8, d0
  0030f4  e688                 lsr.l     #$3, d0
  0030f6  d088                 add.l     a0, d0
  0030f8  ea80                 asr.l     #$5, d0
  0030fa  5080                 addq.l    #$8, d0
  0030fc  5e80                 addq.l    #$7, d0
  0030fe  5380                 subq.l    #$1, d0
  003100  3d40fff4             move.w    d0, -$c(a6)
  003104  6032                 bra.b     $3138
  003106  3043                 movea.w   d3, a0
  003108  2008                 move.l    a0, d0
  00310a  e880                 asr.l     #$4, d0
  00310c  e088                 lsr.l     #$8, d0
  00310e  e088                 lsr.l     #$8, d0
  003110  e088                 lsr.l     #$8, d0
  003112  e688                 lsr.l     #$3, d0
  003114  d088                 add.l     a0, d0
  003116  ea80                 asr.l     #$5, d0
  003118  3d40fff0             move.w    d0, -$10(a6)
  00311c  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  003122  2008                 move.l    a0, d0
  003124  e880                 asr.l     #$4, d0
  003126  e088                 lsr.l     #$8, d0
  003128  e088                 lsr.l     #$8, d0
  00312a  e088                 lsr.l     #$8, d0
  00312c  e688                 lsr.l     #$3, d0
  00312e  d088                 add.l     a0, d0
  003130  ea80                 asr.l     #$5, d0
  003132  5380                 subq.l    #$1, d0
  003134  3d40fff4             move.w    d0, -$c(a6)
  003138  b87900006aae         cmp.w     $6aae.l, d4   ; g_6aae
  00313e  670000ac             beq.w     $31ec
  003142  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  003148  2008                 move.l    a0, d0
  00314a  e880                 asr.l     #$4, d0
  00314c  e088                 lsr.l     #$8, d0
  00314e  e088                 lsr.l     #$8, d0
  003150  e088                 lsr.l     #$8, d0
  003152  e688                 lsr.l     #$3, d0
  003154  d088                 add.l     a0, d0
  003156  ea80                 asr.l     #$5, d0
  003158  3d40fff8             move.w    d0, -$8(a6)
  00315c  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  003162  2008                 move.l    a0, d0
  003164  e880                 asr.l     #$4, d0
  003166  e088                 lsr.l     #$8, d0
  003168  e088                 lsr.l     #$8, d0
  00316a  e088                 lsr.l     #$8, d0
  00316c  e688                 lsr.l     #$3, d0
  00316e  d088                 add.l     a0, d0
  003170  ea80                 asr.l     #$5, d0
  003172  5080                 addq.l    #$8, d0
  003174  5e80                 addq.l    #$7, d0
  003176  3d40fffc             move.w    d0, -$4(a6)
  00317a  b87900006aae         cmp.w     $6aae.l, d4   ; g_6aae
  003180  6f3a                 ble.b     $31bc
  003182  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  003188  2008                 move.l    a0, d0
  00318a  e880                 asr.l     #$4, d0
  00318c  e088                 lsr.l     #$8, d0
  00318e  e088                 lsr.l     #$8, d0
  003190  e088                 lsr.l     #$8, d0
  003192  e688                 lsr.l     #$3, d0
  003194  d088                 add.l     a0, d0
  003196  ea80                 asr.l     #$5, d0
  003198  5080                 addq.l    #$8, d0
  00319a  5e80                 addq.l    #$7, d0
  00319c  3d40fffa             move.w    d0, -$6(a6)
  0031a0  3044                 movea.w   d4, a0
  0031a2  2008                 move.l    a0, d0
  0031a4  e880                 asr.l     #$4, d0
  0031a6  e088                 lsr.l     #$8, d0
  0031a8  e088                 lsr.l     #$8, d0
  0031aa  e088                 lsr.l     #$8, d0
  0031ac  e688                 lsr.l     #$3, d0
  0031ae  d088                 add.l     a0, d0
  0031b0  ea80                 asr.l     #$5, d0
  0031b2  5080                 addq.l    #$8, d0
  0031b4  5e80                 addq.l    #$7, d0
  0031b6  3d40fffe             move.w    d0, -$2(a6)
  0031ba  6030                 bra.b     $31ec
  0031bc  3044                 movea.w   d4, a0
  0031be  2008                 move.l    a0, d0
  0031c0  e880                 asr.l     #$4, d0
  0031c2  e088                 lsr.l     #$8, d0
  0031c4  e088                 lsr.l     #$8, d0
  0031c6  e088                 lsr.l     #$8, d0
  0031c8  e688                 lsr.l     #$3, d0
  0031ca  d088                 add.l     a0, d0
  0031cc  ea80                 asr.l     #$5, d0
  0031ce  3d40fffa             move.w    d0, -$6(a6)
  0031d2  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  0031d8  2008                 move.l    a0, d0
  0031da  e880                 asr.l     #$4, d0
  0031dc  e088                 lsr.l     #$8, d0
  0031de  e088                 lsr.l     #$8, d0
  0031e0  e088                 lsr.l     #$8, d0
  0031e2  e688                 lsr.l     #$3, d0
  0031e4  d088                 add.l     a0, d0
  0031e6  ea80                 asr.l     #$5, d0
  0031e8  3d40fffe             move.w    d0, -$2(a6)
  0031ec  33c400006aae         move.w    d4, $6aae.l   ; g_6aae
  0031f2  33c300006aac         move.w    d3, $6aac.l   ; g_6aac
  0031f8  302efff0             move.w    -$10(a6), d0
  0031fc  b06efff4             cmp.w     -$c(a6), d0
  003200  6e0a                 bgt.b     $320c
  003202  486efff0             pea.l     -$10(a6)
  003206  4eb90000bf60         jsr       $bf60.l   ; REDRAWGRID
  00320c  302efffa             move.w    -$6(a6), d0
  003210  b06efffe             cmp.w     -$2(a6), d0
  003214  6e0a                 bgt.b     $3220
  003216  486efff8             pea.l     -$8(a6)
  00321a  4eb90000bf60         jsr       $bf60.l   ; REDRAWGRID
  003220  4cdf0018             movem.l   (a7)+, d3-d4
  003224  4e5e                 unlk      a6
  003226  4e740004             rtd       #$4

;-------------------------------------------------------------
; INITTILESCROLL   (seg 6 +003236, 30 bytes)
  003236  4e560000             link.w    a6, #$0
  00323a  4879000002c0         pea.l     $2c0.l   ; TILESCROLLSYNCH
  003240  4eb9000000a0         jsr       $a0.l   ; SATINSTALLSYNCH
  003246  23f9ffffe8e600006aa4 move.l    $ffffe8e6.l, $6aa4.l   ; g_-171a, g_6aa4
  003250  4e5e                 unlk      a6
  003252  4e75                 rts       

;-------------------------------------------------------------
; KILLTILESCROLL   (seg 6 +003266, 28 bytes)
  003266  4e560000             link.w    a6, #$0
  00326a  48780000             pea.l     $0.w
  00326e  4eb9000000a0         jsr       $a0.l   ; SATINSTALLSYNCH
  003274  23f900006aa4ffffe8e6 move.l    $6aa4.l, $ffffe8e6.l   ; g_6aa4, g_-171a
  00327e  4e5e                 unlk      a6
  003280  4e75                 rts       

;-------------------------------------------------------------
; SETTILESCROLLDRAWPOINT   (seg 6 +003294, 26 bytes)
  003294  4e560000             link.w    a6, #$0
  003298  33ee000a00006aaa     move.w    $a(a6), $6aaa.l   ; g_6aaa
  0032a0  33ee000800006aa8     move.w    $8(a6), $6aa8.l   ; g_6aa8
  0032a8  4e5e                 unlk      a6
  0032aa  4e740004             rtd       #$4

;-------------------------------------------------------------
; REDRAWWHOLEGRID   (seg 6 +0032c8, 128 bytes)
  0032c8  4e56fff8             link.w    a6, #$fff8
  0032cc  486efff8             pea.l     -$8(a6)
  0032d0  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  0032d6  2008                 move.l    a0, d0
  0032d8  e880                 asr.l     #$4, d0
  0032da  e088                 lsr.l     #$8, d0
  0032dc  e088                 lsr.l     #$8, d0
  0032de  e088                 lsr.l     #$8, d0
  0032e0  e688                 lsr.l     #$3, d0
  0032e2  d088                 add.l     a0, d0
  0032e4  ea80                 asr.l     #$5, d0
  0032e6  3f00                 move.w    d0, -(a7)
  0032e8  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  0032ee  2008                 move.l    a0, d0
  0032f0  e880                 asr.l     #$4, d0
  0032f2  e088                 lsr.l     #$8, d0
  0032f4  e088                 lsr.l     #$8, d0
  0032f6  e088                 lsr.l     #$8, d0
  0032f8  e688                 lsr.l     #$3, d0
  0032fa  d088                 add.l     a0, d0
  0032fc  ea80                 asr.l     #$5, d0
  0032fe  3f00                 move.w    d0, -(a7)
  003300  307900006aae         movea.w   $6aae.l, a0   ; g_6aae
  003306  2008                 move.l    a0, d0
  003308  e880                 asr.l     #$4, d0
  00330a  e088                 lsr.l     #$8, d0
  00330c  e088                 lsr.l     #$8, d0
  00330e  e088                 lsr.l     #$8, d0
  003310  e688                 lsr.l     #$3, d0
  003312  d088                 add.l     a0, d0
  003314  ea80                 asr.l     #$5, d0
  003316  5080                 addq.l    #$8, d0
  003318  5e80                 addq.l    #$7, d0
  00331a  3f00                 move.w    d0, -(a7)
  00331c  307900006aac         movea.w   $6aac.l, a0   ; g_6aac
  003322  2008                 move.l    a0, d0
  003324  e880                 asr.l     #$4, d0
  003326  e088                 lsr.l     #$8, d0
  003328  e088                 lsr.l     #$8, d0
  00332a  e088                 lsr.l     #$8, d0
  00332c  e688                 lsr.l     #$3, d0
  00332e  d088                 add.l     a0, d0
  003330  ea80                 asr.l     #$5, d0
  003332  5080                 addq.l    #$8, d0
  003334  5e80                 addq.l    #$7, d0
  003336  3f00                 move.w    d0, -(a7)
  003338  a8a7                 _SetRect  
  00333a  486efff8             pea.l     -$8(a6)
  00333e  4eb90000bf60         jsr       $bf60.l   ; REDRAWGRID
  003344  4e5e                 unlk      a6
  003346  4e75                 rts       

;-------------------------------------------------------------
; Randomize   (seg 6 +00335a, 18 bytes)
  00335a  4e560000             link.w    a6, #$0
  00335e  41f9ffffe73a         lea.l     $ffffe73a.l, a0   ; g_-18c6
  003364  20b8020c             move.l    $20c.w, (a0)
  003368  4e5e                 unlk      a6
  00336a  4e75                 rts       

;-------------------------------------------------------------
; DRAWGREYOUTLINE   (seg 6 +003378, 162 bytes)
  003378  4e56ffe2             link.w    a6, #$ffe2
  00337c  2f0a                 move.l    a2, -(a7)
  00337e  246e000a             movea.l   $a(a6), a2
  003382  486effe8             pea.l     -$18(a6)
  003386  a874                 _GetPort  
  003388  2f0a                 move.l    a2, -(a7)
  00338a  a873                 _SetPort  
  00338c  2f0a                 move.l    a2, -(a7)
  00338e  3f2e0008             move.w    $8(a6), -(a7)
  003392  486effec             pea.l     -$14(a6)
  003396  486effee             pea.l     -$12(a6)
  00339a  486efff2             pea.l     -$e(a6)
  00339e  a98d                 _GetDialogItem 
  0033a0  486effe2             pea.l     -$1e(a6)
  0033a4  aa19                 _GetForeColor 
  0033a6  3d7cfffffffa         move.w    #$ffff, -$6(a6)
  0033ac  3d7cfffffffc         move.w    #$ffff, -$4(a6)
  0033b2  3d7cfffffffe         move.w    #$ffff, -$2(a6)
  0033b8  486efffa             pea.l     -$6(a6)
  0033bc  aa14                 _RGBForeColor 
  0033be  486efff2             pea.l     -$e(a6)
  0033c2  a8a1                 _FrameRect 
  0033c4  3d7c5000fffa         move.w    #$5000, -$6(a6)
  0033ca  3d7c5000fffc         move.w    #$5000, -$4(a6)
  0033d0  3d7c5000fffe         move.w    #$5000, -$2(a6)
  0033d6  486efffa             pea.l     -$6(a6)
  0033da  aa14                 _RGBForeColor 
  0033dc  486efff2             pea.l     -$e(a6)
  0033e0  4878ffff             pea.l     $ffff.w
  0033e4  a8a8                 _OffsetRect 
  0033e6  486efff2             pea.l     -$e(a6)
  0033ea  a8a1                 _FrameRect 
  0033ec  486effe2             pea.l     -$1e(a6)
  0033f0  aa14                 _RGBForeColor 
  0033f2  2f2effe8             move.l    -$18(a6), -(a7)
  0033f6  a873                 _SetPort  
  0033f8  2f0a                 move.l    a2, -(a7)
  0033fa  3f3c0003             move.w    #$3, -(a7)
  0033fe  486effec             pea.l     -$14(a6)
  003402  486effee             pea.l     -$12(a6)
  003406  486efff2             pea.l     -$e(a6)
  00340a  a98d                 _GetDialogItem 
  00340c  2f2effee             move.l    -$12(a6), -(a7)
  003410  a96d                 _trap_a96d 
  003412  245f                 movea.l   (a7)+, a2
  003414  4e5e                 unlk      a6
  003416  4e740006             rtd       #$6

;-------------------------------------------------------------
; AlreadyUsingKey   (seg 6 +00342c, 54 bytes)
  00342c  4e560000             link.w    a6, #$0
  003430  2f06                 move.l    d6, -(a7)
  003432  3c2e0008             move.w    $8(a6), d6
  003436  342e000a             move.w    $a(a6), d2
  00343a  7200                 moveq     #$0, d1
  00343c  7000                 moveq     #$0, d0
  00343e  6014                 bra.b     $3454
  003440  41f900005842         lea.l     $5842.l, a0   ; g_5842
  003446  bc700210             cmp.w     $10(a0, d0.w * 2), d6
  00344a  6606                 bne.b     $3452
  00344c  b042                 cmp.w     d2, d0
  00344e  6702                 beq.b     $3452
  003450  7201                 moveq     #$1, d1
  003452  5240                 addq.w    #$1, d0
  003454  0c400008             cmpi.w    #$8, d0
  003458  6de6                 blt.b     $3440
  00345a  1001                 move.b    d1, d0
  00345c  2c1f                 move.l    (a7)+, d6
  00345e  4e5e                 unlk      a6
  003460  4e75                 rts       

;-------------------------------------------------------------
; PREFDIALOGFILTER   (seg 6 +003474, 1152 bytes)
  003474  4e56ffe0             link.w    a6, #$ffe0
  003478  48e71838             movem.l   d3-d4/a2-a4, -(a7)
  00347c  246e0010             movea.l   $10(a6), a2
  003480  286e000c             movea.l   $c(a6), a4
  003484  266e0008             movea.l   $8(a6), a3
  003488  7000                 moveq     #$0, d0
  00348a  3014                 move.w    (a4), d0
  00348c  5380                 subq.l    #$1, d0
  00348e  6700014a             beq.w     $35da
  003492  5580                 subq.l    #$2, d0
  003494  6712                 beq.b     $34a8
  003496  5580                 subq.l    #$2, d0
  003498  6704                 beq.b     $349e
  00349a  6000021e             bra.w     $36ba
  00349e  1f7c00010048         move.b    #$1, $48(a7)
  0034a4  60000444             bra.w     $38ea
  0034a8  0c79000200000df8     cmpi.w    #$2, $df8.l   ; g_df8
  0034b0  67000088             beq.w     $353a
  0034b4  262c0002             move.l    $2(a4), d3
  0034b8  0283000000ff         andi.l    #$ff, d3
  0034be  302c000e             move.w    $e(a4), d0
  0034c2  028000000100         andi.l    #$100, d0
  0034c8  6706                 beq.b     $34d0
  0034ca  0c03002e             cmpi.b    #$2e, d3
  0034ce  6706                 beq.b     $34d6
  0034d0  0c03001b             cmpi.b    #$1b, d3
  0034d4  662c                 bne.b     $3502
  0034d6  36bc0002             move.w    #$2, (a3)
  0034da  2f0a                 move.l    a2, -(a7)
  0034dc  3f3c0002             move.w    #$2, -(a7)
  0034e0  486effe8             pea.l     -$18(a6)
  0034e4  486effea             pea.l     -$16(a6)
  0034e8  486effe0             pea.l     -$20(a6)
  0034ec  a98d                 _GetDialogItem 
  0034ee  2f2effea             move.l    -$16(a6), -(a7)
  0034f2  3f3c0001             move.w    #$1, -(a7)
  0034f6  a95d                 _HiliteControl 
  0034f8  1f7c00010048         move.b    #$1, $48(a7)
  0034fe  600003ea             bra.w     $38ea
  003502  0c03000d             cmpi.b    #$d, d3
  003506  6706                 beq.b     $350e
  003508  0c030003             cmpi.b    #$3, d3
  00350c  662c                 bne.b     $353a
  00350e  36bc0001             move.w    #$1, (a3)
  003512  2f0a                 move.l    a2, -(a7)
  003514  3f3c0001             move.w    #$1, -(a7)
  003518  486effe8             pea.l     -$18(a6)
  00351c  486effea             pea.l     -$16(a6)
  003520  486effe0             pea.l     -$20(a6)
  003524  a98d                 _GetDialogItem 
  003526  2f2effea             move.l    -$16(a6), -(a7)
  00352a  3f3c0001             move.w    #$1, -(a7)
  00352e  a95d                 _HiliteControl 
  003530  1f7c00010048         move.b    #$1, $48(a7)
  003536  600003b2             bra.w     $38ea
  00353a  4a6a00a4             tst.w     $a4(a2)
  00353e  6c04                 bge.b     $3544
  003540  70ff                 moveq     #$ff, d0
  003542  6008                 bra.b     $354c
  003544  302a00a4             move.w    $a4(a2), d0
  003548  48c0                 ext.l     d0
  00354a  5280                 addq.l    #$1, d0
  00354c  2600                 move.l    d0, d3
  00354e  4a83                 tst.l     d3
  003550  6f000080             ble.w     $35d2
  003554  2003                 move.l    d3, d0
  003556  5f80                 subq.l    #$7, d0
  003558  3f00                 move.w    d0, -(a7)
  00355a  202c0002             move.l    $2(a4), d0
  00355e  02800000ff00         andi.l    #$ff00, d0
  003564  e088                 lsr.l     #$8, d0
  003566  3f00                 move.w    d0, -(a7)
  003568  61fffffffec2         bsr.l     $342c   ; AlreadyUsingKey
  00356e  4a00                 tst.b     d0
  003570  584f                 addq.w    #$4, a7
  003572  664e                 bne.b     $35c2
  003574  202c0002             move.l    $2(a4), d0
  003578  02800000ff00         andi.l    #$ff00, d0
  00357e  e088                 lsr.l     #$8, d0
  003580  2203                 move.l    d3, d1
  003582  5f81                 subq.l    #$7, d1
  003584  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00358a  31801a10             move.w    d0, $10(a0, d1.l * 2)
  00358e  3f03                 move.w    d3, -(a7)
  003590  2f0a                 move.l    a2, -(a7)
  003592  2003                 move.l    d3, d0
  003594  5f80                 subq.l    #$7, d0
  003596  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00359c  3f300a10             move.w    $10(a0, d0.l * 2), -(a7)
  0035a0  61ff0000121c         bsr.l     $47be   ; ConvertKeyName
  0035a6  700e                 moveq     #$e, d0
  0035a8  b680                 cmp.l     d0, d3
  0035aa  504f                 addq.w    #$8, a7
  0035ac  6c04                 bge.b     $35b2
  0035ae  5283                 addq.l    #$1, d3
  0035b0  6002                 bra.b     $35b4
  0035b2  7607                 moveq     #$7, d3
  0035b4  2f0a                 move.l    a2, -(a7)
  0035b6  3f03                 move.w    d3, -(a7)
  0035b8  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  0035be  a97e                 _SelectDialogItemText 
  0035c0  6006                 bra.b     $35c8
  0035c2  3f3c0019             move.w    #$19, -(a7)
  0035c6  a9c8                 _SysBeep  
  0035c8  1f7c00010048         move.b    #$1, $48(a7)
  0035ce  6000031a             bra.w     $38ea
  0035d2  422f0048             clr.b     $48(a7)
  0035d6  60000312             bra.w     $38ea
  0035da  2d6c000afffc         move.l    $a(a4), -$4(a6)
  0035e0  486efffc             pea.l     -$4(a6)
  0035e4  a871                 _GlobalToLocal 
  0035e6  554f                 subq.w    #$2, a7
  0035e8  2f0a                 move.l    a2, -(a7)
  0035ea  4eb900000350         jsr       $350.l   ; seg4+304
  0035f0  301f                 move.w    (a7)+, d0
  0035f2  3800                 move.w    d0, d4
  0035f4  3604                 move.w    d4, d3
  0035f6  600000b4             bra.w     $36ac
  0035fa  2f0a                 move.l    a2, -(a7)
  0035fc  3f03                 move.w    d3, -(a7)
  0035fe  486effee             pea.l     -$12(a6)
  003602  486efff8             pea.l     -$8(a6)
  003606  486efff0             pea.l     -$10(a6)
  00360a  a98d                 _GetDialogItem 
  00360c  554f                 subq.w    #$2, a7
  00360e  2f2efffc             move.l    -$4(a6), -(a7)
  003612  486efff0             pea.l     -$10(a6)
  003616  a8ad                 _PtInRect 
  003618  101f                 move.b    (a7)+, d0
  00361a  6700008e             beq.w     $36aa
  00361e  302effee             move.w    -$12(a6), d0
  003622  48c0                 ext.l     d0
  003624  5b80                 subq.l    #$5, d0
  003626  6726                 beq.b     $364e
  003628  5380                 subq.l    #$1, d0
  00362a  6740                 beq.b     $366c
  00362c  5380                 subq.l    #$1, d0
  00362e  675a                 beq.b     $368a
  003630  5180                 subq.l    #$8, d0
  003632  5380                 subq.l    #$1, d0
  003634  6702                 beq.b     $3638
  003636  6072                 bra.b     $36aa
  003638  2f0a                 move.l    a2, -(a7)
  00363a  3f03                 move.w    d3, -(a7)
  00363c  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  003642  a97e                 _SelectDialogItemText 
  003644  1f7c00010048         move.b    #$1, $48(a7)
  00364a  6000029e             bra.w     $38ea
  00364e  554f                 subq.w    #$2, a7
  003650  2f2efff8             move.l    -$8(a6), -(a7)
  003654  2f2efffc             move.l    -$4(a6), -(a7)
  003658  42a7                 clr.l     -(a7)
  00365a  a968                 _TrackControl 
  00365c  301f                 move.w    (a7)+, d0
  00365e  6702                 beq.b     $3662
  003660  3683                 move.w    d3, (a3)
  003662  1f7c00010048         move.b    #$1, $48(a7)
  003668  60000280             bra.w     $38ea
  00366c  554f                 subq.w    #$2, a7
  00366e  2f2efff8             move.l    -$8(a6), -(a7)
  003672  2f2efffc             move.l    -$4(a6), -(a7)
  003676  42a7                 clr.l     -(a7)
  003678  a968                 _TrackControl 
  00367a  301f                 move.w    (a7)+, d0
  00367c  6702                 beq.b     $3680
  00367e  3683                 move.w    d3, (a3)
  003680  1f7c00010048         move.b    #$1, $48(a7)
  003686  60000262             bra.w     $38ea
  00368a  554f                 subq.w    #$2, a7
  00368c  2f2efff8             move.l    -$8(a6), -(a7)
  003690  2f2efffc             move.l    -$4(a6), -(a7)
  003694  4878ffff             pea.l     $ffff.w
  003698  a968                 _TrackControl 
  00369a  301f                 move.w    (a7)+, d0
  00369c  6702                 beq.b     $36a0
  00369e  3683                 move.w    d3, (a3)
  0036a0  1f7c00010048         move.b    #$1, $48(a7)
  0036a6  60000242             bra.w     $38ea
  0036aa  5343                 subq.w    #$1, d3
  0036ac  4a43                 tst.w     d3
  0036ae  6c00ff4a             bge.w     $35fa
  0036b2  422f0048             clr.b     $48(a7)
  0036b6  60000232             bra.w     $38ea
  0036ba  7800                 moveq     #$0, d4
  0036bc  382c000e             move.w    $e(a4), d4
  0036c0  02840000ff00         andi.l    #$ff00, d4
  0036c6  4a84                 tst.l     d4
  0036c8  67000216             beq.w     $38e0
  0036cc  4a6a00a4             tst.w     $a4(a2)
  0036d0  6c04                 bge.b     $36d6
  0036d2  70ff                 moveq     #$ff, d0
  0036d4  6008                 bra.b     $36de
  0036d6  302a00a4             move.w    $a4(a2), d0
  0036da  48c0                 ext.l     d0
  0036dc  5280                 addq.l    #$1, d0
  0036de  2600                 move.l    d0, d3
  0036e0  4a83                 tst.l     d3
  0036e2  6f0001f6             ble.w     $38da
  0036e6  2004                 move.l    d4, d0
  0036e8  028000000100         andi.l    #$100, d0
  0036ee  6772                 beq.b     $3762
  0036f0  0c79003700006aa2     cmpi.w    #$37, $6aa2.l   ; g_6aa2
  0036f8  670001da             beq.w     $38d4
  0036fc  2003                 move.l    d3, d0
  0036fe  5f80                 subq.l    #$7, d0
  003700  3f00                 move.w    d0, -(a7)
  003702  3f3c0037             move.w    #$37, -(a7)
  003706  61fffffffd24         bsr.l     $342c   ; AlreadyUsingKey
  00370c  4a00                 tst.b     d0
  00370e  584f                 addq.w    #$4, a7
  003710  660001c2             bne.w     $38d4
  003714  2003                 move.l    d3, d0
  003716  5f80                 subq.l    #$7, d0
  003718  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00371e  31bc00370a10         move.w    #$37, $10(a0, d0.l * 2)
  003724  33fc003700006aa2     move.w    #$37, $6aa2.l   ; g_6aa2
  00372c  3f03                 move.w    d3, -(a7)
  00372e  2f0a                 move.l    a2, -(a7)
  003730  2003                 move.l    d3, d0
  003732  5f80                 subq.l    #$7, d0
  003734  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00373a  3f300a10             move.w    $10(a0, d0.l * 2), -(a7)
  00373e  61ff0000107e         bsr.l     $47be   ; ConvertKeyName
  003744  700e                 moveq     #$e, d0
  003746  b680                 cmp.l     d0, d3
  003748  504f                 addq.w    #$8, a7
  00374a  6c04                 bge.b     $3750
  00374c  5283                 addq.l    #$1, d3
  00374e  6002                 bra.b     $3752
  003750  7607                 moveq     #$7, d3
  003752  2f0a                 move.l    a2, -(a7)
  003754  3f03                 move.w    d3, -(a7)
  003756  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  00375c  a97e                 _SelectDialogItemText 
  00375e  60000174             bra.w     $38d4
  003762  2004                 move.l    d4, d0
  003764  028000000200         andi.l    #$200, d0
  00376a  6772                 beq.b     $37de
  00376c  0c79003800006aa2     cmpi.w    #$38, $6aa2.l   ; g_6aa2
  003774  6700015e             beq.w     $38d4
  003778  2003                 move.l    d3, d0
  00377a  5f80                 subq.l    #$7, d0
  00377c  3f00                 move.w    d0, -(a7)
  00377e  3f3c0038             move.w    #$38, -(a7)
  003782  61fffffffca8         bsr.l     $342c   ; AlreadyUsingKey
  003788  4a00                 tst.b     d0
  00378a  584f                 addq.w    #$4, a7
  00378c  66000146             bne.w     $38d4
  003790  2003                 move.l    d3, d0
  003792  5f80                 subq.l    #$7, d0
  003794  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00379a  31bc00380a10         move.w    #$38, $10(a0, d0.l * 2)
  0037a0  33fc003800006aa2     move.w    #$38, $6aa2.l   ; g_6aa2
  0037a8  3f03                 move.w    d3, -(a7)
  0037aa  2f0a                 move.l    a2, -(a7)
  0037ac  2003                 move.l    d3, d0
  0037ae  5f80                 subq.l    #$7, d0
  0037b0  41f900005842         lea.l     $5842.l, a0   ; g_5842
  0037b6  3f300a10             move.w    $10(a0, d0.l * 2), -(a7)
  0037ba  61ff00001002         bsr.l     $47be   ; ConvertKeyName
  0037c0  700e                 moveq     #$e, d0
  0037c2  b680                 cmp.l     d0, d3
  0037c4  504f                 addq.w    #$8, a7
  0037c6  6c04                 bge.b     $37cc
  0037c8  5283                 addq.l    #$1, d3
  0037ca  6002                 bra.b     $37ce
  0037cc  7607                 moveq     #$7, d3
  0037ce  2f0a                 move.l    a2, -(a7)
  0037d0  3f03                 move.w    d3, -(a7)
  0037d2  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  0037d8  a97e                 _SelectDialogItemText 
  0037da  600000f8             bra.w     $38d4
  0037de  2004                 move.l    d4, d0
  0037e0  028000000800         andi.l    #$800, d0
  0037e6  6770                 beq.b     $3858
  0037e8  0c79003a00006aa2     cmpi.w    #$3a, $6aa2.l   ; g_6aa2
  0037f0  670000e2             beq.w     $38d4
  0037f4  2003                 move.l    d3, d0
  0037f6  5f80                 subq.l    #$7, d0
  0037f8  3f00                 move.w    d0, -(a7)
  0037fa  3f3c003a             move.w    #$3a, -(a7)
  0037fe  61fffffffc2c         bsr.l     $342c   ; AlreadyUsingKey
  003804  4a00                 tst.b     d0
  003806  584f                 addq.w    #$4, a7
  003808  660000ca             bne.w     $38d4
  00380c  2003                 move.l    d3, d0
  00380e  5f80                 subq.l    #$7, d0
  003810  41f900005842         lea.l     $5842.l, a0   ; g_5842
  003816  31bc003a0a10         move.w    #$3a, $10(a0, d0.l * 2)
  00381c  33fc003a00006aa2     move.w    #$3a, $6aa2.l   ; g_6aa2
  003824  3f03                 move.w    d3, -(a7)
  003826  2f0a                 move.l    a2, -(a7)
  003828  2003                 move.l    d3, d0
  00382a  5f80                 subq.l    #$7, d0
  00382c  41f900005842         lea.l     $5842.l, a0   ; g_5842
  003832  3f300a10             move.w    $10(a0, d0.l * 2), -(a7)
  003836  61ff00000f86         bsr.l     $47be   ; ConvertKeyName
  00383c  700e                 moveq     #$e, d0
  00383e  b680                 cmp.l     d0, d3
  003840  504f                 addq.w    #$8, a7
  003842  6c04                 bge.b     $3848
  003844  5283                 addq.l    #$1, d3
  003846  6002                 bra.b     $384a
  003848  7607                 moveq     #$7, d3
  00384a  2f0a                 move.l    a2, -(a7)
  00384c  3f03                 move.w    d3, -(a7)
  00384e  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  003854  a97e                 _SelectDialogItemText 
  003856  607c                 bra.b     $38d4
  003858  2004                 move.l    d4, d0
  00385a  028000001000         andi.l    #$1000, d0
  003860  676c                 beq.b     $38ce
  003862  0c79003b00006aa2     cmpi.w    #$3b, $6aa2.l   ; g_6aa2
  00386a  6768                 beq.b     $38d4
  00386c  2003                 move.l    d3, d0
  00386e  5f80                 subq.l    #$7, d0
  003870  3f00                 move.w    d0, -(a7)
  003872  3f3c003b             move.w    #$3b, -(a7)
  003876  61fffffffbb4         bsr.l     $342c   ; AlreadyUsingKey
  00387c  4a00                 tst.b     d0
  00387e  584f                 addq.w    #$4, a7
  003880  6652                 bne.b     $38d4
  003882  2003                 move.l    d3, d0
  003884  5f80                 subq.l    #$7, d0
  003886  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00388c  31bc003b0a10         move.w    #$3b, $10(a0, d0.l * 2)
  003892  33fc003b00006aa2     move.w    #$3b, $6aa2.l   ; g_6aa2
  00389a  3f03                 move.w    d3, -(a7)
  00389c  2f0a                 move.l    a2, -(a7)
  00389e  2003                 move.l    d3, d0
  0038a0  5f80                 subq.l    #$7, d0
  0038a2  41f900005842         lea.l     $5842.l, a0   ; g_5842
  0038a8  3f300a10             move.w    $10(a0, d0.l * 2), -(a7)
  0038ac  61ff00000f10         bsr.l     $47be   ; ConvertKeyName
  0038b2  700e                 moveq     #$e, d0
  0038b4  b680                 cmp.l     d0, d3
  0038b6  504f                 addq.w    #$8, a7
  0038b8  6c04                 bge.b     $38be
  0038ba  5283                 addq.l    #$1, d3
  0038bc  6002                 bra.b     $38c0
  0038be  7607                 moveq     #$7, d3
  0038c0  2f0a                 move.l    a2, -(a7)
  0038c2  3f03                 move.w    d3, -(a7)
  0038c4  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  0038ca  a97e                 _SelectDialogItemText 
  0038cc  6006                 bra.b     $38d4
  0038ce  427900006aa2         clr.w     $6aa2.l   ; g_6aa2
  0038d4  422f0048             clr.b     $48(a7)
  0038d8  6010                 bra.b     $38ea
  0038da  422f0048             clr.b     $48(a7)
  0038de  600a                 bra.b     $38ea
  0038e0  427900006aa2         clr.w     $6aa2.l   ; g_6aa2
  0038e6  422f0048             clr.b     $48(a7)
  0038ea  4cdf1c18             movem.l   (a7)+, d3-d4/a2-a4
  0038ee  4e5e                 unlk      a6
  0038f0  4e74000c             rtd       #$c

;-------------------------------------------------------------
; UpdateDisabledItems   (seg 6 +003908, 280 bytes)
  003908  4e56fff0             link.w    a6, #$fff0
  00390c  2f0a                 move.l    a2, -(a7)
  00390e  246e0008             movea.l   $8(a6), a2
  003912  3d7cfffffff0         move.w    #$ffff, -$10(a6)
  003918  4a3900005846         tst.b     $5846.l   ; g_5846
  00391e  6764                 beq.b     $3984
  003920  2f0a                 move.l    a2, -(a7)
  003922  3f3c0009             move.w    #$9, -(a7)
  003926  486efff2             pea.l     -$e(a6)
  00392a  486efffc             pea.l     -$4(a6)
  00392e  486efff4             pea.l     -$c(a6)
  003932  a98d                 _GetDialogItem 
  003934  2f0a                 move.l    a2, -(a7)
  003936  2f3c00850009         move.l    #$850009, -(a7)
  00393c  2f2efffc             move.l    -$4(a6), -(a7)
  003940  486efff4             pea.l     -$c(a6)
  003944  a98e                 _SetDialogItem 
  003946  2f2efffc             move.l    -$4(a6), -(a7)
  00394a  3f3c00ff             move.w    #$ff, -(a7)
  00394e  a95d                 _HiliteControl 
  003950  2f0a                 move.l    a2, -(a7)
  003952  3f3c000a             move.w    #$a, -(a7)
  003956  486efff2             pea.l     -$e(a6)
  00395a  486efffc             pea.l     -$4(a6)
  00395e  486efff4             pea.l     -$c(a6)
  003962  a98d                 _GetDialogItem 
  003964  2f0a                 move.l    a2, -(a7)
  003966  2f3c0085000a         move.l    #$85000a, -(a7)
  00396c  2f2efffc             move.l    -$4(a6), -(a7)
  003970  486efff4             pea.l     -$c(a6)
  003974  a98e                 _SetDialogItem 
  003976  2f2efffc             move.l    -$4(a6), -(a7)
  00397a  3f3c00ff             move.w    #$ff, -(a7)
  00397e  a95d                 _HiliteControl 
  003980  60000098             bra.w     $3a1a
  003984  2f0a                 move.l    a2, -(a7)
  003986  3f3c0009             move.w    #$9, -(a7)
  00398a  486efff2             pea.l     -$e(a6)
  00398e  486efffc             pea.l     -$4(a6)
  003992  486efff4             pea.l     -$c(a6)
  003996  a98d                 _GetDialogItem 
  003998  2f0a                 move.l    a2, -(a7)
  00399a  2f3c00050009         move.l    #$50009, -(a7)
  0039a0  2f2efffc             move.l    -$4(a6), -(a7)
  0039a4  486efff4             pea.l     -$c(a6)
  0039a8  a98e                 _SetDialogItem 
  0039aa  2f2efffc             move.l    -$4(a6), -(a7)
  0039ae  4267                 clr.w     -(a7)
  0039b0  a95d                 _HiliteControl 
  0039b2  4a3900005844         tst.b     $5844.l   ; g_5844
  0039b8  6730                 beq.b     $39ea
  0039ba  2f0a                 move.l    a2, -(a7)
  0039bc  3f3c000a             move.w    #$a, -(a7)
  0039c0  486efff2             pea.l     -$e(a6)
  0039c4  486efffc             pea.l     -$4(a6)
  0039c8  486efff4             pea.l     -$c(a6)
  0039cc  a98d                 _GetDialogItem 
  0039ce  2f0a                 move.l    a2, -(a7)
  0039d0  2f3c0005000a         move.l    #$5000a, -(a7)
  0039d6  2f2efffc             move.l    -$4(a6), -(a7)
  0039da  486efff4             pea.l     -$c(a6)
  0039de  a98e                 _SetDialogItem 
  0039e0  2f2efffc             move.l    -$4(a6), -(a7)
  0039e4  4267                 clr.w     -(a7)
  0039e6  a95d                 _HiliteControl 
  0039e8  6030                 bra.b     $3a1a
  0039ea  2f0a                 move.l    a2, -(a7)
  0039ec  3f3c000a             move.w    #$a, -(a7)
  0039f0  486efff2             pea.l     -$e(a6)
  0039f4  486efffc             pea.l     -$4(a6)
  0039f8  486efff4             pea.l     -$c(a6)
  0039fc  a98d                 _GetDialogItem 
  0039fe  2f0a                 move.l    a2, -(a7)
  003a00  2f3c0085000a         move.l    #$85000a, -(a7)
  003a06  2f2efffc             move.l    -$4(a6), -(a7)
  003a0a  486efff4             pea.l     -$c(a6)
  003a0e  a98e                 _SetDialogItem 
  003a10  2f2efffc             move.l    -$4(a6), -(a7)
  003a14  3f3c00ff             move.w    #$ff, -(a7)
  003a18  a95d                 _HiliteControl 
  003a1a  245f                 movea.l   (a7)+, a2
  003a1c  4e5e                 unlk      a6
  003a1e  4e75                 rts       

;-------------------------------------------------------------
; PreferencesDialog   (seg 6 +003a36, 2146 bytes)
  003a36  4e56ffec             link.w    a6, #$ffec
  003a3a  48e71030             movem.l   d3/a2-a3, -(a7)
  003a3e  3d7cfffffff0         move.w    #$ffff, -$10(a6)
  003a44  7601                 moveq     #$1, d3
  003a46  45f900000318         lea.l     $318.l, a2   ; PREFDIALOGFILTER
  003a4c  47f900000318         lea.l     $318.l, a3   ; PREFDIALOGFILTER
  003a52  20790000583e         movea.l   $583e.l, a0   ; g_583e
  003a58  2050                 movea.l   (a0), a0
  003a5a  43f900005842         lea.l     $5842.l, a1   ; g_5842
  003a60  203c00000930         move.l    #$930, d0
  003a66  a22e                 _BlockMove 
  003a68  486effec             pea.l     -$14(a6)
  003a6c  a874                 _GetPort  
  003a6e  594f                 subq.w    #$4, a7
  003a70  3f3c1af4             move.w    #$1af4, -(a7)
  003a74  42a7                 clr.l     -(a7)
  003a76  4878ffff             pea.l     $ffff.w
  003a7a  a97c                 _GetNewDialog 
  003a7c  205f                 movea.l   (a7)+, a0
  003a7e  2448                 movea.l   a0, a2
  003a80  200a                 move.l    a2, d0
  003a82  6602                 bne.b     $3a86
  003a84  a9f4                 _ExitToShell 
  003a86  2f0a                 move.l    a2, -(a7)
  003a88  a873                 _SetPort  
  003a8a  554f                 subq.w    #$2, a7
  003a8c  2f0a                 move.l    a2, -(a7)
  003a8e  4eb900000350         jsr       $350.l   ; seg4+304
  003a94  301f                 move.w    (a7)+, d0
  003a96  3600                 move.w    d0, d3
  003a98  2f0a                 move.l    a2, -(a7)
  003a9a  3f3c0005             move.w    #$5, -(a7)
  003a9e  486efff2             pea.l     -$e(a6)
  003aa2  486efffc             pea.l     -$4(a6)
  003aa6  486efff4             pea.l     -$c(a6)
  003aaa  a98d                 _GetDialogItem 
  003aac  2f0a                 move.l    a2, -(a7)
  003aae  3f3c0005             move.w    #$5, -(a7)
  003ab2  3f2efff2             move.w    -$e(a6), -(a7)
  003ab6  487900000310         pea.l     $310.l   ; DRAWGREYOUTLINE
  003abc  486efff4             pea.l     -$c(a6)
  003ac0  a98e                 _SetDialogItem 
  003ac2  3f3c0001             move.w    #$1, -(a7)
  003ac6  2f0a                 move.l    a2, -(a7)
  003ac8  61ff000007e2         bsr.l     $42ac   ; SwitchPrefsPanel
  003ace  2f0a                 move.l    a2, -(a7)
  003ad0  a873                 _SetPort  
  003ad2  2f0a                 move.l    a2, -(a7)
  003ad4  a922                 _BeginUpdate 
  003ad6  2f0a                 move.l    a2, -(a7)
  003ad8  3f3c0001             move.w    #$1, -(a7)
  003adc  486efff2             pea.l     -$e(a6)
  003ae0  486efffc             pea.l     -$4(a6)
  003ae4  486efff4             pea.l     -$c(a6)
  003ae8  a98d                 _GetDialogItem 
  003aea  486efff4             pea.l     -$c(a6)
  003aee  2f3cfffcfffc         move.l    #$fffcfffc, -(a7)
  003af4  a8a9                 _InsetRect 
  003af6  2f3c00030003         move.l    #$30003, -(a7)
  003afc  a89b                 _PenSize  
  003afe  486efff4             pea.l     -$c(a6)
  003b02  2f3c000f000f         move.l    #$f000f, -(a7)
  003b08  a8b0                 _FrameRoundRect 
  003b0a  2f3c00010001         move.l    #$10001, -(a7)
  003b10  a89b                 _PenSize  
  003b12  2f0a                 move.l    a2, -(a7)
  003b14  a923                 _EndUpdate 
  003b16  2f0a                 move.l    a2, -(a7)
  003b18  a981                 _DrawDialog 
  003b1a  4eb900000b20         jsr       $b20.l   ; ShowCursorSafe
  003b20  2f0a                 move.l    a2, -(a7)
  003b22  a915                 _ShowWindow 
  003b24  5c4f                 addq.w    #$6, a7
  003b26  60000722             bra.w     $424a
  003b2a  2f0b                 move.l    a3, -(a7)
  003b2c  486efff0             pea.l     -$10(a6)
  003b30  a991                 _ModalDialog 
  003b32  2f0a                 move.l    a2, -(a7)
  003b34  3f3c0003             move.w    #$3, -(a7)
  003b38  486efff2             pea.l     -$e(a6)
  003b3c  486efffc             pea.l     -$4(a6)
  003b40  486efff4             pea.l     -$c(a6)
  003b44  a98d                 _GetDialogItem 
  003b46  554f                 subq.w    #$2, a7
  003b48  2f2efffc             move.l    -$4(a6), -(a7)
  003b4c  a960                 _GetControlValue 
  003b4e  301f                 move.w    (a7)+, d0
  003b50  3600                 move.w    d0, d3
  003b52  2f0a                 move.l    a2, -(a7)
  003b54  3f2efff0             move.w    -$10(a6), -(a7)
  003b58  486efff2             pea.l     -$e(a6)
  003b5c  486efffc             pea.l     -$4(a6)
  003b60  486efff4             pea.l     -$c(a6)
  003b64  a98d                 _GetDialogItem 
  003b66  0c6e0003fff0         cmpi.w    #$3, -$10(a6)
  003b6c  661a                 bne.b     $3b88
  003b6e  554f                 subq.w    #$2, a7
  003b70  2f2efffc             move.l    -$4(a6), -(a7)
  003b74  a960                 _GetControlValue 
  003b76  301f                 move.w    (a7)+, d0
  003b78  3f00                 move.w    d0, -(a7)
  003b7a  2f0a                 move.l    a2, -(a7)
  003b7c  61ff0000072e         bsr.l     $42ac   ; SwitchPrefsPanel
  003b82  5c4f                 addq.w    #$6, a7
  003b84  600006c4             bra.w     $424a
  003b88  0c6e0004fff0         cmpi.w    #$4, -$10(a6)
  003b8e  660000fa             bne.w     $3c8a
  003b92  3003                 move.w    d3, d0
  003b94  48c0                 ext.l     d0
  003b96  5380                 subq.l    #$1, d0
  003b98  670e                 beq.b     $3ba8
  003b9a  5380                 subq.l    #$1, d0
  003b9c  6768                 beq.b     $3c06
  003b9e  5380                 subq.l    #$1, d0
  003ba0  670000b6             beq.w     $3c58
  003ba4  600006a4             bra.w     $424a
  003ba8  423900005842         clr.b     $5842.l   ; g_5842
  003bae  423900005843         clr.b     $5843.l   ; g_5843
  003bb4  423900005844         clr.b     $5844.l   ; g_5844
  003bba  423900005845         clr.b     $5845.l   ; g_5845
  003bc0  423900005846         clr.b     $5846.l   ; g_5846
  003bc6  33fc00010000584a     move.w    #$1, $584a.l   ; g_584a
  003bce  20790000583e         movea.l   $583e.l, a0   ; g_583e
  003bd4  2050                 movea.l   (a0), a0
  003bd6  317c00030008         move.w    #$3, $8(a0)
  003bdc  7600                 moveq     #$0, d3
  003bde  600e                 bra.b     $3bee
  003be0  20790000583e         movea.l   $583e.l, a0   ; g_583e
  003be6  2250                 movea.l   (a0), a1
  003be8  42713220             clr.w     $20(a1, d3.w * 2)
  003bec  5243                 addq.w    #$1, d3
  003bee  0c430008             cmpi.w    #$8, d3
  003bf2  6dec                 blt.b     $3be0
  003bf4  3f3c0001             move.w    #$1, -(a7)
  003bf8  2f0a                 move.l    a2, -(a7)
  003bfa  61ff00000740         bsr.l     $433c   ; UpdatePrefsPanel
  003c00  5c4f                 addq.w    #$6, a7
  003c02  60000646             bra.w     $424a
  003c06  33fc007b00005852     move.w    #$7b, $5852.l   ; g_5852
  003c0e  33fc007c00005854     move.w    #$7c, $5854.l   ; g_5854
  003c16  33fc007d00005856     move.w    #$7d, $5856.l   ; g_5856
  003c1e  33fc007e00005858     move.w    #$7e, $5858.l   ; g_5858
  003c26  33fc00310000585a     move.w    #$31, $585a.l   ; g_585a
  003c2e  33fc003b0000585c     move.w    #$3b, $585c.l   ; g_585c
  003c36  33fc003a0000585e     move.w    #$3a, $585e.l   ; g_585e
  003c3e  33fc003000005860     move.w    #$30, $5860.l   ; g_5860
  003c46  3f3c0002             move.w    #$2, -(a7)
  003c4a  2f0a                 move.l    a2, -(a7)
  003c4c  61ff000006ee         bsr.l     $433c   ; UpdatePrefsPanel
  003c52  5c4f                 addq.w    #$6, a7
  003c54  600005f4             bra.w     $424a
  003c58  13fc00010000584c     move.b    #$1, $584c.l   ; g_584c
  003c60  13fc00010000584d     move.b    #$1, $584d.l   ; g_584d
  003c68  33fc00090000584e     move.w    #$9, $584e.l   ; g_584e
  003c70  33fc000700005850     move.w    #$7, $5850.l   ; g_5850
  003c78  3f3c0003             move.w    #$3, -(a7)
  003c7c  2f0a                 move.l    a2, -(a7)
  003c7e  61ff000006bc         bsr.l     $433c   ; UpdatePrefsPanel
  003c84  5c4f                 addq.w    #$6, a7
  003c86  600005c2             bra.w     $424a
  003c8a  0c6e0006fff0         cmpi.w    #$6, -$10(a6)
  003c90  6f0005b8             ble.w     $424a
  003c94  3003                 move.w    d3, d0
  003c96  48c0                 ext.l     d0
  003c98  5380                 subq.l    #$1, d0
  003c9a  6710                 beq.b     $3cac
  003c9c  5380                 subq.l    #$1, d0
  003c9e  670005aa             beq.w     $424a
  003ca2  5380                 subq.l    #$1, d0
  003ca4  670003dc             beq.w     $4082
  003ca8  600005a0             bra.w     $424a
  003cac  0c6e0007fff0         cmpi.w    #$7, -$10(a6)
  003cb2  663a                 bne.b     $3cee
  003cb4  103900005842         move.b    $5842.l, d0   ; g_5842
  003cba  57c0                 seq.b     d0
  003cbc  4400                 neg.b     d0
  003cbe  49c0                 extb.l    d0
  003cc0  13c000005842         move.b    d0, $5842.l   ; g_5842
  003cc6  2f0a                 move.l    a2, -(a7)
  003cc8  3f3c0007             move.w    #$7, -(a7)
  003ccc  486efff2             pea.l     -$e(a6)
  003cd0  486efffc             pea.l     -$4(a6)
  003cd4  486efff4             pea.l     -$c(a6)
  003cd8  a98d                 _GetDialogItem 
  003cda  2f2efffc             move.l    -$4(a6), -(a7)
  003cde  7000                 moveq     #$0, d0
  003ce0  103900005842         move.b    $5842.l, d0   ; g_5842
  003ce6  3f00                 move.w    d0, -(a7)
  003ce8  a963                 _SetControlValue 
  003cea  6000055e             bra.w     $424a
  003cee  0c6e0008fff0         cmpi.w    #$8, -$10(a6)
  003cf4  663a                 bne.b     $3d30
  003cf6  103900005843         move.b    $5843.l, d0   ; g_5843
  003cfc  57c0                 seq.b     d0
  003cfe  4400                 neg.b     d0
  003d00  49c0                 extb.l    d0
  003d02  13c000005843         move.b    d0, $5843.l   ; g_5843
  003d08  2f0a                 move.l    a2, -(a7)
  003d0a  3f3c0008             move.w    #$8, -(a7)
  003d0e  486efff2             pea.l     -$e(a6)
  003d12  486efffc             pea.l     -$4(a6)
  003d16  486efff4             pea.l     -$c(a6)
  003d1a  a98d                 _GetDialogItem 
  003d1c  2f2efffc             move.l    -$4(a6), -(a7)
  003d20  7000                 moveq     #$0, d0
  003d22  103900005843         move.b    $5843.l, d0   ; g_5843
  003d28  3f00                 move.w    d0, -(a7)
  003d2a  a963                 _SetControlValue 
  003d2c  6000051c             bra.w     $424a
  003d30  0c6e0009fff0         cmpi.w    #$9, -$10(a6)
  003d36  6644                 bne.b     $3d7c
  003d38  103900005844         move.b    $5844.l, d0   ; g_5844
  003d3e  57c0                 seq.b     d0
  003d40  4400                 neg.b     d0
  003d42  49c0                 extb.l    d0
  003d44  13c000005844         move.b    d0, $5844.l   ; g_5844
  003d4a  2f0a                 move.l    a2, -(a7)
  003d4c  3f3c0009             move.w    #$9, -(a7)
  003d50  486efff2             pea.l     -$e(a6)
  003d54  486efffc             pea.l     -$4(a6)
  003d58  486efff4             pea.l     -$c(a6)
  003d5c  a98d                 _GetDialogItem 
  003d5e  2f2efffc             move.l    -$4(a6), -(a7)
  003d62  7000                 moveq     #$0, d0
  003d64  103900005844         move.b    $5844.l, d0   ; g_5844
  003d6a  3f00                 move.w    d0, -(a7)
  003d6c  a963                 _SetControlValue 
  003d6e  2f0a                 move.l    a2, -(a7)
  003d70  61fffffffb96         bsr.l     $3908   ; UpdateDisabledItems
  003d76  584f                 addq.w    #$4, a7
  003d78  600004d0             bra.w     $424a
  003d7c  0c6e000afff0         cmpi.w    #$a, -$10(a6)
  003d82  663a                 bne.b     $3dbe
  003d84  103900005845         move.b    $5845.l, d0   ; g_5845
  003d8a  57c0                 seq.b     d0
  003d8c  4400                 neg.b     d0
  003d8e  49c0                 extb.l    d0
  003d90  13c000005845         move.b    d0, $5845.l   ; g_5845
  003d96  2f0a                 move.l    a2, -(a7)
  003d98  3f3c000a             move.w    #$a, -(a7)
  003d9c  486efff2             pea.l     -$e(a6)
  003da0  486efffc             pea.l     -$4(a6)
  003da4  486efff4             pea.l     -$c(a6)
  003da8  a98d                 _GetDialogItem 
  003daa  2f2efffc             move.l    -$4(a6), -(a7)
  003dae  7000                 moveq     #$0, d0
  003db0  103900005845         move.b    $5845.l, d0   ; g_5845
  003db6  3f00                 move.w    d0, -(a7)
  003db8  a963                 _SetControlValue 
  003dba  6000048e             bra.w     $424a
  003dbe  0c6e000bfff0         cmpi.w    #$b, -$10(a6)
  003dc4  6644                 bne.b     $3e0a
  003dc6  103900005846         move.b    $5846.l, d0   ; g_5846
  003dcc  57c0                 seq.b     d0
  003dce  4400                 neg.b     d0
  003dd0  49c0                 extb.l    d0
  003dd2  13c000005846         move.b    d0, $5846.l   ; g_5846
  003dd8  2f0a                 move.l    a2, -(a7)
  003dda  3f3c000b             move.w    #$b, -(a7)
  003dde  486efff2             pea.l     -$e(a6)
  003de2  486efffc             pea.l     -$4(a6)
  003de6  486efff4             pea.l     -$c(a6)
  003dea  a98d                 _GetDialogItem 
  003dec  2f2efffc             move.l    -$4(a6), -(a7)
  003df0  7000                 moveq     #$0, d0
  003df2  103900005846         move.b    $5846.l, d0   ; g_5846
  003df8  3f00                 move.w    d0, -(a7)
  003dfa  a963                 _SetControlValue 
  003dfc  2f0a                 move.l    a2, -(a7)
  003dfe  61fffffffb08         bsr.l     $3908   ; UpdateDisabledItems
  003e04  584f                 addq.w    #$4, a7
  003e06  60000442             bra.w     $424a
  003e0a  0c6e0010fff0         cmpi.w    #$10, -$10(a6)
  003e10  6644                 bne.b     $3e56
  003e12  103900005847         move.b    $5847.l, d0   ; g_5847
  003e18  57c0                 seq.b     d0
  003e1a  4400                 neg.b     d0
  003e1c  49c0                 extb.l    d0
  003e1e  13c000005847         move.b    d0, $5847.l   ; g_5847
  003e24  2f0a                 move.l    a2, -(a7)
  003e26  3f3c0010             move.w    #$10, -(a7)
  003e2a  486efff2             pea.l     -$e(a6)
  003e2e  486efffc             pea.l     -$4(a6)
  003e32  486efff4             pea.l     -$c(a6)
  003e36  a98d                 _GetDialogItem 
  003e38  2f2efffc             move.l    -$4(a6), -(a7)
  003e3c  7000                 moveq     #$0, d0
  003e3e  103900005847         move.b    $5847.l, d0   ; g_5847
  003e44  3f00                 move.w    d0, -(a7)
  003e46  a963                 _SetControlValue 
  003e48  2f0a                 move.l    a2, -(a7)
  003e4a  61fffffffabc         bsr.l     $3908   ; UpdateDisabledItems
  003e50  584f                 addq.w    #$4, a7
  003e52  600003f6             bra.w     $424a
  003e56  0c6e000cfff0         cmpi.w    #$c, -$10(a6)
  003e5c  66000080             bne.w     $3ede
  003e60  33fc00010000584a     move.w    #$1, $584a.l   ; g_584a
  003e68  2f0a                 move.l    a2, -(a7)
  003e6a  3f3c000c             move.w    #$c, -(a7)
  003e6e  486efff2             pea.l     -$e(a6)
  003e72  486efffc             pea.l     -$4(a6)
  003e76  486efff4             pea.l     -$c(a6)
  003e7a  a98d                 _GetDialogItem 
  003e7c  2f2efffc             move.l    -$4(a6), -(a7)
  003e80  3f3c0001             move.w    #$1, -(a7)
  003e84  a963                 _SetControlValue 
  003e86  2f0a                 move.l    a2, -(a7)
  003e88  3f3c000f             move.w    #$f, -(a7)
  003e8c  486efff2             pea.l     -$e(a6)
  003e90  486efffc             pea.l     -$4(a6)
  003e94  486efff4             pea.l     -$c(a6)
  003e98  a98d                 _GetDialogItem 
  003e9a  2f2efffc             move.l    -$4(a6), -(a7)
  003e9e  4267                 clr.w     -(a7)
  003ea0  a963                 _SetControlValue 
  003ea2  2f0a                 move.l    a2, -(a7)
  003ea4  3f3c000d             move.w    #$d, -(a7)
  003ea8  486efff2             pea.l     -$e(a6)
  003eac  486efffc             pea.l     -$4(a6)
  003eb0  486efff4             pea.l     -$c(a6)
  003eb4  a98d                 _GetDialogItem 
  003eb6  2f2efffc             move.l    -$4(a6), -(a7)
  003eba  4267                 clr.w     -(a7)
  003ebc  a963                 _SetControlValue 
  003ebe  2f0a                 move.l    a2, -(a7)
  003ec0  3f3c0011             move.w    #$11, -(a7)
  003ec4  486efff2             pea.l     -$e(a6)
  003ec8  486efffc             pea.l     -$4(a6)
  003ecc  486efff4             pea.l     -$c(a6)
  003ed0  a98d                 _GetDialogItem 
  003ed2  2f2efffc             move.l    -$4(a6), -(a7)
  003ed6  4267                 clr.w     -(a7)
  003ed8  a963                 _SetControlValue 
  003eda  6000036e             bra.w     $424a
  003ede  0c6e000ffff0         cmpi.w    #$f, -$10(a6)
  003ee4  66000080             bne.w     $3f66
  003ee8  33fc00020000584a     move.w    #$2, $584a.l   ; g_584a
  003ef0  2f0a                 move.l    a2, -(a7)
  003ef2  3f3c000c             move.w    #$c, -(a7)
  003ef6  486efff2             pea.l     -$e(a6)
  003efa  486efffc             pea.l     -$4(a6)
  003efe  486efff4             pea.l     -$c(a6)
  003f02  a98d                 _GetDialogItem 
  003f04  2f2efffc             move.l    -$4(a6), -(a7)
  003f08  4267                 clr.w     -(a7)
  003f0a  a963                 _SetControlValue 
  003f0c  2f0a                 move.l    a2, -(a7)
  003f0e  3f3c000f             move.w    #$f, -(a7)
  003f12  486efff2             pea.l     -$e(a6)
  003f16  486efffc             pea.l     -$4(a6)
  003f1a  486efff4             pea.l     -$c(a6)
  003f1e  a98d                 _GetDialogItem 
  003f20  2f2efffc             move.l    -$4(a6), -(a7)
  003f24  3f3c0001             move.w    #$1, -(a7)
  003f28  a963                 _SetControlValue 
  003f2a  2f0a                 move.l    a2, -(a7)
  003f2c  3f3c000d             move.w    #$d, -(a7)
  003f30  486efff2             pea.l     -$e(a6)
  003f34  486efffc             pea.l     -$4(a6)
  003f38  486efff4             pea.l     -$c(a6)
  003f3c  a98d                 _GetDialogItem 
  003f3e  2f2efffc             move.l    -$4(a6), -(a7)
  003f42  4267                 clr.w     -(a7)
  003f44  a963                 _SetControlValue 
  003f46  2f0a                 move.l    a2, -(a7)
  003f48  3f3c0011             move.w    #$11, -(a7)
  003f4c  486efff2             pea.l     -$e(a6)
  003f50  486efffc             pea.l     -$4(a6)
  003f54  486efff4             pea.l     -$c(a6)
  003f58  a98d                 _GetDialogItem 
  003f5a  2f2efffc             move.l    -$4(a6), -(a7)
  003f5e  4267                 clr.w     -(a7)
  003f60  a963                 _SetControlValue 
  003f62  600002e6             bra.w     $424a
  003f66  0c6e000dfff0         cmpi.w    #$d, -$10(a6)
  003f6c  66000080             bne.w     $3fee
  003f70  33fc00030000584a     move.w    #$3, $584a.l   ; g_584a
  003f78  2f0a                 move.l    a2, -(a7)
  003f7a  3f3c000c             move.w    #$c, -(a7)
  003f7e  486efff2             pea.l     -$e(a6)
  003f82  486efffc             pea.l     -$4(a6)
  003f86  486efff4             pea.l     -$c(a6)
  003f8a  a98d                 _GetDialogItem 
  003f8c  2f2efffc             move.l    -$4(a6), -(a7)
  003f90  4267                 clr.w     -(a7)
  003f92  a963                 _SetControlValue 
  003f94  2f0a                 move.l    a2, -(a7)
  003f96  3f3c000f             move.w    #$f, -(a7)
  003f9a  486efff2             pea.l     -$e(a6)
  003f9e  486efffc             pea.l     -$4(a6)
  003fa2  486efff4             pea.l     -$c(a6)
  003fa6  a98d                 _GetDialogItem 
  003fa8  2f2efffc             move.l    -$4(a6), -(a7)
  003fac  4267                 clr.w     -(a7)
  003fae  a963                 _SetControlValue 
  003fb0  2f0a                 move.l    a2, -(a7)
  003fb2  3f3c000d             move.w    #$d, -(a7)
  003fb6  486efff2             pea.l     -$e(a6)
  003fba  486efffc             pea.l     -$4(a6)
  003fbe  486efff4             pea.l     -$c(a6)
  003fc2  a98d                 _GetDialogItem 
  003fc4  2f2efffc             move.l    -$4(a6), -(a7)
  003fc8  3f3c0001             move.w    #$1, -(a7)
  003fcc  a963                 _SetControlValue 
  003fce  2f0a                 move.l    a2, -(a7)
  003fd0  3f3c0011             move.w    #$11, -(a7)
  003fd4  486efff2             pea.l     -$e(a6)
  003fd8  486efffc             pea.l     -$4(a6)
  003fdc  486efff4             pea.l     -$c(a6)
  003fe0  a98d                 _GetDialogItem 
  003fe2  2f2efffc             move.l    -$4(a6), -(a7)
  003fe6  4267                 clr.w     -(a7)
  003fe8  a963                 _SetControlValue 
  003fea  6000025e             bra.w     $424a
  003fee  0c6e0011fff0         cmpi.w    #$11, -$10(a6)
  003ff4  66000080             bne.w     $4076
  003ff8  33fc00040000584a     move.w    #$4, $584a.l   ; g_584a
  004000  2f0a                 move.l    a2, -(a7)
  004002  3f3c000c             move.w    #$c, -(a7)
  004006  486efff2             pea.l     -$e(a6)
  00400a  486efffc             pea.l     -$4(a6)
  00400e  486efff4             pea.l     -$c(a6)
  004012  a98d                 _GetDialogItem 
  004014  2f2efffc             move.l    -$4(a6), -(a7)
  004018  4267                 clr.w     -(a7)
  00401a  a963                 _SetControlValue 
  00401c  2f0a                 move.l    a2, -(a7)
  00401e  3f3c000f             move.w    #$f, -(a7)
  004022  486efff2             pea.l     -$e(a6)
  004026  486efffc             pea.l     -$4(a6)
  00402a  486efff4             pea.l     -$c(a6)
  00402e  a98d                 _GetDialogItem 
  004030  2f2efffc             move.l    -$4(a6), -(a7)
  004034  4267                 clr.w     -(a7)
  004036  a963                 _SetControlValue 
  004038  2f0a                 move.l    a2, -(a7)
  00403a  3f3c000d             move.w    #$d, -(a7)
  00403e  486efff2             pea.l     -$e(a6)
  004042  486efffc             pea.l     -$4(a6)
  004046  486efff4             pea.l     -$c(a6)
  00404a  a98d                 _GetDialogItem 
  00404c  2f2efffc             move.l    -$4(a6), -(a7)
  004050  4267                 clr.w     -(a7)
  004052  a963                 _SetControlValue 
  004054  2f0a                 move.l    a2, -(a7)
  004056  3f3c0011             move.w    #$11, -(a7)
  00405a  486efff2             pea.l     -$e(a6)
  00405e  486efffc             pea.l     -$4(a6)
  004062  486efff4             pea.l     -$c(a6)
  004066  a98d                 _GetDialogItem 
  004068  2f2efffc             move.l    -$4(a6), -(a7)
  00406c  3f3c0001             move.w    #$1, -(a7)
  004070  a963                 _SetControlValue 
  004072  600001d6             bra.w     $424a
  004076  33fc00010000584a     move.w    #$1, $584a.l   ; g_584a
  00407e  600001ca             bra.w     $424a
  004082  0c6e0007fff0         cmpi.w    #$7, -$10(a6)
  004088  663a                 bne.b     $40c4
  00408a  10390000584c         move.b    $584c.l, d0   ; g_584c
  004090  57c0                 seq.b     d0
  004092  4400                 neg.b     d0
  004094  49c0                 extb.l    d0
  004096  13c00000584c         move.b    d0, $584c.l   ; g_584c
  00409c  2f0a                 move.l    a2, -(a7)
  00409e  3f3c0007             move.w    #$7, -(a7)
  0040a2  486efff2             pea.l     -$e(a6)
  0040a6  486efffc             pea.l     -$4(a6)
  0040aa  486efff4             pea.l     -$c(a6)
  0040ae  a98d                 _GetDialogItem 
  0040b0  2f2efffc             move.l    -$4(a6), -(a7)
  0040b4  7000                 moveq     #$0, d0
  0040b6  10390000584c         move.b    $584c.l, d0   ; g_584c
  0040bc  3f00                 move.w    d0, -(a7)
  0040be  a963                 _SetControlValue 
  0040c0  60000188             bra.w     $424a
  0040c4  0c6e0008fff0         cmpi.w    #$8, -$10(a6)
  0040ca  660000bc             bne.w     $4188
  0040ce  10390000584d         move.b    $584d.l, d0   ; g_584d
  0040d4  57c0                 seq.b     d0
  0040d6  4400                 neg.b     d0
  0040d8  49c0                 extb.l    d0
  0040da  13c00000584d         move.b    d0, $584d.l   ; g_584d
  0040e0  13f90000584d0000617d move.b    $584d.l, $617d.l   ; g_584d, g_617d
  0040ea  4a390000584d         tst.b     $584d.l   ; g_584d
  0040f0  675e                 beq.b     $4150
  0040f2  61ffffffdf0c         bsr.l     $2000   ; IsQuickTimeInstalled
  0040f8  4a00                 tst.b     d0
  0040fa  6616                 bne.b     $4112
  0040fc  42390000584d         clr.b     $584d.l   ; g_584d
  004102  487900000db6         pea.l     $db6.l   ; g_db6
  004108  4eb900000bf0         jsr       $bf0.l   ; ReportDialog
  00410e  584f                 addq.w    #$4, a7
  004110  604e                 bra.b     $4160
  004112  4eb900000b38         jsr       $b38.l   ; SetWatchCursor
  004118  61ffffffd638         bsr.l     $1752   ; InitMusic
  00411e  33f90000585000006180 move.w    $5850.l, $6180.l   ; g_5850, g_6180
  004128  303900005850         move.w    $5850.l, d0   ; g_5850
  00412e  c1fc1c71             muls.w    #$1c71, d0
  004132  2f00                 move.l    d0, -(a7)
  004134  61ffffffd9de         bsr.l     $1b14   ; SetMusicVolume
  00413a  3f3900000eaa         move.w    $eaa.l, -(a7)   ; g_eaa
  004140  61ffffffd720         bsr.l     $1862   ; SetMusic
  004146  4eb900000b30         jsr       $b30.l   ; ResetCursor
  00414c  5c4f                 addq.w    #$6, a7
  00414e  6010                 bra.b     $4160
  004150  42a7                 clr.l     -(a7)
  004152  61ffffffd9c0         bsr.l     $1b14   ; SetMusicVolume
  004158  61ffffffda86         bsr.l     $1be0   ; ShutDownMusic
  00415e  584f                 addq.w    #$4, a7
  004160  2f0a                 move.l    a2, -(a7)
  004162  3f3c0008             move.w    #$8, -(a7)
  004166  486efff2             pea.l     -$e(a6)
  00416a  486efffc             pea.l     -$4(a6)
  00416e  486efff4             pea.l     -$c(a6)
  004172  a98d                 _GetDialogItem 
  004174  2f2efffc             move.l    -$4(a6), -(a7)
  004178  7000                 moveq     #$0, d0
  00417a  10390000584d         move.b    $584d.l, d0   ; g_584d
  004180  3f00                 move.w    d0, -(a7)
  004182  a963                 _SetControlValue 
  004184  600000c4             bra.w     $424a
  004188  0c6e0009fff0         cmpi.w    #$9, -$10(a6)
  00418e  6660                 bne.b     $41f0
  004190  2f0a                 move.l    a2, -(a7)
  004192  3f3c0009             move.w    #$9, -(a7)
  004196  486efff2             pea.l     -$e(a6)
  00419a  486efffc             pea.l     -$4(a6)
  00419e  486efff4             pea.l     -$c(a6)
  0041a2  a98d                 _GetDialogItem 
  0041a4  554f                 subq.w    #$2, a7
  0041a6  2f2efffc             move.l    -$4(a6), -(a7)
  0041aa  a960                 _GetControlValue 
  0041ac  301f                 move.w    (a7)+, d0
  0041ae  48c0                 ext.l     d0
  0041b0  720a                 moveq     #$a, d1
  0041b2  9280                 sub.l     d0, d1
  0041b4  33c10000584e         move.w    d1, $584e.l   ; g_584e
  0041ba  4a390000584c         tst.b     $584c.l   ; g_584c
  0041c0  67000088             beq.w     $424a
  0041c4  13fc00010000617c     move.b    #$1, $617c.l   ; g_617c
  0041cc  701c                 moveq     #$1c, d0
  0041ce  c1f90000584e         muls.w    $584e.l, d0   ; g_584e
  0041d4  23c0000046c8         move.l    d0, $46c8.l   ; g_46c8
  0041da  2f3c00640100         move.l    #$640100, -(a7)
  0041e0  2f390000836a         move.l    $836a.l, -(a7)   ; snd206_Harry
  0041e6  4eb900000ba0         jsr       $ba0.l   ; STPlayRegSound
  0041ec  504f                 addq.w    #$8, a7
  0041ee  605a                 bra.b     $424a
  0041f0  0c6e000afff0         cmpi.w    #$a, -$10(a6)
  0041f6  6652                 bne.b     $424a
  0041f8  2f0a                 move.l    a2, -(a7)
  0041fa  3f3c000a             move.w    #$a, -(a7)
  0041fe  486efff2             pea.l     -$e(a6)
  004202  486efffc             pea.l     -$4(a6)
  004206  486efff4             pea.l     -$c(a6)
  00420a  a98d                 _GetDialogItem 
  00420c  554f                 subq.w    #$2, a7
  00420e  2f2efffc             move.l    -$4(a6), -(a7)
  004212  a960                 _GetControlValue 
  004214  301f                 move.w    (a7)+, d0
  004216  48c0                 ext.l     d0
  004218  720a                 moveq     #$a, d1
  00421a  9280                 sub.l     d0, d1
  00421c  33c100005850         move.w    d1, $5850.l   ; g_5850
  004222  4a390000584d         tst.b     $584d.l   ; g_584d
  004228  6716                 beq.b     $4240
  00422a  303900005850         move.w    $5850.l, d0   ; g_5850
  004230  c1fc1c71             muls.w    #$1c71, d0
  004234  2f00                 move.l    d0, -(a7)
  004236  61ffffffd8dc         bsr.l     $1b14   ; SetMusicVolume
  00423c  584f                 addq.w    #$4, a7
  00423e  600a                 bra.b     $424a
  004240  42a7                 clr.l     -(a7)
  004242  61ffffffd8d0         bsr.l     $1b14   ; SetMusicVolume
  004248  584f                 addq.w    #$4, a7
  00424a  0c6e0001fff0         cmpi.w    #$1, -$10(a6)
  004250  670a                 beq.b     $425c
  004252  0c6e0002fff0         cmpi.w    #$2, -$10(a6)
  004258  6600f8d0             bne.w     $3b2a
  00425c  0c6e0001fff0         cmpi.w    #$1, -$10(a6)
  004262  6616                 bne.b     $427a
  004264  41f900005842         lea.l     $5842.l, a0   ; g_5842
  00426a  22790000583e         movea.l   $583e.l, a1   ; g_583e
  004270  2251                 movea.l   (a1), a1
  004272  203c00000930         move.l    #$930, d0
  004278  a22e                 _BlockMove 
  00427a  33fcffff00000df8     move.w    #$ffff, $df8.l   ; g_df8
  004282  2f0a                 move.l    a2, -(a7)
  004284  a916                 _HideWindow 
  004286  2f2effec             move.l    -$14(a6), -(a7)
  00428a  a873                 _SetPort  
  00428c  2f0a                 move.l    a2, -(a7)
  00428e  a983                 _DisposeDialog 
  004290  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004294  4e5e                 unlk      a6
  004296  4e75                 rts       

;-------------------------------------------------------------
; SwitchPrefsPanel   (seg 6 +0042ac, 124 bytes)
  0042ac  4e560000             link.w    a6, #$0
  0042b0  48e71030             movem.l   d3/a2-a3, -(a7)
  0042b4  266e0008             movea.l   $8(a6), a3
  0042b8  362e000c             move.w    $c(a6), d3
  0042bc  b67900000df8         cmp.w     $df8.l, d3   ; g_df8
  0042c2  675c                 beq.b     $4320
  0042c4  33c300000df8         move.w    d3, $df8.l   ; g_df8
  0042ca  2f0b                 move.l    a3, -(a7)
  0042cc  554f                 subq.w    #$2, a7
  0042ce  2f0b                 move.l    a3, -(a7)
  0042d0  4eb900000350         jsr       $350.l   ; seg4+304
  0042d6  301f                 move.w    (a7)+, d0
  0042d8  48c0                 ext.l     d0
  0042da  5d80                 subq.l    #$6, d0
  0042dc  3f00                 move.w    d0, -(a7)
  0042de  4eb900000358         jsr       $358.l   ; seg4+318
  0042e4  594f                 subq.w    #$4, a7
  0042e6  2f3c4449544c         move.l    #$4449544c, -(a7)
  0042ec  3003                 move.w    d3, d0
  0042ee  48c0                 ext.l     d0
  0042f0  068000001af4         addi.l    #$1af4, d0
  0042f6  3f00                 move.w    d0, -(a7)
  0042f8  a9a0                 _GetResource 
  0042fa  205f                 movea.l   (a7)+, a0
  0042fc  2448                 movea.l   a0, a2
  0042fe  200a                 move.l    a2, d0
  004300  6602                 bne.b     $4304
  004302  a9f4                 _ExitToShell 
  004304  2f0b                 move.l    a3, -(a7)
  004306  2f0a                 move.l    a2, -(a7)
  004308  4267                 clr.w     -(a7)
  00430a  4eb900000348         jsr       $348.l   ; seg4+2f0
  004310  2f0a                 move.l    a2, -(a7)
  004312  a9a3                 _ReleaseResource 
  004314  3f03                 move.w    d3, -(a7)
  004316  2f0b                 move.l    a3, -(a7)
  004318  61ff00000022         bsr.l     $433c   ; UpdatePrefsPanel
  00431e  5c4f                 addq.w    #$6, a7
  004320  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004324  4e5e                 unlk      a6
  004326  4e75                 rts       

;-------------------------------------------------------------
; UpdatePrefsPanel   (seg 6 +00433c, 1134 bytes)
  00433c  4e56fff2             link.w    a6, #$fff2
  004340  2f0a                 move.l    a2, -(a7)
  004342  246e0008             movea.l   $8(a6), a2
  004346  302e000c             move.w    $c(a6), d0
  00434a  48c0                 ext.l     d0
  00434c  5380                 subq.l    #$1, d0
  00434e  6710                 beq.b     $4360
  004350  5380                 subq.l    #$1, d0
  004352  670002cc             beq.w     $4620
  004356  5380                 subq.l    #$1, d0
  004358  6700036a             beq.w     $46c4
  00435c  60000446             bra.w     $47a4
  004360  2f0a                 move.l    a2, -(a7)
  004362  3f3c0007             move.w    #$7, -(a7)
  004366  486efff2             pea.l     -$e(a6)
  00436a  486efffc             pea.l     -$4(a6)
  00436e  486efff4             pea.l     -$c(a6)
  004372  a98d                 _GetDialogItem 
  004374  2f2efffc             move.l    -$4(a6), -(a7)
  004378  7000                 moveq     #$0, d0
  00437a  103900005842         move.b    $5842.l, d0   ; g_5842
  004380  3f00                 move.w    d0, -(a7)
  004382  a963                 _SetControlValue 
  004384  2f0a                 move.l    a2, -(a7)
  004386  3f3c0008             move.w    #$8, -(a7)
  00438a  486efff2             pea.l     -$e(a6)
  00438e  486efffc             pea.l     -$4(a6)
  004392  486efff4             pea.l     -$c(a6)
  004396  a98d                 _GetDialogItem 
  004398  2f2efffc             move.l    -$4(a6), -(a7)
  00439c  7000                 moveq     #$0, d0
  00439e  103900005843         move.b    $5843.l, d0   ; g_5843
  0043a4  3f00                 move.w    d0, -(a7)
  0043a6  a963                 _SetControlValue 
  0043a8  2f0a                 move.l    a2, -(a7)
  0043aa  3f3c0009             move.w    #$9, -(a7)
  0043ae  486efff2             pea.l     -$e(a6)
  0043b2  486efffc             pea.l     -$4(a6)
  0043b6  486efff4             pea.l     -$c(a6)
  0043ba  a98d                 _GetDialogItem 
  0043bc  2f2efffc             move.l    -$4(a6), -(a7)
  0043c0  7000                 moveq     #$0, d0
  0043c2  103900005844         move.b    $5844.l, d0   ; g_5844
  0043c8  3f00                 move.w    d0, -(a7)
  0043ca  a963                 _SetControlValue 
  0043cc  2f0a                 move.l    a2, -(a7)
  0043ce  3f3c000a             move.w    #$a, -(a7)
  0043d2  486efff2             pea.l     -$e(a6)
  0043d6  486efffc             pea.l     -$4(a6)
  0043da  486efff4             pea.l     -$c(a6)
  0043de  a98d                 _GetDialogItem 
  0043e0  2f2efffc             move.l    -$4(a6), -(a7)
  0043e4  7000                 moveq     #$0, d0
  0043e6  103900005845         move.b    $5845.l, d0   ; g_5845
  0043ec  3f00                 move.w    d0, -(a7)
  0043ee  a963                 _SetControlValue 
  0043f0  2f0a                 move.l    a2, -(a7)
  0043f2  3f3c000b             move.w    #$b, -(a7)
  0043f6  486efff2             pea.l     -$e(a6)
  0043fa  486efffc             pea.l     -$4(a6)
  0043fe  486efff4             pea.l     -$c(a6)
  004402  a98d                 _GetDialogItem 
  004404  2f2efffc             move.l    -$4(a6), -(a7)
  004408  7000                 moveq     #$0, d0
  00440a  103900005846         move.b    $5846.l, d0   ; g_5846
  004410  3f00                 move.w    d0, -(a7)
  004412  a963                 _SetControlValue 
  004414  2f0a                 move.l    a2, -(a7)
  004416  3f3c0010             move.w    #$10, -(a7)
  00441a  486efff2             pea.l     -$e(a6)
  00441e  486efffc             pea.l     -$4(a6)
  004422  486efff4             pea.l     -$c(a6)
  004426  a98d                 _GetDialogItem 
  004428  2f2efffc             move.l    -$4(a6), -(a7)
  00442c  7000                 moveq     #$0, d0
  00442e  103900005847         move.b    $5847.l, d0   ; g_5847
  004434  3f00                 move.w    d0, -(a7)
  004436  a963                 _SetControlValue 
  004438  30390000584a         move.w    $584a.l, d0   ; g_584a
  00443e  48c0                 ext.l     d0
  004440  5580                 subq.l    #$2, d0
  004442  6710                 beq.b     $4454
  004444  5380                 subq.l    #$1, d0
  004446  67000082             beq.w     $44ca
  00444a  5380                 subq.l    #$1, d0
  00444c  670000f2             beq.w     $4540
  004450  60000162             bra.w     $45b4
  004454  2f0a                 move.l    a2, -(a7)
  004456  3f3c000c             move.w    #$c, -(a7)
  00445a  486efff2             pea.l     -$e(a6)
  00445e  486efffc             pea.l     -$4(a6)
  004462  486efff4             pea.l     -$c(a6)
  004466  a98d                 _GetDialogItem 
  004468  2f2efffc             move.l    -$4(a6), -(a7)
  00446c  4267                 clr.w     -(a7)
  00446e  a963                 _SetControlValue 
  004470  2f0a                 move.l    a2, -(a7)
  004472  3f3c000f             move.w    #$f, -(a7)
  004476  486efff2             pea.l     -$e(a6)
  00447a  486efffc             pea.l     -$4(a6)
  00447e  486efff4             pea.l     -$c(a6)
  004482  a98d                 _GetDialogItem 
  004484  2f2efffc             move.l    -$4(a6), -(a7)
  004488  3f3c0001             move.w    #$1, -(a7)
  00448c  a963                 _SetControlValue 
  00448e  2f0a                 move.l    a2, -(a7)
  004490  3f3c000d             move.w    #$d, -(a7)
  004494  486efff2             pea.l     -$e(a6)
  004498  486efffc             pea.l     -$4(a6)
  00449c  486efff4             pea.l     -$c(a6)
  0044a0  a98d                 _GetDialogItem 
  0044a2  2f2efffc             move.l    -$4(a6), -(a7)
  0044a6  4267                 clr.w     -(a7)
  0044a8  a963                 _SetControlValue 
  0044aa  2f0a                 move.l    a2, -(a7)
  0044ac  3f3c0011             move.w    #$11, -(a7)
  0044b0  486efff2             pea.l     -$e(a6)
  0044b4  486efffc             pea.l     -$4(a6)
  0044b8  486efff4             pea.l     -$c(a6)
  0044bc  a98d                 _GetDialogItem 
  0044be  2f2efffc             move.l    -$4(a6), -(a7)
  0044c2  4267                 clr.w     -(a7)
  0044c4  a963                 _SetControlValue 
  0044c6  6000014a             bra.w     $4612
  0044ca  2f0a                 move.l    a2, -(a7)
  0044cc  3f3c000c             move.w    #$c, -(a7)
  0044d0  486efff2             pea.l     -$e(a6)
  0044d4  486efffc             pea.l     -$4(a6)
  0044d8  486efff4             pea.l     -$c(a6)
  0044dc  a98d                 _GetDialogItem 
  0044de  2f2efffc             move.l    -$4(a6), -(a7)
  0044e2  4267                 clr.w     -(a7)
  0044e4  a963                 _SetControlValue 
  0044e6  2f0a                 move.l    a2, -(a7)
  0044e8  3f3c000f             move.w    #$f, -(a7)
  0044ec  486efff2             pea.l     -$e(a6)
  0044f0  486efffc             pea.l     -$4(a6)
  0044f4  486efff4             pea.l     -$c(a6)
  0044f8  a98d                 _GetDialogItem 
  0044fa  2f2efffc             move.l    -$4(a6), -(a7)
  0044fe  4267                 clr.w     -(a7)
  004500  a963                 _SetControlValue 
  004502  2f0a                 move.l    a2, -(a7)
  004504  3f3c000d             move.w    #$d, -(a7)
  004508  486efff2             pea.l     -$e(a6)
  00450c  486efffc             pea.l     -$4(a6)
  004510  486efff4             pea.l     -$c(a6)
  004514  a98d                 _GetDialogItem 
  004516  2f2efffc             move.l    -$4(a6), -(a7)
  00451a  3f3c0001             move.w    #$1, -(a7)
  00451e  a963                 _SetControlValue 
  004520  2f0a                 move.l    a2, -(a7)
  004522  3f3c0011             move.w    #$11, -(a7)
  004526  486efff2             pea.l     -$e(a6)
  00452a  486efffc             pea.l     -$4(a6)
  00452e  486efff4             pea.l     -$c(a6)
  004532  a98d                 _GetDialogItem 
  004534  2f2efffc             move.l    -$4(a6), -(a7)
  004538  4267                 clr.w     -(a7)
  00453a  a963                 _SetControlValue 
  00453c  600000d4             bra.w     $4612
  004540  2f0a                 move.l    a2, -(a7)
  004542  3f3c000c             move.w    #$c, -(a7)
  004546  486efff2             pea.l     -$e(a6)
  00454a  486efffc             pea.l     -$4(a6)
  00454e  486efff4             pea.l     -$c(a6)
  004552  a98d                 _GetDialogItem 
  004554  2f2efffc             move.l    -$4(a6), -(a7)
  004558  4267                 clr.w     -(a7)
  00455a  a963                 _SetControlValue 
  00455c  2f0a                 move.l    a2, -(a7)
  00455e  3f3c000f             move.w    #$f, -(a7)
  004562  486efff2             pea.l     -$e(a6)
  004566  486efffc             pea.l     -$4(a6)
  00456a  486efff4             pea.l     -$c(a6)
  00456e  a98d                 _GetDialogItem 
  004570  2f2efffc             move.l    -$4(a6), -(a7)
  004574  4267                 clr.w     -(a7)
  004576  a963                 _SetControlValue 
  004578  2f0a                 move.l    a2, -(a7)
  00457a  3f3c000d             move.w    #$d, -(a7)
  00457e  486efff2             pea.l     -$e(a6)
  004582  486efffc             pea.l     -$4(a6)
  004586  486efff4             pea.l     -$c(a6)
  00458a  a98d                 _GetDialogItem 
  00458c  2f2efffc             move.l    -$4(a6), -(a7)
  004590  4267                 clr.w     -(a7)
  004592  a963                 _SetControlValue 
  004594  2f0a                 move.l    a2, -(a7)
  004596  3f3c0011             move.w    #$11, -(a7)
  00459a  486efff2             pea.l     -$e(a6)
  00459e  486efffc             pea.l     -$4(a6)
  0045a2  486efff4             pea.l     -$c(a6)
  0045a6  a98d                 _GetDialogItem 
  0045a8  2f2efffc             move.l    -$4(a6), -(a7)
  0045ac  3f3c0001             move.w    #$1, -(a7)
  0045b0  a963                 _SetControlValue 
  0045b2  605e                 bra.b     $4612
  0045b4  33fc00010000584a     move.w    #$1, $584a.l   ; g_584a
  0045bc  2f0a                 move.l    a2, -(a7)
  0045be  3f3c000c             move.w    #$c, -(a7)
  0045c2  486efff2             pea.l     -$e(a6)
  0045c6  486efffc             pea.l     -$4(a6)
  0045ca  486efff4             pea.l     -$c(a6)
  0045ce  a98d                 _GetDialogItem 
  0045d0  2f2efffc             move.l    -$4(a6), -(a7)
  0045d4  3f3c0001             move.w    #$1, -(a7)
  0045d8  a963                 _SetControlValue 
  0045da  2f0a                 move.l    a2, -(a7)
  0045dc  3f3c000f             move.w    #$f, -(a7)
  0045e0  486efff2             pea.l     -$e(a6)
  0045e4  486efffc             pea.l     -$4(a6)
  0045e8  486efff4             pea.l     -$c(a6)
  0045ec  a98d                 _GetDialogItem 
  0045ee  2f2efffc             move.l    -$4(a6), -(a7)
  0045f2  4267                 clr.w     -(a7)
  0045f4  a963                 _SetControlValue 
  0045f6  2f0a                 move.l    a2, -(a7)
  0045f8  3f3c000d             move.w    #$d, -(a7)
  0045fc  486efff2             pea.l     -$e(a6)
  004600  486efffc             pea.l     -$4(a6)
  004604  486efff4             pea.l     -$c(a6)
  004608  a98d                 _GetDialogItem 
  00460a  2f2efffc             move.l    -$4(a6), -(a7)
  00460e  4267                 clr.w     -(a7)
  004610  a963                 _SetControlValue 
  004612  2f0a                 move.l    a2, -(a7)
  004614  61fffffff2f2         bsr.l     $3908   ; UpdateDisabledItems
  00461a  584f                 addq.w    #$4, a7
  00461c  60000186             bra.w     $47a4
  004620  3f3c000e             move.w    #$e, -(a7)
  004624  2f0a                 move.l    a2, -(a7)
  004626  3f3900005860         move.w    $5860.l, -(a7)   ; g_5860
  00462c  61ff00000190         bsr.l     $47be   ; ConvertKeyName
  004632  3f3c000d             move.w    #$d, -(a7)
  004636  2f0a                 move.l    a2, -(a7)
  004638  3f390000585e         move.w    $585e.l, -(a7)   ; g_585e
  00463e  61ff0000017e         bsr.l     $47be   ; ConvertKeyName
  004644  3f3c000c             move.w    #$c, -(a7)
  004648  2f0a                 move.l    a2, -(a7)
  00464a  3f390000585c         move.w    $585c.l, -(a7)   ; g_585c
  004650  61ff0000016c         bsr.l     $47be   ; ConvertKeyName
  004656  3f3c000b             move.w    #$b, -(a7)
  00465a  2f0a                 move.l    a2, -(a7)
  00465c  3f390000585a         move.w    $585a.l, -(a7)   ; g_585a
  004662  61ff0000015a         bsr.l     $47be   ; ConvertKeyName
  004668  3f3c000a             move.w    #$a, -(a7)
  00466c  2f0a                 move.l    a2, -(a7)
  00466e  3f3900005858         move.w    $5858.l, -(a7)   ; g_5858
  004674  61ff00000148         bsr.l     $47be   ; ConvertKeyName
  00467a  3f3c0009             move.w    #$9, -(a7)
  00467e  2f0a                 move.l    a2, -(a7)
  004680  3f3900005856         move.w    $5856.l, -(a7)   ; g_5856
  004686  61ff00000136         bsr.l     $47be   ; ConvertKeyName
  00468c  3f3c0008             move.w    #$8, -(a7)
  004690  2f0a                 move.l    a2, -(a7)
  004692  3f3900005854         move.w    $5854.l, -(a7)   ; g_5854
  004698  61ff00000124         bsr.l     $47be   ; ConvertKeyName
  00469e  3f3c0007             move.w    #$7, -(a7)
  0046a2  2f0a                 move.l    a2, -(a7)
  0046a4  3f3900005852         move.w    $5852.l, -(a7)   ; g_5852
  0046aa  61ff00000112         bsr.l     $47be   ; ConvertKeyName
  0046b0  2f0a                 move.l    a2, -(a7)
  0046b2  48780007             pea.l     $7.w
  0046b6  3f3c7fff             move.w    #$7fff, -(a7)
  0046ba  a97e                 _SelectDialogItemText 
  0046bc  4fef0040             lea.l     $40(a7), a7
  0046c0  600000e2             bra.w     $47a4
  0046c4  4a3900006ac0         tst.b     $6ac0.l   ; g_6ac0
  0046ca  6638                 bne.b     $4704
  0046cc  42390000584d         clr.b     $584d.l   ; g_584d
  0046d2  2f0a                 move.l    a2, -(a7)
  0046d4  3f3c0008             move.w    #$8, -(a7)
  0046d8  486efff2             pea.l     -$e(a6)
  0046dc  486efffc             pea.l     -$4(a6)
  0046e0  486efff4             pea.l     -$c(a6)
  0046e4  a98d                 _GetDialogItem 
  0046e6  2f0a                 move.l    a2, -(a7)
  0046e8  2f3c00850008         move.l    #$850008, -(a7)
  0046ee  2f2efffc             move.l    -$4(a6), -(a7)
  0046f2  486efff4             pea.l     -$c(a6)
  0046f6  a98e                 _SetDialogItem 
  0046f8  2f2efffc             move.l    -$4(a6), -(a7)
  0046fc  3f3c00ff             move.w    #$ff, -(a7)
  004700  a95d                 _HiliteControl 
  004702  6008                 bra.b     $470c
  004704  2f0a                 move.l    a2, -(a7)
  004706  3f3c000d             move.w    #$d, -(a7)
  00470a  a827                 _HideDialogItem 
  00470c  2f0a                 move.l    a2, -(a7)
  00470e  3f3c0007             move.w    #$7, -(a7)
  004712  486efff2             pea.l     -$e(a6)
  004716  486efffc             pea.l     -$4(a6)
  00471a  486efff4             pea.l     -$c(a6)
  00471e  a98d                 _GetDialogItem 
  004720  2f2efffc             move.l    -$4(a6), -(a7)
  004724  7000                 moveq     #$0, d0
  004726  10390000584c         move.b    $584c.l, d0   ; g_584c
  00472c  3f00                 move.w    d0, -(a7)
  00472e  a963                 _SetControlValue 
  004730  2f0a                 move.l    a2, -(a7)
  004732  3f3c0008             move.w    #$8, -(a7)
  004736  486efff2             pea.l     -$e(a6)
  00473a  486efffc             pea.l     -$4(a6)
  00473e  486efff4             pea.l     -$c(a6)
  004742  a98d                 _GetDialogItem 
  004744  2f2efffc             move.l    -$4(a6), -(a7)
  004748  7000                 moveq     #$0, d0
  00474a  10390000584d         move.b    $584d.l, d0   ; g_584d
  004750  3f00                 move.w    d0, -(a7)
  004752  a963                 _SetControlValue 
  004754  2f0a                 move.l    a2, -(a7)
  004756  3f3c0009             move.w    #$9, -(a7)
  00475a  486efff2             pea.l     -$e(a6)
  00475e  486efffc             pea.l     -$4(a6)
  004762  486efff4             pea.l     -$c(a6)
  004766  a98d                 _GetDialogItem 
  004768  2f2efffc             move.l    -$4(a6), -(a7)
  00476c  30390000584e         move.w    $584e.l, d0   ; g_584e
  004772  48c0                 ext.l     d0
  004774  720a                 moveq     #$a, d1
  004776  9280                 sub.l     d0, d1
  004778  3f01                 move.w    d1, -(a7)
  00477a  a963                 _SetControlValue 
  00477c  2f0a                 move.l    a2, -(a7)
  00477e  3f3c000a             move.w    #$a, -(a7)
  004782  486efff2             pea.l     -$e(a6)
  004786  486efffc             pea.l     -$4(a6)
  00478a  486efff4             pea.l     -$c(a6)
  00478e  a98d                 _GetDialogItem 
  004790  2f2efffc             move.l    -$4(a6), -(a7)
  004794  303900005850         move.w    $5850.l, d0   ; g_5850
  00479a  48c0                 ext.l     d0
  00479c  720a                 moveq     #$a, d1
  00479e  9280                 sub.l     d0, d1
  0047a0  3f01                 move.w    d1, -(a7)
  0047a2  a963                 _SetControlValue 
  0047a4  245f                 movea.l   (a7)+, a2
  0047a6  4e5e                 unlk      a6
  0047a8  4e75                 rts       

;-------------------------------------------------------------
; ConvertKeyName   (seg 6 +0047be, 972 bytes)
  0047be  4e56fef2             link.w    a6, #$fef2
  0047c2  48e71830             movem.l   d3-d4/a2-a3, -(a7)
  0047c6  246e000a             movea.l   $a(a6), a2
  0047ca  382e000e             move.w    $e(a6), d4
  0047ce  2f0a                 move.l    a2, -(a7)
  0047d0  3f04                 move.w    d4, -(a7)
  0047d2  486efef2             pea.l     -$10e(a6)
  0047d6  486efffc             pea.l     -$4(a6)
  0047da  486efef4             pea.l     -$10c(a6)
  0047de  a98d                 _GetDialogItem 
  0047e0  302e0008             move.w    $8(a6), d0
  0047e4  48c0                 ext.l     d0
  0047e6  048000000024         subi.l    #$24, d0
  0047ec  670000de             beq.w     $48cc
  0047f0  5180                 subq.l    #$8, d0
  0047f2  5980                 subq.l    #$4, d0
  0047f4  670000f6             beq.w     $48ec
  0047f8  5380                 subq.l    #$1, d0
  0047fa  67000180             beq.w     $497c
  0047fe  5380                 subq.l    #$1, d0
  004800  67000308             beq.w     $4b0a
  004804  5380                 subq.l    #$1, d0
  004806  67000184             beq.w     $498c
  00480a  5580                 subq.l    #$2, d0
  00480c  670000ce             beq.w     $48dc
  004810  5580                 subq.l    #$2, d0
  004812  67000128             beq.w     $493c
  004816  5380                 subq.l    #$1, d0
  004818  67000132             beq.w     $494c
  00481c  5580                 subq.l    #$2, d0
  00481e  6700013c             beq.w     $495c
  004822  5380                 subq.l    #$1, d0
  004824  67000146             beq.w     $496c
  004828  5180                 subq.l    #$8, d0
  00482a  5980                 subq.l    #$4, d0
  00482c  6700016e             beq.w     $499c
  004830  5b80                 subq.l    #$5, d0
  004832  67000178             beq.w     $49ac
  004836  048000000014         subi.l    #$14, d0
  00483c  6700021e             beq.w     $4a5c
  004840  5380                 subq.l    #$1, d0
  004842  67000228             beq.w     $4a6c
  004846  5380                 subq.l    #$1, d0
  004848  67000232             beq.w     $4a7c
  00484c  5380                 subq.l    #$1, d0
  00484e  670001ec             beq.w     $4a3c
  004852  5380                 subq.l    #$1, d0
  004854  67000236             beq.w     $4a8c
  004858  5380                 subq.l    #$1, d0
  00485a  67000240             beq.w     $4a9c
  00485e  5580                 subq.l    #$2, d0
  004860  6700025a             beq.w     $4abc
  004864  5580                 subq.l    #$2, d0
  004866  67000274             beq.w     $4adc
  00486a  5580                 subq.l    #$2, d0
  00486c  6700027e             beq.w     $4aec
  004870  5580                 subq.l    #$2, d0
  004872  67000238             beq.w     $4aac
  004876  5580                 subq.l    #$2, d0
  004878  67000252             beq.w     $4acc
  00487c  5580                 subq.l    #$2, d0
  00487e  6700027c             beq.w     $4afc
  004882  5380                 subq.l    #$1, d0
  004884  67000136             beq.w     $49bc
  004888  5380                 subq.l    #$1, d0
  00488a  67000140             beq.w     $49cc
  00488e  5380                 subq.l    #$1, d0
  004890  6700014a             beq.w     $49dc
  004894  5380                 subq.l    #$1, d0
  004896  67000154             beq.w     $49ec
  00489a  5380                 subq.l    #$1, d0
  00489c  670001ae             beq.w     $4a4c
  0048a0  5380                 subq.l    #$1, d0
  0048a2  67000158             beq.w     $49fc
  0048a6  5380                 subq.l    #$1, d0
  0048a8  67000182             beq.w     $4a2c
  0048ac  5380                 subq.l    #$1, d0
  0048ae  6700015c             beq.w     $4a0c
  0048b2  5380                 subq.l    #$1, d0
  0048b4  67000166             beq.w     $4a1c
  0048b8  5380                 subq.l    #$1, d0
  0048ba  6770                 beq.b     $492c
  0048bc  5380                 subq.l    #$1, d0
  0048be  675c                 beq.b     $491c
  0048c0  5380                 subq.l    #$1, d0
  0048c2  6748                 beq.b     $490c
  0048c4  5380                 subq.l    #$1, d0
  0048c6  6734                 beq.b     $48fc
  0048c8  6000024e             bra.w     $4b18
  0048cc  2f2efffc             move.l    -$4(a6), -(a7)
  0048d0  487900000dae         pea.l     $dae.l   ; g_dae
  0048d6  a98f                 _SetDialogItemText 
  0048d8  600002a8             bra.w     $4b82
  0048dc  2f2efffc             move.l    -$4(a6), -(a7)
  0048e0  487900000daa         pea.l     $daa.l   ; g_daa
  0048e6  a98f                 _SetDialogItemText 
  0048e8  60000298             bra.w     $4b82
  0048ec  2f2efffc             move.l    -$4(a6), -(a7)
  0048f0  487900000da6         pea.l     $da6.l   ; g_da6
  0048f6  a98f                 _SetDialogItemText 
  0048f8  60000288             bra.w     $4b82
  0048fc  2f2efffc             move.l    -$4(a6), -(a7)
  004900  487900000d9d         pea.l     $d9d.l   ; g_d9d
  004906  a98f                 _SetDialogItemText 
  004908  60000278             bra.w     $4b82
  00490c  2f2efffc             move.l    -$4(a6), -(a7)
  004910  487900000d92         pea.l     $d92.l   ; g_d92
  004916  a98f                 _SetDialogItemText 
  004918  60000268             bra.w     $4b82
  00491c  2f2efffc             move.l    -$4(a6), -(a7)
  004920  487900000d86         pea.l     $d86.l   ; g_d86
  004926  a98f                 _SetDialogItemText 
  004928  60000258             bra.w     $4b82
  00492c  2f2efffc             move.l    -$4(a6), -(a7)
  004930  487900000d7a         pea.l     $d7a.l   ; g_d7a
  004936  a98f                 _SetDialogItemText 
  004938  60000248             bra.w     $4b82
  00493c  2f2efffc             move.l    -$4(a6), -(a7)
  004940  487900000d72         pea.l     $d72.l   ; g_d72
  004946  a98f                 _SetDialogItemText 
  004948  60000238             bra.w     $4b82
  00494c  2f2efffc             move.l    -$4(a6), -(a7)
  004950  487900000d6c         pea.l     $d6c.l   ; g_d6c
  004956  a98f                 _SetDialogItemText 
  004958  60000228             bra.w     $4b82
  00495c  2f2efffc             move.l    -$4(a6), -(a7)
  004960  487900000d64         pea.l     $d64.l   ; g_d64
  004966  a98f                 _SetDialogItemText 
  004968  60000218             bra.w     $4b82
  00496c  2f2efffc             move.l    -$4(a6), -(a7)
  004970  487900000d5c         pea.l     $d5c.l   ; g_d5c
  004976  a98f                 _SetDialogItemText 
  004978  60000208             bra.w     $4b82
  00497c  2f2efffc             move.l    -$4(a6), -(a7)
  004980  487900000d52         pea.l     $d52.l   ; g_d52
  004986  a98f                 _SetDialogItemText 
  004988  600001f8             bra.w     $4b82
  00498c  2f2efffc             move.l    -$4(a6), -(a7)
  004990  487900000d4a         pea.l     $d4a.l   ; g_d4a
  004996  a98f                 _SetDialogItemText 
  004998  600001e8             bra.w     $4b82
  00499c  2f2efffc             move.l    -$4(a6), -(a7)
  0049a0  487900000d44         pea.l     $d44.l   ; g_d44
  0049a6  a98f                 _SetDialogItemText 
  0049a8  600001d8             bra.w     $4b82
  0049ac  2f2efffc             move.l    -$4(a6), -(a7)
  0049b0  487900000d3e         pea.l     $d3e.l   ; g_d3e
  0049b6  a98f                 _SetDialogItemText 
  0049b8  600001c8             bra.w     $4b82
  0049bc  2f2efffc             move.l    -$4(a6), -(a7)
  0049c0  487900000d39         pea.l     $d39.l   ; g_d39
  0049c6  a98f                 _SetDialogItemText 
  0049c8  600001b8             bra.w     $4b82
  0049cc  2f2efffc             move.l    -$4(a6), -(a7)
  0049d0  487900000d34         pea.l     $d34.l   ; g_d34
  0049d6  a98f                 _SetDialogItemText 
  0049d8  600001a8             bra.w     $4b82
  0049dc  2f2efffc             move.l    -$4(a6), -(a7)
  0049e0  487900000d2c         pea.l     $d2c.l   ; g_d2c
  0049e6  a98f                 _SetDialogItemText 
  0049e8  60000198             bra.w     $4b82
  0049ec  2f2efffc             move.l    -$4(a6), -(a7)
  0049f0  487900000d28         pea.l     $d28.l   ; g_d28
  0049f6  a98f                 _SetDialogItemText 
  0049f8  60000188             bra.w     $4b82
  0049fc  2f2efffc             move.l    -$4(a6), -(a7)
  004a00  487900000d24         pea.l     $d24.l   ; g_d24
  004a06  a98f                 _SetDialogItemText 
  004a08  60000178             bra.w     $4b82
  004a0c  2f2efffc             move.l    -$4(a6), -(a7)
  004a10  487900000d1a         pea.l     $d1a.l   ; g_d1a
  004a16  a98f                 _SetDialogItemText 
  004a18  60000168             bra.w     $4b82
  004a1c  2f2efffc             move.l    -$4(a6), -(a7)
  004a20  487900000d16         pea.l     $d16.l   ; g_d16
  004a26  a98f                 _SetDialogItemText 
  004a28  60000158             bra.w     $4b82
  004a2c  2f2efffc             move.l    -$4(a6), -(a7)
  004a30  487900000d13         pea.l     $d13.l   ; g_d13
  004a36  a98f                 _SetDialogItemText 
  004a38  60000148             bra.w     $4b82
  004a3c  2f2efffc             move.l    -$4(a6), -(a7)
  004a40  487900000d10         pea.l     $d10.l   ; g_d10
  004a46  a98f                 _SetDialogItemText 
  004a48  60000138             bra.w     $4b82
  004a4c  2f2efffc             move.l    -$4(a6), -(a7)
  004a50  487900000d0d         pea.l     $d0d.l   ; g_d0d
  004a56  a98f                 _SetDialogItemText 
  004a58  60000128             bra.w     $4b82
  004a5c  2f2efffc             move.l    -$4(a6), -(a7)
  004a60  487900000d0a         pea.l     $d0a.l   ; g_d0a
  004a66  a98f                 _SetDialogItemText 
  004a68  60000118             bra.w     $4b82
  004a6c  2f2efffc             move.l    -$4(a6), -(a7)
  004a70  487900000d07         pea.l     $d07.l   ; g_d07
  004a76  a98f                 _SetDialogItemText 
  004a78  60000108             bra.w     $4b82
  004a7c  2f2efffc             move.l    -$4(a6), -(a7)
  004a80  487900000d04         pea.l     $d04.l   ; g_d04
  004a86  a98f                 _SetDialogItemText 
  004a88  600000f8             bra.w     $4b82
  004a8c  2f2efffc             move.l    -$4(a6), -(a7)
  004a90  487900000d01         pea.l     $d01.l   ; g_d01
  004a96  a98f                 _SetDialogItemText 
  004a98  600000e8             bra.w     $4b82
  004a9c  2f2efffc             move.l    -$4(a6), -(a7)
  004aa0  487900000cfe         pea.l     $cfe.l   ; g_cfe
  004aa6  a98f                 _SetDialogItemText 
  004aa8  600000d8             bra.w     $4b82
  004aac  2f2efffc             move.l    -$4(a6), -(a7)
  004ab0  487900000cfa         pea.l     $cfa.l   ; g_cfa
  004ab6  a98f                 _SetDialogItemText 
  004ab8  600000c8             bra.w     $4b82
  004abc  2f2efffc             move.l    -$4(a6), -(a7)
  004ac0  487900000cf6         pea.l     $cf6.l   ; g_cf6
  004ac6  a98f                 _SetDialogItemText 
  004ac8  600000b8             bra.w     $4b82
  004acc  2f2efffc             move.l    -$4(a6), -(a7)
  004ad0  487900000cf2         pea.l     $cf2.l   ; g_cf2
  004ad6  a98f                 _SetDialogItemText 
  004ad8  600000a8             bra.w     $4b82
  004adc  2f2efffc             move.l    -$4(a6), -(a7)
  004ae0  487900000cee         pea.l     $cee.l   ; g_cee
  004ae6  a98f                 _SetDialogItemText 
  004ae8  60000098             bra.w     $4b82
  004aec  2f2efffc             move.l    -$4(a6), -(a7)
  004af0  487900000cea         pea.l     $cea.l   ; g_cea
  004af6  a98f                 _SetDialogItemText 
  004af8  60000088             bra.w     $4b82
  004afc  2f2efffc             move.l    -$4(a6), -(a7)
  004b00  487900000ce6         pea.l     $ce6.l   ; g_ce6
  004b06  a98f                 _SetDialogItemText 
  004b08  6078                 bra.b     $4b82
  004b0a  2f2efffc             move.l    -$4(a6), -(a7)
  004b0e  487900000ce4         pea.l     $ce4.l   ; g_ce4
  004b14  a98f                 _SetDialogItemText 
  004b16  606a                 bra.b     $4b82
  004b18  594f                 subq.w    #$4, a7
  004b1a  3f3c0026             move.w    #$26, -(a7)
  004b1e  2f3c84020008         move.l    #$84020008, -(a7)
  004b24  a8b5                 _trap_a8b5 
  004b26  201f                 move.l    (a7)+, d0
  004b28  2640                 movea.l   d0, a3
  004b2a  486e0008             pea.l     $8(a6)
  004b2e  48780008             pea.l     $8.w
  004b32  a85e                 _BitSet   
  004b34  594f                 subq.w    #$4, a7
  004b36  2f0b                 move.l    a3, -(a7)
  004b38  3f2e0008             move.w    $8(a6), -(a7)
  004b3c  42a7                 clr.l     -(a7)
  004b3e  a9c3                 _KeyTranslate 
  004b40  201f                 move.l    (a7)+, d0
  004b42  2600                 move.l    d0, d3
  004b44  2f0a                 move.l    a2, -(a7)
  004b46  3f04                 move.w    d4, -(a7)
  004b48  2f3c7fff0000         move.l    #$7fff0000, -(a7)
  004b4e  a97e                 _SelectDialogItemText 
  004b50  2003                 move.l    d3, d0
  004b52  02800000ffff         andi.l    #$ffff, d0
  004b58  3f00                 move.w    d0, -(a7)
  004b5a  2f2a00a0             move.l    $a0(a2), -(a7)
  004b5e  a9dc                 _trap_a9dc 
  004b60  2f2efffc             move.l    -$4(a6), -(a7)
  004b64  486efefc             pea.l     -$104(a6)
  004b68  a990                 _GetDialogItemText 
  004b6a  486efefc             pea.l     -$104(a6)
  004b6e  1f3c0001             move.b    #$1, -(a7)
  004b72  4eb900000388         jsr       $388.l   ; seg4+704
  004b78  2f2efffc             move.l    -$4(a6), -(a7)
  004b7c  486efefc             pea.l     -$104(a6)
  004b80  a98f                 _SetDialogItemText 
  004b82  4cdf0c18             movem.l   (a7)+, d3-d4/a2-a3
  004b86  4e5e                 unlk      a6
  004b88  4e75                 rts       

;-------------------------------------------------------------
; BUILDFACEINOFFSCREEN   (seg 6 +004b9c, 794 bytes)
  004b9c  4e560000             link.w    a6, #$0
  004ba0  48e71030             movem.l   d3/a2-a3, -(a7)
  004ba4  246e0018             movea.l   $18(a6), a2
  004ba8  162e0008             move.b    $8(a6), d3
  004bac  206e000c             movea.l   $c(a6), a0
  004bb0  32680002             movea.w   $2(a0), a1
  004bb4  2009                 move.l    a1, d0
  004bb6  e480                 asr.l     #$2, d0
  004bb8  e088                 lsr.l     #$8, d0
  004bba  e088                 lsr.l     #$8, d0
  004bbc  e088                 lsr.l     #$8, d0
  004bbe  ea88                 lsr.l     #$5, d0
  004bc0  d089                 add.l     a1, d0
  004bc2  e680                 asr.l     #$3, d0
  004bc4  206e000c             movea.l   $c(a6), a0
  004bc8  226e0010             movea.l   $10(a6), a1
  004bcc  32290018             move.w    $18(a1), d1
  004bd0  c3d0                 muls.w    (a0), d1
  004bd2  206e0010             movea.l   $10(a6), a0
  004bd6  d2a80014             add.l     $14(a0), d1
  004bda  d280                 add.l     d0, d1
  004bdc  25410006             move.l    d1, $6(a2)
  004be0  206e0010             movea.l   $10(a6), a0
  004be4  35680018000a         move.w    $18(a0), $a(a2)
  004bea  206e000c             movea.l   $c(a6), a0
  004bee  2550000c             move.l    (a0), $c(a2)
  004bf2  256800040010         move.l    $4(a0), $10(a2)
  004bf8  486a000c             pea.l     $c(a2)
  004bfc  302a000e             move.w    $e(a2), d0
  004c00  4440                 neg.w     d0
  004c02  3f00                 move.w    d0, -(a7)
  004c04  302a000c             move.w    $c(a2), d0
  004c08  4440                 neg.w     d0
  004c0a  3f00                 move.w    d0, -(a7)
  004c0c  a8a8                 _OffsetRect 
  004c0e  0c790001ffffe860     cmpi.w    #$1, $ffffe860.l   ; g_-17a0
  004c16  6600008c             bne.w     $4ca4
  004c1a  594f                 subq.w    #$4, a7
  004c1c  4878000e             pea.l     $e.w
  004c20  201f                 move.l    (a7)+, d0
  004c22  a31e                 _NewPtr   
  004c24  2e88                 move.l    a0, (a7)
  004c26  205f                 movea.l   (a7)+, a0
  004c28  2488                 move.l    a0, (a2)
  004c2a  4a92                 tst.l     (a2)
  004c2c  6700023c             beq.w     $4e6a
  004c30  2052                 movea.l   (a2), a0
  004c32  216a000c0006         move.l    $c(a2), $6(a0)
  004c38  216a0010000a         move.l    $10(a2), $a(a0)
  004c3e  206e0014             movea.l   $14(a6), a0
  004c42  2252                 movea.l   (a2), a1
  004c44  336800180004         move.w    $18(a0), $4(a1)
  004c4a  206e000c             movea.l   $c(a6), a0
  004c4e  32680002             movea.w   $2(a0), a1
  004c52  2009                 move.l    a1, d0
  004c54  e480                 asr.l     #$2, d0
  004c56  e088                 lsr.l     #$8, d0
  004c58  e088                 lsr.l     #$8, d0
  004c5a  e088                 lsr.l     #$8, d0
  004c5c  ea88                 lsr.l     #$5, d0
  004c5e  d089                 add.l     a1, d0
  004c60  e680                 asr.l     #$3, d0
  004c62  206e000c             movea.l   $c(a6), a0
  004c66  226e0014             movea.l   $14(a6), a1
  004c6a  32290018             move.w    $18(a1), d1
  004c6e  c3d0                 muls.w    (a0), d1
  004c70  206e0014             movea.l   $14(a6), a0
  004c74  d2a80014             add.l     $14(a0), d1
  004c78  d280                 add.l     d0, d1
  004c7a  2052                 movea.l   (a2), a0
  004c7c  2081                 move.l    d1, (a0)
  004c7e  4a03                 tst.b     d3
  004c80  670001e8             beq.w     $4e6a
  004c84  2f2e000c             move.l    $c(a6), -(a7)
  004c88  2052                 movea.l   (a2), a0
  004c8a  2f10                 move.l    (a0), -(a7)
  004c8c  2052                 movea.l   (a2), a0
  004c8e  3f280004             move.w    $4(a0), -(a7)
  004c92  486a001e             pea.l     $1e(a2)
  004c96  3f3c0001             move.w    #$1, -(a7)
  004c9a  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004ca0  600001c8             bra.w     $4e6a
  004ca4  0c790004ffffe860     cmpi.w    #$4, $ffffe860.l   ; g_-17a0
  004cac  66000146             bne.w     $4df4
  004cb0  594f                 subq.w    #$4, a7
  004cb2  48780028             pea.l     $28.w
  004cb6  201f                 move.l    (a7)+, d0
  004cb8  a31e                 _NewPtr   
  004cba  2e88                 move.l    a0, (a7)
  004cbc  205f                 movea.l   (a7)+, a0
  004cbe  2488                 move.l    a0, (a2)
  004cc0  4a92                 tst.l     (a2)
  004cc2  670001a6             beq.w     $4e6a
  004cc6  2652                 movea.l   (a2), a3
  004cc8  206e0014             movea.l   $14(a6), a0
  004ccc  356800180014         move.w    $18(a0), $14(a2)
  004cd2  206e000c             movea.l   $c(a6), a0
  004cd6  30280002             move.w    $2(a0), d0
  004cda  c1f9ffffe860         muls.w    $ffffe860.l, d0   ; g_-17a0
  004ce0  48c0                 ext.l     d0
  004ce2  2200                 move.l    d0, d1
  004ce4  e481                 asr.l     #$2, d1
  004ce6  e089                 lsr.l     #$8, d1
  004ce8  e089                 lsr.l     #$8, d1
  004cea  e089                 lsr.l     #$8, d1
  004cec  ea89                 lsr.l     #$5, d1
  004cee  d280                 add.l     d0, d1
  004cf0  e681                 asr.l     #$3, d1
  004cf2  206e000c             movea.l   $c(a6), a0
  004cf6  226e0014             movea.l   $14(a6), a1
  004cfa  30290018             move.w    $18(a1), d0
  004cfe  c1d0                 muls.w    (a0), d0
  004d00  206e0014             movea.l   $14(a6), a0
  004d04  d0a80014             add.l     $14(a0), d0
  004d08  d081                 add.l     d1, d0
  004d0a  2680                 move.l    d0, (a3)
  004d0c  4a03                 tst.b     d3
  004d0e  6718                 beq.b     $4d28
  004d10  2f2e000c             move.l    $c(a6), -(a7)
  004d14  2f13                 move.l    (a3), -(a7)
  004d16  3f2a0014             move.w    $14(a2), -(a7)
  004d1a  486a001e             pea.l     $1e(a2)
  004d1e  3f3c0004             move.w    #$4, -(a7)
  004d22  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004d28  206e0014             movea.l   $14(a6), a0
  004d2c  376800180016         move.w    $18(a0), $16(a3)
  004d32  206e000c             movea.l   $c(a6), a0
  004d36  30280002             move.w    $2(a0), d0
  004d3a  c1f9ffffe860         muls.w    $ffffe860.l, d0   ; g_-17a0
  004d40  48c0                 ext.l     d0
  004d42  2200                 move.l    d0, d1
  004d44  e481                 asr.l     #$2, d1
  004d46  e089                 lsr.l     #$8, d1
  004d48  e089                 lsr.l     #$8, d1
  004d4a  e089                 lsr.l     #$8, d1
  004d4c  ea89                 lsr.l     #$5, d1
  004d4e  d280                 add.l     d0, d1
  004d50  e681                 asr.l     #$3, d1
  004d52  206e000c             movea.l   $c(a6), a0
  004d56  226e0014             movea.l   $14(a6), a1
  004d5a  30290018             move.w    $18(a1), d0
  004d5e  c1d0                 muls.w    (a0), d0
  004d60  206e0014             movea.l   $14(a6), a0
  004d64  d0a80014             add.l     $14(a0), d0
  004d68  d081                 add.l     d1, d0
  004d6a  27400004             move.l    d0, $4(a3)
  004d6e  276a000c0018         move.l    $c(a2), $18(a3)
  004d74  276a0010001c         move.l    $10(a2), $1c(a3)
  004d7a  4a03                 tst.b     d3
  004d7c  671a                 beq.b     $4d98
  004d7e  486b0018             pea.l     $18(a3)
  004d82  2f2b0004             move.l    $4(a3), -(a7)
  004d86  3f2b0016             move.w    $16(a3), -(a7)
  004d8a  486b0020             pea.l     $20(a3)
  004d8e  3f3c0004             move.w    #$4, -(a7)
  004d92  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004d98  486a0006             pea.l     $6(a2)
  004d9c  486b0008             pea.l     $8(a3)
  004da0  4878000e             pea.l     $e.w
  004da4  201f                 move.l    (a7)+, d0
  004da6  225f                 movea.l   (a7)+, a1
  004da8  205f                 movea.l   (a7)+, a0
  004daa  a02e                 _BlockMove 
  004dac  42ab0020             clr.l     $20(a3)
  004db0  42ab0024             clr.l     $24(a3)
  004db4  4a03                 tst.b     d3
  004db6  671a                 beq.b     $4dd2
  004db8  486b000e             pea.l     $e(a3)
  004dbc  2f2b0008             move.l    $8(a3), -(a7)
  004dc0  3f2b000c             move.w    $c(a3), -(a7)
  004dc4  486b0024             pea.l     $24(a3)
  004dc8  3f3c0001             move.w    #$1, -(a7)
  004dcc  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004dd2  4a03                 tst.b     d3
  004dd4  67000094             beq.w     $4e6a
  004dd8  486a000c             pea.l     $c(a2)
  004ddc  2f2a0006             move.l    $6(a2), -(a7)
  004de0  3f2a000a             move.w    $a(a2), -(a7)
  004de4  486a0022             pea.l     $22(a2)
  004de8  3f3c0001             move.w    #$1, -(a7)
  004dec  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004df2  6076                 bra.b     $4e6a
  004df4  206e000c             movea.l   $c(a6), a0
  004df8  30280002             move.w    $2(a0), d0
  004dfc  c1f9ffffe860         muls.w    $ffffe860.l, d0   ; g_-17a0
  004e02  48c0                 ext.l     d0
  004e04  2200                 move.l    d0, d1
  004e06  e481                 asr.l     #$2, d1
  004e08  e089                 lsr.l     #$8, d1
  004e0a  e089                 lsr.l     #$8, d1
  004e0c  e089                 lsr.l     #$8, d1
  004e0e  ea89                 lsr.l     #$5, d1
  004e10  d280                 add.l     d0, d1
  004e12  e681                 asr.l     #$3, d1
  004e14  206e000c             movea.l   $c(a6), a0
  004e18  226e0014             movea.l   $14(a6), a1
  004e1c  30290018             move.w    $18(a1), d0
  004e20  c1d0                 muls.w    (a0), d0
  004e22  206e0014             movea.l   $14(a6), a0
  004e26  d0a80014             add.l     $14(a0), d0
  004e2a  d081                 add.l     d1, d0
  004e2c  2480                 move.l    d0, (a2)
  004e2e  4a03                 tst.b     d3
  004e30  671a                 beq.b     $4e4c
  004e32  2f2e000c             move.l    $c(a6), -(a7)
  004e36  2f12                 move.l    (a2), -(a7)
  004e38  3f2a0014             move.w    $14(a2), -(a7)
  004e3c  486a001e             pea.l     $1e(a2)
  004e40  3f39ffffe860         move.w    $ffffe860.l, -(a7)   ; g_-17a0
  004e46  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004e4c  4a03                 tst.b     d3
  004e4e  671a                 beq.b     $4e6a
  004e50  486a000c             pea.l     $c(a2)
  004e54  2f2a0006             move.l    $6(a2), -(a7)
  004e58  3f2a000a             move.w    $a(a2), -(a7)
  004e5c  486a0022             pea.l     $22(a2)
  004e60  3f3c0001             move.w    #$1, -(a7)
  004e64  4eb9000000a8         jsr       $a8.l   ; SATMAKEROWLIST
  004e6a  206e0014             movea.l   $14(a6), a0
  004e6e  356800180014         move.w    $18(a0), $14(a2)
  004e74  42aa0016             clr.l     $16(a2)
  004e78  4a2e000a             tst.b     $a(a6)
  004e7c  671a                 beq.b     $4e98
  004e7e  594f                 subq.w    #$4, a7
  004e80  a8d8                 _NewRgn   
  004e82  205f                 movea.l   (a7)+, a0
  004e84  2548001a             move.l    a0, $1a(a2)
  004e88  554f                 subq.w    #$2, a7
  004e8a  2f2a001a             move.l    $1a(a2), -(a7)
  004e8e  486a0006             pea.l     $6(a2)
  004e92  a8d7                 _BitMapToRegion 
  004e94  301f                 move.w    (a7)+, d0
  004e96  6004                 bra.b     $4e9c
  004e98  42aa001a             clr.l     $1a(a2)
  004e9c  42aa001e             clr.l     $1e(a2)
  004ea0  42aa0022             clr.l     $22(a2)
  004ea4  42aa0026             clr.l     $26(a2)
  004ea8  42aa002a             clr.l     $2a(a2)
  004eac  4cdf0c08             movem.l   (a7)+, d3/a2-a3
  004eb0  4e5e                 unlk      a6
  004eb2  4e740014             rtd       #$14

;-------------------------------------------------------------
; CREATEBWOFFSCREEN   (seg 6 +004ece, 244 bytes)
  004ece  4e56fff4             link.w    a6, #$fff4
  004ed2  2f0a                 move.l    a2, -(a7)
  004ed4  246e000c             movea.l   $c(a6), a2
  004ed8  206e0008             movea.l   $8(a6), a0
  004edc  2d50fff8             move.l    (a0), -$8(a6)
  004ee0  2d680004fffc         move.l    $4(a0), -$4(a6)
  004ee6  486efff4             pea.l     -$c(a6)
  004eea  a874                 _GetPort  
  004eec  42aa0004             clr.l     $4(a2)
  004ef0  594f                 subq.w    #$4, a7
  004ef2  4878006c             pea.l     $6c.w
  004ef6  201f                 move.l    (a7)+, d0
  004ef8  a11e                 _NewPtr   
  004efa  2e88                 move.l    a0, (a7)
  004efc  205f                 movea.l   (a7)+, a0
  004efe  2488                 move.l    a0, (a2)
  004f00  2f12                 move.l    (a2), -(a7)
  004f02  a86f                 _OpenPort 
  004f04  2052                 movea.l   (a2), a0
  004f06  216efff80010         move.l    -$8(a6), $10(a0)
  004f0c  216efffc0014         move.l    -$4(a6), $14(a0)
  004f12  2052                 movea.l   (a2), a0
  004f14  2252                 movea.l   (a2), a1
  004f16  236800100008         move.l    $10(a0), $8(a1)
  004f1c  23680014000c         move.l    $14(a0), $c(a1)
  004f22  2052                 movea.l   (a2), a0
  004f24  2f280018             move.l    $18(a0), -(a7)
  004f28  486efff8             pea.l     -$8(a6)
  004f2c  a8df                 _RectRgn  
  004f2e  486efff8             pea.l     -$8(a6)
  004f32  a87b                 _ClipRect 
  004f34  2052                 movea.l   (a2), a0
  004f36  2252                 movea.l   (a2), a1
  004f38  30290016             move.w    $16(a1), d0
  004f3c  90680012             sub.w     $12(a0), d0
  004f40  0640001f             addi.w    #$1f, d0
  004f44  48c0                 ext.l     d0
  004f46  2200                 move.l    d0, d1
  004f48  e881                 asr.l     #$4, d1
  004f4a  e089                 lsr.l     #$8, d1
  004f4c  e089                 lsr.l     #$8, d1
  004f4e  e089                 lsr.l     #$8, d1
  004f50  e689                 lsr.l     #$3, d1
  004f52  d280                 add.l     d0, d1
  004f54  ea81                 asr.l     #$5, d1
  004f56  4c3c180000000004     muls.l    #$4, d1
  004f5e  2052                 movea.l   (a2), a0
  004f60  31410006             move.w    d1, $6(a0)
  004f64  594f                 subq.w    #$4, a7
  004f66  2052                 movea.l   (a2), a0
  004f68  2252                 movea.l   (a2), a1
  004f6a  30280006             move.w    $6(a0), d0
  004f6e  2052                 movea.l   (a2), a0
  004f70  32280014             move.w    $14(a0), d1
  004f74  92690010             sub.w     $10(a1), d1
  004f78  c3c0                 muls.w    d0, d1
  004f7a  2f01                 move.l    d1, -(a7)
  004f7c  201f                 move.l    (a7)+, d0
  004f7e  a11e                 _NewPtr   
  004f80  2e88                 move.l    a0, (a7)
  004f82  205f                 movea.l   (a7)+, a0
  004f84  2252                 movea.l   (a2), a1
  004f86  23480002             move.l    a0, $2(a1)
  004f8a  2f12                 move.l    (a2), -(a7)
  004f8c  a873                 _SetPort  
  004f8e  2052                 movea.l   (a2), a0
  004f90  48680010             pea.l     $10(a0)
  004f94  a8a3                 _EraseRect 
  004f96  2052                 movea.l   (a2), a0
  004f98  256800020014         move.l    $2(a0), $14(a2)
  004f9e  2052                 movea.l   (a2), a0
  004fa0  25680008000c         move.l    $8(a0), $c(a2)
  004fa6  2568000c0010         move.l    $c(a0), $10(a2)
  004fac  2052                 movea.l   (a2), a0
  004fae  356800060018         move.w    $6(a0), $18(a2)
  004fb4  2f2efff4             move.l    -$c(a6), -(a7)
  004fb8  a873                 _SetPort  
  004fba  245f                 movea.l   (a7)+, a2
  004fbc  4e5e                 unlk      a6
  004fbe  4e740008             rtd       #$8

;-------------------------------------------------------------
; LOAD2DFACEARRAY   (seg 6 +004fd6, 404 bytes)
  004fd6  4e56ffb4             link.w    a6, #$ffb4
  004fda  48e71f38             movem.l   d3-d7/a2-a4, -(a7)
  004fde  362e0012             move.w    $12(a6), d3
  004fe2  3c2e000c             move.w    $c(a6), d6
  004fe6  42ae0018             clr.l     $18(a6)
  004fea  594f                 subq.w    #$4, a7
  004fec  3043                 movea.w   d3, a0
  004fee  702e                 moveq     #$2e, d0
  004ff0  2208                 move.l    a0, d1
  004ff2  4c010800             muls.l    d1, d0
  004ff6  2f00                 move.l    d0, -(a7)
  004ff8  201f                 move.l    (a7)+, d0
  004ffa  a11e                 _NewPtr   
  004ffc  2e88                 move.l    a0, (a7)
  004ffe  205f                 movea.l   (a7)+, a0
  005000  2448                 movea.l   a0, a2
  005002  200a                 move.l    a2, d0
  005004  6700015a             beq.w     $5160
  005008  594f                 subq.w    #$4, a7
  00500a  3f2e0016             move.w    $16(a6), -(a7)
  00500e  a9bc                 _GetPicture 
  005010  205f                 movea.l   (a7)+, a0
  005012  2648                 movea.l   a0, a3
  005014  594f                 subq.w    #$4, a7
  005016  3f2e0014             move.w    $14(a6), -(a7)
  00501a  a9bc                 _GetPicture 
  00501c  205f                 movea.l   (a7)+, a0
  00501e  2848                 movea.l   a0, a4
  005020  4a8c                 tst.l     a4
  005022  57c0                 seq.b     d0
  005024  4400                 neg.b     d0
  005026  4a8b                 tst.l     a3
  005028  57c1                 seq.b     d1
  00502a  4401                 neg.b     d1
  00502c  8200                 or.b      d0, d1
  00502e  66000130             bne.w     $5160
  005032  2f0b                 move.l    a3, -(a7)
  005034  205f                 movea.l   (a7)+, a0
  005036  a029                 _HLock    
  005038  2f0c                 move.l    a4, -(a7)
  00503a  205f                 movea.l   (a7)+, a0
  00503c  a029                 _HLock    
  00503e  2053                 movea.l   (a3), a0
  005040  2d680002ffb4         move.l    $2(a0), -$4c(a6)
  005046  2d680006ffb8         move.l    $6(a0), -$48(a6)
  00504c  486effb4             pea.l     -$4c(a6)
  005050  302effb6             move.w    -$4a(a6), d0
  005054  4440                 neg.w     d0
  005056  3f00                 move.w    d0, -(a7)
  005058  302effb4             move.w    -$4c(a6), d0
  00505c  4440                 neg.w     d0
  00505e  3f00                 move.w    d0, -(a7)
  005060  a8a8                 _OffsetRect 
  005062  486effc4             pea.l     -$3c(a6)
  005066  486effb4             pea.l     -$4c(a6)
  00506a  4eb9000000b0         jsr       $b0.l   ; SATMAKEOFFSCREEN
  005070  486effc4             pea.l     -$3c(a6)
  005074  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  00507a  2f0b                 move.l    a3, -(a7)
  00507c  486effb4             pea.l     -$4c(a6)
  005080  a8f6                 _DrawPicture 
  005082  2054                 movea.l   (a4), a0
  005084  2d680002ffbc         move.l    $2(a0), -$44(a6)
  00508a  2d680006ffc0         move.l    $6(a0), -$40(a6)
  005090  486effbc             pea.l     -$44(a6)
  005094  302effbe             move.w    -$42(a6), d0
  005098  4440                 neg.w     d0
  00509a  3f00                 move.w    d0, -(a7)
  00509c  302effbc             move.w    -$44(a6), d0
  0050a0  4440                 neg.w     d0
  0050a2  3f00                 move.w    d0, -(a7)
  0050a4  a8a8                 _OffsetRect 
  0050a6  486effde             pea.l     -$22(a6)
  0050aa  486effbc             pea.l     -$44(a6)
  0050ae  61fffffffe1e         bsr.l     $4ece   ; CREATEBWOFFSCREEN
  0050b4  486effde             pea.l     -$22(a6)
  0050b8  4eb9000000c8         jsr       $c8.l   ; SATSETPORT
  0050be  2f0c                 move.l    a4, -(a7)
  0050c0  486effbc             pea.l     -$44(a6)
  0050c4  a8f6                 _DrawPicture 
  0050c6  2f0b                 move.l    a3, -(a7)
  0050c8  205f                 movea.l   (a7)+, a0
  0050ca  a02a                 _HUnlock  
  0050cc  2f0c                 move.l    a4, -(a7)
  0050ce  205f                 movea.l   (a7)+, a0
  0050d0  a02a                 _HUnlock  
  0050d2  b7cc                 cmpa.l    a4, a3
  0050d4  670a                 beq.b     $50e0
  0050d6  2f0b                 move.l    a3, -(a7)
  0050d8  a9a3                 _ReleaseResource 
  0050da  2f0c                 move.l    a4, -(a7)
  0050dc  a9a3                 _ReleaseResource 
  0050de  6004                 bra.b     $50e4
  0050e0  2f0b                 move.l    a3, -(a7)
  0050e2  a9a3                 _ReleaseResource 
  0050e4  3e03                 move.w    d3, d7
  0050e6  5347                 subq.w    #$1, d7
  0050e8  7600                 moveq     #$0, d3
  0050ea  606c                 bra.b     $5158
  0050ec  3046                 movea.w   d6, a0
  0050ee  3243                 movea.w   d3, a1
  0050f0  2009                 move.l    a1, d0
  0050f2  2408                 move.l    a0, d2
  0050f4  4c420801             divsl.l   d2, d1:d0
  0050f8  3a01                 move.w    d1, d5
  0050fa  3046                 movea.w   d6, a0
  0050fc  3243                 movea.w   d3, a1
  0050fe  2809                 move.l    a1, d4
  005100  2208                 move.l    a0, d1
  005102  4c414804             divs.l    d1, d4
  005106  486efff8             pea.l     -$8(a6)
  00510a  7020                 moveq     #$20, d0
  00510c  c1c5                 muls.w    d5, d0
  00510e  3f00                 move.w    d0, -(a7)
  005110  7020                 moveq     #$20, d0
  005112  c1c4                 muls.w    d4, d0
  005114  3f00                 move.w    d0, -(a7)
  005116  7001                 moveq     #$1, d0
  005118  d045                 add.w     d5, d0
  00511a  c1fc0020             muls.w    #$20, d0
  00511e  3f00                 move.w    d0, -(a7)
  005120  7001                 moveq     #$1, d0
  005122  d044                 add.w     d4, d0
  005124  c1fc0020             muls.w    #$20, d0
  005128  3f00                 move.w    d0, -(a7)
  00512a  a8a7                 _SetRect  
  00512c  702e                 moveq     #$2e, d0
  00512e  c1c3                 muls.w    d3, d0
  005130  204a                 movea.l   a2, a0
  005132  d1c0                 adda.l    d0, a0
  005134  4850                 pea.l     (a0)
  005136  486effc4             pea.l     -$3c(a6)
  00513a  486effde             pea.l     -$22(a6)
  00513e  486efff8             pea.l     -$8(a6)
  005142  1f2e000a             move.b    $a(a6), -(a7)
  005146  1f2e0008             move.b    $8(a6), -(a7)
  00514a  61fffffffa50         bsr.l     $4b9c   ; BUILDFACEINOFFSCREEN
  005150  0c437fff             cmpi.w    #$7fff, d3
  005154  6706                 beq.b     $515c
  005156  5243                 addq.w    #$1, d3
  005158  b647                 cmp.w     d7, d3
  00515a  6f90                 ble.b     $50ec
  00515c  2d4a0018             move.l    a2, $18(a6)
  005160  4cdf1cf8             movem.l   (a7)+, d3-d7/a2-a4
  005164  4e5e                 unlk      a6
  005166  4e740010             rtd       #$10

;-------------------------------------------------------------
; _tail_517c   (seg 6 +00517c, 744 bytes)
  00517c  00000240             ori.b     #$40, d0
  005180  a9fa                 _trap_a9fa 
  005182  f9b8                 dc.w      $f9b8
  005184  faf9b38540b2         fbf.l     $b3859238
  00518a  dddd                 adda.l    (a5)+, a6
  00518c  dddd                 adda.l    (a5)+, a6
  00518e  df8e                 addx.l    -(a6), -(a7)
  005190  8ea3                 or.l      -(a3), d7
  005192  a3a3                 _trap_a3a3 
  005194  a340                 _ResrvMem 
  005196  52a985a6             addq.l    #$1, -$7a5a(a1)
  00519a  df8e                 addx.l    -(a6), -(a7)
  00519c  8e40                 or.w      d0, d7
  00519e  5240                 addq.w    #$1, d0
  0051a0  63b4                 bls.b     $5156
  0051a2  426ad9f8             clr.w     -$2608(a2)
  0051a6  7dfe                 dc.w      $7dfe
  0051a8  4241                 clr.w     d1
  0051aa  7fb8                 dc.w      $7fb8
  0051ac  c47e                 dc.w      $c47e
  0051ae  76fc                 moveq     #$fc, d3
  0051b0  fce4fd9bf08d         fbf.l     $fd9c423f
  0051b6  f741                 dc.w      $f741
  0051b8  647e                 bcc.b     $5238
  0051ba  9f41                 subx.w    d1, d7
  0051bc  49e97f3f             lea.l     $7f3f(a1), a4
  0051c0  c9fcf5fc             muls.w    #$f5fc, d4
  0051c4  f9fd                 dc.w      $f9fd
  0051c6  41ee7f5f             lea.l     $7f5f(a6), a0
  0051ca  7ef2                 moveq     #$f2, d7
  0051cc  d741                 addx.w    d1, d3
  0051ce  d27e                 dc.w      $d27e
  0051d0  51ec410b             sf.b      $410b(a4)
  0051d4  7ef8                 moveq     #$f8, d7
  0051d6  410b                 dc.w      $410b
  0051d8  7ef8                 moveq     #$f8, d7
  0051da  41b67fb2f97f59fde4fd chk.w     ([$f97f59fd, d7.l * 8], $e4fd), d0
  0051e4  f2fde4fddac5         fbf.l     $e4fe2cab
  0051ea  9441                 sub.w     d1, d2
  0051ec  c47f                 dc.w      $c47f
  0051ee  7df6                 dc.w      $7df6
  0051f0  7fa2                 dc.w      $7fa2
  0051f2  f9f7                 dc.w      $f9f7
  0051f4  edf57f8cd2b2         bfffo     -$4e(a5, a5.w * 2){6:12}, d7
  0051fa  f9ea                 dc.w      $f9ea
  0051fc  41ad7e77             chk.w     $7e77(a5), d0
  005200  e040                 asr.w     #$8, d0
  005202  80e1                 divu.w    -(a1), d0
  005204  efe1                 dc.w      $efe1
  005206  4045                 negx.w    d5
  005208  fdfe                 dc.w      $fdfe
  00520a  fdfe                 dc.w      $fdfe
  00520c  fddd                 dc.w      $fddd
  00520e  fdfe                 dc.w      $fdfe
  005210  fdfe                 dc.w      $fdfe
  005212  fd41                 dc.w      $fd41
  005214  617f                 bsr.b     $5295
  005216  3efd                 dc.w      $3efd
  005218  40a1                 negx.l    -(a1)
  00521a  7fba                 dc.w      $7fba
  00521c  7fb0                 dc.w      $7fb0
  00521e  408e                 dc.w      $408e
  005220  7f7a                 dc.w      $7f7a
  005222  408b                 dc.w      $408b
  005224  f8cffd7fb4a0         fbf.l     $fd8006c6
  00522a  e9fd                 dc.w      $e9fd
  00522c  fda1                 dc.w      $fda1
  00522e  f1fc                 dc.w      $f1fc
  005230  fc409a7f             ftrapueq.b d0
  005234  7140                 dc.w      $7140
  005236  937f                 dc.w      $937f
  005238  71b8                 dc.w      $71b8
  00523a  94f7408d             suba.w    -$73(a7, d4.w), a2
  00523e  f9f2                 dc.w      $f9f2
  005240  fcb7baf6             fbf.w     $d38
  005244  b0df                 cmpa.w    (a7)+, a0
  005246  4049                 dc.w      $4049
  005248  f64081fa             ftrapolt.b d0
  00524c  fdc3                 dc.w      $fdc3
  00524e  efe5                 dc.w      $efe5
  005250  40ee40dd             move.w    sr, $40dd(a6)
  005254  405e                 negx.w    (a6)+
  005256  7fb7                 dc.w      $7fb7
  005258  4046                 negx.w    d6
  00525a  4048                 dc.w      $4048
  00525c  f9ef                 dc.w      $f9ef
  00525e  f04071f9             ftrapoge.b d0
  005262  eff04079fafd         bfins     d4, -$3(a0, a7.l * 2){1:1}
  005268  d541                 addx.w    d1, d2
  00526a  abaf                 _trap_abaf 
  00526c  4052                 negx.w    (a2)
  00526e  ef41                 asl.w     #$7, d1
  005270  207f                 dc.w      $207f
  005272  90fb4070             suba.w    $52e4(pc, d4.w), a0
  005276  e1fd                 dc.w      $e1fd
  005278  fc7f                 dc.w      $fc7f
  00527a  be40                 cmp.w     d0, d7
  00527c  64fd                 bcc.b     $527b
  00527e  d8e1                 adda.w    -(a1), a4
  005280  faf5fbb2effc         fbf.l     $fbb3427e
  005286  fc96fdfc             fbf.w     $5084
  00528a  fcaef7a4             fbf.w     $4a30
  00528e  4151                 dc.w      $4151
  005290  7ec2                 moveq     #$c2, d7
  005292  8340f57f             pack      d0, d1, #$f57f
  005296  1089                 dc.w      $1089
  005298  85412d7e             pack      d1, d2, #$2d7e
  00529c  e8fd                 dc.w      $e8fd
  00529e  f385                 dc.w      $f385
  0052a0  410f                 dc.w      $410f
  0052a2  7fb5                 dc.w      $7fb5
  0052a4  e7d9                 rol.w     (a1)+
  0052a6  df7f                 dc.w      $df7f
  0052a8  ac85                 _DrawText 
  0052aa  40d4                 move.w    sr, (a4)
  0052ac  7f31                 dc.w      $7f31
  0052ae  40d4                 move.w    sr, (a4)
  0052b0  7fa5                 dc.w      $7fa5
  0052b2  7f8c                 dc.w      $7f8c
  0052b4  4077f6ee             negx.w    -$12(a7, a7.w * 8)
  0052b8  fd7f                 dc.w      $fd7f
  0052ba  bbfcfc40c7df         cmpa.l    #$fc40c7df, a5
  0052c0  eafd                 dc.w      $eafd
  0052c2  7f86                 dc.w      $7f86
  0052c4  fcfc408ac0df         fbf.l     $408b13a5
  0052ca  40af7fb5             negx.l    $7fb5(a7)
  0052ce  e7d9                 rol.w     (a1)+
  0052d0  df40                 addx.w    d0, d7
  0052d2  a97f                 _IsDialogEvent 
  0052d4  9caf4062             sub.l     $4062(a7), d6
  0052d8  9ce88484             suba.w    -$7b7c(a0), a6
  0052dc  ac84                 _DrawString 
  0052de  91f396f2             suba.l    -$e(a3, a1.w * 8), a0
  0052e2  fc9f8340             fbf.w     $ffffd624
  0052e6  43fac840             lea.l     $1b28(pc), a1
  0052ea  41c4                 dc.w      $41c4
  0052ec  9afaf5fb             suba.w    $48e9(pc), a5
  0052f0  a1fc                 _trap_a1fc 
  0052f2  fc93fcfc             fbf.w     $4ff0
  0052f6  ab41                 _trap_ab41 
  0052f8  46e7                 move.w    -(a7), sr
  0052fa  7fa8                 dc.w      $7fa8
  0052fc  e1e4                 asl.w     -(a4)
  0052fe  f0e7ebe8e3ee         fbf.l     $ebe936ee
  005304  8488                 dc.w      $8488
  005306  40ba                 dc.w      $40ba
  005308  40f1eb40             move.w    sr, (a1, invalid.w)
  00530c  46f54048             move.w    $48(a5, d4.w), sr
  005310  f440                 dc.w      $f440
  005312  88fc7f83             divu.w    #$7f83, d4
  005316  40ba                 dc.w      $40ba
  005318  e686                 asr.l     #$3, d6
  00531a  407d                 dc.w      $407d
  00531c  4205                 clr.b     d5
  00531e  83409afb             pack      d0, d1, #$9afb
  005322  fc41a0fb             ftrapole.b d1
  005326  d0fbdffbcefb7f7441087fa3 adda.w    ([$cefbd29c], $41087fa3), a0
  005332  7fb8                 dc.w      $7fb8
  005334  d4bc40f9f19a         add.l     #$40f9f19a, d2
  00533a  ee40                 asr.w     #$7, d0
  00533c  86e4                 divu.w    -(a4), d3
  00533e  e3e9407d             lsl.w     $407d(a1)
  005342  f297f040             fbf.w     $4384
  005346  7d7f                 dc.w      $7d7f
  005348  9b84                 subx.l    d4, d5
  00534a  405a                 negx.w    (a2)+
  00534c  f1eb                 dc.w      $f1eb
  00534e  f140                 dc.w      $f140
  005350  66f2                 bne.b     $5344
  005352  97f0407d             suba.l    $7d(a0, d4.w), a3
  005356  7f9b                 dc.w      $7f9b
  005358  8440                 or.w      d0, d2
  00535a  5af1ebf141437fb5     spl.b     ([$41437fb5])
  005362  f3ed                 dc.w      $f3ed
  005364  d7fcdf40b6f3         adda.l    #$df40b6f3, a3
  00536a  d8fcdf7f             adda.w    #$df7f, a4
  00536e  b6f340d8             cmpa.w    -$28(a3, d4.w), a3
  005372  83838292             unpk      d3, d1, #$8292
  005376  838295fc             unpk      d2, d1, #$95fc
  00537a  b3e8a6e6             cmpa.l    -$591a(a0), a1
  00537e  bb40                 eor.w     d5, d0
  005380  71b5                 dc.w      $71b5
  005382  41fc                 dc.w      $41fc
  005384  f2d3f2d0f2d0         fbf.l     $f2d14656
  00538a  f27f                 dc.w      $f27f
  00538c  3ff7                 dc.w      $3ff7
  00538e  b341                 eor.w     d1, d1
  005390  7bf7                 dc.w      $7bf7
  005392  e3e8dde6             lsl.w     -$221a(a0)
  005396  dce6                 adda.w    -(a6), a6
  005398  dce6                 adda.w    -(a6), a6
  00539a  4160                 dc.w      $4160
  00539c  7fb3                 dc.w      $7fb3
  00539e  409a                 negx.l    (a2)+
  0053a0  fd44                 dc.w      $fd44
  0053a2  127c                 dc.w      $127c
  0053a4  bbf77f424409         cmpa.l    ([a7], $4409), a5
  0053aa  e3fc                 dc.w      $e3fc
  0053ac  fdd9                 dc.w      $fdd9
  0053ae  f6fde3d7fbef         fbf.l     $e3d84f9f
  0053b4  f7fb                 dc.w      $f7fb
  0053b6  fdfa                 dc.w      $fdfa
  0053b8  f4f0                 dc.w      $f4f0
  0053ba  faf7c17fbc7f         fbf.l     $c180103b
  0053c0  bc7f                 dc.w      $bc7f
  0053c2  bceef0fa             cmpa.w    -$f06(a6), a6
  0053c6  f0f0faf5f0fa         fbf.l     $faf644c2
  0053cc  f0f0faf5f0fa         fbf.l     $faf644c8
  0053d2  f5f0                 dc.w      $f5f0
  0053d4  fadffcfcfcf3         fbf.l     $fcfd50c9
  0053da  fcfcfcfcfcfc         fbf.l     $fcfd50d8
  0053e0  fce0fcfdfdfd         fbf.l     $fcfe51df
  0053e6  fd7f                 dc.w      $fd7f
  0053e8  599a                 subq.l    #$4, (a2)+
  0053ea  94b24356             sub.l     ([a2]), d2
  0053ee  7fae                 dc.w      $7fae
  0053f0  e18f                 lsl.l     #$8, d7
  0053f2  83859486             unpk      d5, d1, #$9486
  0053f6  4047                 negx.w    d7
  0053f8  8683                 or.l      d3, d3
  0053fa  404b                 dc.w      $404b
  0053fc  a4fc                 _trap_a4fc 
  0053fe  8a87                 or.l      d7, d5
  005400  9642                 sub.w     d2, d3
  005402  45ecefee             lea.l     -$1012(a4), a2
  005406  d3ecf7f7             adda.l    -$809(a4), a1
  00540a  f7f7                 dc.w      $f7f7
  00540c  f7f7                 dc.w      $f7f7
  00540e  f7c8                 dc.w      $f7c8
  005410  7f41                 dc.w      $7f41
  005412  fbee                 dc.w      $fbee
  005414  eeee                 dc.w      $eeee
  005416  eeee                 dc.w      $eeee
  005418  41a5                 chk.w     -(a5), d0
  00541a  4106                 chk.l     d6, d0
  00541c  8888                 dc.w      $8888
  00541e  8888                 dc.w      $8888
  005420  8888                 dc.w      $8888
  005422  8888                 dc.w      $8888
  005424  8888                 dc.w      $8888
  005426  8888                 dc.w      $8888
  005428  8888                 dc.w      $8888
  00542a  8888                 dc.w      $8888
  00542c  8888                 dc.w      $8888
  00542e  8888                 dc.w      $8888
  005430  8888                 dc.w      $8888
  005432  8888                 dc.w      $8888
  005434  8888                 dc.w      $8888
  005436  8888                 dc.w      $8888
  005438  8888                 dc.w      $8888
  00543a  8888                 dc.w      $8888
  00543c  8888                 dc.w      $8888
  00543e  8887                 or.l      d7, d4
  005440  b241                 cmp.w     d1, d1
  005442  67de                 beq.b     $5422
  005444  7f9f                 dc.w      $7f9f
  005446  d0e6                 adda.w    -(a6), a0
  005448  7fb5                 dc.w      $7fb5
  00544a  412af1d3             chk.l     -$e2d(a2), d0
  00544e  f0e3c87fbc41         fbf.l     $c8801091
  005454  e8a7                 asr.l     d4, d7
  005456  de00                 add.b     d0, d7
  005458  00000359             ori.b     #$59, d0
  00545c  0ef6                 dc.w      $0ef6
  00545e  409c                 negx.l    (a4)+
  005460  00000000             ori.b     #$0, d0
