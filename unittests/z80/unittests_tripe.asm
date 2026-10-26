.processor  Z80
	.code uint16:0x4000 name
.label StartBlock4000
	; Starting new memory block at $4000
.label UnitTestsAmstradCPC
	; LineNumber: 25
	jump block1
	; LineNumber: 3
  decl  Format_i  uint16:0
	; LineNumber: 5
	decl 	Format_s 	ptr8:0
	; LineNumber: 8
	decl 	Text_p 	ptr8:0
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
	; LineNumber: 10
	decl 	Vars_ip 	ptr16:0
	; LineNumber: 11
  decl  Vars_a1  uint16:0
  .uint16 0 0 0 0 0 0 0
  .uint16 0 0
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
  decl  Vars_strLst  uint16:tmp_898537_string0
  .uint16 tmp_575198_string1 tmp_594324_string2 tmp_798315_string3
	; LineNumber: 39
  decl  tmp_898537_string0  uint8:$53
  .uint8 $31 0
	; LineNumber: 39
  decl  tmp_575198_string1  uint8:$53
  .uint8 $32 0
	; LineNumber: 39
  decl  tmp_594324_string2  uint8:$4a
  .uint8 75 0
	; LineNumber: 39
  decl  tmp_798315_string3  uint8:$53
  .uint8 $33 0
	; LineNumber: 51
	decl 	Vars_Mini_this 	ptr8:0
	; LineNumber: 65
	decl 	Vars_Point_this 	ptr8:0
	; LineNumber: 86
	decl 	Vars_Monster_this 	ptr8:0
	; LineNumber: 6
  decl  Common_cpc_unittests_common_string  uint8:0
  .uint8 0 0 0 0 0 0 0
  .uint8 0
	; LineNumber: 7
  decl  Common_cpc_unittests_status  uint8:$00
	; LineNumber: 18
	decl 	Classes_StrItem_this 	ptr8:0
	; LineNumber: 51
	decl 	Classes_StringList_this 	ptr8:0
	; LineNumber: 3
  decl  Strings_teststr1  uint8:$48
  .uint8 $45 $49 $53 $41 $4e $4e 0
	; LineNumber: 3
  decl  Functions_fn1  uint8:0
	; LineNumber: 30
  decl  Unittests_currentTest  uint8:0
	; LineNumber: 31
  decl  Unittests_isDone  uint8:0
	;*
; //	Format the 16 bits unsigned integer i as a string in decimal and put the result in the buffer in s.
; //	You must plan for at least 6 chars in s. The resulting string is null-terminated.
; //	Returns the number of non-null bytes written (between 1 and 5).
; 

	; NodeProcedureDecl -1
	; ***********  Defining procedure : Format_Itos
	;    Procedure type : User-defined procedure
	; LineNumber: 61
	; LineNumber: 59
  decl  Format_itos_e  uint8:0
	; LineNumber: 60
  decl  Format_itos_l  uint8:0
.label Format_Itos_block2
.label Format_Itos
	; LineNumber: 62
	.asm
		ld hl, [Format_i]
		ld de, [Format_s]
		ld a, 0
		ld [Format_itos_e], a
		ld bc, -10000
		call	 format_itos_digit
		ld bc,-1000
		call format_itos_digit
		ld bc,-100
		call format_itos_digit
		ld c,-10
		call format_itos_digit
		ld a, 1
		ld [Format_itos_e], a
		ld c,-1
		call format_itos_digit
		; Null terminate the string
		ld a, 0
		ld (de), a
		; Substract the address of the 0 from the start of the string to get # of bytes written
		ld hl, [Format_s]
		ex de, hl
		sbc hl, de
		ld a, l
		ld [Format_itos_l], a		; The result necessarily fits on one byte
		jp format_itos_finished
format_itos_digit
		ld a,'0'-1
format_itos_inc
		inc a
		add hl, bc
		jr c, format_itos_inc
		sbc hl, bc
		; Do not skip 0 if they are not leading or if it's the last one
		ld ixh, a
		ld a, [Format_itos_e]
		cp 1
		ld a, ixh
		jp z, format_itos_do_not_skip
		; Do not print leading 0
		cp '0'
		jp z,format_itos_skip
		ld ixh, a
		ld a, 1
		ld [Format_itos_e], a
		ld a, ixh
format_itos_do_not_skip
		ld (de), a
		inc de
format_itos_skip
		ret
format_itos_finished
	
	.endasm
	; LineNumber: 117
	; LineNumber: 117
	; Setting function return value
	mov 	Format_Itos_fret 	Format_itos_l
	return
.label end_procedure_Format_Itos
	
; // Prints the string pointed to by p at the current cursor position.
; // Control chars are obeyed, not printed.
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Text_Print
	;    Procedure type : User-defined procedure
	; LineNumber: 81
.label Text_Print_block3
.label Text_Print
	; LineNumber: 82
	.asm
      ld hl, [Text_p]
text_print_loop
      ld a, (hl)
      cp 0
      jr z, text_print_finished
      call #bb5a
      inc hl
      jp text_print_loop
text_print_finished
    
	.endasm
	; LineNumber: 93
	return
.label end_procedure_Text_Print
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Vars_IntegerReturn
	;    Procedure type : User-defined procedure
	; LineNumber: 102
	; LineNumber: 99
  decl  Vars_ir_p1  uint8:0
.label Vars_IntegerReturn_block4
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
.label Vars_ByteReturn_block5
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
	; LineNumber: 11
.label Common_TestInit
	; LineNumber: 12
	return
.label end_procedure_Common_TestInit
	
; // Called at the beginning of each test suite (multiple test cases grouped together)
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_TestSuiteInit
	;    Procedure type : User-defined procedure
	; LineNumber: 16
.label Common_TestSuiteInit
	; LineNumber: 17
	return
.label end_procedure_Common_TestSuiteInit
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_Initialise
	;    Procedure type : User-defined procedure
	; LineNumber: 30
	; LineNumber: 29
	decl 	Common_zp 	ptr8:0
.label Common_Initialise_block8
.label Common_Initialise
	; LineNumber: 31
	; Assigning a string : Text_p
	mov 	Text_p 	#Common_Initialise_stringassignstr9
	call Text_Print
	; LineNumber: 32
	mov 	Text_p 	Common_zp
	call Text_Print
	; LineNumber: 33
	; Assigning a string : Text_p
	mov 	Text_p 	#Common_Initialise_stringassignstr10
	call Text_Print
	; LineNumber: 34
	; Assigning a string : Text_p
	mov 	Text_p 	#Common_Initialise_stringassignstr11
	call Text_Print
	; LineNumber: 35
	return
.label end_procedure_Common_Initialise
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_Status
	;    Procedure type : User-defined procedure
	; LineNumber: 38
.label Common_Status
	; LineNumber: 40
	; LineNumber: 40
	; Setting function return value
	mov 	Common_Status_fret 	Common_cpc_unittests_status
	return
.label end_procedure_Common_Status
	
; // Print POSITIVE result of a test - ptext must be 8 characters or less
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_PASS
	;    Procedure type : User-defined procedure
	; LineNumber: 44
.label Common_PASS
	; LineNumber: 45
	mov 	Text_p 	#Vars_text
	call Text_Print
	; LineNumber: 46
	; Assigning a string : Text_p
	mov 	Text_p 	#Common_PASS_stringassignstr14
	call Text_Print
	; LineNumber: 47
	return
.label end_procedure_Common_PASS
	
; // Print NEGATIVE result of a test - ftext must be 8 characters or less
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_FAIL
	;    Procedure type : User-defined procedure
	; LineNumber: 51
.label Common_FAIL
	; LineNumber: 52
	mov 	Text_p 	#Vars_text
	call Text_Print
	; LineNumber: 53
	; Assigning a string : Text_p
	mov 	Text_p 	#Common_FAIL_stringassignstr16
	call Text_Print
	; LineNumber: 54
	mov 	Common_cpc_unittests_status 	uint8:0x01
	; LineNumber: 55
	store 	$c000 	uint8:0x00 	uint8:0x01
	; LineNumber: 56
	return
.label end_procedure_Common_FAIL
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_WaitABit
	;    Procedure type : User-defined procedure
	; LineNumber: 59
.label Common_WaitABit
	; LineNumber: 61
	return
.label end_procedure_Common_WaitABit
	
; //  for Vars::v1:=0 to 16 do for Vars::v2:=0 to 255 do asm("nop");
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Common_DebugValue
	;    Procedure type : User-defined procedure
	; LineNumber: 64
	; LineNumber: 63
  decl  Common_v  uint16:0
.label Common_DebugValue_block18
.label Common_DebugValue
	; LineNumber: 66
	
; // TODO(ColinPitrat): Print value to screen
	mov 	Format_i 	Common_v
	mov 	Format_s 	#Common_cpc_unittests_common_string
	call Format_Itos
	; LineNumber: 67
	mov 	Text_p 	#Common_cpc_unittests_common_string
	call Text_Print
	; LineNumber: 68
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
	jneq 	Vars_j 	uint8:0x04 	CaseTest_Test1_casenext21
	; LineNumber: 8
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test1_caseend20
.label CaseTest_Test1_casenext21
	jneq 	Vars_j 	uint8:0x0f 	CaseTest_Test1_casenext23
	; LineNumber: 9
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test1_caseend20
.label CaseTest_Test1_casenext23
	jneq 	Vars_j 	uint8:0x18 	CaseTest_Test1_casenext25
	; LineNumber: 10
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test1_casenext25
.label CaseTest_Test1_caseend20
	; LineNumber: 15
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test1_stringassigncpy28
	load 	CaseTest_Test1_stringassignstr27 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	CaseTest_Test1_stringassigncpy28
	; LineNumber: 16
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test1_eblock31
.label CaseTest_Test1_ctb30 ;Main true block ;keep 
	; LineNumber: 15
	call Common_PASS
	jump CaseTest_Test1_edblock32
.label CaseTest_Test1_eblock31
	; LineNumber: 15
	call Common_FAIL
.label CaseTest_Test1_edblock32
	; LineNumber: 17
	return
.label end_procedure_CaseTest_Test1
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
	mov 	_temp_var_casefb72 	_r8_1
	jneq 	_temp_var_casefb72 	uint8:0x04 	CaseTest_Test3_casenext39
	; LineNumber: 38
	mov 	Vars_i 	uint8:0x05
	jump CaseTest_Test3_caseend38
.label CaseTest_Test3_casenext39
	jneq 	_temp_var_casefb72 	uint8:0x2e 	CaseTest_Test3_casenext41
	; LineNumber: 39
	mov 	Vars_i 	uint8:0x0a
	jump CaseTest_Test3_caseend38
.label CaseTest_Test3_casenext41
	jneq 	_temp_var_casefb72 	uint8:0x18 	CaseTest_Test3_casenext43
	; LineNumber: 40
	mov 	Vars_i 	uint8:0x00
.label CaseTest_Test3_casenext43
.label CaseTest_Test3_caseend38
	; LineNumber: 44
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label CaseTest_Test3_stringassigncpy46
	load 	CaseTest_Test3_stringassignstr45 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	CaseTest_Test3_stringassigncpy46
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i 	uint8:0x0a 	CaseTest_Test3_eblock49
.label CaseTest_Test3_ctb48 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump CaseTest_Test3_edblock50
.label CaseTest_Test3_eblock49
	; LineNumber: 44
	call Common_FAIL
.label CaseTest_Test3_edblock50
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
	mov 	Common_zp 	#CaseTest_Exec_stringassignstr56
	call Common_Initialise
	; LineNumber: 56
	
; // Mul and div
	call CaseTest_Test1
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
.label AdvancedMath_Advanced01_stringassigncpy59
	load 	AdvancedMath_Advanced01_stringassignstr58 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced01_stringassigncpy59
	; LineNumber: 9
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x40a 	AdvancedMath_Advanced01_eblock62
.label AdvancedMath_Advanced01_ctb61 ;Main true block ;keep 
	; LineNumber: 8
	call Common_PASS
	jump AdvancedMath_Advanced01_edblock63
.label AdvancedMath_Advanced01_eblock62
	; LineNumber: 8
	call Common_FAIL
.label AdvancedMath_Advanced01_edblock63
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
.label AdvancedMath_Advanced02_stringassigncpy70
	load 	AdvancedMath_Advanced02_stringassignstr69 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced02_stringassigncpy70
	; LineNumber: 15
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x450 	AdvancedMath_Advanced02_eblock73
.label AdvancedMath_Advanced02_ctb72 ;Main true block ;keep 
	; LineNumber: 14
	call Common_PASS
	jump AdvancedMath_Advanced02_edblock74
.label AdvancedMath_Advanced02_eblock73
	; LineNumber: 14
	call Common_FAIL
.label AdvancedMath_Advanced02_edblock74
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
.label AdvancedMath_Advanced03_stringassigncpy81
	load 	AdvancedMath_Advanced03_stringassignstr80 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced03_stringassigncpy81
	; LineNumber: 23
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x1180 	AdvancedMath_Advanced03_eblock84
.label AdvancedMath_Advanced03_ctb83 ;Main true block ;keep 
	; LineNumber: 22
	call Common_PASS
	jump AdvancedMath_Advanced03_edblock85
.label AdvancedMath_Advanced03_eblock84
	; LineNumber: 22
	call Common_FAIL
.label AdvancedMath_Advanced03_edblock85
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
.label AdvancedMath_Advanced04_stringassigncpy92
	load 	AdvancedMath_Advanced04_stringassignstr91 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced04_stringassigncpy92
	; LineNumber: 34
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x402 	AdvancedMath_Advanced04_eblock95
.label AdvancedMath_Advanced04_ctb94 ;Main true block ;keep 
	; LineNumber: 33
	call Common_PASS
	jump AdvancedMath_Advanced04_edblock96
.label AdvancedMath_Advanced04_eblock95
	; LineNumber: 33
	call Common_FAIL
.label AdvancedMath_Advanced04_edblock96
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
.label AdvancedMath_Advanced05_stringassigncpy103
	load 	AdvancedMath_Advanced05_stringassignstr102 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced05_stringassigncpy103
	; LineNumber: 45
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x440 	AdvancedMath_Advanced05_eblock106
.label AdvancedMath_Advanced05_ctb105 ;Main true block ;keep 
	; LineNumber: 44
	call Common_PASS
	jump AdvancedMath_Advanced05_edblock107
.label AdvancedMath_Advanced05_eblock106
	; LineNumber: 44
	call Common_FAIL
.label AdvancedMath_Advanced05_edblock107
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
.label AdvancedMath_Advanced06_stringassigncpy114
	load 	AdvancedMath_Advanced06_stringassignstr113 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced06_stringassigncpy114
	; LineNumber: 56
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x470 	AdvancedMath_Advanced06_eblock117
.label AdvancedMath_Advanced06_ctb116 ;Main true block ;keep 
	; LineNumber: 55
	call Common_PASS
	jump AdvancedMath_Advanced06_edblock118
.label AdvancedMath_Advanced06_eblock117
	; LineNumber: 55
	call Common_FAIL
.label AdvancedMath_Advanced06_edblock118
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
.label AdvancedMath_Advanced07_stringassigncpy125
	load 	AdvancedMath_Advanced07_stringassignstr124 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced07_stringassigncpy125
	; LineNumber: 67
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x420 	AdvancedMath_Advanced07_eblock128
.label AdvancedMath_Advanced07_ctb127 ;Main true block ;keep 
	; LineNumber: 66
	call Common_PASS
	jump AdvancedMath_Advanced07_edblock129
.label AdvancedMath_Advanced07_eblock128
	; LineNumber: 66
	call Common_FAIL
.label AdvancedMath_Advanced07_edblock129
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
.label AdvancedMath_Advanced08_stringassigncpy136
	load 	AdvancedMath_Advanced08_stringassignstr135 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_Advanced08_stringassigncpy136
	; LineNumber: 75
	; Binary clause Simplified: EQUALS
	jneq 	Vars_p1 	uint16:0x460 	AdvancedMath_Advanced08_eblock139
.label AdvancedMath_Advanced08_ctb138 ;Main true block ;keep 
	; LineNumber: 74
	call Common_PASS
	jump AdvancedMath_Advanced08_edblock140
.label AdvancedMath_Advanced08_eblock139
	; LineNumber: 74
	call Common_FAIL
.label AdvancedMath_Advanced08_edblock140
	; LineNumber: 76
	return
.label end_procedure_AdvancedMath_Advanced08
	
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
.label AdvancedMath_MulDivCombo1_stringassigncpy147
	load 	AdvancedMath_MulDivCombo1_stringassignstr146 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_MulDivCombo1_stringassigncpy147
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
	jneq 	Vars_i1 	uint16:0x800 	AdvancedMath_MulDivCombo1_eblock150
.label AdvancedMath_MulDivCombo1_ctb149 ;Main true block ;keep 
	; LineNumber: 116
	call Common_PASS
	jump AdvancedMath_MulDivCombo1_edblock151
.label AdvancedMath_MulDivCombo1_eblock150
	; LineNumber: 116
	call Common_FAIL
.label AdvancedMath_MulDivCombo1_edblock151
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
.label AdvancedMath_MulDivCombo2_stringassigncpy158
	load 	AdvancedMath_MulDivCombo2_stringassignstr157 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_MulDivCombo2_stringassigncpy158
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
	jneq 	Vars_i1 	uint8:0x40 	AdvancedMath_MulDivCombo2_eblock161
.label AdvancedMath_MulDivCombo2_ctb160 ;Main true block ;keep 
	; LineNumber: 126
	call Common_PASS
	jump AdvancedMath_MulDivCombo2_edblock162
.label AdvancedMath_MulDivCombo2_eblock161
	; LineNumber: 126
	call Common_FAIL
.label AdvancedMath_MulDivCombo2_edblock162
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
.label AdvancedMath_MulDivCombo3_stringassigncpy169
	load 	AdvancedMath_MulDivCombo3_stringassignstr168 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	AdvancedMath_MulDivCombo3_stringassigncpy169
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
	jneq 	Vars_i1 	uint16:0x2000 	AdvancedMath_MulDivCombo3_eblock172
.label AdvancedMath_MulDivCombo3_ctb171 ;Main true block ;keep 
	; LineNumber: 137
	call Common_PASS
	jump AdvancedMath_MulDivCombo3_edblock173
.label AdvancedMath_MulDivCombo3_eblock172
	; LineNumber: 137
	call Common_FAIL
.label AdvancedMath_MulDivCombo3_edblock173
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
	mov 	Common_zp 	#AdvancedMath_Exec_stringassignstr179
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
.label Casts_Test1_stringassigncpy182
	load 	Casts_Test1_stringassignstr181 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test1_stringassigncpy182
	; LineNumber: 8
	mov 	Vars_i1 	uint16:0x201
	; LineNumber: 9
	mov 	Vars_v1 	Vars_i1
	; LineNumber: 11
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x01 	Casts_Test1_eblock186
.label Casts_Test1_ctb185 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump Casts_Test1_edblock187
.label Casts_Test1_eblock186
	; LineNumber: 11
	call Common_FAIL
.label Casts_Test1_edblock187
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
.label Casts_Test2_stringassigncpy194
	load 	Casts_Test2_stringassignstr193 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test2_stringassigncpy194
	; LineNumber: 19
	mov 	Vars_v1 	uint8:0xff
	; LineNumber: 20
	mov 	Vars_i1 	Vars_v1
	; LineNumber: 21
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 22
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0xff 	Casts_Test2_eblock198
.label Casts_Test2_ctb197 ;Main true block ;keep 
	; LineNumber: 21
	call Common_PASS
	jump Casts_Test2_edblock199
.label Casts_Test2_eblock198
	; LineNumber: 21
	call Common_FAIL
.label Casts_Test2_edblock199
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
.label Casts_Test3_stringassigncpy206
	load 	Casts_Test3_stringassignstr205 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test3_stringassigncpy206
	; LineNumber: 29
	; ::LoadVariable
	; push
	load 	Vars_ba1 	uint8:0x05 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	_r16_1
	; LineNumber: 30
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 31
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test3_eblock210
.label Casts_Test3_ctb209 ;Main true block ;keep 
	; LineNumber: 30
	call Common_PASS
	jump Casts_Test3_edblock211
.label Casts_Test3_eblock210
	; LineNumber: 30
	call Common_FAIL
.label Casts_Test3_edblock211
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
.label Casts_Test4_stringassigncpy218
	load 	Casts_Test4_stringassignstr217 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test4_stringassigncpy218
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 41
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test4_eblock222
.label Casts_Test4_ctb221 ;Main true block ;keep 
	; LineNumber: 40
	call Common_PASS
	jump Casts_Test4_edblock223
.label Casts_Test4_eblock222
	; LineNumber: 40
	call Common_FAIL
.label Casts_Test4_edblock223
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
.label Casts_Test5_stringassigncpy230
	load 	Casts_Test5_stringassignstr229 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test5_stringassigncpy230
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 51
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x05 	Casts_Test5_eblock234
.label Casts_Test5_ctb233 ;Main true block ;keep 
	; LineNumber: 50
	call Common_PASS
	jump Casts_Test5_edblock235
