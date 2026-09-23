div8x8_c = $F0
div8x8_d = $F1
div8x8_e = $F2
; Normal 8 bit div
div_8bit_:
	lda #$00
    ldx #$07
    clc
div8x8_loop1:
	rol div8x8_d
	rol
	cmp div8x8_c
	bcc div8x8_loop2
	sbc div8x8_c
div8x8_loop2:
	dex
	bpl div8x8_loop1
 	rol div8x8_d

    lda div8x8_d
    rts
