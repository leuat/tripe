
 ; .processor 6502
	.code uint16:0x810 name
.label StartBlock810
	; Starting new memory block at $810
.label UnitTests6502
	; LineNumber: 7
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
	; LineNumber: 7
  decl  Vars_v4  uint8:0
	; LineNumber: 8
  decl  Vars_i1  uint16:0
	; LineNumber: 8
  decl  Vars_i2  uint16:0
	; LineNumber: 8
  decl  Vars_i3  uint16:0
	; LineNumber: 8
  decl  Vars_ri  uint16:0
	; LineNumber: 8
  decl  Vars_j2  uint16:0
	; LineNumber: 9
	decl 	Vars_p1 	ptr8:0
	; LineNumber: 9
	decl 	Vars_p2 	ptr8:0
	; LineNumber: 11
  decl  Vars_a1  uint16:0
  .uint16 0 0 0 0 0 0 0
  .uint16 0 0
	; LineNumber: 12
  decl  Vars_j  uint8:0
	; LineNumber: 12
  decl  Vars_i  uint8:0
	; LineNumber: 39
  decl  Vars_ba1  uint8:$00
  .uint8 $01 $02 $03 $04 $05 $06 $07
  .uint8 $08 $09
	; LineNumber: 40
  decl  Vars_strLst  uint16:tmp_641421_string0
  .uint16 tmp_202362_string1 tmp_490027_string2 tmp_368690_string3
	; LineNumber: 39
  decl  tmp_641421_string0  uint8:$53
  .uint8 $31 0
	; LineNumber: 39
  decl  tmp_202362_string1  uint8:$53
  .uint8 $32 0
	; LineNumber: 39
  decl  tmp_490027_string2  uint8:$4a
  .uint8 75 0
	; LineNumber: 39
  decl  tmp_368690_string3  uint8:$53
  .uint8 $33 0
	; LineNumber: 51
	decl 	Vars_Mini_this 	ptr8:0
	; LineNumber: 65
	decl 	Vars_Point_this 	ptr8:0
	; LineNumber: 86
	decl 	Vars_Monster_this 	ptr8:0
	; LineNumber: 3
  decl  Strings_teststr1  uint8:$48
  .uint8 $45 $49 $53 $41 $4e $4e 0
	; LineNumber: 6
  decl  Strings_teststr2  uint8:0x08
  .uint8 0x05 0x09 0x13 0x01 0x0e 0x0e 0x20
  .uint8 0x04 0x15 0
	; LineNumber: 3
  decl  Functions_fn1  uint8:0
	; LineNumber: 18
	decl 	Classes_StrItem_this 	ptr8:0
	; LineNumber: 51
	decl 	Classes_StringList_this 	ptr8:0
	; LineNumber: 33
  decl  Unittests_currentTest  uint8:0
	; LineNumber: 34
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
clearloop6
	dex
	sta $0000+$400,x
	sta $00fa+$400,x
	sta $01f4+$400,x
	sta $02ee+$400,x
	bne clearloop6
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
.label Common_Initialise_block7
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
clearloop8
	dex
	sta $0000+$400,x
	sta $00fa+$400,x
	sta $01f4+$400,x
	sta $02ee+$400,x
	bne clearloop8
	.endasm
	; LineNumber: 39
	.asm
	; Clear screen with offset
	lda #$1
	ldx #$fa
clearloop9
	dex
	sta $0000+$d800,x
	sta $00fa+$d800,x
	sta $01f4+$d800,x
	sta $02ee+$d800,x
	bne clearloop9
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
.label Common_WaitABit_forloop20
	; LineNumber: 80
	.asm
	; Wait
	lda #$fa
	tax
	dex
	bne *-1
	.endasm
.label Common_WaitABit_loopstart21
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x20 	Common_WaitABit_forloop20
.label Common_WaitABit_loopdone25 ;keep
.label Common_WaitABit_loopend22
	; LineNumber: 83
	return
.label end_procedure_Common_WaitABit
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_DebugValue
	;    Procedure type : User-defined procedure
	; LineNumber: 86
	; LineNumber: 85
  decl  Common_v  uint16:0
.label Common_DebugValue_block26
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
printdecimal27
	jsr init_printdecimal_div10 
	ora #$30
	sta (screenmemory),y
	dey
	bpl printdecimal27
	.endasm
	; LineNumber: 90
	return
.label end_procedure_Common_DebugValue
	
; // greater than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T01
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label IntegerTest_T01
	; LineNumber: 7
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 8
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 9
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T01_stringassigncpy30
	load 	IntegerTest_T01_stringassignstr29 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T01_stringassigncpy30
	; LineNumber: 9
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IntegerTest_T01_eblock33
.label IntegerTest_T01_ctb32 ;Main true block ;keep 
	; LineNumber: 8
	call Common_PASS
	jump IntegerTest_T01_edblock34
.label IntegerTest_T01_eblock33
	; LineNumber: 8
	call Common_FAIL
.label IntegerTest_T01_edblock34
	; LineNumber: 10
	return
.label end_procedure_IntegerTest_T01
	
; // equals than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T02
	;    Procedure type : User-defined procedure
	; LineNumber: 14
.label IntegerTest_T02
	; LineNumber: 15
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 16
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 17
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T02_stringassigncpy41
	load 	IntegerTest_T02_stringassignstr40 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T02_stringassigncpy41
	; LineNumber: 17
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	Vars_i2 	IntegerTest_T02_eblock44
.label IntegerTest_T02_ctb43 ;Main true block ;keep 
	; LineNumber: 16
	call Common_PASS
	jump IntegerTest_T02_edblock45
.label IntegerTest_T02_eblock44
	; LineNumber: 16
	call Common_FAIL
.label IntegerTest_T02_edblock45
	; LineNumber: 18
	return
.label end_procedure_IntegerTest_T02
	
; // greater equals than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T03
	;    Procedure type : User-defined procedure
	; LineNumber: 22
.label IntegerTest_T03
	; LineNumber: 23
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 24
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 25
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T03_stringassigncpy52
	load 	IntegerTest_T03_stringassignstr51 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T03_stringassigncpy52
	; LineNumber: 25
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IntegerTest_T03_eblock55
.label IntegerTest_T03_ctb54 ;Main true block ;keep 
	; LineNumber: 24
	call Common_FAIL
	jump IntegerTest_T03_edblock56
.label IntegerTest_T03_eblock55
	; LineNumber: 24
	call Common_PASS
.label IntegerTest_T03_edblock56
	; LineNumber: 26
	return
.label end_procedure_IntegerTest_T03
	
; // less than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T04
	;    Procedure type : User-defined procedure
	; LineNumber: 30
.label IntegerTest_T04
	; LineNumber: 31
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 32
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 33
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T04_stringassigncpy63
	load 	IntegerTest_T04_stringassignstr62 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T04_stringassigncpy63
	; LineNumber: 33
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	Vars_i2 	IntegerTest_T04_eblock66
.label IntegerTest_T04_ctb65 ;Main true block ;keep 
	; LineNumber: 32
	call Common_FAIL
	jump IntegerTest_T04_edblock67
.label IntegerTest_T04_eblock66
	; LineNumber: 32
	call Common_PASS
.label IntegerTest_T04_edblock67
	; LineNumber: 34
	return
.label end_procedure_IntegerTest_T04
	
; // less or equals than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T05
	;    Procedure type : User-defined procedure
	; LineNumber: 39
.label IntegerTest_T05
	; LineNumber: 40
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 41
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 42
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T05_stringassigncpy74
	load 	IntegerTest_T05_stringassignstr73 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T05_stringassigncpy74
	; LineNumber: 42
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i1 	Vars_i2 	IntegerTest_T05_eblock77
.label IntegerTest_T05_ctb76 ;Main true block ;keep 
	; LineNumber: 41
	call Common_PASS
	jump IntegerTest_T05_edblock78
.label IntegerTest_T05_eblock77
	; LineNumber: 41
	call Common_FAIL
.label IntegerTest_T05_edblock78
	; LineNumber: 43
	return
.label end_procedure_IntegerTest_T05
	
; // less or equals than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T06
	;    Procedure type : User-defined procedure
	; LineNumber: 47
.label IntegerTest_T06
	; LineNumber: 48
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 49
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 50
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T06_stringassigncpy85
	load 	IntegerTest_T06_stringassignstr84 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T06_stringassigncpy85
	; LineNumber: 50
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i1 	Vars_i2 	IntegerTest_T06_eblock88
.label IntegerTest_T06_ctb87 ;Main true block ;keep 
	; LineNumber: 49
	call Common_PASS
	jump IntegerTest_T06_edblock89
.label IntegerTest_T06_eblock88
	; LineNumber: 49
	call Common_FAIL
.label IntegerTest_T06_edblock89
	; LineNumber: 51
	return
.label end_procedure_IntegerTest_T06
	
; // notequals than
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T066
	;    Procedure type : User-defined procedure
	; LineNumber: 56
.label IntegerTest_T066
	; LineNumber: 57
	mov 	Vars_i1 	uint16:0x2000
	; LineNumber: 58
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T066_stringassigncpy96
	load 	IntegerTest_T066_stringassignstr95 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T066_stringassigncpy96
	; LineNumber: 58
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_i1 	uint16:0x2001 	IntegerTest_T066_eblock99
.label IntegerTest_T066_ctb98 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump IntegerTest_T066_edblock100
.label IntegerTest_T066_eblock99
	; LineNumber: 57
	call Common_FAIL
.label IntegerTest_T066_edblock100
	; LineNumber: 59
	return
.label end_procedure_IntegerTest_T066
	
; // plus Simple
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T07
	;    Procedure type : User-defined procedure
	; LineNumber: 64
.label IntegerTest_T07
	; LineNumber: 65
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 66
	mov 	Vars_i2 	uint16:0x7d0
	; LineNumber: 67
	; push
	add  	_r16_1 	Vars_i1 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 68
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T07_stringassigncpy107
	load 	IntegerTest_T07_stringassignstr106 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T07_stringassigncpy107
	; LineNumber: 68
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xbb8 	IntegerTest_T07_eblock110
.label IntegerTest_T07_ctb109 ;Main true block ;keep 
	; LineNumber: 67
	call Common_PASS
	jump IntegerTest_T07_edblock111
.label IntegerTest_T07_eblock110
	; LineNumber: 67
	call Common_FAIL
.label IntegerTest_T07_edblock111
	; LineNumber: 69
	return
.label end_procedure_IntegerTest_T07
	
; // minus Simple
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T08
	;    Procedure type : User-defined procedure
	; LineNumber: 73
.label IntegerTest_T08
	; LineNumber: 74
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 75
	mov 	Vars_i2 	uint16:0x7d0
	; LineNumber: 76
	; push
	sub  	_r16_1 	Vars_i1 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 77
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T08_stringassigncpy118
	load 	IntegerTest_T08_stringassignstr117 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T08_stringassigncpy118
	; LineNumber: 77
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xfc18 	IntegerTest_T08_eblock121
.label IntegerTest_T08_ctb120 ;Main true block ;keep 
	; LineNumber: 76
	call Common_PASS
	jump IntegerTest_T08_edblock122
.label IntegerTest_T08_eblock121
	; LineNumber: 76
	call Common_FAIL
.label IntegerTest_T08_edblock122
	; LineNumber: 78
	return
.label end_procedure_IntegerTest_T08
	
; // plus semi advanced
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T09
	;    Procedure type : User-defined procedure
	; LineNumber: 82
.label IntegerTest_T09
	; LineNumber: 83
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 84
	mov 	Vars_i2 	uint16:0x7d0
	; LineNumber: 85
	; push
	; push
	mulu  	_r16_2 	Vars_i1 	uint16:0x02
	add  	_r16_1 	_r16_2 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 86
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T09_stringassigncpy129
	load 	IntegerTest_T09_stringassignstr128 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T09_stringassigncpy129
	; LineNumber: 86
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xfa0 	IntegerTest_T09_eblock132
.label IntegerTest_T09_ctb131 ;Main true block ;keep 
	; LineNumber: 85
	call Common_PASS
	jump IntegerTest_T09_edblock133
.label IntegerTest_T09_eblock132
	; LineNumber: 85
	call Common_FAIL
.label IntegerTest_T09_edblock133
	; LineNumber: 87
	return
.label end_procedure_IntegerTest_T09
	
; // minus semi advanced
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T10
	;    Procedure type : User-defined procedure
	; LineNumber: 91
.label IntegerTest_T10
	; LineNumber: 92
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 93
	mov 	Vars_i2 	uint16:0xfa0
	; LineNumber: 94
	; push
	; push
	mulu  	_r16_2 	Vars_i1 	uint16:0x02
	sub  	_r16_1 	_r16_2 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 95
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T10_stringassigncpy140
	load 	IntegerTest_T10_stringassignstr139 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T10_stringassigncpy140
	; LineNumber: 95
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xf830 	IntegerTest_T10_eblock143
.label IntegerTest_T10_ctb142 ;Main true block ;keep 
	; LineNumber: 94
	call Common_PASS
	jump IntegerTest_T10_edblock144
.label IntegerTest_T10_eblock143
	; LineNumber: 94
	call Common_FAIL
.label IntegerTest_T10_edblock144
	; LineNumber: 96
	return
.label end_procedure_IntegerTest_T10
	
; // plus advanced
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T11
	;    Procedure type : User-defined procedure
	; LineNumber: 101
.label IntegerTest_T11
	; LineNumber: 102
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 103
	mov 	Vars_i2 	uint16:0xfa0
	; LineNumber: 104
	; push
	; push
	; push
	mulu  	_r16_3 	Vars_i1 	uint16:0x03
	; push
	mulu  	_r16_4 	Vars_i2 	uint16:0x02
	add  	_r16_2 	_r16_3 	_r16_4
	add  	_r16_1 	_r16_2 	uint16:0x1f4
	mov 	Vars_i1 	_r16_1
	; LineNumber: 105
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T11_stringassigncpy151
	load 	IntegerTest_T11_stringassignstr150 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T11_stringassigncpy151
	; LineNumber: 105
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x2cec 	IntegerTest_T11_eblock154
.label IntegerTest_T11_ctb153 ;Main true block ;keep 
	; LineNumber: 104
	call Common_PASS
	jump IntegerTest_T11_edblock155
.label IntegerTest_T11_eblock154
	; LineNumber: 104
	call Common_FAIL
.label IntegerTest_T11_edblock155
	; LineNumber: 106
	return
.label end_procedure_IntegerTest_T11
	
; // minus advanced
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T12
	;    Procedure type : User-defined procedure
	; LineNumber: 111
.label IntegerTest_T12
	; LineNumber: 112
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 113
	mov 	Vars_i2 	uint16:0xfa0
	; LineNumber: 114
	; push
	; push
	; push
	; push
	mulu  	_r16_4 	Vars_i1 	uint16:0x03
	; push
	mulu  	_r16_5 	Vars_i2 	uint16:0x02
	sub  	_r16_3 	_r16_4 	_r16_5
	add  	_r16_2 	_r16_3 	uint16:0x3e8
	sub  	_r16_1 	_r16_2 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 115
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T12_stringassigncpy162
	load 	IntegerTest_T12_stringassignstr161 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T12_stringassigncpy162
	; LineNumber: 115
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xe0c0 	IntegerTest_T12_eblock165
.label IntegerTest_T12_ctb164 ;Main true block ;keep 
	; LineNumber: 114
	call Common_PASS
	jump IntegerTest_T12_edblock166
.label IntegerTest_T12_eblock165
	; LineNumber: 114
	call Common_FAIL
.label IntegerTest_T12_edblock166
	; LineNumber: 116
	return
.label end_procedure_IntegerTest_T12
	
; // Arrays 2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_TMIX1
	;    Procedure type : User-defined procedure
	; LineNumber: 150
.label IntegerTest_TMIX1
	; LineNumber: 156
	
; //	Vars::a1[1]:=10000;
; //	Vars::a2[1]:=1000;
	mov 	Vars_v1 	uint8:0x07
	; LineNumber: 157
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 158
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x05 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v2 	_r8_1
	; LineNumber: 159
	
; // use y
	; push
	mulu  	_r16_1 	Vars_v1 	uint8:0x02
	mov 	Vars_i1 	_r16_1
	; LineNumber: 161
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_TMIX1_stringassigncpy173
	load 	IntegerTest_TMIX1_stringassignstr172 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_TMIX1_stringassigncpy173
	; LineNumber: 161
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x0e 	IntegerTest_TMIX1_eblock176
.label IntegerTest_TMIX1_ctb175 ;Main true block ;keep 
	; LineNumber: 160
	call Common_PASS
	jump IntegerTest_TMIX1_edblock177
.label IntegerTest_TMIX1_eblock176
	; LineNumber: 160
	call Common_FAIL
.label IntegerTest_TMIX1_edblock177
	; LineNumber: 162
	return
.label end_procedure_IntegerTest_TMIX1
	
; // Tests whether storing an int to a byte array works correctly
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T15
	;    Procedure type : User-defined procedure
	; LineNumber: 166
.label IntegerTest_T15
	; LineNumber: 168
	mov 	Vars_i1 	uint8:0xff
	; LineNumber: 169
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	Vars_barr 	uint8:0x00 	_r16_1
	; LineNumber: 170
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T15_stringassigncpy184
	load 	IntegerTest_T15_stringassignstr183 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T15_stringassigncpy184
	; LineNumber: 170
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0xff 	IntegerTest_T15_eblock187
.label IntegerTest_T15_ctb186 ;Main true block ;keep 
	; LineNumber: 169
	call Common_PASS
	jump IntegerTest_T15_edblock188
.label IntegerTest_T15_eblock187
	; LineNumber: 169
	call Common_FAIL
.label IntegerTest_T15_edblock188
	; LineNumber: 172
	return
.label end_procedure_IntegerTest_T15
	
; // Tests whether storing an int array to a byte array works correctly
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_T16
	;    Procedure type : User-defined procedure
	; LineNumber: 176
.label IntegerTest_T16
	; LineNumber: 178
	; push
	mov 	_r8_1 	uint16:0xff
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	Vars_a1 	uint8:0x01 	_r8_1
	; LineNumber: 179
	; ::LoadVariable
	; push
	load 	Vars_a1 	uint8:0x01 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	Vars_barr 	uint8:0x01 	_r16_1
	; LineNumber: 180
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T16_stringassigncpy195
	load 	IntegerTest_T16_stringassignstr194 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IntegerTest_T16_stringassigncpy195
	; LineNumber: 180
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0xff 	IntegerTest_T16_eblock198
.label IntegerTest_T16_ctb197 ;Main true block ;keep 
	; LineNumber: 179
	call Common_PASS
	jump IntegerTest_T16_edblock199
.label IntegerTest_T16_eblock198
	; LineNumber: 179
	call Common_FAIL
.label IntegerTest_T16_edblock199
	; LineNumber: 182
	return
.label end_procedure_IntegerTest_T16
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IntegerTest_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 186
.label IntegerTest_Exec
	; LineNumber: 188
	
; // initialise everything
	; Assigning a string : Common_zp
	mov 	Common_zp 	#IntegerTest_Exec_stringassignstr205
	call Common_Initialise
	; LineNumber: 191
	
; // Fails because of `ex`
	call IntegerTest_T01
	; LineNumber: 192
	call IntegerTest_T02
	; LineNumber: 193
	call IntegerTest_T03
	; LineNumber: 194
	call IntegerTest_T04
	; LineNumber: 195
	call IntegerTest_T05
	; LineNumber: 196
	call IntegerTest_T06
	; LineNumber: 198
	call IntegerTest_T066
	; LineNumber: 199
	call IntegerTest_T07
	; LineNumber: 201
	call IntegerTest_T08
	; LineNumber: 202
	call IntegerTest_T09
	; LineNumber: 203
	call IntegerTest_T10
	; LineNumber: 205
	call IntegerTest_T11
	; LineNumber: 206
	call IntegerTest_T12
	; LineNumber: 208
	call IntegerTest_TMIX1
	; LineNumber: 214
	
; //T13();
; //T14();
	call IntegerTest_T15
	; LineNumber: 215
	call IntegerTest_T16
	; LineNumber: 217
	call Common_WaitABit
	; LineNumber: 219
	return
.label end_procedure_IntegerTest_Exec
	;--------------------------------------------------------------------------------------------
; //
; //	UNIT TESTS
; //	
; //----------------------------------------------------------------------------------------------
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GT1_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 12
.label IfThenElse_GT1_GreaterThan_True
	; LineNumber: 13
	mov 	Vars_v1 	uint8:0x64
	; LineNumber: 13
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 14
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GT1_GreaterThan_True_stringassigncpy208
	load 	IfThenElse_GT1_GreaterThan_True_stringassignstr207 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GT1_GreaterThan_True_stringassigncpy208
	; LineNumber: 14
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT1_GreaterThan_True_eblock211
.label IfThenElse_GT1_GreaterThan_True_ctb210 ;Main true block ;keep 
	; LineNumber: 13
	; LineNumber: 14
	call Common_PASS
	; LineNumber: 14
	jump IfThenElse_GT1_GreaterThan_True_edblock212
.label IfThenElse_GT1_GreaterThan_True_eblock211
	; LineNumber: 13
	; LineNumber: 14
	call Common_FAIL
	; LineNumber: 14
.label IfThenElse_GT1_GreaterThan_True_edblock212
	; LineNumber: 15
	return
.label end_procedure_IfThenElse_GT1_GreaterThan_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GT2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 19
.label IfThenElse_GT2_GreaterThan_False
	; LineNumber: 20
	mov 	Vars_v1 	uint8:0x0a
	; LineNumber: 20
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 21
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GT2_GreaterThan_False_stringassigncpy219
	load 	IfThenElse_GT2_GreaterThan_False_stringassignstr218 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GT2_GreaterThan_False_stringassigncpy219
	; LineNumber: 21
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT2_GreaterThan_False_eblock222
.label IfThenElse_GT2_GreaterThan_False_ctb221 ;Main true block ;keep 
	; LineNumber: 20
	; LineNumber: 21
	call Common_FAIL
	; LineNumber: 21
	jump IfThenElse_GT2_GreaterThan_False_edblock223
.label IfThenElse_GT2_GreaterThan_False_eblock222
	; LineNumber: 20
	; LineNumber: 21
	call Common_PASS
	; LineNumber: 21
.label IfThenElse_GT2_GreaterThan_False_edblock223
	; LineNumber: 22
	return
.label end_procedure_IfThenElse_GT2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GT3_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 26
.label IfThenElse_GT3_GreaterThan_False
	; LineNumber: 27
	mov 	Vars_v1 	uint8:0x32
	; LineNumber: 27
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 28
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GT3_GreaterThan_False_stringassigncpy230
	load 	IfThenElse_GT3_GreaterThan_False_stringassignstr229 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GT3_GreaterThan_False_stringassigncpy230
	; LineNumber: 28
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT3_GreaterThan_False_eblock233
.label IfThenElse_GT3_GreaterThan_False_ctb232 ;Main true block ;keep 
	; LineNumber: 27
	; LineNumber: 28
	call Common_FAIL
	; LineNumber: 28
	jump IfThenElse_GT3_GreaterThan_False_edblock234
.label IfThenElse_GT3_GreaterThan_False_eblock233
	; LineNumber: 27
	; LineNumber: 28
	call Common_PASS
	; LineNumber: 28
.label IfThenElse_GT3_GreaterThan_False_edblock234
	; LineNumber: 29
	return
.label end_procedure_IfThenElse_GT3_GreaterThan_False
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GT4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 33
.label IfThenElse_GT4_GreaterThan_False
	; LineNumber: 34
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 34
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 35
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GT4_GreaterThan_False_stringassigncpy241
	load 	IfThenElse_GT4_GreaterThan_False_stringassignstr240 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GT4_GreaterThan_False_stringassigncpy241
	; LineNumber: 35
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT4_GreaterThan_False_eblock244
.label IfThenElse_GT4_GreaterThan_False_ctb243 ;Main true block ;keep 
	; LineNumber: 34
	; LineNumber: 35
	call Common_FAIL
	; LineNumber: 35
	jump IfThenElse_GT4_GreaterThan_False_edblock245