.label Casts_Test5_eblock234
	; LineNumber: 50
	call Common_FAIL
.label Casts_Test5_edblock235
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
.label Casts_Test6_stringassigncpy242
	load 	Casts_Test6_stringassignstr241 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test6_stringassigncpy242
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test6_eblock246
.label Casts_Test6_ctb245 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Casts_Test6_edblock247
.label Casts_Test6_eblock246
	; LineNumber: 61
	call Common_FAIL
.label Casts_Test6_edblock247
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
.label Casts_Test7_stringassigncpy254
	load 	Casts_Test7_stringassignstr253 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test7_stringassigncpy254
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 72
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test7_eblock258
.label Casts_Test7_ctb257 ;Main true block ;keep 
	; LineNumber: 71
	call Common_PASS
	jump Casts_Test7_edblock259
.label Casts_Test7_eblock258
	; LineNumber: 71
	call Common_FAIL
.label Casts_Test7_edblock259
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
.label Casts_Test8_stringassigncpy266
	load 	Casts_Test8_stringassignstr265 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test8_stringassigncpy266
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 82
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test8_eblock270
.label Casts_Test8_ctb269 ;Main true block ;keep 
	; LineNumber: 81
	call Common_PASS
	jump Casts_Test8_edblock271
.label Casts_Test8_eblock270
	; LineNumber: 81
	call Common_FAIL
.label Casts_Test8_edblock271
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
.label Casts_Test9_stringassigncpy278
	load 	Casts_Test9_stringassignstr277 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test9_stringassigncpy278
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 93
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test9_eblock282
.label Casts_Test9_ctb281 ;Main true block ;keep 
	; LineNumber: 92
	call Common_PASS
	jump Casts_Test9_edblock283
.label Casts_Test9_eblock282
	; LineNumber: 92
	call Common_FAIL
.label Casts_Test9_edblock283
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
.label Casts_Test10_stringassigncpy290
	load 	Casts_Test10_stringassignstr289 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test10_stringassigncpy290
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 104
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test10_eblock294
.label Casts_Test10_ctb293 ;Main true block ;keep 
	; LineNumber: 103
	call Common_PASS
	jump Casts_Test10_edblock295
.label Casts_Test10_eblock294
	; LineNumber: 103
	call Common_FAIL
.label Casts_Test10_edblock295
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
.label Casts_Test11_stringassigncpy302
	load 	Casts_Test11_stringassignstr301 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test11_stringassigncpy302
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 115
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x08 	Casts_Test11_eblock306
.label Casts_Test11_ctb305 ;Main true block ;keep 
	; LineNumber: 114
	call Common_PASS
	jump Casts_Test11_edblock307
.label Casts_Test11_eblock306
	; LineNumber: 114
	call Common_FAIL
.label Casts_Test11_edblock307
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
.label Casts_Test12_stringassigncpy314
	load 	Casts_Test12_stringassignstr313 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test12_stringassigncpy314
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 125
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test12_eblock318
.label Casts_Test12_ctb317 ;Main true block ;keep 
	; LineNumber: 124
	call Common_PASS
	jump Casts_Test12_edblock319
.label Casts_Test12_eblock318
	; LineNumber: 124
	call Common_FAIL
.label Casts_Test12_edblock319
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
.label Casts_Test13_stringassigncpy326
	load 	Casts_Test13_stringassignstr325 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test13_stringassigncpy326
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 136
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test13_eblock330
.label Casts_Test13_ctb329 ;Main true block ;keep 
	; LineNumber: 135
	call Common_PASS
	jump Casts_Test13_edblock331
.label Casts_Test13_eblock330
	; LineNumber: 135
	call Common_FAIL
.label Casts_Test13_edblock331
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
.label Casts_Test14_stringassigncpy338
	load 	Casts_Test14_stringassignstr337 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test14_stringassigncpy338
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 147
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xc8 	Casts_Test14_eblock342
.label Casts_Test14_ctb341 ;Main true block ;keep 
	; LineNumber: 146
	call Common_PASS
	jump Casts_Test14_edblock343
.label Casts_Test14_eblock342
	; LineNumber: 146
	call Common_FAIL
.label Casts_Test14_edblock343
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
.label Casts_Test15_stringassigncpy350
	load 	Casts_Test15_stringassignstr349 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test15_stringassigncpy350
	; LineNumber: 154
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_IntegerReturn
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v1 	Vars_IntegerReturn_fret
	; LineNumber: 155
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 156
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	Casts_Test15_eblock354
.label Casts_Test15_ctb353 ;Main true block ;keep 
	; LineNumber: 155
	call Common_PASS
	jump Casts_Test15_edblock355
.label Casts_Test15_eblock354
	; LineNumber: 155
	call Common_FAIL
.label Casts_Test15_edblock355
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
.label Casts_Test16_stringassigncpy362
	load 	Casts_Test16_stringassignstr361 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test16_stringassigncpy362
	; LineNumber: 163
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_ByteReturn
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i1 	Vars_ByteReturn_fret
	; LineNumber: 165
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 166
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x04 	Casts_Test16_eblock366
.label Casts_Test16_ctb365 ;Main true block ;keep 
	; LineNumber: 165
	call Common_PASS
	jump Casts_Test16_edblock367
.label Casts_Test16_eblock366
	; LineNumber: 165
	call Common_FAIL
.label Casts_Test16_edblock367
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
.label Casts_Test17_stringassigncpy374
	load 	Casts_Test17_stringassignstr373 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test17_stringassigncpy374
	; LineNumber: 173
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 174
	; Binary clause Simplified: EQUALS
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_ByteReturn
	jneq 	Vars_ByteReturn_fret 	uint8:0x04 	Casts_Test17_eblock378
.label Casts_Test17_ctb377 ;Main true block ;keep 
	; LineNumber: 173
	call Common_PASS
	jump Casts_Test17_edblock379
.label Casts_Test17_eblock378
	; LineNumber: 173
	call Common_FAIL
.label Casts_Test17_edblock379
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
.label Casts_Test18_stringassigncpy386
	load 	Casts_Test18_stringassignstr385 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Casts_Test18_stringassigncpy386
	; LineNumber: 181
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 182
	; Binary clause Simplified: EQUALS
	mov 	Vars_ir_p1 	uint8:0x02
	call Vars_IntegerReturn
	jneq 	Vars_IntegerReturn_fret 	uint8:0x04 	Casts_Test18_eblock390
.label Casts_Test18_ctb389 ;Main true block ;keep 
	; LineNumber: 181
	call Common_PASS
	jump Casts_Test18_edblock391
.label Casts_Test18_eblock390
	; LineNumber: 181
	call Common_FAIL
.label Casts_Test18_edblock391
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
	mov 	Common_zp 	#Casts_Exec_stringassignstr397
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
.label IntegerTest_T01_stringassigncpy400
	load 	IntegerTest_T01_stringassignstr399 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T01_stringassigncpy400
	; LineNumber: 9
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IntegerTest_T01_eblock403
.label IntegerTest_T01_ctb402 ;Main true block ;keep 
	; LineNumber: 8
	call Common_PASS
	jump IntegerTest_T01_edblock404
.label IntegerTest_T01_eblock403
	; LineNumber: 8
	call Common_FAIL
.label IntegerTest_T01_edblock404
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
.label IntegerTest_T02_stringassigncpy411
	load 	IntegerTest_T02_stringassignstr410 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T02_stringassigncpy411
	; LineNumber: 17
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	Vars_i2 	IntegerTest_T02_eblock414
.label IntegerTest_T02_ctb413 ;Main true block ;keep 
	; LineNumber: 16
	call Common_PASS
	jump IntegerTest_T02_edblock415
.label IntegerTest_T02_eblock414
	; LineNumber: 16
	call Common_FAIL
.label IntegerTest_T02_edblock415
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
.label IntegerTest_T03_stringassigncpy422
	load 	IntegerTest_T03_stringassignstr421 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T03_stringassigncpy422
	; LineNumber: 25
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IntegerTest_T03_eblock425
.label IntegerTest_T03_ctb424 ;Main true block ;keep 
	; LineNumber: 24
	call Common_FAIL
	jump IntegerTest_T03_edblock426
.label IntegerTest_T03_eblock425
	; LineNumber: 24
	call Common_PASS
.label IntegerTest_T03_edblock426
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
.label IntegerTest_T04_stringassigncpy433
	load 	IntegerTest_T04_stringassignstr432 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T04_stringassigncpy433
	; LineNumber: 33
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	Vars_i2 	IntegerTest_T04_eblock436
.label IntegerTest_T04_ctb435 ;Main true block ;keep 
	; LineNumber: 32
	call Common_FAIL
	jump IntegerTest_T04_edblock437
.label IntegerTest_T04_eblock436
	; LineNumber: 32
	call Common_PASS
.label IntegerTest_T04_edblock437
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
.label IntegerTest_T05_stringassigncpy444
	load 	IntegerTest_T05_stringassignstr443 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T05_stringassigncpy444
	; LineNumber: 42
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i1 	Vars_i2 	IntegerTest_T05_eblock447
.label IntegerTest_T05_ctb446 ;Main true block ;keep 
	; LineNumber: 41
	call Common_PASS
	jump IntegerTest_T05_edblock448
.label IntegerTest_T05_eblock447
	; LineNumber: 41
	call Common_FAIL
.label IntegerTest_T05_edblock448
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
.label IntegerTest_T06_stringassigncpy455
	load 	IntegerTest_T06_stringassignstr454 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T06_stringassigncpy455
	; LineNumber: 50
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i1 	Vars_i2 	IntegerTest_T06_eblock458
.label IntegerTest_T06_ctb457 ;Main true block ;keep 
	; LineNumber: 49
	call Common_PASS
	jump IntegerTest_T06_edblock459
.label IntegerTest_T06_eblock458
	; LineNumber: 49
	call Common_FAIL
.label IntegerTest_T06_edblock459
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
.label IntegerTest_T066_stringassigncpy466
	load 	IntegerTest_T066_stringassignstr465 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T066_stringassigncpy466
	; LineNumber: 58
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_i1 	uint16:0x2001 	IntegerTest_T066_eblock469
.label IntegerTest_T066_ctb468 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump IntegerTest_T066_edblock470
.label IntegerTest_T066_eblock469
	; LineNumber: 57
	call Common_FAIL
.label IntegerTest_T066_edblock470
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
.label IntegerTest_T07_stringassigncpy477
	load 	IntegerTest_T07_stringassignstr476 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T07_stringassigncpy477
	; LineNumber: 68
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xbb8 	IntegerTest_T07_eblock480
.label IntegerTest_T07_ctb479 ;Main true block ;keep 
	; LineNumber: 67
	call Common_PASS
	jump IntegerTest_T07_edblock481
.label IntegerTest_T07_eblock480
	; LineNumber: 67
	call Common_FAIL
.label IntegerTest_T07_edblock481
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
.label IntegerTest_T08_stringassigncpy488
	load 	IntegerTest_T08_stringassignstr487 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T08_stringassigncpy488
	; LineNumber: 77
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xfc18 	IntegerTest_T08_eblock491
.label IntegerTest_T08_ctb490 ;Main true block ;keep 
	; LineNumber: 76
	call Common_PASS
	jump IntegerTest_T08_edblock492
.label IntegerTest_T08_eblock491
	; LineNumber: 76
	call Common_FAIL
.label IntegerTest_T08_edblock492
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
.label IntegerTest_T09_stringassigncpy499
	load 	IntegerTest_T09_stringassignstr498 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T09_stringassigncpy499
	; LineNumber: 86
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xfa0 	IntegerTest_T09_eblock502
.label IntegerTest_T09_ctb501 ;Main true block ;keep 
	; LineNumber: 85
	call Common_PASS
	jump IntegerTest_T09_edblock503
.label IntegerTest_T09_eblock502
	; LineNumber: 85
	call Common_FAIL
.label IntegerTest_T09_edblock503
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
.label IntegerTest_T10_stringassigncpy510
	load 	IntegerTest_T10_stringassignstr509 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T10_stringassigncpy510
	; LineNumber: 95
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xf830 	IntegerTest_T10_eblock513
.label IntegerTest_T10_ctb512 ;Main true block ;keep 
	; LineNumber: 94
	call Common_PASS
	jump IntegerTest_T10_edblock514
.label IntegerTest_T10_eblock513
	; LineNumber: 94
	call Common_FAIL
.label IntegerTest_T10_edblock514
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
.label IntegerTest_T11_stringassigncpy521
	load 	IntegerTest_T11_stringassignstr520 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T11_stringassigncpy521
	; LineNumber: 105
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x2cec 	IntegerTest_T11_eblock524
.label IntegerTest_T11_ctb523 ;Main true block ;keep 
	; LineNumber: 104
	call Common_PASS
	jump IntegerTest_T11_edblock525
.label IntegerTest_T11_eblock524
	; LineNumber: 104
	call Common_FAIL
.label IntegerTest_T11_edblock525
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
	mulu  	_r16_4 	Vars_i2 	uint16:0x02
	; push
	mulu  	_r16_5 	Vars_i1 	uint16:0x03
	sub  	_r16_3 	_r16_5 	_r16_4
	add  	_r16_2 	_r16_3 	uint16:0x3e8
	sub  	_r16_1 	_r16_2 	Vars_i2
	mov 	Vars_i1 	_r16_1
	; LineNumber: 115
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label IntegerTest_T12_stringassigncpy532
	load 	IntegerTest_T12_stringassignstr531 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T12_stringassigncpy532
	; LineNumber: 115
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0xe0c0 	IntegerTest_T12_eblock535
.label IntegerTest_T12_ctb534 ;Main true block ;keep 
	; LineNumber: 114
	call Common_PASS
	jump IntegerTest_T12_edblock536
.label IntegerTest_T12_eblock535
	; LineNumber: 114
	call Common_FAIL
.label IntegerTest_T12_edblock536
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
.label IntegerTest_TMIX1_stringassigncpy543
	load 	IntegerTest_TMIX1_stringassignstr542 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_TMIX1_stringassigncpy543
	; LineNumber: 161
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x0e 	IntegerTest_TMIX1_eblock546
.label IntegerTest_TMIX1_ctb545 ;Main true block ;keep 
	; LineNumber: 160
	call Common_PASS
	jump IntegerTest_TMIX1_edblock547
.label IntegerTest_TMIX1_eblock546
	; LineNumber: 160
	call Common_FAIL
.label IntegerTest_TMIX1_edblock547
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
.label IntegerTest_T15_stringassigncpy554
	load 	IntegerTest_T15_stringassignstr553 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T15_stringassigncpy554
	; LineNumber: 170
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x00 	_r8_1
	jneq 	_r8_1 	uint8:0xff 	IntegerTest_T15_eblock557
.label IntegerTest_T15_ctb556 ;Main true block ;keep 
	; LineNumber: 169
	call Common_PASS
	jump IntegerTest_T15_edblock558
.label IntegerTest_T15_eblock557
	; LineNumber: 169
	call Common_FAIL
.label IntegerTest_T15_edblock558
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
.label IntegerTest_T16_stringassigncpy565
	load 	IntegerTest_T16_stringassignstr564 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IntegerTest_T16_stringassigncpy565
	; LineNumber: 180
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	Vars_barr 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0xff 	IntegerTest_T16_eblock568
.label IntegerTest_T16_ctb567 ;Main true block ;keep 
	; LineNumber: 179
	call Common_PASS
	jump IntegerTest_T16_edblock569
.label IntegerTest_T16_eblock568
	; LineNumber: 179
	call Common_FAIL
.label IntegerTest_T16_edblock569
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
	mov 	Common_zp 	#IntegerTest_Exec_stringassignstr575
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
.label IfThenElse_GT1_GreaterThan_True_stringassigncpy578
	load 	IfThenElse_GT1_GreaterThan_True_stringassignstr577 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GT1_GreaterThan_True_stringassigncpy578
	; LineNumber: 14
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT1_GreaterThan_True_eblock581
.label IfThenElse_GT1_GreaterThan_True_ctb580 ;Main true block ;keep 
	; LineNumber: 13
	; LineNumber: 14
	call Common_PASS
	; LineNumber: 14
	jump IfThenElse_GT1_GreaterThan_True_edblock582
.label IfThenElse_GT1_GreaterThan_True_eblock581
	; LineNumber: 13
	; LineNumber: 14
	call Common_FAIL
	; LineNumber: 14
.label IfThenElse_GT1_GreaterThan_True_edblock582
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
.label IfThenElse_GT2_GreaterThan_False_stringassigncpy589
	load 	IfThenElse_GT2_GreaterThan_False_stringassignstr588 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GT2_GreaterThan_False_stringassigncpy589
	; LineNumber: 21
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT2_GreaterThan_False_eblock592
.label IfThenElse_GT2_GreaterThan_False_ctb591 ;Main true block ;keep 
	; LineNumber: 20
	; LineNumber: 21
	call Common_FAIL
	; LineNumber: 21
	jump IfThenElse_GT2_GreaterThan_False_edblock593
.label IfThenElse_GT2_GreaterThan_False_eblock592
	; LineNumber: 20
	; LineNumber: 21
	call Common_PASS
	; LineNumber: 21
.label IfThenElse_GT2_GreaterThan_False_edblock593
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
.label IfThenElse_GT3_GreaterThan_False_stringassigncpy600
	load 	IfThenElse_GT3_GreaterThan_False_stringassignstr599 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GT3_GreaterThan_False_stringassigncpy600
	; LineNumber: 28
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT3_GreaterThan_False_eblock603
.label IfThenElse_GT3_GreaterThan_False_ctb602 ;Main true block ;keep 
	; LineNumber: 27
	; LineNumber: 28
	call Common_FAIL
	; LineNumber: 28
	jump IfThenElse_GT3_GreaterThan_False_edblock604
.label IfThenElse_GT3_GreaterThan_False_eblock603
	; LineNumber: 27
	; LineNumber: 28
	call Common_PASS
	; LineNumber: 28
.label IfThenElse_GT3_GreaterThan_False_edblock604
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
.label IfThenElse_GT4_GreaterThan_False_stringassigncpy611
	load 	IfThenElse_GT4_GreaterThan_False_stringassignstr610 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GT4_GreaterThan_False_stringassigncpy611
	; LineNumber: 35
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT4_GreaterThan_False_eblock614
.label IfThenElse_GT4_GreaterThan_False_ctb613 ;Main true block ;keep 
	; LineNumber: 34
	; LineNumber: 35
	call Common_FAIL
	; LineNumber: 35
	jump IfThenElse_GT4_GreaterThan_False_edblock615
.label IfThenElse_GT4_GreaterThan_False_eblock614
	; LineNumber: 34
	; LineNumber: 35
	call Common_PASS
	; LineNumber: 35
.label IfThenElse_GT4_GreaterThan_False_edblock615
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
.label IfThenElse_GT5_GreaterThan_True_stringassigncpy622
	load 	IfThenElse_GT5_GreaterThan_True_stringassignstr621 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GT5_GreaterThan_True_stringassigncpy622
	; LineNumber: 42
	; Binary clause Simplified: GREATER
	jlte 	Vars_v1 	Vars_v2 	IfThenElse_GT5_GreaterThan_True_eblock625
.label IfThenElse_GT5_GreaterThan_True_ctb624 ;Main true block ;keep 
	; LineNumber: 41
	; LineNumber: 42
	call Common_PASS
	; LineNumber: 42
	jump IfThenElse_GT5_GreaterThan_True_edblock626
.label IfThenElse_GT5_GreaterThan_True_eblock625
	; LineNumber: 41
	; LineNumber: 42
	call Common_FAIL
	; LineNumber: 42
.label IfThenElse_GT5_GreaterThan_True_edblock626
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
.label IfThenElse_GTE1_GreaterEqual_True_stringassigncpy633
	load 	IfThenElse_GTE1_GreaterEqual_True_stringassignstr632 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GTE1_GreaterEqual_True_stringassigncpy633
	; LineNumber: 50
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE1_GreaterEqual_True_eblock636
.label IfThenElse_GTE1_GreaterEqual_True_ctb635 ;Main true block ;keep 
	; LineNumber: 49
	; LineNumber: 50
	call Common_PASS
	; LineNumber: 50
	jump IfThenElse_GTE1_GreaterEqual_True_edblock637
.label IfThenElse_GTE1_GreaterEqual_True_eblock636
	; LineNumber: 49
	; LineNumber: 50
	call Common_FAIL
	; LineNumber: 50
.label IfThenElse_GTE1_GreaterEqual_True_edblock637
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
.label IfThenElse_GTE2_GreaterThan_False_stringassigncpy644
	load 	IfThenElse_GTE2_GreaterThan_False_stringassignstr643 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GTE2_GreaterThan_False_stringassigncpy644
	; LineNumber: 57
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE2_GreaterThan_False_eblock647
.label IfThenElse_GTE2_GreaterThan_False_ctb646 ;Main true block ;keep 
	; LineNumber: 56
	; LineNumber: 57
	call Common_FAIL
	; LineNumber: 57
	jump IfThenElse_GTE2_GreaterThan_False_edblock648
