; Эквивалентный код на C
; #include <stdio.h>
; #include <stdlib.h>
; int main(int argc, char *argv[])
; {
;     int N, min = 2147483647;
;     long int* arr;
;     printf("Please, type size of an array:\n\r");
;     scanf("%d", &N);
;     if (N < 1) {
;         printf("Incorrect input. Please try again\n\r\n\r");
;         main(args, argv[]);
;     }
;     arr = (int*)calloc (N, sizeof(int));
;     printf("Please, type your (int) array:\n\r");
;     for (int i = 0; i < N; ++i) {
;         scanf("%d", arr + i);
;         //printf("$d", *(arr + i));
;         if (*(arr + i) < min) {
;             min = *(arr + i);
;         }
;     }
;     printf("Min number is %d\n\r\n\r", min);
;     for (int i = 0; i < N; ++i) {
;         if (*(arr + i) == 0) {
;             *(arr + i) = min;
;         }
;     }
;     printf("Your new array:\n\r");
;     for (int i = 0; i < N; ++i) {
;         printf("$d", *(arr + i));
;     }
;     free(arr);
;     return 0;
; }

; ВАРИАНТ 15

; nasm -fmacho64 -o a.o ПУТЬ_ДО_ФАЙЛА && gcc a.o && ./a.out
        global    _main
        extern    _scanf
        extern    _printf
        extern    _calloc
        extern    _free

section .data

        formatInt db '%d', 0
        formatIntWithSpace db '%d ', 0
        typeSize db 'Please, type size of an array: ', 10, 13, 0
        typeArr db 'Please, type your (int) array: ', 10, 13, 0
        typeMin db 10, 13, 'Min number is %d', 10, 13, 10, 13, 0
        yourArr db 'Your new array:', 10, 13, 0
        wrongInput db 'Incorrect input. Please try again', 10, 13, 10, 13, 0
        newLine db 10, 13, 0

        N: times 4 db 0          ; размер массива (32-bits integer = 4 bytes)
        number: times 8 db 0     ; введенное число
        i: times 8 db 0          ; счётчик в цикле
        arr: times 8 db 0        ; массив
        min: dd 2147483647       ; верхняя граница min

        NULL dd 0

 section .text
        _main:
                push    rbp

                mov rdi, typeSize
                call _printf
                mov rdi, formatInt
                mov rsi, N
                call _scanf                         ; считываем размер массива

                mov eax, [rel N]
                cmp eax, 1
                jl WrongInput                       ; N < 1

                mov rdi, N
                mov rsi, 8
                call _calloc                        ; ищем участок памяти на N чисел
                mov [rel arr], rax                  ; массив на N int


                mov rdi, typeArr
                call _printf                        ; просим ввести массив

                call InputArray                     ; процедура ввода массива

                mov rdi, typeMin
                mov rsi, [rel min]                  ; Вывод минимума в массиве
                call _printf

                mov rax, 0
                mov [rel i], rax                    ; обнуляем счётчик цикла
                call ChangeNullElements             ; меняем нулевые элементы

                mov rdi, yourArr
                call _printf

                mov rax, 0
                mov [rel i], rax                    ; обнуляем счётчик цикла
                call OutputArray                    ; выводим весь массив

                mov rdi, newLine
                call _printf

                mov rdi, [rel arr]
                call _free

                jmp ExitProgram

        ; == ПРОЦЕДУРЫ ==
        InputArray:
                push rcx

                mov rdi, formatInt
                mov rsi, number
                call _scanf                        ; считывание элемента массива

                mov r10, [rel i]
                imul r10, qword 8                  ; вычисляем сдвиг указателя

                mov rax, [rel arr]
                add rax, r10                       ; смещаем указатель на только что посчитанный сдвиг
                mov r10, [rel number]              ; запишем введенное число в r10
                mov [rel rax], r10                 ; записали введенное число в ячейку массива

                
                ;mov rdi, formatInt
                ;mov rsi, r10
                ;call _printf

                cmp r10d, [rel min]
                jl _UpdateMin                      ; a[i] < min

                continueInput:                     ; метка возвращения

                ; инкрементируем счетчик
                mov rax, [rel i]
                add rax, 1
                mov [rel i], rax

                mov eax, [rel i]
                cmp eax, [rel N]
                jl _Looper                         ; i < N

                pop rcx
                ret

        _Looper:
                pop rcx
                jmp InputArray


        _UpdateMin:                                ; Функция, обновляющая минимум
                mov [rel min], r10
                jmp continueInput


        OutputArray:
                push rcx

                mov r10, [rel i]
                imul r10, qword 8

                mov rax, [rel arr]
                add rax, r10
                mov r10, [rel rax]                ; получаем значение элемента в массиве

                mov rdi, formatIntWithSpace
                mov rsi, r10
                call _printf                      ; вывод числа

                ; инкрементируем счетчик
                mov rax, [rel i]
                add rax, 1
                mov [rel i], rax
                
                mov eax, [rel i]
                cmp eax, [rel N]
                jl _Looper3                       ; i < N

                pop rcx
                ret

        _Looper3:
                pop rcx
                jmp OutputArray

        ChangeNullElements:
                push rcx

                mov r10, [rel i]
                imul r10, qword 8

                mov rax, [rel arr]
                add rax, r10
                mov r10, [rel rax]                ; получаем значение элемента в массиве

                cmp r10, 0
                je _UpdateElement                 ; a[i] = 0
                _ReturnChanging:                  ; метка возврата из обновления элемента

                ; инкрементируем счетчик
                mov rax, [rel i]
                add rax, 1
                mov [rel i], rax
                
                mov eax, [rel i]
                cmp eax, [rel N]
                jl _Looper2                       ; i < N

                pop rcx
                ret

        _Looper2:
                pop rcx
                jmp ChangeNullElements

        _UpdateElement:
                mov r10, [rel min]
                mov [rel rax], r10
                jmp _ReturnChanging

        WrongInput:
                mov rdi, wrongInput
                call _printf

                pop rbp
                jmp _main

        ExitProgram:
                pop rbp
                mov rax, 0		          ; normal, no error, return value
	        ret