.label IfThenElse_GT4_GreaterThan_False_eblock244
	; LineNumber: 34
	; LineNumber: 35
	call Common_PASS
	; LineNumber: 35
.label IfThenElse_GT4_GreaterThan_False_edblock245
	; LineNumber: 36
	return
.label end_procedure_IfThenElse_GT4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GT5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 40
.label IfThenElse_GT5_GreaterThan_True
	; LineNumber: 41
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 41
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 42
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GT5_GreaterThan_True_stringassigncpy252
	load 	IfThenElse_GT5_GreaterThan_True_stringassignstr251 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GT5_GreaterThan_True_stringassigncpy252
	; LineNumber: 42
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT5_GreaterThan_True_eblock255
.label IfThenElse_GT5_GreaterThan_True_ctb254 ;Main true block ;keep 
	; LineNumber: 41
	; LineNumber: 42
	call Common_PASS
	; LineNumber: 42
	jump IfThenElse_GT5_GreaterThan_True_edblock256
.label IfThenElse_GT5_GreaterThan_True_eblock255
	; LineNumber: 41
	; LineNumber: 42
	call Common_FAIL
	; LineNumber: 42
.label IfThenElse_GT5_GreaterThan_True_edblock256
	; LineNumber: 43
	return
.label end_procedure_IfThenElse_GT5_GreaterThan_True
	
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GTE1_GreaterEqual_True
	;    Procedure type : User-defined procedure
	; LineNumber: 48
.label IfThenElse_GTE1_GreaterEqual_True
	; LineNumber: 49
	mov 	Vars_v1 	uint8:0x33
	; LineNumber: 49
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 50
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GTE1_GreaterEqual_True_stringassigncpy263
	load 	IfThenElse_GTE1_GreaterEqual_True_stringassignstr262 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GTE1_GreaterEqual_True_stringassigncpy263
	; LineNumber: 50
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE1_GreaterEqual_True_eblock266
.label IfThenElse_GTE1_GreaterEqual_True_ctb265 ;Main true block ;keep 
	; LineNumber: 49
	; LineNumber: 50
	call Common_PASS
	; LineNumber: 50
	jump IfThenElse_GTE1_GreaterEqual_True_edblock267
.label IfThenElse_GTE1_GreaterEqual_True_eblock266
	; LineNumber: 49
	; LineNumber: 50
	call Common_FAIL
	; LineNumber: 50
.label IfThenElse_GTE1_GreaterEqual_True_edblock267
	; LineNumber: 51
	return
.label end_procedure_IfThenElse_GTE1_GreaterEqual_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GTE2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 55
.label IfThenElse_GTE2_GreaterThan_False
	; LineNumber: 56
	mov 	Vars_v1 	uint8:0x31
	; LineNumber: 56
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 57
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GTE2_GreaterThan_False_stringassigncpy274
	load 	IfThenElse_GTE2_GreaterThan_False_stringassignstr273 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GTE2_GreaterThan_False_stringassigncpy274
	; LineNumber: 57
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE2_GreaterThan_False_eblock277
.label IfThenElse_GTE2_GreaterThan_False_ctb276 ;Main true block ;keep 
	; LineNumber: 56
	; LineNumber: 57
	call Common_FAIL
	; LineNumber: 57
	jump IfThenElse_GTE2_GreaterThan_False_edblock278
.label IfThenElse_GTE2_GreaterThan_False_eblock277
	; LineNumber: 56
	; LineNumber: 57
	call Common_PASS
	; LineNumber: 57
.label IfThenElse_GTE2_GreaterThan_False_edblock278
	; LineNumber: 58
	return
.label end_procedure_IfThenElse_GTE2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GTE3_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 62
.label IfThenElse_GTE3_GreaterThan_True
	; LineNumber: 63
	mov 	Vars_v1 	uint8:0x32
	; LineNumber: 63
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 64
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GTE3_GreaterThan_True_stringassigncpy285
	load 	IfThenElse_GTE3_GreaterThan_True_stringassignstr284 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GTE3_GreaterThan_True_stringassigncpy285
	; LineNumber: 64
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE3_GreaterThan_True_eblock288
.label IfThenElse_GTE3_GreaterThan_True_ctb287 ;Main true block ;keep 
	; LineNumber: 63
	; LineNumber: 64
	call Common_PASS
	; LineNumber: 64
	jump IfThenElse_GTE3_GreaterThan_True_edblock289
.label IfThenElse_GTE3_GreaterThan_True_eblock288
	; LineNumber: 63
	; LineNumber: 64
	call Common_FAIL
	; LineNumber: 64
.label IfThenElse_GTE3_GreaterThan_True_edblock289
	; LineNumber: 65
	return
.label end_procedure_IfThenElse_GTE3_GreaterThan_True
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GTE4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 69
.label IfThenElse_GTE4_GreaterThan_False
	; LineNumber: 70
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 70
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 71
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GTE4_GreaterThan_False_stringassigncpy296
	load 	IfThenElse_GTE4_GreaterThan_False_stringassignstr295 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GTE4_GreaterThan_False_stringassigncpy296
	; LineNumber: 71
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE4_GreaterThan_False_eblock299
.label IfThenElse_GTE4_GreaterThan_False_ctb298 ;Main true block ;keep 
	; LineNumber: 70
	; LineNumber: 71
	call Common_FAIL
	; LineNumber: 71
	jump IfThenElse_GTE4_GreaterThan_False_edblock300
.label IfThenElse_GTE4_GreaterThan_False_eblock299
	; LineNumber: 70
	; LineNumber: 71
	call Common_PASS
	; LineNumber: 71
.label IfThenElse_GTE4_GreaterThan_False_edblock300
	; LineNumber: 72
	return
.label end_procedure_IfThenElse_GTE4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_GTE5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 76
.label IfThenElse_GTE5_GreaterThan_True
	; LineNumber: 77
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 77
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 78
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_GTE5_GreaterThan_True_stringassigncpy307
	load 	IfThenElse_GTE5_GreaterThan_True_stringassignstr306 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_GTE5_GreaterThan_True_stringassigncpy307
	; LineNumber: 78
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE5_GreaterThan_True_eblock310
.label IfThenElse_GTE5_GreaterThan_True_ctb309 ;Main true block ;keep 
	; LineNumber: 77
	; LineNumber: 78
	call Common_PASS
	; LineNumber: 78
	jump IfThenElse_GTE5_GreaterThan_True_edblock311
.label IfThenElse_GTE5_GreaterThan_True_eblock310
	; LineNumber: 77
	; LineNumber: 78
	call Common_FAIL
	; LineNumber: 78
.label IfThenElse_GTE5_GreaterThan_True_edblock311
	; LineNumber: 79
	return
.label end_procedure_IfThenElse_GTE5_GreaterThan_True
	
; // when Vars::v1 is less than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LT1_LessThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 84
.label IfThenElse_LT1_LessThan_True
	; LineNumber: 85
	mov 	Vars_v1 	uint8:0x31
	; LineNumber: 85
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 86
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LT1_LessThan_True_stringassigncpy318
	load 	IfThenElse_LT1_LessThan_True_stringassignstr317 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LT1_LessThan_True_stringassigncpy318
	; LineNumber: 86
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT1_LessThan_True_eblock321
.label IfThenElse_LT1_LessThan_True_ctb320 ;Main true block ;keep 
	; LineNumber: 85
	; LineNumber: 86
	call Common_PASS
	; LineNumber: 86
	jump IfThenElse_LT1_LessThan_True_edblock322
.label IfThenElse_LT1_LessThan_True_eblock321
	; LineNumber: 85
	; LineNumber: 86
	call Common_FAIL
	; LineNumber: 86
.label IfThenElse_LT1_LessThan_True_edblock322
	; LineNumber: 87
	return
.label end_procedure_IfThenElse_LT1_LessThan_True
	
; // when Vars::v1 is not less than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LT2_LessThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 91
.label IfThenElse_LT2_LessThan_False
	; LineNumber: 92
	mov 	Vars_v1 	uint8:0x33
	; LineNumber: 92
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 93
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LT2_LessThan_False_stringassigncpy329
	load 	IfThenElse_LT2_LessThan_False_stringassignstr328 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LT2_LessThan_False_stringassigncpy329
	; LineNumber: 93
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT2_LessThan_False_eblock332
.label IfThenElse_LT2_LessThan_False_ctb331 ;Main true block ;keep 
	; LineNumber: 92
	; LineNumber: 93
	call Common_FAIL
	; LineNumber: 93
	jump IfThenElse_LT2_LessThan_False_edblock333
.label IfThenElse_LT2_LessThan_False_eblock332
	; LineNumber: 92
	; LineNumber: 93
	call Common_PASS
	; LineNumber: 93
.label IfThenElse_LT2_LessThan_False_edblock333
	; LineNumber: 94
	return
.label end_procedure_IfThenElse_LT2_LessThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LT3_LessThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 98
.label IfThenElse_LT3_LessThan_False
	; LineNumber: 99
	mov 	Vars_v1 	uint8:0x32
	; LineNumber: 99
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 100
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LT3_LessThan_False_stringassigncpy340
	load 	IfThenElse_LT3_LessThan_False_stringassignstr339 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LT3_LessThan_False_stringassigncpy340
	; LineNumber: 100
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT3_LessThan_False_eblock343
.label IfThenElse_LT3_LessThan_False_ctb342 ;Main true block ;keep 
	; LineNumber: 99
	; LineNumber: 100
	call Common_FAIL
	; LineNumber: 100
	jump IfThenElse_LT3_LessThan_False_edblock344
.label IfThenElse_LT3_LessThan_False_eblock343
	; LineNumber: 99
	; LineNumber: 100
	call Common_PASS
	; LineNumber: 100
.label IfThenElse_LT3_LessThan_False_edblock344
	; LineNumber: 101
	return
.label end_procedure_IfThenElse_LT3_LessThan_False
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LT4_LessThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 105
.label IfThenElse_LT4_LessThan_True
	; LineNumber: 106
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 106
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 107
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LT4_LessThan_True_stringassigncpy351
	load 	IfThenElse_LT4_LessThan_True_stringassignstr350 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LT4_LessThan_True_stringassigncpy351
	; LineNumber: 107
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT4_LessThan_True_eblock354
.label IfThenElse_LT4_LessThan_True_ctb353 ;Main true block ;keep 
	; LineNumber: 106
	; LineNumber: 107
	call Common_PASS
	; LineNumber: 107
	jump IfThenElse_LT4_LessThan_True_edblock355
.label IfThenElse_LT4_LessThan_True_eblock354
	; LineNumber: 106
	; LineNumber: 107
	call Common_FAIL
	; LineNumber: 107
.label IfThenElse_LT4_LessThan_True_edblock355
	; LineNumber: 108
	return
.label end_procedure_IfThenElse_LT4_LessThan_True
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LT5_LessThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 112
.label IfThenElse_LT5_LessThan_False
	; LineNumber: 113
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 113
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 114
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LT5_LessThan_False_stringassigncpy362
	load 	IfThenElse_LT5_LessThan_False_stringassignstr361 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LT5_LessThan_False_stringassigncpy362
	; LineNumber: 114
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT5_LessThan_False_eblock365
.label IfThenElse_LT5_LessThan_False_ctb364 ;Main true block ;keep 
	; LineNumber: 113
	; LineNumber: 114
	call Common_FAIL
	; LineNumber: 114
	jump IfThenElse_LT5_LessThan_False_edblock366
.label IfThenElse_LT5_LessThan_False_eblock365
	; LineNumber: 113
	; LineNumber: 114
	call Common_PASS
	; LineNumber: 114
.label IfThenElse_LT5_LessThan_False_edblock366
	; LineNumber: 115
	return
.label end_procedure_IfThenElse_LT5_LessThan_False
	
; // when Vars::v1 is less than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE1_LessEqual_True
	;    Procedure type : User-defined procedure
	; LineNumber: 120
.label IfThenElse_LTE1_LessEqual_True
	; LineNumber: 121
	mov 	Vars_v1 	uint8:0x31
	; LineNumber: 121
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 122
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE1_LessEqual_True_stringassigncpy373
	load 	IfThenElse_LTE1_LessEqual_True_stringassignstr372 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE1_LessEqual_True_stringassigncpy373
	; LineNumber: 122
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE1_LessEqual_True_eblock376
.label IfThenElse_LTE1_LessEqual_True_ctb375 ;Main true block ;keep 
	; LineNumber: 121
	; LineNumber: 122
	call Common_PASS
	; LineNumber: 122
	jump IfThenElse_LTE1_LessEqual_True_edblock377
.label IfThenElse_LTE1_LessEqual_True_eblock376
	; LineNumber: 121
	; LineNumber: 122
	call Common_FAIL
	; LineNumber: 122
.label IfThenElse_LTE1_LessEqual_True_edblock377
	; LineNumber: 123
	return
.label end_procedure_IfThenElse_LTE1_LessEqual_True
	
; // when Vars::v1 is less than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE1_LessEqual_True2
	;    Procedure type : User-defined procedure
	; LineNumber: 127
.label IfThenElse_LTE1_LessEqual_True2
	; LineNumber: 128
	mov 	Vars_v1 	uint8:0x32
	; LineNumber: 128
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 129
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE1_LessEqual_True2_stringassigncpy384
	load 	IfThenElse_LTE1_LessEqual_True2_stringassignstr383 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE1_LessEqual_True2_stringassigncpy384
	; LineNumber: 129
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE1_LessEqual_True2_eblock387
.label IfThenElse_LTE1_LessEqual_True2_ctb386 ;Main true block ;keep 
	; LineNumber: 128
	; LineNumber: 129
	call Common_PASS
	; LineNumber: 129
	jump IfThenElse_LTE1_LessEqual_True2_edblock388
.label IfThenElse_LTE1_LessEqual_True2_eblock387
	; LineNumber: 128
	; LineNumber: 129
	call Common_FAIL
	; LineNumber: 129
.label IfThenElse_LTE1_LessEqual_True2_edblock388
	; LineNumber: 130
	return
.label end_procedure_IfThenElse_LTE1_LessEqual_True2
	
; // when Vars::v1 is not less or equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE2_LessThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 134
.label IfThenElse_LTE2_LessThan_False
	; LineNumber: 135
	mov 	Vars_v1 	uint8:0x33
	; LineNumber: 135
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 136
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE2_LessThan_False_stringassigncpy395
	load 	IfThenElse_LTE2_LessThan_False_stringassignstr394 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE2_LessThan_False_stringassigncpy395
	; LineNumber: 136
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE2_LessThan_False_eblock398
.label IfThenElse_LTE2_LessThan_False_ctb397 ;Main true block ;keep 
	; LineNumber: 135
	; LineNumber: 136
	call Common_FAIL
	; LineNumber: 136
	jump IfThenElse_LTE2_LessThan_False_edblock399
.label IfThenElse_LTE2_LessThan_False_eblock398
	; LineNumber: 135
	; LineNumber: 136
	call Common_PASS
	; LineNumber: 136
.label IfThenElse_LTE2_LessThan_False_edblock399
	; LineNumber: 137
	return
.label end_procedure_IfThenElse_LTE2_LessThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE3_LessThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 141
.label IfThenElse_LTE3_LessThan_True
	; LineNumber: 142
	mov 	Vars_v1 	uint8:0x32
	; LineNumber: 142
	mov 	Vars_v2 	uint8:0x32
	; LineNumber: 143
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE3_LessThan_True_stringassigncpy406
	load 	IfThenElse_LTE3_LessThan_True_stringassignstr405 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE3_LessThan_True_stringassigncpy406
	; LineNumber: 143
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE3_LessThan_True_eblock409
.label IfThenElse_LTE3_LessThan_True_ctb408 ;Main true block ;keep 
	; LineNumber: 142
	; LineNumber: 143
	call Common_PASS
	; LineNumber: 143
	jump IfThenElse_LTE3_LessThan_True_edblock410
.label IfThenElse_LTE3_LessThan_True_eblock409
	; LineNumber: 142
	; LineNumber: 143
	call Common_FAIL
	; LineNumber: 143
.label IfThenElse_LTE3_LessThan_True_edblock410
	; LineNumber: 144
	return
.label end_procedure_IfThenElse_LTE3_LessThan_True
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE4_LessThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 148
.label IfThenElse_LTE4_LessThan_True
	; LineNumber: 149
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 149
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 150
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE4_LessThan_True_stringassigncpy417
	load 	IfThenElse_LTE4_LessThan_True_stringassignstr416 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE4_LessThan_True_stringassigncpy417
	; LineNumber: 150
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE4_LessThan_True_eblock420
.label IfThenElse_LTE4_LessThan_True_ctb419 ;Main true block ;keep 
	; LineNumber: 149
	; LineNumber: 150
	call Common_PASS
	; LineNumber: 150
	jump IfThenElse_LTE4_LessThan_True_edblock421
.label IfThenElse_LTE4_LessThan_True_eblock420
	; LineNumber: 149
	; LineNumber: 150
	call Common_FAIL
	; LineNumber: 150
.label IfThenElse_LTE4_LessThan_True_edblock421
	; LineNumber: 151
	return
.label end_procedure_IfThenElse_LTE4_LessThan_True
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_LTE5_LessThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 155
.label IfThenElse_LTE5_LessThan_False
	; LineNumber: 156
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 156
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 157
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_LTE5_LessThan_False_stringassigncpy428
	load 	IfThenElse_LTE5_LessThan_False_stringassignstr427 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_LTE5_LessThan_False_stringassigncpy428
	; LineNumber: 157
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE5_LessThan_False_eblock431
.label IfThenElse_LTE5_LessThan_False_ctb430 ;Main true block ;keep 
	; LineNumber: 156
	; LineNumber: 157
	call Common_FAIL
	; LineNumber: 157
	jump IfThenElse_LTE5_LessThan_False_edblock432
.label IfThenElse_LTE5_LessThan_False_eblock431
	; LineNumber: 156
	; LineNumber: 157
	call Common_PASS
	; LineNumber: 157
.label IfThenElse_LTE5_LessThan_False_edblock432
	; LineNumber: 158
	return
.label end_procedure_IfThenElse_LTE5_LessThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_EQ1_EqualTo_True
	;    Procedure type : User-defined procedure
	; LineNumber: 163
.label IfThenElse_EQ1_EqualTo_True
	; LineNumber: 164
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 164
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 165
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_EQ1_EqualTo_True_stringassigncpy439
	load 	IfThenElse_EQ1_EqualTo_True_stringassignstr438 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_EQ1_EqualTo_True_stringassigncpy439
	; LineNumber: 165
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_EQ1_EqualTo_True_eblock442
.label IfThenElse_EQ1_EqualTo_True_ctb441 ;Main true block ;keep 
	; LineNumber: 164
	; LineNumber: 165
	call Common_PASS
	; LineNumber: 165
	jump IfThenElse_EQ1_EqualTo_True_edblock443
.label IfThenElse_EQ1_EqualTo_True_eblock442
	; LineNumber: 164
	; LineNumber: 165
	call Common_FAIL
	; LineNumber: 165
.label IfThenElse_EQ1_EqualTo_True_edblock443
	; LineNumber: 166
	return
.label end_procedure_IfThenElse_EQ1_EqualTo_True
	
; // when Vars::v1 is not equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_EQ2_EqualTo_False
	;    Procedure type : User-defined procedure
	; LineNumber: 170
.label IfThenElse_EQ2_EqualTo_False
	; LineNumber: 171
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 171
	mov 	Vars_v2 	uint8:0xff
	; LineNumber: 172
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_EQ2_EqualTo_False_stringassigncpy450
	load 	IfThenElse_EQ2_EqualTo_False_stringassignstr449 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_EQ2_EqualTo_False_stringassigncpy450
	; LineNumber: 172
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_EQ2_EqualTo_False_eblock453
.label IfThenElse_EQ2_EqualTo_False_ctb452 ;Main true block ;keep 
	; LineNumber: 171
	; LineNumber: 172
	call Common_FAIL
	; LineNumber: 172
	jump IfThenElse_EQ2_EqualTo_False_edblock454
.label IfThenElse_EQ2_EqualTo_False_eblock453
	; LineNumber: 171
	; LineNumber: 172
	call Common_PASS
	; LineNumber: 172
.label IfThenElse_EQ2_EqualTo_False_edblock454
	; LineNumber: 173
	return
.label end_procedure_IfThenElse_EQ2_EqualTo_False
	
; // when Vars::v1 is not equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_NEQ1_NotEqualTo_True
	;    Procedure type : User-defined procedure
	; LineNumber: 178
.label IfThenElse_NEQ1_NotEqualTo_True
	; LineNumber: 179
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 179
	mov 	Vars_v2 	uint8:0x06
	; LineNumber: 180
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_NEQ1_NotEqualTo_True_stringassigncpy461
	load 	IfThenElse_NEQ1_NotEqualTo_True_stringassignstr460 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_NEQ1_NotEqualTo_True_stringassigncpy461
	; LineNumber: 180
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v1 	Vars_v2 	IfThenElse_NEQ1_NotEqualTo_True_eblock464
.label IfThenElse_NEQ1_NotEqualTo_True_ctb463 ;Main true block ;keep 
	; LineNumber: 179
	; LineNumber: 180
	call Common_PASS
	; LineNumber: 180
	jump IfThenElse_NEQ1_NotEqualTo_True_edblock465
.label IfThenElse_NEQ1_NotEqualTo_True_eblock464
	; LineNumber: 179
	; LineNumber: 180
	call Common_FAIL
	; LineNumber: 180
.label IfThenElse_NEQ1_NotEqualTo_True_edblock465
	; LineNumber: 181
	return
.label end_procedure_IfThenElse_NEQ1_NotEqualTo_True
	
; // when Vars::v1 is not equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_NEQ2_NotEqualTo_False
	;    Procedure type : User-defined procedure
	; LineNumber: 185
.label IfThenElse_NEQ2_NotEqualTo_False
	; LineNumber: 186
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 186
	mov 	Vars_v2 	uint8:0x05
	; LineNumber: 187
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_NEQ2_NotEqualTo_False_stringassigncpy472
	load 	IfThenElse_NEQ2_NotEqualTo_False_stringassignstr471 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_NEQ2_NotEqualTo_False_stringassigncpy472
	; LineNumber: 187
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v1 	Vars_v2 	IfThenElse_NEQ2_NotEqualTo_False_eblock475
.label IfThenElse_NEQ2_NotEqualTo_False_ctb474 ;Main true block ;keep 
	; LineNumber: 186
	; LineNumber: 187
	call Common_FAIL
	; LineNumber: 187
	jump IfThenElse_NEQ2_NotEqualTo_False_edblock476
.label IfThenElse_NEQ2_NotEqualTo_False_eblock475
	; LineNumber: 186
	; LineNumber: 187
	call Common_PASS
	; LineNumber: 187
.label IfThenElse_NEQ2_NotEqualTo_False_edblock476
	; LineNumber: 188
	return
.label end_procedure_IfThenElse_NEQ2_NotEqualTo_False
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_Advanced1
	;    Procedure type : User-defined procedure
	; LineNumber: 192
.label IfThenElse_Advanced1
	; LineNumber: 193
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 193
	mov 	Vars_v2 	uint8:0x05
	; LineNumber: 194
	mov 	Vars_v3 	uint8:0x05
	; LineNumber: 194
	mov 	Vars_v4 	uint8:0x04
	; LineNumber: 196
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_Advanced1_stringassigncpy483
	load 	IfThenElse_Advanced1_stringassignstr482 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_Advanced1_stringassigncpy483
	; LineNumber: 196
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_Advanced1_eblock486
.label IfThenElse_Advanced1_localsuccess490 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v3 	uint8:0x05 	IfThenElse_Advanced1_eblock486
.label IfThenElse_Advanced1_ctb485 ;Main true block ;keep 
	; LineNumber: 195
	; LineNumber: 196
	call Common_FAIL
	; LineNumber: 196
	jump IfThenElse_Advanced1_edblock487
