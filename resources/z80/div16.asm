div_16bit_:
   ld   hl, 0
   ld   b, 16

_loop16:
   sll  c
   rla
   adc  hl, hl
   sbc  hl, de
   jr   nc, $+4
   add  hl, de
   dec  c

   djnz _loop16

   ret
