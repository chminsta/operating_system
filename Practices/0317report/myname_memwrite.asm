;;Written By ChangMinLee 2019043890

%include "init_segment_registers.asm"
%include "colors.asm"
%include "ascii_codes.asm"

main:
mov byte [ypos],8 ;start in 8th Row
mov byte [xpos],0 ;start in 0th column
call print_ChangMinLee

end_loop:
jmp end_loop


print_ChangMinLee:
mov bl,GREEN
mov al,CHAR_C			;C
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_h			;h
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_a			;a
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_n			;n
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_g			;g
call memwrite_print_char
add byte [ypos],1

mov al,CHAR_SPACE		;
call memwrite_print_char
add byte [ypos],1

mov bl,GREEN
mov al,CHAR_M			;M
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_i			;i
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_n			;n
call memwrite_print_char
add byte [ypos],1

mov al,CHAR_SPACE		;
call memwrite_print_char
add byte [ypos],1

mov bl,GREEN
mov al,CHAR_L			;L
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_e			;e
call memwrite_print_char
add byte [ypos],1
mov bl,GREEN
mov al,CHAR_e			;e
call memwrite_print_char
add byte [ypos],1
ret

memwrite_print_char:
mov ah, bl
mov cx, ax
movzx ax, byte[ypos]
mov dx, 160
mul dx
movzx bx,byte [xpos]

shl bx, 1
mov di, 0
add di, ax
add di, bx

mov ax, cx
stosw 
ret

xpos db 0
ypos db 0

times 510-($-$$) db 0
dw 0AA55h