.label IfThenElse_Advanced1_eblock486
	; LineNumber: 195
	; LineNumber: 196
	call Common_PASS
	; LineNumber: 196
.label IfThenElse_Advanced1_edblock487
	; LineNumber: 197
	return
.label end_procedure_IfThenElse_Advanced1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_Advanced2
	;    Procedure type : User-defined procedure
	; LineNumber: 201
.label IfThenElse_Advanced2
	; LineNumber: 202
	mov 	Vars_v1 	uint8:0x05
	; LineNumber: 202
	mov 	Vars_v2 	uint8:0x05
	; LineNumber: 203
	mov 	Vars_v3 	uint8:0x05
	; LineNumber: 203
	mov 	Vars_v4 	uint8:0x04
	; LineNumber: 204
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_Advanced2_stringassigncpy495
	load 	IfThenElse_Advanced2_stringassignstr494 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_Advanced2_stringassigncpy495
	; LineNumber: 204
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_Advanced2_eblock498
.label IfThenElse_Advanced2_localsuccess502 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v3 	uint8:0x05 	IfThenElse_Advanced2_localfailed503
	jump IfThenElse_Advanced2_ctb497
.label IfThenElse_Advanced2_localfailed503 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v4 	uint8:0x04 	IfThenElse_Advanced2_eblock498
.label IfThenElse_Advanced2_ctb497 ;Main true block ;keep 
	; LineNumber: 203
	; LineNumber: 204
	call Common_PASS
	; LineNumber: 204
	jump IfThenElse_Advanced2_edblock499
.label IfThenElse_Advanced2_eblock498
	; LineNumber: 203
	; LineNumber: 204
	call Common_FAIL
	; LineNumber: 204
.label IfThenElse_Advanced2_edblock499
	; LineNumber: 205
	return
.label end_procedure_IfThenElse_Advanced2
	
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGT1_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 213
.label IfThenElse_IGT1_GreaterThan_True
	; LineNumber: 214
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 214
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 215
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGT1_GreaterThan_True_stringassigncpy508
	load 	IfThenElse_IGT1_GreaterThan_True_stringassignstr507 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGT1_GreaterThan_True_stringassigncpy508
	; LineNumber: 215
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT1_GreaterThan_True_eblock511
.label IfThenElse_IGT1_GreaterThan_True_ctb510 ;Main true block ;keep 
	; LineNumber: 214
	; LineNumber: 215
	call Common_PASS
	; LineNumber: 215
	jump IfThenElse_IGT1_GreaterThan_True_edblock512
.label IfThenElse_IGT1_GreaterThan_True_eblock511
	; LineNumber: 214
	; LineNumber: 215
	call Common_FAIL
	; LineNumber: 215
.label IfThenElse_IGT1_GreaterThan_True_edblock512
	; LineNumber: 216
	return
.label end_procedure_IfThenElse_IGT1_GreaterThan_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGT2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 220
.label IfThenElse_IGT2_GreaterThan_False
	; LineNumber: 221
	mov 	Vars_i1 	uint8:0x64
	; LineNumber: 221
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 222
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGT2_GreaterThan_False_stringassigncpy519
	load 	IfThenElse_IGT2_GreaterThan_False_stringassignstr518 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGT2_GreaterThan_False_stringassigncpy519
	; LineNumber: 222
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT2_GreaterThan_False_eblock522
.label IfThenElse_IGT2_GreaterThan_False_ctb521 ;Main true block ;keep 
	; LineNumber: 221
	; LineNumber: 222
	call Common_FAIL
	; LineNumber: 222
	jump IfThenElse_IGT2_GreaterThan_False_edblock523
.label IfThenElse_IGT2_GreaterThan_False_eblock522
	; LineNumber: 221
	; LineNumber: 222
	call Common_PASS
	; LineNumber: 222
.label IfThenElse_IGT2_GreaterThan_False_edblock523
	; LineNumber: 223
	return
.label end_procedure_IfThenElse_IGT2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGT3_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 227
.label IfThenElse_IGT3_GreaterThan_False
	; LineNumber: 228
	mov 	Vars_i1 	uint16:0x1f4
	; LineNumber: 228
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 229
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGT3_GreaterThan_False_stringassigncpy530
	load 	IfThenElse_IGT3_GreaterThan_False_stringassignstr529 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGT3_GreaterThan_False_stringassigncpy530
	; LineNumber: 229
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT3_GreaterThan_False_eblock533
.label IfThenElse_IGT3_GreaterThan_False_ctb532 ;Main true block ;keep 
	; LineNumber: 228
	; LineNumber: 229
	call Common_FAIL
	; LineNumber: 229
	jump IfThenElse_IGT3_GreaterThan_False_edblock534
.label IfThenElse_IGT3_GreaterThan_False_eblock533
	; LineNumber: 228
	; LineNumber: 229
	call Common_PASS
	; LineNumber: 229
.label IfThenElse_IGT3_GreaterThan_False_edblock534
	; LineNumber: 230
	return
.label end_procedure_IfThenElse_IGT3_GreaterThan_False
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGT4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 234
.label IfThenElse_IGT4_GreaterThan_False
	; LineNumber: 235
	mov 	Vars_i1 	uint8:0x00
	; LineNumber: 235
	mov 	Vars_i2 	uint16:0x9f6
	; LineNumber: 236
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGT4_GreaterThan_False_stringassigncpy541
	load 	IfThenElse_IGT4_GreaterThan_False_stringassignstr540 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGT4_GreaterThan_False_stringassigncpy541
	; LineNumber: 236
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT4_GreaterThan_False_eblock544
.label IfThenElse_IGT4_GreaterThan_False_ctb543 ;Main true block ;keep 
	; LineNumber: 235
	; LineNumber: 236
	call Common_FAIL
	; LineNumber: 236
	jump IfThenElse_IGT4_GreaterThan_False_edblock545
.label IfThenElse_IGT4_GreaterThan_False_eblock544
	; LineNumber: 235
	; LineNumber: 236
	call Common_PASS
	; LineNumber: 236
.label IfThenElse_IGT4_GreaterThan_False_edblock545
	; LineNumber: 237
	return
.label end_procedure_IfThenElse_IGT4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGT5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 241
.label IfThenElse_IGT5_GreaterThan_True
	; LineNumber: 242
	mov 	Vars_i1 	uint16:0x9f6
	; LineNumber: 242
	mov 	Vars_i2 	uint8:0x00
	; LineNumber: 243
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGT5_GreaterThan_True_stringassigncpy552
	load 	IfThenElse_IGT5_GreaterThan_True_stringassignstr551 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGT5_GreaterThan_True_stringassigncpy552
	; LineNumber: 243
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT5_GreaterThan_True_eblock555
.label IfThenElse_IGT5_GreaterThan_True_ctb554 ;Main true block ;keep 
	; LineNumber: 242
	; LineNumber: 243
	call Common_PASS
	; LineNumber: 243
	jump IfThenElse_IGT5_GreaterThan_True_edblock556
.label IfThenElse_IGT5_GreaterThan_True_eblock555
	; LineNumber: 242
	; LineNumber: 243
	call Common_FAIL
	; LineNumber: 243
.label IfThenElse_IGT5_GreaterThan_True_edblock556
	; LineNumber: 244
	return
.label end_procedure_IfThenElse_IGT5_GreaterThan_True
	
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGTE1_GreaterEqual_True
	;    Procedure type : User-defined procedure
	; LineNumber: 249
.label IfThenElse_IGTE1_GreaterEqual_True
	; LineNumber: 250
	mov 	Vars_i1 	uint16:0x1fe
	; LineNumber: 250
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 251
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGTE1_GreaterEqual_True_stringassigncpy563
	load 	IfThenElse_IGTE1_GreaterEqual_True_stringassignstr562 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGTE1_GreaterEqual_True_stringassigncpy563
	; LineNumber: 251
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE1_GreaterEqual_True_eblock566
.label IfThenElse_IGTE1_GreaterEqual_True_ctb565 ;Main true block ;keep 
	; LineNumber: 250
	; LineNumber: 251
	call Common_PASS
	; LineNumber: 251
	jump IfThenElse_IGTE1_GreaterEqual_True_edblock567
.label IfThenElse_IGTE1_GreaterEqual_True_eblock566
	; LineNumber: 250
	; LineNumber: 251
	call Common_FAIL
	; LineNumber: 251
.label IfThenElse_IGTE1_GreaterEqual_True_edblock567
	; LineNumber: 252
	return
.label end_procedure_IfThenElse_IGTE1_GreaterEqual_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGTE2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 256
.label IfThenElse_IGTE2_GreaterThan_False
	; LineNumber: 257
	mov 	Vars_i1 	uint16:0x1ea
	; LineNumber: 257
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 258
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGTE2_GreaterThan_False_stringassigncpy574
	load 	IfThenElse_IGTE2_GreaterThan_False_stringassignstr573 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGTE2_GreaterThan_False_stringassigncpy574
	; LineNumber: 258
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE2_GreaterThan_False_eblock577
.label IfThenElse_IGTE2_GreaterThan_False_ctb576 ;Main true block ;keep 
	; LineNumber: 257
	; LineNumber: 258
	call Common_FAIL
	; LineNumber: 258
	jump IfThenElse_IGTE2_GreaterThan_False_edblock578
.label IfThenElse_IGTE2_GreaterThan_False_eblock577
	; LineNumber: 257
	; LineNumber: 258
	call Common_PASS
	; LineNumber: 258
.label IfThenElse_IGTE2_GreaterThan_False_edblock578
	; LineNumber: 259
	return
.label end_procedure_IfThenElse_IGTE2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGTE3_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 263
.label IfThenElse_IGTE3_GreaterThan_True
	; LineNumber: 264
	mov 	Vars_i1 	uint16:0x1f4
	; LineNumber: 264
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 265
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGTE3_GreaterThan_True_stringassigncpy585
	load 	IfThenElse_IGTE3_GreaterThan_True_stringassignstr584 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGTE3_GreaterThan_True_stringassigncpy585
	; LineNumber: 265
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE3_GreaterThan_True_eblock588
.label IfThenElse_IGTE3_GreaterThan_True_ctb587 ;Main true block ;keep 
	; LineNumber: 264
	; LineNumber: 265
	call Common_PASS
	; LineNumber: 265
	jump IfThenElse_IGTE3_GreaterThan_True_edblock589
.label IfThenElse_IGTE3_GreaterThan_True_eblock588
	; LineNumber: 264
	; LineNumber: 265
	call Common_FAIL
	; LineNumber: 265
.label IfThenElse_IGTE3_GreaterThan_True_edblock589
	; LineNumber: 266
	return
.label end_procedure_IfThenElse_IGTE3_GreaterThan_True
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGTE4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 270
.label IfThenElse_IGTE4_GreaterThan_False
	; LineNumber: 271
	mov 	Vars_i1 	uint8:0x00
	; LineNumber: 271
	mov 	Vars_i2 	uint16:0x9f6
	; LineNumber: 272
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGTE4_GreaterThan_False_stringassigncpy596
	load 	IfThenElse_IGTE4_GreaterThan_False_stringassignstr595 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGTE4_GreaterThan_False_stringassigncpy596
	; LineNumber: 272
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE4_GreaterThan_False_eblock599
.label IfThenElse_IGTE4_GreaterThan_False_ctb598 ;Main true block ;keep 
	; LineNumber: 271
	; LineNumber: 272
	call Common_FAIL
	; LineNumber: 272
	jump IfThenElse_IGTE4_GreaterThan_False_edblock600
.label IfThenElse_IGTE4_GreaterThan_False_eblock599
	; LineNumber: 271
	; LineNumber: 272
	call Common_PASS
	; LineNumber: 272
.label IfThenElse_IGTE4_GreaterThan_False_edblock600
	; LineNumber: 273
	return
.label end_procedure_IfThenElse_IGTE4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_IGTE5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 277
.label IfThenElse_IGTE5_GreaterThan_True
	; LineNumber: 278
	mov 	Vars_i1 	uint16:0x9f6
	; LineNumber: 278
	mov 	Vars_i2 	uint16:0x201
	; LineNumber: 279
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_IGTE5_GreaterThan_True_stringassigncpy607
	load 	IfThenElse_IGTE5_GreaterThan_True_stringassignstr606 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_IGTE5_GreaterThan_True_stringassigncpy607
	; LineNumber: 279
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE5_GreaterThan_True_eblock610
.label IfThenElse_IGTE5_GreaterThan_True_ctb609 ;Main true block ;keep 
	; LineNumber: 278
	; LineNumber: 279
	call Common_PASS
	; LineNumber: 279
	jump IfThenElse_IGTE5_GreaterThan_True_edblock611
.label IfThenElse_IGTE5_GreaterThan_True_eblock610
	; LineNumber: 278
	; LineNumber: 279
	call Common_FAIL
	; LineNumber: 279
.label IfThenElse_IGTE5_GreaterThan_True_edblock611
	; LineNumber: 280
	return
.label end_procedure_IfThenElse_IGTE5_GreaterThan_True
	
; //
; // Integer LESS THAN
; //
; //
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILT1_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 292
.label IfThenElse_ILT1_GreaterThan_True
	; LineNumber: 293
	mov 	Vars_i1 	uint16:0x3e8
	; LineNumber: 293
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 294
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILT1_GreaterThan_True_stringassigncpy618
	load 	IfThenElse_ILT1_GreaterThan_True_stringassignstr617 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILT1_GreaterThan_True_stringassigncpy618
	; LineNumber: 294
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT1_GreaterThan_True_eblock621
.label IfThenElse_ILT1_GreaterThan_True_ctb620 ;Main true block ;keep 
	; LineNumber: 293
	; LineNumber: 294
	call Common_PASS
	; LineNumber: 294
	jump IfThenElse_ILT1_GreaterThan_True_edblock622
.label IfThenElse_ILT1_GreaterThan_True_eblock621
	; LineNumber: 293
	; LineNumber: 294
	call Common_FAIL
	; LineNumber: 294
.label IfThenElse_ILT1_GreaterThan_True_edblock622
	; LineNumber: 295
	return
.label end_procedure_IfThenElse_ILT1_GreaterThan_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILT2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 299
.label IfThenElse_ILT2_GreaterThan_False
	; LineNumber: 300
	mov 	Vars_i1 	uint8:0x64
	; LineNumber: 300
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 301
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILT2_GreaterThan_False_stringassigncpy629
	load 	IfThenElse_ILT2_GreaterThan_False_stringassignstr628 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILT2_GreaterThan_False_stringassigncpy629
	; LineNumber: 301
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT2_GreaterThan_False_eblock632
.label IfThenElse_ILT2_GreaterThan_False_ctb631 ;Main true block ;keep 
	; LineNumber: 300
	; LineNumber: 301
	call Common_FAIL
	; LineNumber: 301
	jump IfThenElse_ILT2_GreaterThan_False_edblock633
.label IfThenElse_ILT2_GreaterThan_False_eblock632
	; LineNumber: 300
	; LineNumber: 301
	call Common_PASS
	; LineNumber: 301
.label IfThenElse_ILT2_GreaterThan_False_edblock633
	; LineNumber: 302
	return
.label end_procedure_IfThenElse_ILT2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILT3_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 306
.label IfThenElse_ILT3_GreaterThan_False
	; LineNumber: 307
	mov 	Vars_i1 	uint16:0x1f4
	; LineNumber: 307
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 308
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILT3_GreaterThan_False_stringassigncpy640
	load 	IfThenElse_ILT3_GreaterThan_False_stringassignstr639 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILT3_GreaterThan_False_stringassigncpy640
	; LineNumber: 308
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT3_GreaterThan_False_eblock643
.label IfThenElse_ILT3_GreaterThan_False_ctb642 ;Main true block ;keep 
	; LineNumber: 307
	; LineNumber: 308
	call Common_FAIL
	; LineNumber: 308
	jump IfThenElse_ILT3_GreaterThan_False_edblock644
.label IfThenElse_ILT3_GreaterThan_False_eblock643
	; LineNumber: 307
	; LineNumber: 308
	call Common_PASS
	; LineNumber: 308
.label IfThenElse_ILT3_GreaterThan_False_edblock644
	; LineNumber: 309
	return
.label end_procedure_IfThenElse_ILT3_GreaterThan_False
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILT4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 313
.label IfThenElse_ILT4_GreaterThan_False
	; LineNumber: 314
	mov 	Vars_i1 	uint8:0x00
	; LineNumber: 314
	mov 	Vars_i2 	uint16:0x9f6
	; LineNumber: 315
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILT4_GreaterThan_False_stringassigncpy651
	load 	IfThenElse_ILT4_GreaterThan_False_stringassignstr650 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILT4_GreaterThan_False_stringassigncpy651
	; LineNumber: 315
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT4_GreaterThan_False_eblock654
.label IfThenElse_ILT4_GreaterThan_False_ctb653 ;Main true block ;keep 
	; LineNumber: 314
	; LineNumber: 315
	call Common_FAIL
	; LineNumber: 315
	jump IfThenElse_ILT4_GreaterThan_False_edblock655
.label IfThenElse_ILT4_GreaterThan_False_eblock654
	; LineNumber: 314
	; LineNumber: 315
	call Common_PASS
	; LineNumber: 315
.label IfThenElse_ILT4_GreaterThan_False_edblock655
	; LineNumber: 316
	return
.label end_procedure_IfThenElse_ILT4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILT5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 320
.label IfThenElse_ILT5_GreaterThan_True
	; LineNumber: 321
	mov 	Vars_i1 	uint16:0x9f6
	; LineNumber: 321
	mov 	Vars_i2 	uint8:0x00
	; LineNumber: 322
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILT5_GreaterThan_True_stringassigncpy662
	load 	IfThenElse_ILT5_GreaterThan_True_stringassignstr661 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILT5_GreaterThan_True_stringassigncpy662
	; LineNumber: 322
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT5_GreaterThan_True_eblock665
.label IfThenElse_ILT5_GreaterThan_True_ctb664 ;Main true block ;keep 
	; LineNumber: 321
	; LineNumber: 322
	call Common_PASS
	; LineNumber: 322
	jump IfThenElse_ILT5_GreaterThan_True_edblock666
.label IfThenElse_ILT5_GreaterThan_True_eblock665
	; LineNumber: 321
	; LineNumber: 322
	call Common_FAIL
	; LineNumber: 322
.label IfThenElse_ILT5_GreaterThan_True_edblock666
	; LineNumber: 323
	return
.label end_procedure_IfThenElse_ILT5_GreaterThan_True
	
; // when Vars::v1 is greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILTE1_GreaterEqual_True
	;    Procedure type : User-defined procedure
	; LineNumber: 328
.label IfThenElse_ILTE1_GreaterEqual_True
	; LineNumber: 329
	mov 	Vars_i1 	uint16:0x1fe
	; LineNumber: 329
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 330
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILTE1_GreaterEqual_True_stringassigncpy673
	load 	IfThenElse_ILTE1_GreaterEqual_True_stringassignstr672 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILTE1_GreaterEqual_True_stringassigncpy673
	; LineNumber: 330
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE1_GreaterEqual_True_eblock676
.label IfThenElse_ILTE1_GreaterEqual_True_ctb675 ;Main true block ;keep 
	; LineNumber: 329
	; LineNumber: 330
	call Common_PASS
	; LineNumber: 330
	jump IfThenElse_ILTE1_GreaterEqual_True_edblock677
.label IfThenElse_ILTE1_GreaterEqual_True_eblock676
	; LineNumber: 329
	; LineNumber: 330
	call Common_FAIL
	; LineNumber: 330
.label IfThenElse_ILTE1_GreaterEqual_True_edblock677
	; LineNumber: 331
	return
.label end_procedure_IfThenElse_ILTE1_GreaterEqual_True
	
; // when Vars::v1 is not greater than Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILTE2_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 335
.label IfThenElse_ILTE2_GreaterThan_False
	; LineNumber: 336
	mov 	Vars_i1 	uint16:0x1ea
	; LineNumber: 336
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 337
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILTE2_GreaterThan_False_stringassigncpy684
	load 	IfThenElse_ILTE2_GreaterThan_False_stringassignstr683 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILTE2_GreaterThan_False_stringassigncpy684
	; LineNumber: 337
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE2_GreaterThan_False_eblock687
.label IfThenElse_ILTE2_GreaterThan_False_ctb686 ;Main true block ;keep 
	; LineNumber: 336
	; LineNumber: 337
	call Common_FAIL
	; LineNumber: 337
	jump IfThenElse_ILTE2_GreaterThan_False_edblock688
.label IfThenElse_ILTE2_GreaterThan_False_eblock687
	; LineNumber: 336
	; LineNumber: 337
	call Common_PASS
	; LineNumber: 337
.label IfThenElse_ILTE2_GreaterThan_False_edblock688
	; LineNumber: 338
	return
.label end_procedure_IfThenElse_ILTE2_GreaterThan_False
	
; // when Vars::v1 is equal to Vars::v2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILTE3_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 342
.label IfThenElse_ILTE3_GreaterThan_True
	; LineNumber: 343
	mov 	Vars_i1 	uint16:0x1f4
	; LineNumber: 343
	mov 	Vars_i2 	uint16:0x1f4
	; LineNumber: 344
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILTE3_GreaterThan_True_stringassigncpy695
	load 	IfThenElse_ILTE3_GreaterThan_True_stringassignstr694 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILTE3_GreaterThan_True_stringassigncpy695
	; LineNumber: 344
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE3_GreaterThan_True_eblock698
.label IfThenElse_ILTE3_GreaterThan_True_ctb697 ;Main true block ;keep 
	; LineNumber: 343
	; LineNumber: 344
	call Common_PASS
	; LineNumber: 344
	jump IfThenElse_ILTE3_GreaterThan_True_edblock699
.label IfThenElse_ILTE3_GreaterThan_True_eblock698
	; LineNumber: 343
	; LineNumber: 344
	call Common_FAIL
	; LineNumber: 344
.label IfThenElse_ILTE3_GreaterThan_True_edblock699
	; LineNumber: 345
	return
.label end_procedure_IfThenElse_ILTE3_GreaterThan_True
	
; // when Vars::v1 is zero and Vars::v2 is 255
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILTE4_GreaterThan_False
	;    Procedure type : User-defined procedure
	; LineNumber: 349
.label IfThenElse_ILTE4_GreaterThan_False
	; LineNumber: 350
	mov 	Vars_i1 	uint8:0x00
	; LineNumber: 350
	mov 	Vars_i2 	uint16:0x9f6
	; LineNumber: 351
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILTE4_GreaterThan_False_stringassigncpy706
	load 	IfThenElse_ILTE4_GreaterThan_False_stringassignstr705 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILTE4_GreaterThan_False_stringassigncpy706
	; LineNumber: 351
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE4_GreaterThan_False_eblock709
.label IfThenElse_ILTE4_GreaterThan_False_ctb708 ;Main true block ;keep 
	; LineNumber: 350
	; LineNumber: 351
	call Common_FAIL
	; LineNumber: 351
	jump IfThenElse_ILTE4_GreaterThan_False_edblock710
.label IfThenElse_ILTE4_GreaterThan_False_eblock709
	; LineNumber: 350
	; LineNumber: 351
	call Common_PASS
	; LineNumber: 351
.label IfThenElse_ILTE4_GreaterThan_False_edblock710
	; LineNumber: 352
	return
.label end_procedure_IfThenElse_ILTE4_GreaterThan_False
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_ILTE5_GreaterThan_True
	;    Procedure type : User-defined procedure
	; LineNumber: 356
.label IfThenElse_ILTE5_GreaterThan_True
	; LineNumber: 357
	mov 	Vars_i1 	uint16:0x9f6
	; LineNumber: 357
	mov 	Vars_i2 	uint16:0x201
	; LineNumber: 358
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_ILTE5_GreaterThan_True_stringassigncpy717
	load 	IfThenElse_ILTE5_GreaterThan_True_stringassignstr716 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_ILTE5_GreaterThan_True_stringassigncpy717
	; LineNumber: 358
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE5_GreaterThan_True_eblock720
.label IfThenElse_ILTE5_GreaterThan_True_ctb719 ;Main true block ;keep 
	; LineNumber: 357
	; LineNumber: 358
	call Common_PASS
	; LineNumber: 358
	jump IfThenElse_ILTE5_GreaterThan_True_edblock721
