
 ; .processor 6502
	.code uint16:0x810 name
.label StartBlock810
	; Starting new memory block at $810
.label UnitTests6502
	; LineNumber: 8
	jump block1
	; LineNumber: 3
	decl 	Vars_sc 	ptr8:0
	; LineNumber: 3
	decl 	Vars_co 	ptr8:0
	; LineNumber: 4
  decl  Vars_text  uint8:$54
  .uint8 $45 $53 $54 $20 $20 $20 $20
  .uint8 $20 $20 $20 $20 $20 $20 $20 $20
  .uint8 $20 $20 $20 $20 $20 0
	; LineNumber: 6
  decl  Vars_barr  uint8:0
  .uint8 0 0 0 0 0 0 0
  .uint8 0 0
	; LineNumber: 7
  decl  Vars_v1  uint8:0
	; LineNumber: 7
  decl  Vars_v2  uint8:0
	; LineNumber: 7
  decl  Vars_v3  uint8:0
	; LineNumber: 7
  decl  Vars_rb  uint8:0
	; LineNumber: 8
  decl  Vars_i1  uint16:0
	; LineNumber: 8
  decl  Vars_i2  uint16:0
	; LineNumber: 8
  decl  Vars_ri  uint16:0
	; LineNumber: 8
  decl  Vars_j2  uint16:0
	; LineNumber: 9
	decl 	Vars_p1 	ptr8:0
	; LineNumber: 9
	decl 	Vars_p2 	ptr8:0
	; LineNumber: 10
	decl 	Vars_ip 	ptr16:0
	; LineNumber: 12
  decl  Vars_j  uint8:0
	; LineNumber: 12
  decl  Vars_i  uint8:0
	; LineNumber: 38
  decl  Vars_ia1  uint16:$00
  .uint16 $64 $c8 $12c $190 $1f4 $258 $2bc
  .uint16 $320 $384
	; LineNumber: 39
  decl  Vars_ba1  uint8:$00
  .uint8 $01 $02 $03 $04 $05 $06 $07
  .uint8 $08 $09
	; LineNumber: 40
  decl  Vars_strLst  uint16:tmp_289383_string0
  .uint16 tmp_930886_string1 tmp_692777_string2 tmp_636915_string3
	; LineNumber: 39
  decl  tmp_289383_string0  uint8:$53
  .uint8 $31 0
	; LineNumber: 39
  decl  tmp_930886_string1  uint8:$53
  .uint8 $32 0
	; LineNumber: 39
  decl  tmp_692777_string2  uint8:$4a
  .uint8 75 0
	; LineNumber: 39
  decl  tmp_636915_string3  uint8:$53
  .uint8 $33 0
	; LineNumber: 51
	decl 	Vars_Mini_this 	ptr8:0
	; LineNumber: 65
	decl 	Vars_Point_this 	ptr8:0
	; LineNumber: 86
	decl 	Vars_Monster_this 	ptr8:0
	; LineNumber: 18
	decl 	Classes_StrItem_this 	ptr8:0
	; LineNumber: 51
	decl 	Classes_StringList_this 	ptr8:0
	; LineNumber: 3
  decl  Strings_teststr1  uint8:$48
  .uint8 $45 $49 $53 $41 $4e $4e 0
	; LineNumber: 6
  decl  Strings_teststr2  uint8:0x08
  .uint8 0x05 0x09 0x13 0x01 0x0e 0x0e 0x20
  .uint8 0x04 0x15 0
	; LineNumber: 3
  decl  Functions_fn1  uint8:0
	; LineNumber: 30
  decl  Unittests_currentTest  uint8:0
	; LineNumber: 31
  decl  Unittests_isDone  uint8:0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initmoveto
	;    Procedure type : Built-in function
	;    Requires initialization : no
	.asm
	jmp moveto2
screen_x = $4c
screen_y = $4e
SetScreenPosition
	sta screenmemory+1
	lda #0
	sta screenmemory
	ldy screen_y
	beq sydone
syloop
	clc
	adc #40
	bcc sskip
	inc screenmemory+1
sskip
	dey
	bne syloop
sydone
	ldx screen_x
	beq sxdone
	clc
	adc screen_x
	bcc sxdone
	inc screenmemory+1
sxdone
	sta screenmemory
	rts
moveto2
	.endasm
	return
.label end_procedure_initmoveto
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initprintdecimal
	;    Procedure type : Built-in function
	;    Requires initialization : no
	.asm
ipd_div_hi: dc.b 0
ipd_div_lo: dc.b 0
init_printdecimal_div10
	ldx #$11
	lda #$00
	clc
init_printdecimal_loop
	rol
	cmp #$0A
	bcc init_printdecimal_skip
	sbc #$0A
init_printdecimal_skip
	rol ipd_div_lo
	rol ipd_div_hi
	dex
	bne init_printdecimal_loop
	.endasm
	return
.label end_procedure_initprintdecimal
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initprintstring
	;    Procedure type : Built-in function
	;    Requires initialization : no
	.asm
print_text = $4c
print_number_text: .dc "    ",0
printstring
	ldy #0
printstringloop
	lda (print_text),y
	cmp #0 ;keep
	beq printstring_done
	cmp #64
	bcc printstring_skip
	sec
	sbc #64
printstring_skip
	sta (screenmemory),y
	iny
	dex
	cpx #0
	beq printstring_done
	jmp printstringloop
printstring_done
	.endasm
	return
.label end_procedure_initprintstring
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Vars_IntegerReturn
	;    Procedure type : User-defined procedure
	; LineNumber: 102
	; LineNumber: 99
  decl  Vars_ir_p1  uint8:0
.label Vars_IntegerReturn_block3
.label Vars_IntegerReturn
	; LineNumber: 103
	; push
	mulu  	_r16_1 	Vars_ir_p1 	uint8:0x02
	mov 	Vars_j2 	_r16_1
	; LineNumber: 105
	; LineNumber: 105
	; Setting function return value
	mov 	Vars_IntegerReturn_fret 	Vars_j2
	return
.label end_procedure_Vars_IntegerReturn
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Vars_ByteReturn
	;    Procedure type : User-defined procedure
	; LineNumber: 110
.label Vars_ByteReturn_block4
.label Vars_ByteReturn
	; LineNumber: 111
	; push
	mulu  	_r8_1 	Vars_ir_p1 	uint8:0x02
	mov 	Vars_v3 	_r8_1
	; LineNumber: 113
	; LineNumber: 113
	; Setting function return value
	mov 	Vars_ByteReturn_fret 	Vars_v3
	return
.label end_procedure_Vars_ByteReturn
	
; // Called at the beginning of the testing
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_TestInit
	;    Procedure type : User-defined procedure
	; LineNumber: 9
.label Common_TestInit
	; LineNumber: 9
	store 	$8000 	uint8:0x00 	uint8:0x00
	; LineNumber: 11
	return
.label end_procedure_Common_TestInit
	
; // all pass
	
; // Called at the beginning of each test suite (multiple test cases grouped together)
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_TestSuiteInit
	;    Procedure type : User-defined procedure
	; LineNumber: 25
.label Common_TestSuiteInit
	; LineNumber: 26
	.asm
	; Clear screen with offset
	lda #$20
	ldx #$fa
clearloop7
	dex
	sta $0000+$400,x
	sta $00fa+$400,x
	sta $01f4+$400,x
	sta $02ee+$400,x
	bne clearloop7
	.endasm
	; LineNumber: 27
	return
.label end_procedure_Common_TestSuiteInit
	
; // TODO(ColinPitrat): Unused? Remove?
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_Initialise
	;    Procedure type : User-defined procedure
	; LineNumber: 31
	; LineNumber: 30
	decl 	Common_zp 	ptr8:0
.label Common_Initialise_block8
.label Common_Initialise
	; LineNumber: 34
	
; //	DefineScreen();
	; Assigning memory location
	mov 	$d020 	uint8:0x00
	; LineNumber: 35
	; Assigning memory location
	mov 	$d021 	uint8:0x00
	; LineNumber: 36
	mov 	Vars_sc 	uint16:0x400
	; LineNumber: 37
	mov 	Vars_co 	uint16:0xd800
	; LineNumber: 38
	.asm
	; Clear screen with offset
	lda #$20
	ldx #$fa
clearloop9
	dex
	sta $0000+$400,x
	sta $00fa+$400,x
	sta $01f4+$400,x
	sta $02ee+$400,x
	bne clearloop9
	.endasm
	; LineNumber: 39
	.asm
	; Clear screen with offset
	lda #$1
	ldx #$fa
clearloop10
	dex
	sta $0000+$d800,x
	sta $00fa+$d800,x
	sta $01f4+$d800,x
	sta $02ee+$d800,x
	bne clearloop10
	.endasm
	; LineNumber: 40
	.asm
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #$04
	sta screenmemory+1
	.endasm
	; LineNumber: 41
	.asm
	ldy Common_zp+1 ;keep
	lda Common_zp
	sta print_text+0
	sty print_text+1
	lda #$28
	tax
	jsr printstring
	.endasm
	; LineNumber: 42
	; push
	add  	_r16_1 	Vars_sc 	uint16:0x50
	mov 	Vars_sc 	_r16_1
	; LineNumber: 43
	; push
	add  	_r16_1 	Vars_co 	uint16:0x50
	mov 	Vars_co 	_r16_1
	; LineNumber: 44
	return
.label end_procedure_Common_Initialise
	
; // Returns 0 if everything passed so far, 1 if there's been a failure.
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_Status
	;    Procedure type : User-defined procedure
	; LineNumber: 48
.label Common_Status
	; LineNumber: 50
	; LineNumber: 50
	; Setting function return value
	; push
	load 	$8000 	uint8:0x00 	_r8_1
	mov 	Common_Status_fret 	_r8_1
	return
.label end_procedure_Common_Status
	
; // Print POSITIVE result of a test - ptext must be 8 characters or less
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_PASS
	;    Procedure type : User-defined procedure
	; LineNumber: 54
.label Common_PASS
	; LineNumber: 55
	mov 	screenmemory 	Vars_sc
	; LineNumber: 56
	.asm
	lda #<Vars_text
	ldy #>Vars_text
	sta print_text+0
	sty print_text+1
	lda #$c
	tax
	jsr printstring
	.endasm
	; LineNumber: 57
	store Vars_sc uint8:0x02 uint8:0x53
	; LineNumber: 58
	
; // heart
	store Vars_co uint8:0x02 uint8:0x05
	; LineNumber: 60
	; push
	add  	_r16_1 	Vars_sc 	uint16:0x05
	mov 	Vars_sc 	_r16_1
	; LineNumber: 61
	; push
	add  	_r16_1 	Vars_co 	uint16:0x05
	mov 	Vars_co 	_r16_1
	; LineNumber: 62
	return
.label end_procedure_Common_PASS
	
; // Print NEGATIVE result of a test - ftext must be 8 characters or less
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_FAIL
	;    Procedure type : User-defined procedure
	; LineNumber: 66
.label Common_FAIL
	; LineNumber: 67
	mov 	screenmemory 	Vars_sc
	; LineNumber: 68
	.asm
	lda #<Vars_text
	ldy #>Vars_text
	sta print_text+0
	sty print_text+1
	lda #$c
	tax
	jsr printstring
	.endasm
	; LineNumber: 69
	store Vars_sc uint8:0x02 uint8:0x56
	; LineNumber: 70
	
; // cross
	store Vars_co uint8:0x02 uint8:0x02
	; LineNumber: 72
	; push
	add  	_r16_1 	Vars_sc 	uint16:0x05
	mov 	Vars_sc 	_r16_1
	; LineNumber: 73
	; push
	add  	_r16_1 	Vars_co 	uint16:0x05
	mov 	Vars_co 	_r16_1
	; LineNumber: 74
	store 	$8000 	uint8:0x00 	uint8:0x01
	; LineNumber: 75
	.asm
 brk
	.endasm
	; LineNumber: 76
	return
.label end_procedure_Common_FAIL
	
; //--------------------------------------------------------------------------------------------
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_WaitABit
	;    Procedure type : User-defined procedure
	; LineNumber: 80
.label Common_WaitABit
	; LineNumber: 82
	mov 	Vars_v1 	uint8:0x00
.label Common_WaitABit_forloop21
	; LineNumber: 80
	.asm
	; Wait
	lda #$fa
	tax
	dex
	bne *-1
	.endasm
.label Common_WaitABit_loopstart22
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x20 	Common_WaitABit_forloop21
.label Common_WaitABit_loopdone26 ;keep
.label Common_WaitABit_loopend23
	; LineNumber: 83
	return
.label end_procedure_Common_WaitABit
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_DebugValue
	;    Procedure type : User-defined procedure
	; LineNumber: 86
	; LineNumber: 85
  decl  Common_v  uint16:0
.label Common_DebugValue_block27
.label Common_DebugValue
	; LineNumber: 87
	.asm
	; MoveTo optimization
	lda #$5d
	sta screenmemory
	lda #$06
	sta screenmemory+1
	.endasm
	; LineNumber: 87
	.asm
	ldy #0
	ldy Common_v+1 ;keep
	lda Common_v
	sta ipd_div_lo
	sty ipd_div_hi
	lda #$5
	tay
printdecimal28
	jsr init_printdecimal_div10 
	ora #$30
	sta (screenmemory),y
	dey
	bpl printdecimal28
	.endasm
	; LineNumber: 90
	return
.label end_procedure_Common_DebugValue
	; NodeProcedureDecl -1
	; ***********  Defining procedure : CaseTest_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 5
.label CaseTest_Test1
	; LineNumber: 6
	mov 	Vars_j 	uint8:0x0f
	; LineNumber: 7
	mov 	Vars_i 	uint8:0x00
	; LineNumber: 8
	jneq 	Vars_j 	uint8:0x04 	CaseTest_Test1_casenext31
	; LineNumber: 8
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test1_caseend30
.label CaseTest_Test1_casenext31
	jneq 	Vars_j 	uint8:0x0f 	CaseTest_Test1_casenext33
	; LineNumber: 9
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test1_caseend30
.label CaseTest_Test1_casenext33
	jneq 	Vars_j 	uint8:0x18 	CaseTest_Test1_casenext35
	; LineNumber: 10
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test1_casenext35
.label CaseTest_Test1_caseend30
	; LineNumber: 15
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test1_stringassigncpy38
	load 	CaseTest_Test1_stringassignstr37 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test1_stringassigncpy38
	; LineNumber: 16
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test1_eblock41
.label CaseTest_Test1_ctb40 ;Main true block ;keep 
	; LineNumber: 15
	call Common_PASS
	jump CaseTest_Test1_edblock42
.label CaseTest_Test1_eblock41
	; LineNumber: 15
	call Common_FAIL
.label CaseTest_Test1_edblock42
	; LineNumber: 17
	return
.label end_procedure_CaseTest_Test1
	
; // Integer test
	; NodeProcedureDecl -1
	; ***********  Defining procedure : CaseTest_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 21
