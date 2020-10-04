# Игумнов Никита, БПИ191
[В данной папке](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2) представлено выполнение второй домашней работы по работе в NASM.

## Условие (15 вариант)
Разработать программу, которая вводит одномерный массив A[N], формирует из элементов массива A новый массив B <b>заменой всех нулевых элементов исходного массива значением минимального элемента</b> и выводит как исходный массив, так и изменённый массив.

## Код программы
[Исходный код](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/program.asm)<br>

Рассмотрим основную часть кода, которая "вызывает" процедуры:<br>
- **Основная часть кода**<br>
1. Считываем в консоли размер массива, далее резервируем память под наш массив и под новый массив заданного размера. <br>
2. Вызываем процедуру ввода массива. <br>
3. Вызываем процедуру вывода исходного массива A. <br>
4. Изменяем исходный массив A по заданию, получая массив B. <br>
5. Вызываем процедуру вывода изменённого массива B. <br>

## Тестирование программы
Тесты лежат в папке [tests](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests)<br>.
- **Тест 1**<br>
Для начала проверим ввод размера массива на отрицательные числа и ноль:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test1.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 2**<br>
Введём массив, состоящий из одних 0:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test2.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 3**<br>
Введём массив из положительных элементов:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test3.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 4**<br>
Введём массив из нулевых и положительных элементов:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test4.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 5**<br>
Введём массив из отрицательных и положительных элементов:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test5.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 6**<br>
Введём массив из отрицательных и нулевых элементов:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test6.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 7**<br>
Введём случайный большой (N = 100) массив из отрицательных, нулевых и положительных элементов::<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test7.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 8**<br>
Введём случайный большой (N = 200) массив из отрицательных, нулевых и положительных элементов:<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test8.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