.label IfThenElse_ILTE5_GreaterThan_True_eblock720
	; LineNumber: 357
	; LineNumber: 358
	call Common_FAIL
	; LineNumber: 358
.label IfThenElse_ILTE5_GreaterThan_True_edblock721
	; LineNumber: 359
	return
.label end_procedure_IfThenElse_ILTE5_GreaterThan_True
	
; //
; //	L O N G
; //	
; //
; //
; // when Vars::v1 is greater than Vars::v2
; // when Vars::v1 is not greater than Vars::v2
; // when Vars::v1 is equal to Vars::v2
; // when Vars::v1 is zero and Vars::v2 is 255
; // when Vars::v1 is 255 and Vars::v2 is 0
; // when Vars::v1 is greater than Vars::v2
; // when Vars::v1 is not greater than Vars::v2
; // when Vars::v1 is equal to Vars::v2
; // when Vars::v1 is zero and Vars::v2 is 255
; // when Vars::v1 is 255 and Vars::v2 is 0
; //
; // Long LESS THAN
; //
; //
; // when Vars::v1 is greater than Vars::v2
; // when Vars::v1 is not greater than Vars::v2
; // when Vars::v1 is equal to Vars::v2
; // when Vars::v1 is zero and Vars::v2 is 255
; // when Vars::v1 is 255 and Vars::v2 is 0
; // when Vars::v1 is greater than Vars::v2
; // when Vars::v1 is not greater than Vars::v2
; // when Vars::v1 is equal to Vars::v2
; // when Vars::v1 is zero and Vars::v2 is 255
; // when Vars::v1 is 255 and Vars::v2 is 0
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_AdvancedI1
	;    Procedure type : User-defined procedure
	; LineNumber: 537
.label IfThenElse_AdvancedI1
	; LineNumber: 538
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 538
	mov 	Vars_i2 	uint16:0xfa0
	; LineNumber: 538
	mov 	Vars_i3 	uint16:0xbb8
	; LineNumber: 540
	
; //	Vars::text := "   AI 1:"; if (Vars::i1 >= Vars::i2 and Vars::i3=3000)  then begin Common::PASS(); end else begin Common::FAIL(); end;
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_AdvancedI1_stringassigncpy728
	load 	IfThenElse_AdvancedI1_stringassignstr727 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_AdvancedI1_stringassigncpy728
	; LineNumber: 540
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI1_eblock731
.label IfThenElse_AdvancedI1_localsuccess735 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0xbb8 	IfThenElse_AdvancedI1_eblock731
.label IfThenElse_AdvancedI1_ctb730 ;Main true block ;keep 
	; LineNumber: 539
	; LineNumber: 540
	call Common_PASS
	; LineNumber: 540
	jump IfThenElse_AdvancedI1_edblock732
.label IfThenElse_AdvancedI1_eblock731
	; LineNumber: 539
	; LineNumber: 540
	call Common_FAIL
	; LineNumber: 540
.label IfThenElse_AdvancedI1_edblock732
	; LineNumber: 541
	return
.label end_procedure_IfThenElse_AdvancedI1
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_AdvancedI2
	;    Procedure type : User-defined procedure
	; LineNumber: 546
.label IfThenElse_AdvancedI2
	; LineNumber: 547
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 547
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 547
	mov 	Vars_i3 	uint16:0xbb8
	; LineNumber: 548
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_AdvancedI2_stringassigncpy740
	load 	IfThenElse_AdvancedI2_stringassignstr739 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_AdvancedI2_stringassigncpy740
	; LineNumber: 548
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI2_localfailed747
	jump IfThenElse_AdvancedI2_ctb742
.label IfThenElse_AdvancedI2_localfailed747 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0x1388 	IfThenElse_AdvancedI2_eblock743
.label IfThenElse_AdvancedI2_ctb742 ;Main true block ;keep 
	; LineNumber: 547
	; LineNumber: 548
	call Common_FAIL
	; LineNumber: 548
	jump IfThenElse_AdvancedI2_edblock744
.label IfThenElse_AdvancedI2_eblock743
	; LineNumber: 547
	; LineNumber: 548
	call Common_PASS
	; LineNumber: 548
.label IfThenElse_AdvancedI2_edblock744
	; LineNumber: 549
	return
.label end_procedure_IfThenElse_AdvancedI2
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_AdvancedI3
	;    Procedure type : User-defined procedure
	; LineNumber: 553
.label IfThenElse_AdvancedI3
	; LineNumber: 554
	mov 	Vars_i1 	uint16:0x1388
	; LineNumber: 554
	mov 	Vars_i2 	uint16:0x1388
	; LineNumber: 554
	mov 	Vars_i3 	uint16:0xbb8
	; LineNumber: 555
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_AdvancedI3_stringassigncpy752
	load 	IfThenElse_AdvancedI3_stringassignstr751 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_AdvancedI3_stringassigncpy752
	; LineNumber: 555
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI3_localfailed759
	jump IfThenElse_AdvancedI3_ctb754
.label IfThenElse_AdvancedI3_localfailed759 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0xbb8 	IfThenElse_AdvancedI3_eblock755
.label IfThenElse_AdvancedI3_localsuccess760 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	uint16:0x1388 	IfThenElse_AdvancedI3_eblock755
.label IfThenElse_AdvancedI3_ctb754 ;Main true block ;keep 
	; LineNumber: 554
	; LineNumber: 555
	call Common_PASS
	; LineNumber: 555
	jump IfThenElse_AdvancedI3_edblock756
.label IfThenElse_AdvancedI3_eblock755
	; LineNumber: 554
	; LineNumber: 555
	call Common_FAIL
	; LineNumber: 555
.label IfThenElse_AdvancedI3_edblock756
	; LineNumber: 556
	return
.label end_procedure_IfThenElse_AdvancedI3
	
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_AdvancedI4
	;    Procedure type : User-defined procedure
	; LineNumber: 567
.label IfThenElse_AdvancedI4
	; LineNumber: 568
	mov 	Vars_i1 	uint16:0x600
	; LineNumber: 569
	mov 	Vars_v1 	uint8:0xf0
	; LineNumber: 570
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_AdvancedI4_stringassigncpy765
	load 	IfThenElse_AdvancedI4_stringassignstr764 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_AdvancedI4_stringassigncpy765
	; LineNumber: 571
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	uint16:0x501 	IfThenElse_AdvancedI4_eblock768
.label IfThenElse_AdvancedI4_localsuccess772 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	uint16:0x551 	IfThenElse_AdvancedI4_eblock768
.label IfThenElse_AdvancedI4_ctb767 ;Main true block ;keep 
	; LineNumber: 570
	call Common_FAIL
	jump IfThenElse_AdvancedI4_edblock769
.label IfThenElse_AdvancedI4_eblock768
	; LineNumber: 570
	call Common_PASS
.label IfThenElse_AdvancedI4_edblock769
	; LineNumber: 574
	return
.label end_procedure_IfThenElse_AdvancedI4
	
; //	Vars::text := "   AI:"; asm(";bummer");if ((Vars::i1 > $551)) then Common::FAIL() else Common::PASS();
; //	Vars::text := "   AI:"; asm(";bummer");if (Vars::v1 > $20 and Vars::v1 < $50) then Common::FAIL() else Common::PASS();
; // when Vars::v1 is 255 and Vars::v2 is 0
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_AdvancedI5
	;    Procedure type : User-defined procedure
	; LineNumber: 578
.label IfThenElse_AdvancedI5
	; LineNumber: 579
	mov 	Vars_i1 	uint16:0x600
	; LineNumber: 580
	mov 	Vars_v1 	uint8:0xf0
	; LineNumber: 581
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IfThenElse_AdvancedI5_stringassigncpy777
	load 	IfThenElse_AdvancedI5_stringassignstr776 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	IfThenElse_AdvancedI5_stringassigncpy777
	; LineNumber: 582
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	uint16:0x700 	IfThenElse_AdvancedI5_localfailed784
	jump IfThenElse_AdvancedI5_ctb779
.label IfThenElse_AdvancedI5_localfailed784 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	uint16:0x400 	IfThenElse_AdvancedI5_eblock780
.label IfThenElse_AdvancedI5_ctb779 ;Main true block ;keep 
	; LineNumber: 581
	call Common_FAIL
	jump IfThenElse_AdvancedI5_edblock781
.label IfThenElse_AdvancedI5_eblock780
	; LineNumber: 581
	call Common_PASS
.label IfThenElse_AdvancedI5_edblock781
	; LineNumber: 585
	return
.label end_procedure_IfThenElse_AdvancedI5
	
; //	Vars::text := "   AI:"; asm(";bummer");if ((Vars::i1 > $551)) then Common::FAIL() else Common::PASS();
; //	Vars::text := "   AI:"; asm(";bummer");if (Vars::v1 > $20 and Vars::v1 < $50) then Common::FAIL() else Common::PASS();
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : IfThenElse_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 592
.label IfThenElse_Exec
	; LineNumber: 594
	
; // initialise everything
	; Assigning a string : Common_zp
	mov 	Common_zp 	#IfThenElse_Exec_stringassignstr788
	call Common_Initialise
	; LineNumber: 597
	
; // Greater than conditional tests 
	call IfThenElse_GT1_GreaterThan_True
	; LineNumber: 598
	call IfThenElse_GT2_GreaterThan_False
	; LineNumber: 599
	call IfThenElse_GT3_GreaterThan_False
	; LineNumber: 600
	call IfThenElse_GT4_GreaterThan_False
	; LineNumber: 601
	call IfThenElse_GT5_GreaterThan_True
	; LineNumber: 605
	
; // Greater than or equal to conditional tests
	call IfThenElse_GTE1_GreaterEqual_True
	; LineNumber: 606
	call IfThenElse_GTE2_GreaterThan_False
	; LineNumber: 607
	call IfThenElse_GTE3_GreaterThan_True
	; LineNumber: 608
	call IfThenElse_GTE4_GreaterThan_False
	; LineNumber: 609
	call IfThenElse_GTE5_GreaterThan_True
	; LineNumber: 611
	
; // Less than conditional tests
	call IfThenElse_LT1_LessThan_True
	; LineNumber: 612
	call IfThenElse_LT2_LessThan_False
	; LineNumber: 613
	call IfThenElse_LT3_LessThan_False
	; LineNumber: 614
	call IfThenElse_LT4_LessThan_True
	; LineNumber: 615
	call IfThenElse_LT5_LessThan_False
	; LineNumber: 618
	
; // Less than or equal to conditional tests
	call IfThenElse_LTE1_LessEqual_True
	; LineNumber: 619
	call IfThenElse_LTE1_LessEqual_True2
	; LineNumber: 620
	call IfThenElse_LTE2_LessThan_False
	; LineNumber: 621
	call IfThenElse_LTE3_LessThan_True
	; LineNumber: 622
	call IfThenElse_LTE4_LessThan_True
	; LineNumber: 623
	call IfThenElse_LTE5_LessThan_False
	; LineNumber: 626
	
; // Equal to conditional tests
	call IfThenElse_EQ1_EqualTo_True
	; LineNumber: 627
	call IfThenElse_EQ2_EqualTo_False
	; LineNumber: 630
	
; // Not Equal to conditional tests
	call IfThenElse_NEQ1_NotEqualTo_True
	; LineNumber: 631
	call IfThenElse_NEQ2_NotEqualTo_False
	; LineNumber: 633
	call IfThenElse_Advanced1
	; LineNumber: 634
	call IfThenElse_Advanced2
	; LineNumber: 639
	
; // Fails because of `ex`
; // Greater than conditional tests 
	call IfThenElse_IGT1_GreaterThan_True
	; LineNumber: 641
	call IfThenElse_IGT2_GreaterThan_False
	; LineNumber: 642
	call IfThenElse_IGT3_GreaterThan_False
	; LineNumber: 643
	call IfThenElse_IGT4_GreaterThan_False
	; LineNumber: 644
	call IfThenElse_IGT5_GreaterThan_True
	; LineNumber: 647
	
; // Greater than or equal to conditional tests
	call IfThenElse_IGTE1_GreaterEqual_True
	; LineNumber: 648
	call IfThenElse_IGTE2_GreaterThan_False
	; LineNumber: 649
	call IfThenElse_IGTE3_GreaterThan_True
	; LineNumber: 650
	call IfThenElse_IGTE4_GreaterThan_False
	; LineNumber: 651
	call IfThenElse_IGTE5_GreaterThan_True
	; LineNumber: 655
	
; // Integer less than conditional tests 
	call IfThenElse_ILT1_GreaterThan_True
	; LineNumber: 656
	call IfThenElse_ILT2_GreaterThan_False
	; LineNumber: 657
	call IfThenElse_ILT3_GreaterThan_False
	; LineNumber: 658
	call IfThenElse_ILT4_GreaterThan_False
	; LineNumber: 659
	call IfThenElse_ILT5_GreaterThan_True
	; LineNumber: 662
	
; // Greater than or equal to conditional tests
	call IfThenElse_ILTE1_GreaterEqual_True
	; LineNumber: 663
	call IfThenElse_ILTE2_GreaterThan_False
	; LineNumber: 664
	call IfThenElse_ILTE3_GreaterThan_True
	; LineNumber: 665
	call IfThenElse_ILTE4_GreaterThan_False
	; LineNumber: 666
	call IfThenElse_ILTE5_GreaterThan_True
	; LineNumber: 707
	
; // Greater than conditional tests 
; // Greater than or equal to conditional tests
; // Integer less than conditional tests 
; // Greater than or equal to conditional tests
	call IfThenElse_AdvancedI1
	; LineNumber: 710
	call IfThenElse_AdvancedI2
	; LineNumber: 711
	call IfThenElse_AdvancedI3
	; LineNumber: 712
	call IfThenElse_AdvancedI4
	; LineNumber: 713
	call IfThenElse_AdvancedI5
	; LineNumber: 716
	call Common_WaitABit
	; LineNumber: 721
	return
.label end_procedure_IfThenElse_Exec
	
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
.label MulDiv_ByteMulByte01_stringassigncpy791
	load 	MulDiv_ByteMulByte01_stringassignstr790 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulByte01_stringassigncpy791
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x87 	MulDiv_ByteMulByte01_eblock794
.label MulDiv_ByteMulByte01_ctb793 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump MulDiv_ByteMulByte01_edblock795
.label MulDiv_ByteMulByte01_eblock794
	; LineNumber: 11
	call Common_FAIL
.label MulDiv_ByteMulByte01_edblock795
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
.label MulDiv_ByteMulBytePow202_stringassigncpy802
	load 	MulDiv_ByteMulBytePow202_stringassignstr801 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePow202_stringassigncpy802
	; LineNumber: 20
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x3c 	MulDiv_ByteMulBytePow202_eblock805
.label MulDiv_ByteMulBytePow202_ctb804 ;Main true block ;keep 
	; LineNumber: 19
	call Common_PASS
	jump MulDiv_ByteMulBytePow202_edblock806
.label MulDiv_ByteMulBytePow202_eblock805
	; LineNumber: 19
	call Common_FAIL
.label MulDiv_ByteMulBytePow202_edblock806
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
.label MulDiv_ByteDivBytePow203_stringassigncpy813
	load 	MulDiv_ByteDivBytePow203_stringassignstr812 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteDivBytePow203_stringassigncpy813
	; LineNumber: 27
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x19 	MulDiv_ByteDivBytePow203_eblock816
.label MulDiv_ByteDivBytePow203_ctb815 ;Main true block ;keep 
	; LineNumber: 26
	call Common_PASS
	jump MulDiv_ByteDivBytePow203_edblock817
.label MulDiv_ByteDivBytePow203_eblock816
	; LineNumber: 26
	call Common_FAIL
.label MulDiv_ByteDivBytePow203_edblock817
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
.label MulDiv_ByteDivByte04_stringassigncpy824
	load 	MulDiv_ByteDivByte04_stringassignstr823 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteDivByte04_stringassigncpy824
	; LineNumber: 37
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x14 	MulDiv_ByteDivByte04_eblock827
.label MulDiv_ByteDivByte04_ctb826 ;Main true block ;keep 
	; LineNumber: 36
	call Common_PASS
	jump MulDiv_ByteDivByte04_edblock828
.label MulDiv_ByteDivByte04_eblock827
	; LineNumber: 36
	call Common_FAIL
.label MulDiv_ByteDivByte04_edblock828
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
.label MulDiv_ByteMulMul05_stringassigncpy835
	load 	MulDiv_ByteMulMul05_stringassignstr834 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulMul05_stringassigncpy835
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x30 	MulDiv_ByteMulMul05_eblock838
.label MulDiv_ByteMulMul05_ctb837 ;Main true block ;keep 
	; LineNumber: 47
	call Common_PASS
	jump MulDiv_ByteMulMul05_edblock839
.label MulDiv_ByteMulMul05_eblock838
	; LineNumber: 47
	call Common_FAIL
.label MulDiv_ByteMulMul05_edblock839
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
.label MulDiv_IntByteMul06_stringassigncpy846
	load 	MulDiv_IntByteMul06_stringassignstr845 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMul06_stringassigncpy846
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xbd6 	MulDiv_IntByteMul06_eblock849
.label MulDiv_IntByteMul06_ctb848 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump MulDiv_IntByteMul06_edblock850
.label MulDiv_IntByteMul06_eblock849
	; LineNumber: 57
	call Common_FAIL
.label MulDiv_IntByteMul06_edblock850
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
.label MulDiv_IntMulPow07_stringassigncpy857
	load 	MulDiv_IntMulPow07_stringassignstr856 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulPow07_stringassigncpy857
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xfc8 	MulDiv_IntMulPow07_eblock860
.label MulDiv_IntMulPow07_ctb859 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump MulDiv_IntMulPow07_edblock861
.label MulDiv_IntMulPow07_eblock860
	; LineNumber: 69
	call Common_FAIL
.label MulDiv_IntMulPow07_edblock861
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
.label MulDiv_IntDivByte08_stringassigncpy868
	load 	MulDiv_IntDivByte08_stringassignstr867 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivByte08_stringassigncpy868
	; LineNumber: 80
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x7b 	MulDiv_IntDivByte08_eblock871
.label MulDiv_IntDivByte08_ctb870 ;Main true block ;keep 
	; LineNumber: 79
	call Common_PASS
	jump MulDiv_IntDivByte08_edblock872
.label MulDiv_IntDivByte08_eblock871
	; LineNumber: 79
	call Common_FAIL
.label MulDiv_IntDivByte08_edblock872
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
.label MulDiv_IntDivInt09_stringassigncpy879
	load 	MulDiv_IntDivInt09_stringassignstr878 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivInt09_stringassigncpy879
	; LineNumber: 89
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x3c 	MulDiv_IntDivInt09_eblock882
.label MulDiv_IntDivInt09_ctb881 ;Main true block ;keep 
	; LineNumber: 88
	call Common_PASS
	jump MulDiv_IntDivInt09_edblock883
.label MulDiv_IntDivInt09_eblock882
	; LineNumber: 88
	call Common_FAIL
.label MulDiv_IntDivInt09_edblock883
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
.label MulDiv_IntDivPow210_stringassigncpy890
	load 	MulDiv_IntDivPow210_stringassignstr889 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivPow210_stringassigncpy890
	; LineNumber: 97
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3a98 	MulDiv_IntDivPow210_eblock893
.label MulDiv_IntDivPow210_ctb892 ;Main true block ;keep 
	; LineNumber: 96
	call Common_PASS
	jump MulDiv_IntDivPow210_edblock894
.label MulDiv_IntDivPow210_eblock893
	; LineNumber: 96
	call Common_FAIL
.label MulDiv_IntDivPow210_edblock894
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
.label MulDiv_IntDivMix11_stringassigncpy901
	load 	MulDiv_IntDivMix11_stringassignstr900 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivMix11_stringassigncpy901
	; LineNumber: 107
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x258 	MulDiv_IntDivMix11_eblock904
.label MulDiv_IntDivMix11_ctb903 ;Main true block ;keep 
	; LineNumber: 106
	call Common_PASS
	jump MulDiv_IntDivMix11_edblock905
.label MulDiv_IntDivMix11_eblock904
	; LineNumber: 106
	call Common_FAIL
.label MulDiv_IntDivMix11_edblock905
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
.label MulDiv_IntDivMix12_stringassigncpy912
	load 	MulDiv_IntDivMix12_stringassignstr911 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntDivMix12_stringassigncpy912
	; LineNumber: 116
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x64 	MulDiv_IntDivMix12_eblock915
.label MulDiv_IntDivMix12_ctb914 ;Main true block ;keep 
	; LineNumber: 115
	call Common_PASS
	jump MulDiv_IntDivMix12_edblock916
.label MulDiv_IntDivMix12_eblock915
	; LineNumber: 115
	call Common_FAIL
.label MulDiv_IntDivMix12_edblock916
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
.label MulDiv_IntMulMix13_stringassigncpy923
	load 	MulDiv_IntMulMix13_stringassignstr922 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulMix13_stringassigncpy923
	; LineNumber: 125
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e20 	MulDiv_IntMulMix13_eblock926
.label MulDiv_IntMulMix13_ctb925 ;Main true block ;keep 
	; LineNumber: 124
	call Common_PASS
	jump MulDiv_IntMulMix13_edblock927
.label MulDiv_IntMulMix13_eblock926
	; LineNumber: 124
	call Common_FAIL
.label MulDiv_IntMulMix13_edblock927
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
.label MulDiv_IntMulInt14_stringassigncpy934
	load 	MulDiv_IntMulInt14_stringassignstr933 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulInt14_stringassigncpy934
	; LineNumber: 135
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x64 	MulDiv_IntMulInt14_eblock937
.label MulDiv_IntMulInt14_ctb936 ;Main true block ;keep 
	; LineNumber: 134
	call Common_PASS
	jump MulDiv_IntMulInt14_edblock938
.label MulDiv_IntMulInt14_eblock937
	; LineNumber: 134
	call Common_FAIL
.label MulDiv_IntMulInt14_edblock938
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
.label MulDiv_IntMulAdvancedMix15_stringassigncpy945
	load 	MulDiv_IntMulAdvancedMix15_stringassignstr944 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulAdvancedMix15_stringassigncpy945
	; LineNumber: 148
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_IntMulAdvancedMix15_eblock948
.label MulDiv_IntMulAdvancedMix15_ctb947 ;Main true block ;keep 
	; LineNumber: 147
	call Common_PASS
	jump MulDiv_IntMulAdvancedMix15_edblock949
.label MulDiv_IntMulAdvancedMix15_eblock948
	; LineNumber: 147
	call Common_FAIL
.label MulDiv_IntMulAdvancedMix15_edblock949
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
.label MulDiv_ByteMulAdvanced16_stringassigncpy956
	load 	MulDiv_ByteMulAdvanced16_stringassignstr955 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulAdvanced16_stringassigncpy956
	; LineNumber: 158
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x12 	MulDiv_ByteMulAdvanced16_eblock959
.label MulDiv_ByteMulAdvanced16_ctb958 ;Main true block ;keep 
	; LineNumber: 157
	call Common_PASS
	jump MulDiv_ByteMulAdvanced16_edblock960
.label MulDiv_ByteMulAdvanced16_eblock959
	; LineNumber: 157
	call Common_FAIL
.label MulDiv_ByteMulAdvanced16_edblock960
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
.label MulDiv_IntMulConst17_stringassigncpy967
	load 	MulDiv_IntMulConst17_stringassignstr966 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntMulConst17_stringassigncpy967
	; LineNumber: 167
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x32 	MulDiv_IntMulConst17_eblock970
.label MulDiv_IntMulConst17_ctb969 ;Main true block ;keep 
	; LineNumber: 166
	call Common_PASS
	jump MulDiv_IntMulConst17_edblock971
