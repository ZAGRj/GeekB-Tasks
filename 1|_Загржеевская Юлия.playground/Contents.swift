print ("Задание_1: Решение Квадратного Уравнения")
print ("     ")

import Foundation
import UIKit
import Darwin.C.math

print ("4x2 - 16x + 10 = 0")
print ("     ")

var a = 4.0
var b = -16.0
var c = 10.0
var x1 = 0.0
var x2 = 0.0

var D = pow (b,2) - 4 * a * c
// pow - возведение в степень

print ("Дискриминант = \(D)")

if (D<0)
{print ("Корней нет")}

if (D==0)
{x1 = ( -b + sqrt(D) ) / ( 2 * a )}

// sqrt - квадратный корень

if (D>0)
    
{
    x1 = ( -b + sqrt(D) ) / ( 2 * a )
    x2 = ( -b - sqrt(D) ) / ( 2 * a )
}
print ( "Первый корень = \(x1)")
print ( "Втоорй корень = \(x2)")

print ("     ")
print ("     ")

print ("Задание_2: Поиск площади и гипотенузы треугольника")

/* Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника */

print ("     ")

var k1: Double = 6 // катит 1
var k2: Double = 8 // катит 2
var g: Double = 10 // гипотенуза
var p: Double = 24 // периметр
var s: Double = 311.06 // площадь

g = sqrt ( pow (k1,2) + pow (k2,2) )
print ("Гипотенуза треугольника равна \(g)")

p = k2 + k1 + g
print ("Периметр треугольника равен \(p) ")

s = sqrt (p * (p-k1) * (p-k2) * (p-g)) // высчитывается по формуле Герона
print ("Периметр пощади равен \(s) ")

print ("     ")
print ("     ")


print ("Задание_3: Рассчёт вклада")

/* Пользователь вводит сумму вклада в банк под годовой процент. Найти сумму вклада через 5 лет */

print ("     ")
var deposit: Float = 50000
print ("Стартовый вклад: \(deposit)")
var percent: Float = 6

percent = percent / 100 // рассчёэт процента

var year1 = deposit + (deposit * percent) // доход за 1 год
var year2 = year1 + (deposit * percent) // доход за 2 года
var year3 = year2 + (deposit * percent) // доход за 3 года
var year4 = year3 + (deposit * percent) // доход за 4 года
var year5 = year4 + (deposit * percent) // доход за 5 лет

var counter = 1
var result = [year1, year2, year3, year4, year5]

print ("     ")
for i in result {
    print ("Итоговая сумма через \(counter) года/лет: \(i)")
    counter += 1
}
