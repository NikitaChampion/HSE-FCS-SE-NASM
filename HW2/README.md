# Игумнов Никита, БПИ191
[В данной папке](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2) представлено выполнение второй домашней работы по работе в NASM.

## Условие (15 вариант)
Разработать программу, которая вводит одномерный массив A[N], формирует из элементов массива A новый массив B <b>заменой всех нулевых элементов исходного массива значением минимального элемента</b> и выводит как исходный массив, так и изменённый массив.

## Код программы
[Исходный код](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/program.asm)<br>

В основной части кода можно выделить следующие основные процедуры:<br>
1. Считывание в консоли размера массива, резервирование памяти под входной массив и под новый массив заданного размера. <br>
2. Процедура ввода массива. <br>
3. Процедура вывода исходного массива A. <br>
4. Изменение исходного массива A по заданию (получаем массив B). <br>
5. Процедура вывода изменённого массива B. <br>

## Тестирование программы
Тесты лежат в папке [tests](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests) (в папке элементы массива указываются через пробел для лучшей читаемости ввода). Этот [файл](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests/convertToRealTest.py) конвертирует тест из папки в реальный тест (который можно скопировать и вставить).<br>

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
Введём случайный большой (N = 100) массив из отрицательных, нулевых и положительных элементов (в [-1000, 1000]) (для генерации теста использовалась [эта](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests/testGenerator.cpp) программа (с соответствующими параметрами); полный тест смотрите [здесь](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests/test_7.txt)):<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test7.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
- **Тест 8**<br>
Введём случайный большой (N = 200) массив из отрицательных, нулевых и положительных элементов (в [-150, 150]) (для генерации теста использовалась [эта](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests/testGenerator.cpp) программа (с соответствующими параметрами); полный тест смотрите [здесь](https://github.com/NikitaChampion/HSE-FCS-SE-NASM/tree/master/HW2/tests/test_8.txt)):<br>
<img src="https://github.com/NikitaChampion/HSE-FCS-SE-NASM/blob/master/HW2/pictures/test8.png" alt="" width="700" /> <br>
Программа отработала успешно <br><br>
