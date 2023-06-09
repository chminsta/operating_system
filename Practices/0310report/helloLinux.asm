section	.data		; where data is stored

msg:
	DB 'Hello Linux' , 10	; message 'Hello Linux'
	
	msgSize	EQU $-msg	;size of message is between here and msg
	global	start	; the location start is available outside this program 

section .text 		;instruction section

start:
	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, msgSize
	int 0x80
	
	mov rax,1
	mov rbx,0
	int 0x80
	ret
	
	
			
	
	