.label MulDiv_IntMulConst17_eblock970
	; LineNumber: 166
	call Common_FAIL
.label MulDiv_IntMulConst17_edblock971
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
.label MulDiv_IntCombConst18_stringassigncpy978
	load 	MulDiv_IntCombConst18_stringassignstr977 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntCombConst18_stringassigncpy978
	; LineNumber: 178
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e2 	MulDiv_IntCombConst18_eblock981
.label MulDiv_IntCombConst18_ctb980 ;Main true block ;keep 
	; LineNumber: 177
	call Common_PASS
	jump MulDiv_IntCombConst18_edblock982
.label MulDiv_IntCombConst18_eblock981
	; LineNumber: 177
	call Common_FAIL
.label MulDiv_IntCombConst18_edblock982
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
.label MulDiv_IntCombConst19_stringassigncpy989
	load 	MulDiv_IntCombConst19_stringassignstr988 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntCombConst19_stringassigncpy989
	; LineNumber: 187
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1388 	MulDiv_IntCombConst19_eblock992
.label MulDiv_IntCombConst19_ctb991 ;Main true block ;keep 
	; LineNumber: 186
	call Common_PASS
	jump MulDiv_IntCombConst19_edblock993
.label MulDiv_IntCombConst19_eblock992
	; LineNumber: 186
	call Common_FAIL
.label MulDiv_IntCombConst19_edblock993
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
.label MulDiv_IntShift20_stringassigncpy1000
	load 	MulDiv_IntShift20_stringassignstr999 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntShift20_stringassigncpy1000
	; LineNumber: 195
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x500 	MulDiv_IntShift20_eblock1003
.label MulDiv_IntShift20_ctb1002 ;Main true block ;keep 
	; LineNumber: 194
	call Common_PASS
	jump MulDiv_IntShift20_edblock1004
.label MulDiv_IntShift20_eblock1003
	; LineNumber: 194
	call Common_FAIL
.label MulDiv_IntShift20_edblock1004
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
.label MulDiv_IntShift21_stringassigncpy1011
	load 	MulDiv_IntShift21_stringassignstr1010 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntShift21_stringassigncpy1011
	; LineNumber: 204
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x0a 	MulDiv_IntShift21_eblock1014
.label MulDiv_IntShift21_ctb1013 ;Main true block ;keep 
	; LineNumber: 203
	call Common_PASS
	jump MulDiv_IntShift21_edblock1015
.label MulDiv_IntShift21_eblock1014
	; LineNumber: 203
	call Common_FAIL
.label MulDiv_IntShift21_edblock1015
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
.label MulDiv_Array1_stringassigncpy1022
	load 	MulDiv_Array1_stringassignstr1021 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Array1_stringassigncpy1022
	; LineNumber: 214
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x11 	MulDiv_Array1_eblock1025
.label MulDiv_Array1_ctb1024 ;Main true block ;keep 
	; LineNumber: 213
	call Common_PASS
	jump MulDiv_Array1_edblock1026
.label MulDiv_Array1_eblock1025
	; LineNumber: 213
	call Common_FAIL
.label MulDiv_Array1_edblock1026
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
.label MulDiv_Shift0_stringassigncpy1033
	load 	MulDiv_Shift0_stringassignstr1032 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift0_stringassigncpy1033
	; LineNumber: 225
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x14 	MulDiv_Shift0_eblock1036
.label MulDiv_Shift0_ctb1035 ;Main true block ;keep 
	; LineNumber: 224
	call Common_PASS
	jump MulDiv_Shift0_edblock1037
.label MulDiv_Shift0_eblock1036
	; LineNumber: 224
	call Common_FAIL
.label MulDiv_Shift0_edblock1037
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
.label MulDiv_Shift1_stringassigncpy1044
	load 	MulDiv_Shift1_stringassignstr1043 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift1_stringassigncpy1044
	; LineNumber: 236
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x28 	MulDiv_Shift1_eblock1047
.label MulDiv_Shift1_ctb1046 ;Main true block ;keep 
	; LineNumber: 235
	call Common_PASS
	jump MulDiv_Shift1_edblock1048
.label MulDiv_Shift1_eblock1047
	; LineNumber: 235
	call Common_FAIL
.label MulDiv_Shift1_edblock1048
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
.label MulDiv_Shift2_stringassigncpy1055
	load 	MulDiv_Shift2_stringassignstr1054 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift2_stringassigncpy1055
	; LineNumber: 247
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x0a 	MulDiv_Shift2_eblock1058
.label MulDiv_Shift2_ctb1057 ;Main true block ;keep 
	; LineNumber: 246
	call Common_PASS
	jump MulDiv_Shift2_edblock1059
.label MulDiv_Shift2_eblock1058
	; LineNumber: 246
	call Common_FAIL
.label MulDiv_Shift2_edblock1059
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
.label MulDiv_Shift4_stringassigncpy1066
	load 	MulDiv_Shift4_stringassignstr1065 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift4_stringassigncpy1066
	; LineNumber: 258
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x7d0 	MulDiv_Shift4_eblock1069
.label MulDiv_Shift4_ctb1068 ;Main true block ;keep 
	; LineNumber: 257
	call Common_PASS
	jump MulDiv_Shift4_edblock1070
.label MulDiv_Shift4_eblock1069
	; LineNumber: 257
	call Common_FAIL
.label MulDiv_Shift4_edblock1070
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
.label MulDiv_Shift5_stringassigncpy1077
	load 	MulDiv_Shift5_stringassignstr1076 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift5_stringassigncpy1077
	; LineNumber: 270
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1f40 	MulDiv_Shift5_eblock1080
.label MulDiv_Shift5_ctb1079 ;Main true block ;keep 
	; LineNumber: 269
	call Common_PASS
	jump MulDiv_Shift5_edblock1081
.label MulDiv_Shift5_eblock1080
	; LineNumber: 269
	call Common_FAIL
.label MulDiv_Shift5_edblock1081
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
.label MulDiv_Shift6_stringassigncpy1088
	load 	MulDiv_Shift6_stringassignstr1087 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_Shift6_stringassigncpy1088
	; LineNumber: 283
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_Shift6_eblock1091
.label MulDiv_Shift6_ctb1090 ;Main true block ;keep 
	; LineNumber: 282
	call Common_PASS
	jump MulDiv_Shift6_edblock1092
.label MulDiv_Shift6_eblock1091
	; LineNumber: 282
	call Common_FAIL
.label MulDiv_Shift6_edblock1092
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
.label MulDiv_IntByteMulR1_stringassigncpy1099
	load 	MulDiv_IntByteMulR1_stringassignstr1098 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR1_stringassigncpy1099
	; LineNumber: 295
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xdac 	MulDiv_IntByteMulR1_eblock1102
.label MulDiv_IntByteMulR1_ctb1101 ;Main true block ;keep 
	; LineNumber: 294
	call Common_PASS
	jump MulDiv_IntByteMulR1_edblock1103
.label MulDiv_IntByteMulR1_eblock1102
	; LineNumber: 294
	call Common_FAIL
.label MulDiv_IntByteMulR1_edblock1103
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
.label MulDiv_IntByteMulR2_stringassigncpy1110
	load 	MulDiv_IntByteMulR2_stringassignstr1109 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR2_stringassigncpy1110
	; LineNumber: 305
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x1194 	MulDiv_IntByteMulR2_eblock1113
.label MulDiv_IntByteMulR2_ctb1112 ;Main true block ;keep 
	; LineNumber: 304
	call Common_PASS
	jump MulDiv_IntByteMulR2_edblock1114
.label MulDiv_IntByteMulR2_eblock1113
	; LineNumber: 304
	call Common_FAIL
.label MulDiv_IntByteMulR2_edblock1114
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
.label MulDiv_IntByteMulR3_stringassigncpy1121
	load 	MulDiv_IntByteMulR3_stringassignstr1120 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR3_stringassigncpy1121
	; LineNumber: 316
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x320 	MulDiv_IntByteMulR3_eblock1124
.label MulDiv_IntByteMulR3_ctb1123 ;Main true block ;keep 
	; LineNumber: 315
	call Common_PASS
	jump MulDiv_IntByteMulR3_edblock1125
.label MulDiv_IntByteMulR3_eblock1124
	; LineNumber: 315
	call Common_FAIL
.label MulDiv_IntByteMulR3_edblock1125
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
.label MulDiv_IntByteMulR4_stringassigncpy1132
	load 	MulDiv_IntByteMulR4_stringassignstr1131 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_IntByteMulR4_stringassigncpy1132
	; LineNumber: 326
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x384 	MulDiv_IntByteMulR4_eblock1135
.label MulDiv_IntByteMulR4_ctb1134 ;Main true block ;keep 
	; LineNumber: 325
	call Common_PASS
	jump MulDiv_IntByteMulR4_edblock1136
.label MulDiv_IntByteMulR4_eblock1135
	; LineNumber: 325
	call Common_FAIL
.label MulDiv_IntByteMulR4_edblock1136
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
.label MulDiv_ByteMulBytePlus01_stringassigncpy1143
	load 	MulDiv_ByteMulBytePlus01_stringassignstr1142 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePlus01_stringassigncpy1143
	; LineNumber: 336
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x91 	MulDiv_ByteMulBytePlus01_eblock1146
.label MulDiv_ByteMulBytePlus01_ctb1145 ;Main true block ;keep 
	; LineNumber: 335
	call Common_PASS
	jump MulDiv_ByteMulBytePlus01_edblock1147
.label MulDiv_ByteMulBytePlus01_eblock1146
	; LineNumber: 335
	call Common_FAIL
.label MulDiv_ByteMulBytePlus01_edblock1147
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
.label MulDiv_ByteMulBytePlus02_stringassigncpy1154
	load 	MulDiv_ByteMulBytePlus02_stringassignstr1153 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	MulDiv_ByteMulBytePlus02_stringassigncpy1154
	; LineNumber: 346
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x0f 	MulDiv_ByteMulBytePlus02_eblock1157
.label MulDiv_ByteMulBytePlus02_ctb1156 ;Main true block ;keep 
	; LineNumber: 345
	call Common_PASS
	jump MulDiv_ByteMulBytePlus02_edblock1158
.label MulDiv_ByteMulBytePlus02_eblock1157
	; LineNumber: 345
	call Common_FAIL
.label MulDiv_ByteMulBytePlus02_edblock1158
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
	mov 	Common_zp 	#MulDiv_Exec_stringassignstr1164
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
	
; // memory inc test
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 10
.label Various_Test1
	; LineNumber: 11
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_Test1_stringassigncpy1167
	load 	Various_Test1_stringassignstr1166 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_Test1_stringassigncpy1167
	; LineNumber: 14
	store 	$8800 	uint8:0x00 	uint8:0x0a
	; LineNumber: 14
	.asm
	; Assigning memory location
	; Test Inc dec D
	inc $8800
	.endasm
	; LineNumber: 16
	; push
	load 	$8800 	uint8:0x00 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	_r8_1
	; LineNumber: 18
	; Binary clause Simplified: EQUALS
	; push
	load 	$8800 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0x0b 	Various_Test1_eblock1170
.label Various_Test1_ctb1169 ;Main true block ;keep 
	; LineNumber: 17
	call Common_PASS
	jump Various_Test1_edblock1171
.label Various_Test1_eblock1170
	; LineNumber: 17
	call Common_FAIL
.label Various_Test1_edblock1171
	; LineNumber: 19
	return
.label end_procedure_Various_Test1
	
; //	@ifndef TRS80COCO
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_LoHi1
	;    Procedure type : User-defined procedure
	; LineNumber: 26
.label Various_LoHi1
	; LineNumber: 27
	mov 	Vars_i1 	uint16:0x1234
	; LineNumber: 28
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_LoHi1_stringassigncpy1178
	load 	Various_LoHi1_stringassignstr1177 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_LoHi1_stringassigncpy1178
	; LineNumber: 29
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
	; LineNumber: 30
	; Binary clause Simplified: EQUALS
	jneq 	<Vars_i1 	uint8:0x34 	Various_LoHi1_eblock1182
.label Various_LoHi1_ctb1181 ;Main true block ;keep 
	; LineNumber: 29
	call Common_PASS
	jump Various_LoHi1_edblock1183
.label Various_LoHi1_eblock1182
	; LineNumber: 29
	call Common_FAIL
.label Various_LoHi1_edblock1183
	; LineNumber: 31
	return
.label end_procedure_Various_LoHi1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_LoHi2
	;    Procedure type : User-defined procedure
	; LineNumber: 34
.label Various_LoHi2
	; LineNumber: 35
	mov 	Vars_i1 	uint16:0x1234
	; LineNumber: 36
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_LoHi2_stringassigncpy1190
	load 	Various_LoHi2_stringassignstr1189 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_LoHi2_stringassigncpy1190
	; LineNumber: 37
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
	; LineNumber: 38
	; Binary clause Simplified: EQUALS
	jneq 	>Vars_i1 	uint8:0x12 	Various_LoHi2_eblock1194
.label Various_LoHi2_ctb1193 ;Main true block ;keep 
	; LineNumber: 37
	call Common_PASS
	jump Various_LoHi2_edblock1195
.label Various_LoHi2_eblock1194
	; LineNumber: 37
	call Common_FAIL
.label Various_LoHi2_edblock1195
	; LineNumber: 39
	return
.label end_procedure_Various_LoHi2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_TestAddress1
	;    Procedure type : User-defined procedure
	; LineNumber: 59
.label Various_TestAddress1
	; LineNumber: 60
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_TestAddress1_stringassigncpy1202
	load 	Various_TestAddress1_stringassignstr1201 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_TestAddress1_stringassigncpy1202
	; LineNumber: 61
	; Assigning memory location
	mov 	$8800 	uint8:0x80
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	jneq 	$8800 	uint8:0x80 	Various_TestAddress1_eblock1205
.label Various_TestAddress1_ctb1204 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Various_TestAddress1_edblock1206
.label Various_TestAddress1_eblock1205
	; LineNumber: 61
	call Common_FAIL
.label Various_TestAddress1_edblock1206
	; LineNumber: 64
	return
.label end_procedure_Various_TestAddress1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_TestAddress2
	;    Procedure type : User-defined procedure
	; LineNumber: 66
.label Various_TestAddress2
	; LineNumber: 67
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_TestAddress2_stringassigncpy1213
	load 	Various_TestAddress2_stringassignstr1212 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_TestAddress2_stringassigncpy1213
	; LineNumber: 68
	; push
	mov 	_r8_1 	uint8:0x90
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	$8800 	uint8:0x01 	_r8_1
	; LineNumber: 69
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	$8800 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x90 	Various_TestAddress2_eblock1216
.label Various_TestAddress2_ctb1215 ;Main true block ;keep 
	; LineNumber: 68
	call Common_PASS
	jump Various_TestAddress2_edblock1217
.label Various_TestAddress2_eblock1216
	; LineNumber: 68
	call Common_FAIL
.label Various_TestAddress2_edblock1217
	; LineNumber: 70
	return
.label end_procedure_Various_TestAddress2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_TestAddress3
	;    Procedure type : User-defined procedure
	; LineNumber: 72
.label Various_TestAddress3
	; LineNumber: 73
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_TestAddress3_stringassigncpy1224
	load 	Various_TestAddress3_stringassignstr1223 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_TestAddress3_stringassigncpy1224
	; LineNumber: 74
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 75
	; push
	mov 	_r8_1 	uint8:0xa0
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	$8800 	Vars_v1 	_r8_1
	; LineNumber: 76
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	$8800 	Vars_v1 	_r8_1
	jneq 	_r8_1 	uint8:0xa0 	Various_TestAddress3_eblock1227
.label Various_TestAddress3_ctb1226 ;Main true block ;keep 
	; LineNumber: 75
	call Common_PASS
	jump Various_TestAddress3_edblock1228
.label Various_TestAddress3_eblock1227
	; LineNumber: 75
	call Common_FAIL
.label Various_TestAddress3_edblock1228
	; LineNumber: 77
	return
.label end_procedure_Various_TestAddress3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryByte
	;    Procedure type : User-defined procedure
	; LineNumber: 81
.label Various_UnaryByte
	; LineNumber: 82
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 83
	; ::LoadVariable
	; push
	mov 	_r8_1 	Vars_v1
	sub _r8_1 	uint8:0x00 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v2 	_r8_1
	; LineNumber: 84
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryByte_stringassigncpy1235
	load 	Various_UnaryByte_stringassignstr1234 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_UnaryByte_stringassigncpy1235
	; LineNumber: 85
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0xfe 	Various_UnaryByte_eblock1238
.label Various_UnaryByte_ctb1237 ;Main true block ;keep 
	; LineNumber: 84
	call Common_PASS
	jump Various_UnaryByte_edblock1239
.label Various_UnaryByte_eblock1238
	; LineNumber: 84
	call Common_FAIL
.label Various_UnaryByte_edblock1239
	; LineNumber: 86
	return
.label end_procedure_Various_UnaryByte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger1
	;    Procedure type : User-defined procedure
	; LineNumber: 89
.label Various_UnaryInteger1
	; LineNumber: 90
	mov 	Vars_i1 	uint8:0x02
	; LineNumber: 91
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 92
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger1_stringassigncpy1246
	load 	Various_UnaryInteger1_stringassignstr1245 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_UnaryInteger1_stringassigncpy1246
	; LineNumber: 93
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xfffe 	Various_UnaryInteger1_eblock1249
.label Various_UnaryInteger1_ctb1248 ;Main true block ;keep 
	; LineNumber: 92
	call Common_PASS
	jump Various_UnaryInteger1_edblock1250
.label Various_UnaryInteger1_eblock1249
	; LineNumber: 92
	call Common_FAIL
.label Various_UnaryInteger1_edblock1250
	; LineNumber: 94
	return
.label end_procedure_Various_UnaryInteger1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger2
	;    Procedure type : User-defined procedure
	; LineNumber: 97
.label Various_UnaryInteger2
	; LineNumber: 98
	mov 	Vars_i1 	uint16:0x100
	; LineNumber: 99
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 100
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger2_stringassigncpy1257
	load 	Various_UnaryInteger2_stringassignstr1256 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_UnaryInteger2_stringassigncpy1257
	; LineNumber: 101
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xff00 	Various_UnaryInteger2_eblock1260
.label Various_UnaryInteger2_ctb1259 ;Main true block ;keep 
	; LineNumber: 100
	call Common_PASS
	jump Various_UnaryInteger2_edblock1261
.label Various_UnaryInteger2_eblock1260
	; LineNumber: 100
	call Common_FAIL
.label Various_UnaryInteger2_edblock1261
	; LineNumber: 102
	return
.label end_procedure_Various_UnaryInteger2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger3
	;    Procedure type : User-defined procedure
	; LineNumber: 106
.label Various_UnaryInteger3
	; LineNumber: 107
	mov 	Vars_i1 	uint16:0x1ff
	; LineNumber: 108
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 109
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger3_stringassigncpy1268
	load 	Various_UnaryInteger3_stringassignstr1267 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Various_UnaryInteger3_stringassigncpy1268
	; LineNumber: 110
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xfe01 	Various_UnaryInteger3_eblock1271
.label Various_UnaryInteger3_ctb1270 ;Main true block ;keep 
	; LineNumber: 109
	call Common_PASS
	jump Various_UnaryInteger3_edblock1272
.label Various_UnaryInteger3_eblock1271
	; LineNumber: 109
	call Common_FAIL
.label Various_UnaryInteger3_edblock1272
	; LineNumber: 111
	return
.label end_procedure_Various_UnaryInteger3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 114
.label Various_Exec
	; LineNumber: 115
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Various_Exec_stringassignstr1278
	call Common_Initialise
	; LineNumber: 121
	
; //	TestAutomaticOffpage();
; // Mul and div
	call Various_Test1
	; LineNumber: 126
	call Various_LoHi1
	; LineNumber: 127
	call Various_LoHi2
	; LineNumber: 132
	call Various_TestAddress1
	; LineNumber: 133
	call Various_TestAddress2
	; LineNumber: 134
	call Various_TestAddress3
	; LineNumber: 138
	call Various_UnaryByte
	; LineNumber: 139
	call Various_UnaryInteger1
	; LineNumber: 140
	call Various_UnaryInteger2
	; LineNumber: 141
	call Various_UnaryInteger3
	; LineNumber: 143
	call Common_WaitABit
	; LineNumber: 144
	return
.label end_procedure_Various_Exec
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
.label Strings_Test1_stringassigncpy1281
	load 	Strings_Test1_stringassignstr1280 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test1_stringassigncpy1281
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	uint8:0x07 	uint8:0x07 	Strings_Test1_eblock1284
.label Strings_Test1_ctb1283 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump Strings_Test1_edblock1285
.label Strings_Test1_eblock1284
	; LineNumber: 11
	call Common_FAIL
.label Strings_Test1_edblock1285
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
.label Strings_Test2_stringassigncpy1292
	load 	Strings_Test2_stringassignstr1291 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test2_stringassigncpy1292
	; LineNumber: 19
	; Binary clause Simplified: EQUALS
	jneq 	uint8:0x0a 	uint8:0x0a 	Strings_Test2_eblock1295
.label Strings_Test2_ctb1294 ;Main true block ;keep 
	; LineNumber: 18
	call Common_PASS
	jump Strings_Test2_edblock1296
.label Strings_Test2_eblock1295
	; LineNumber: 18
	call Common_FAIL
.label Strings_Test2_edblock1296
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
.label Strings_Test3_stringassigncpy1303
	load 	Strings_Test3_stringassignstr1302 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_Test3_stringassigncpy1303
	; LineNumber: 26
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x04 	_r8_1
	jneq 	_r8_1 	uint8:0x41 	Strings_Test3_eblock1306
.label Strings_Test3_ctb1305 ;Main true block ;keep 
	; LineNumber: 25
	call Common_PASS
	jump Strings_Test3_edblock1307
.label Strings_Test3_eblock1306
	; LineNumber: 25
	call Common_FAIL
.label Strings_Test3_edblock1307
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
.label Strings_TestLst1_stringassigncpy1314
	load 	Strings_TestLst1_stringassignstr1313 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst1_stringassigncpy1314
	; LineNumber: 34
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 35
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x01 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 36
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x32 	Strings_TestLst1_eblock1317
.label Strings_TestLst1_ctb1316 ;Main true block ;keep 
	; LineNumber: 35
	call Common_PASS
	jump Strings_TestLst1_edblock1318
.label Strings_TestLst1_eblock1317
	; LineNumber: 35
	call Common_FAIL
.label Strings_TestLst1_edblock1318
	; LineNumber: 37
	return
.label end_procedure_Strings_TestLst1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst2
	;    Procedure type : User-defined procedure
	; LineNumber: 40
.label Strings_TestLst2
	; LineNumber: 41
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst2_stringassigncpy1325
	load 	Strings_TestLst2_stringassignstr1324 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst2_stringassigncpy1325
	; LineNumber: 43
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x4b 	Strings_TestLst2_eblock1328
.label Strings_TestLst2_ctb1327 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump Strings_TestLst2_edblock1329
.label Strings_TestLst2_eblock1328
	; LineNumber: 43
	call Common_FAIL
.label Strings_TestLst2_edblock1329
	; LineNumber: 45
	return
.label end_procedure_Strings_TestLst2
	
; // Copy string directly to list
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst3
	;    Procedure type : User-defined procedure
	; LineNumber: 49
.label Strings_TestLst3
	; LineNumber: 50
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst3_stringassigncpy1336
	load 	Strings_TestLst3_stringassignstr1335 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst3_stringassigncpy1336
	; LineNumber: 51
	; Assigning a string : Vars_strLst
	; push
	; push
	; push
	load 	Vars_strLst 	uint8:0x02 	_rp8_1
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst3_stringassigncpy1338
	load 	Strings_TestLst3_stringassignstr1337 	_r8_2 	_r8_1
	store 	_rp8_1 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst3_stringassigncpy1338
	; LineNumber: 52
	; ::LoadVariable
	; push
	load 	Vars_strLst 	uint8:0x02 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_p1 	_r16_1
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x45 	Strings_TestLst3_eblock1341
.label Strings_TestLst3_ctb1340 ;Main true block ;keep 
	; LineNumber: 53
	call Common_PASS
	jump Strings_TestLst3_edblock1342
