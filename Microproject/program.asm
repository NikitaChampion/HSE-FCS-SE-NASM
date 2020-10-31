; Эквивалентный код на C
; #include <stdio.h>
; int main(int argc, char *argv[])
; {
;     unsigned int N;
;     printf("Please, type your left bound:\n\r");
;     scanf("%u", &N);
;     if (N < 1) {
;         printf("Incorrect input. Please try again\n\r\n\r");
;         return main(argc, argv);
;     }
;     unsigned int prev = 1, n = 1, next = 1;
;     do {
;         ++n;
;         prev = next;
;         next *= n;
;     } while (prev == next / n && next <= N);
;     --n;
;     printf("Your answer: %u", n);
;     return 0;
; }

; ВАРИАНТ 15

; nasm -fmacho64 -o a.o ПУТЬ_ДО_ФАЙЛА && gcc a.o && ./a.out
; nasm -fmacho64 -o a.o /Users/nikitaigumnov/Documents/GitHub/HSE-FCS-SE-NASM/Microproject/program.asm && gcc a.o && ./a.out
        global    _main
        extern    _scanf
        extern    _printf

section .data

        formatUInt db '%u', 0
        typeBound db 'Please, type your left bound: ', 10, 13, 0
        printAnswer db 'Your answer: %u', 10, 13, 0
        wrongInput db 'Incorrect input. Please try again', 10, 13, 10, 13, 0

        N: dd 0                  ; правая граница
        n: dd 1                  ; текущий параметр факториала
        prev: dd 1               ; предыдущее значение факториала – (n - 1)!
        next: dd 1               ; текущее значение факториала – n!

 section .text
        _main:
                push rbp

                mov rdi, typeBound
                call _printf
                mov rdi, formatUInt
                mov rsi, N
                call _scanf                         ; считываем правую границу

                mov eax, [rel N]
                cmp eax, 1
                jb WrongInput                       ; когда N < 1 (N = 0)

                mov ecx, 2
                call ComputeAnswerLoop              ; вычисляем ответ

                mov rdi, printAnswer
                mov rsi, [rel n]
                call _printf                        ; выводим ответ

                jmp ExitProgram

        ; == ПРОЦЕДУРЫ ==
        ComputeAnswerLoop:
                mov eax, [rel n]
                inc eax
                mov [rel n], eax                    ; ++n

                mov eax, [rel next]
                mov [rel prev], eax                 ; prev = next

                mov eax, [rel next]
                mul dword [rel n]
                mov [rel next], eax                 ; next *= n

                mov eax, [rel next]
                mov edx, 0
                div dword [rel n]
                cmp eax, [rel prev]
                jne ComputeAnswer                   ; prev != next / n

                mov eax, [rel next]
                cmp eax, [rel N]
                ja ComputeAnswer                    ; next > N

                inc ecx                             ; бесконечный цикл (чтобы можно было выйти, используя "break")
                loop ComputeAnswerLoop              ; повторный вызов цикла

        ComputeAnswer:
                mov eax, [rel n]
                dec eax
                mov [rel n], eax                    ; --n

                ret

        WrongInput:
                mov rdi, wrongInput
                call _printf                        ; некорректный ввод

                pop rbp
                jmp _main

        ExitProgram:
                pop rbp
                mov rax, 0		            ; normal, no error, return value
	        ret