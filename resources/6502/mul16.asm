mul16x8_num1Hi = @ZP0
mul16x8_num1 = @ZP1
mul16x8_num2 = @ZP2

mul_16bit:
    lda #$00
    ldy #$00
    beq mul16x8_enterLoop
mul16x8_doAdd:
    clc
    adc mul16x8_num1
    tax

    tya
    adc mul16x8_num1Hi
    tay
    txa

mul16x8_loop:
    asl mul16x8_num1
    rol mul16x8_num1Hi
mul16x8_enterLoop:
    lsr mul16x8_num2
    bcs mul16x8_doAdd
    bne mul16x8_loop
    rts
