; Эквивалентный код на C
; #include <stdio.h>
; int main()
; { 
;   long int a=3, b=4, c;
;   c=5;
;   printf("%s, a=%ld, b=%ld, c=%ld\n","c=5  ", a, b, c);
;   c=a+b;
;   printf("%s, a=%ld, b=%ld, c=%ld\n","c=a+b", a, b, c);
;   c=a-b;
;   printf("%s, a=%ld, b=%ld, c=%ld\n","c=a-b", a, b, c);
;   c=a*b;
;   printf("%s, a=%ld, b=%ld, c=%ld\n","c=a*b", a, b, c);
;   c=c/a;
;   printf("%s, a=%ld, b=%ld, c=%ld\n","c=c/a", a, b, c);
;   return 0;
; }

global _main

    extern	_scanf
    extern	_printf

%macro	pabc 1					; a "simple" print macro
	section .data
.str	db	%1,0				; %1 is first actual in macro call
	section .text
    mov     rdi, fmt4			; first arg, format
	mov		rsi, .str			; second arg
	mov     rdx, [rel a]		; third arg
	mov     rcx, [rel b]		; fourth arg
	mov     r8, [rel c]			; fifth arg
	mov     rax, 0
	call    _printf				; Call C function
%endmacro
	
	section .data
formatfirst:		db "Enter a:", 10, 0
formatsecond:		db "Enter b:", 10, 0
formatin:  			db "%d", 0
a: times 8 db 0						; 64-bits integer = 8 bytes
b: times 8 db 0						; 64-bits integer = 8 bytes
fmt4:	db "%s, a = %ld, b = %ld, c = %ld",10,0	; format string for printf
c:	times 8 db 0		; reserve a 64-bit word

	section .text
_main:				; label
	push rbp

	mov	rdi, formatfirst
    call    _printf

	mov rdi, formatin
	mov rsi, a
	mov	al, 0
    call    _scanf

	mov	rdi, formatsecond
    call    _printf

	mov rdi, formatin
	mov rsi, b
	mov	al, 0
    call    _scanf
lit5:					; c = 5;
	mov	rax, 5
	mov	[rel c], rax
	pabc	"c = 5    "
	
addb:					; c = a + b;
	mov	rax, [rel a]
	add	rax, [rel b]
	mov	[rel c], rax
	pabc	"c = a + b"
	
subb:					; c = a - b;
	mov	rax,[rel a]
	sub	rax,[rel b]
	mov	[rel c], rax
	pabc	"c = a - b"
	
mulb:					; c = a * b;
	mov	rax, [rel a]
	imul qword [rel b]	; signed integer multiply by b
	mov	[rel c], rax
	pabc	"c = a * b"
	
diva:					; c = c / a;
	mov	rax, [rel a]
	mov	rdx, 0			; load upper half of dividend with zero
	idiv	qword [rel b]	; divide double register edx rax by a
	mov	[rel c], rax
	pabc	"c = a / b"

	pop	rbp

    mov     rax, 0
	ret