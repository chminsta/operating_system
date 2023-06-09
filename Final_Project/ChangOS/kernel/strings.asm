; ==================================================================
; strings.asm
; ==================================================================
; The Wagner Operating System 
; Written by David Wagner
;
; Strings
; ==================================================================


;*****************************************************************
; Strings
;*****************************************************************

	hello_str db			"Hello!", 0
	press_any_key_str db 		"Press a key.....", 0
	welcome_line1_str db		"Welcome to the Chang OS", 0
	welcome_line2_str db		"Written by ChangMinLee", 0
	quit_or_reboot_str db		"Q)uit or R)eboot", 0
	menu db				"1) Quiz time 2) keyboard game",0
	q1 db			"Q1. Who is the most Handsome OS professor in the world?",0
	q1a1 db				"1) David Wagner",0
	q1a2 db				"2) Oliver Wagner",0
	q1a3 db				"3) Peter Wagner",0
	q1a4 db				"4) James Wagner",0

	q2 db			"Q2. What is chatbot name of openai",0
	q2a1 db				"1) ChatPPT",0
	q2a2 db				"2) ChatGPT",0
	q2a3 db				"3) ChatBPT",0
	q2a4 db				"4) ChatCPT",0

	q3 db			"Q3. What animal stands for HanYang University?",0
	q3a1 db				"1) Tiger",0
	q3a2 db				"2) Cat",0
	q3a3 db				"3) Lion",0
	q3a4 db				"4) Dog",0
	
	q4 db			"Q4. What is OS?",0
	q4a1 db				"1) One Star",0
	q4a2 db				"2) Olive Soup",0
	q4a3 db				"3) Odd Segment",0
	q4a4 db				"4) Operating System",0
	unvalid db			" ",0
	correct db			"That's correct!",0
	wrong db			"Wrong answer!",0
	score db			"Your score is ",0
	end db				"the end!",0
	
	kgstart db			"Keyboard game: press the following key!",0

	a db 				"a",0
	s db 				"s",0
	d db 				"d",0
	f db 				"f",0
	g db 				"g",0
	h db 				"h",0
;*****************************************************************
; Procedure to get the length of a string
; ------------------------------------------------------------------
; IN:  [stringToPrint]
; OUT: [stringLength] (stringLength is also stored in cx)
;*****************************************************************

get_string_length:
	mov si, [stringToPrint]
	mov cx, 0
test_char_in_get_string_length:
	lodsb
	inc cx
	cmp al,0
	jne test_char_in_get_string_length

	dec cx
	mov [stringLength], cx
	ret

;*****************************************************************
; Procedures to print strings
;*****************************************************************

print_string_hello:
	mov word [stringToPrint], hello_str
	call print_string
	ret

print_string_press_any_key:
	mov word [stringToPrint], press_any_key_str
	call print_string
	ret

print_string_welcome_line1:
	mov word [stringToPrint], welcome_line1_str
	call print_string
	ret

print_string_welcome_line2:
	mov word [stringToPrint], welcome_line2_str
	call print_string
	ret

print_string_quit_or_reboot:
	mov word [stringToPrint], quit_or_reboot_str
	call print_string
	ret
print_q1:
	mov word [stringToPrint], q1
	call print_string
	ret
print_q1a1:
	mov word [stringToPrint], q1a1
	call print_string
	ret
print_q1a2:
	mov word [stringToPrint], q1a2
	call print_string
	ret
print_q1a3:
	mov word [stringToPrint], q1a3
	call print_string
	ret
print_q1a4:
	mov word [stringToPrint], q1a4
	call print_string
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
print_q2:
	mov word [stringToPrint], q2
	call print_string
	ret
print_q2a1:
	mov word [stringToPrint], q2a1
	call print_string
	ret
print_q2a2:
	mov word [stringToPrint], q2a2
	call print_string
	ret
print_q2a3:
	mov word [stringToPrint], q2a3
	call print_string
	ret
print_q2a4:
	mov word [stringToPrint], q2a4
	call print_string
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_q3:
	mov word [stringToPrint], q3
	call print_string
	ret
print_q3a1:
	mov word [stringToPrint], q3a1
	call print_string
	ret
print_q3a2:
	mov word [stringToPrint], q3a2
	call print_string
	ret
print_q3a3:
	mov word [stringToPrint], q3a3
	call print_string
	ret
print_q3a4:
	mov word [stringToPrint], q3a4
	call print_string
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_q4:
	mov word [stringToPrint], q4
	call print_string
	ret
print_q4a1:
	mov word [stringToPrint], q4a1
	call print_string
	ret
print_q4a2:
	mov word [stringToPrint], q3a2
	call print_string
	ret
print_q4a3:
	mov word [stringToPrint], q4a3
	call print_string
	ret
print_q4a4:
	mov word [stringToPrint], q4a4
	call print_string
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print_correct:
	mov word [stringToPrint], correct
	call print_string
	inc byte [totalScore]
	call print_newline
	call print_score
	ret
print_wrong:
	mov word [stringToPrint], wrong
	call print_string
	ret
print_unvalid:
	mov word [stringToPrint], unvalid
	call print_string
	ret
print_score:
	mov word [stringToPrint], score 
	call print_string
	call print_total_score
	ret
	
print_end:
	mov word [stringToPrint], end
	call print_string
	call print_newline
	call print_score
	call print_newline
	call print_string_quit_or_reboot
	ret
	
print_menu:
	mov word [stringToPrint], menu
	call print_string
	ret
	
print_keyboardgame:
	mov word [stringToPrint], kgstart
	call print_string
	ret
print_a:
	mov word [stringToPrint], a
	call print_string
	ret
print_s:
	mov word [stringToPrint], s
	call print_string
	ret
print_d:
	mov word [stringToPrint], d
	call print_string
	ret
print_f:
	mov word [stringToPrint], f
	call print_string
	ret
print_g:
	mov word [stringToPrint], g
	call print_string
	ret
print_h:
	mov word [stringToPrint], h
	call print_string
	ret