.label Strings_TestLst3_eblock1341
	; LineNumber: 53
	call Common_FAIL
.label Strings_TestLst3_edblock1342
	; LineNumber: 55
	return
.label end_procedure_Strings_TestLst3
	
; // Setting a pointer to string
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_TestLst4
	;    Procedure type : User-defined procedure
	; LineNumber: 59
.label Strings_TestLst4
	; LineNumber: 60
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst4_stringassigncpy1349
	load 	Strings_TestLst4_stringassignstr1348 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Strings_TestLst4_stringassigncpy1349
	; LineNumber: 61
	; Assigning a string : Vars_p1
	mov 	Vars_p1 	#Strings_TestLst4_stringassignstr1350
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x59 	Strings_TestLst4_eblock1353
.label Strings_TestLst4_ctb1352 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Strings_TestLst4_edblock1354
.label Strings_TestLst4_eblock1353
	; LineNumber: 61
	call Common_FAIL
.label Strings_TestLst4_edblock1354
	; LineNumber: 63
	return
.label end_procedure_Strings_TestLst4
	
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Strings_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 69
.label Strings_Exec
	; LineNumber: 70
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Strings_Exec_stringassignstr1360
	call Common_Initialise
	; LineNumber: 73
	call Strings_Test1
	; LineNumber: 77
	call Strings_Test2
	; LineNumber: 78
	call Strings_Test3
	; LineNumber: 82
	call Strings_TestLst1
	; LineNumber: 83
	call Strings_TestLst2
	; LineNumber: 84
	call Strings_TestLst3
	; LineNumber: 85
	call Strings_TestLst4
	; LineNumber: 89
	call Common_WaitABit
	; LineNumber: 90
	return
.label end_procedure_Strings_Exec
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
	jneq 	Vars_j 	uint8:0x04 	CaseTest_Test1_casenext1363
	; LineNumber: 8
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test1_caseend1362
.label CaseTest_Test1_casenext1363
	jneq 	Vars_j 	uint8:0x0f 	CaseTest_Test1_casenext1365
	; LineNumber: 9
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test1_caseend1362
.label CaseTest_Test1_casenext1365
	jneq 	Vars_j 	uint8:0x18 	CaseTest_Test1_casenext1367
	; LineNumber: 10
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test1_casenext1367
.label CaseTest_Test1_caseend1362
	; LineNumber: 15
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test1_stringassigncpy1370
	load 	CaseTest_Test1_stringassignstr1369 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test1_stringassigncpy1370
	; LineNumber: 16
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test1_eblock1373
.label CaseTest_Test1_ctb1372 ;Main true block ;keep 
	; LineNumber: 15
	call Common_PASS
	jump CaseTest_Test1_edblock1374
.label CaseTest_Test1_eblock1373
	; LineNumber: 15
	call Common_FAIL
.label CaseTest_Test1_edblock1374
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
	jneq 	Vars_j2 	uint8:0x04 	CaseTest_Test2_casenext1381
	; LineNumber: 24
	mov 	Vars_i2 	uint8:0x05
	jump CaseTest_Test2_caseend1380
.label CaseTest_Test2_casenext1381
	jneq 	Vars_j2 	uint16:0x3a98 	CaseTest_Test2_casenext1383
	; LineNumber: 25
	mov 	Vars_i2 	uint8:0x0a
	jump CaseTest_Test2_caseend1380
.label CaseTest_Test2_casenext1383
	jneq 	Vars_j2 	uint8:0x18 	CaseTest_Test2_casenext1385
	; LineNumber: 26
	mov 	Vars_i2 	uint8:0x00
.label CaseTest_Test2_casenext1385
.label CaseTest_Test2_caseend1380
	; LineNumber: 30
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test2_stringassigncpy1388
	load 	CaseTest_Test2_stringassignstr1387 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test2_stringassigncpy1388
	; LineNumber: 31
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint8:0x0a 	CaseTest_Test2_eblock1391
.label CaseTest_Test2_ctb1390 ;Main true block ;keep 
	; LineNumber: 30
	call Common_PASS
	jump CaseTest_Test2_edblock1392
.label CaseTest_Test2_eblock1391
	; LineNumber: 30
	call Common_FAIL
.label CaseTest_Test2_edblock1392
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
	mov 	_temp_var_case4e5b 	_r8_1
	jneq 	_temp_var_case4e5b 	uint8:0x04 	CaseTest_Test3_casenext1399
	; LineNumber: 38
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test3_caseend1398
.label CaseTest_Test3_casenext1399
	jneq 	_temp_var_case4e5b 	uint8:0x2e 	CaseTest_Test3_casenext1401
	; LineNumber: 39
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test3_caseend1398
.label CaseTest_Test3_casenext1401
	jneq 	_temp_var_case4e5b 	uint8:0x18 	CaseTest_Test3_casenext1403
	; LineNumber: 40
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test3_casenext1403
.label CaseTest_Test3_caseend1398
	; LineNumber: 44
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test3_stringassigncpy1406
	load 	CaseTest_Test3_stringassignstr1405 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	CaseTest_Test3_stringassigncpy1406
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test3_eblock1409
.label CaseTest_Test3_ctb1408 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump CaseTest_Test3_edblock1410
.label CaseTest_Test3_eblock1409
	; LineNumber: 44
	call Common_FAIL
.label CaseTest_Test3_edblock1410
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
	mov 	Common_zp 	#CaseTest_Exec_stringassignstr1416
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
	; ***********  Defining procedure : Functions_FnByte
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label Functions_FnByte_block1417
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
.label Functions_FnByteAdv_block1418
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
.label Functions_FnByteInt_block1419
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
.label Functions_FnInt1_block1420
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
.label Functions_FnInt2_block1421
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
.label Functions_FnInt3_block1422
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
.label Functions_Test1_stringassigncpy1425
	load 	Functions_Test1_stringassignstr1424 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test1_stringassigncpy1425
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByte
	jneq 	Functions_FnByte_fret 	uint8:0x04 	Functions_Test1_eblock1428
.label Functions_Test1_ctb1427 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump Functions_Test1_edblock1429
.label Functions_Test1_eblock1428
	; LineNumber: 43
	call Common_FAIL
.label Functions_Test1_edblock1429
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
.label Functions_Test2_stringassigncpy1436
	load 	Functions_Test2_stringassignstr1435 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test2_stringassigncpy1436
	; LineNumber: 51
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteAdv
	jneq 	Functions_FnByteAdv_fret 	uint8:0x32 	Functions_Test2_eblock1439
.label Functions_Test2_ctb1438 ;Main true block ;keep 
	; LineNumber: 50
	call Common_PASS
	jump Functions_Test2_edblock1440
.label Functions_Test2_eblock1439
	; LineNumber: 50
	call Common_FAIL
.label Functions_Test2_edblock1440
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
.label Functions_Test3_stringassigncpy1447
	load 	Functions_Test3_stringassignstr1446 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test3_stringassigncpy1447
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteInt
	jneq 	Functions_FnByteInt_fret 	uint8:0x90 	Functions_Test3_eblock1450
.label Functions_Test3_ctb1449 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump Functions_Test3_edblock1451
.label Functions_Test3_eblock1450
	; LineNumber: 57
	call Common_FAIL
.label Functions_Test3_edblock1451
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
.label Functions_Test4_stringassigncpy1458
	load 	Functions_Test4_stringassignstr1457 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test4_stringassigncpy1458
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0xc8
	call Functions_FnInt1
	jneq 	Functions_FnInt1_fret 	uint16:0x190 	Functions_Test4_eblock1461
.label Functions_Test4_ctb1460 ;Main true block ;keep 
	; LineNumber: 63
	call Common_PASS
	jump Functions_Test4_edblock1462
.label Functions_Test4_eblock1461
	; LineNumber: 63
	call Common_FAIL
.label Functions_Test4_edblock1462
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
.label Functions_Test5_stringassigncpy1469
	load 	Functions_Test5_stringassignstr1468 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test5_stringassigncpy1469
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt2
	jneq 	Functions_FnInt2_fret 	uint16:0x7da 	Functions_Test5_eblock1472
.label Functions_Test5_ctb1471 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump Functions_Test5_edblock1473
.label Functions_Test5_eblock1472
	; LineNumber: 69
	call Common_FAIL
.label Functions_Test5_edblock1473
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
.label Functions_Test6_stringassigncpy1480
	load 	Functions_Test6_stringassignstr1479 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	Functions_Test6_stringassigncpy1480
	; LineNumber: 76
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt3
	jneq 	Functions_FnInt3_fret 	uint16:0xfb4 	Functions_Test6_eblock1483
.label Functions_Test6_ctb1482 ;Main true block ;keep 
	; LineNumber: 75
	call Common_PASS
	jump Functions_Test6_edblock1484
.label Functions_Test6_eblock1483
	; LineNumber: 75
	call Common_FAIL
.label Functions_Test6_edblock1484
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
	mov 	Common_zp 	#Functions_Exec_stringassignstr1490
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
	
; // byte shift 1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label BitOp_Test1
	; LineNumber: 7
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test1_stringassigncpy1493
	load 	BitOp_Test1_stringassignstr1492 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test1_stringassigncpy1493
	; LineNumber: 8
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 9
	; push
	shl  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	; LineNumber: 10
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
	; LineNumber: 11
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	BitOp_Test1_eblock1497
.label BitOp_Test1_ctb1496 ;Main true block ;keep 
	; LineNumber: 10
	call Common_PASS
	jump BitOp_Test1_edblock1498
.label BitOp_Test1_eblock1497
	; LineNumber: 10
	call Common_FAIL
.label BitOp_Test1_edblock1498
	; LineNumber: 12
	return
.label end_procedure_BitOp_Test1
	
; // byte shr 1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 16
.label BitOp_Test2
	; LineNumber: 17
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test2_stringassigncpy1505
	load 	BitOp_Test2_stringassignstr1504 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test2_stringassigncpy1505
	; LineNumber: 18
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 19
	; push
	shr  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	; LineNumber: 20
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
	; LineNumber: 21
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x02 	BitOp_Test2_eblock1509
.label BitOp_Test2_ctb1508 ;Main true block ;keep 
	; LineNumber: 20
	call Common_PASS
	jump BitOp_Test2_edblock1510
.label BitOp_Test2_eblock1509
	; LineNumber: 20
	call Common_FAIL
.label BitOp_Test2_edblock1510
	; LineNumber: 22
	return
.label end_procedure_BitOp_Test2
	
; // byte shl b
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 26
.label BitOp_Test3
	; LineNumber: 27
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test3_stringassigncpy1517
	load 	BitOp_Test3_stringassignstr1516 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test3_stringassigncpy1517
	; LineNumber: 28
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 29
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 30
	; push
	shl  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	; LineNumber: 32
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
	; LineNumber: 33
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	BitOp_Test3_eblock1521
.label BitOp_Test3_ctb1520 ;Main true block ;keep 
	; LineNumber: 32
	call Common_PASS
	jump BitOp_Test3_edblock1522
.label BitOp_Test3_eblock1521
	; LineNumber: 32
	call Common_FAIL
.label BitOp_Test3_edblock1522
	; LineNumber: 34
	return
.label end_procedure_BitOp_Test3
	
; // byte shr b
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test4
	;    Procedure type : User-defined procedure
	; LineNumber: 38
.label BitOp_Test4
	; LineNumber: 39
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test4_stringassigncpy1529
	load 	BitOp_Test4_stringassignstr1528 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test4_stringassigncpy1529
	; LineNumber: 40
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 41
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 42
	; push
	shr  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	; LineNumber: 43
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
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x02 	BitOp_Test4_eblock1533
.label BitOp_Test4_ctb1532 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump BitOp_Test4_edblock1534
.label BitOp_Test4_eblock1533
	; LineNumber: 43
	call Common_FAIL
.label BitOp_Test4_edblock1534
	; LineNumber: 45
	return
.label end_procedure_BitOp_Test4
	
; // integer shiftl 1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test5
	;    Procedure type : User-defined procedure
	; LineNumber: 49
.label BitOp_Test5
	; LineNumber: 50
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test5_stringassigncpy1541
	load 	BitOp_Test5_stringassignstr1540 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test5_stringassigncpy1541
	; LineNumber: 51
	mov 	Vars_i1 	uint8:0x02
	; LineNumber: 52
	; push
	shl  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	; LineNumber: 53
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
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x04 	BitOp_Test5_eblock1545
.label BitOp_Test5_ctb1544 ;Main true block ;keep 
	; LineNumber: 53
	call Common_PASS
	jump BitOp_Test5_edblock1546
.label BitOp_Test5_eblock1545
	; LineNumber: 53
	call Common_FAIL
.label BitOp_Test5_edblock1546
	; LineNumber: 55
	return
.label end_procedure_BitOp_Test5
	
; // integer shiftr r
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test6
	;    Procedure type : User-defined procedure
	; LineNumber: 59
.label BitOp_Test6
	; LineNumber: 60
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test6_stringassigncpy1553
	load 	BitOp_Test6_stringassignstr1552 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test6_stringassigncpy1553
	; LineNumber: 61
	mov 	Vars_i1 	uint8:0x04
	; LineNumber: 62
	; push
	shr  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	; LineNumber: 63
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
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x02 	BitOp_Test6_eblock1557
.label BitOp_Test6_ctb1556 ;Main true block ;keep 
	; LineNumber: 63
	call Common_PASS
	jump BitOp_Test6_edblock1558
.label BitOp_Test6_eblock1557
	; LineNumber: 63
	call Common_FAIL
.label BitOp_Test6_edblock1558
	; LineNumber: 65
	return
.label end_procedure_BitOp_Test6
	
; // integer shiftl b
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test7
	;    Procedure type : User-defined procedure
	; LineNumber: 69
.label BitOp_Test7
	; LineNumber: 70
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test7_stringassigncpy1565
	load 	BitOp_Test7_stringassignstr1564 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test7_stringassigncpy1565
	; LineNumber: 71
	mov 	Vars_i1 	uint16:0x1000
	; LineNumber: 72
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 73
	; push
	shl  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 74
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
	; LineNumber: 75
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x2000 	BitOp_Test7_eblock1569
.label BitOp_Test7_ctb1568 ;Main true block ;keep 
	; LineNumber: 74
	call Common_PASS
	jump BitOp_Test7_edblock1570
.label BitOp_Test7_eblock1569
	; LineNumber: 74
	call Common_FAIL
.label BitOp_Test7_edblock1570
	; LineNumber: 76
	return
.label end_procedure_BitOp_Test7
	
; // integer shiftr b
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test8
	;    Procedure type : User-defined procedure
	; LineNumber: 81
.label BitOp_Test8
	; LineNumber: 82
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test8_stringassigncpy1577
	load 	BitOp_Test8_stringassignstr1576 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test8_stringassigncpy1577
	; LineNumber: 83
	mov 	Vars_i1 	uint16:0x1000
	; LineNumber: 84
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 85
	; push
	shr  	_r16_1 	Vars_i1 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 86
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
	; LineNumber: 87
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x800 	BitOp_Test8_eblock1581
.label BitOp_Test8_ctb1580 ;Main true block ;keep 
	; LineNumber: 86
	call Common_PASS
	jump BitOp_Test8_edblock1582
.label BitOp_Test8_eblock1581
	; LineNumber: 86
	call Common_FAIL
.label BitOp_Test8_edblock1582
	; LineNumber: 88
	return
.label end_procedure_BitOp_Test8
	
; // integer shiftl advanced #1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test9
	;    Procedure type : User-defined procedure
	; LineNumber: 92
.label BitOp_Test9
	; LineNumber: 93
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test9_stringassigncpy1589
	load 	BitOp_Test9_stringassignstr1588 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test9_stringassigncpy1589
	; LineNumber: 94
	mov 	Vars_i1 	uint16:0x1000
	; LineNumber: 95
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 96
	; push
	; push
	add  	_r16_2 	Vars_v1 	uint16:0x01
	shl  	_r16_1 	Vars_i1 	_r16_2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 97
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
	; LineNumber: 98
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4000 	BitOp_Test9_eblock1593
.label BitOp_Test9_ctb1592 ;Main true block ;keep 
	; LineNumber: 97
	call Common_PASS
	jump BitOp_Test9_edblock1594
.label BitOp_Test9_eblock1593
	; LineNumber: 97
	call Common_FAIL
.label BitOp_Test9_edblock1594
	; LineNumber: 99
	return
.label end_procedure_BitOp_Test9
	
; // integer shiftl advanced #2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test10
	;    Procedure type : User-defined procedure
	; LineNumber: 103
.label BitOp_Test10
	; LineNumber: 104
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test10_stringassigncpy1601
	load 	BitOp_Test10_stringassignstr1600 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test10_stringassigncpy1601
	; LineNumber: 105
	mov 	Vars_i1 	uint16:0x100
	; LineNumber: 106
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 107
	; push
	; push
	; push
	; ::LoadVariable
	; push
	load 	Vars_ba1 	Vars_v1 	_r16_4
	add  	_r16_3 	_r16_4 	uint16:0x01
	mulu  	_r16_2 	_r16_3 	uint16:0x02
	shl  	_r16_1 	Vars_i1 	_r16_2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 108
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
	; LineNumber: 109
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1000 	BitOp_Test10_eblock1605
.label BitOp_Test10_ctb1604 ;Main true block ;keep 
	; LineNumber: 108
	call Common_PASS
	jump BitOp_Test10_edblock1606
.label BitOp_Test10_eblock1605
	; LineNumber: 108
	call Common_FAIL
.label BitOp_Test10_edblock1606
	; LineNumber: 110
	return
.label end_procedure_BitOp_Test10
	
; // integer shiftl advanced #2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Test11
	;    Procedure type : User-defined procedure
	; LineNumber: 115
.label BitOp_Test11
	; LineNumber: 116
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label BitOp_Test11_stringassigncpy1613
	load 	BitOp_Test11_stringassignstr1612 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	BitOp_Test11_stringassigncpy1613
	; LineNumber: 117
	; push
	mov 	Vars_ir_p1 	uint8:0x10
	call Vars_IntegerReturn
	shl  	_r16_1 	Vars_IntegerReturn_fret 	uint16:0x02
	mov 	Vars_i1 	_r16_1
	; LineNumber: 118
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
	; LineNumber: 119
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x80 	BitOp_Test11_eblock1617
.label BitOp_Test11_ctb1616 ;Main true block ;keep 
	; LineNumber: 118
	call Common_PASS
	jump BitOp_Test11_edblock1618
.label BitOp_Test11_eblock1617
	; LineNumber: 118
	call Common_FAIL
.label BitOp_Test11_edblock1618
	; LineNumber: 120
	return
.label end_procedure_BitOp_Test11
	; MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : BitOp_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 134
.label BitOp_Exec
	; LineNumber: 135
	; Assigning a string : Common_zp
	mov 	Common_zp 	#BitOp_Exec_stringassignstr1624
	call Common_Initialise
	; LineNumber: 137
	call BitOp_Test1
	; LineNumber: 138
	call BitOp_Test2
	; LineNumber: 139
	call BitOp_Test3
	; LineNumber: 140
	call BitOp_Test4
	; LineNumber: 141
	call BitOp_Test5
	; LineNumber: 142
	call BitOp_Test6
	; LineNumber: 144
	call BitOp_Test7
	; LineNumber: 145
	call BitOp_Test8
	; LineNumber: 146
	call BitOp_Test9
	; LineNumber: 148
	call BitOp_Test10
	; LineNumber: 149
	call BitOp_Test11
	; LineNumber: 155
	
; //	Test12();
	call Common_WaitABit
	; LineNumber: 156
	return
.label end_procedure_BitOp_Exec
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
.label AdvancedMath_Advanced01_stringassigncpy1627
	load 	AdvancedMath_Advanced01_stringassignstr1626 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced01_stringassigncpy1627
	; LineNumber: 9
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x40a 	AdvancedMath_Advanced01_eblock1630
.label AdvancedMath_Advanced01_ctb1629 ;Main true block ;keep 
	; LineNumber: 8
	call Common_PASS
	jump AdvancedMath_Advanced01_edblock1631
.label AdvancedMath_Advanced01_eblock1630
	; LineNumber: 8
	call Common_FAIL
.label AdvancedMath_Advanced01_edblock1631
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
.label AdvancedMath_Advanced02_stringassigncpy1638
	load 	AdvancedMath_Advanced02_stringassignstr1637 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced02_stringassigncpy1638
	; LineNumber: 15
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x450 	AdvancedMath_Advanced02_eblock1641
.label AdvancedMath_Advanced02_ctb1640 ;Main true block ;keep 
	; LineNumber: 14
	call Common_PASS
	jump AdvancedMath_Advanced02_edblock1642
.label AdvancedMath_Advanced02_eblock1641
	; LineNumber: 14
	call Common_FAIL
.label AdvancedMath_Advanced02_edblock1642
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
.label AdvancedMath_Advanced03_stringassigncpy1649
	load 	AdvancedMath_Advanced03_stringassignstr1648 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced03_stringassigncpy1649
	; LineNumber: 23
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x1180 	AdvancedMath_Advanced03_eblock1652
.label AdvancedMath_Advanced03_ctb1651 ;Main true block ;keep 
	; LineNumber: 22
	call Common_PASS
	jump AdvancedMath_Advanced03_edblock1653
.label AdvancedMath_Advanced03_eblock1652
	; LineNumber: 22
	call Common_FAIL
.label AdvancedMath_Advanced03_edblock1653
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
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	Vars_v1 	_r8_1
	add  	_r16_1 	Vars_p1 	_r8_1
	mov 	Vars_p1 	_r16_1
	; LineNumber: 33
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced04_stringassigncpy1660
	load 	AdvancedMath_Advanced04_stringassignstr1659 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced04_stringassigncpy1660
	; LineNumber: 33
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x402 	AdvancedMath_Advanced04_eblock1663
.label AdvancedMath_Advanced04_ctb1662 ;Main true block ;keep 
	; LineNumber: 32
	call Common_PASS
	jump AdvancedMath_Advanced04_edblock1664
.label AdvancedMath_Advanced04_eblock1663
	; LineNumber: 32
	call Common_FAIL
.label AdvancedMath_Advanced04_edblock1664
	; LineNumber: 34
	return
.label end_procedure_AdvancedMath_Advanced04
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced05
	;    Procedure type : User-defined procedure
	; LineNumber: 37
.label AdvancedMath_Advanced05
	; LineNumber: 38
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 39
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 40
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 41
	mov 	Vars_p1 	uint16:0x400
	; LineNumber: 42
	; push
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	mulu  	_r16_2 	_r8_1 	uint16:0x02
	add  	_r16_1 	Vars_p1 	_r16_2
	mov 	Vars_p1 	_r16_1
	; LineNumber: 44
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced05_stringassigncpy1671
	load 	AdvancedMath_Advanced05_stringassignstr1670 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced05_stringassigncpy1671
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x440 	AdvancedMath_Advanced05_eblock1674
.label AdvancedMath_Advanced05_ctb1673 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump AdvancedMath_Advanced05_edblock1675
.label AdvancedMath_Advanced05_eblock1674
	; LineNumber: 43
	call Common_FAIL
.label AdvancedMath_Advanced05_edblock1675
	; LineNumber: 45
	return
.label end_procedure_AdvancedMath_Advanced05
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced06
	;    Procedure type : User-defined procedure
	; LineNumber: 48
.label AdvancedMath_Advanced06
	; LineNumber: 49
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 50
	; LineNumber: 50
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 51
	mov 	Vars_v2 	uint8:0x03
	; LineNumber: 52
	store Vars_p2 Vars_v1 uint8:0x20
	; LineNumber: 53
	mov 	Vars_p1 	uint16:0x400
	; LineNumber: 54
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
	; LineNumber: 55
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced06_stringassigncpy1682
	load 	AdvancedMath_Advanced06_stringassignstr1681 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced06_stringassigncpy1682
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x470 	AdvancedMath_Advanced06_eblock1685
.label AdvancedMath_Advanced06_ctb1684 ;Main true block ;keep 
	; LineNumber: 54
	call Common_PASS
	jump AdvancedMath_Advanced06_edblock1686