.label IfThenElse_GTE2_GreaterThan_False_eblock647
	; LineNumber: 56
	; LineNumber: 57
	call Common_PASS
	; LineNumber: 57
.label IfThenElse_GTE2_GreaterThan_False_edblock648
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
.label IfThenElse_GTE3_GreaterThan_True_stringassigncpy655
	load 	IfThenElse_GTE3_GreaterThan_True_stringassignstr654 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GTE3_GreaterThan_True_stringassigncpy655
	; LineNumber: 64
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE3_GreaterThan_True_eblock658
.label IfThenElse_GTE3_GreaterThan_True_ctb657 ;Main true block ;keep 
	; LineNumber: 63
	; LineNumber: 64
	call Common_PASS
	; LineNumber: 64
	jump IfThenElse_GTE3_GreaterThan_True_edblock659
.label IfThenElse_GTE3_GreaterThan_True_eblock658
	; LineNumber: 63
	; LineNumber: 64
	call Common_FAIL
	; LineNumber: 64
.label IfThenElse_GTE3_GreaterThan_True_edblock659
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
.label IfThenElse_GTE4_GreaterThan_False_stringassigncpy666
	load 	IfThenElse_GTE4_GreaterThan_False_stringassignstr665 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GTE4_GreaterThan_False_stringassigncpy666
	; LineNumber: 71
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE4_GreaterThan_False_eblock669
.label IfThenElse_GTE4_GreaterThan_False_ctb668 ;Main true block ;keep 
	; LineNumber: 70
	; LineNumber: 71
	call Common_FAIL
	; LineNumber: 71
	jump IfThenElse_GTE4_GreaterThan_False_edblock670
.label IfThenElse_GTE4_GreaterThan_False_eblock669
	; LineNumber: 70
	; LineNumber: 71
	call Common_PASS
	; LineNumber: 71
.label IfThenElse_GTE4_GreaterThan_False_edblock670
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
.label IfThenElse_GTE5_GreaterThan_True_stringassigncpy677
	load 	IfThenElse_GTE5_GreaterThan_True_stringassignstr676 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_GTE5_GreaterThan_True_stringassigncpy677
	; LineNumber: 78
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_GTE5_GreaterThan_True_eblock680
.label IfThenElse_GTE5_GreaterThan_True_ctb679 ;Main true block ;keep 
	; LineNumber: 77
	; LineNumber: 78
	call Common_PASS
	; LineNumber: 78
	jump IfThenElse_GTE5_GreaterThan_True_edblock681
.label IfThenElse_GTE5_GreaterThan_True_eblock680
	; LineNumber: 77
	; LineNumber: 78
	call Common_FAIL
	; LineNumber: 78
.label IfThenElse_GTE5_GreaterThan_True_edblock681
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
.label IfThenElse_LT1_LessThan_True_stringassigncpy688
	load 	IfThenElse_LT1_LessThan_True_stringassignstr687 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LT1_LessThan_True_stringassigncpy688
	; LineNumber: 86
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT1_LessThan_True_eblock691
.label IfThenElse_LT1_LessThan_True_ctb690 ;Main true block ;keep 
	; LineNumber: 85
	; LineNumber: 86
	call Common_PASS
	; LineNumber: 86
	jump IfThenElse_LT1_LessThan_True_edblock692
.label IfThenElse_LT1_LessThan_True_eblock691
	; LineNumber: 85
	; LineNumber: 86
	call Common_FAIL
	; LineNumber: 86
.label IfThenElse_LT1_LessThan_True_edblock692
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
.label IfThenElse_LT2_LessThan_False_stringassigncpy699
	load 	IfThenElse_LT2_LessThan_False_stringassignstr698 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LT2_LessThan_False_stringassigncpy699
	; LineNumber: 93
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT2_LessThan_False_eblock702
.label IfThenElse_LT2_LessThan_False_ctb701 ;Main true block ;keep 
	; LineNumber: 92
	; LineNumber: 93
	call Common_FAIL
	; LineNumber: 93
	jump IfThenElse_LT2_LessThan_False_edblock703
.label IfThenElse_LT2_LessThan_False_eblock702
	; LineNumber: 92
	; LineNumber: 93
	call Common_PASS
	; LineNumber: 93
.label IfThenElse_LT2_LessThan_False_edblock703
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
.label IfThenElse_LT3_LessThan_False_stringassigncpy710
	load 	IfThenElse_LT3_LessThan_False_stringassignstr709 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LT3_LessThan_False_stringassigncpy710
	; LineNumber: 100
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT3_LessThan_False_eblock713
.label IfThenElse_LT3_LessThan_False_ctb712 ;Main true block ;keep 
	; LineNumber: 99
	; LineNumber: 100
	call Common_FAIL
	; LineNumber: 100
	jump IfThenElse_LT3_LessThan_False_edblock714
.label IfThenElse_LT3_LessThan_False_eblock713
	; LineNumber: 99
	; LineNumber: 100
	call Common_PASS
	; LineNumber: 100
.label IfThenElse_LT3_LessThan_False_edblock714
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
.label IfThenElse_LT4_LessThan_True_stringassigncpy721
	load 	IfThenElse_LT4_LessThan_True_stringassignstr720 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LT4_LessThan_True_stringassigncpy721
	; LineNumber: 107
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT4_LessThan_True_eblock724
.label IfThenElse_LT4_LessThan_True_ctb723 ;Main true block ;keep 
	; LineNumber: 106
	; LineNumber: 107
	call Common_PASS
	; LineNumber: 107
	jump IfThenElse_LT4_LessThan_True_edblock725
.label IfThenElse_LT4_LessThan_True_eblock724
	; LineNumber: 106
	; LineNumber: 107
	call Common_FAIL
	; LineNumber: 107
.label IfThenElse_LT4_LessThan_True_edblock725
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
.label IfThenElse_LT5_LessThan_False_stringassigncpy732
	load 	IfThenElse_LT5_LessThan_False_stringassignstr731 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LT5_LessThan_False_stringassigncpy732
	; LineNumber: 114
	; Binary clause Simplified: LESS
	jgte 	Vars_v1 	Vars_v2 	IfThenElse_LT5_LessThan_False_eblock735
.label IfThenElse_LT5_LessThan_False_ctb734 ;Main true block ;keep 
	; LineNumber: 113
	; LineNumber: 114
	call Common_FAIL
	; LineNumber: 114
	jump IfThenElse_LT5_LessThan_False_edblock736
.label IfThenElse_LT5_LessThan_False_eblock735
	; LineNumber: 113
	; LineNumber: 114
	call Common_PASS
	; LineNumber: 114
.label IfThenElse_LT5_LessThan_False_edblock736
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
.label IfThenElse_LTE1_LessEqual_True_stringassigncpy743
	load 	IfThenElse_LTE1_LessEqual_True_stringassignstr742 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE1_LessEqual_True_stringassigncpy743
	; LineNumber: 122
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE1_LessEqual_True_eblock746
.label IfThenElse_LTE1_LessEqual_True_ctb745 ;Main true block ;keep 
	; LineNumber: 121
	; LineNumber: 122
	call Common_PASS
	; LineNumber: 122
	jump IfThenElse_LTE1_LessEqual_True_edblock747
.label IfThenElse_LTE1_LessEqual_True_eblock746
	; LineNumber: 121
	; LineNumber: 122
	call Common_FAIL
	; LineNumber: 122
.label IfThenElse_LTE1_LessEqual_True_edblock747
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
.label IfThenElse_LTE1_LessEqual_True2_stringassigncpy754
	load 	IfThenElse_LTE1_LessEqual_True2_stringassignstr753 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE1_LessEqual_True2_stringassigncpy754
	; LineNumber: 129
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE1_LessEqual_True2_eblock757
.label IfThenElse_LTE1_LessEqual_True2_ctb756 ;Main true block ;keep 
	; LineNumber: 128
	; LineNumber: 129
	call Common_PASS
	; LineNumber: 129
	jump IfThenElse_LTE1_LessEqual_True2_edblock758
.label IfThenElse_LTE1_LessEqual_True2_eblock757
	; LineNumber: 128
	; LineNumber: 129
	call Common_FAIL
	; LineNumber: 129
.label IfThenElse_LTE1_LessEqual_True2_edblock758
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
.label IfThenElse_LTE2_LessThan_False_stringassigncpy765
	load 	IfThenElse_LTE2_LessThan_False_stringassignstr764 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE2_LessThan_False_stringassigncpy765
	; LineNumber: 136
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE2_LessThan_False_eblock768
.label IfThenElse_LTE2_LessThan_False_ctb767 ;Main true block ;keep 
	; LineNumber: 135
	; LineNumber: 136
	call Common_FAIL
	; LineNumber: 136
	jump IfThenElse_LTE2_LessThan_False_edblock769
.label IfThenElse_LTE2_LessThan_False_eblock768
	; LineNumber: 135
	; LineNumber: 136
	call Common_PASS
	; LineNumber: 136
.label IfThenElse_LTE2_LessThan_False_edblock769
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
.label IfThenElse_LTE3_LessThan_True_stringassigncpy776
	load 	IfThenElse_LTE3_LessThan_True_stringassignstr775 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE3_LessThan_True_stringassigncpy776
	; LineNumber: 143
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE3_LessThan_True_eblock779
.label IfThenElse_LTE3_LessThan_True_ctb778 ;Main true block ;keep 
	; LineNumber: 142
	; LineNumber: 143
	call Common_PASS
	; LineNumber: 143
	jump IfThenElse_LTE3_LessThan_True_edblock780
.label IfThenElse_LTE3_LessThan_True_eblock779
	; LineNumber: 142
	; LineNumber: 143
	call Common_FAIL
	; LineNumber: 143
.label IfThenElse_LTE3_LessThan_True_edblock780
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
.label IfThenElse_LTE4_LessThan_True_stringassigncpy787
	load 	IfThenElse_LTE4_LessThan_True_stringassignstr786 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE4_LessThan_True_stringassigncpy787
	; LineNumber: 150
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE4_LessThan_True_eblock790
.label IfThenElse_LTE4_LessThan_True_ctb789 ;Main true block ;keep 
	; LineNumber: 149
	; LineNumber: 150
	call Common_PASS
	; LineNumber: 150
	jump IfThenElse_LTE4_LessThan_True_edblock791
.label IfThenElse_LTE4_LessThan_True_eblock790
	; LineNumber: 149
	; LineNumber: 150
	call Common_FAIL
	; LineNumber: 150
.label IfThenElse_LTE4_LessThan_True_edblock791
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
.label IfThenElse_LTE5_LessThan_False_stringassigncpy798
	load 	IfThenElse_LTE5_LessThan_False_stringassignstr797 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_LTE5_LessThan_False_stringassigncpy798
	; LineNumber: 157
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_v1 	Vars_v2 	IfThenElse_LTE5_LessThan_False_eblock801
.label IfThenElse_LTE5_LessThan_False_ctb800 ;Main true block ;keep 
	; LineNumber: 156
	; LineNumber: 157
	call Common_FAIL
	; LineNumber: 157
	jump IfThenElse_LTE5_LessThan_False_edblock802
.label IfThenElse_LTE5_LessThan_False_eblock801
	; LineNumber: 156
	; LineNumber: 157
	call Common_PASS
	; LineNumber: 157
.label IfThenElse_LTE5_LessThan_False_edblock802
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
.label IfThenElse_EQ1_EqualTo_True_stringassigncpy809
	load 	IfThenElse_EQ1_EqualTo_True_stringassignstr808 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_EQ1_EqualTo_True_stringassigncpy809
	; LineNumber: 165
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_EQ1_EqualTo_True_eblock812
.label IfThenElse_EQ1_EqualTo_True_ctb811 ;Main true block ;keep 
	; LineNumber: 164
	; LineNumber: 165
	call Common_PASS
	; LineNumber: 165
	jump IfThenElse_EQ1_EqualTo_True_edblock813
.label IfThenElse_EQ1_EqualTo_True_eblock812
	; LineNumber: 164
	; LineNumber: 165
	call Common_FAIL
	; LineNumber: 165
.label IfThenElse_EQ1_EqualTo_True_edblock813
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
.label IfThenElse_EQ2_EqualTo_False_stringassigncpy820
	load 	IfThenElse_EQ2_EqualTo_False_stringassignstr819 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_EQ2_EqualTo_False_stringassigncpy820
	; LineNumber: 172
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_EQ2_EqualTo_False_eblock823
.label IfThenElse_EQ2_EqualTo_False_ctb822 ;Main true block ;keep 
	; LineNumber: 171
	; LineNumber: 172
	call Common_FAIL
	; LineNumber: 172
	jump IfThenElse_EQ2_EqualTo_False_edblock824
.label IfThenElse_EQ2_EqualTo_False_eblock823
	; LineNumber: 171
	; LineNumber: 172
	call Common_PASS
	; LineNumber: 172
.label IfThenElse_EQ2_EqualTo_False_edblock824
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
.label IfThenElse_NEQ1_NotEqualTo_True_stringassigncpy831
	load 	IfThenElse_NEQ1_NotEqualTo_True_stringassignstr830 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_NEQ1_NotEqualTo_True_stringassigncpy831
	; LineNumber: 180
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v1 	Vars_v2 	IfThenElse_NEQ1_NotEqualTo_True_eblock834
.label IfThenElse_NEQ1_NotEqualTo_True_ctb833 ;Main true block ;keep 
	; LineNumber: 179
	; LineNumber: 180
	call Common_PASS
	; LineNumber: 180
	jump IfThenElse_NEQ1_NotEqualTo_True_edblock835
.label IfThenElse_NEQ1_NotEqualTo_True_eblock834
	; LineNumber: 179
	; LineNumber: 180
	call Common_FAIL
	; LineNumber: 180
.label IfThenElse_NEQ1_NotEqualTo_True_edblock835
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
.label IfThenElse_NEQ2_NotEqualTo_False_stringassigncpy842
	load 	IfThenElse_NEQ2_NotEqualTo_False_stringassignstr841 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_NEQ2_NotEqualTo_False_stringassigncpy842
	; LineNumber: 187
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v1 	Vars_v2 	IfThenElse_NEQ2_NotEqualTo_False_eblock845
.label IfThenElse_NEQ2_NotEqualTo_False_ctb844 ;Main true block ;keep 
	; LineNumber: 186
	; LineNumber: 187
	call Common_FAIL
	; LineNumber: 187
	jump IfThenElse_NEQ2_NotEqualTo_False_edblock846
.label IfThenElse_NEQ2_NotEqualTo_False_eblock845
	; LineNumber: 186
	; LineNumber: 187
	call Common_PASS
	; LineNumber: 187
.label IfThenElse_NEQ2_NotEqualTo_False_edblock846
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
.label IfThenElse_Advanced1_stringassigncpy853
	load 	IfThenElse_Advanced1_stringassignstr852 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_Advanced1_stringassigncpy853
	; LineNumber: 196
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	Vars_v2 	IfThenElse_Advanced1_eblock856
.label IfThenElse_Advanced1_localsuccess860 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v3 	uint8:0x05 	IfThenElse_Advanced1_eblock856
.label IfThenElse_Advanced1_ctb855 ;Main true block ;keep 
	; LineNumber: 195
	; LineNumber: 196
	call Common_FAIL
	; LineNumber: 196
	jump IfThenElse_Advanced1_edblock857
.label IfThenElse_Advanced1_eblock856
	; LineNumber: 195
	; LineNumber: 196
	call Common_PASS
	; LineNumber: 196
.label IfThenElse_Advanced1_edblock857
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
.label IfThenElse_Advanced2_stringassigncpy865
	load 	IfThenElse_Advanced2_stringassignstr864 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_Advanced2_stringassigncpy865
	; LineNumber: 204
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	Vars_v2 	IfThenElse_Advanced2_eblock868
.label IfThenElse_Advanced2_localsuccess872 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	jeq 	Vars_v3 	uint8:0x05 	IfThenElse_Advanced2_localfailed873
	jump IfThenElse_Advanced2_ctb867
.label IfThenElse_Advanced2_localfailed873 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v4 	uint8:0x04 	IfThenElse_Advanced2_eblock868
.label IfThenElse_Advanced2_ctb867 ;Main true block ;keep 
	; LineNumber: 203
	; LineNumber: 204
	call Common_PASS
	; LineNumber: 204
	jump IfThenElse_Advanced2_edblock869
.label IfThenElse_Advanced2_eblock868
	; LineNumber: 203
	; LineNumber: 204
	call Common_FAIL
	; LineNumber: 204
.label IfThenElse_Advanced2_edblock869
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
.label IfThenElse_IGT1_GreaterThan_True_stringassigncpy878
	load 	IfThenElse_IGT1_GreaterThan_True_stringassignstr877 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGT1_GreaterThan_True_stringassigncpy878
	; LineNumber: 215
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT1_GreaterThan_True_eblock881
.label IfThenElse_IGT1_GreaterThan_True_ctb880 ;Main true block ;keep 
	; LineNumber: 214
	; LineNumber: 215
	call Common_PASS
	; LineNumber: 215
	jump IfThenElse_IGT1_GreaterThan_True_edblock882
.label IfThenElse_IGT1_GreaterThan_True_eblock881
	; LineNumber: 214
	; LineNumber: 215
	call Common_FAIL
	; LineNumber: 215
.label IfThenElse_IGT1_GreaterThan_True_edblock882
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
.label IfThenElse_IGT2_GreaterThan_False_stringassigncpy889
	load 	IfThenElse_IGT2_GreaterThan_False_stringassignstr888 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGT2_GreaterThan_False_stringassigncpy889
	; LineNumber: 222
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT2_GreaterThan_False_eblock892
.label IfThenElse_IGT2_GreaterThan_False_ctb891 ;Main true block ;keep 
	; LineNumber: 221
	; LineNumber: 222
	call Common_FAIL
	; LineNumber: 222
	jump IfThenElse_IGT2_GreaterThan_False_edblock893
.label IfThenElse_IGT2_GreaterThan_False_eblock892
	; LineNumber: 221
	; LineNumber: 222
	call Common_PASS
	; LineNumber: 222
.label IfThenElse_IGT2_GreaterThan_False_edblock893
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
.label IfThenElse_IGT3_GreaterThan_False_stringassigncpy900
	load 	IfThenElse_IGT3_GreaterThan_False_stringassignstr899 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGT3_GreaterThan_False_stringassigncpy900
	; LineNumber: 229
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT3_GreaterThan_False_eblock903
.label IfThenElse_IGT3_GreaterThan_False_ctb902 ;Main true block ;keep 
	; LineNumber: 228
	; LineNumber: 229
	call Common_FAIL
	; LineNumber: 229
	jump IfThenElse_IGT3_GreaterThan_False_edblock904
.label IfThenElse_IGT3_GreaterThan_False_eblock903
	; LineNumber: 228
	; LineNumber: 229
	call Common_PASS
	; LineNumber: 229
.label IfThenElse_IGT3_GreaterThan_False_edblock904
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
.label IfThenElse_IGT4_GreaterThan_False_stringassigncpy911
	load 	IfThenElse_IGT4_GreaterThan_False_stringassignstr910 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGT4_GreaterThan_False_stringassigncpy911
	; LineNumber: 236
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT4_GreaterThan_False_eblock914
.label IfThenElse_IGT4_GreaterThan_False_ctb913 ;Main true block ;keep 
	; LineNumber: 235
	; LineNumber: 236
	call Common_FAIL
	; LineNumber: 236
	jump IfThenElse_IGT4_GreaterThan_False_edblock915
.label IfThenElse_IGT4_GreaterThan_False_eblock914
	; LineNumber: 235
	; LineNumber: 236
	call Common_PASS
	; LineNumber: 236
.label IfThenElse_IGT4_GreaterThan_False_edblock915
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
.label IfThenElse_IGT5_GreaterThan_True_stringassigncpy922
	load 	IfThenElse_IGT5_GreaterThan_True_stringassignstr921 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGT5_GreaterThan_True_stringassigncpy922
	; LineNumber: 243
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_IGT5_GreaterThan_True_eblock925
.label IfThenElse_IGT5_GreaterThan_True_ctb924 ;Main true block ;keep 
	; LineNumber: 242
	; LineNumber: 243
	call Common_PASS
	; LineNumber: 243
	jump IfThenElse_IGT5_GreaterThan_True_edblock926
.label IfThenElse_IGT5_GreaterThan_True_eblock925
	; LineNumber: 242
	; LineNumber: 243
	call Common_FAIL
	; LineNumber: 243
.label IfThenElse_IGT5_GreaterThan_True_edblock926
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
.label IfThenElse_IGTE1_GreaterEqual_True_stringassigncpy933
	load 	IfThenElse_IGTE1_GreaterEqual_True_stringassignstr932 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGTE1_GreaterEqual_True_stringassigncpy933
	; LineNumber: 251
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE1_GreaterEqual_True_eblock936
.label IfThenElse_IGTE1_GreaterEqual_True_ctb935 ;Main true block ;keep 
	; LineNumber: 250
	; LineNumber: 251
	call Common_PASS
	; LineNumber: 251
	jump IfThenElse_IGTE1_GreaterEqual_True_edblock937
