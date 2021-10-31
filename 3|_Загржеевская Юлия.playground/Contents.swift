import UIKit
import Foundation

enum lugguageAction: String {
    case push = "Загрузть багаж"
    case pull = "Выгрузить багаж"
}

/*
enum actionLugguage {
    case pushL
    case pullL
}
*/

enum Windows: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

enum actionWindows {
    case openW
    case closeW
}

enum Engine: String {
    case on = "Двигатель заведён"
    case off = "Двигатель заглушён"
}

/*
enum actionEngine {
    case start
    case stop
}
*/

struct Transport {
    var brand: String
    var release: Int
    var lugguage: Int //объем багажника
    var lugguageAction: lugguageAction //загрузить или выгрузить багаж
    var luagguageMeasure: Int // какой объём загружаем/выгружаем
    var engine: Engine
    var windows: Windows
    
//  Если выводим на консоль действия с багажном, то:
    /*
    mutating func actLugguage (action: lugguageAction)
    {
        switch action {
        case .pull:
            print(action.rawValue)
            self.engine = .pull
        case .push:
            print(action.rawValue)
            self.engine = .push
        }
    */
//  Если выводим на консоль действия с двигателем, то:
    /*
    mutating func actEngine (action: Engine)
    {
        switch action {
        case .on:
            print(action.rawValue)
            self.engine = .on
        case .off:
            print(action.rawValue)
            self.engine = .off
        }
     */
    mutating func actWindows (action: Windows)
    {
        switch action {
        case .open:
            print(action.rawValue)
            self.windows = .open
        case .close:
            print(action.rawValue)
            self.windows = .close
    }
    }
    
    func description(){
        print("Автомобиль \(brand), \(release) год выпуска. \(engine.rawValue). Багажник: \(lugguage) л")
    }
    
    func printWindows() {
        print(windows.rawValue)
    }

}



var car = Transport (brand: "Volkswagen", release: 2010, lugguage: 250, lugguageAction: .pull, luagguageMeasure: 200, engine: .on, windows: .close)
var truck = Transport (brand: "Volvo", release: 2013, lugguage: 1000, lugguageAction: .push, luagguageMeasure: 800, engine: .off, windows: .open)

car.brand
car.lugguage
car.luagguageMeasure
car.lugguageAction
car.release
car.actWindows(action: .open)
car.actWindows(action: .close)
car.engine
/* car.windows
 car.lugguageAction */

print ("    ")
car.description()

print ("--------------")

truck.brand
truck.lugguage
truck.luagguageMeasure
truck.lugguageAction
truck.release
truck.engine
/* truck.windows
 truck.lugguageAction */

print ("    ")
car.description()


