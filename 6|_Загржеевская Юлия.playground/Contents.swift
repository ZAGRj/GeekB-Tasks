import UIKit
import Foundation

struct queue <Name: Comparable> {
    var Array = [Name] ()

    mutating func add ( _ array: Name ) {
        Array.append (array)
    }

    mutating func next() -> Name {
        print (" \(Array.first!)")
        return Array.removeFirst()
    }

    func filter (array: Name) {
        print ("в очереди есть человек с именем \(Array.filter {$0 == array})")
        // filter(array:array) { (Name) in return Name == array}
    }

    mutating func Sorting() -> [Name] {
//    return Array.sorted(by: >) // > - выстраивает алфавитный порядок
        return Array.shuffled() // с ума сошла, пока искала, как это сделать, но это стоило того )))
    }


    subscript (index: Int) -> Name? {
        return (index < Array.count ? Array[index] : nil)
    }

    func Counting() {
        print (Array.count)
    }
    
}

var Queue = queue <String> (Array: ["Влад", "Анна", "Екатерина", "Юрий", "Олеся"])
print ("Очередь за новым Айфоном 📱")
print (Queue.Array)

print ("   ")
print("Количество человек в очереди:")
Queue.Counting()

print ("   ")
print("Человек, который хочет продать своё место в очереди: ")
print(Queue[0])

print ("   ")
print("Человек, который хочет купить  место в очереди: ")
print(Queue[4])

print ("   ")
print ("Сортировка по уровню желания покупки нового Айфона: \(Queue.Sorting())")
print ("   ")

print("Несмотря на это, первый в очереди купил Айфон:")
Queue.next()
print ("А за ним:")
Queue.next()
print ("   ")

print ("Очередь продолжает расти...")
Queue.add ("Алёша")
Queue.add ("Cаня")
Queue.add ("Миша")
Queue.add ("Марина")
Queue.add ("Елена")
print(Queue)

print ("   ")
print("Количество человек на данный момент в очереди:")
Queue.Counting()

print ("   ")
print("Зато теперь..")
Queue.filter(array: "Алёша")





