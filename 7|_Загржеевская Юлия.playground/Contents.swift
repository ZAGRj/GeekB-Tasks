import Foundation

enum PizzaError: Error {
    case noPices (picesneed: Int)
    case noPizzaType
    case noPizza
}

struct Pizza {
    var pices: Int
    var pizzatype: Int
}

class Party {
    
    var menu = [
        "Маргарита": Pizza (pices: 8, pizzatype: 5),
        "4 сыра": Pizza (pices: 4, pizzatype: 3),
        "Диабло": Pizza (pices: 12, pizzatype: 2),
        "Гавайская": Pizza (pices: 8, pizzatype: 1)
    ]
    
    var Pieces = 0
    
    func errors (PizzaName name: String) throws {
        guard let pizza = menu[name] else {
            throw PizzaError.noPizza
        }
        
        guard pizza.pizzatype > 0 else {
            throw PizzaError.noPizza
        }
        
        guard pizza.pices <= Pieces else {
            throw PizzaError.noPices(picesneed: pizza.pices - Pieces)
        }
        
        Pieces -= pizza.pices
        
        var Types = pizza
        Types.pizzatype -= 1
        menu[name] = Types
        
        print ("Отхватил кусочек \(name)")
    }
}

    let Favor = [
        "Катя" : "Маргарита",
        "Влад" : "4 сыра",
        "Саня" : "Диабло"
]

func TakePizza (eater: String, Pizza: Party) throws {
    let eaterName = Favor[eater] ?? "Гавайская"
    try Pizza.errors(PizzaName: eaterName)
}

var eater = Party()

eater.Pieces = 5
do {
    try TakePizza (eater: "Влад", Pizza: eater)
}   catch PizzaError.noPizza {
    print ("Пицца закончилась :( ")
}   catch PizzaError.noPizzaType {
    print ("Нет такой пиццы, выбери лругую")
}   catch PizzaError.noPices(let picesneed) {
    print ("Больше нет кусочков, нужно ещё \(picesneed) кусочков!")
}
    
eater.Pieces = 4
do {
    try TakePizza (eater: "Катя", Pizza: eater)
}   catch PizzaError.noPizza {
    print ("Пицца закончилась :( ")
}   catch PizzaError.noPizzaType {
    print ("Нет такой пиццы, выбери лругую")
}   catch PizzaError.noPices(let picesneed) {
    print ("Больше нет кусочков, нужно ещё \(picesneed) кусочков!")
}

eater.Pieces = 12
do {
    try TakePizza (eater: "Саня", Pizza: eater)
}   catch PizzaError.noPizza {
    print ("Пицца закончилась :( ")
}   catch PizzaError.noPizzaType {
    print ("Нет такой пиццы, выбери лругую")
}   catch PizzaError.noPices(let picesneed) {
    print ("Больше нет кусочков, нужно ещё \(picesneed) кусочков!")
}
