import UIKit
import Foundation
import Darwin

class Car {
    var brand: String
    var release: Int
    var country: String //  страна производства
    var engine: EngineAction = .off
    var window: WindowsAction = .closed
   
    
    enum EngineAction: CustomStringConvertible {
        case on, off
        
        var description: String {
            switch self {
            case .on:
                return "Двигатель заведён"
            case .off:
                return "Двигаетль заглушен"
            
            }
        }
    }
    
    enum WindowsAction: CustomStringConvertible {
        case opened, closed
        
        var description: String {
            switch self {
            case .opened:
                return "Окна открыты"
            case .closed:
                return "Окна закрыты"
            }
        }
    }
    
    enum BodyType: CustomStringConvertible {
        case sport, hard, grand, standart
        
        var description: String {
            switch self {
            case .sport:
                return "Спорткар"
            case .hard:
                return "Грузовик"
            case .grand:
                return "Фура"
            case .standart:
                return "Легковой автомобиль"
            }
        }
    }
    
    enum Action {
        case switchEngine(EngineAction)
        case switchWindows(WindowsAction)
        case CargoNow (Decimal)
        case SpeedStart (Double)
        case MaxSpeed (Decimal)
        case attachCarBody (BodyType)
        case numberPartic // номер участника в гонке
    }
    
    init (brand: String, release: Int, country: String) {
        self.brand = brand
        self.release = release
        self.country = country
    }
    
    func act (action: Action) {
        
    }
}

class Truck: Car, CustomStringConvertible {
    static var symbol = "🚚"
    let maxCargo: Decimal
    var CargoNow: Decimal = 0
    var body: BodyType?
    
    
    var description: String {
        let bodyDescription = body?.description ?? "Отцеплен"
        
        return "\(Truck.symbol) \(brand) \n Год выпуска: \(release) \n Страна производства: \(country) \n Объём багажника: \(maxCargo) | Сейчас загруженно: \(CargoNow) \n Кузов: \(bodyDescription) \n В данный момент: \(engine) | \(window) \n"
    }
    
    init (brand: String, release: Int, country: String, maxCargo: Decimal, body: BodyType?) {
        self.body = body
        self.maxCargo = maxCargo
        super.init (brand: brand, release: release, country: country)
    }
    
    override func act (action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            window = status
        case .CargoNow (let load):
            guard body != nil else {
                return
            }
    let expectCargo = load + CargoNow
        switch expectCargo {
        case _ where expectCargo > maxCargo:
            CargoNow = maxCargo
        case _ where expectCargo < 0:
            CargoNow = 0
        default:
            CargoNow += load
        }
    case .attachCarBody (let newBody):
        self.body = newBody
        CargoNow = 0
    default:
        break
        }
    }
}
    
    class SportCar: Car, CustomStringConvertible {
        var symbol = "🏎"
        var MaxSpeed: Int = 0
        var SpeedStart: Double = 0.0
        
        var description: String {
            return "\(symbol) \(brand) \n Год выпуска: \(release) \n Страна производства: \(country) \n Разгон с 0 до 100 км/ч -  \(SpeedStart) секунды \n Максимальная скорость: \(MaxSpeed) км/ч \n В данный момент: \(engine) | \(window) \n"
        }
        
    init (brand: String, release: Int, country: String, MaxSpeed: Int, SpeedStart: Double) {
           self.MaxSpeed = MaxSpeed
           self.SpeedStart = SpeedStart
           super.init (brand: brand, release: release, country: country)
    }
        override func act (action: Action) {
            switch action {
            case .switchEngine(let status):
                engine = status
            case .switchWindows(let status):
                window = status
            case .numberPartic:
                print ("13 - номер участника гонки")
            default:
                break
            }
        }
    }

    var TruckCar = Truck (brand: "Камаз", release: 2000, country: "Россия", maxCargo: 3000, body: nil)
    TruckCar.act(action: .attachCarBody(.grand))
    TruckCar.act(action: .CargoNow(2500))
    TruckCar.act(action: .switchEngine(.off))
    TruckCar.act(action: .switchWindows(.opened))
    print(TruckCar)
   
print ("   ")
print ("   ")

var Racing = SportCar(brand: "Mustang", release: 2021, country: "Германия", MaxSpeed: 428, SpeedStart: 5.3)
    Racing.act(action: .switchEngine(.on))
    Racing.act(action: .switchWindows(.closed))
    Racing.act(action: .numberPartic)
    print(Racing)

