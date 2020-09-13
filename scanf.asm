; Эквивалентный код на C
; #include <stdio.h>
; int main(int argc, char *argv[])
; {
;     int integer1, integer2;
;     printf("Enter the first number: ");
;     scanf("%d", &integer1);
;     printf("Enter the second number: ");
;     scanf("%d", &integer2);
;     printf("%d\n", integer1+integer2);
;     return 0;
; }

global _main								; стандартная точка входа gcc

; Объявление использованных функций из C
    extern	_scanf							; функция из C
    extern	_printf							; функция из C

    section .data							; инициализация переменных
formatfirst:		db "Enter your number:", 10, 0
formatin:  			db "%d", 0
formatout:			db "Your number: %d", 10, 0
integer: times 8 db 0					; 64-bits integer = 8 bytes

    section .text							; раздел кода
_main:
    push    rbp

	mov	rdi, formatfirst					; формат для printf
    call    _printf							; вызов printf

	mov rdi, formatin						; формат для scanf
	mov rsi, integer						; переменная для считывания
	mov	al, 0
    call    _scanf							; вызов scanf

	mov	rdi, formatout				    	; формат для printf
	mov	rsi, [rel integer]					; параметр в printf
    call    _printf							; вызов printf

	pop	rbp

	mov	rax, 0
	ret										; return