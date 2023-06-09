;;print myname using bios calls
;;WRITTEN BY ChangMinLee 2019043890

%include "colors.asm"
%include "ascii_codes.asm"

%include "init_segment_registers.asm"

main:
	call print_ChangMinLee
	
end_loop:
	jmp end_loop
	

;;Local:
;;	al = current character to print
;;	bl = color


print_ChangMinLee:
	mov bl, GREEN
	mov al, CHAR_C
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_h
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_a
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_n
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_g
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_M
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_i
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_n
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_L
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_e
	call bios_print_char
	mov bl, GREEN
	mov al, CHAR_e
	call bios_print_char
	ret
	
	
;;input:al is char to print
;;	bl is color


bios_print_char:
	mov ah, 0x0E
	int 0x10
	ret
	
times 510-($-$$) db 0
dw 0AA55h