.label AdvancedMath_Advanced06_eblock1685
	; LineNumber: 54
	call Common_FAIL
.label AdvancedMath_Advanced06_edblock1686
	; LineNumber: 56
	return
.label end_procedure_AdvancedMath_Advanced06
	
; //	Completely aware that this one fails. Works with *1, also with pointer +
; //
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced07
	;    Procedure type : User-defined procedure
	; LineNumber: 61
.label AdvancedMath_Advanced07
	; LineNumber: 62
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 63
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 64
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 65
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	add  	_r16_1 	uint16:0x400 	_r8_1
	mov 	Vars_p1 	_r16_1
	; LineNumber: 66
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced07_stringassigncpy1693
	load 	AdvancedMath_Advanced07_stringassignstr1692 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced07_stringassigncpy1693
	; LineNumber: 66
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x420 	AdvancedMath_Advanced07_eblock1696
.label AdvancedMath_Advanced07_ctb1695 ;Main true block ;keep 
	; LineNumber: 65
	call Common_PASS
	jump AdvancedMath_Advanced07_edblock1697
.label AdvancedMath_Advanced07_eblock1696
	; LineNumber: 65
	call Common_FAIL
.label AdvancedMath_Advanced07_edblock1697
	; LineNumber: 67
	return
.label end_procedure_AdvancedMath_Advanced07
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Advanced08
	;    Procedure type : User-defined procedure
	; LineNumber: 70
.label AdvancedMath_Advanced08
	; LineNumber: 71
	mov 	Vars_p2 	uint16:0x8800
	; LineNumber: 72
	store Vars_p2 uint8:0x01 uint8:0x20
	; LineNumber: 73
	; push
	; push
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p2 	uint8:0x01 	_r8_1
	mulu  	_r16_2 	_r8_1 	uint16:0x03
	add  	_r16_1 	uint16:0x400 	_r16_2
	mov 	Vars_p1 	_r16_1
	; LineNumber: 74
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_Advanced08_stringassigncpy1704
	load 	AdvancedMath_Advanced08_stringassignstr1703 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_Advanced08_stringassigncpy1704
	; LineNumber: 74
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x460 	AdvancedMath_Advanced08_eblock1707
.label AdvancedMath_Advanced08_ctb1706 ;Main true block ;keep 
	; LineNumber: 73
	call Common_PASS
	jump AdvancedMath_Advanced08_edblock1708
.label AdvancedMath_Advanced08_eblock1707
	; LineNumber: 73
	call Common_FAIL
.label AdvancedMath_Advanced08_edblock1708
	; LineNumber: 75
	return
.label end_procedure_AdvancedMath_Advanced08
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_factorial
	;    Procedure type : User-defined procedure
	; LineNumber: 80
	; LineNumber: 79
  decl  AdvancedMath_p  uint8:0
.label AdvancedMath_factorial_block1713
.label AdvancedMath_factorial
	; LineNumber: 81
	; Binary clause Simplified: GREATER
	; ::LoadVariable
	jlte 	_nada 	uint8:0x01 	AdvancedMath_factorial_edblock1717
.label AdvancedMath_factorial_ctb1715 ;Main true block ;keep 
	; LineNumber: 82
	; LineNumber: 83
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
	; LineNumber: 84
.label AdvancedMath_factorial_edblock1717
	; LineNumber: 86
	; LineNumber: 86
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
	; LineNumber: 110
.label AdvancedMath_MulDivCombo1
	; LineNumber: 111
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label AdvancedMath_MulDivCombo1_stringassigncpy1722
	load 	AdvancedMath_MulDivCombo1_stringassignstr1721 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	AdvancedMath_MulDivCombo1_stringassigncpy1722
	; LineNumber: 112
	mov 	Vars_v1 	uint8:0x10
	; LineNumber: 113
	mov 	Vars_i2 	uint16:0x200
	; LineNumber: 115
	
; // $100/$02*$10 = $800
	; push
	; push
	divu  	_r16_2 	uint16:0x100 	>Vars_i2
	mulu  	_r16_1 	_r16_2 	Vars_v1
	mov 	Vars_i1 	_r16_1
	; LineNumber: 116
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x800 	AdvancedMath_MulDivCombo1_eblock1725
.label AdvancedMath_MulDivCombo1_ctb1724 ;Main true block ;keep 
	; LineNumber: 115
	call Common_PASS
	jump AdvancedMath_MulDivCombo1_edblock1726
.label AdvancedMath_MulDivCombo1_eblock1725
	; LineNumber: 115
	call Common_FAIL
.label AdvancedMath_MulDivCombo1_edblock1726
	; LineNumber: 117
	return
.label end_procedure_AdvancedMath_MulDivCombo1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : AdvancedMath_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 143
.label AdvancedMath_Exec
	; LineNumber: 145
	
; // initialise everything
	; Assigning a string : Common_zp
	mov 	Common_zp 	#AdvancedMath_Exec_stringassignstr1732
	call Common_Initialise
	; LineNumber: 147
	
; // Fails because of `ex`
	call AdvancedMath_Advanced01
	; LineNumber: 148
	call AdvancedMath_Advanced02
	; LineNumber: 149
	call AdvancedMath_Advanced03
	; LineNumber: 150
	call AdvancedMath_Advanced04
	; LineNumber: 151
	
; // fails tripe
	call AdvancedMath_Advanced05
	; LineNumber: 153
	call AdvancedMath_Advanced06
	; LineNumber: 155
	call AdvancedMath_Advanced07
	; LineNumber: 156
	call AdvancedMath_Advanced08
	; LineNumber: 163
	
; //	AdvFactorial();
	call AdvancedMath_MulDivCombo1
	; LineNumber: 169
	
; //	MulDivCombo2();
; //	MulDivCombo3();
	call Common_WaitABit
	; LineNumber: 171
	return
.label end_procedure_AdvancedMath_Exec
	
; // regular for loop
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test1
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label ForLoop_Test1
	; LineNumber: 7
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test1_stringassigncpy1735
	load 	ForLoop_Test1_stringassignstr1734 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test1_stringassigncpy1735
	; LineNumber: 12
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test1_forloop1736
	; LineNumber: 9
	; LineNumber: 11
.label ForLoop_Test1_loopstart1737
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test1_forloop1736
.label ForLoop_Test1_loopdone1741 ;keep
.label ForLoop_Test1_loopend1738
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test1_eblock1744
.label ForLoop_Test1_ctb1743 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump ForLoop_Test1_edblock1745
.label ForLoop_Test1_eblock1744
	; LineNumber: 11
	call Common_FAIL
.label ForLoop_Test1_edblock1745
	; LineNumber: 13
	return
.label end_procedure_ForLoop_Test1
	
; // regular fori loop
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test2
	;    Procedure type : User-defined procedure
	; LineNumber: 18
.label ForLoop_Test2
	; LineNumber: 19
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test2_stringassigncpy1752
	load 	ForLoop_Test2_stringassignstr1751 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test2_stringassigncpy1752
	; LineNumber: 24
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test2_forloop1753
	; LineNumber: 21
	; LineNumber: 23
.label ForLoop_Test2_loopstart1754
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf1 	ForLoop_Test2_forloop1753
.label ForLoop_Test2_loopdone1758 ;keep
.label ForLoop_Test2_loopend1755
	; LineNumber: 24
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xf1 	ForLoop_Test2_eblock1761
.label ForLoop_Test2_ctb1760 ;Main true block ;keep 
	; LineNumber: 23
	call Common_PASS
	jump ForLoop_Test2_edblock1762
.label ForLoop_Test2_eblock1761
	; LineNumber: 23
	call Common_FAIL
.label ForLoop_Test2_edblock1762
	; LineNumber: 25
	return
.label end_procedure_ForLoop_Test2
	
; // regular for loop integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test3
	;    Procedure type : User-defined procedure
	; LineNumber: 30
.label ForLoop_Test3
	; LineNumber: 31
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test3_stringassigncpy1769
	load 	ForLoop_Test3_stringassignstr1768 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test3_stringassigncpy1769
	; LineNumber: 36
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test3_forloop1770
	; LineNumber: 33
	; LineNumber: 35
.label ForLoop_Test3_loopstart1771
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test3_forloop1770
.label ForLoop_Test3_loopdone1775 ;keep
.label ForLoop_Test3_loopend1772
	; LineNumber: 36
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test3_eblock1778
.label ForLoop_Test3_ctb1777 ;Main true block ;keep 
	; LineNumber: 35
	call Common_PASS
	jump ForLoop_Test3_edblock1779
.label ForLoop_Test3_eblock1778
	; LineNumber: 35
	call Common_FAIL
.label ForLoop_Test3_edblock1779
	; LineNumber: 37
	return
.label end_procedure_ForLoop_Test3
	
; // regular for loop integer
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test4
	;    Procedure type : User-defined procedure
	; LineNumber: 42
.label ForLoop_Test4
	; LineNumber: 43
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test4_stringassigncpy1786
	load 	ForLoop_Test4_stringassignstr1785 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test4_stringassigncpy1786
	; LineNumber: 48
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test4_forloop1787
	; LineNumber: 45
	; LineNumber: 47
.label ForLoop_Test4_loopstart1788
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e9 	ForLoop_Test4_forloop1787
.label ForLoop_Test4_loopdone1792 ;keep
.label ForLoop_Test4_loopend1789
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e9 	ForLoop_Test4_eblock1795
.label ForLoop_Test4_ctb1794 ;Main true block ;keep 
	; LineNumber: 47
	call Common_PASS
	jump ForLoop_Test4_edblock1796
.label ForLoop_Test4_eblock1795
	; LineNumber: 47
	call Common_FAIL
.label ForLoop_Test4_edblock1796
	; LineNumber: 49
	return
.label end_procedure_ForLoop_Test4
	
; // step byte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test5
	;    Procedure type : User-defined procedure
	; LineNumber: 54
.label ForLoop_Test5
	; LineNumber: 55
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test5_stringassigncpy1803
	load 	ForLoop_Test5_stringassignstr1802 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test5_stringassigncpy1803
	; LineNumber: 56
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 61
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test5_forloop1804
	; LineNumber: 58
	; LineNumber: 59
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 60
.label ForLoop_Test5_loopstart1805
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x04
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test5_forloop1804
.label ForLoop_Test5_loopdone1809 ;keep
.label ForLoop_Test5_loopend1806
	; LineNumber: 61
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x3c 	ForLoop_Test5_eblock1812
.label ForLoop_Test5_ctb1811 ;Main true block ;keep 
	; LineNumber: 60
	call Common_PASS
	jump ForLoop_Test5_edblock1813
.label ForLoop_Test5_eblock1812
	; LineNumber: 60
	call Common_FAIL
.label ForLoop_Test5_edblock1813
	; LineNumber: 62
	return
.label end_procedure_ForLoop_Test5
	
; // step word
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test6
	;    Procedure type : User-defined procedure
	; LineNumber: 66
.label ForLoop_Test6
	; LineNumber: 67
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test6_stringassigncpy1820
	load 	ForLoop_Test6_stringassignstr1819 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test6_stringassigncpy1820
	; LineNumber: 68
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 73
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test6_forloop1821
	; LineNumber: 70
	; LineNumber: 71
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 72
.label ForLoop_Test6_loopstart1822
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x04
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test6_forloop1821
.label ForLoop_Test6_loopdone1826 ;keep
.label ForLoop_Test6_loopend1823
	; LineNumber: 73
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0xfa 	ForLoop_Test6_eblock1829
.label ForLoop_Test6_ctb1828 ;Main true block ;keep 
	; LineNumber: 72
	call Common_PASS
	jump ForLoop_Test6_edblock1830
.label ForLoop_Test6_eblock1829
	; LineNumber: 72
	call Common_FAIL
.label ForLoop_Test6_edblock1830
	; LineNumber: 74
	return
.label end_procedure_ForLoop_Test6
	
; // step word
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test7
	;    Procedure type : User-defined procedure
	; LineNumber: 78
.label ForLoop_Test7
	; LineNumber: 79
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test7_stringassigncpy1837
	load 	ForLoop_Test7_stringassignstr1836 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test7_stringassigncpy1837
	; LineNumber: 80
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 85
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test7_forloop1838
	; LineNumber: 82
	; LineNumber: 83
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 84
.label ForLoop_Test7_loopstart1839
	; push
	add  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_Test7_forloop1838
.label ForLoop_Test7_loopdone1843 ;keep
.label ForLoop_Test7_loopend1840
	; LineNumber: 85
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x06 	ForLoop_Test7_eblock1846
.label ForLoop_Test7_ctb1845 ;Main true block ;keep 
	; LineNumber: 84
	call Common_PASS
	jump ForLoop_Test7_edblock1847
.label ForLoop_Test7_eblock1846
	; LineNumber: 84
	call Common_FAIL
.label ForLoop_Test7_edblock1847
	; LineNumber: 86
	return
.label end_procedure_ForLoop_Test7
	
; // to value
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Test8
	;    Procedure type : User-defined procedure
	; LineNumber: 93
.label ForLoop_Test8
	; LineNumber: 94
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_Test8_stringassigncpy1854
	load 	ForLoop_Test8_stringassignstr1853 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_Test8_stringassigncpy1854
	; LineNumber: 95
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 96
	mov 	Vars_v3 	uint8:0x03
	; LineNumber: 98
	mov 	Vars_p1 	uint16:0x8800
	; LineNumber: 103
	store Vars_p1 Vars_v3 uint8:0x14
	; LineNumber: 108
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test8_forloop1855
	; LineNumber: 105
	; LineNumber: 106
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 107
.label ForLoop_Test8_loopstart1856
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x02
	mov 	Vars_v1 	_r8_1
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	Vars_v3 	_r8_1
	jneq 	Vars_v1 	_r8_1 	ForLoop_Test8_forloop1855
.label ForLoop_Test8_loopdone1860 ;keep
.label ForLoop_Test8_loopend1857
	; LineNumber: 108
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x0a 	ForLoop_Test8_eblock1863
.label ForLoop_Test8_ctb1862 ;Main true block ;keep 
	; LineNumber: 107
	call Common_PASS
	jump ForLoop_Test8_edblock1864
.label ForLoop_Test8_eblock1863
	; LineNumber: 107
	call Common_FAIL
.label ForLoop_Test8_edblock1864
	; LineNumber: 109
	return
.label end_procedure_ForLoop_Test8
	
; // test break
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_TestBreak
	;    Procedure type : User-defined procedure
	; LineNumber: 115
.label ForLoop_TestBreak
	; LineNumber: 116
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_TestBreak_stringassigncpy1871
	load 	ForLoop_TestBreak_stringassignstr1870 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_TestBreak_stringassigncpy1871
	; LineNumber: 117
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 123
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_TestBreak_forloop1872
	; LineNumber: 119
	; LineNumber: 120
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x05 	ForLoop_TestBreak_edblock1886
.label ForLoop_TestBreak_ctb1884 ;Main true block ;keep 
	; LineNumber: 119
	jump ForLoop_TestBreak_loopend1874
.label ForLoop_TestBreak_edblock1886
	; LineNumber: 121
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 122
.label ForLoop_TestBreak_loopstart1873
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_TestBreak_forloop1872
.label ForLoop_TestBreak_loopdone1888 ;keep
.label ForLoop_TestBreak_loopend1874
	; LineNumber: 123
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x05 	ForLoop_TestBreak_eblock1891
.label ForLoop_TestBreak_ctb1890 ;Main true block ;keep 
	; LineNumber: 122
	call Common_PASS
	jump ForLoop_TestBreak_edblock1892
.label ForLoop_TestBreak_eblock1891
	; LineNumber: 122
	call Common_FAIL
.label ForLoop_TestBreak_edblock1892
	; LineNumber: 124
	return
.label end_procedure_ForLoop_TestBreak
	
; // test break
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_TestContinue
	;    Procedure type : User-defined procedure
	; LineNumber: 128
.label ForLoop_TestContinue
	; LineNumber: 129
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_TestContinue_stringassigncpy1899
	load 	ForLoop_TestContinue_stringassignstr1898 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_TestContinue_stringassigncpy1899
	; LineNumber: 130
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 138
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_TestContinue_forloop1900
	; LineNumber: 132
	; LineNumber: 133
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	uint8:0x05 	ForLoop_TestContinue_edblock1914
.label ForLoop_TestContinue_ctb1912 ;Main true block ;keep 
	; LineNumber: 133
	jump ForLoop_TestContinue_loopstart1901
.label ForLoop_TestContinue_edblock1914
	; LineNumber: 136
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 137
.label ForLoop_TestContinue_loopstart1901
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_TestContinue_forloop1900
.label ForLoop_TestContinue_loopdone1916 ;keep
.label ForLoop_TestContinue_loopend1902
	; LineNumber: 138
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x05 	ForLoop_TestContinue_eblock1919
.label ForLoop_TestContinue_ctb1918 ;Main true block ;keep 
	; LineNumber: 137
	call Common_PASS
	jump ForLoop_TestContinue_edblock1920
.label ForLoop_TestContinue_eblock1919
	; LineNumber: 137
	call Common_FAIL
.label ForLoop_TestContinue_edblock1920
	; LineNumber: 139
	return
.label end_procedure_ForLoop_TestContinue
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_NegativeStep1
	;    Procedure type : User-defined procedure
	; LineNumber: 142
.label ForLoop_NegativeStep1
	; LineNumber: 143
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_NegativeStep1_stringassigncpy1927
	load 	ForLoop_NegativeStep1_stringassignstr1926 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_NegativeStep1_stringassigncpy1927
	; LineNumber: 147
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep1_forloop1928
	; LineNumber: 145
	; LineNumber: 146
.label ForLoop_NegativeStep1_loopstart1929
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep1_forloop1928
.label ForLoop_NegativeStep1_loopdone1933 ;keep
.label ForLoop_NegativeStep1_loopend1930
	; LineNumber: 147
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep1_eblock1936
.label ForLoop_NegativeStep1_ctb1935 ;Main true block ;keep 
	; LineNumber: 146
	call Common_PASS
	jump ForLoop_NegativeStep1_edblock1937
.label ForLoop_NegativeStep1_eblock1936
	; LineNumber: 146
	call Common_FAIL
.label ForLoop_NegativeStep1_edblock1937
	; LineNumber: 148
	return
.label end_procedure_ForLoop_NegativeStep1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_NegativeStep2
	;    Procedure type : User-defined procedure
	; LineNumber: 152
.label ForLoop_NegativeStep2
	; LineNumber: 153
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_NegativeStep2_stringassigncpy1944
	load 	ForLoop_NegativeStep2_stringassignstr1943 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_NegativeStep2_stringassigncpy1944
	; LineNumber: 157
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep2_forloop1945
	; LineNumber: 155
	; LineNumber: 156
.label ForLoop_NegativeStep2_loopstart1946
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint16:0x100 	ForLoop_NegativeStep2_forloop1945
.label ForLoop_NegativeStep2_loopdone1950 ;keep
.label ForLoop_NegativeStep2_loopend1947
	; LineNumber: 157
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep2_eblock1953
.label ForLoop_NegativeStep2_ctb1952 ;Main true block ;keep 
	; LineNumber: 156
	call Common_PASS
	jump ForLoop_NegativeStep2_edblock1954
.label ForLoop_NegativeStep2_eblock1953
	; LineNumber: 156
	call Common_FAIL
.label ForLoop_NegativeStep2_edblock1954
	; LineNumber: 158
	return
.label end_procedure_ForLoop_NegativeStep2
	
; // negative to 0 is problematic
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_NegativeStep3
	;    Procedure type : User-defined procedure
	; LineNumber: 162
.label ForLoop_NegativeStep3
	; LineNumber: 163
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label ForLoop_NegativeStep3_stringassigncpy1961
	load 	ForLoop_NegativeStep3_stringassignstr1960 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_nada 	uint8:0x00 	ForLoop_NegativeStep3_stringassigncpy1961
	; LineNumber: 167
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep3_forloop1962
	; LineNumber: 165
	; LineNumber: 166
.label ForLoop_NegativeStep3_loopstart1963
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xfe 	ForLoop_NegativeStep3_forloop1962
.label ForLoop_NegativeStep3_loopdone1967 ;keep
.label ForLoop_NegativeStep3_loopend1964
	; LineNumber: 167
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xfe 	ForLoop_NegativeStep3_eblock1970
.label ForLoop_NegativeStep3_ctb1969 ;Main true block ;keep 
	; LineNumber: 166
	call Common_PASS
	jump ForLoop_NegativeStep3_edblock1971
.label ForLoop_NegativeStep3_eblock1970
	; LineNumber: 166
	call Common_FAIL
.label ForLoop_NegativeStep3_edblock1971
	; LineNumber: 168
	return
.label end_procedure_ForLoop_NegativeStep3
	
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ForLoop_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 174
.label ForLoop_Exec
	; LineNumber: 175
	; Assigning a string : Common_zp
	mov 	Common_zp 	#ForLoop_Exec_stringassignstr1977
	call Common_Initialise
	; LineNumber: 179
	call ForLoop_NegativeStep1
	; LineNumber: 181
	call ForLoop_NegativeStep2
	; LineNumber: 182
	call ForLoop_NegativeStep3
	; LineNumber: 184
	call ForLoop_Test1
	; LineNumber: 186
	call ForLoop_Test2
	; LineNumber: 188
	call ForLoop_Test3
	; LineNumber: 190
	call ForLoop_Test4
	; LineNumber: 192
	call ForLoop_Test5
	; LineNumber: 193
	call ForLoop_Test6
	; LineNumber: 194
	call ForLoop_Test7
	; LineNumber: 197
	call ForLoop_Test8
	; LineNumber: 201
	call ForLoop_TestBreak
	; LineNumber: 202
	call ForLoop_TestContinue
	; LineNumber: 203
	call Common_WaitABit
	; LineNumber: 204
	return
.label end_procedure_ForLoop_Exec
	
; //@if SUPPORTS_CLASSES = 1
; //@endif
; //@use "unittests/registers"
; //@ifndef CPU_PCHIP8
; //@endif
; //@use "unittests/long"
; //
; //	allTests: array[] of integer = (#AdvancedTests);
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Unittests_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 37
.label Unittests_Exec
	; LineNumber: 38
	mov 	Unittests_currentTest 	uint8:0x00
	; LineNumber: 39
	mov 	Unittests_isDone 	uint8:0x00
	; LineNumber: 40
	call Common_TestInit
	; LineNumber: 42
.label Unittests_Exec_while1979
.label Unittests_Exec_loopstart1983
	; Binary clause Simplified: EQUALS
	call Common_Status
	jneq 	Common_Status_fret 	uint8:0x00 	Unittests_Exec_localfailed2058
.label Unittests_Exec_localsuccess2059 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_isDone 	uint8:0x00 	Unittests_Exec_localfailed2058
	jump Unittests_Exec_ctb1980
.label Unittests_Exec_localfailed2058
	jump Unittests_Exec_edblock1982
.label Unittests_Exec_ctb1980 ;Main true block ;keep 
	; LineNumber: 48
	; LineNumber: 49
	; Binary clause Simplified: EQUALS
	; push
	load 	$8000 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0x00 	Unittests_Exec_edblock2064
.label Unittests_Exec_ctb2062 ;Main true block ;keep 
	; LineNumber: 49
	call Common_TestSuiteInit
.label Unittests_Exec_edblock2064
	; LineNumber: 52
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x01 	Unittests_Exec_edblock2069
.label Unittests_Exec_ctb2067 ;Main true block ;keep 
	; LineNumber: 51
	call ForLoop_Exec
.label Unittests_Exec_edblock2069
	; LineNumber: 53
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x09 	Unittests_Exec_edblock2074
.label Unittests_Exec_ctb2072 ;Main true block ;keep 
	; LineNumber: 52
	call IfThenElse_Exec
