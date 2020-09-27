; Эквивалентный код на C
; #include <stdio.h>
; int main()
; {
;   char msg[] = "Hello world\n";
;   printf("%s\n", msg);
;   return 0;
; }

global _main				; стандартная точка входа gcc

; Объявление использованных функций из C
    extern	_printf			; функция из C

    section .data			; инициализация переменных
msg:	db "Hello world", 0	; строка из C требует 0
fmt:	db "%s", 10, 0		; формат для printf, "\n",'0'

    section .text			; раздел кода
_main:						; метка программы для точки входа
    push    rbp

	mov		rdi, fmt		; формат для printf
	mov		rsi, msg		; сообщение в printf
	mov		rax, 0
    call	_printf			; вызов printf

	pop		rbp

	mov		rax, 0
	ret						; return