.label IfThenElse_IGTE1_GreaterEqual_True_eblock936
	; LineNumber: 250
	; LineNumber: 251
	call Common_FAIL
	; LineNumber: 251
.label IfThenElse_IGTE1_GreaterEqual_True_edblock937
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
.label IfThenElse_IGTE2_GreaterThan_False_stringassigncpy944
	load 	IfThenElse_IGTE2_GreaterThan_False_stringassignstr943 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGTE2_GreaterThan_False_stringassigncpy944
	; LineNumber: 258
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE2_GreaterThan_False_eblock947
.label IfThenElse_IGTE2_GreaterThan_False_ctb946 ;Main true block ;keep 
	; LineNumber: 257
	; LineNumber: 258
	call Common_FAIL
	; LineNumber: 258
	jump IfThenElse_IGTE2_GreaterThan_False_edblock948
.label IfThenElse_IGTE2_GreaterThan_False_eblock947
	; LineNumber: 257
	; LineNumber: 258
	call Common_PASS
	; LineNumber: 258
.label IfThenElse_IGTE2_GreaterThan_False_edblock948
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
.label IfThenElse_IGTE3_GreaterThan_True_stringassigncpy955
	load 	IfThenElse_IGTE3_GreaterThan_True_stringassignstr954 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGTE3_GreaterThan_True_stringassigncpy955
	; LineNumber: 265
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE3_GreaterThan_True_eblock958
.label IfThenElse_IGTE3_GreaterThan_True_ctb957 ;Main true block ;keep 
	; LineNumber: 264
	; LineNumber: 265
	call Common_PASS
	; LineNumber: 265
	jump IfThenElse_IGTE3_GreaterThan_True_edblock959
.label IfThenElse_IGTE3_GreaterThan_True_eblock958
	; LineNumber: 264
	; LineNumber: 265
	call Common_FAIL
	; LineNumber: 265
.label IfThenElse_IGTE3_GreaterThan_True_edblock959
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
.label IfThenElse_IGTE4_GreaterThan_False_stringassigncpy966
	load 	IfThenElse_IGTE4_GreaterThan_False_stringassignstr965 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGTE4_GreaterThan_False_stringassigncpy966
	; LineNumber: 272
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE4_GreaterThan_False_eblock969
.label IfThenElse_IGTE4_GreaterThan_False_ctb968 ;Main true block ;keep 
	; LineNumber: 271
	; LineNumber: 272
	call Common_FAIL
	; LineNumber: 272
	jump IfThenElse_IGTE4_GreaterThan_False_edblock970
.label IfThenElse_IGTE4_GreaterThan_False_eblock969
	; LineNumber: 271
	; LineNumber: 272
	call Common_PASS
	; LineNumber: 272
.label IfThenElse_IGTE4_GreaterThan_False_edblock970
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
.label IfThenElse_IGTE5_GreaterThan_True_stringassigncpy977
	load 	IfThenElse_IGTE5_GreaterThan_True_stringassignstr976 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_IGTE5_GreaterThan_True_stringassigncpy977
	; LineNumber: 279
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_IGTE5_GreaterThan_True_eblock980
.label IfThenElse_IGTE5_GreaterThan_True_ctb979 ;Main true block ;keep 
	; LineNumber: 278
	; LineNumber: 279
	call Common_PASS
	; LineNumber: 279
	jump IfThenElse_IGTE5_GreaterThan_True_edblock981
.label IfThenElse_IGTE5_GreaterThan_True_eblock980
	; LineNumber: 278
	; LineNumber: 279
	call Common_FAIL
	; LineNumber: 279
.label IfThenElse_IGTE5_GreaterThan_True_edblock981
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
.label IfThenElse_ILT1_GreaterThan_True_stringassigncpy988
	load 	IfThenElse_ILT1_GreaterThan_True_stringassignstr987 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILT1_GreaterThan_True_stringassigncpy988
	; LineNumber: 294
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT1_GreaterThan_True_eblock991
.label IfThenElse_ILT1_GreaterThan_True_ctb990 ;Main true block ;keep 
	; LineNumber: 293
	; LineNumber: 294
	call Common_PASS
	; LineNumber: 294
	jump IfThenElse_ILT1_GreaterThan_True_edblock992
.label IfThenElse_ILT1_GreaterThan_True_eblock991
	; LineNumber: 293
	; LineNumber: 294
	call Common_FAIL
	; LineNumber: 294
.label IfThenElse_ILT1_GreaterThan_True_edblock992
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
.label IfThenElse_ILT2_GreaterThan_False_stringassigncpy999
	load 	IfThenElse_ILT2_GreaterThan_False_stringassignstr998 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILT2_GreaterThan_False_stringassigncpy999
	; LineNumber: 301
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT2_GreaterThan_False_eblock1002
.label IfThenElse_ILT2_GreaterThan_False_ctb1001 ;Main true block ;keep 
	; LineNumber: 300
	; LineNumber: 301
	call Common_FAIL
	; LineNumber: 301
	jump IfThenElse_ILT2_GreaterThan_False_edblock1003
.label IfThenElse_ILT2_GreaterThan_False_eblock1002
	; LineNumber: 300
	; LineNumber: 301
	call Common_PASS
	; LineNumber: 301
.label IfThenElse_ILT2_GreaterThan_False_edblock1003
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
.label IfThenElse_ILT3_GreaterThan_False_stringassigncpy1010
	load 	IfThenElse_ILT3_GreaterThan_False_stringassignstr1009 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILT3_GreaterThan_False_stringassigncpy1010
	; LineNumber: 308
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT3_GreaterThan_False_eblock1013
.label IfThenElse_ILT3_GreaterThan_False_ctb1012 ;Main true block ;keep 
	; LineNumber: 307
	; LineNumber: 308
	call Common_FAIL
	; LineNumber: 308
	jump IfThenElse_ILT3_GreaterThan_False_edblock1014
.label IfThenElse_ILT3_GreaterThan_False_eblock1013
	; LineNumber: 307
	; LineNumber: 308
	call Common_PASS
	; LineNumber: 308
.label IfThenElse_ILT3_GreaterThan_False_edblock1014
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
.label IfThenElse_ILT4_GreaterThan_False_stringassigncpy1021
	load 	IfThenElse_ILT4_GreaterThan_False_stringassignstr1020 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILT4_GreaterThan_False_stringassigncpy1021
	; LineNumber: 315
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT4_GreaterThan_False_eblock1024
.label IfThenElse_ILT4_GreaterThan_False_ctb1023 ;Main true block ;keep 
	; LineNumber: 314
	; LineNumber: 315
	call Common_FAIL
	; LineNumber: 315
	jump IfThenElse_ILT4_GreaterThan_False_edblock1025
.label IfThenElse_ILT4_GreaterThan_False_eblock1024
	; LineNumber: 314
	; LineNumber: 315
	call Common_PASS
	; LineNumber: 315
.label IfThenElse_ILT4_GreaterThan_False_edblock1025
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
.label IfThenElse_ILT5_GreaterThan_True_stringassigncpy1032
	load 	IfThenElse_ILT5_GreaterThan_True_stringassignstr1031 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILT5_GreaterThan_True_stringassigncpy1032
	; LineNumber: 322
	; Binary clause Simplified: LESS
	jgte 	Vars_i2 	Vars_i1 	IfThenElse_ILT5_GreaterThan_True_eblock1035
.label IfThenElse_ILT5_GreaterThan_True_ctb1034 ;Main true block ;keep 
	; LineNumber: 321
	; LineNumber: 322
	call Common_PASS
	; LineNumber: 322
	jump IfThenElse_ILT5_GreaterThan_True_edblock1036
.label IfThenElse_ILT5_GreaterThan_True_eblock1035
	; LineNumber: 321
	; LineNumber: 322
	call Common_FAIL
	; LineNumber: 322
.label IfThenElse_ILT5_GreaterThan_True_edblock1036
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
.label IfThenElse_ILTE1_GreaterEqual_True_stringassigncpy1043
	load 	IfThenElse_ILTE1_GreaterEqual_True_stringassignstr1042 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILTE1_GreaterEqual_True_stringassigncpy1043
	; LineNumber: 330
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE1_GreaterEqual_True_eblock1046
.label IfThenElse_ILTE1_GreaterEqual_True_ctb1045 ;Main true block ;keep 
	; LineNumber: 329
	; LineNumber: 330
	call Common_PASS
	; LineNumber: 330
	jump IfThenElse_ILTE1_GreaterEqual_True_edblock1047
.label IfThenElse_ILTE1_GreaterEqual_True_eblock1046
	; LineNumber: 329
	; LineNumber: 330
	call Common_FAIL
	; LineNumber: 330
.label IfThenElse_ILTE1_GreaterEqual_True_edblock1047
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
.label IfThenElse_ILTE2_GreaterThan_False_stringassigncpy1054
	load 	IfThenElse_ILTE2_GreaterThan_False_stringassignstr1053 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILTE2_GreaterThan_False_stringassigncpy1054
	; LineNumber: 337
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE2_GreaterThan_False_eblock1057
.label IfThenElse_ILTE2_GreaterThan_False_ctb1056 ;Main true block ;keep 
	; LineNumber: 336
	; LineNumber: 337
	call Common_FAIL
	; LineNumber: 337
	jump IfThenElse_ILTE2_GreaterThan_False_edblock1058
.label IfThenElse_ILTE2_GreaterThan_False_eblock1057
	; LineNumber: 336
	; LineNumber: 337
	call Common_PASS
	; LineNumber: 337
.label IfThenElse_ILTE2_GreaterThan_False_edblock1058
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
.label IfThenElse_ILTE3_GreaterThan_True_stringassigncpy1065
	load 	IfThenElse_ILTE3_GreaterThan_True_stringassignstr1064 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILTE3_GreaterThan_True_stringassigncpy1065
	; LineNumber: 344
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE3_GreaterThan_True_eblock1068
.label IfThenElse_ILTE3_GreaterThan_True_ctb1067 ;Main true block ;keep 
	; LineNumber: 343
	; LineNumber: 344
	call Common_PASS
	; LineNumber: 344
	jump IfThenElse_ILTE3_GreaterThan_True_edblock1069
.label IfThenElse_ILTE3_GreaterThan_True_eblock1068
	; LineNumber: 343
	; LineNumber: 344
	call Common_FAIL
	; LineNumber: 344
.label IfThenElse_ILTE3_GreaterThan_True_edblock1069
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
.label IfThenElse_ILTE4_GreaterThan_False_stringassigncpy1076
	load 	IfThenElse_ILTE4_GreaterThan_False_stringassignstr1075 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILTE4_GreaterThan_False_stringassigncpy1076
	; LineNumber: 351
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE4_GreaterThan_False_eblock1079
.label IfThenElse_ILTE4_GreaterThan_False_ctb1078 ;Main true block ;keep 
	; LineNumber: 350
	; LineNumber: 351
	call Common_FAIL
	; LineNumber: 351
	jump IfThenElse_ILTE4_GreaterThan_False_edblock1080
.label IfThenElse_ILTE4_GreaterThan_False_eblock1079
	; LineNumber: 350
	; LineNumber: 351
	call Common_PASS
	; LineNumber: 351
.label IfThenElse_ILTE4_GreaterThan_False_edblock1080
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
.label IfThenElse_ILTE5_GreaterThan_True_stringassigncpy1087
	load 	IfThenElse_ILTE5_GreaterThan_True_stringassignstr1086 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_ILTE5_GreaterThan_True_stringassigncpy1087
	; LineNumber: 358
	; Binary clause Simplified: LESSEQUAL
	jgt 	Vars_i2 	Vars_i1 	IfThenElse_ILTE5_GreaterThan_True_eblock1090
.label IfThenElse_ILTE5_GreaterThan_True_ctb1089 ;Main true block ;keep 
	; LineNumber: 357
	; LineNumber: 358
	call Common_PASS
	; LineNumber: 358
	jump IfThenElse_ILTE5_GreaterThan_True_edblock1091
.label IfThenElse_ILTE5_GreaterThan_True_eblock1090
	; LineNumber: 357
	; LineNumber: 358
	call Common_FAIL
	; LineNumber: 358
.label IfThenElse_ILTE5_GreaterThan_True_edblock1091
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
.label IfThenElse_AdvancedI1_stringassigncpy1098
	load 	IfThenElse_AdvancedI1_stringassignstr1097 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_AdvancedI1_stringassigncpy1098
	; LineNumber: 540
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI1_eblock1101
.label IfThenElse_AdvancedI1_localsuccess1105 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0xbb8 	IfThenElse_AdvancedI1_eblock1101
.label IfThenElse_AdvancedI1_ctb1100 ;Main true block ;keep 
	; LineNumber: 539
	; LineNumber: 540
	call Common_PASS
	; LineNumber: 540
	jump IfThenElse_AdvancedI1_edblock1102
.label IfThenElse_AdvancedI1_eblock1101
	; LineNumber: 539
	; LineNumber: 540
	call Common_FAIL
	; LineNumber: 540
.label IfThenElse_AdvancedI1_edblock1102
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
.label IfThenElse_AdvancedI2_stringassigncpy1110
	load 	IfThenElse_AdvancedI2_stringassignstr1109 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_AdvancedI2_stringassigncpy1110
	; LineNumber: 548
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI2_localfailed1117
	jump IfThenElse_AdvancedI2_ctb1112
.label IfThenElse_AdvancedI2_localfailed1117 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0x1388 	IfThenElse_AdvancedI2_eblock1113
.label IfThenElse_AdvancedI2_ctb1112 ;Main true block ;keep 
	; LineNumber: 547
	; LineNumber: 548
	call Common_FAIL
	; LineNumber: 548
	jump IfThenElse_AdvancedI2_edblock1114
.label IfThenElse_AdvancedI2_eblock1113
	; LineNumber: 547
	; LineNumber: 548
	call Common_PASS
	; LineNumber: 548
.label IfThenElse_AdvancedI2_edblock1114
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
.label IfThenElse_AdvancedI3_stringassigncpy1122
	load 	IfThenElse_AdvancedI3_stringassignstr1121 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_AdvancedI3_stringassigncpy1122
	; LineNumber: 555
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	Vars_i2 	IfThenElse_AdvancedI3_localfailed1129
	jump IfThenElse_AdvancedI3_ctb1124
.label IfThenElse_AdvancedI3_localfailed1129 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i3 	uint16:0xbb8 	IfThenElse_AdvancedI3_eblock1125
.label IfThenElse_AdvancedI3_localsuccess1130 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_i1 	uint16:0x1388 	IfThenElse_AdvancedI3_eblock1125
.label IfThenElse_AdvancedI3_ctb1124 ;Main true block ;keep 
	; LineNumber: 554
	; LineNumber: 555
	call Common_PASS
	; LineNumber: 555
	jump IfThenElse_AdvancedI3_edblock1126
.label IfThenElse_AdvancedI3_eblock1125
	; LineNumber: 554
	; LineNumber: 555
	call Common_FAIL
	; LineNumber: 555
.label IfThenElse_AdvancedI3_edblock1126
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
.label IfThenElse_AdvancedI4_stringassigncpy1135
	load 	IfThenElse_AdvancedI4_stringassignstr1134 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_AdvancedI4_stringassigncpy1135
	; LineNumber: 571
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	uint16:0x501 	IfThenElse_AdvancedI4_eblock1138
.label IfThenElse_AdvancedI4_localsuccess1142 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	uint16:0x551 	IfThenElse_AdvancedI4_eblock1138
.label IfThenElse_AdvancedI4_ctb1137 ;Main true block ;keep 
	; LineNumber: 570
	call Common_FAIL
	jump IfThenElse_AdvancedI4_edblock1139
.label IfThenElse_AdvancedI4_eblock1138
	; LineNumber: 570
	call Common_PASS
.label IfThenElse_AdvancedI4_edblock1139
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
.label IfThenElse_AdvancedI5_stringassigncpy1147
	load 	IfThenElse_AdvancedI5_stringassignstr1146 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	IfThenElse_AdvancedI5_stringassigncpy1147
	; LineNumber: 582
	; Binary clause Simplified: GREATER
	jlte 	Vars_i1 	uint16:0x700 	IfThenElse_AdvancedI5_localfailed1154
	jump IfThenElse_AdvancedI5_ctb1149
.label IfThenElse_AdvancedI5_localfailed1154 ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: LESS
	jgte 	Vars_i1 	uint16:0x400 	IfThenElse_AdvancedI5_eblock1150
.label IfThenElse_AdvancedI5_ctb1149 ;Main true block ;keep 
	; LineNumber: 581
	call Common_FAIL
	jump IfThenElse_AdvancedI5_edblock1151
.label IfThenElse_AdvancedI5_eblock1150
	; LineNumber: 581
	call Common_PASS
.label IfThenElse_AdvancedI5_edblock1151
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
	mov 	Common_zp 	#IfThenElse_Exec_stringassignstr1158
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
.label MulDiv_ByteMulByte01_stringassigncpy1161
	load 	MulDiv_ByteMulByte01_stringassignstr1160 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulByte01_stringassigncpy1161
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x87 	MulDiv_ByteMulByte01_eblock1164
.label MulDiv_ByteMulByte01_ctb1163 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump MulDiv_ByteMulByte01_edblock1165
.label MulDiv_ByteMulByte01_eblock1164
	; LineNumber: 11
	call Common_FAIL
.label MulDiv_ByteMulByte01_edblock1165
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
.label MulDiv_ByteMulBytePow202_stringassigncpy1172
	load 	MulDiv_ByteMulBytePow202_stringassignstr1171 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulBytePow202_stringassigncpy1172
	; LineNumber: 20
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x3c 	MulDiv_ByteMulBytePow202_eblock1175
.label MulDiv_ByteMulBytePow202_ctb1174 ;Main true block ;keep 
	; LineNumber: 19
	call Common_PASS
	jump MulDiv_ByteMulBytePow202_edblock1176
.label MulDiv_ByteMulBytePow202_eblock1175
	; LineNumber: 19
	call Common_FAIL
.label MulDiv_ByteMulBytePow202_edblock1176
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
.label MulDiv_ByteDivBytePow203_stringassigncpy1183
	load 	MulDiv_ByteDivBytePow203_stringassignstr1182 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteDivBytePow203_stringassigncpy1183
	; LineNumber: 27
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x19 	MulDiv_ByteDivBytePow203_eblock1186
.label MulDiv_ByteDivBytePow203_ctb1185 ;Main true block ;keep 
	; LineNumber: 26
	call Common_PASS
	jump MulDiv_ByteDivBytePow203_edblock1187
.label MulDiv_ByteDivBytePow203_eblock1186
	; LineNumber: 26
	call Common_FAIL
.label MulDiv_ByteDivBytePow203_edblock1187
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
.label MulDiv_ByteDivByte04_stringassigncpy1194
	load 	MulDiv_ByteDivByte04_stringassignstr1193 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteDivByte04_stringassigncpy1194
	; LineNumber: 37
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x14 	MulDiv_ByteDivByte04_eblock1197
.label MulDiv_ByteDivByte04_ctb1196 ;Main true block ;keep 
	; LineNumber: 36
	call Common_PASS
	jump MulDiv_ByteDivByte04_edblock1198
.label MulDiv_ByteDivByte04_eblock1197
	; LineNumber: 36
	call Common_FAIL
.label MulDiv_ByteDivByte04_edblock1198
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
.label MulDiv_ByteMulMul05_stringassigncpy1205
	load 	MulDiv_ByteMulMul05_stringassignstr1204 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulMul05_stringassigncpy1205
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x30 	MulDiv_ByteMulMul05_eblock1208
.label MulDiv_ByteMulMul05_ctb1207 ;Main true block ;keep 
	; LineNumber: 47
	call Common_PASS
	jump MulDiv_ByteMulMul05_edblock1209
.label MulDiv_ByteMulMul05_eblock1208
	; LineNumber: 47
	call Common_FAIL
.label MulDiv_ByteMulMul05_edblock1209
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
.label MulDiv_IntByteMul06_stringassigncpy1216
	load 	MulDiv_IntByteMul06_stringassignstr1215 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntByteMul06_stringassigncpy1216
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xbd6 	MulDiv_IntByteMul06_eblock1219
.label MulDiv_IntByteMul06_ctb1218 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump MulDiv_IntByteMul06_edblock1220
.label MulDiv_IntByteMul06_eblock1219
	; LineNumber: 57
	call Common_FAIL
.label MulDiv_IntByteMul06_edblock1220
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
.label MulDiv_IntMulPow07_stringassigncpy1227
	load 	MulDiv_IntMulPow07_stringassignstr1226 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntMulPow07_stringassigncpy1227
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xfc8 	MulDiv_IntMulPow07_eblock1230
.label MulDiv_IntMulPow07_ctb1229 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump MulDiv_IntMulPow07_edblock1231
.label MulDiv_IntMulPow07_eblock1230
	; LineNumber: 69
	call Common_FAIL