.label CaseTest_Test2
	; LineNumber: 22
	mov 	Vars_j2 	uint16:0x3a98
	; LineNumber: 23
	mov 	Vars_i 	uint8:0x00
	; LineNumber: 24
	jneq 	Vars_j2 	uint8:0x04 	CaseTest_Test2_casenext49
	; LineNumber: 24
	mov 	Vars_i2 	uint8:0x05
	jump CaseTest_Test2_caseend48
.label CaseTest_Test2_casenext49
	jneq 	Vars_j2 	uint16:0x3a98 	CaseTest_Test2_casenext51
	; LineNumber: 25
	mov 	Vars_i2 	uint8:0x0a
	jump CaseTest_Test2_caseend48
.label CaseTest_Test2_casenext51
	jneq 	Vars_j2 	uint8:0x18 	CaseTest_Test2_casenext53
	; LineNumber: 26
	mov 	Vars_i2 	uint8:0x00
.label CaseTest_Test2_casenext53
.label CaseTest_Test2_caseend48
	; LineNumber: 30
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test2_stringassigncpy56
	load 	CaseTest_Test2_stringassignstr55 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test2_stringassigncpy56
	; LineNumber: 31
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint8:0x0a 	CaseTest_Test2_eblock59
.label CaseTest_Test2_ctb58 ;Main true block ;keep 
	; LineNumber: 30
	call Common_PASS
	jump CaseTest_Test2_edblock60
.label CaseTest_Test2_eblock59
	; LineNumber: 30
	call Common_FAIL
.label CaseTest_Test2_edblock60
	; LineNumber: 32
	return
.label end_procedure_CaseTest_Test2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : CaseTest_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 35
.label CaseTest_Test3
	; LineNumber: 36
	mov 	Vars_j 	uint8:0x0f
	; LineNumber: 37
	mov 	Vars_i 	uint8:0x00
	; LineNumber: 38
	; expr is not pure, need to save to temp var
	; push
	; push
	mulu  	_r8_2 	Vars_j 	uint8:0x03
	add  	_r8_1 	_r8_2 	uint8:0x01
	mov 	_temp_var_casebab1 	_r8_1
	jneq 	_temp_var_casebab1 	uint8:0x04 	CaseTest_Test3_casenext67
	; LineNumber: 38
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test3_caseend66
.label CaseTest_Test3_casenext67
	jneq 	_temp_var_casebab1 	uint8:0x2e 	CaseTest_Test3_casenext69
	; LineNumber: 39
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test3_caseend66
.label CaseTest_Test3_casenext69
	jneq 	_temp_var_casebab1 	uint8:0x18 	CaseTest_Test3_casenext71
	; LineNumber: 40
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test3_casenext71
.label CaseTest_Test3_caseend66
	; LineNumber: 44
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test3_stringassigncpy74
	load 	CaseTest_Test3_stringassignstr73 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test3_stringassigncpy74
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test3_eblock77
.label CaseTest_Test3_ctb76 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump CaseTest_Test3_edblock78
.label CaseTest_Test3_eblock77
	; LineNumber: 44
	call Common_FAIL
.label CaseTest_Test3_edblock78
	; LineNumber: 46
	return
.label end_procedure_CaseTest_Test3
	
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : CaseTest_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 52
.label CaseTest_Exec
	; LineNumber: 53
	; Assigning a string : Common_zp
	mov 	Common_zp 	#CaseTest_Exec_stringassignstr84
	call Common_Initialise
	; LineNumber: 56
	
; // Mul and div
	call CaseTest_Test1
	; LineNumber: 60
	call CaseTest_Test2
	; LineNumber: 65
	call CaseTest_Test3
	; LineNumber: 66
	call Common_WaitABit
	; LineNumber: 67
	return
.label end_procedure_CaseTest_Exec
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced01
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label AdvancedMath_Advanced01
	; LineNumber: 7
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 8
	; push
	add  	_r16_1 	uint16:0x400 	Vars_v1
	mov 	Vars_p1 	_r16_1
	; LineNumber: 9
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced01_stringassigncpy87
	load 	AdvancedMath_Advanced01_stringassignstr86 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced01_stringassigncpy87
	; LineNumber: 9
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x40a 	AdvancedMath_Advanced01_eblock90
.label AdvancedMath_Advanced01_ctb89 ;Main true block ;keep 
	; LineNumber: 8
	call Common_PASS
	jump AdvancedMath_Advanced01_edblock91
.label AdvancedMath_Advanced01_eblock90
	; LineNumber: 8
	call Common_FAIL
.label AdvancedMath_Advanced01_edblock91
	; LineNumber: 10
	return
.label end_procedure_AdvancedMath_Advanced01
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced02
	;    Procedure type : User-defined procedure
	; LineNumber: 13
.label AdvancedMath_Advanced02
	; LineNumber: 14
	mov 	Vars_p1 	uint16:0x450
	; LineNumber: 15
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced02_stringassigncpy98
	load 	AdvancedMath_Advanced02_stringassignstr97 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced02_stringassigncpy98
	; LineNumber: 15
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x450 	AdvancedMath_Advanced02_eblock101
.label AdvancedMath_Advanced02_ctb100 ;Main true block ;keep 
	; LineNumber: 14
	call Common_PASS
	jump AdvancedMath_Advanced02_edblock102
.label AdvancedMath_Advanced02_eblock101
	; LineNumber: 14
	call Common_FAIL
.label AdvancedMath_Advanced02_edblock102
	; LineNumber: 16
	return
.label end_procedure_AdvancedMath_Advanced02
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced03
	;    Procedure type : User-defined procedure
	; LineNumber: 19
.label AdvancedMath_Advanced03
	; LineNumber: 20
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 21
	mov 	Vars_p2 	uint16:0x100
	; LineNumber: 22
	; push
	; push
	; push
	mulu  	_r16_3 	Vars_v1 	uint16:0x20
	add  	_r16_2 	uint16:0x400 	_r16_3
	add  	_r16_1 	_r16_2 	Vars_p2
	mov 	Vars_p1 	_r16_1
	; LineNumber: 23
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced03_stringassigncpy109
	load 	AdvancedMath_Advanced03_stringassignstr108 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced03_stringassigncpy109
	; LineNumber: 23
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x1180 	AdvancedMath_Advanced03_eblock112
.label AdvancedMath_Advanced03_ctb111 ;Main true block ;keep 
	; LineNumber: 22
	call Common_PASS
	jump AdvancedMath_Advanced03_edblock113
.label AdvancedMath_Advanced03_eblock112
	; LineNumber: 22
	call Common_FAIL
.label AdvancedMath_Advanced03_edblock113
	; LineNumber: 24
	return
.label end_procedure_AdvancedMath_Advanced03
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced04
	;    Procedure type : User-defined procedure
	; LineNumber: 27
.label AdvancedMath_Advanced04
	; LineNumber: 28
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 29
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 30
	store Vars_p2 Vars_v1 uint8:0x02
	; LineNumber: 31
	mov 	Vars_p1 	uint16:0x400
	; LineNumber: 32
	.asm
;cc2
	.endasm
	; LineNumber: 33
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	Vars_v1 	_r8_1
	add  	_r16_1 	Vars_p1 	_r8_1
	mov 	Vars_p1 	_r16_1
	; LineNumber: 34
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced04_stringassigncpy120
	load 	AdvancedMath_Advanced04_stringassignstr119 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced04_stringassigncpy120
	; LineNumber: 34
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x402 	AdvancedMath_Advanced04_eblock123
.label AdvancedMath_Advanced04_ctb122 ;Main true block ;keep 
	; LineNumber: 33
	call Common_PASS
	jump AdvancedMath_Advanced04_edblock124
.label AdvancedMath_Advanced04_eblock123
	; LineNumber: 33
	call Common_FAIL
.label AdvancedMath_Advanced04_edblock124
	; LineNumber: 35
	return
.label end_procedure_AdvancedMath_Advanced04
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced05
	;    Procedure type : User-defined procedure
	; LineNumber: 38
.label AdvancedMath_Advanced05
	; LineNumber: 39
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 40
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 41
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 42
	mov 	Vars_p1 	uint16:0x400
	; LineNumber: 43
	; push
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	mulu  	_r16_2 	_r8_1 	uint16:0x02
	add  	_r16_1 	Vars_p1 	_r16_2
	mov 	Vars_p1 	_r16_1
	; LineNumber: 45
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced05_stringassigncpy131
	load 	AdvancedMath_Advanced05_stringassignstr130 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced05_stringassigncpy131
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x440 	AdvancedMath_Advanced05_eblock134
.label AdvancedMath_Advanced05_ctb133 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump AdvancedMath_Advanced05_edblock135
.label AdvancedMath_Advanced05_eblock134
	; LineNumber: 44
	call Common_FAIL
.label AdvancedMath_Advanced05_edblock135
	; LineNumber: 46
	return
.label end_procedure_AdvancedMath_Advanced05
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced06
	;    Procedure type : User-defined procedure
	; LineNumber: 49
.label AdvancedMath_Advanced06
	; LineNumber: 50
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 51
	; LineNumber: 51
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 52
	mov 	Vars_v2 	uint8:0x03
	; LineNumber: 53
	store Vars_p2 Vars_v1 uint8:0x20
	; LineNumber: 54
	mov 	Vars_p1 	uint16:0x400
	; LineNumber: 55
	; push
	; push
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	Vars_v1 	_r8_1
	mulu  	_r16_3 	_r8_1 	Vars_v2
	add  	_r16_2 	Vars_p1 	_r16_3
	add  	_r16_1 	_r16_2 	uint16:0x10
	mov 	Vars_p1 	_r16_1
	; LineNumber: 56
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced06_stringassigncpy142
	load 	AdvancedMath_Advanced06_stringassignstr141 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced06_stringassigncpy142
	; LineNumber: 56
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x470 	AdvancedMath_Advanced06_eblock145
.label AdvancedMath_Advanced06_ctb144 ;Main true block ;keep 
	; LineNumber: 55
	call Common_PASS
	jump AdvancedMath_Advanced06_edblock146
.label AdvancedMath_Advanced06_eblock145
	; LineNumber: 55
	call Common_FAIL
.label AdvancedMath_Advanced06_edblock146
	; LineNumber: 57
	return
.label end_procedure_AdvancedMath_Advanced06
	
; //	Completely aware that this one fails. Works with *1, also with pointer +
; //
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced07
	;    Procedure type : User-defined procedure
	; LineNumber: 62
.label AdvancedMath_Advanced07
	; LineNumber: 63
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 64
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 65
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 66
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	add  	_r16_1 	uint16:0x400 	_r8_1
	mov 	Vars_p1 	_r16_1
	; LineNumber: 67
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced07_stringassigncpy153
	load 	AdvancedMath_Advanced07_stringassignstr152 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced07_stringassigncpy153
	; LineNumber: 67
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x420 	AdvancedMath_Advanced07_eblock156
.label AdvancedMath_Advanced07_ctb155 ;Main true block ;keep 
	; LineNumber: 66
	call Common_PASS
	jump AdvancedMath_Advanced07_edblock157
.label AdvancedMath_Advanced07_eblock156
	; LineNumber: 66
	call Common_FAIL
.label AdvancedMath_Advanced07_edblock157
	; LineNumber: 68
	return
.label end_procedure_AdvancedMath_Advanced07
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced08
	;    Procedure type : User-defined procedure
	; LineNumber: 71
.label AdvancedMath_Advanced08
	; LineNumber: 72
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 73
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 74
	; push
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	mulu  	_r16_2 	_r8_1 	uint16:0x03
	add  	_r16_1 	uint16:0x400 	_r16_2
	mov 	Vars_p1 	_r16_1
	; LineNumber: 75
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced08_stringassigncpy164
	load 	AdvancedMath_Advanced08_stringassignstr163 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced08_stringassigncpy164
	; LineNumber: 75
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x460 	AdvancedMath_Advanced08_eblock167
.label AdvancedMath_Advanced08_ctb166 ;Main true block ;keep 
	; LineNumber: 74
	call Common_PASS
	jump AdvancedMath_Advanced08_edblock168
.label AdvancedMath_Advanced08_eblock167
	; LineNumber: 74
	call Common_FAIL
.label AdvancedMath_Advanced08_edblock168
	; LineNumber: 76
	return
.label end_procedure_AdvancedMath_Advanced08
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_factorial
	;    Procedure type : User-defined procedure
	; LineNumber: 81
	; LineNumber: 80
  decl  AdvancedMath_p  uint8:0
.label AdvancedMath_factorial_block173
.label AdvancedMath_factorial
	; LineNumber: 82
	; Binary clause Simplified: GREATER
	; ::LoadVariable
	jlte 	_nada 	uint8:0x01 	AdvancedMath_factorial_edblock177
.label AdvancedMath_factorial_ctb175 ;Main true block ;keep 
	; LineNumber: 83
	; LineNumber: 84
	; push
	; ::LoadVariable
	; push
	; ::LoadVariable
	sub  	_r8_2 	_r8_2 	uint8:0x01
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	; ::LoadVariable
	call AdvancedMath_factorial
	mulu  	_r8_1 	_r8_1 	AdvancedMath_factorial_fret
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	; ::LoadVariable
	; LineNumber: 85
.label AdvancedMath_factorial_edblock177
	; LineNumber: 87
	; LineNumber: 87
	; Setting function return value
	; ::LoadVariable
	mov 	AdvancedMath_factorial_fret 	_nada
	return
.label end_procedure_AdvancedMath_factorial
	
; //procedure Advanced09();
; //begin
; //	Vars::p2:=$4001;
; //	Vars::v1:=3;
; //	Vars::p2[1]:=$20;
; //	Vars::p1:=$0400 + toPointer(hi(Vars::p2)+$10*Vars::v1,lo(Vars::p2)*3+Vars::p2[1]*2)*2;
; //	
; //	Vars::text := "09:"; if Vars::p1=$E486 then Common::PASS() else Common::FAIL();
; //end;
; //
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_MulDivCombo1
	;    Procedure type : User-defined procedure
	; LineNumber: 111
.label AdvancedMath_MulDivCombo1
	; LineNumber: 112
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_MulDivCombo1_stringassigncpy182
	load 	AdvancedMath_MulDivCombo1_stringassignstr181 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_MulDivCombo1_stringassigncpy182
	; LineNumber: 113
	mov 	Vars_v1 	uint8:0x10
	; LineNumber: 114
	mov 	Vars_i2 	uint16:0x200
	; LineNumber: 116
	
; // $100/$02*$10 = $800
	; push
	; push
	divu  	_r16_2 	uint16:0x100 	>Vars_i2
	mulu  	_r16_1 	_r16_2 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 117
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x800 	AdvancedMath_MulDivCombo1_eblock185
.label AdvancedMath_MulDivCombo1_ctb184 ;Main true block ;keep 
	; LineNumber: 116
	call Common_PASS
	jump AdvancedMath_MulDivCombo1_edblock186
.label AdvancedMath_MulDivCombo1_eblock185
	; LineNumber: 116
	call Common_FAIL
.label AdvancedMath_MulDivCombo1_edblock186
	; LineNumber: 118
	return
.label end_procedure_AdvancedMath_MulDivCombo1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_MulDivCombo2
	;    Procedure type : User-defined procedure
	; LineNumber: 121
