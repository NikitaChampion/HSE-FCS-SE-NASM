; Эквивалентный код на C
; #include <stdio.h>
; int main()
; {
;   int a = 2147483647;
;   printf("a = %d, a + 1 = %d\n", a, a + 1);
;   return 0;
; }

global _main								; стандартная точка входа gcc

; Объявление использованных функций из C
    extern	_printf							; функция из C

    section .data							; инициализация переменных
a:		dd	2147483647						; int a = 2147483647;
fmt:    db "a = %d, a + 1 = %d", 10, 0		; формат для printf, "\n",'0'

    section .text							; раздел кода
_main:
    push    rbp
	
	mov	rax, [rel a]						; переместить "a" в регистр
	add	rax, 1								; a + 1 – в регистре
	mov	rdi, fmt							; формат для printf
	mov	rsi, [rel a]         				; первый параметр в printf
	mov	rdx, rax         					; второй параметр в printf
	mov	rax, 0
    call    _printf							; вызов printf

	pop	rbp

	mov	rax, 0
	ret										; return