.label MulDiv_IntMulPow07_edblock1231
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
.label MulDiv_IntDivByte08_stringassigncpy1238
	load 	MulDiv_IntDivByte08_stringassignstr1237 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntDivByte08_stringassigncpy1238
	; LineNumber: 80
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x7b 	MulDiv_IntDivByte08_eblock1241
.label MulDiv_IntDivByte08_ctb1240 ;Main true block ;keep 
	; LineNumber: 79
	call Common_PASS
	jump MulDiv_IntDivByte08_edblock1242
.label MulDiv_IntDivByte08_eblock1241
	; LineNumber: 79
	call Common_FAIL
.label MulDiv_IntDivByte08_edblock1242
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
.label MulDiv_IntDivInt09_stringassigncpy1249
	load 	MulDiv_IntDivInt09_stringassignstr1248 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntDivInt09_stringassigncpy1249
	; LineNumber: 89
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x3c 	MulDiv_IntDivInt09_eblock1252
.label MulDiv_IntDivInt09_ctb1251 ;Main true block ;keep 
	; LineNumber: 88
	call Common_PASS
	jump MulDiv_IntDivInt09_edblock1253
.label MulDiv_IntDivInt09_eblock1252
	; LineNumber: 88
	call Common_FAIL
.label MulDiv_IntDivInt09_edblock1253
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
.label MulDiv_IntDivPow210_stringassigncpy1260
	load 	MulDiv_IntDivPow210_stringassignstr1259 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntDivPow210_stringassigncpy1260
	; LineNumber: 97
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3a98 	MulDiv_IntDivPow210_eblock1263
.label MulDiv_IntDivPow210_ctb1262 ;Main true block ;keep 
	; LineNumber: 96
	call Common_PASS
	jump MulDiv_IntDivPow210_edblock1264
.label MulDiv_IntDivPow210_eblock1263
	; LineNumber: 96
	call Common_FAIL
.label MulDiv_IntDivPow210_edblock1264
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
.label MulDiv_IntDivMix11_stringassigncpy1271
	load 	MulDiv_IntDivMix11_stringassignstr1270 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntDivMix11_stringassigncpy1271
	; LineNumber: 107
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x258 	MulDiv_IntDivMix11_eblock1274
.label MulDiv_IntDivMix11_ctb1273 ;Main true block ;keep 
	; LineNumber: 106
	call Common_PASS
	jump MulDiv_IntDivMix11_edblock1275
.label MulDiv_IntDivMix11_eblock1274
	; LineNumber: 106
	call Common_FAIL
.label MulDiv_IntDivMix11_edblock1275
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
.label MulDiv_IntDivMix12_stringassigncpy1282
	load 	MulDiv_IntDivMix12_stringassignstr1281 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntDivMix12_stringassigncpy1282
	; LineNumber: 116
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x64 	MulDiv_IntDivMix12_eblock1285
.label MulDiv_IntDivMix12_ctb1284 ;Main true block ;keep 
	; LineNumber: 115
	call Common_PASS
	jump MulDiv_IntDivMix12_edblock1286
.label MulDiv_IntDivMix12_eblock1285
	; LineNumber: 115
	call Common_FAIL
.label MulDiv_IntDivMix12_edblock1286
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
.label MulDiv_IntMulMix13_stringassigncpy1293
	load 	MulDiv_IntMulMix13_stringassignstr1292 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntMulMix13_stringassigncpy1293
	; LineNumber: 125
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e20 	MulDiv_IntMulMix13_eblock1296
.label MulDiv_IntMulMix13_ctb1295 ;Main true block ;keep 
	; LineNumber: 124
	call Common_PASS
	jump MulDiv_IntMulMix13_edblock1297
.label MulDiv_IntMulMix13_eblock1296
	; LineNumber: 124
	call Common_FAIL
.label MulDiv_IntMulMix13_edblock1297
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
.label MulDiv_IntMulInt14_stringassigncpy1304
	load 	MulDiv_IntMulInt14_stringassignstr1303 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntMulInt14_stringassigncpy1304
	; LineNumber: 135
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x64 	MulDiv_IntMulInt14_eblock1307
.label MulDiv_IntMulInt14_ctb1306 ;Main true block ;keep 
	; LineNumber: 134
	call Common_PASS
	jump MulDiv_IntMulInt14_edblock1308
.label MulDiv_IntMulInt14_eblock1307
	; LineNumber: 134
	call Common_FAIL
.label MulDiv_IntMulInt14_edblock1308
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
.label MulDiv_IntMulAdvancedMix15_stringassigncpy1315
	load 	MulDiv_IntMulAdvancedMix15_stringassignstr1314 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntMulAdvancedMix15_stringassigncpy1315
	; LineNumber: 148
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_IntMulAdvancedMix15_eblock1318
.label MulDiv_IntMulAdvancedMix15_ctb1317 ;Main true block ;keep 
	; LineNumber: 147
	call Common_PASS
	jump MulDiv_IntMulAdvancedMix15_edblock1319
.label MulDiv_IntMulAdvancedMix15_eblock1318
	; LineNumber: 147
	call Common_FAIL
.label MulDiv_IntMulAdvancedMix15_edblock1319
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
.label MulDiv_ByteMulAdvanced16_stringassigncpy1326
	load 	MulDiv_ByteMulAdvanced16_stringassignstr1325 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulAdvanced16_stringassigncpy1326
	; LineNumber: 158
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x12 	MulDiv_ByteMulAdvanced16_eblock1329
.label MulDiv_ByteMulAdvanced16_ctb1328 ;Main true block ;keep 
	; LineNumber: 157
	call Common_PASS
	jump MulDiv_ByteMulAdvanced16_edblock1330
.label MulDiv_ByteMulAdvanced16_eblock1329
	; LineNumber: 157
	call Common_FAIL
.label MulDiv_ByteMulAdvanced16_edblock1330
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
.label MulDiv_IntMulConst17_stringassigncpy1337
	load 	MulDiv_IntMulConst17_stringassignstr1336 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntMulConst17_stringassigncpy1337
	; LineNumber: 167
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x32 	MulDiv_IntMulConst17_eblock1340
.label MulDiv_IntMulConst17_ctb1339 ;Main true block ;keep 
	; LineNumber: 166
	call Common_PASS
	jump MulDiv_IntMulConst17_edblock1341
.label MulDiv_IntMulConst17_eblock1340
	; LineNumber: 166
	call Common_FAIL
.label MulDiv_IntMulConst17_edblock1341
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
.label MulDiv_IntCombConst18_stringassigncpy1348
	load 	MulDiv_IntCombConst18_stringassignstr1347 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntCombConst18_stringassigncpy1348
	; LineNumber: 178
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4e2 	MulDiv_IntCombConst18_eblock1351
.label MulDiv_IntCombConst18_ctb1350 ;Main true block ;keep 
	; LineNumber: 177
	call Common_PASS
	jump MulDiv_IntCombConst18_edblock1352
.label MulDiv_IntCombConst18_eblock1351
	; LineNumber: 177
	call Common_FAIL
.label MulDiv_IntCombConst18_edblock1352
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
.label MulDiv_IntCombConst19_stringassigncpy1359
	load 	MulDiv_IntCombConst19_stringassignstr1358 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntCombConst19_stringassigncpy1359
	; LineNumber: 187
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1388 	MulDiv_IntCombConst19_eblock1362
.label MulDiv_IntCombConst19_ctb1361 ;Main true block ;keep 
	; LineNumber: 186
	call Common_PASS
	jump MulDiv_IntCombConst19_edblock1363
.label MulDiv_IntCombConst19_eblock1362
	; LineNumber: 186
	call Common_FAIL
.label MulDiv_IntCombConst19_edblock1363
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
.label MulDiv_IntShift20_stringassigncpy1370
	load 	MulDiv_IntShift20_stringassignstr1369 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntShift20_stringassigncpy1370
	; LineNumber: 195
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x500 	MulDiv_IntShift20_eblock1373
.label MulDiv_IntShift20_ctb1372 ;Main true block ;keep 
	; LineNumber: 194
	call Common_PASS
	jump MulDiv_IntShift20_edblock1374
.label MulDiv_IntShift20_eblock1373
	; LineNumber: 194
	call Common_FAIL
.label MulDiv_IntShift20_edblock1374
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
.label MulDiv_IntShift21_stringassigncpy1381
	load 	MulDiv_IntShift21_stringassignstr1380 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntShift21_stringassigncpy1381
	; LineNumber: 204
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x0a 	MulDiv_IntShift21_eblock1384
.label MulDiv_IntShift21_ctb1383 ;Main true block ;keep 
	; LineNumber: 203
	call Common_PASS
	jump MulDiv_IntShift21_edblock1385
.label MulDiv_IntShift21_eblock1384
	; LineNumber: 203
	call Common_FAIL
.label MulDiv_IntShift21_edblock1385
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
.label MulDiv_Array1_stringassigncpy1392
	load 	MulDiv_Array1_stringassignstr1391 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Array1_stringassigncpy1392
	; LineNumber: 214
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x11 	MulDiv_Array1_eblock1395
.label MulDiv_Array1_ctb1394 ;Main true block ;keep 
	; LineNumber: 213
	call Common_PASS
	jump MulDiv_Array1_edblock1396
.label MulDiv_Array1_eblock1395
	; LineNumber: 213
	call Common_FAIL
.label MulDiv_Array1_edblock1396
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
.label MulDiv_Shift0_stringassigncpy1403
	load 	MulDiv_Shift0_stringassignstr1402 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift0_stringassigncpy1403
	; LineNumber: 225
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x14 	MulDiv_Shift0_eblock1406
.label MulDiv_Shift0_ctb1405 ;Main true block ;keep 
	; LineNumber: 224
	call Common_PASS
	jump MulDiv_Shift0_edblock1407
.label MulDiv_Shift0_eblock1406
	; LineNumber: 224
	call Common_FAIL
.label MulDiv_Shift0_edblock1407
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
.label MulDiv_Shift1_stringassigncpy1414
	load 	MulDiv_Shift1_stringassignstr1413 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift1_stringassigncpy1414
	; LineNumber: 236
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x28 	MulDiv_Shift1_eblock1417
.label MulDiv_Shift1_ctb1416 ;Main true block ;keep 
	; LineNumber: 235
	call Common_PASS
	jump MulDiv_Shift1_edblock1418
.label MulDiv_Shift1_eblock1417
	; LineNumber: 235
	call Common_FAIL
.label MulDiv_Shift1_edblock1418
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
.label MulDiv_Shift2_stringassigncpy1425
	load 	MulDiv_Shift2_stringassignstr1424 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift2_stringassigncpy1425
	; LineNumber: 247
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x0a 	MulDiv_Shift2_eblock1428
.label MulDiv_Shift2_ctb1427 ;Main true block ;keep 
	; LineNumber: 246
	call Common_PASS
	jump MulDiv_Shift2_edblock1429
.label MulDiv_Shift2_eblock1428
	; LineNumber: 246
	call Common_FAIL
.label MulDiv_Shift2_edblock1429
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
.label MulDiv_Shift4_stringassigncpy1436
	load 	MulDiv_Shift4_stringassignstr1435 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift4_stringassigncpy1436
	; LineNumber: 258
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x7d0 	MulDiv_Shift4_eblock1439
.label MulDiv_Shift4_ctb1438 ;Main true block ;keep 
	; LineNumber: 257
	call Common_PASS
	jump MulDiv_Shift4_edblock1440
.label MulDiv_Shift4_eblock1439
	; LineNumber: 257
	call Common_FAIL
.label MulDiv_Shift4_edblock1440
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
.label MulDiv_Shift5_stringassigncpy1447
	load 	MulDiv_Shift5_stringassignstr1446 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift5_stringassigncpy1447
	; LineNumber: 270
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1f40 	MulDiv_Shift5_eblock1450
.label MulDiv_Shift5_ctb1449 ;Main true block ;keep 
	; LineNumber: 269
	call Common_PASS
	jump MulDiv_Shift5_edblock1451
.label MulDiv_Shift5_eblock1450
	; LineNumber: 269
	call Common_FAIL
.label MulDiv_Shift5_edblock1451
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
.label MulDiv_Shift6_stringassigncpy1458
	load 	MulDiv_Shift6_stringassignstr1457 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_Shift6_stringassigncpy1458
	; LineNumber: 283
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	MulDiv_Shift6_eblock1461
.label MulDiv_Shift6_ctb1460 ;Main true block ;keep 
	; LineNumber: 282
	call Common_PASS
	jump MulDiv_Shift6_edblock1462
.label MulDiv_Shift6_eblock1461
	; LineNumber: 282
	call Common_FAIL
.label MulDiv_Shift6_edblock1462
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
.label MulDiv_IntByteMulR1_stringassigncpy1469
	load 	MulDiv_IntByteMulR1_stringassignstr1468 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntByteMulR1_stringassigncpy1469
	; LineNumber: 295
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0xdac 	MulDiv_IntByteMulR1_eblock1472
.label MulDiv_IntByteMulR1_ctb1471 ;Main true block ;keep 
	; LineNumber: 294
	call Common_PASS
	jump MulDiv_IntByteMulR1_edblock1473
.label MulDiv_IntByteMulR1_eblock1472
	; LineNumber: 294
	call Common_FAIL
.label MulDiv_IntByteMulR1_edblock1473
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
.label MulDiv_IntByteMulR2_stringassigncpy1480
	load 	MulDiv_IntByteMulR2_stringassignstr1479 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntByteMulR2_stringassigncpy1480
	; LineNumber: 305
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x1194 	MulDiv_IntByteMulR2_eblock1483
.label MulDiv_IntByteMulR2_ctb1482 ;Main true block ;keep 
	; LineNumber: 304
	call Common_PASS
	jump MulDiv_IntByteMulR2_edblock1484
.label MulDiv_IntByteMulR2_eblock1483
	; LineNumber: 304
	call Common_FAIL
.label MulDiv_IntByteMulR2_edblock1484
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
.label MulDiv_IntByteMulR3_stringassigncpy1491
	load 	MulDiv_IntByteMulR3_stringassignstr1490 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntByteMulR3_stringassigncpy1491
	; LineNumber: 316
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x320 	MulDiv_IntByteMulR3_eblock1494
.label MulDiv_IntByteMulR3_ctb1493 ;Main true block ;keep 
	; LineNumber: 315
	call Common_PASS
	jump MulDiv_IntByteMulR3_edblock1495
.label MulDiv_IntByteMulR3_eblock1494
	; LineNumber: 315
	call Common_FAIL
.label MulDiv_IntByteMulR3_edblock1495
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
.label MulDiv_IntByteMulR4_stringassigncpy1502
	load 	MulDiv_IntByteMulR4_stringassignstr1501 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_IntByteMulR4_stringassigncpy1502
	; LineNumber: 326
	; Binary clause Simplified: EQUALS
	jneq 	Vars_ri 	uint16:0x384 	MulDiv_IntByteMulR4_eblock1505
.label MulDiv_IntByteMulR4_ctb1504 ;Main true block ;keep 
	; LineNumber: 325
	call Common_PASS
	jump MulDiv_IntByteMulR4_edblock1506
.label MulDiv_IntByteMulR4_eblock1505
	; LineNumber: 325
	call Common_FAIL
.label MulDiv_IntByteMulR4_edblock1506
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
.label MulDiv_ByteMulBytePlus01_stringassigncpy1513
	load 	MulDiv_ByteMulBytePlus01_stringassignstr1512 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulBytePlus01_stringassigncpy1513
	; LineNumber: 336
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x91 	MulDiv_ByteMulBytePlus01_eblock1516
.label MulDiv_ByteMulBytePlus01_ctb1515 ;Main true block ;keep 
	; LineNumber: 335
	call Common_PASS
	jump MulDiv_ByteMulBytePlus01_edblock1517
.label MulDiv_ByteMulBytePlus01_eblock1516
	; LineNumber: 335
	call Common_FAIL
.label MulDiv_ByteMulBytePlus01_edblock1517
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
.label MulDiv_ByteMulBytePlus02_stringassigncpy1524
	load 	MulDiv_ByteMulBytePlus02_stringassignstr1523 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	MulDiv_ByteMulBytePlus02_stringassigncpy1524
	; LineNumber: 346
	; Binary clause Simplified: EQUALS
	jneq 	Vars_rb 	uint8:0x0f 	MulDiv_ByteMulBytePlus02_eblock1527
.label MulDiv_ByteMulBytePlus02_ctb1526 ;Main true block ;keep 
	; LineNumber: 345
	call Common_PASS
	jump MulDiv_ByteMulBytePlus02_edblock1528
.label MulDiv_ByteMulBytePlus02_eblock1527
	; LineNumber: 345
	call Common_FAIL
.label MulDiv_ByteMulBytePlus02_edblock1528
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
	mov 	Common_zp 	#MulDiv_Exec_stringassignstr1534
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
.label ForLoop_Test1_stringassigncpy1537
	load 	ForLoop_Test1_stringassignstr1536 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test1_stringassigncpy1537
	; LineNumber: 12
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test1_forloop1538
	; LineNumber: 9
	; LineNumber: 11
.label ForLoop_Test1_loopstart1539
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test1_forloop1538
.label ForLoop_Test1_loopdone1543 ;keep
.label ForLoop_Test1_loopend1540
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test1_eblock1546
.label ForLoop_Test1_ctb1545 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump ForLoop_Test1_edblock1547
.label ForLoop_Test1_eblock1546
	; LineNumber: 11
	call Common_FAIL
.label ForLoop_Test1_edblock1547
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
.label ForLoop_Test2_stringassigncpy1554
	load 	ForLoop_Test2_stringassignstr1553 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test2_stringassigncpy1554
	; LineNumber: 24
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test2_forloop1555
	; LineNumber: 21
	; LineNumber: 23
.label ForLoop_Test2_loopstart1556
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf1 	ForLoop_Test2_forloop1555
.label ForLoop_Test2_loopdone1560 ;keep
.label ForLoop_Test2_loopend1557
	; LineNumber: 24
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xf1 	ForLoop_Test2_eblock1563
.label ForLoop_Test2_ctb1562 ;Main true block ;keep 
	; LineNumber: 23
	call Common_PASS
	jump ForLoop_Test2_edblock1564
.label ForLoop_Test2_eblock1563
	; LineNumber: 23
	call Common_FAIL
.label ForLoop_Test2_edblock1564
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
.label ForLoop_Test3_stringassigncpy1571
	load 	ForLoop_Test3_stringassignstr1570 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test3_stringassigncpy1571
	; LineNumber: 36
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test3_forloop1572
	; LineNumber: 33
	; LineNumber: 35
.label ForLoop_Test3_loopstart1573
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test3_forloop1572
.label ForLoop_Test3_loopdone1577 ;keep
.label ForLoop_Test3_loopend1574
	; LineNumber: 36
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test3_eblock1580
.label ForLoop_Test3_ctb1579 ;Main true block ;keep 
	; LineNumber: 35
	call Common_PASS
	jump ForLoop_Test3_edblock1581
.label ForLoop_Test3_eblock1580
	; LineNumber: 35
	call Common_FAIL
.label ForLoop_Test3_edblock1581
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
.label ForLoop_Test4_stringassigncpy1588
	load 	ForLoop_Test4_stringassignstr1587 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test4_stringassigncpy1588
	; LineNumber: 48
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test4_forloop1589
	; LineNumber: 45
	; LineNumber: 47
.label ForLoop_Test4_loopstart1590
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e9 	ForLoop_Test4_forloop1589
.label ForLoop_Test4_loopdone1594 ;keep
.label ForLoop_Test4_loopend1591
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x3e9 	ForLoop_Test4_eblock1597
.label ForLoop_Test4_ctb1596 ;Main true block ;keep 
	; LineNumber: 47
	call Common_PASS
	jump ForLoop_Test4_edblock1598
.label ForLoop_Test4_eblock1597
	; LineNumber: 47
	call Common_FAIL
.label ForLoop_Test4_edblock1598
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
.label ForLoop_Test5_stringassigncpy1605
	load 	ForLoop_Test5_stringassignstr1604 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test5_stringassigncpy1605
	; LineNumber: 56
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 61
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test5_forloop1606
	; LineNumber: 58
	; LineNumber: 59
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 60
.label ForLoop_Test5_loopstart1607
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x04
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xf0 	ForLoop_Test5_forloop1606
.label ForLoop_Test5_loopdone1611 ;keep
.label ForLoop_Test5_loopend1608
	; LineNumber: 61
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x3c 	ForLoop_Test5_eblock1614
.label ForLoop_Test5_ctb1613 ;Main true block ;keep 
	; LineNumber: 60
	call Common_PASS
	jump ForLoop_Test5_edblock1615
.label ForLoop_Test5_eblock1614
	; LineNumber: 60
	call Common_FAIL
.label ForLoop_Test5_edblock1615
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
.label ForLoop_Test6_stringassigncpy1622
	load 	ForLoop_Test6_stringassignstr1621 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test6_stringassigncpy1622
	; LineNumber: 68
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 73
	mov 	Vars_i1 	uint8:0x00