.label AdvancedMath_MulDivCombo2
	; LineNumber: 122
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_MulDivCombo2_stringassigncpy193
	load 	AdvancedMath_MulDivCombo2_stringassignstr192 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_MulDivCombo2_stringassigncpy193
	; LineNumber: 123
	mov 	Vars_v1 	uint8:0x10
	; LineNumber: 124
	mov 	Vars_i2 	uint16:0x400
	; LineNumber: 126
	
; // $100*$04/$10 = $40
	; push
	; push
	mulu  	_r16_2 	uint16:0x100 	>Vars_i2
	divu  	_r16_1 	_r16_2 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 127
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x40 	AdvancedMath_MulDivCombo2_eblock196
.label AdvancedMath_MulDivCombo2_ctb195 ;Main true block ;keep 
	; LineNumber: 126
	call Common_PASS
	jump AdvancedMath_MulDivCombo2_edblock197
.label AdvancedMath_MulDivCombo2_eblock196
	; LineNumber: 126
	call Common_FAIL
.label AdvancedMath_MulDivCombo2_edblock197
	; LineNumber: 128
	return
.label end_procedure_AdvancedMath_MulDivCombo2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_MulDivCombo3
	;    Procedure type : User-defined procedure
	; LineNumber: 131
.label AdvancedMath_MulDivCombo3
	; LineNumber: 132
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_MulDivCombo3_stringassigncpy204
	load 	AdvancedMath_MulDivCombo3_stringassignstr203 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_MulDivCombo3_stringassigncpy204
	; LineNumber: 133
	mov 	Vars_v1 	uint8:0x10
	; LineNumber: 134
	mov 	Vars_v2 	uint8:0x04
	; LineNumber: 135
	mov 	Vars_i2 	uint16:0x200
	; LineNumber: 137
	
; // $10*$100/$02*4 = $2000
	; push
	; push
	; push
	divu  	_r16_3 	uint16:0x100 	>Vars_i2
	mulu  	_r16_2 	Vars_v1 	_r16_3
	mulu  	_r16_1 	_r16_2 	Vars_v2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 138
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x2000 	AdvancedMath_MulDivCombo3_eblock207
.label AdvancedMath_MulDivCombo3_ctb206 ;Main true block ;keep 
	; LineNumber: 137
	call Common_PASS
	jump AdvancedMath_MulDivCombo3_edblock208
.label AdvancedMath_MulDivCombo3_eblock207
	; LineNumber: 137
	call Common_FAIL
.label AdvancedMath_MulDivCombo3_edblock208
	; LineNumber: 139
	return
.label end_procedure_AdvancedMath_MulDivCombo3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 144
.label AdvancedMath_Exec
	; LineNumber: 146
	
; // initialise everything
	; Assigning a string : Common_zp
	mov 	Common_zp 	#AdvancedMath_Exec_stringassignstr214
	call Common_Initialise
	; LineNumber: 148
	
; // Fails because of `ex`
	call AdvancedMath_Advanced01
	; LineNumber: 149
	call AdvancedMath_Advanced02
	; LineNumber: 150
	call AdvancedMath_Advanced03
	; LineNumber: 151
	call AdvancedMath_Advanced04
	; LineNumber: 152
	call AdvancedMath_Advanced05
	; LineNumber: 154
	call AdvancedMath_Advanced06
	; LineNumber: 156
	call AdvancedMath_Advanced07
	; LineNumber: 158
	call AdvancedMath_Advanced08
	; LineNumber: 169
	
; // Tripe doesn't have stack params (yet)
	call AdvancedMath_MulDivCombo1
	; LineNumber: 170
	call AdvancedMath_MulDivCombo2
	; LineNumber: 171
	call AdvancedMath_MulDivCombo3
	; LineNumber: 174
	call Common_WaitABit
	; LineNumber: 176
	return
.label end_procedure_AdvancedMath_Exec
	
; // casts int to byte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label Casts_Test1
	; LineNumber: 7
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test1_stringassigncpy217
	load 	Casts_Test1_stringassignstr216 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test1_stringassigncpy217
	; LineNumber: 8
	mov 	Vars_i1 	uint16:0x201
	; LineNumber: 9
	mov 	Vars_v1 	Vars_i1
	; LineNumber: 11
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x01 	Casts_Test1_eblock221
.label Casts_Test1_ctb220 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump Casts_Test1_edblock222
.label Casts_Test1_eblock221
	; LineNumber: 11
	call Common_FAIL
.label Casts_Test1_edblock222
	; LineNumber: 13
	return
.label end_procedure_Casts_Test1
	
; // casts byte to int 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 17
.label Casts_Test2
	; LineNumber: 18
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test2_stringassigncpy229
	load 	Casts_Test2_stringassignstr228 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test2_stringassigncpy229
	; LineNumber: 19
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 20
	mov 	Vars_i1 	Vars_v1
	; LineNumber: 21
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 22
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0xff 	Casts_Test2_eblock233
.label Casts_Test2_ctb232 ;Main true block ;keep 
	; LineNumber: 21
	call Common_PASS
	jump Casts_Test2_edblock234
.label Casts_Test2_eblock233
	; LineNumber: 21
	call Common_FAIL
.label Casts_Test2_edblock234
	; LineNumber: 23
	return
.label end_procedure_Casts_Test2
	
; // casts byte array to int, const lookup 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 27
.label Casts_Test3
	; LineNumber: 28
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test3_stringassigncpy241
	load 	Casts_Test3_stringassignstr240 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test3_stringassigncpy241
	; LineNumber: 29
	; ::LoadVariable
	; push
	load 	Vars_ba1 	uint8:0x05 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r16_1
	; LineNumber: 30
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 31
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test3_eblock245
.label Casts_Test3_ctb244 ;Main true block ;keep 
	; LineNumber: 30
	call Common_PASS
	jump Casts_Test3_edblock246
.label Casts_Test3_eblock245
	; LineNumber: 30
	call Common_FAIL
.label Casts_Test3_edblock246
	; LineNumber: 32
	return
.label end_procedure_Casts_Test3
	
; // casts byte array to int, byte lookup 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test4
	;    Procedure type : User-defined procedure
	; LineNumber: 36
.label Casts_Test4
	; LineNumber: 37
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test4_stringassigncpy253
	load 	Casts_Test4_stringassignstr252 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test4_stringassigncpy253
	; LineNumber: 38
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 39
	; ::LoadVariable
	; push
	load 	Vars_ba1 	Vars_v1 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r16_1
	; LineNumber: 40
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 41
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test4_eblock257
.label Casts_Test4_ctb256 ;Main true block ;keep 
	; LineNumber: 40
	call Common_PASS
	jump Casts_Test4_edblock258
.label Casts_Test4_eblock257
	; LineNumber: 40
	call Common_FAIL
.label Casts_Test4_edblock258
	; LineNumber: 42
	return
.label end_procedure_Casts_Test4
	
; // casts byte array to int, int lookup 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test5
	;    Procedure type : User-defined procedure
	; LineNumber: 46
.label Casts_Test5
	; LineNumber: 47
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test5_stringassigncpy265
	load 	Casts_Test5_stringassignstr264 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test5_stringassigncpy265
	; LineNumber: 48
	mov 	Vars_i2 	uint8:0x05
	; LineNumber: 49
	; ::LoadVariable
	; push
	load 	Vars_ba1 	Vars_i2 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r16_1
	; LineNumber: 50
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 51
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test5_eblock269
.label Casts_Test5_ctb268 ;Main true block ;keep 
	; LineNumber: 50
	call Common_PASS
	jump Casts_Test5_edblock270
.label Casts_Test5_eblock269
	; LineNumber: 50
	call Common_FAIL
.label Casts_Test5_edblock270
	; LineNumber: 52
	return
.label end_procedure_Casts_Test5
	
; // casts integer array to byte, const lookup 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test6
	;    Procedure type : User-defined procedure
	; LineNumber: 56
.label Casts_Test6
	; LineNumber: 57
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test6_stringassigncpy277
	load 	Casts_Test6_stringassignstr276 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test6_stringassigncpy277
	; LineNumber: 58
	.asm
;ball
	.endasm
	; LineNumber: 59
	; ::LoadVariable
	; push
	load 	Vars_ia1 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 61
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test6_eblock281
.label Casts_Test6_ctb280 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Casts_Test6_edblock282
.label Casts_Test6_eblock281
	; LineNumber: 61
	call Common_FAIL
.label Casts_Test6_edblock282
	; LineNumber: 63
	return
.label end_procedure_Casts_Test6
	
; // casts integer array to byte, byte lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test7
	;    Procedure type : User-defined procedure
	; LineNumber: 67
.label Casts_Test7
	; LineNumber: 68
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test7_stringassigncpy289
	load 	Casts_Test7_stringassignstr288 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test7_stringassigncpy289
	; LineNumber: 69
	mov 	Vars_v2 	uint8:0x02
	; LineNumber: 70
	; ::LoadVariable
	; push
	load 	Vars_ia1 	Vars_v2 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 71
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 72
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test7_eblock293
.label Casts_Test7_ctb292 ;Main true block ;keep 
	; LineNumber: 71
	call Common_PASS
	jump Casts_Test7_edblock294
.label Casts_Test7_eblock293
	; LineNumber: 71
	call Common_FAIL
.label Casts_Test7_edblock294
	; LineNumber: 73
	return
.label end_procedure_Casts_Test7
	
; // casts integer array to byte, integer lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test8
	;    Procedure type : User-defined procedure
	; LineNumber: 77
.label Casts_Test8
	; LineNumber: 78
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test8_stringassigncpy301
	load 	Casts_Test8_stringassignstr300 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test8_stringassigncpy301
	; LineNumber: 79
	mov 	Vars_i2 	uint8:0x02
	; LineNumber: 80
	; ::LoadVariable
	; push
	load 	Vars_ia1 	Vars_i2 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 81
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 82
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test8_eblock305
.label Casts_Test8_ctb304 ;Main true block ;keep 
	; LineNumber: 81
	call Common_PASS
	jump Casts_Test8_edblock306
.label Casts_Test8_eblock305
	; LineNumber: 81
	call Common_FAIL
.label Casts_Test8_edblock306
	; LineNumber: 83
	return
.label end_procedure_Casts_Test8
	
; // POINTERS
; // casts byte pointer array to integer, const lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test9
	;    Procedure type : User-defined procedure
	; LineNumber: 88
.label Casts_Test9
	; LineNumber: 89
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test9_stringassigncpy313
	load 	Casts_Test9_stringassignstr312 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test9_stringassigncpy313
	; LineNumber: 90
	mov 	Vars_p1 	#Vars_ba1
	; LineNumber: 91
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x08 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r8_1
	; LineNumber: 92
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 93
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test9_eblock317
.label Casts_Test9_ctb316 ;Main true block ;keep 
	; LineNumber: 92
	call Common_PASS
	jump Casts_Test9_edblock318
.label Casts_Test9_eblock317
	; LineNumber: 92
	call Common_FAIL
.label Casts_Test9_edblock318
	; LineNumber: 94
	return
.label end_procedure_Casts_Test9
	
; // casts byte pointer array to integer, byte lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test10
	;    Procedure type : User-defined procedure
	; LineNumber: 98
.label Casts_Test10
	; LineNumber: 99
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test10_stringassigncpy325
	load 	Casts_Test10_stringassignstr324 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test10_stringassigncpy325
	; LineNumber: 100
	mov 	Vars_p1 	#Vars_ba1
	; LineNumber: 101
	mov 	Vars_v2 	uint8:0x08
	; LineNumber: 102
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	Vars_v2 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r8_1
	; LineNumber: 103
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 104
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test10_eblock329
.label Casts_Test10_ctb328 ;Main true block ;keep 
	; LineNumber: 103
	call Common_PASS
	jump Casts_Test10_edblock330
.label Casts_Test10_eblock329
	; LineNumber: 103
	call Common_FAIL
.label Casts_Test10_edblock330
	; LineNumber: 105
	return
.label end_procedure_Casts_Test10
	
; // casts byte pointer array to integer, integer lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test11
	;    Procedure type : User-defined procedure
	; LineNumber: 109
.label Casts_Test11
	; LineNumber: 110
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test11_stringassigncpy337
	load 	Casts_Test11_stringassignstr336 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test11_stringassigncpy337
	; LineNumber: 111
	mov 	Vars_p1 	#Vars_ba1
	; LineNumber: 112
	mov 	Vars_i2 	uint8:0x08
	; LineNumber: 113
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	Vars_i2 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r8_1
	; LineNumber: 114
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 115
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test11_eblock341
.label Casts_Test11_ctb340 ;Main true block ;keep 
	; LineNumber: 114
	call Common_PASS
	jump Casts_Test11_edblock342
.label Casts_Test11_eblock341
	; LineNumber: 114
	call Common_FAIL
.label Casts_Test11_edblock342
	; LineNumber: 116
	return
.label end_procedure_Casts_Test11
	
; // casts integer pointer array to byte, const lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test12
	;    Procedure type : User-defined procedure
	; LineNumber: 120
.label Casts_Test12
	; LineNumber: 121
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test12_stringassigncpy349
	load 	Casts_Test12_stringassignstr348 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test12_stringassigncpy349
	; LineNumber: 122
	mov 	Vars_ip 	#Vars_ia1
	; LineNumber: 123
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_ip 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 124
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 125
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test12_eblock353
.label Casts_Test12_ctb352 ;Main true block ;keep 
	; LineNumber: 124
	call Common_PASS
	jump Casts_Test12_edblock354
.label Casts_Test12_eblock353
	; LineNumber: 124
	call Common_FAIL
.label Casts_Test12_edblock354
	; LineNumber: 126
	return
.label end_procedure_Casts_Test12
	
; // casts integer pointer array to byte, byte lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test13
	;    Procedure type : User-defined procedure
	; LineNumber: 130
.label Casts_Test13
	; LineNumber: 131
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test13_stringassigncpy361
	load 	Casts_Test13_stringassignstr360 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test13_stringassigncpy361
	; LineNumber: 132
	mov 	Vars_ip 	#Vars_ia1
	; LineNumber: 133
	mov 	Vars_v2 	uint8:0x02
	; LineNumber: 134
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_ip 	Vars_v2 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 135
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 136
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test13_eblock365
.label Casts_Test13_ctb364 ;Main true block ;keep 
	; LineNumber: 135
	call Common_PASS
	jump Casts_Test13_edblock366
.label Casts_Test13_eblock365
	; LineNumber: 135
	call Common_FAIL
.label Casts_Test13_edblock366
	; LineNumber: 137
	return
.label end_procedure_Casts_Test13
	
; // casts integer pointer array to byte, integer lookup
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test14
	;    Procedure type : User-defined procedure
	; LineNumber: 141
.label Casts_Test14
	; LineNumber: 142
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test14_stringassigncpy373
	load 	Casts_Test14_stringassignstr372 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test14_stringassigncpy373
	; LineNumber: 143
	mov 	Vars_ip 	#Vars_ia1
	; LineNumber: 144
	mov 	Vars_i2 	uint8:0x02
	; LineNumber: 145
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_ip 	Vars_i2 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r16_1
	; LineNumber: 146
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 147
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test14_eblock377
.label Casts_Test14_ctb376 ;Main true block ;keep 
	; LineNumber: 146
	call Common_PASS
	jump Casts_Test14_edblock378
