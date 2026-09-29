initdiv16x8_divisor = $F0
initdiv16x8_dividend = $F2
initdiv16x8_remainder = $F4
initdiv16x8_result = $F2

div_16bit:
    lda #0
    sta initdiv16x8_remainder
    sta initdiv16x8_remainder+1
    ldx #16

divloop16:	
	asl initdiv16x8_dividend
    rol initdiv16x8_dividend+1
    rol initdiv16x8_remainder
    rol initdiv16x8_remainder+1
    lda initdiv16x8_remainder
    sec
    sbc initdiv16x8_divisor
    tay
    lda initdiv16x8_remainder+1
    sbc initdiv16x8_divisor+1
    bcc skip16

    sta initdiv16x8_remainder+1	
    sty initdiv16x8_remainder
    inc initdiv16x8_result	
skip16:
    dex
    bne divloop16
    rts

