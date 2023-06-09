;*****************************************************************
; main.asm
;*****************************************************************
; The Wagner Operating System Success Message
; Written by David Wagner
; 
; This is the main procedure in the kernel
; After initilizing the kernel, everything else starts here
; 
;*****************************************************************



;*****************************************************************
; Main Kernel Code
;*****************************************************************


kernel_main:
	call print_newline
	call print_string_hello
	call print_newline
	call print_string_press_any_key
	call bios_wait_for_key
	call syscall_clear_screen

	mov byte [boxTop], 0
	mov byte [boxLeft], 0
	mov byte [boxWidth], 40
	mov byte [boxHeight], 5
	mov byte [totalScore], 0
	call print_box
	call enter_box
	call print_welcome_message
	call print_newline
	call print_newline
	call print_menu
	call syscall_get_keypress
	cmp byte [keyPressed], '1'
	je quest1
	cmp byte [keyPressed], '2'
	jne kernel_main
	jmp keyboardgame
		

kernel_loop:
quest1: 
	call syscall_clear_screen
	call print_q1
	call print_newline
	call print_q1a1
	call print_newline
	call print_q1a2
	call print_newline
	call print_q1a3
	call print_newline
	call print_q1a4
	call print_newline
	call syscall_get_keypress
	call print_newline
	

	cmp byte [keyPressed], '1'
	jne wrong1
	call print_correct
	jmp quest2  		; q1: answer is 1
wrong1:	call print_wrong 
	

quest2:	call syscall_clear_screen
	call print_q2
	call print_newline
	call print_q2a1
	call print_newline
	call print_q2a2
	call print_newline
	call print_q2a3
	call print_newline
	call print_q2a4
	call print_newline
	call syscall_get_keypress
	call print_newline

	cmp byte [keyPressed], '2'
	jne wrong1
	call print_correct
	jmp quest3  		; q2: answer is 2
wrong2:	call print_wrong 
	
quest3:	call syscall_clear_screen
	call print_q3
	call print_newline
	call print_q3a1
	call print_newline
	call print_q3a2
	call print_newline
	call print_q3a3
	call print_newline
	call print_q3a4
	call print_newline
	call syscall_get_keypress
	call print_newline

	cmp byte [keyPressed], '3'
	jne wrong3
	call print_correct
	jmp quest4  		; q3: answer is 3
wrong3:	call print_wrong 

quest4:	call syscall_clear_screen
	call print_q4
	call print_newline
	call print_q4a1
	call print_newline
	call print_q4a2
	call print_newline
	call print_q4a3
	call print_newline
	call print_q4a4
	call print_newline
	call syscall_get_keypress
	call print_newline

	cmp byte [keyPressed], '4'
	jne wrong4
	call print_correct
	jmp theend  		; q4: answer is 4
wrong4:	call print_wrong 
	jmp theend

keyboardgame:
	call syscall_clear_screen
	call print_keyboardgame
	call print_newline
loop:	
	call print_a
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'a'
	jne theend
	call print_correct
	call print_newline
	
	call print_s
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 's'
	jne theend
	call print_correct
	call print_newline	
			
	call print_d
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'd'
	jne theend
	call print_correct
	call print_newline	
			
	call print_f
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'f'
	jne theend
	call print_correct
	call print_newline
	
	call print_g
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'g'
	jne theend
	call print_correct
	call print_newline	
	
	call print_h
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'h'
	jne theend
	call print_correct
	call print_newline

	call print_g
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'g'
	jne theend
	call print_correct
	call print_newline
	
	call print_d
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'd'
	jne theend
	call print_correct
	call print_newline
	
	call print_s
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 's'
	jne theend
	call print_correct
	call print_newline
	
	call print_a
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'a'
	jne theend
	call print_correct
	call print_newline
	
			
	call print_d
	call syscall_get_keypress
	call print_newline
	cmp byte [keyPressed], 'd'
	jne theend
	call print_correct
	call print_newline
	jmp  loop	
theend:
	call syscall_clear_screen
	call print_end
end2:	call syscall_get_keypress
	cmp byte [keyPressed], 'q'
	je bios_power_off   		; If the user pressed q then power off

	cmp byte [keyPressed], 'r'
	jne end2		; If the user did not press q or r then ask again

	call syscall_clear_screen	; The user pressed r so clear the screen and reboot
	jmp bios_reboot		


;*****************************************************************
; End of main Code
;*****************************************************************

kernel_halt:
	jmp kernel_halt			; Loop forever