.label Casts_Test14_eblock377
	; LineNumber: 146
	call Common_FAIL
.label Casts_Test14_edblock378
	; LineNumber: 148
	return
.label end_procedure_Casts_Test14
	
; // test function return calls. Call integer, return int
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test15
	;    Procedure type : User-defined procedure
	; LineNumber: 152
.label Casts_Test15
	; LineNumber: 153
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test15_stringassigncpy385
	load 	Casts_Test15_stringassignstr384 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test15_stringassigncpy385
	; LineNumber: 154
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_IntegerReturn
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	Vars_IntegerReturn_fret
	; LineNumber: 155
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 156
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	Casts_Test15_eblock389
.label Casts_Test15_ctb388 ;Main true block ;keep 
	; LineNumber: 155
	call Common_PASS
	jump Casts_Test15_edblock390
.label Casts_Test15_eblock389
	; LineNumber: 155
	call Common_FAIL
.label Casts_Test15_edblock390
	; LineNumber: 157
	return
.label end_procedure_Casts_Test15
	
; // test function return calls. Call integer, return int
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test16
	;    Procedure type : User-defined procedure
	; LineNumber: 161
.label Casts_Test16
	; LineNumber: 162
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test16_stringassigncpy397
	load 	Casts_Test16_stringassignstr396 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test16_stringassigncpy397
	; LineNumber: 163
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_ByteReturn
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	Vars_ByteReturn_fret
	; LineNumber: 165
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 166
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x04 	Casts_Test16_eblock401
.label Casts_Test16_ctb400 ;Main true block ;keep 
	; LineNumber: 165
	call Common_PASS
	jump Casts_Test16_edblock402
.label Casts_Test16_eblock401
	; LineNumber: 165
	call Common_FAIL
.label Casts_Test16_edblock402
	; LineNumber: 167
	return
.label end_procedure_Casts_Test16
	
; // test function return calls. Call integer, return int
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test17
	;    Procedure type : User-defined procedure
	; LineNumber: 171
.label Casts_Test17
	; LineNumber: 172
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test17_stringassigncpy409
	load 	Casts_Test17_stringassignstr408 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test17_stringassigncpy409
	; LineNumber: 173
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 174
	; Binary clause Simplified: EQUALS
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_ByteReturn
	jneq 	Vars_ByteReturn_fret 	uint8:0x04 	Casts_Test17_eblock413
.label Casts_Test17_ctb412 ;Main true block ;keep 
	; LineNumber: 173
	call Common_PASS
	jump Casts_Test17_edblock414
.label Casts_Test17_eblock413
	; LineNumber: 173
	call Common_FAIL
.label Casts_Test17_edblock414
	; LineNumber: 175
	return
.label end_procedure_Casts_Test17
	
; // test function return calls. Call integer, return int
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Test18
	;    Procedure type : User-defined procedure
	; LineNumber: 179
.label Casts_Test18
	; LineNumber: 180
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Casts_Test18_stringassigncpy421
	load 	Casts_Test18_stringassignstr420 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Casts_Test18_stringassigncpy421
	; LineNumber: 181
	; *** Inline procedure :Common_CR
	; LineNumber: 15
	; LineNumber: 16
	.asm
	lda #0
	ldx #0
	ldy #0
	
	.endasm
	; LineNumber: 21
	; *** End of inline procedure :Common_CR
	; LineNumber: 182
	; Binary clause Simplified: EQUALS
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_IntegerReturn
	jneq 	Vars_IntegerReturn_fret 	uint8:0x04 	Casts_Test18_eblock425
.label Casts_Test18_ctb424 ;Main true block ;keep 
	; LineNumber: 181
	call Common_PASS
	jump Casts_Test18_edblock426
.label Casts_Test18_eblock425
	; LineNumber: 181
	call Common_FAIL
.label Casts_Test18_edblock426
	; LineNumber: 183
	return
.label end_procedure_Casts_Test18
	; MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Casts_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 198
.label Casts_Exec
	; LineNumber: 199
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Casts_Exec_stringassignstr432
	call Common_Initialise
	; LineNumber: 201
	call Casts_Test1
	; LineNumber: 202
	call Casts_Test2
	; LineNumber: 203
	call Casts_Test3
	; LineNumber: 205
	call Casts_Test4
	; LineNumber: 207
	
; // FAILS on x86 fix up
	call Casts_Test5
	; LineNumber: 209
	call Casts_Test6
	; LineNumber: 210
	call Casts_Test7
	; LineNumber: 211
	call Casts_Test8
	; LineNumber: 212
	call Casts_Test9
	; LineNumber: 213
	call Casts_Test10
	; LineNumber: 214
	call Casts_Test11
	; LineNumber: 215
	call Casts_Test12
	; LineNumber: 216
	call Casts_Test13
	; LineNumber: 217
	call Casts_Test14
	; LineNumber: 219
	
; // integer returns
	call Casts_Test15
	; LineNumber: 220
	call Casts_Test16
	; LineNumber: 221
	call Casts_Test17
	; LineNumber: 222
	call Casts_Test18
	; LineNumber: 228
	call Common_WaitABit
	; LineNumber: 229
	return
.label end_procedure_Casts_Exec
	
; // Byte mul byte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulByte01
	;    Procedure type : User-defined procedure
	; LineNumber: 7
.label MulDiv_ByteMulByte01
	; LineNumber: 8
	mov 	Vars_v1 	uint8:0x0f
	; LineNumber: 9
	mov 	Vars_v2 	uint8:0x09
	; LineNumber: 10
	; push
	mulu  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_rb 	_r8_1
	; LineNumber: 12
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulByte01_stringassigncpy435
	load 	MulDiv_ByteMulByte01_stringassignstr434 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulByte01_stringassigncpy435
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x87 	MulDiv_ByteMulByte01_eblock438
.label MulDiv_ByteMulByte01_ctb437 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump MulDiv_ByteMulByte01_edblock439
.label MulDiv_ByteMulByte01_eblock438
	; LineNumber: 11
	call Common_FAIL
.label MulDiv_ByteMulByte01_edblock439
	; LineNumber: 13
	return
.label end_procedure_MulDiv_ByteMulByte01
	
; // Byte mul byte power of two
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulBytePow202
	;    Procedure type : User-defined procedure
	; LineNumber: 17
.label MulDiv_ByteMulBytePow202
	; LineNumber: 18
	mov 	Vars_v1 	uint8:0x0f
	; LineNumber: 19
	; push
	mulu  	_r8_1 	Vars_v1 	uint8:0x04
	mov 	Vars_rb 	_r8_1
	; LineNumber: 20
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulBytePow202_stringassigncpy446
	load 	MulDiv_ByteMulBytePow202_stringassignstr445 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePow202_stringassigncpy446
	; LineNumber: 20
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x3c 	MulDiv_ByteMulBytePow202_eblock449
.label MulDiv_ByteMulBytePow202_ctb448 ;Main true block ;keep 
	; LineNumber: 19
	call Common_PASS
	jump MulDiv_ByteMulBytePow202_edblock450
.label MulDiv_ByteMulBytePow202_eblock449
	; LineNumber: 19
	call Common_FAIL
.label MulDiv_ByteMulBytePow202_edblock450
	; LineNumber: 21
	return
.label end_procedure_MulDiv_ByteMulBytePow202
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteDivBytePow203
	;    Procedure type : User-defined procedure
	; LineNumber: 24
.label MulDiv_ByteDivBytePow203
	; LineNumber: 25
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 26
	; push
	divu  	_r8_1 	Vars_v1 	uint8:0x04
	mov 	Vars_rb 	_r8_1
	; LineNumber: 27
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteDivBytePow203_stringassigncpy457
	load 	MulDiv_ByteDivBytePow203_stringassignstr456 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteDivBytePow203_stringassigncpy457
	; LineNumber: 27
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x19 	MulDiv_ByteDivBytePow203_eblock460
.label MulDiv_ByteDivBytePow203_ctb459 ;Main true block ;keep 
	; LineNumber: 26
	call Common_PASS
	jump MulDiv_ByteDivBytePow203_edblock461
.label MulDiv_ByteDivBytePow203_eblock460
	; LineNumber: 26
	call Common_FAIL
.label MulDiv_ByteDivBytePow203_edblock461
	; LineNumber: 28
	return
.label end_procedure_MulDiv_ByteDivBytePow203
	
; // Byte mul div power
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteDivByte04
	;    Procedure type : User-defined procedure
	; LineNumber: 32
.label MulDiv_ByteDivByte04
	; LineNumber: 33
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 34
	mov 	Vars_v2 	uint8:0x05
	; LineNumber: 36
	; push
	divu  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_rb 	_r8_1
	; LineNumber: 37
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteDivByte04_stringassigncpy468
	load 	MulDiv_ByteDivByte04_stringassignstr467 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteDivByte04_stringassigncpy468
	; LineNumber: 37
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x14 	MulDiv_ByteDivByte04_eblock471
.label MulDiv_ByteDivByte04_ctb470 ;Main true block ;keep 
	; LineNumber: 36
	call Common_PASS
	jump MulDiv_ByteDivByte04_edblock472
.label MulDiv_ByteDivByte04_eblock471
	; LineNumber: 36
	call Common_FAIL
.label MulDiv_ByteDivByte04_edblock472
	; LineNumber: 38
	return
.label end_procedure_MulDiv_ByteDivByte04
	
; // Byte mul mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulMul05
	;    Procedure type : User-defined procedure
	; LineNumber: 43
.label MulDiv_ByteMulMul05
	; LineNumber: 44
	mov 	Vars_v1 	uint8:0x03
	; LineNumber: 45
	mov 	Vars_v2 	uint8:0x04
	; LineNumber: 46
	mov 	Vars_v3 	uint8:0x05
	; LineNumber: 47
	; push
	; push
	; push
	sub  	_r8_3 	Vars_v1 	uint8:0x01
	mulu  	_r8_2 	_r8_3 	Vars_v2
	; push
	add  	_r8_3 	Vars_v3 	uint8:0x01
	mulu  	_r8_1 	_r8_2 	_r8_3
	mov 	Vars_rb 	_r8_1
	; LineNumber: 48
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulMul05_stringassigncpy479
	load 	MulDiv_ByteMulMul05_stringassignstr478 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulMul05_stringassigncpy479
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x30 	MulDiv_ByteMulMul05_eblock482
.label MulDiv_ByteMulMul05_ctb481 ;Main true block ;keep 
	; LineNumber: 47
	call Common_PASS
	jump MulDiv_ByteMulMul05_edblock483
.label MulDiv_ByteMulMul05_eblock482
	; LineNumber: 47
	call Common_FAIL
.label MulDiv_ByteMulMul05_edblock483
	; LineNumber: 49
	return
.label end_procedure_MulDiv_ByteMulMul05
	
; // Byte mul mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntByteMul06
	;    Procedure type : User-defined procedure
	; LineNumber: 53
.label MulDiv_IntByteMul06
	; LineNumber: 54
	mov 	Vars_i1 	uint16:0x3f2
	; LineNumber: 55
	mov 	Vars_v1 	uint8:0x03
	; LineNumber: 56
	; push
	mulu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_ri 	_r16_1
	; LineNumber: 57
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntByteMul06_stringassigncpy490
	load 	MulDiv_IntByteMul06_stringassignstr489 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMul06_stringassigncpy490
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xbd6 	MulDiv_IntByteMul06_eblock493
.label MulDiv_IntByteMul06_ctb492 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump MulDiv_IntByteMul06_edblock494
.label MulDiv_IntByteMul06_eblock493
	; LineNumber: 57
	call Common_FAIL
.label MulDiv_IntByteMul06_edblock494
	; LineNumber: 59
	return
.label end_procedure_MulDiv_IntByteMul06
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntMulPow07
	;    Procedure type : User-defined procedure
	; LineNumber: 65
.label MulDiv_IntMulPow07
	; LineNumber: 66
	mov 	Vars_i1 	uint16:0x3f2
	; LineNumber: 67
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 68
	; push
	mulu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_ri 	_r16_1
	; LineNumber: 69
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntMulPow07_stringassigncpy501
	load 	MulDiv_IntMulPow07_stringassignstr500 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulPow07_stringassigncpy501
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xfc8 	MulDiv_IntMulPow07_eblock504
.label MulDiv_IntMulPow07_ctb503 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump MulDiv_IntMulPow07_edblock505
.label MulDiv_IntMulPow07_eblock504
	; LineNumber: 69
	call Common_FAIL
.label MulDiv_IntMulPow07_edblock505
	; LineNumber: 71
	return
.label end_procedure_MulDiv_IntMulPow07
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntDivByte08
	;    Procedure type : User-defined procedure
	; LineNumber: 75
.label MulDiv_IntDivByte08
	; LineNumber: 76
	mov 	Vars_i1 	uint16:0x267
	; LineNumber: 77
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 78
	; push
	divu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_v2 	_r16_1
	; LineNumber: 79
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntDivByte08_stringassigncpy512
	load 	MulDiv_IntDivByte08_stringassignstr511 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivByte08_stringassigncpy512
	; LineNumber: 80
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x7b 	MulDiv_IntDivByte08_eblock515
.label MulDiv_IntDivByte08_ctb514 ;Main true block ;keep 
	; LineNumber: 79
	call Common_PASS
	jump MulDiv_IntDivByte08_edblock516
.label MulDiv_IntDivByte08_eblock515
	; LineNumber: 79
	call Common_FAIL
.label MulDiv_IntDivByte08_edblock516
	; LineNumber: 81
	return
.label end_procedure_MulDiv_IntDivByte08
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntDivInt09
	;    Procedure type : User-defined procedure
	; LineNumber: 84
.label MulDiv_IntDivInt09
	; LineNumber: 85
	mov 	Vars_i1 	uint16:0xea60
	; LineNumber: 86
	mov 	Vars_i2 	uint16:0x3e8
	; LineNumber: 87
	; push
	divu  	_r16_1 	Vars_i1 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 88
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntDivInt09_stringassigncpy523
	load 	MulDiv_IntDivInt09_stringassignstr522 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivInt09_stringassigncpy523
	; LineNumber: 89
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x3c 	MulDiv_IntDivInt09_eblock526
.label MulDiv_IntDivInt09_ctb525 ;Main true block ;keep 
	; LineNumber: 88
	call Common_PASS
	jump MulDiv_IntDivInt09_edblock527
.label MulDiv_IntDivInt09_eblock526
	; LineNumber: 88
	call Common_FAIL
.label MulDiv_IntDivInt09_edblock527
	; LineNumber: 90
	return
.label end_procedure_MulDiv_IntDivInt09
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntDivPow210
	;    Procedure type : User-defined procedure
	; LineNumber: 93