.label ForLoop_Test6_forloop1623
	; LineNumber: 70
	; LineNumber: 71
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 72
.label ForLoop_Test6_loopstart1624
	; push
	add  	_r16_1 	Vars_i1 	uint16:0x04
	mov 	Vars_i1 	_r16_1
	jneq 	Vars_i1 	uint16:0x3e8 	ForLoop_Test6_forloop1623
.label ForLoop_Test6_loopdone1628 ;keep
.label ForLoop_Test6_loopend1625
	; LineNumber: 73
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0xfa 	ForLoop_Test6_eblock1631
.label ForLoop_Test6_ctb1630 ;Main true block ;keep 
	; LineNumber: 72
	call Common_PASS
	jump ForLoop_Test6_edblock1632
.label ForLoop_Test6_eblock1631
	; LineNumber: 72
	call Common_FAIL
.label ForLoop_Test6_edblock1632
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
.label ForLoop_Test7_stringassigncpy1639
	load 	ForLoop_Test7_stringassignstr1638 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test7_stringassigncpy1639
	; LineNumber: 80
	mov 	Vars_v2 	uint8:0x01
	; LineNumber: 85
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_Test7_forloop1640
	; LineNumber: 82
	; LineNumber: 83
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 84
.label ForLoop_Test7_loopstart1641
	; push
	add  	_r8_1 	Vars_v1 	Vars_v2
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_Test7_forloop1640
.label ForLoop_Test7_loopdone1645 ;keep
.label ForLoop_Test7_loopend1642
	; LineNumber: 85
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x06 	ForLoop_Test7_eblock1648
.label ForLoop_Test7_ctb1647 ;Main true block ;keep 
	; LineNumber: 84
	call Common_PASS
	jump ForLoop_Test7_edblock1649
.label ForLoop_Test7_eblock1648
	; LineNumber: 84
	call Common_FAIL
.label ForLoop_Test7_edblock1649
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
.label ForLoop_Test8_stringassigncpy1656
	load 	ForLoop_Test8_stringassignstr1655 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_Test8_stringassigncpy1656
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
.label ForLoop_Test8_forloop1657
	; LineNumber: 105
	; LineNumber: 106
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 107
.label ForLoop_Test8_loopstart1658
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x02
	mov 	Vars_v1 	_r8_1
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	Vars_v3 	_r8_1
	jneq 	Vars_v1 	_r8_1 	ForLoop_Test8_forloop1657
.label ForLoop_Test8_loopdone1662 ;keep
.label ForLoop_Test8_loopend1659
	; LineNumber: 108
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x0a 	ForLoop_Test8_eblock1665
.label ForLoop_Test8_ctb1664 ;Main true block ;keep 
	; LineNumber: 107
	call Common_PASS
	jump ForLoop_Test8_edblock1666
.label ForLoop_Test8_eblock1665
	; LineNumber: 107
	call Common_FAIL
.label ForLoop_Test8_edblock1666
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
.label ForLoop_TestBreak_stringassigncpy1673
	load 	ForLoop_TestBreak_stringassignstr1672 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_TestBreak_stringassigncpy1673
	; LineNumber: 117
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 123
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_TestBreak_forloop1674
	; LineNumber: 119
	; LineNumber: 120
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x05 	ForLoop_TestBreak_edblock1688
.label ForLoop_TestBreak_ctb1686 ;Main true block ;keep 
	; LineNumber: 119
	jump ForLoop_TestBreak_loopend1676
.label ForLoop_TestBreak_edblock1688
	; LineNumber: 121
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 122
.label ForLoop_TestBreak_loopstart1675
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_TestBreak_forloop1674
.label ForLoop_TestBreak_loopdone1690 ;keep
.label ForLoop_TestBreak_loopend1676
	; LineNumber: 123
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x05 	ForLoop_TestBreak_eblock1693
.label ForLoop_TestBreak_ctb1692 ;Main true block ;keep 
	; LineNumber: 122
	call Common_PASS
	jump ForLoop_TestBreak_edblock1694
.label ForLoop_TestBreak_eblock1693
	; LineNumber: 122
	call Common_FAIL
.label ForLoop_TestBreak_edblock1694
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
.label ForLoop_TestContinue_stringassigncpy1701
	load 	ForLoop_TestContinue_stringassignstr1700 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_TestContinue_stringassigncpy1701
	; LineNumber: 130
	mov 	Vars_v2 	uint8:0x00
	; LineNumber: 138
	mov 	Vars_v1 	uint8:0x00
.label ForLoop_TestContinue_forloop1702
	; LineNumber: 132
	; LineNumber: 133
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Vars_v1 	uint8:0x05 	ForLoop_TestContinue_edblock1716
.label ForLoop_TestContinue_ctb1714 ;Main true block ;keep 
	; LineNumber: 133
	jump ForLoop_TestContinue_loopstart1703
.label ForLoop_TestContinue_edblock1716
	; LineNumber: 136
	; push
	add  	_r8_1 	Vars_v2 	uint8:0x01
	mov 	Vars_v2 	_r8_1
	; LineNumber: 137
.label ForLoop_TestContinue_loopstart1703
	; push
	add  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x14 	ForLoop_TestContinue_forloop1702
.label ForLoop_TestContinue_loopdone1718 ;keep
.label ForLoop_TestContinue_loopend1704
	; LineNumber: 138
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0x05 	ForLoop_TestContinue_eblock1721
.label ForLoop_TestContinue_ctb1720 ;Main true block ;keep 
	; LineNumber: 137
	call Common_PASS
	jump ForLoop_TestContinue_edblock1722
.label ForLoop_TestContinue_eblock1721
	; LineNumber: 137
	call Common_FAIL
.label ForLoop_TestContinue_edblock1722
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
.label ForLoop_NegativeStep1_stringassigncpy1729
	load 	ForLoop_NegativeStep1_stringassignstr1728 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_NegativeStep1_stringassigncpy1729
	; LineNumber: 147
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep1_forloop1730
	; LineNumber: 145
	; LineNumber: 146
.label ForLoop_NegativeStep1_loopstart1731
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep1_forloop1730
.label ForLoop_NegativeStep1_loopdone1735 ;keep
.label ForLoop_NegativeStep1_loopend1732
	; LineNumber: 147
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep1_eblock1738
.label ForLoop_NegativeStep1_ctb1737 ;Main true block ;keep 
	; LineNumber: 146
	call Common_PASS
	jump ForLoop_NegativeStep1_edblock1739
.label ForLoop_NegativeStep1_eblock1738
	; LineNumber: 146
	call Common_FAIL
.label ForLoop_NegativeStep1_edblock1739
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
.label ForLoop_NegativeStep2_stringassigncpy1746
	load 	ForLoop_NegativeStep2_stringassignstr1745 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_NegativeStep2_stringassigncpy1746
	; LineNumber: 157
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep2_forloop1747
	; LineNumber: 155
	; LineNumber: 156
.label ForLoop_NegativeStep2_loopstart1748
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint16:0x100 	ForLoop_NegativeStep2_forloop1747
.label ForLoop_NegativeStep2_loopdone1752 ;keep
.label ForLoop_NegativeStep2_loopend1749
	; LineNumber: 157
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x00 	ForLoop_NegativeStep2_eblock1755
.label ForLoop_NegativeStep2_ctb1754 ;Main true block ;keep 
	; LineNumber: 156
	call Common_PASS
	jump ForLoop_NegativeStep2_edblock1756
.label ForLoop_NegativeStep2_eblock1755
	; LineNumber: 156
	call Common_FAIL
.label ForLoop_NegativeStep2_edblock1756
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
.label ForLoop_NegativeStep3_stringassigncpy1763
	load 	ForLoop_NegativeStep3_stringassignstr1762 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	ForLoop_NegativeStep3_stringassigncpy1763
	; LineNumber: 167
	mov 	Vars_v1 	uint8:0x14
.label ForLoop_NegativeStep3_forloop1764
	; LineNumber: 165
	; LineNumber: 166
.label ForLoop_NegativeStep3_loopstart1765
	; push
	add  	_r8_1 	Vars_v1 	uint8:0xfe
	mov 	Vars_v1 	_r8_1
	jneq 	Vars_v1 	uint8:0xfe 	ForLoop_NegativeStep3_forloop1764
.label ForLoop_NegativeStep3_loopdone1769 ;keep
.label ForLoop_NegativeStep3_loopend1766
	; LineNumber: 167
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0xfe 	ForLoop_NegativeStep3_eblock1772
.label ForLoop_NegativeStep3_ctb1771 ;Main true block ;keep 
	; LineNumber: 166
	call Common_PASS
	jump ForLoop_NegativeStep3_edblock1773
.label ForLoop_NegativeStep3_eblock1772
	; LineNumber: 166
	call Common_FAIL
.label ForLoop_NegativeStep3_edblock1773
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
	mov 	Common_zp 	#ForLoop_Exec_stringassignstr1779
	call Common_Initialise
	; LineNumber: 177
	call ForLoop_NegativeStep1
	; LineNumber: 179
	call ForLoop_NegativeStep2
	; LineNumber: 180
	call ForLoop_NegativeStep3
	; LineNumber: 182
	call ForLoop_Test1
	; LineNumber: 184
	call ForLoop_Test2
	; LineNumber: 186
	call ForLoop_Test3
	; LineNumber: 188
	call ForLoop_Test4
	; LineNumber: 190
	call ForLoop_Test5
	; LineNumber: 191
	call ForLoop_Test6
	; LineNumber: 192
	call ForLoop_Test7
	; LineNumber: 195
	call ForLoop_Test8
	; LineNumber: 199
	call ForLoop_TestBreak
	; LineNumber: 200
	call ForLoop_TestContinue
	; LineNumber: 201
	call Common_WaitABit
	; LineNumber: 202
	return
.label end_procedure_ForLoop_Exec
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
.label Strings_Test1_stringassigncpy1782
	load 	Strings_Test1_stringassignstr1781 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_Test1_stringassigncpy1782
	; LineNumber: 12
	; Binary clause Simplified: EQUALS
	jneq 	uint8:0x07 	uint8:0x07 	Strings_Test1_eblock1785
.label Strings_Test1_ctb1784 ;Main true block ;keep 
	; LineNumber: 11
	call Common_PASS
	jump Strings_Test1_edblock1786
.label Strings_Test1_eblock1785
	; LineNumber: 11
	call Common_FAIL
.label Strings_Test1_edblock1786
	; LineNumber: 13
	return
.label end_procedure_Strings_Test1
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
.label Strings_TestLst1_stringassigncpy1793
	load 	Strings_TestLst1_stringassignstr1792 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_TestLst1_stringassigncpy1793
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
	jneq 	_r8_1 	uint8:0x32 	Strings_TestLst1_eblock1796
.label Strings_TestLst1_ctb1795 ;Main true block ;keep 
	; LineNumber: 35
	call Common_PASS
	jump Strings_TestLst1_edblock1797
.label Strings_TestLst1_eblock1796
	; LineNumber: 35
	call Common_FAIL
.label Strings_TestLst1_edblock1797
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
.label Strings_TestLst2_stringassigncpy1804
	load 	Strings_TestLst2_stringassignstr1803 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_TestLst2_stringassigncpy1804
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
	jneq 	_r8_1 	uint8:0x4b 	Strings_TestLst2_eblock1807
.label Strings_TestLst2_ctb1806 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump Strings_TestLst2_edblock1808
.label Strings_TestLst2_eblock1807
	; LineNumber: 43
	call Common_FAIL
.label Strings_TestLst2_edblock1808
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
.label Strings_TestLst3_stringassigncpy1815
	load 	Strings_TestLst3_stringassignstr1814 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_TestLst3_stringassigncpy1815
	; LineNumber: 51
	; Assigning a string : Vars_strLst
	; push
	; push
	; push
	load 	Vars_strLst 	uint8:0x02 	_rp8_1
	mov 	_r8_2 	uint8:0x00
.label Strings_TestLst3_stringassigncpy1817
	load 	Strings_TestLst3_stringassignstr1816 	_r8_2 	_r8_1
	store 	_rp8_1 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_TestLst3_stringassigncpy1817
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
	jneq 	_r8_1 	uint8:0x45 	Strings_TestLst3_eblock1820
.label Strings_TestLst3_ctb1819 ;Main true block ;keep 
	; LineNumber: 53
	call Common_PASS
	jump Strings_TestLst3_edblock1821
.label Strings_TestLst3_eblock1820
	; LineNumber: 53
	call Common_FAIL
.label Strings_TestLst3_edblock1821
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
.label Strings_TestLst4_stringassigncpy1828
	load 	Strings_TestLst4_stringassignstr1827 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Strings_TestLst4_stringassigncpy1828
	; LineNumber: 61
	; Assigning a string : Vars_p1
	mov 	Vars_p1 	#Strings_TestLst4_stringassignstr1829
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; LoadPointer
	; push
	load 	Vars_p1 	uint8:0x01 	_r8_1
	jneq 	_r8_1 	uint8:0x59 	Strings_TestLst4_eblock1832
.label Strings_TestLst4_ctb1831 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Strings_TestLst4_edblock1833
.label Strings_TestLst4_eblock1832
	; LineNumber: 61
	call Common_FAIL
.label Strings_TestLst4_edblock1833
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
	mov 	Common_zp 	#Strings_Exec_stringassignstr1839
	call Common_Initialise
	; LineNumber: 73
	call Strings_Test1
	; LineNumber: 81
	call Strings_TestLst1
	; LineNumber: 82
	call Strings_TestLst2
	; LineNumber: 83
	call Strings_TestLst3
	; LineNumber: 84
	call Strings_TestLst4
	; LineNumber: 87
	call Common_WaitABit
	; LineNumber: 88
	return
.label end_procedure_Strings_Exec
	
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
.label BitOp_Test1_stringassigncpy1842
	load 	BitOp_Test1_stringassignstr1841 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test1_stringassigncpy1842
	; LineNumber: 8
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 9
	; push
	shl  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	; LineNumber: 10
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 11
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	BitOp_Test1_eblock1846
.label BitOp_Test1_ctb1845 ;Main true block ;keep 
	; LineNumber: 10
	call Common_PASS
	jump BitOp_Test1_edblock1847
.label BitOp_Test1_eblock1846
	; LineNumber: 10
	call Common_FAIL
.label BitOp_Test1_edblock1847
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
.label BitOp_Test2_stringassigncpy1854
	load 	BitOp_Test2_stringassignstr1853 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test2_stringassigncpy1854
	; LineNumber: 18
	mov 	Vars_v1 	uint8:0x04
	; LineNumber: 19
	; push
	shr  	_r8_1 	Vars_v1 	uint8:0x01
	mov 	Vars_v1 	_r8_1
	; LineNumber: 20
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 21
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x02 	BitOp_Test2_eblock1858
.label BitOp_Test2_ctb1857 ;Main true block ;keep 
	; LineNumber: 20
	call Common_PASS
	jump BitOp_Test2_edblock1859
.label BitOp_Test2_eblock1858
	; LineNumber: 20
	call Common_FAIL
.label BitOp_Test2_edblock1859
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
.label BitOp_Test3_stringassigncpy1866
	load 	BitOp_Test3_stringassignstr1865 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test3_stringassigncpy1866
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 33
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x04 	BitOp_Test3_eblock1870
.label BitOp_Test3_ctb1869 ;Main true block ;keep 
	; LineNumber: 32
	call Common_PASS
	jump BitOp_Test3_edblock1871
.label BitOp_Test3_eblock1870
	; LineNumber: 32
	call Common_FAIL
.label BitOp_Test3_edblock1871
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
.label BitOp_Test4_stringassigncpy1878
	load 	BitOp_Test4_stringassignstr1877 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test4_stringassigncpy1878
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x02 	BitOp_Test4_eblock1882
.label BitOp_Test4_ctb1881 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump BitOp_Test4_edblock1883
.label BitOp_Test4_eblock1882
	; LineNumber: 43
	call Common_FAIL
.label BitOp_Test4_edblock1883
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
.label BitOp_Test5_stringassigncpy1890
	load 	BitOp_Test5_stringassignstr1889 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test5_stringassigncpy1890
	; LineNumber: 51
	mov 	Vars_i1 	uint8:0x02
	; LineNumber: 52
	; push
	shl  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	; LineNumber: 53
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x04 	BitOp_Test5_eblock1894
.label BitOp_Test5_ctb1893 ;Main true block ;keep 
	; LineNumber: 53
	call Common_PASS
	jump BitOp_Test5_edblock1895
.label BitOp_Test5_eblock1894
	; LineNumber: 53
	call Common_FAIL
.label BitOp_Test5_edblock1895
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
.label BitOp_Test6_stringassigncpy1902
	load 	BitOp_Test6_stringassignstr1901 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test6_stringassigncpy1902
	; LineNumber: 61
	mov 	Vars_i1 	uint8:0x04
	; LineNumber: 62
	; push
	shr  	_r16_1 	Vars_i1 	uint16:0x01
	mov 	Vars_i1 	_r16_1
	; LineNumber: 63
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x02 	BitOp_Test6_eblock1906
.label BitOp_Test6_ctb1905 ;Main true block ;keep 
	; LineNumber: 63
	call Common_PASS
	jump BitOp_Test6_edblock1907
.label BitOp_Test6_eblock1906
	; LineNumber: 63
	call Common_FAIL
.label BitOp_Test6_edblock1907
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
.label BitOp_Test7_stringassigncpy1914
	load 	BitOp_Test7_stringassignstr1913 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test7_stringassigncpy1914
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 75
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x2000 	BitOp_Test7_eblock1918
.label BitOp_Test7_ctb1917 ;Main true block ;keep 
	; LineNumber: 74
	call Common_PASS
	jump BitOp_Test7_edblock1919
.label BitOp_Test7_eblock1918
	; LineNumber: 74
	call Common_FAIL
.label BitOp_Test7_edblock1919
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
.label BitOp_Test8_stringassigncpy1926
	load 	BitOp_Test8_stringassignstr1925 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test8_stringassigncpy1926
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 87
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x800 	BitOp_Test8_eblock1930
.label BitOp_Test8_ctb1929 ;Main true block ;keep 
	; LineNumber: 86
	call Common_PASS
	jump BitOp_Test8_edblock1931
.label BitOp_Test8_eblock1930
	; LineNumber: 86
	call Common_FAIL
.label BitOp_Test8_edblock1931
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
.label BitOp_Test9_stringassigncpy1938
	load 	BitOp_Test9_stringassignstr1937 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test9_stringassigncpy1938
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 98
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x4000 	BitOp_Test9_eblock1942
.label BitOp_Test9_ctb1941 ;Main true block ;keep 
	; LineNumber: 97
	call Common_PASS
	jump BitOp_Test9_edblock1943
.label BitOp_Test9_eblock1942
	; LineNumber: 97
	call Common_FAIL
.label BitOp_Test9_edblock1943
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
.label BitOp_Test10_stringassigncpy1950
	load 	BitOp_Test10_stringassignstr1949 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test10_stringassigncpy1950
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
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 109
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint16:0x1000 	BitOp_Test10_eblock1954
.label BitOp_Test10_ctb1953 ;Main true block ;keep 
	; LineNumber: 108
	call Common_PASS
	jump BitOp_Test10_edblock1955
.label BitOp_Test10_eblock1954
	; LineNumber: 108
	call Common_FAIL
.label BitOp_Test10_edblock1955
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
.label BitOp_Test11_stringassigncpy1962
	load 	BitOp_Test11_stringassignstr1961 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	BitOp_Test11_stringassigncpy1962
	; LineNumber: 117
	; push
	mov 	Vars_ir_p1 	uint8:0x10
	call Vars_IntegerReturn
	shl  	_r16_1 	Vars_IntegerReturn_fret 	uint16:0x02
	mov 	Vars_i1 	_r16_1
	; LineNumber: 118
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 119
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i1 	uint8:0x80 	BitOp_Test11_eblock1966
.label BitOp_Test11_ctb1965 ;Main true block ;keep 
	; LineNumber: 118
	call Common_PASS
	jump BitOp_Test11_edblock1967
.label BitOp_Test11_eblock1966
	; LineNumber: 118
	call Common_FAIL
.label BitOp_Test11_edblock1967
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
	mov 	Common_zp 	#BitOp_Exec_stringassignstr1973
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
	; ***********  Defining procedure : Functions_FnByte
	;    Procedure type : User-defined procedure
	; LineNumber: 6
.label Functions_FnByte_block1974
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
.label Functions_FnByteAdv_block1975
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
.label Functions_FnByteInt_block1976
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
.label Functions_FnInt1_block1977
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
.label Functions_FnInt2_block1978
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
.label Functions_FnInt3_block1979
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
.label Functions_Test1_stringassigncpy1982
	load 	Functions_Test1_stringassignstr1981 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test1_stringassigncpy1982
	; LineNumber: 44
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByte
	jneq 	Functions_FnByte_fret 	uint8:0x04 	Functions_Test1_eblock1985
.label Functions_Test1_ctb1984 ;Main true block ;keep 
	; LineNumber: 43
	call Common_PASS
	jump Functions_Test1_edblock1986
.label Functions_Test1_eblock1985
	; LineNumber: 43
	call Common_FAIL