.label Unittests_Exec_edblock2074
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x06 	Unittests_Exec_edblock2079
.label Unittests_Exec_ctb2077 ;Main true block ;keep 
	; LineNumber: 53
	call MulDiv_Exec
.label Unittests_Exec_edblock2079
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0a 	Unittests_Exec_edblock2084
.label Unittests_Exec_ctb2082 ;Main true block ;keep 
	; LineNumber: 54
	call IntegerTest_Exec
.label Unittests_Exec_edblock2084
	; LineNumber: 56
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x02 	Unittests_Exec_edblock2089
.label Unittests_Exec_ctb2087 ;Main true block ;keep 
	; LineNumber: 55
	call Various_Exec
.label Unittests_Exec_edblock2089
	; LineNumber: 57
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x03 	Unittests_Exec_edblock2094
.label Unittests_Exec_ctb2092 ;Main true block ;keep 
	; LineNumber: 56
	call Strings_Exec
.label Unittests_Exec_edblock2094
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x04 	Unittests_Exec_edblock2099
.label Unittests_Exec_ctb2097 ;Main true block ;keep 
	; LineNumber: 57
	call CaseTest_Exec
.label Unittests_Exec_edblock2099
	; LineNumber: 59
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0b 	Unittests_Exec_edblock2104
.label Unittests_Exec_ctb2102 ;Main true block ;keep 
	; LineNumber: 58
	call Functions_Exec
.label Unittests_Exec_edblock2104
	; LineNumber: 60
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x08 	Unittests_Exec_edblock2109
.label Unittests_Exec_ctb2107 ;Main true block ;keep 
	; LineNumber: 59
	call BitOp_Exec
.label Unittests_Exec_edblock2109
	; LineNumber: 61
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0d 	Unittests_Exec_edblock2114
.label Unittests_Exec_ctb2112 ;Main true block ;keep 
	; LineNumber: 60
	call AdvancedMath_Exec
.label Unittests_Exec_edblock2114
	; LineNumber: 85
	
; //		if (currentTest=12) then BooleanTest::Exec();
; //		if (currentTest=14) then Classes::Exec();
; //	if (currentTest=5) then Casts::Exec();
; //	if (currentTest=7) then Registers::Exec();		
; //		
; //		if (currentTest=5) then Casts::Exec();
; //		if (currentTest=7) then Registers::Exec();
; //	if (currentTest=8) then BitOp::Exec();
; //@ifndef CPU_PCHIP8
; //		if (currentTest=11) then Various::Exec();
; //@endif
; //@ifndef CPU_M68000
; //	if
; //		if (currentTest=0) then LongTest::Exec();
; //		
; //@if SUPPORTS_CLASSES = 1
; //		if (currentTest=14) then Classes::Exec();
; //@endif
; //
	; push
	add  	_r8_1 	Unittests_currentTest 	uint8:0x01
	mov 	Unittests_currentTest 	_r8_1
	; LineNumber: 86
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Unittests_currentTest 	uint8:0x0f 	Unittests_Exec_edblock2119
.label Unittests_Exec_ctb2117 ;Main true block ;keep 
	; LineNumber: 86
	mov 	Unittests_isDone 	uint8:0x01
.label Unittests_Exec_edblock2119
	; LineNumber: 89
	jump Unittests_Exec_while1979
.label Unittests_Exec_edblock1982
.label Unittests_Exec_loopend1984
	; LineNumber: 90
	return
.label end_procedure_Unittests_Exec
.gcode
.label block1
.label main_block_begin_
	; LineNumber: 8
	
; //9971
	.asm
	; Disable interrupts
	ldy #$7f    ; $7f = %01111111
	sty $dc0d   ; Turn off CIAs Timer interrupts ;keep
	sty $dd0d   ; Turn off CIAs Timer interrupts ;keep
	lda $dc0d   ; cancel all CIA-IRQs in queue/unprocessed ;keep
	lda $dd0d   ; cancel all CIA-IRQs in queue/unprocessed ;keep
	.endasm
	; LineNumber: 9
	.asm
	sei
	.endasm
	; LineNumber: 10
	.asm
	; Set Memory Config
	lda $01
	and #%11111000
	ora #%101
	sta $01
	.endasm
	; LineNumber: 11
	call Unittests_Exec
	; LineNumber: 16
	.asm
	; MoveTo optimization
	lda #$c5
	sta screenmemory
	lda #$07
	sta screenmemory+1
	.endasm
	; LineNumber: 17
	; Binary clause Simplified: EQUALS
	; push
	load 	$8000 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0x00 	MainProgram_eblock2123
.label MainProgram_ctb2122 ;Main true block ;keep 
	; LineNumber: 17
	.asm
printstring_call2132
	clc
	lda #<printstring_text2133
	adc #$0
	ldy #>printstring_text2133
	sta print_text+0
	sty print_text+1
	lda #$28
	tax
	jsr printstring
	.endasm
	jump MainProgram_edblock2124
.label MainProgram_eblock2123
	; LineNumber: 19
	.asm
printstring_call2135
	clc
	lda #<printstring_text2136
	adc #$0
	ldy #>printstring_text2136
	sta print_text+0
	sty print_text+1
	lda #$28
	tax
	jsr printstring
	.endasm
.label MainProgram_edblock2124
	; LineNumber: 21
	.asm
 brk 
	.endasm
	; LineNumber: 22
	.asm
	jmp * ; loop like (�/%
	.endasm
	; LineNumber: 24
.label main_block_end_
	; End of program
	; Ending memory block at $810
decl 	_r16_1 	uint16:0
decl 	Vars_IntegerReturn_fret 	uint16:0
decl 	Common_Status_fret 	uint8:0
decl 	_r8_1 	uint8:0
decl 	_r8_2 	uint8:0
decl 	_r16_2 	uint16:0
decl 	_r16_3 	uint16:0
decl 	_r16_4 	uint16:0
decl 	_r16_5 	uint16:0
decl 	_r8_3 	uint8:0
decl 	_rp8_1 	ptr8:0
decl 	Functions_FnByte_fret 	uint8:0
decl 	Functions_FnByteAdv_fret 	uint8:0
decl 	Functions_FnByteInt_fret 	uint8:0
decl 	Functions_FnInt1_fret 	uint16:0
decl 	Functions_FnInt2_fret 	uint16:0
decl 	Functions_FnInt3_fret 	uint16:0
decl 	AdvancedMath_factorial_fret 	uint8:0
	decl	screenmemory	 ptr8:$fe
	decl	colormemory	 ptr8:$fc
  decl  IntegerTest_T01_stringassignstr29  uint8:$30
  .uint8 $31 $3a 0
  decl  IntegerTest_T02_stringassignstr40  uint8:$30
  .uint8 $32 $3a 0
  decl  IntegerTest_T03_stringassignstr51  uint8:$30
  .uint8 $33 $3a 0
  decl  IntegerTest_T04_stringassignstr62  uint8:$30
  .uint8 $34 $3a 0
  decl  IntegerTest_T05_stringassignstr73  uint8:$30
  .uint8 $35 $3a 0
  decl  IntegerTest_T06_stringassignstr84  uint8:$30
  .uint8 $36 $3a 0
  decl  IntegerTest_T066_stringassignstr95  uint8:$30
  .uint8 $37 $3a 0
  decl  IntegerTest_T07_stringassignstr106  uint8:$30
  .uint8 $38 $3a 0
  decl  IntegerTest_T08_stringassignstr117  uint8:$30
  .uint8 $39 $3a 0
  decl  IntegerTest_T09_stringassignstr128  uint8:$31
  .uint8 $30 $3a 0
  decl  IntegerTest_T10_stringassignstr139  uint8:$31
  .uint8 $31 $3a 0
  decl  IntegerTest_T11_stringassignstr150  uint8:$31
  .uint8 $32 $3a 0
  decl  IntegerTest_T12_stringassignstr161  uint8:$31
  .uint8 $33 $3a 0
  decl  IntegerTest_TMIX1_stringassignstr172  uint8:$31
  .uint8 $34 $3a 0
  decl  IntegerTest_T15_stringassignstr183  uint8:$31
  .uint8 $35 $3a 0
  decl  IntegerTest_T16_stringassignstr194  uint8:$31
  .uint8 $35 $3a 0
  decl  IntegerTest_Exec_stringassignstr205  uint8:$49
  .uint8 $4e $54 $45 $47 $45 $52 $20
  .uint8 $54 $45 $53 $54 $53 0
  decl  IfThenElse_GT1_GreaterThan_True_stringassignstr207  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_GT2_GreaterThan_False_stringassignstr218  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_GT3_GreaterThan_False_stringassignstr229  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_GT4_GreaterThan_False_stringassignstr240  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_GT5_GreaterThan_True_stringassignstr251  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_GTE1_GreaterEqual_True_stringassignstr262  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_GTE2_GreaterThan_False_stringassignstr273  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_GTE3_GreaterThan_True_stringassignstr284  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_GTE4_GreaterThan_False_stringassignstr295  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_GTE5_GreaterThan_True_stringassignstr306  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_LT1_LessThan_True_stringassignstr317  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LT2_LessThan_False_stringassignstr328  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_LT3_LessThan_False_stringassignstr339  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_LT4_LessThan_True_stringassignstr350  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_LT5_LessThan_False_stringassignstr361  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_LTE1_LessEqual_True_stringassignstr372  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LTE1_LessEqual_True2_stringassignstr383  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LTE2_LessThan_False_stringassignstr394  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_LTE3_LessThan_True_stringassignstr405  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_LTE4_LessThan_True_stringassignstr416  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_LTE5_LessThan_False_stringassignstr427  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_EQ1_EqualTo_True_stringassignstr438  uint8:$20
  .uint8 $20 $20 $45 $51 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_EQ2_EqualTo_False_stringassignstr449  uint8:$20
  .uint8 $20 $20 $45 $51 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_NEQ1_NotEqualTo_True_stringassignstr460  uint8:$20
  .uint8 $20 $4e $45 $51 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_NEQ2_NotEqualTo_False_stringassignstr471  uint8:$20
  .uint8 $20 $4e $45 $51 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_Advanced1_stringassignstr482  uint8:$20
  .uint8 $20 $41 $44 $56 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_Advanced2_stringassignstr494  uint8:$20
  .uint8 $20 $41 $44 $56 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGT1_GreaterThan_True_stringassignstr507  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_IGT2_GreaterThan_False_stringassignstr518  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGT3_GreaterThan_False_stringassignstr529  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_IGT4_GreaterThan_False_stringassignstr540  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_IGT5_GreaterThan_True_stringassignstr551  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_IGTE1_GreaterEqual_True_stringassignstr562  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_IGTE2_GreaterThan_False_stringassignstr573  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGTE3_GreaterThan_True_stringassignstr584  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_IGTE4_GreaterThan_False_stringassignstr595  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_IGTE5_GreaterThan_True_stringassignstr606  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_ILT1_GreaterThan_True_stringassignstr617  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_ILT2_GreaterThan_False_stringassignstr628  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_ILT3_GreaterThan_False_stringassignstr639  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_ILT4_GreaterThan_False_stringassignstr650  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_ILT5_GreaterThan_True_stringassignstr661  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_ILTE1_GreaterEqual_True_stringassignstr672  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_ILTE2_GreaterThan_False_stringassignstr683  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_ILTE3_GreaterThan_True_stringassignstr694  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_ILTE4_GreaterThan_False_stringassignstr705  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_ILTE5_GreaterThan_True_stringassignstr716  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI1_stringassignstr727  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI2_stringassignstr739  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI3_stringassignstr751  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI4_stringassignstr764  uint8:$20
  .uint8 $20 $20 $41 $49 $34 $3a 0
  decl  IfThenElse_AdvancedI5_stringassignstr776  uint8:$20
  .uint8 $20 $20 $41 $49 $35 $3a 0
  decl  IfThenElse_Exec_stringassignstr788  uint8:$49
  .uint8 $46 $20 $54 $45 $53 $54 $53
  .uint8 0
  decl  MulDiv_ByteMulByte01_stringassignstr790  uint8:$30
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePow202_stringassignstr801  uint8:$30
  .uint8 $32 $3a 0
  decl  MulDiv_ByteDivBytePow203_stringassignstr812  uint8:$30
  .uint8 $33 $3a 0
  decl  MulDiv_ByteDivByte04_stringassignstr823  uint8:$30
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulMul05_stringassignstr834  uint8:$30
  .uint8 $35 $3a 0
  decl  MulDiv_IntByteMul06_stringassignstr845  uint8:$30
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulPow07_stringassignstr856  uint8:$30
  .uint8 $37 $3a 0
  decl  MulDiv_IntDivByte08_stringassignstr867  uint8:$30
  .uint8 $38 $3a 0
  decl  MulDiv_IntDivInt09_stringassignstr878  uint8:$30
  .uint8 $39 $3a 0
  decl  MulDiv_IntDivPow210_stringassignstr889  uint8:$31
  .uint8 $30 $3a 0
  decl  MulDiv_IntDivMix11_stringassignstr900  uint8:$31
  .uint8 $31 $3a 0
  decl  MulDiv_IntDivMix12_stringassignstr911  uint8:$31
  .uint8 $32 $3a 0
  decl  MulDiv_IntMulMix13_stringassignstr922  uint8:$31
  .uint8 $33 $3a 0
  decl  MulDiv_IntMulInt14_stringassignstr933  uint8:$31
  .uint8 $34 $3a 0
  decl  MulDiv_IntMulAdvancedMix15_stringassignstr944  uint8:$31
  .uint8 $35 $3a 0
  decl  MulDiv_ByteMulAdvanced16_stringassignstr955  uint8:$31
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulConst17_stringassignstr966  uint8:$31
  .uint8 $37 $3a 0
  decl  MulDiv_IntCombConst18_stringassignstr977  uint8:$31
  .uint8 $38 $3a 0
  decl  MulDiv_IntCombConst19_stringassignstr988  uint8:$31
  .uint8 $39 $3a 0
  decl  MulDiv_IntShift20_stringassignstr999  uint8:$32
  .uint8 $30 $3a 0
  decl  MulDiv_IntShift21_stringassignstr1010  uint8:$32
  .uint8 $31 $3a 0
  decl  MulDiv_Array1_stringassignstr1021  uint8:$41
  .uint8 $31 $3a 0
  decl  MulDiv_Shift0_stringassignstr1032  uint8:$53
  .uint8 $31 $3a 0
  decl  MulDiv_Shift1_stringassignstr1043  uint8:$53
  .uint8 $32 $3a 0
  decl  MulDiv_Shift2_stringassignstr1054  uint8:$53
  .uint8 $33 $3a 0
  decl  MulDiv_Shift4_stringassignstr1065  uint8:$53
  .uint8 $34 $3a 0
  decl  MulDiv_Shift5_stringassignstr1076  uint8:$53
  .uint8 $35 $3a 0
  decl  MulDiv_Shift6_stringassignstr1087  uint8:$53
  .uint8 $36 $3a 0
  decl  MulDiv_IntByteMulR1_stringassignstr1098  uint8:$52
  .uint8 $31 $3a 0
  decl  MulDiv_IntByteMulR2_stringassignstr1109  uint8:$52
  .uint8 $32 $3a 0
  decl  MulDiv_IntByteMulR3_stringassignstr1120  uint8:$52
  .uint8 $33 $3a 0
  decl  MulDiv_IntByteMulR4_stringassignstr1131  uint8:$52
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulBytePlus01_stringassignstr1142  uint8:$42
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePlus02_stringassignstr1153  uint8:$42
  .uint8 $32 $3a 0
  decl  MulDiv_Exec_stringassignstr1164  uint8:$4d
  .uint8 $55 $4c $44 $49 $56 $20 $54
  .uint8 $45 $53 $54 $53 0
  decl  Various_Test1_stringassignstr1166  uint8:$50
  .uint8 $50 $3a 0
  decl  Various_LoHi1_stringassignstr1177  uint8:$54
  .uint8 $32 $3a 0
  decl  Various_LoHi2_stringassignstr1189  uint8:$54
  .uint8 $33 $3a 0
  decl  Various_TestAddress1_stringassignstr1201  uint8:$41
  .uint8 $31 $3a 0
  decl  Various_TestAddress2_stringassignstr1212  uint8:$41
  .uint8 $32 $3a 0
  decl  Various_TestAddress3_stringassignstr1223  uint8:$41
  .uint8 $33 $3a 0
  decl  Various_UnaryByte_stringassignstr1234  uint8:$55
  .uint8 $31 $3a 0
  decl  Various_UnaryInteger1_stringassignstr1245  uint8:$55
  .uint8 $32 $3a 0
  decl  Various_UnaryInteger2_stringassignstr1256  uint8:$55
  .uint8 $33 $3a 0
  decl  Various_UnaryInteger3_stringassignstr1267  uint8:$55
  .uint8 $34 $3a 0
  decl  Various_Exec_stringassignstr1278  uint8:$56
  .uint8 $41 $52 $49 $4f $55 $53 0
  decl  Strings_Test1_stringassignstr1280  uint8:$54
  .uint8 $31 $3a 0
  decl  Strings_Test2_stringassignstr1291  uint8:$54
  .uint8 $32 $3a 0
  decl  Strings_Test3_stringassignstr1302  uint8:$54
  .uint8 $33 $3a 0
  decl  Strings_TestLst1_stringassignstr1313  uint8:$54
  .uint8 $34 $3a 0
  decl  Strings_TestLst2_stringassignstr1324  uint8:$54
  .uint8 $35 $3a 0
  decl  Strings_TestLst3_stringassignstr1335  uint8:$54
  .uint8 $36 $3a 0
  decl  Strings_TestLst3_stringassignstr1337  uint8:$44
  .uint8 $45 0
  decl  Strings_TestLst4_stringassignstr1348  uint8:$54
  .uint8 $37 $3a 0
  decl  Strings_TestLst4_stringassignstr1350  uint8:$4d
  .uint8 $59 0
  decl  Strings_Exec_stringassignstr1360  uint8:$53
  .uint8 $54 $52 $49 $4e $47 $53 0
  decl  CaseTest_Test1_stringassignstr1369  uint8:$54
  .uint8 $31 $3a 0
  decl  CaseTest_Test2_stringassignstr1387  uint8:$54
  .uint8 $32 $3a 0
  decl  _temp_var_case4e5b  uint8:0
  decl  CaseTest_Test3_stringassignstr1405  uint8:$54
  .uint8 $33 $3a 0
  decl  CaseTest_Exec_stringassignstr1416  uint8:$43
  .uint8 $41 $53 $45 0
  decl  Functions_Test1_stringassignstr1424  uint8:$54
  .uint8 $31 $3a 0
  decl  Functions_Test2_stringassignstr1435  uint8:$54
  .uint8 $32 $3a 0
  decl  Functions_Test3_stringassignstr1446  uint8:$54
  .uint8 $33 $3a 0
  decl  Functions_Test4_stringassignstr1457  uint8:$54
  .uint8 $34 $3a 0
  decl  Functions_Test5_stringassignstr1468  uint8:$54
  .uint8 $35 $3a 0
  decl  Functions_Test6_stringassignstr1479  uint8:$54
  .uint8 $36 $3a 0
  decl  Functions_Exec_stringassignstr1490  uint8:$46
  .uint8 $55 $4e $43 $54 $49 $4f $4e
  .uint8 $53 0
  decl  BitOp_Test1_stringassignstr1492  uint8:$54
  .uint8 $31 $3a 0
  decl  BitOp_Test2_stringassignstr1504  uint8:$54
  .uint8 $32 $3a 0
  decl  BitOp_Test3_stringassignstr1516  uint8:$54
  .uint8 $33 0
  decl  BitOp_Test4_stringassignstr1528  uint8:$54
  .uint8 $34 0
  decl  BitOp_Test5_stringassignstr1540  uint8:$54
  .uint8 $35 $3a 0
  decl  BitOp_Test6_stringassignstr1552  uint8:$54
  .uint8 $36 $3a 0
  decl  BitOp_Test7_stringassignstr1564  uint8:$54
  .uint8 $37 $3a 0
  decl  BitOp_Test8_stringassignstr1576  uint8:$54
  .uint8 $38 $3a 0
  decl  BitOp_Test9_stringassignstr1588  uint8:$54
  .uint8 $39 $3a 0
  decl  BitOp_Test10_stringassignstr1600  uint8:$54
  .uint8 $31 $30 $3a 0
  decl  BitOp_Test11_stringassignstr1612  uint8:$54
  .uint8 $58 $3a 0
  decl  BitOp_Exec_stringassignstr1624  uint8:$42
  .uint8 $49 $54 $4f $50 0
  decl  AdvancedMath_Advanced01_stringassignstr1626  uint8:$30
  .uint8 $31 $3a 0
  decl  AdvancedMath_Advanced02_stringassignstr1637  uint8:$30
  .uint8 $32 $3a 0
  decl  AdvancedMath_Advanced03_stringassignstr1648  uint8:$30
  .uint8 $33 $3a 0
  decl  AdvancedMath_Advanced04_stringassignstr1659  uint8:$30
  .uint8 $34 $3a 0
  decl  AdvancedMath_Advanced05_stringassignstr1670  uint8:$30
  .uint8 $35 $3a 0
  decl  AdvancedMath_Advanced06_stringassignstr1681  uint8:$30
  .uint8 $36 $3a 0
  decl  AdvancedMath_Advanced07_stringassignstr1692  uint8:$30
  .uint8 $37 $3a 0
  decl  AdvancedMath_Advanced08_stringassignstr1703  uint8:$30
  .uint8 $38 $3a 0
  decl  AdvancedMath_MulDivCombo1_stringassignstr1721  uint8:$4d
  .uint8 $31 $3a 0
  decl  AdvancedMath_Exec_stringassignstr1732  uint8:$41
  .uint8 $44 $56 $41 $4e $43 $45 $44
  .uint8 $20 $54 $45 $53 $54 $53 0
  decl  ForLoop_Test1_stringassignstr1734  uint8:$54
  .uint8 $31 $3a 0
  decl  ForLoop_Test2_stringassignstr1751  uint8:$54
  .uint8 $32 $3a 0
  decl  ForLoop_Test3_stringassignstr1768  uint8:$54
  .uint8 $33 $3a 0
  decl  ForLoop_Test4_stringassignstr1785  uint8:$54
  .uint8 $34 $3a 0
  decl  ForLoop_Test5_stringassignstr1802  uint8:$54
  .uint8 $35 $3a 0
  decl  ForLoop_Test6_stringassignstr1819  uint8:$54
  .uint8 $35 $3a 0
  decl  ForLoop_Test7_stringassignstr1836  uint8:$54
  .uint8 $36 $3a 0
  decl  ForLoop_Test8_stringassignstr1853  uint8:$54
  .uint8 $37 $3a 0
  decl  ForLoop_TestBreak_stringassignstr1870  uint8:$54
  .uint8 $42 $3a 0
  decl  ForLoop_TestContinue_stringassignstr1898  uint8:$54
  .uint8 $43 $3a 0
  decl  ForLoop_NegativeStep1_stringassignstr1926  uint8:$4e
  .uint8 $31 $3a 0
  decl  ForLoop_NegativeStep2_stringassignstr1943  uint8:$4e
  .uint8 $32 $3a 0
  decl  ForLoop_NegativeStep3_stringassignstr1960  uint8:$4e
  .uint8 $33 $3a 0
  decl  ForLoop_Exec_stringassignstr1977  uint8:$46
  .uint8 $4f $52 $20 $4c $4f $4f $50
  .uint8 0
  decl  printstring_text2133	  uint8:$43
  .uint8 $4f $4d $50 $4c $45 $54 $45
  .uint8 $20 $41 $4e $44 $20 $55 $54 $54
  .uint8 $45 $52 $20 $53 $55 $43 $43 $45
  .uint8 $53 $53 $21 0
  decl  printstring_text2136	  uint8:$54
  .uint8 $4f $54 $41 $4c $20 $46 $41
  .uint8 $49 $4c $55 $52 $45 $21 0
.label EndBlock810