.label MulDiv_IntDivPow210
	; LineNumber: 94
	mov 	Vars_i1 	uint16:0xea60
	; LineNumber: 95
	; push
	divu  	_r16_1 	Vars_i1 	uint16:0x04
	mov 	Vars_i1 	_r16_1
	; LineNumber: 96
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntDivPow210_stringassigncpy534
	load 	MulDiv_IntDivPow210_stringassignstr533 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivPow210_stringassigncpy534
	; LineNumber: 97
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3a98 	MulDiv_IntDivPow210_eblock537
.label MulDiv_IntDivPow210_ctb536 ;Main true block ;keep 
	; LineNumber: 96
	call Common_PASS
	jump MulDiv_IntDivPow210_edblock538
.label MulDiv_IntDivPow210_eblock537
	; LineNumber: 96
	call Common_FAIL
.label MulDiv_IntDivPow210_edblock538
	; LineNumber: 99
	return
.label end_procedure_MulDiv_IntDivPow210
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntDivMix11
	;    Procedure type : User-defined procedure
	; LineNumber: 102
.label MulDiv_IntDivMix11
	; LineNumber: 103
	mov 	Vars_i1 	uint16:0xea60
	; LineNumber: 104
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 105
	; push
	divu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 106
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntDivMix11_stringassigncpy545
	load 	MulDiv_IntDivMix11_stringassignstr544 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivMix11_stringassigncpy545
	; LineNumber: 107
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x258 	MulDiv_IntDivMix11_eblock548
.label MulDiv_IntDivMix11_ctb547 ;Main true block ;keep 
	; LineNumber: 106
	call Common_PASS
	jump MulDiv_IntDivMix11_edblock549
.label MulDiv_IntDivMix11_eblock548
	; LineNumber: 106
	call Common_FAIL
.label MulDiv_IntDivMix11_edblock549
	; LineNumber: 108
	return
.label end_procedure_MulDiv_IntDivMix11
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntDivMix12
	;    Procedure type : User-defined procedure
	; LineNumber: 111
.label MulDiv_IntDivMix12
	; LineNumber: 112
	mov 	Vars_i1 	uint16:0x4e20
	; LineNumber: 113
	mov 	Vars_v1 	uint8:0xc8
	; LineNumber: 114
	; push
	divu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_v1 	_r16_1
	; LineNumber: 115
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntDivMix12_stringassigncpy556
	load 	MulDiv_IntDivMix12_stringassignstr555 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivMix12_stringassigncpy556
	; LineNumber: 116
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x64 	MulDiv_IntDivMix12_eblock559
.label MulDiv_IntDivMix12_ctb558 ;Main true block ;keep 
	; LineNumber: 115
	call Common_PASS
	jump MulDiv_IntDivMix12_edblock560
.label MulDiv_IntDivMix12_eblock559
	; LineNumber: 115
	call Common_FAIL
.label MulDiv_IntDivMix12_edblock560
	; LineNumber: 117
	return
.label end_procedure_MulDiv_IntDivMix12
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntMulMix13
	;    Procedure type : User-defined procedure
	; LineNumber: 120
.label MulDiv_IntMulMix13
	; LineNumber: 121
	mov 	Vars_i1 	uint8:0xc8
	; LineNumber: 122
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 123
	; push
	mulu  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 124
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntMulMix13_stringassigncpy567
	load 	MulDiv_IntMulMix13_stringassignstr566 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulMix13_stringassigncpy567
	; LineNumber: 125
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e20 	MulDiv_IntMulMix13_eblock570
.label MulDiv_IntMulMix13_ctb569 ;Main true block ;keep 
	; LineNumber: 124
	call Common_PASS
	jump MulDiv_IntMulMix13_edblock571
.label MulDiv_IntMulMix13_eblock570
	; LineNumber: 124
	call Common_FAIL
.label MulDiv_IntMulMix13_edblock571
	; LineNumber: 126
	return
.label end_procedure_MulDiv_IntMulMix13
	
; // Fails. Integer * integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntMulInt14
	;    Procedure type : User-defined procedure
	; LineNumber: 130
.label MulDiv_IntMulInt14
	; LineNumber: 131
	mov 	Vars_i1 	uint8:0x0a
	; LineNumber: 132
	mov 	Vars_i2 	uint8:0x0a
	; LineNumber: 133
	; push
	mulu  	_r16_1 	Vars_i1 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 134
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntMulInt14_stringassigncpy578
	load 	MulDiv_IntMulInt14_stringassignstr577 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulInt14_stringassigncpy578
	; LineNumber: 135
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x64 	MulDiv_IntMulInt14_eblock581
.label MulDiv_IntMulInt14_ctb580 ;Main true block ;keep 
	; LineNumber: 134
	call Common_PASS
	jump MulDiv_IntMulInt14_edblock582
.label MulDiv_IntMulInt14_eblock581
	; LineNumber: 134
	call Common_FAIL
.label MulDiv_IntMulInt14_edblock582
	; LineNumber: 136
	return
.label end_procedure_MulDiv_IntMulInt14
	
; // Fails. Integer * byte * byte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntMulAdvancedMix15
	;    Procedure type : User-defined procedure
	; LineNumber: 142
.label MulDiv_IntMulAdvancedMix15
	; LineNumber: 143
	mov 	Vars_i1 	uint8:0x0a
	; LineNumber: 144
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 145
	mov 	Vars_v2 	uint8:0x0a
	; LineNumber: 146
	; push
	; push
	mulu  	_r16_2 	Vars_i1 	Vars_v1
	mulu  	_r16_1 	_r16_2 	Vars_v2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 147
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntMulAdvancedMix15_stringassigncpy589
	load 	MulDiv_IntMulAdvancedMix15_stringassignstr588 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulAdvancedMix15_stringassigncpy589
	; LineNumber: 148
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_IntMulAdvancedMix15_eblock592
.label MulDiv_IntMulAdvancedMix15_ctb591 ;Main true block ;keep 
	; LineNumber: 147
	call Common_PASS
	jump MulDiv_IntMulAdvancedMix15_edblock593
.label MulDiv_IntMulAdvancedMix15_eblock592
	; LineNumber: 147
	call Common_FAIL
.label MulDiv_IntMulAdvancedMix15_edblock593
	; LineNumber: 149
	return
.label end_procedure_MulDiv_IntMulAdvancedMix15
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulAdvanced16
	;    Procedure type : User-defined procedure
	; LineNumber: 152
.label MulDiv_ByteMulAdvanced16
	; LineNumber: 153
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 154
	mov 	Vars_v2 	uint8:0x03
	; LineNumber: 155
	mov 	Vars_v3 	uint8:0x04
	; LineNumber: 156
	; push
	; push
	mulu  	_r8_2 	Vars_v1 	Vars_v2
	; push
	sub  	_r8_3 	Vars_v3 	uint8:0x01
	mulu  	_r8_1 	_r8_2 	_r8_3
	mov 	Vars_v1 	_r8_1
	; LineNumber: 157
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulAdvanced16_stringassigncpy600
	load 	MulDiv_ByteMulAdvanced16_stringassignstr599 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulAdvanced16_stringassigncpy600
	; LineNumber: 158
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x12 	MulDiv_ByteMulAdvanced16_eblock603
.label MulDiv_ByteMulAdvanced16_ctb602 ;Main true block ;keep 
	; LineNumber: 157
	call Common_PASS
	jump MulDiv_ByteMulAdvanced16_edblock604
.label MulDiv_ByteMulAdvanced16_eblock603
	; LineNumber: 157
	call Common_FAIL
.label MulDiv_ByteMulAdvanced16_edblock604
	; LineNumber: 159
	return
.label end_procedure_MulDiv_ByteMulAdvanced16
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntMulConst17
	;    Procedure type : User-defined procedure
	; LineNumber: 162
.label MulDiv_IntMulConst17
	; LineNumber: 164
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 165
	; push
	mulu  	_r16_1 	Vars_v1 	uint8:0x05
	mov 	Vars_i1 	_r16_1
	; LineNumber: 166
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntMulConst17_stringassigncpy611
	load 	MulDiv_IntMulConst17_stringassignstr610 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulConst17_stringassigncpy611
	; LineNumber: 167
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x32 	MulDiv_IntMulConst17_eblock614
.label MulDiv_IntMulConst17_ctb613 ;Main true block ;keep 
	; LineNumber: 166
	call Common_PASS
	jump MulDiv_IntMulConst17_edblock615
.label MulDiv_IntMulConst17_eblock614
	; LineNumber: 166
	call Common_FAIL
.label MulDiv_IntMulConst17_edblock615
	; LineNumber: 170
	return
.label end_procedure_MulDiv_IntMulConst17
	
; //	Text::Print(Vars::i1);
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntCombConst18
	;    Procedure type : User-defined procedure
	; LineNumber: 174
.label MulDiv_IntCombConst18
	; LineNumber: 175
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 176
	; push
	; push
	mulu  	_r16_2 	Vars_v1 	uint16:0x05
	add  	_r16_1 	uint16:0x4b0 	_r16_2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 177
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntCombConst18_stringassigncpy622
	load 	MulDiv_IntCombConst18_stringassignstr621 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntCombConst18_stringassigncpy622
	; LineNumber: 178
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e2 	MulDiv_IntCombConst18_eblock625
.label MulDiv_IntCombConst18_ctb624 ;Main true block ;keep 
	; LineNumber: 177
	call Common_PASS
	jump MulDiv_IntCombConst18_edblock626
.label MulDiv_IntCombConst18_eblock625
	; LineNumber: 177
	call Common_FAIL
.label MulDiv_IntCombConst18_edblock626
	; LineNumber: 179
	return
.label end_procedure_MulDiv_IntCombConst18
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntCombConst19
	;    Procedure type : User-defined procedure
	; LineNumber: 183
.label MulDiv_IntCombConst19
	; LineNumber: 184
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 185
	; push
	; push
	; push
	mulu  	_r16_3 	Vars_v1 	uint16:0x05
	add  	_r16_2 	uint16:0x4b0 	_r16_3
	mulu  	_r16_1 	_r16_2 	uint16:0x04
	mov 	Vars_i1 	_r16_1
	; LineNumber: 186
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntCombConst19_stringassigncpy633
	load 	MulDiv_IntCombConst19_stringassignstr632 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntCombConst19_stringassigncpy633
	; LineNumber: 187
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1388 	MulDiv_IntCombConst19_eblock636
.label MulDiv_IntCombConst19_ctb635 ;Main true block ;keep 
	; LineNumber: 186
	call Common_PASS
	jump MulDiv_IntCombConst19_edblock637
.label MulDiv_IntCombConst19_eblock636
	; LineNumber: 186
	call Common_FAIL
.label MulDiv_IntCombConst19_edblock637
	; LineNumber: 188
	return
.label end_procedure_MulDiv_IntCombConst19
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntShift20
	;    Procedure type : User-defined procedure
	; LineNumber: 191
.label MulDiv_IntShift20
	; LineNumber: 192
	mov 	Vars_i1 	uint8:0x0a
	; LineNumber: 193
	; push
	shl  	_r16_1 	Vars_i1 	uint16:0x07
	mov 	Vars_i1 	_r16_1
	; LineNumber: 194
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntShift20_stringassigncpy644
	load 	MulDiv_IntShift20_stringassignstr643 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntShift20_stringassigncpy644
	; LineNumber: 195
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x500 	MulDiv_IntShift20_eblock647
.label MulDiv_IntShift20_ctb646 ;Main true block ;keep 
	; LineNumber: 194
	call Common_PASS
	jump MulDiv_IntShift20_edblock648
.label MulDiv_IntShift20_eblock647
	; LineNumber: 194
	call Common_FAIL
.label MulDiv_IntShift20_edblock648
	; LineNumber: 197
	return
.label end_procedure_MulDiv_IntShift20
	
; //	DebugValue(Vars::i1);
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntShift21
	;    Procedure type : User-defined procedure
	; LineNumber: 200
.label MulDiv_IntShift21
	; LineNumber: 201
	mov 	Vars_i1 	uint16:0x500
	; LineNumber: 202
	; push
	shr  	_r16_1 	Vars_i1 	uint16:0x07
	mov 	Vars_i1 	_r16_1
	; LineNumber: 203
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntShift21_stringassigncpy655
	load 	MulDiv_IntShift21_stringassignstr654 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntShift21_stringassigncpy655
	; LineNumber: 204
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x0a 	MulDiv_IntShift21_eblock658
.label MulDiv_IntShift21_ctb657 ;Main true block ;keep 
	; LineNumber: 203
	call Common_PASS
	jump MulDiv_IntShift21_edblock659
.label MulDiv_IntShift21_eblock658
	; LineNumber: 203
	call Common_FAIL
.label MulDiv_IntShift21_edblock659
	; LineNumber: 205
	return
.label end_procedure_MulDiv_IntShift21
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Array1
	;    Procedure type : User-defined procedure
	; LineNumber: 209
.label MulDiv_Array1
	; LineNumber: 210
	; push
	mov 	_r8_1 	uint8:0x0a
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	Vars_barr 	uint8:0x03 	_r8_1
	; LineNumber: 211
	; push
	mov 	_r8_1 	uint8:0x07
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	Vars_barr 	uint8:0x07 	_r8_1
	; LineNumber: 212
	; push
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x03 	_r8_2
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x07 	_r8_3
	add  	_r8_1 	_r8_2 	_r8_3
	mov 	Vars_v1 	_r8_1
	; LineNumber: 213
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Array1_stringassigncpy666
	load 	MulDiv_Array1_stringassignstr665 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Array1_stringassigncpy666
	; LineNumber: 214
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x11 	MulDiv_Array1_eblock669
.label MulDiv_Array1_ctb668 ;Main true block ;keep 
	; LineNumber: 213
	call Common_PASS
	jump MulDiv_Array1_edblock670
.label MulDiv_Array1_eblock669
	; LineNumber: 213
	call Common_FAIL
.label MulDiv_Array1_edblock670
	; LineNumber: 215
	return
.label end_procedure_MulDiv_Array1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift0
	;    Procedure type : User-defined procedure
	; LineNumber: 219
.label MulDiv_Shift0
	; LineNumber: 220
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 221
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 222
	; push
	shl  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	; LineNumber: 224
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift0_stringassigncpy677
	load 	MulDiv_Shift0_stringassignstr676 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift0_stringassigncpy677
	; LineNumber: 225
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x14 	MulDiv_Shift0_eblock680
.label MulDiv_Shift0_ctb679 ;Main true block ;keep 
	; LineNumber: 224
	call Common_PASS
	jump MulDiv_Shift0_edblock681
.label MulDiv_Shift0_eblock680
	; LineNumber: 224
	call Common_FAIL
.label MulDiv_Shift0_edblock681
	; LineNumber: 226
	return
.label end_procedure_MulDiv_Shift0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift1
	;    Procedure type : User-defined procedure
	; LineNumber: 230
.label MulDiv_Shift1
	; LineNumber: 231
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 232
	mov 	Vars_v2 	uint8:0x02
	; LineNumber: 233
	; push
	shl  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	; LineNumber: 235
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift1_stringassigncpy688
	load 	MulDiv_Shift1_stringassignstr687 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift1_stringassigncpy688
	; LineNumber: 236
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x28 	MulDiv_Shift1_eblock691
.label MulDiv_Shift1_ctb690 ;Main true block ;keep 
	; LineNumber: 235
	call Common_PASS
	jump MulDiv_Shift1_edblock692
