; Эквивалентный код на C
; #include <stdio.h>
; int main(int argc, char *argv[])
; {
;     int integer1, integer2;
;     printf("Enter the first number: ");
;     scanf("%d", &integer1);
;     printf("Enter the second number: ");
;     scanf("%d", &integer2);
;     printf("%d + %d\n", integer1 + integer2);
;     return 0;
; }

global _main								; стандартная точка входа gcc

; Объявление использованных функций из C
    extern	_scanf							; функция из C
    extern	_printf							; функция из C

    section .data							; инициализация переменных
formatfirst:		db "Enter the first number:", 10, 0
formatsecond:		db "Enter the second number:", 10, 0
formatin:  			db "%d", 0
formatout:			db "%d + %d = %d", 10, 0
integer1: times 8 db 0						; 64-bits integer = 8 bytes
integer2: times 8 db 0						; 64-bits integer = 8 bytes

    section .text							; раздел кода
_main:
    push    rbp

	; первый вывод
	mov	rdi, formatfirst
    call    _printf

	; считывание первой переменной
	mov rdi, formatin
	mov rsi, integer1
	mov	al, 0
    call    _scanf


	; второй вывод
	mov	rdi, formatsecond
    call    _printf

	; считывание второй переменной
	mov rdi, formatin
	mov rsi, integer2
	mov	al, 0
    call    _scanf

	; складывание чисел
	mov rax, [rel integer1]
	add rax, [rel integer2]

	; 
	mov	rdi, formatout				    	; формат для printf
	mov	rsi, [rel integer1]					; параметр 1 в printf
	mov	rdx, [rel integer2]					; параметр 2 в printf
	mov	rcx, rax
    call    _printf

	pop	rbp

	mov	rax, 0
	ret										; return