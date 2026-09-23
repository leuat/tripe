multiplier = $F0
multiplier_a = $F1
mul_8bit_:
	cpx #$00
	beq mul_end
    dex
    stx multiplier_a
    lsr
    sta multiplier
    lda #$00
    ldx #$08
mul_loop:
    bcc mul_skip
mul_mod:
    adc multiplier_a
mul_skip:
    ror
    ror multiplier
    dex
    bne mul_loop
    ldx multiplier
    rts
mul_end:
	txa