.label MulDiv_Shift1_eblock691
	; LineNumber: 235
	call Common_FAIL
.label MulDiv_Shift1_edblock692
	; LineNumber: 237
	return
.label end_procedure_MulDiv_Shift1
	
; // Test shift 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift2
	;    Procedure type : User-defined procedure
	; LineNumber: 241
.label MulDiv_Shift2
	; LineNumber: 242
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 243
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 244
	; push
	shl  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	; LineNumber: 246
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift2_stringassigncpy699
	load 	MulDiv_Shift2_stringassignstr698 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift2_stringassigncpy699
	; LineNumber: 247
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x0a 	MulDiv_Shift2_eblock702
.label MulDiv_Shift2_ctb701 ;Main true block ;keep 
	; LineNumber: 246
	call Common_PASS
	jump MulDiv_Shift2_edblock703
.label MulDiv_Shift2_eblock702
	; LineNumber: 246
	call Common_FAIL
.label MulDiv_Shift2_edblock703
	; LineNumber: 248
	return
.label end_procedure_MulDiv_Shift2
	
; // Shift integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift4
	;    Procedure type : User-defined procedure
	; LineNumber: 252
.label MulDiv_Shift4
	; LineNumber: 253
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 254
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 255
	; push
	shl  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	; LineNumber: 257
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift4_stringassigncpy710
	load 	MulDiv_Shift4_stringassignstr709 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift4_stringassigncpy710
	; LineNumber: 258
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x7d0 	MulDiv_Shift4_eblock713
.label MulDiv_Shift4_ctb712 ;Main true block ;keep 
	; LineNumber: 257
	call Common_PASS
	jump MulDiv_Shift4_edblock714
.label MulDiv_Shift4_eblock713
	; LineNumber: 257
	call Common_FAIL
.label MulDiv_Shift4_edblock714
	; LineNumber: 260
	return
.label end_procedure_MulDiv_Shift4
	
; // Shift integer 2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift5
	;    Procedure type : User-defined procedure
	; LineNumber: 264
.label MulDiv_Shift5
	; LineNumber: 265
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 266
	mov 	Vars_v2 	uint8:0x03
	; LineNumber: 267
	; push
	shl  	_r16_1 	Vars_i1 	Vars_v2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 269
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift5_stringassigncpy721
	load 	MulDiv_Shift5_stringassignstr720 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift5_stringassigncpy721
	; LineNumber: 270
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1f40 	MulDiv_Shift5_eblock724
.label MulDiv_Shift5_ctb723 ;Main true block ;keep 
	; LineNumber: 269
	call Common_PASS
	jump MulDiv_Shift5_edblock725
.label MulDiv_Shift5_eblock724
	; LineNumber: 269
	call Common_FAIL
.label MulDiv_Shift5_edblock725
	; LineNumber: 271
	mov 	Common_v 	Vars_i1
	call Common_DebugValue
	; LineNumber: 273
	return
.label end_procedure_MulDiv_Shift5
	
; // Shift integer with zero
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Shift6
	;    Procedure type : User-defined procedure
	; LineNumber: 277
.label MulDiv_Shift6
	; LineNumber: 278
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 279
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 280
	; push
	shl  	_r16_1 	Vars_i1 	Vars_v2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 282
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_Shift6_stringassigncpy732
	load 	MulDiv_Shift6_stringassignstr731 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift6_stringassigncpy732
	; LineNumber: 283
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_Shift6_eblock735
.label MulDiv_Shift6_ctb734 ;Main true block ;keep 
	; LineNumber: 282
	call Common_PASS
	jump MulDiv_Shift6_edblock736
.label MulDiv_Shift6_eblock735
	; LineNumber: 282
	call Common_FAIL
.label MulDiv_Shift6_edblock736
	; LineNumber: 284
	mov 	Common_v 	Vars_i1
	call Common_DebugValue
	; LineNumber: 286
	return
.label end_procedure_MulDiv_Shift6
	
; // Byte int mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntByteMulR1
	;    Procedure type : User-defined procedure
	; LineNumber: 290
.label MulDiv_IntByteMulR1
	; LineNumber: 291
	mov 	Vars_v1 	uint8:0x03
	; LineNumber: 292
	mov 	Vars_ri 	uint16:0x1f4
	; LineNumber: 293
	; push
	; push
	mulu  	_r16_2 	uint16:0x3e8 	Vars_v1
	add  	_r16_1 	Vars_ri 	_r16_2
	mov 	Vars_ri 	_r16_1
	; LineNumber: 294
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntByteMulR1_stringassigncpy743
	load 	MulDiv_IntByteMulR1_stringassignstr742 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR1_stringassigncpy743
	; LineNumber: 295
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xdac 	MulDiv_IntByteMulR1_eblock746
.label MulDiv_IntByteMulR1_ctb745 ;Main true block ;keep 
	; LineNumber: 294
	call Common_PASS
	jump MulDiv_IntByteMulR1_edblock747
.label MulDiv_IntByteMulR1_eblock746
	; LineNumber: 294
	call Common_FAIL
.label MulDiv_IntByteMulR1_edblock747
	; LineNumber: 296
	return
.label end_procedure_MulDiv_IntByteMulR1
	
; // Byte int mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntByteMulR2
	;    Procedure type : User-defined procedure
	; LineNumber: 300
.label MulDiv_IntByteMulR2
	; LineNumber: 301
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 302
	mov 	Vars_ri 	uint16:0x1f4
	; LineNumber: 303
	; push
	; push
	mulu  	_r16_2 	Vars_v1 	uint16:0x3e8
	add  	_r16_1 	Vars_ri 	_r16_2
	mov 	Vars_ri 	_r16_1
	; LineNumber: 304
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntByteMulR2_stringassigncpy754
	load 	MulDiv_IntByteMulR2_stringassignstr753 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR2_stringassigncpy754
	; LineNumber: 305
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x1194 	MulDiv_IntByteMulR2_eblock757
.label MulDiv_IntByteMulR2_ctb756 ;Main true block ;keep 
	; LineNumber: 304
	call Common_PASS
	jump MulDiv_IntByteMulR2_edblock758
.label MulDiv_IntByteMulR2_eblock757
	; LineNumber: 304
	call Common_FAIL
.label MulDiv_IntByteMulR2_edblock758
	; LineNumber: 306
	return
.label end_procedure_MulDiv_IntByteMulR2
	
; // Byte int mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntByteMulR3
	;    Procedure type : User-defined procedure
	; LineNumber: 311
.label MulDiv_IntByteMulR3
	; LineNumber: 312
	mov 	Vars_v1 	uint8:0x03
	; LineNumber: 313
	mov 	Vars_ri 	uint16:0x1f4
	; LineNumber: 314
	; push
	; push
	mulu  	_r16_2 	uint16:0x64 	Vars_v1
	add  	_r16_1 	Vars_ri 	_r16_2
	mov 	Vars_ri 	_r16_1
	; LineNumber: 315
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntByteMulR3_stringassigncpy765
	load 	MulDiv_IntByteMulR3_stringassignstr764 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR3_stringassigncpy765
	; LineNumber: 316
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x320 	MulDiv_IntByteMulR3_eblock768
.label MulDiv_IntByteMulR3_ctb767 ;Main true block ;keep 
	; LineNumber: 315
	call Common_PASS
	jump MulDiv_IntByteMulR3_edblock769
.label MulDiv_IntByteMulR3_eblock768
	; LineNumber: 315
	call Common_FAIL
.label MulDiv_IntByteMulR3_edblock769
	; LineNumber: 317
	return
.label end_procedure_MulDiv_IntByteMulR3
	
; // Byte int mul
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_IntByteMulR4
	;    Procedure type : User-defined procedure
	; LineNumber: 321
.label MulDiv_IntByteMulR4
	; LineNumber: 322
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 323
	mov 	Vars_ri 	uint16:0x1f4
	; LineNumber: 324
	; push
	; push
	mulu  	_r16_2 	Vars_v1 	uint16:0x64
	add  	_r16_1 	Vars_ri 	_r16_2
	mov 	Vars_ri 	_r16_1
	; LineNumber: 325
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_IntByteMulR4_stringassigncpy776
	load 	MulDiv_IntByteMulR4_stringassignstr775 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR4_stringassigncpy776
	; LineNumber: 326
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x384 	MulDiv_IntByteMulR4_eblock779
.label MulDiv_IntByteMulR4_ctb778 ;Main true block ;keep 
	; LineNumber: 325
	call Common_PASS
	jump MulDiv_IntByteMulR4_edblock780
.label MulDiv_IntByteMulR4_eblock779
	; LineNumber: 325
	call Common_FAIL
.label MulDiv_IntByteMulR4_edblock780
	; LineNumber: 327
	return
.label end_procedure_MulDiv_IntByteMulR4
	
; // Byte mul byte plus 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulBytePlus01
	;    Procedure type : User-defined procedure
	; LineNumber: 331
.label MulDiv_ByteMulBytePlus01
	; LineNumber: 332
	mov 	Vars_v1 	uint8:0x0f
	; LineNumber: 333
	mov 	Vars_v2 	uint8:0x09
	; LineNumber: 334
	; push
	; push
	mulu  	_r8_2 	Vars_v1 	Vars_v2
	add  	_r8_1 	uint8:0x0a 	_r8_2
	mov 	Vars_rb 	_r8_1
	; LineNumber: 336
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulBytePlus01_stringassigncpy787
	load 	MulDiv_ByteMulBytePlus01_stringassignstr786 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePlus01_stringassigncpy787
	; LineNumber: 336
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x91 	MulDiv_ByteMulBytePlus01_eblock790
.label MulDiv_ByteMulBytePlus01_ctb789 ;Main true block ;keep 
	; LineNumber: 335
	call Common_PASS
	jump MulDiv_ByteMulBytePlus01_edblock791
.label MulDiv_ByteMulBytePlus01_eblock790
	; LineNumber: 335
	call Common_FAIL
.label MulDiv_ByteMulBytePlus01_edblock791
	; LineNumber: 337
	return
.label end_procedure_MulDiv_ByteMulBytePlus01
	
; // Byte mul byte plus 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_ByteMulBytePlus02
	;    Procedure type : User-defined procedure
	; LineNumber: 341
.label MulDiv_ByteMulBytePlus02
	; LineNumber: 342
	mov 	Vars_v1 	uint8:0x0f
	; LineNumber: 343
	mov 	Vars_v2 	uint8:0x03
	; LineNumber: 344
	; push
	; push
	divu  	_r8_2 	Vars_v1 	Vars_v2
	add  	_r8_1 	uint8:0x0a 	_r8_2
	mov 	Vars_rb 	_r8_1
	; LineNumber: 346
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label MulDiv_ByteMulBytePlus02_stringassigncpy798
	load 	MulDiv_ByteMulBytePlus02_stringassignstr797 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePlus02_stringassigncpy798
	; LineNumber: 346
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x0f 	MulDiv_ByteMulBytePlus02_eblock801
.label MulDiv_ByteMulBytePlus02_ctb800 ;Main true block ;keep 
	; LineNumber: 345
	call Common_PASS
	jump MulDiv_ByteMulBytePlus02_edblock802
.label MulDiv_ByteMulBytePlus02_eblock801
	; LineNumber: 345
	call Common_FAIL
.label MulDiv_ByteMulBytePlus02_edblock802
	; LineNumber: 347
	return
.label end_procedure_MulDiv_ByteMulBytePlus02
	; NodeProcedureDecl -1
	; ***********  Defining procedure : MulDiv_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 353
.label MulDiv_Exec
	; LineNumber: 355
	
; // initialise everything
	; Assigning a string : Common_zp
	mov 	Common_zp 	#MulDiv_Exec_stringassignstr808
	call Common_Initialise
	; LineNumber: 359
	
; // Mul and div
	call MulDiv_ByteMulBytePlus01
	; LineNumber: 360
	call MulDiv_ByteMulBytePlus02
	; LineNumber: 361
	call MulDiv_IntByteMulR1
	; LineNumber: 362
	call MulDiv_IntByteMulR2
	; LineNumber: 363
	call MulDiv_IntByteMulR3
	; LineNumber: 364
	call MulDiv_IntByteMulR4
	; LineNumber: 365
	call MulDiv_ByteMulByte01
	; LineNumber: 366
	call MulDiv_ByteMulBytePow202
	; LineNumber: 368
	
; // Doesn't work because of `ex`
	call MulDiv_IntByteMul06
	; LineNumber: 369
	call MulDiv_IntMulPow07
	; LineNumber: 370
	call MulDiv_IntMulMix13
	; LineNumber: 372
	
; // Z80 lacks int*int
	call MulDiv_IntMulInt14
	; LineNumber: 373
	
; // Not implemented, fails
	call MulDiv_IntMulAdvancedMix15
	; LineNumber: 376
	
; // fails
	call MulDiv_ByteMulAdvanced16
	; LineNumber: 378
	call MulDiv_IntMulConst17
	; LineNumber: 379
	call MulDiv_IntCombConst18
	; LineNumber: 380
	call MulDiv_IntCombConst19
	; LineNumber: 381
	call MulDiv_IntShift20
	; LineNumber: 382
	call MulDiv_IntShift21
	; LineNumber: 385
	call MulDiv_ByteMulMul05
	; LineNumber: 387
	call MulDiv_Array1
	; LineNumber: 391
	call MulDiv_ByteDivBytePow203
	; LineNumber: 392
	call MulDiv_ByteDivByte04
	; LineNumber: 393
	call MulDiv_IntDivByte08
	; LineNumber: 394
	call MulDiv_IntDivInt09
	; LineNumber: 395
	call MulDiv_IntDivPow210
	; LineNumber: 396
	call MulDiv_IntDivMix11
	; LineNumber: 397
	call MulDiv_IntDivMix12
	; LineNumber: 399
	call MulDiv_IntMulAdvancedMix15
	; LineNumber: 402
	call MulDiv_Shift0
	; LineNumber: 403
	call MulDiv_Shift1
	; LineNumber: 404
	call MulDiv_Shift2
	; LineNumber: 405
	call MulDiv_Shift4
	; LineNumber: 407
	
; //	@ifdef C64
	call MulDiv_Shift5
	; LineNumber: 408
	call MulDiv_Shift6
	; LineNumber: 410
	
; //	@endif
	call Common_WaitABit
	; LineNumber: 412
	return
.label end_procedure_MulDiv_Exec
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 10
.label Strings_Test1
	; LineNumber: 11
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_Test1_stringassigncpy811
	load 	Strings_Test1_stringassignstr810 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test1_stringassigncpy811
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	uint8:0x07 	uint8:0x07 	Strings_Test1_eblock814
.label Strings_Test1_ctb813 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump Strings_Test1_edblock815
.label Strings_Test1_eblock814
	; LineNumber: 11
	call Common_FAIL
.label Strings_Test1_edblock815
	; LineNumber: 13
	return