.label Functions_Test1_edblock1986
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
.label Functions_Test2_stringassigncpy1993
	load 	Functions_Test2_stringassignstr1992 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test2_stringassigncpy1993
	; LineNumber: 51
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteAdv
	jneq 	Functions_FnByteAdv_fret 	uint8:0x32 	Functions_Test2_eblock1996
.label Functions_Test2_ctb1995 ;Main true block ;keep 
	; LineNumber: 50
	call Common_PASS
	jump Functions_Test2_edblock1997
.label Functions_Test2_eblock1996
	; LineNumber: 50
	call Common_FAIL
.label Functions_Test2_edblock1997
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
.label Functions_Test3_stringassigncpy2004
	load 	Functions_Test3_stringassignstr2003 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test3_stringassigncpy2004
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x02
	call Functions_FnByteInt
	jneq 	Functions_FnByteInt_fret 	uint8:0x90 	Functions_Test3_eblock2007
.label Functions_Test3_ctb2006 ;Main true block ;keep 
	; LineNumber: 57
	call Common_PASS
	jump Functions_Test3_edblock2008
.label Functions_Test3_eblock2007
	; LineNumber: 57
	call Common_FAIL
.label Functions_Test3_edblock2008
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
.label Functions_Test4_stringassigncpy2015
	load 	Functions_Test4_stringassignstr2014 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test4_stringassigncpy2015
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0xc8
	call Functions_FnInt1
	jneq 	Functions_FnInt1_fret 	uint16:0x190 	Functions_Test4_eblock2018
.label Functions_Test4_ctb2017 ;Main true block ;keep 
	; LineNumber: 63
	call Common_PASS
	jump Functions_Test4_edblock2019
.label Functions_Test4_eblock2018
	; LineNumber: 63
	call Common_FAIL
.label Functions_Test4_edblock2019
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
.label Functions_Test5_stringassigncpy2026
	load 	Functions_Test5_stringassignstr2025 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test5_stringassigncpy2026
	; LineNumber: 70
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt2
	jneq 	Functions_FnInt2_fret 	uint16:0x7da 	Functions_Test5_eblock2029
.label Functions_Test5_ctb2028 ;Main true block ;keep 
	; LineNumber: 69
	call Common_PASS
	jump Functions_Test5_edblock2030
.label Functions_Test5_eblock2029
	; LineNumber: 69
	call Common_FAIL
.label Functions_Test5_edblock2030
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
.label Functions_Test6_stringassigncpy2037
	load 	Functions_Test6_stringassignstr2036 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Functions_Test6_stringassigncpy2037
	; LineNumber: 76
	; Binary clause Simplified: EQUALS
	mov 	Functions_fn1 	uint8:0x0a
	call Functions_FnInt3
	jneq 	Functions_FnInt3_fret 	uint16:0xfb4 	Functions_Test6_eblock2040
.label Functions_Test6_ctb2039 ;Main true block ;keep 
	; LineNumber: 75
	call Common_PASS
	jump Functions_Test6_edblock2041
.label Functions_Test6_eblock2040
	; LineNumber: 75
	call Common_FAIL
.label Functions_Test6_edblock2041
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
	mov 	Common_zp 	#Functions_Exec_stringassignstr2047
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
.label Various_LoHi1_stringassigncpy2050
	load 	Various_LoHi1_stringassignstr2049 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_LoHi1_stringassigncpy2050
	; LineNumber: 29
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 30
	; Binary clause Simplified: EQUALS
	jneq 	<Vars_i1 	uint8:0x34 	Various_LoHi1_eblock2054
.label Various_LoHi1_ctb2053 ;Main true block ;keep 
	; LineNumber: 29
	call Common_PASS
	jump Various_LoHi1_edblock2055
.label Various_LoHi1_eblock2054
	; LineNumber: 29
	call Common_FAIL
.label Various_LoHi1_edblock2055
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
.label Various_LoHi2_stringassigncpy2062
	load 	Various_LoHi2_stringassignstr2061 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_LoHi2_stringassigncpy2062
	; LineNumber: 37
	; *** Inline procedure :Common_CR
	; LineNumber: 20
	; LineNumber: 21
	.asm
		ld a,0
		ld hl,0
		ld de,0
	
	.endasm
	; LineNumber: 26
	; *** End of inline procedure :Common_CR
	; LineNumber: 38
	; Binary clause Simplified: EQUALS
	jneq 	>Vars_i1 	uint8:0x12 	Various_LoHi2_eblock2066
.label Various_LoHi2_ctb2065 ;Main true block ;keep 
	; LineNumber: 37
	call Common_PASS
	jump Various_LoHi2_edblock2067
.label Various_LoHi2_eblock2066
	; LineNumber: 37
	call Common_FAIL
.label Various_LoHi2_edblock2067
	; LineNumber: 39
	return
.label end_procedure_Various_LoHi2
	
; //@endif
; //-------------------------------------------------------------------------------------------- MAIN PROGRAM 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_TestAutomaticOffpage
	;    Procedure type : User-defined procedure
	; LineNumber: 46
.label Various_TestAutomaticOffpage
	; LineNumber: 47
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_TestAutomaticOffpage_stringassigncpy2074
	load 	Various_TestAutomaticOffpage_stringassignstr2073 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_TestAutomaticOffpage_stringassigncpy2074
	; LineNumber: 48
	mov 	Vars_v1 	uint8:0x00
	; LineNumber: 49
	
; // automatically make offpage
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v1 	uint8:0x00 	Various_TestAutomaticOffpage_edblock2078
.label Various_TestAutomaticOffpage_ctb2076 ;Main true block ;keep 
	; LineNumber: 50
	; LineNumber: 50
	.asm
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	.endasm
	; LineNumber: 52
.label Various_TestAutomaticOffpage_edblock2078
	; LineNumber: 53
	call Common_PASS
	; LineNumber: 55
	return
.label end_procedure_Various_TestAutomaticOffpage
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
.label Various_TestAddress1_stringassigncpy2083
	load 	Various_TestAddress1_stringassignstr2082 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_TestAddress1_stringassigncpy2083
	; LineNumber: 61
	; Assigning memory location
	mov 	$8800 	uint8:0x80
	; LineNumber: 62
	; Binary clause Simplified: EQUALS
	jneq 	$8800 	uint8:0x80 	Various_TestAddress1_eblock2086
.label Various_TestAddress1_ctb2085 ;Main true block ;keep 
	; LineNumber: 61
	call Common_PASS
	jump Various_TestAddress1_edblock2087
.label Various_TestAddress1_eblock2086
	; LineNumber: 61
	call Common_FAIL
.label Various_TestAddress1_edblock2087
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
.label Various_TestAddress2_stringassigncpy2094
	load 	Various_TestAddress2_stringassignstr2093 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_TestAddress2_stringassigncpy2094
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
	jneq 	_r8_1 	uint8:0x90 	Various_TestAddress2_eblock2097
.label Various_TestAddress2_ctb2096 ;Main true block ;keep 
	; LineNumber: 68
	call Common_PASS
	jump Various_TestAddress2_edblock2098
.label Various_TestAddress2_eblock2097
	; LineNumber: 68
	call Common_FAIL
.label Various_TestAddress2_edblock2098
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
.label Various_TestAddress3_stringassigncpy2105
	load 	Various_TestAddress3_stringassignstr2104 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_TestAddress3_stringassigncpy2105
	; LineNumber: 74
	mov 	Vars_v1 	uint8:0x01
	; LineNumber: 75
	.asm
;bbb
	.endasm
	; LineNumber: 76
	; push
	mov 	_r8_1 	uint8:0xa0
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	store 	$8800 	Vars_v1 	_r8_1
	; LineNumber: 77
	; Binary clause Simplified: EQUALS
	; ::LoadVariable
	; push
	load 	$8800 	Vars_v1 	_r8_1
	jneq 	_r8_1 	uint8:0xa0 	Various_TestAddress3_eblock2108
.label Various_TestAddress3_ctb2107 ;Main true block ;keep 
	; LineNumber: 76
	call Common_PASS
	jump Various_TestAddress3_edblock2109
.label Various_TestAddress3_eblock2108
	; LineNumber: 76
	call Common_FAIL
.label Various_TestAddress3_edblock2109
	; LineNumber: 78
	return
.label end_procedure_Various_TestAddress3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryByte
	;    Procedure type : User-defined procedure
	; LineNumber: 82
.label Various_UnaryByte
	; LineNumber: 83
	mov 	Vars_v1 	uint8:0x02
	; LineNumber: 84
	; ::LoadVariable
	; push
	mov 	_r8_1 	Vars_v1
	sub _r8_1 	uint8:0x00 	_r8_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_v2 	_r8_1
	; LineNumber: 85
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryByte_stringassigncpy2116
	load 	Various_UnaryByte_stringassignstr2115 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_UnaryByte_stringassigncpy2116
	; LineNumber: 86
	; Binary clause Simplified: EQUALS
	jneq 	Vars_v2 	uint8:0xfe 	Various_UnaryByte_eblock2119
.label Various_UnaryByte_ctb2118 ;Main true block ;keep 
	; LineNumber: 85
	call Common_PASS
	jump Various_UnaryByte_edblock2120
.label Various_UnaryByte_eblock2119
	; LineNumber: 85
	call Common_FAIL
.label Various_UnaryByte_edblock2120
	; LineNumber: 87
	return
.label end_procedure_Various_UnaryByte
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger1
	;    Procedure type : User-defined procedure
	; LineNumber: 90
.label Various_UnaryInteger1
	; LineNumber: 91
	mov 	Vars_i1 	uint8:0x02
	; LineNumber: 92
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 93
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger1_stringassigncpy2127
	load 	Various_UnaryInteger1_stringassignstr2126 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_UnaryInteger1_stringassigncpy2127
	; LineNumber: 94
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xfffe 	Various_UnaryInteger1_eblock2130
.label Various_UnaryInteger1_ctb2129 ;Main true block ;keep 
	; LineNumber: 93
	call Common_PASS
	jump Various_UnaryInteger1_edblock2131
.label Various_UnaryInteger1_eblock2130
	; LineNumber: 93
	call Common_FAIL
.label Various_UnaryInteger1_edblock2131
	; LineNumber: 95
	return
.label end_procedure_Various_UnaryInteger1
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger2
	;    Procedure type : User-defined procedure
	; LineNumber: 98
.label Various_UnaryInteger2
	; LineNumber: 99
	mov 	Vars_i1 	uint16:0x100
	; LineNumber: 100
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 101
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger2_stringassigncpy2138
	load 	Various_UnaryInteger2_stringassignstr2137 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_UnaryInteger2_stringassigncpy2138
	; LineNumber: 102
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xff00 	Various_UnaryInteger2_eblock2141
.label Various_UnaryInteger2_ctb2140 ;Main true block ;keep 
	; LineNumber: 101
	call Common_PASS
	jump Various_UnaryInteger2_edblock2142
.label Various_UnaryInteger2_eblock2141
	; LineNumber: 101
	call Common_FAIL
.label Various_UnaryInteger2_edblock2142
	; LineNumber: 103
	return
.label end_procedure_Various_UnaryInteger2
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_UnaryInteger3
	;    Procedure type : User-defined procedure
	; LineNumber: 107
.label Various_UnaryInteger3
	; LineNumber: 108
	mov 	Vars_i1 	uint16:0x1ff
	; LineNumber: 109
	; ::LoadVariable
	; push
	mov 	_r16_1 	Vars_i1
	sub _r16_1 	uint16:0x00 	_r16_1
	; Calling storevariable on generic assign expression
	; VarNode StoreVariable
	mov 	Vars_i2 	_r16_1
	; LineNumber: 110
	; Assigning a string : Vars_text
	; push
	; push
	mov 	_r8_2 	uint8:0x00
.label Various_UnaryInteger3_stringassigncpy2149
	load 	Various_UnaryInteger3_stringassignstr2148 	_r8_2 	_r8_1
	store 	Vars_text 	_r8_2 	_r8_1
	add 	_r8_2 	_r8_2 	uint8:0x01
	jneq 	_r8_1 	uint8:0x00 	Various_UnaryInteger3_stringassigncpy2149
	; LineNumber: 111
	; Binary clause Simplified: EQUALS
	jneq 	Vars_i2 	uint16:0xfe01 	Various_UnaryInteger3_eblock2152
.label Various_UnaryInteger3_ctb2151 ;Main true block ;keep 
	; LineNumber: 110
	call Common_PASS
	jump Various_UnaryInteger3_edblock2153
.label Various_UnaryInteger3_eblock2152
	; LineNumber: 110
	call Common_FAIL
.label Various_UnaryInteger3_edblock2153
	; LineNumber: 112
	return
.label end_procedure_Various_UnaryInteger3
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Various_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 115
.label Various_Exec
	; LineNumber: 116
	; Assigning a string : Common_zp
	mov 	Common_zp 	#Various_Exec_stringassignstr2159
	call Common_Initialise
	; LineNumber: 118
	call Various_TestAutomaticOffpage
	; LineNumber: 129
	
; // Mul and div
	call Various_LoHi1
	; LineNumber: 130
	call Various_LoHi2
	; LineNumber: 135
	call Various_TestAddress1
	; LineNumber: 136
	call Various_TestAddress2
	; LineNumber: 137
	call Various_TestAddress3
	; LineNumber: 141
	call Various_UnaryByte
	; LineNumber: 142
	call Various_UnaryInteger1
	; LineNumber: 143
	call Various_UnaryInteger2
	; LineNumber: 144
	call Various_UnaryInteger3
	; LineNumber: 145
	call Common_WaitABit
	; LineNumber: 146
	return
.label end_procedure_Various_Exec
	
; // plus Simple
; // minus Simple
; // shl simple
; // shr simple
; // shl adv
	; NodeProcedureDecl -1
	; ***********  Defining procedure : LongTest_Exec
	;    Procedure type : User-defined procedure
	; LineNumber: 59
.label LongTest_Exec
	; LineNumber: 73
	
; // initialise everything
	call Common_WaitABit
	; LineNumber: 75
	return
.label end_procedure_LongTest_Exec
	
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
.label Unittests_Exec_while2162
.label Unittests_Exec_loopstart2166
	; Binary clause Simplified: EQUALS
	call Common_Status
	jneq 	Common_Status_fret 	uint8:0x00 	Unittests_Exec_edblock2165
.label Unittests_Exec_localsuccess2247 ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_isDone 	uint8:0x00 	Unittests_Exec_edblock2165
.label Unittests_Exec_ctb2163 ;Main true block ;keep 
	; LineNumber: 45
	; LineNumber: 46
	call Common_TestSuiteInit
	; LineNumber: 50
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0d 	Unittests_Exec_edblock2252
.label Unittests_Exec_ctb2250 ;Main true block ;keep 
	; LineNumber: 49
	
; // Pointer tests - the x86 needs a different set of pointer tests.
	call AdvancedMath_Exec
.label Unittests_Exec_edblock2252
	; LineNumber: 53
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x06 	Unittests_Exec_edblock2257
.label Unittests_Exec_ctb2255 ;Main true block ;keep 
	; LineNumber: 52
	call MulDiv_Exec
.label Unittests_Exec_edblock2257
	; LineNumber: 54
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x02 	Unittests_Exec_edblock2262
.label Unittests_Exec_ctb2260 ;Main true block ;keep 
	; LineNumber: 53
	call Strings_Exec
.label Unittests_Exec_edblock2262
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x03 	Unittests_Exec_edblock2267
.label Unittests_Exec_ctb2265 ;Main true block ;keep 
	; LineNumber: 54
	call Functions_Exec
.label Unittests_Exec_edblock2267
	; LineNumber: 56
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x04 	Unittests_Exec_edblock2272
.label Unittests_Exec_ctb2270 ;Main true block ;keep 
	; LineNumber: 55
	call CaseTest_Exec
.label Unittests_Exec_edblock2272
	; LineNumber: 57
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x05 	Unittests_Exec_edblock2277
.label Unittests_Exec_ctb2275 ;Main true block ;keep 
	; LineNumber: 56
	call Casts_Exec
.label Unittests_Exec_edblock2277
	; LineNumber: 58
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x01 	Unittests_Exec_edblock2282
.label Unittests_Exec_ctb2280 ;Main true block ;keep 
	; LineNumber: 57
	call ForLoop_Exec
.label Unittests_Exec_edblock2282
	; LineNumber: 64
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x08 	Unittests_Exec_edblock2287
.label Unittests_Exec_ctb2285 ;Main true block ;keep 
	; LineNumber: 63
	
; // Tripe doesn't have regs
	call BitOp_Exec
.label Unittests_Exec_edblock2287
	; LineNumber: 65
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x09 	Unittests_Exec_edblock2292
.label Unittests_Exec_ctb2290 ;Main true block ;keep 
	; LineNumber: 64
	call IfThenElse_Exec
.label Unittests_Exec_edblock2292
	; LineNumber: 66
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0a 	Unittests_Exec_edblock2297
.label Unittests_Exec_ctb2295 ;Main true block ;keep 
	; LineNumber: 65
	call IntegerTest_Exec
.label Unittests_Exec_edblock2297
	; LineNumber: 68
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x0b 	Unittests_Exec_edblock2302
.label Unittests_Exec_ctb2300 ;Main true block ;keep 
	; LineNumber: 67
	call Various_Exec
.label Unittests_Exec_edblock2302
	; LineNumber: 75
	; Binary clause Simplified: EQUALS
	jneq 	Unittests_currentTest 	uint8:0x00 	Unittests_Exec_edblock2307
.label Unittests_Exec_ctb2305 ;Main true block ;keep 
	; LineNumber: 74
	call LongTest_Exec
.label Unittests_Exec_edblock2307
	; LineNumber: 80
	
; //		if (currentTest=14) then Classes::Exec();
	; push
	add  	_r8_1 	Unittests_currentTest 	uint8:0x01
	mov 	Unittests_currentTest 	_r8_1
	; LineNumber: 82
	; Binary clause Simplified: GREATEREQUAL
	jlt 	Unittests_currentTest 	uint8:0x0f 	Unittests_Exec_edblock2312
.label Unittests_Exec_ctb2310 ;Main true block ;keep 
	; LineNumber: 82
	mov 	Unittests_isDone 	uint8:0x01
.label Unittests_Exec_edblock2312
	; LineNumber: 85
	jump Unittests_Exec_while2162
.label Unittests_Exec_edblock2165
.label Unittests_Exec_loopend2167
	; LineNumber: 86
	return
.label end_procedure_Unittests_Exec
	; NodeProcedureDecl -1
	; ***********  Defining procedure : TestResult
	;    Procedure type : User-defined procedure
	; LineNumber: 7
	; LineNumber: 6
	decl 	s 	ptr8:0
.label TestResult_block2314
.label TestResult
	; LineNumber: 8
	mov 	Text_p 	s
	call Text_Print
	; LineNumber: 9
	.asm
		ld hl, [s]
unit_tests_print_loop
		ld a, (hl)
		cp 0
		jr z, unit_tests_print_finished
unit_tests_print_retry
		call #bd2b
		jr nc, unit_tests_print_retry   ; Printer busy, must retry char
		inc hl
		jp unit_tests_print_loop
unit_tests_print_finished
	
	.endasm
	; LineNumber: 22
	return
.label end_procedure_TestResult
.gcode
.label block1
.label main_block_begin_
	; LineNumber: 26
	store 	$c000 	uint8:0x00 	uint8:0x00
	; LineNumber: 28
	call Unittests_Exec
	; LineNumber: 29
	; Binary clause Simplified: EQUALS
	jneq 	Common_cpc_unittests_status 	uint8:0x00 	MainProgram_eblock2317
.label MainProgram_ctb2316 ;Main true block ;keep 
	; LineNumber: 29
	; Assigning a string : s
	mov 	s 	#MainProgram_stringassignstr2324
	call TestResult
	jump MainProgram_edblock2318
.label MainProgram_eblock2317
	; LineNumber: 31
	; Assigning a string : s
	mov 	s 	#MainProgram_stringassignstr2326
	call TestResult
.label MainProgram_edblock2318
	; LineNumber: 35
	.asm
 
	cp l
	
	.endasm
	; LineNumber: 43
	
; //call(^0); 
; // Will unblock CAP32_WAITBREAK in Caprice
	.asm
end2327
	;nop
	jr end2327
	.endasm
	; LineNumber: 45
.label main_block_end_
	; End of program
	; Ending memory block at $4000
