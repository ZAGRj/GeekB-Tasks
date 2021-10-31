import UIKit
import Foundation

print ("Задание_1: Написать функцию, которая определяет, четное число или нет")
print ("     ")
print ("     ")

var a = 8
var b = a % 2

if (b==0) {
    print ("\(a) - Число чётное")
} else {
    print ("\(a) - Число нечётное")
}

var c = 13
var d = c % 2

if (d==0) {
    print ("\(c) - Число чётное")
} else {
    print ("\(c) - Число нечётное")
}

print ("     ")
print ("Задание_2: Написать функцию, которая определяет, делится ли число без остатка на 3")
print ("     ")
print ("     ")

var k = 146
var e = k % 3

if (k==0) {
    print ("\(k) - Кратно 3")
} else {
    print ("\(k) - Не кратно 3")
}
 
var l = 153
var m = l % 3

if (m==0) {
print ("\(l) - Кратно 3")
} else {
print ("\(l) - Не кратно 3")
}
                        
print ("     ")
print ("Задание_3: Создать возрастающий массив из 100 чисел")
print ("     ")
print ("     ")

var Array: [Int] = []
for i in 0...100 {
    Array.append (i)
}
print (Array)

print ("     ")
print ("Задание_4: Удалить из этого массива все четные числа и все числа, которые не делятся на 3")
print ("     ")
print ("     ")
// вариант первый
var ArrayFirst: [Int] = []
for i in 0...100 {
 ArrayFirst.append (i)
}
// creat an array

for v in ArrayFirst where (v % 2 == 0) || (v % 3 == 0) {
 ArrayFirst.remove (at: (ArrayFirst.firstIndex(of: v)!))
}
print (ArrayFirst)

print ("     ")
print ("     ")
// вариант второй

var ArraySecond: [Int] = []
for i in 0...100 {
    ArraySecond.append (i)
}
for v in ArraySecond {
    if (v % 2) == 0 {
        ArraySecond.remove(at: ArraySecond.firstIndex(of: v)!)
    }
}
for w in ArraySecond {
    if (w % 3) == 0 {
        ArraySecond.remove(at: ArraySecond.firstIndex(of: w)!)
    }
}

print (ArraySecond)
        
print ("     ")
print ("Задание_5*: Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов")
/* Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2 */
print ("     ")
print ("     ")

func Fib (count: Int) -> [Decimal] {
    var ArrayFib: [Decimal] = [1,2]
    
    for i in 0...count {
        ArrayFib.append (ArrayFib[i] + ArrayFib[i+1])
    }
    return ArrayFib
}
print (Fib (count: 50))

print ("     ")
print ("Задание_6*: Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:")

/* a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно */
print ("     ")
print ("     ")

func SimpleNumbers (number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

func ArraySimpleNumbers() -> [Int] {
    var result = [Int]()
    var i = 2
    while result.count < 100 {
        if SimpleNumbers(number: i) {
            result.append (i)
        }
        i += 1
    }
    return result
}

print (ArraySimpleNumbers())