.label end_procedure_Strings_Test1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 17
.label Strings_Test2
	; LineNumber: 18
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_Test2_stringassigncpy822
	load 	Strings_Test2_stringassignstr821 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test2_stringassigncpy822
	; LineNumber: 19
	; Binary clause Simplified: EQUALS
	jneq 	uint8:0x0a 	uint8:0x0a 	Strings_Test2_eblock825
.label Strings_Test2_ctb824 ;Main true block ;keep 
	; LineNumber: 18
	call Common_PASS
	jump Strings_Test2_edblock826
.label Strings_Test2_eblock825
	; LineNumber: 18
	call Common_FAIL
.label Strings_Test2_edblock826
	; LineNumber: 20
	return
.label end_procedure_Strings_Test2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 22
.label Strings_Test3
	; LineNumber: 23
	mov 	Vars_p1 	uint16:0x8800
	; LineNumber: 24
	store Vars_p1 uint8:0x04 uint8:0x41
	; LineNumber: 25
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_Test3_stringassigncpy833
	load 	Strings_Test3_stringassignstr832 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test3_stringassigncpy833
	; LineNumber: 26
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x04 	_r8_1
	jneq 	_r8_1 	uint8:0x41 	Strings_Test3_eblock836
.label Strings_Test3_ctb835 ;Main true block ;keep 
	; LineNumber: 25
	call Common_PASS
	jump Strings_Test3_edblock837
.label Strings_Test3_eblock836
	; LineNumber: 25
	call Common_FAIL
.label Strings_Test3_edblock837
	; LineNumber: 27
	return
.label end_procedure_Strings_Test3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst1
	;    Procedure type : User-defined procedure
	; LineNumber: 32
.label Strings_TestLst1
	; LineNumber: 33
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst1_stringassigncpy844
	load 	Strings_TestLst1_stringassignstr843 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst1_stringassigncpy844
	; LineNumber: 34
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 35
	.asm
 nop
	.endasm
	; LineNumber: 36
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x01 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 37
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x32 	Strings_TestLst1_eblock847
.label Strings_TestLst1_ctb846 ;Main true block ;keep 
	; LineNumber: 36
	call Common_PASS
	jump Strings_TestLst1_edblock848
.label Strings_TestLst1_eblock847
	; LineNumber: 36
	call Common_FAIL
.label Strings_TestLst1_edblock848
	; LineNumber: 38
	return
.label end_procedure_Strings_TestLst1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst2
	;    Procedure type : User-defined procedure
	; LineNumber: 41
.label Strings_TestLst2
	; LineNumber: 42
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst2_stringassigncpy855
	load 	Strings_TestLst2_stringassignstr854 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst2_stringassigncpy855
	; LineNumber: 44
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x4b 	Strings_TestLst2_eblock858
.label Strings_TestLst2_ctb857 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump Strings_TestLst2_edblock859
.label Strings_TestLst2_eblock858
	; LineNumber: 44
	call Common_FAIL
.label Strings_TestLst2_edblock859
	; LineNumber: 46
	return
.label end_procedure_Strings_TestLst2
	
; // Copy string directly to list
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst3
	;    Procedure type : User-defined procedure
	; LineNumber: 50
.label Strings_TestLst3
	; LineNumber: 51
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst3_stringassigncpy866
	load 	Strings_TestLst3_stringassignstr865 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst3_stringassigncpy866
	; LineNumber: 52
	; Assigning a string : Vars_strLst
	; push
	; push
	; push
	load 	Vars_strLst 	uint8:0x02 	_rp8_1
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst3_stringassigncpy868
	load 	Strings_TestLst3_stringassignstr867 	_r8_2 	_r8_1
	store 	_rp8_1 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst3_stringassigncpy868
	; LineNumber: 53
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x45 	Strings_TestLst3_eblock871
.label Strings_TestLst3_ctb870 ;Main true block ;keep 
	; LineNumber: 54
	call Common_PASS
	jump Strings_TestLst3_edblock872
.label Strings_TestLst3_eblock871
	; LineNumber: 54
	call Common_FAIL
.label Strings_TestLst3_edblock872
	; LineNumber: 56
	return
.label end_procedure_Strings_TestLst3
	
; // Setting a pointer to string
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst4
	;    Procedure type : User-defined procedure
	; LineNumber: 60
.label Strings_TestLst4
	; LineNumber: 61
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst4_stringassigncpy879
	load 	Strings_TestLst4_stringassignstr878 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst4_stringassigncpy879
	; LineNumber: 62
	; Assigning a string : Vars_p1
	mov 	Vars_p1 	#Strings_TestLst4_stringassignstr880
	; LineNumber: 63
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x59 	Strings_TestLst4_eblock883
.label Strings_TestLst4_ctb882 ;Main true block ;keep 
	; LineNumber: 62
	call Common_PASS
	jump Strings_TestLst4_edblock884
.label Strings_TestLst4_eblock883
	; LineNumber: 62
	call Common_FAIL
.label Strings_TestLst4_edblock884
	; LineNumber: 64
	return
.label end_procedure_Strings_TestLst4
	
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 70
.label Strings_Exec
	; LineNumber: 71
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Strings_Exec_stringassignstr890
	call Common_Initialise
	; LineNumber: 74
	call Strings_Test1
	; LineNumber: 78
	call Strings_Test2
	; LineNumber: 79
	call Strings_Test3
	; LineNumber: 82
	call Strings_TestLst1
	; LineNumber: 83
	call Strings_TestLst2
	; LineNumber: 84
	call Strings_TestLst3
	; LineNumber: 85
	call Strings_TestLst4
	; LineNumber: 88
	call Common_WaitABit
	; LineNumber: 89
	return
.label end_procedure_Strings_Exec
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnByte
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label Functions_FnByte_block891
.label Functions_FnByte
	; LineNumber: 7
	; push
	mulu  	_r8_1 	Functions_fn1 	uint8:0x02
	mov 	Vars_v1 	_r8_1
	; LineNumber: 9
	; LineNumber: 9
	; Setting function return value
	mov 	Functions_FnByte_fret 	Vars_v1
	return
.label end_procedure_Functions_FnByte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnByteAdv
	;    Procedure type : User-defined procedure
	; LineNumber: 12
.label Functions_FnByteAdv_block892
.label Functions_FnByteAdv
	; LineNumber: 14
	; LineNumber: 14
	; Setting function return value
	; push
	; push
	; push
	mulu  	_r8_3 	Functions_fn1 	uint8:0x0a
	add  	_r8_2 	_r8_3 	uint8:0x05
	mulu  	_r8_1 	_r8_2 	uint8:0x02
	mov 	Functions_FnByteAdv_fret 	_r8_1
	return
.label end_procedure_Functions_FnByteAdv
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnByteInt
	;    Procedure type : User-defined procedure
	; LineNumber: 17
.label Functions_FnByteInt_block893
.label Functions_FnByteInt
	; LineNumber: 18
	; push
	mulu  	_r16_1 	Functions_fn1 	uint8:0xc8
	mov 	Vars_i2 	_r16_1
	; LineNumber: 20
	; LineNumber: 21
	; Setting function return value
	mov 	Functions_FnByteInt_fret 	Vars_i2
	return
.label end_procedure_Functions_FnByteInt
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnInt1
	;    Procedure type : User-defined procedure
	; LineNumber: 24
.label Functions_FnInt1_block894
.label Functions_FnInt1
	; LineNumber: 26
	; LineNumber: 26
	; Setting function return value
	; push
	mulu  	_r16_1 	Functions_fn1 	uint16:0x02
	mov 	Functions_FnInt1_fret 	_r16_1
	return
.label end_procedure_Functions_FnInt1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnInt2
	;    Procedure type : User-defined procedure
	; LineNumber: 29
.label Functions_FnInt2_block895
.label Functions_FnInt2
	; LineNumber: 31
	; LineNumber: 31
	; Setting function return value
	; push
	; push
	mulu  	_r16_2 	Functions_fn1 	uint16:0xc8
	add  	_r16_1 	_r16_2 	uint16:0x0a
	mov 	Functions_FnInt2_fret 	_r16_1
	return
.label end_procedure_Functions_FnInt2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_FnInt3
	;    Procedure type : User-defined procedure
	; LineNumber: 34
.label Functions_FnInt3_block896
.label Functions_FnInt3
	; LineNumber: 35
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 37
	; LineNumber: 37
	; Setting function return value
	; push
	; push
	; push
	mulu  	_r16_3 	Functions_fn1 	uint16:0xc8
	add  	_r16_2 	_r16_3 	uint16:0x0a
	mulu  	_r16_1 	_r16_2 	Vars_v1
	mov 	Functions_FnInt3_fret 	_r16_1
	return
.label end_procedure_Functions_FnInt3
	
; // simple byte return value
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 42
.label Functions_Test1
	; LineNumber: 43
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test1_stringassigncpy899
	load 	Functions_Test1_stringassignstr898 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test1_stringassigncpy899
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByte
	jneq 	Functions_FnByte_fret 	uint8:0x04 	Functions_Test1_eblock902
.label Functions_Test1_ctb901 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump Functions_Test1_edblock903
.label Functions_Test1_eblock902
	; LineNumber: 43
	call Common_FAIL
.label Functions_Test1_edblock903
	; LineNumber: 45
	return
.label end_procedure_Functions_Test1
	
; // byte function returns integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 49
.label Functions_Test2
	; LineNumber: 50
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test2_stringassigncpy910
	load 	Functions_Test2_stringassignstr909 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test2_stringassigncpy910
	; LineNumber: 51
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteAdv
	jneq 	Functions_FnByteAdv_fret 	uint8:0x32 	Functions_Test2_eblock913
.label Functions_Test2_ctb912 ;Main true block ;keep 
	; LineNumber: 50
	call Common_PASS
	jump Functions_Test2_edblock914
.label Functions_Test2_eblock913
	; LineNumber: 50
	call Common_FAIL
.label Functions_Test2_edblock914
	; LineNumber: 52
	return
.label end_procedure_Functions_Test2
	
; // byte function returns integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 56
.label Functions_Test3
	; LineNumber: 57
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test3_stringassigncpy921
	load 	Functions_Test3_stringassignstr920 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test3_stringassigncpy921
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteInt
	jneq 	Functions_FnByteInt_fret 	uint8:0x90 	Functions_Test3_eblock924
.label Functions_Test3_ctb923 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump Functions_Test3_edblock925
.label Functions_Test3_eblock924
	; LineNumber: 57
	call Common_FAIL
.label Functions_Test3_edblock925
	; LineNumber: 59
	return
.label end_procedure_Functions_Test3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test4
	;    Procedure type : User-defined procedure
	; LineNumber: 62
.label Functions_Test4
	; LineNumber: 63
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test4_stringassigncpy932
	load 	Functions_Test4_stringassignstr931 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test4_stringassigncpy932
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0xc8
	call Functions_FnInt1
	jneq 	Functions_FnInt1_fret 	uint16:0x190 	Functions_Test4_eblock935
.label Functions_Test4_ctb934 ;Main true block ;keep 
	; LineNumber: 63
	call Common_PASS
	jump Functions_Test4_edblock936
.label Functions_Test4_eblock935
	; LineNumber: 63
	call Common_FAIL
.label Functions_Test4_edblock936
	; LineNumber: 65
	return
.label end_procedure_Functions_Test4
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test5
	;    Procedure type : User-defined procedure
	; LineNumber: 68
.label Functions_Test5
	; LineNumber: 69
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test5_stringassigncpy943
	load 	Functions_Test5_stringassignstr942 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test5_stringassigncpy943
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt2
	jneq 	Functions_FnInt2_fret 	uint16:0x7da 	Functions_Test5_eblock946
.label Functions_Test5_ctb945 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump Functions_Test5_edblock947
.label Functions_Test5_eblock946
	; LineNumber: 69
	call Common_FAIL
.label Functions_Test5_edblock947
	; LineNumber: 71
	return
.label end_procedure_Functions_Test5
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Test6
	;    Procedure type : User-defined procedure
	; LineNumber: 74
.label Functions_Test6
	; LineNumber: 75
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Functions_Test6_stringassigncpy954
	load 	Functions_Test6_stringassignstr953 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test6_stringassigncpy954
	; LineNumber: 76
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt3
	jneq 	Functions_FnInt3_fret 	uint16:0xfb4 	Functions_Test6_eblock957
.label Functions_Test6_ctb956 ;Main true block ;keep 
	; LineNumber: 75
	call Common_PASS
	jump Functions_Test6_edblock958
.label Functions_Test6_eblock957
	; LineNumber: 75
	call Common_FAIL
.label Functions_Test6_edblock958
	; LineNumber: 77
	return
.label end_procedure_Functions_Test6
	; MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Functions_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 82
.label Functions_Exec
	; LineNumber: 83
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Functions_Exec_stringassignstr964
	call Common_Initialise
	; LineNumber: 85
	call Functions_Test1
	; LineNumber: 86
	call Functions_Test2
	; LineNumber: 87
	call Functions_Test3
	; LineNumber: 88
	call Functions_Test4
	; LineNumber: 89
	call Functions_Test5
	; LineNumber: 90
	call Functions_Test6
	; LineNumber: 91
	call Common_WaitABit
	; LineNumber: 92
	return
.label end_procedure_Functions_Exec
	
; //	allTests: array[] of integer = (#AdvancedTests);
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Unittests_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 34
.label Unittests_Exec
	; LineNumber: 35
	mov 	Unittests_currentTest 	uint8:0x00
	; LineNumber: 36
	mov 	Unittests_isDone 	uint8:0x00
	; LineNumber: 37
	call Common_TestInit
	; LineNumber: 39
.label Unittests_Exec_while966
.label Unittests_Exec_loopstart970
	; Binary clause Simplified: EQUALS
	call Common_Status
	jneq 	Common_Status_fret 	uint8:0x00 	Unittests_Exec_edblock969
.label Unittests_Exec_localsuccess1015 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_isDone 	uint8:0x00 	Unittests_Exec_edblock969
.label Unittests_Exec_ctb967 ;Main true block ;keep 
	; LineNumber: 45
	; LineNumber: 46
	call Common_TestSuiteInit
	; LineNumber: 50
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0d 	Unittests_Exec_edblock1020
.label Unittests_Exec_ctb1018 ;Main true block ;keep 
	; LineNumber: 49
	
; // Pointer tests - the x86 needs a different set of pointer tests.
	call AdvancedMath_Exec
.label Unittests_Exec_edblock1020
	; LineNumber: 53
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x06 	Unittests_Exec_edblock1025
.label Unittests_Exec_ctb1023 ;Main true block ;keep 
	; LineNumber: 52
	call MulDiv_Exec
.label Unittests_Exec_edblock1025
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x02 	Unittests_Exec_edblock1030
.label Unittests_Exec_ctb1028 ;Main true block ;keep 
	; LineNumber: 53
	call Strings_Exec
.label Unittests_Exec_edblock1030
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x03 	Unittests_Exec_edblock1035
.label Unittests_Exec_ctb1033 ;Main true block ;keep 
	; LineNumber: 54
	call Functions_Exec
.label Unittests_Exec_edblock1035
	; LineNumber: 56
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x04 	Unittests_Exec_edblock1040
.label Unittests_Exec_ctb1038 ;Main true block ;keep 
	; LineNumber: 55
	call CaseTest_Exec