decl 	Format_Itos_fret 	uint8:0
decl 	_r16_1 	uint16:0
decl 	Vars_IntegerReturn_fret 	uint16:0
decl 	_r8_1 	uint8:0
decl 	Vars_ByteReturn_fret 	uint8:0
decl 	Common_Status_fret 	uint8:0
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
  decl  Common_Initialise_stringassignstr9  uint8:$D
  .uint8 $A 0
  decl  Common_Initialise_stringassignstr10  uint8:$D
  .uint8 $A 0
  decl  Common_Initialise_stringassignstr11  uint8:$D
  .uint8 $A 0
  decl  Common_PASS_stringassignstr14  uint8:$3a
  .uint8 $20 $50 $41 $53 $53 $D $A
  .uint8 0
  decl  Common_FAIL_stringassignstr16  uint8:$3a
  .uint8 $20 $46 $41 $49 $4c $D $A
  .uint8 0
  decl  CaseTest_Test1_stringassignstr27  uint8:$54
  .uint8 $31 $3a 0
  decl  _temp_var_casefb72  uint8:0
  decl  CaseTest_Test3_stringassignstr45  uint8:$54
  .uint8 $33 $3a 0
  decl  CaseTest_Exec_stringassignstr56  uint8:$43
  .uint8 $41 $53 $45 0
  decl  AdvancedMath_Advanced01_stringassignstr58  uint8:$30
  .uint8 $31 $3a 0
  decl  AdvancedMath_Advanced02_stringassignstr69  uint8:$30
  .uint8 $32 $3a 0
  decl  AdvancedMath_Advanced03_stringassignstr80  uint8:$30
  .uint8 $33 $3a 0
  decl  AdvancedMath_Advanced04_stringassignstr91  uint8:$30
  .uint8 $34 $3a 0
  decl  AdvancedMath_Advanced05_stringassignstr102  uint8:$30
  .uint8 $35 $3a 0
  decl  AdvancedMath_Advanced06_stringassignstr113  uint8:$30
  .uint8 $36 $3a 0
  decl  AdvancedMath_Advanced07_stringassignstr124  uint8:$30
  .uint8 $37 $3a 0
  decl  AdvancedMath_Advanced08_stringassignstr135  uint8:$30
  .uint8 $38 $3a 0
  decl  AdvancedMath_MulDivCombo1_stringassignstr146  uint8:$4d
  .uint8 $31 $3a 0
  decl  AdvancedMath_MulDivCombo2_stringassignstr157  uint8:$4d
  .uint8 $32 $3a 0
  decl  AdvancedMath_MulDivCombo3_stringassignstr168  uint8:$4d
  .uint8 $33 $3a 0
  decl  AdvancedMath_Exec_stringassignstr179  uint8:$41
  .uint8 $44 $56 $41 $4e $43 $45 $44
  .uint8 $20 $54 $45 $53 $54 $53 0
  decl  Casts_Test1_stringassignstr181  uint8:$54
  .uint8 $31 $3a 0
  decl  Casts_Test2_stringassignstr193  uint8:$54
  .uint8 $32 $3a 0
  decl  Casts_Test3_stringassignstr205  uint8:$54
  .uint8 $33 $3a 0
  decl  Casts_Test4_stringassignstr217  uint8:$54
  .uint8 $34 $3a 0
  decl  Casts_Test5_stringassignstr229  uint8:$54
  .uint8 $35 $3a 0
  decl  Casts_Test6_stringassignstr241  uint8:$54
  .uint8 $36 $3a 0
  decl  Casts_Test7_stringassignstr253  uint8:$54
  .uint8 $37 $3a 0
  decl  Casts_Test8_stringassignstr265  uint8:$54
  .uint8 $38 $3a 0
  decl  Casts_Test9_stringassignstr277  uint8:$54
  .uint8 $39 $3a 0
  decl  Casts_Test10_stringassignstr289  uint8:$54
  .uint8 $31 $30 $3a 0
  decl  Casts_Test11_stringassignstr301  uint8:$54
  .uint8 $31 $31 $3a 0
  decl  Casts_Test12_stringassignstr313  uint8:$54
  .uint8 $31 $32 $3a 0
  decl  Casts_Test13_stringassignstr325  uint8:$54
  .uint8 $31 $33 $3a 0
  decl  Casts_Test14_stringassignstr337  uint8:$54
  .uint8 $31 $34 $3a 0
  decl  Casts_Test15_stringassignstr349  uint8:$54
  .uint8 $31 $35 $3a 0
  decl  Casts_Test16_stringassignstr361  uint8:$54
  .uint8 $31 $36 $3a 0
  decl  Casts_Test17_stringassignstr373  uint8:$54
  .uint8 $31 $37 $3a 0
  decl  Casts_Test18_stringassignstr385  uint8:$54
  .uint8 $31 $38 $3a 0
  decl  Casts_Exec_stringassignstr397  uint8:$43
  .uint8 $41 $53 $54 $53 0
  decl  IntegerTest_T01_stringassignstr399  uint8:$30
  .uint8 $31 $3a 0
  decl  IntegerTest_T02_stringassignstr410  uint8:$30
  .uint8 $32 $3a 0
  decl  IntegerTest_T03_stringassignstr421  uint8:$30
  .uint8 $33 $3a 0
  decl  IntegerTest_T04_stringassignstr432  uint8:$30
  .uint8 $34 $3a 0
  decl  IntegerTest_T05_stringassignstr443  uint8:$30
  .uint8 $35 $3a 0
  decl  IntegerTest_T06_stringassignstr454  uint8:$30
  .uint8 $36 $3a 0
  decl  IntegerTest_T066_stringassignstr465  uint8:$30
  .uint8 $37 $3a 0
  decl  IntegerTest_T07_stringassignstr476  uint8:$30
  .uint8 $38 $3a 0
  decl  IntegerTest_T08_stringassignstr487  uint8:$30
  .uint8 $39 $3a 0
  decl  IntegerTest_T09_stringassignstr498  uint8:$31
  .uint8 $30 $3a 0
  decl  IntegerTest_T10_stringassignstr509  uint8:$31
  .uint8 $31 $3a 0
  decl  IntegerTest_T11_stringassignstr520  uint8:$31
  .uint8 $32 $3a 0
  decl  IntegerTest_T12_stringassignstr531  uint8:$31
  .uint8 $33 $3a 0
  decl  IntegerTest_TMIX1_stringassignstr542  uint8:$31
  .uint8 $34 $3a 0
  decl  IntegerTest_T15_stringassignstr553  uint8:$31
  .uint8 $35 $3a 0
  decl  IntegerTest_T16_stringassignstr564  uint8:$31
  .uint8 $35 $3a 0
  decl  IntegerTest_Exec_stringassignstr575  uint8:$49
  .uint8 $4e $54 $45 $47 $45 $52 $20
  .uint8 $54 $45 $53 $54 $53 0
  decl  IfThenElse_GT1_GreaterThan_True_stringassignstr577  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_GT2_GreaterThan_False_stringassignstr588  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_GT3_GreaterThan_False_stringassignstr599  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_GT4_GreaterThan_False_stringassignstr610  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_GT5_GreaterThan_True_stringassignstr621  uint8:$20
  .uint8 $20 $20 $47 $54 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_GTE1_GreaterEqual_True_stringassignstr632  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_GTE2_GreaterThan_False_stringassignstr643  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_GTE3_GreaterThan_True_stringassignstr654  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_GTE4_GreaterThan_False_stringassignstr665  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_GTE5_GreaterThan_True_stringassignstr676  uint8:$20
  .uint8 $20 $47 $54 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_LT1_LessThan_True_stringassignstr687  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LT2_LessThan_False_stringassignstr698  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_LT3_LessThan_False_stringassignstr709  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_LT4_LessThan_True_stringassignstr720  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_LT5_LessThan_False_stringassignstr731  uint8:$20
  .uint8 $20 $20 $4c $54 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_LTE1_LessEqual_True_stringassignstr742  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LTE1_LessEqual_True2_stringassignstr753  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_LTE2_LessThan_False_stringassignstr764  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_LTE3_LessThan_True_stringassignstr775  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_LTE4_LessThan_True_stringassignstr786  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_LTE5_LessThan_False_stringassignstr797  uint8:$20
  .uint8 $20 $4c $54 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_EQ1_EqualTo_True_stringassignstr808  uint8:$20
  .uint8 $20 $20 $45 $51 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_EQ2_EqualTo_False_stringassignstr819  uint8:$20
  .uint8 $20 $20 $45 $51 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_NEQ1_NotEqualTo_True_stringassignstr830  uint8:$20
  .uint8 $20 $4e $45 $51 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_NEQ2_NotEqualTo_False_stringassignstr841  uint8:$20
  .uint8 $20 $4e $45 $51 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_Advanced1_stringassignstr852  uint8:$20
  .uint8 $20 $41 $44 $56 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_Advanced2_stringassignstr864  uint8:$20
  .uint8 $20 $41 $44 $56 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGT1_GreaterThan_True_stringassignstr877  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_IGT2_GreaterThan_False_stringassignstr888  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGT3_GreaterThan_False_stringassignstr899  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_IGT4_GreaterThan_False_stringassignstr910  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_IGT5_GreaterThan_True_stringassignstr921  uint8:$20
  .uint8 $20 $20 $47 $49 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_IGTE1_GreaterEqual_True_stringassignstr932  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_IGTE2_GreaterThan_False_stringassignstr943  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_IGTE3_GreaterThan_True_stringassignstr954  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_IGTE4_GreaterThan_False_stringassignstr965  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_IGTE5_GreaterThan_True_stringassignstr976  uint8:$20
  .uint8 $20 $47 $49 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_ILT1_GreaterThan_True_stringassignstr987  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_ILT2_GreaterThan_False_stringassignstr998  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_ILT3_GreaterThan_False_stringassignstr1009  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_ILT4_GreaterThan_False_stringassignstr1020  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_ILT5_GreaterThan_True_stringassignstr1031  uint8:$20
  .uint8 $20 $20 $4c $49 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_ILTE1_GreaterEqual_True_stringassignstr1042  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_ILTE2_GreaterThan_False_stringassignstr1053  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_ILTE3_GreaterThan_True_stringassignstr1064  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_ILTE4_GreaterThan_False_stringassignstr1075  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $34 $3a
  .uint8 0
  decl  IfThenElse_ILTE5_GreaterThan_True_stringassignstr1086  uint8:$20
  .uint8 $20 $4c $49 $45 $20 $35 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI1_stringassignstr1097  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $31 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI2_stringassignstr1109  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $32 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI3_stringassignstr1121  uint8:$20
  .uint8 $20 $20 $41 $49 $20 $33 $3a
  .uint8 0
  decl  IfThenElse_AdvancedI4_stringassignstr1134  uint8:$20
  .uint8 $20 $20 $41 $49 $34 $3a 0
  decl  IfThenElse_AdvancedI5_stringassignstr1146  uint8:$20
  .uint8 $20 $20 $41 $49 $35 $3a 0
  decl  IfThenElse_Exec_stringassignstr1158  uint8:$49
  .uint8 $46 $20 $54 $45 $53 $54 $53
  .uint8 0
  decl  MulDiv_ByteMulByte01_stringassignstr1160  uint8:$30
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePow202_stringassignstr1171  uint8:$30
  .uint8 $32 $3a 0
  decl  MulDiv_ByteDivBytePow203_stringassignstr1182  uint8:$30
  .uint8 $33 $3a 0
  decl  MulDiv_ByteDivByte04_stringassignstr1193  uint8:$30
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulMul05_stringassignstr1204  uint8:$30
  .uint8 $35 $3a 0
  decl  MulDiv_IntByteMul06_stringassignstr1215  uint8:$30
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulPow07_stringassignstr1226  uint8:$30
  .uint8 $37 $3a 0
  decl  MulDiv_IntDivByte08_stringassignstr1237  uint8:$30
  .uint8 $38 $3a 0
  decl  MulDiv_IntDivInt09_stringassignstr1248  uint8:$30
  .uint8 $39 $3a 0
  decl  MulDiv_IntDivPow210_stringassignstr1259  uint8:$31
  .uint8 $30 $3a 0
  decl  MulDiv_IntDivMix11_stringassignstr1270  uint8:$31
  .uint8 $31 $3a 0
  decl  MulDiv_IntDivMix12_stringassignstr1281  uint8:$31
  .uint8 $32 $3a 0
  decl  MulDiv_IntMulMix13_stringassignstr1292  uint8:$31
  .uint8 $33 $3a 0
  decl  MulDiv_IntMulInt14_stringassignstr1303  uint8:$31
  .uint8 $34 $3a 0
  decl  MulDiv_IntMulAdvancedMix15_stringassignstr1314  uint8:$31
  .uint8 $35 $3a 0
  decl  MulDiv_ByteMulAdvanced16_stringassignstr1325  uint8:$31
  .uint8 $36 $3a 0
  decl  MulDiv_IntMulConst17_stringassignstr1336  uint8:$31
  .uint8 $37 $3a 0
  decl  MulDiv_IntCombConst18_stringassignstr1347  uint8:$31
  .uint8 $38 $3a 0
  decl  MulDiv_IntCombConst19_stringassignstr1358  uint8:$31
  .uint8 $39 $3a 0
  decl  MulDiv_IntShift20_stringassignstr1369  uint8:$32
  .uint8 $30 $3a 0
  decl  MulDiv_IntShift21_stringassignstr1380  uint8:$32
  .uint8 $31 $3a 0
  decl  MulDiv_Array1_stringassignstr1391  uint8:$41
  .uint8 $31 $3a 0
  decl  MulDiv_Shift0_stringassignstr1402  uint8:$53
  .uint8 $31 $3a 0
  decl  MulDiv_Shift1_stringassignstr1413  uint8:$53
  .uint8 $32 $3a 0
  decl  MulDiv_Shift2_stringassignstr1424  uint8:$53
  .uint8 $33 $3a 0
  decl  MulDiv_Shift4_stringassignstr1435  uint8:$53
  .uint8 $34 $3a 0
  decl  MulDiv_Shift5_stringassignstr1446  uint8:$53
  .uint8 $35 $3a 0
  decl  MulDiv_Shift6_stringassignstr1457  uint8:$53
  .uint8 $36 $3a 0
  decl  MulDiv_IntByteMulR1_stringassignstr1468  uint8:$52
  .uint8 $31 $3a 0
  decl  MulDiv_IntByteMulR2_stringassignstr1479  uint8:$52
  .uint8 $32 $3a 0
  decl  MulDiv_IntByteMulR3_stringassignstr1490  uint8:$52
  .uint8 $33 $3a 0
  decl  MulDiv_IntByteMulR4_stringassignstr1501  uint8:$52
  .uint8 $34 $3a 0
  decl  MulDiv_ByteMulBytePlus01_stringassignstr1512  uint8:$42
  .uint8 $31 $3a 0
  decl  MulDiv_ByteMulBytePlus02_stringassignstr1523  uint8:$42
  .uint8 $32 $3a 0
  decl  MulDiv_Exec_stringassignstr1534  uint8:$4d
  .uint8 $55 $4c $44 $49 $56 $20 $54
  .uint8 $45 $53 $54 $53 0
  decl  ForLoop_Test1_stringassignstr1536  uint8:$54
  .uint8 $31 $3a 0
  decl  ForLoop_Test2_stringassignstr1553  uint8:$54
  .uint8 $32 $3a 0
  decl  ForLoop_Test3_stringassignstr1570  uint8:$54
  .uint8 $33 $3a 0
  decl  ForLoop_Test4_stringassignstr1587  uint8:$54
  .uint8 $34 $3a 0
  decl  ForLoop_Test5_stringassignstr1604  uint8:$54
  .uint8 $35 $3a 0
  decl  ForLoop_Test6_stringassignstr1621  uint8:$54
  .uint8 $35 $3a 0
  decl  ForLoop_Test7_stringassignstr1638  uint8:$54
  .uint8 $36 $3a 0
  decl  ForLoop_Test8_stringassignstr1655  uint8:$54
  .uint8 $37 $3a 0
  decl  ForLoop_TestBreak_stringassignstr1672  uint8:$54
  .uint8 $42 $3a 0
  decl  ForLoop_TestContinue_stringassignstr1700  uint8:$54
  .uint8 $43 $3a 0
  decl  ForLoop_NegativeStep1_stringassignstr1728  uint8:$4e
  .uint8 $31 $3a 0
  decl  ForLoop_NegativeStep2_stringassignstr1745  uint8:$4e
  .uint8 $32 $3a 0
  decl  ForLoop_NegativeStep3_stringassignstr1762  uint8:$4e
  .uint8 $33 $3a 0
  decl  ForLoop_Exec_stringassignstr1779  uint8:$46
  .uint8 $4f $52 $20 $4c $4f $4f $50
  .uint8 0
  decl  Strings_Test1_stringassignstr1781  uint8:$54
  .uint8 $31 $3a 0
  decl  Strings_TestLst1_stringassignstr1792  uint8:$54
  .uint8 $34 $3a 0
  decl  Strings_TestLst2_stringassignstr1803  uint8:$54
  .uint8 $35 $3a 0
  decl  Strings_TestLst3_stringassignstr1814  uint8:$54
  .uint8 $36 $3a 0
  decl  Strings_TestLst3_stringassignstr1816  uint8:$44
  .uint8 $45 0
  decl  Strings_TestLst4_stringassignstr1827  uint8:$54
  .uint8 $37 $3a 0
  decl  Strings_TestLst4_stringassignstr1829  uint8:$4d
  .uint8 $59 0
  decl  Strings_Exec_stringassignstr1839  uint8:$53
  .uint8 $54 $52 $49 $4e $47 $53 0
  decl  BitOp_Test1_stringassignstr1841  uint8:$54
  .uint8 $31 $3a 0
  decl  BitOp_Test2_stringassignstr1853  uint8:$54
  .uint8 $32 $3a 0
  decl  BitOp_Test3_stringassignstr1865  uint8:$54
  .uint8 $33 0
  decl  BitOp_Test4_stringassignstr1877  uint8:$54
  .uint8 $34 0
  decl  BitOp_Test5_stringassignstr1889  uint8:$54
  .uint8 $35 $3a 0
  decl  BitOp_Test6_stringassignstr1901  uint8:$54
  .uint8 $36 $3a 0
  decl  BitOp_Test7_stringassignstr1913  uint8:$54
  .uint8 $37 $3a 0
  decl  BitOp_Test8_stringassignstr1925  uint8:$54
  .uint8 $38 $3a 0
  decl  BitOp_Test9_stringassignstr1937  uint8:$54
  .uint8 $39 $3a 0
  decl  BitOp_Test10_stringassignstr1949  uint8:$54
  .uint8 $31 $30 $3a 0
  decl  BitOp_Test11_stringassignstr1961  uint8:$54
  .uint8 $31 $31 $3a 0
  decl  BitOp_Exec_stringassignstr1973  uint8:$42
  .uint8 $49 $54 $4f $50 0
  decl  Functions_Test1_stringassignstr1981  uint8:$54
  .uint8 $31 $3a 0
  decl  Functions_Test2_stringassignstr1992  uint8:$54
  .uint8 $32 $3a 0
  decl  Functions_Test3_stringassignstr2003  uint8:$54
  .uint8 $33 $3a 0
  decl  Functions_Test4_stringassignstr2014  uint8:$54
  .uint8 $34 $3a 0
  decl  Functions_Test5_stringassignstr2025  uint8:$54
  .uint8 $35 $3a 0
  decl  Functions_Test6_stringassignstr2036  uint8:$54
  .uint8 $36 $3a 0
  decl  Functions_Exec_stringassignstr2047  uint8:$46
  .uint8 $55 $4e $43 $54 $49 $4f $4e
  .uint8 $53 0
  decl  Various_LoHi1_stringassignstr2049  uint8:$54
  .uint8 $32 $3a 0
  decl  Various_LoHi2_stringassignstr2061  uint8:$54
  .uint8 $33 $3a 0
  decl  Various_TestAutomaticOffpage_stringassignstr2073  uint8:$54
  .uint8 $50 $41 $47 $45 $3a 0
  decl  Various_TestAddress1_stringassignstr2082  uint8:$41
  .uint8 $31 $3a 0
  decl  Various_TestAddress2_stringassignstr2093  uint8:$41
  .uint8 $32 $3a 0
  decl  Various_TestAddress3_stringassignstr2104  uint8:$41
  .uint8 $33 $3a 0
  decl  Various_UnaryByte_stringassignstr2115  uint8:$55
  .uint8 $31 $3a 0
  decl  Various_UnaryInteger1_stringassignstr2126  uint8:$55
  .uint8 $32 $3a 0
  decl  Various_UnaryInteger2_stringassignstr2137  uint8:$55
  .uint8 $33 $3a 0
  decl  Various_UnaryInteger3_stringassignstr2148  uint8:$55
  .uint8 $34 $3a 0
  decl  Various_Exec_stringassignstr2159  uint8:$56
  .uint8 $41 $52 $49 $4f $55 $53 0
  decl  MainProgram_stringassignstr2324  uint8:$53
  .uint8 $55 $43 $43 $45 $53 $53 $D
  .uint8 $A 0
  decl  MainProgram_stringassignstr2326  uint8:$46
  .uint8 $41 $49 $4c $55 $52 $45 $D
  .uint8 $A 0
.label EndBlock4000
const  NIL  uint8:0x00
const  STOP_MUSIC  uint8:0x00
const  VARS_ADDR  uint8:0x8800
const  PLAY_MUSIC  uint8:0x00
const  SCREEN  uint8:0xc000
const  NADA  uint8:0x00
const  TRUE  uint8:0x01
const  UNITTESTS_NOTESTS  uint8:0x0f
const  VARS_NN  uint8:0x0a
const  INIT_MUSIC  uint8:0x00
const  FALSE  uint8:0x00