.label Unittests_Exec_edblock1040
	; LineNumber: 57
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x05 	Unittests_Exec_edblock1045
.label Unittests_Exec_ctb1043 ;Main true block ;keep 
	; LineNumber: 56
	call Casts_Exec
.label Unittests_Exec_edblock1045
	; LineNumber: 79
	;		if (currentTest=1) then ForLoop::Exec();
; //
; // Tripe doesn't have regs
; //@ifndef USE_TRIPE
; //		if (currentTest=7) then Registers::Exec();
; //@endif 
; //		if (currentTest=8) then BitOp::Exec();
; //		if (currentTest=9) then IfThenElse::Exec();
; //		if (currentTest=10) then IntegerTest::Exec();
; //@ifndef CPU_PCHIP8
; //		if (currentTest=11) then Various::Exec();
; //@endif
; //@ifndef CPU_M68000
; //@ifndef USE_TRIPE
; //		if (currentTest=12) then BooleanTest::Exec();
; //@endif		
; //@endif
; //		if (currentTest=0) then LongTest::Exec();
; //
; //		if (currentTest=14) then Classes::Exec();
	; push
	add  	_r8_1 	Unittests_currentTest 	uint8:0x01
	mov 	Unittests_currentTest 	_r8_1
	; LineNumber: 81
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Unittests_currentTest 	uint8:0x0f 	Unittests_Exec_edblock1050
.label Unittests_Exec_ctb1048 ;Main true block ;keep 
	; LineNumber: 81
	mov 	Unittests_isDone 	uint8:0x01
.label Unittests_Exec_edblock1050
	; LineNumber: 84
	jump Unittests_Exec_while966
.label Unittests_Exec_edblock969
.label Unittests_Exec_loopend971
	; LineNumber: 85
	return
.label end_procedure_Unittests_Exec
.gcode
.label block1
.label main_block_begin_
	; LineNumber: 9
	
; //44d8 opt
; //
	.asm
	; Disable interrupts
	ldy #$7f    ; $7f = %01111111
	sty $dc0d   ; Turn off CIAs Timer interrupts ;keep
	sty $dd0d   ; Turn off CIAs Timer interrupts ;keep
	lda $dc0d   ; cancel all CIA-IRQs in queue/unprocessed ;keep
	lda $dd0d   ; cancel all CIA-IRQs in queue/unprocessed ;keep
	.endasm
	; LineNumber: 10
	.asm
	sei
	.endasm
	; LineNumber: 11
	.asm
	; Set Memory Config
	lda $01
	and #%11111000
	ora #%101
	sta $01
	.endasm
	; LineNumber: 12
	call Unittests_Exec
	; LineNumber: 17
	.asm
	; MoveTo optimization
	lda #$c5
	sta screenmemory
	lda #$07
	sta screenmemory+1
	.endasm
	; LineNumber: 18
	; Binary clause Simplified: EQUALS
	; push
	load 	$8000 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0x00 	MainProgram_eblock1054
.label MainProgram_ctb1053 ;Main true block ;keep 
	; LineNumber: 18
	.asm
printstring_call1063
	clc
	lda #<printstring_text1064
	adc #$0
	ldy #>printstring_text1064
	sta print_text+0
	sty print_text+1
	lda #$28
	tax
	jsr printstring
	.endasm
	jump MainProgram_edblock1055
.label MainProgram_eblock1054
	; LineNumber: 20
	.asm
printstring_call1066
	clc
	lda #<printstring_text1067
	adc #$0
	ldy #>printstring_text1067
	sta print_text+0
	sty print_text+1
	lda #$28
	tax
	jsr printstring
	.endasm
.label MainProgram_edblock1055
	; LineNumber: 22
	.asm
 brk 
	.endasm
	; LineNumber: 23
	.asm
	jmp * ; loop like (�/%
	.endasm
	; LineNumber: 25
.label main_block_end_
	; End of program
	; Ending memory block at $810
decl 	_r16_1 	uint16:0
decl 	Vars_IntegerReturn_fret 	uint16:0
decl 	_r8_1 	uint8:0
decl 	Vars_ByteReturn_fret 	uint8:0
decl 	Common_Status_fret 	uint8:0
decl 	_r8_2 	uint8:0
decl 	_r16_2 	uint16:0
decl 	_r16_3 	uint16:0
decl 	AdvancedMath_factorial_fret 	uint8:0
decl 	_r8_3 	uint8:0
decl 	_rp8_1 	ptr8:0
decl 	Functions_FnByte_fret 	uint8:0
decl 	Functions_FnByteAdv_fret 	uint8:0
decl 	Functions_FnByteInt_fret 	uint8:0
decl 	Functions_FnInt1_fret 	uint16:0
decl 	Functions_FnInt2_fret 	uint16:0
decl 	Functions_FnInt3_fret 	uint16:0
	decl	screenmemory	 ptr8:$fe
	decl	colormemory	 ptr8:$fc
  decl  CaseTest_Test1_stringassignstr37  uint8:$54
  .uint8 $31 $3a 0
  decl  CaseTest_Test2_stringassignstr55  uint8:$54
  .uint8 $32 $3a 0
  decl  _temp_var_casebab1  uint8:0
  decl  CaseTest_Test3_stringassignstr73  uint8:$54
  .uint8 $33 $3a 0
  decl  CaseTest_Exec_stringassignstr84  uint8:$43
  .uint8 $41 $53 $45 0
  decl  AdvancedMath_Advanced01_stringassignstr86  uint8:$30
  .uint8 $31 $3a 0
  decl  AdvancedMath_Advanced02_stringassignstr97  uint8:$30
  .uint8 $32 $3a 0
  decl  AdvancedMath_Advanced03_stringassignstr108  uint8:$30
  .uint8 $33 $3a 0
  decl  AdvancedMath_Advanced04_stringassignstr119  uint8:$30
  .uint8 $34 $3a 0
  decl  AdvancedMath_Advanced05_stringassignstr130  uint8:$30
  .uint8 $35 $3a 0
  decl  AdvancedMath_Advanced06_stringassignstr141  uint8:$30
  .uint8 $36 $3a 0
  decl  AdvancedMath_Advanced07_stringassignstr152  uint8:$30
  .uint8 $37 $3a 0
  decl  AdvancedMath_Advanced08_stringassignstr163  uint8:$30
  .uint8 $38 $3a 0
  decl  AdvancedMath_MulDivCombo1_stringassignstr181  uint8:$4d
  .uint8 $31 $3a 0
  decl  AdvancedMath_MulDivCombo2_stringassignstr192  uint8:$4d
  .uint8 $32 $3a 0
  decl  AdvancedMath_MulDivCombo3_stringassignstr203  uint8:$4d
  .uint8 $33 $3a 0
  decl  AdvancedMath_Exec_stringassignstr214  uint8:$41
  .uint8 $44 $56 $41 $4e $43 $45 $44
  .uint8 $20 $54 $45 $53 $54 $53 0
  decl  Casts_Test1_stringassignstr216  uint8:$54
  .uint8 $31 $3a 0
  decl  Casts_Test2_stringassignstr228  uint8:$54
  .uint8 $32 $3a 0
  decl  Casts_Test3_stringassignstr240  uint8:$54
  .uint8 $33 $3a 0
  decl  Casts_Test4_stringassignstr252  uint8:$54
  .uint8 $34 $3a 0
  decl  Casts_Test5_stringassignstr264  uint8:$54
  .uint8 $35 $3a 0
  decl  Casts_Test6_stringassignstr276  uint8:$54
  .uint8 $36 $3a 0
  decl  Casts_Test7_stringassignstr288  uint8:$54
  .uint8 $37 $3a 0
  decl  Casts_Test8_stringassignstr300  uint8:$54
  .uint8 $38 $3a 0
  decl  Casts_Test9_stringassignstr312  uint8:$54
  .uint8 $39 $3a 0
  decl  Casts_Test10_stringassignstr324  uint8:$54
  .uint8 $31 $30 $3a 0
  decl  Casts_Test11_stringassignstr336  uint8:$54
  .uint8 $31 $31 $3a 0
  decl  Casts_Test12_stringassignstr348  uint8:$54
  .uint8 $31 $32 $3a 0
  decl  Casts_Test13_stringassignstr360  uint8:$54
  .uint8 $31 $33 $3a 0
  decl  Casts_Test14_stringassignstr372  uint8:$54
  .uint8 $31 $34 $3a 0
  decl  Casts_Test15_stringassignstr384  uint8:$54
  .uint8 $31 $35 $3a 0
  decl  Casts_Test16_stringassignstr396  uint8:$54
  .uint8 $31 $36 $3a 0
  decl  Casts_Test17_stringassignstr408  uint8:$54
  .uint8 $31 $37 $3a 0
  decl  Casts_Test18_stringassignstr420  uint8:$54
  .uint8 $31 $38 $3a 0
  decl  Casts_Exec_stringassignstr432  uint8:$43
  .uint8 $41 $53 $54 $53 0
  decl  MulDiv_ByteMulByte01_stringassignstr434  uint8:$30
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePow202_stringassignstr445  uint8:$30
  .uint8 $32 $3a 0
  decl  MulDiv_ByteDivBytePow203_stringassignstr456  uint8:$30
  .uint8 $33 $3a 0
  decl  MulDiv_ByteDivByte04_stringassignstr467  uint8:$30
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulMul05_stringassignstr478  uint8:$30
  .uint8 $35 $3a 0
  decl  MulDiv_IntByteMul06_stringassignstr489  uint8:$30
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulPow07_stringassignstr500  uint8:$30
  .uint8 $37 $3a 0
  decl  MulDiv_IntDivByte08_stringassignstr511  uint8:$30
  .uint8 $38 $3a 0
  decl  MulDiv_IntDivInt09_stringassignstr522  uint8:$30
  .uint8 $39 $3a 0
  decl  MulDiv_IntDivPow210_stringassignstr533  uint8:$31
  .uint8 $30 $3a 0
  decl  MulDiv_IntDivMix11_stringassignstr544  uint8:$31
  .uint8 $31 $3a 0
  decl  MulDiv_IntDivMix12_stringassignstr555  uint8:$31
  .uint8 $32 $3a 0
  decl  MulDiv_IntMulMix13_stringassignstr566  uint8:$31
  .uint8 $33 $3a 0
  decl  MulDiv_IntMulInt14_stringassignstr577  uint8:$31
  .uint8 $34 $3a 0
  decl  MulDiv_IntMulAdvancedMix15_stringassignstr588  uint8:$31
  .uint8 $35 $3a 0
  decl  MulDiv_ByteMulAdvanced16_stringassignstr599  uint8:$31
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulConst17_stringassignstr610  uint8:$31
  .uint8 $37 $3a 0
  decl  MulDiv_IntCombConst18_stringassignstr621  uint8:$31
  .uint8 $38 $3a 0
  decl  MulDiv_IntCombConst19_stringassignstr632  uint8:$31
  .uint8 $39 $3a 0
  decl  MulDiv_IntShift20_stringassignstr643  uint8:$32
  .uint8 $30 $3a 0
  decl  MulDiv_IntShift21_stringassignstr654  uint8:$32
  .uint8 $31 $3a 0
  decl  MulDiv_Array1_stringassignstr665  uint8:$41
  .uint8 $31 $3a 0
  decl  MulDiv_Shift0_stringassignstr676  uint8:$53
  .uint8 $31 $3a 0
  decl  MulDiv_Shift1_stringassignstr687  uint8:$53
  .uint8 $32 $3a 0
  decl  MulDiv_Shift2_stringassignstr698  uint8:$53
  .uint8 $33 $3a 0
  decl  MulDiv_Shift4_stringassignstr709  uint8:$53
  .uint8 $34 $3a 0
  decl  MulDiv_Shift5_stringassignstr720  uint8:$53
  .uint8 $35 $3a 0
  decl  MulDiv_Shift6_stringassignstr731  uint8:$53
  .uint8 $36 $3a 0
  decl  MulDiv_IntByteMulR1_stringassignstr742  uint8:$52
  .uint8 $31 $3a 0
  decl  MulDiv_IntByteMulR2_stringassignstr753  uint8:$52
  .uint8 $32 $3a 0
  decl  MulDiv_IntByteMulR3_stringassignstr764  uint8:$52
  .uint8 $33 $3a 0
  decl  MulDiv_IntByteMulR4_stringassignstr775  uint8:$52
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulBytePlus01_stringassignstr786  uint8:$42
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePlus02_stringassignstr797  uint8:$42
  .uint8 $32 $3a 0
  decl  MulDiv_Exec_stringassignstr808  uint8:$4d
  .uint8 $55 $4c $44 $49 $56 $20 $54
  .uint8 $45 $53 $54 $53 0
  decl  Strings_Test1_stringassignstr810  uint8:$54
  .uint8 $31 $3a 0
  decl  Strings_Test2_stringassignstr821  uint8:$54
  .uint8 $32 $3a 0
  decl  Strings_Test3_stringassignstr832  uint8:$54
  .uint8 $33 $3a 0
  decl  Strings_TestLst1_stringassignstr843  uint8:$54
  .uint8 $34 $3a 0
  decl  Strings_TestLst2_stringassignstr854  uint8:$54
  .uint8 $35 $3a 0
  decl  Strings_TestLst3_stringassignstr865  uint8:$54
  .uint8 $36 $3a 0
  decl  Strings_TestLst3_stringassignstr867  uint8:$44
  .uint8 $45 0
  decl  Strings_TestLst4_stringassignstr878  uint8:$54
  .uint8 $37 $3a 0
  decl  Strings_TestLst4_stringassignstr880  uint8:$4d
  .uint8 $59 0
  decl  Strings_Exec_stringassignstr890  uint8:$53
  .uint8 $54 $52 $49 $4e $47 $53 0
  decl  Functions_Test1_stringassignstr898  uint8:$54
  .uint8 $31 $3a 0
  decl  Functions_Test2_stringassignstr909  uint8:$54
  .uint8 $32 $3a 0
  decl  Functions_Test3_stringassignstr920  uint8:$54
  .uint8 $33 $3a 0
  decl  Functions_Test4_stringassignstr931  uint8:$54
  .uint8 $34 $3a 0
  decl  Functions_Test5_stringassignstr942  uint8:$54
  .uint8 $35 $3a 0
  decl  Functions_Test6_stringassignstr953  uint8:$54
  .uint8 $36 $3a 0
  decl  Functions_Exec_stringassignstr964  uint8:$46
  .uint8 $55 $4e $43 $54 $49 $4f $4e
  .uint8 $53 0
  decl  printstring_text1064	  uint8:$43
  .uint8 $4f $4d $50 $4c $45 $54 $45
  .uint8 $20 $41 $4e $44 $20 $55 $54 $54
  .uint8 $45 $52 $20 $53 $55 $43 $43 $45
  .uint8 $53 $53 $21 0
  decl  printstring_text1067	  uint8:$54
  .uint8 $4f $54 $41 $4c $20 $46 $41
  .uint8 $49 $4c $55 $52 $45 $21 0
.label EndBlock810

