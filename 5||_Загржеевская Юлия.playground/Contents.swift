import UIKit
import Foundation


enum windows {
    case open, close
}

enum engine {
    case start, stop
}

protocol Car: AnyObject {
    var model: String {get}
    var release: Int {get}
    var windows: windows {get set}
    var engine: engine {get set}
}

extension Car {
    func Windows (status: windows) {
        switch status {
        case .open:
            print ("\(model): Окна открыты")
            self.windows = .open
        case .close:
            print("\(model): Окна закрыты")
            windows = .close
        }
    }
    
    func Engine (status: engine) {
        switch status {
        case .start:
            print ("\(model): Двигатель заведён")
            self.engine = .start
        case .stop:
            print ("\(model): Двигатель заглушён")
            engine = .stop
        }
    }
}

protocol Trunk: Car {
    var Body: Int {get}
    var BodySpace: Int {get}
    var Cargo: Int {get set}
}

extension Trunk {
    func PutinCargo (volume: Int) {
        if BodySpace >= volume {
            print ("\(model): Загружено \(volume) кг в багажник")
            self.Cargo += volume
        } else {
            print ("\(model): В багажнике недостаточно места для \(volume) кг ")
        }
    }

    func OutfromCargo (volume: Int) {
        if self.Body >= volume {
            print ("\(model): \(volume) кг разгружается из авто")
            self.Cargo -= volume
        } else {
            print ("\(model): \(volume) - такого колличества кг в багажнике нет, увы")
        }
    }
}

protocol Sport: Car {
    var maxSpeed: Int {get}
    var currentSpeed: Int {get set}
}

extension Sport {
    func IncreaseSpeed (speed: Int) {
        if speed + currentSpeed <= maxSpeed {
            print ("\(model): Разгоняется до \(speed) ")
            self.currentSpeed += speed
        } else {
            print ("\(model): не может разогнаться до \(speed) км/ч, так как максимальная скорость - \(maxSpeed) км/ч")
        }
    }
    
    func ReduceSpeed (speed: Int) {
        if self.currentSpeed >= speed {
            print ("\(model): Cнижает скорость до \(speed)" )
            self.currentSpeed -= speed
        } else {
            print ("\(model): Остановилась")
            self.currentSpeed = 0
        }
    }
}

class TrunkCar: Trunk {
    var model: String
    var release: Int
    var windows: windows
    var engine: engine
    var Body: Int
    var Cargo: Int
    var BodySpace: Int {
        get { return Body - Cargo }
    }

init (model: String, release: Int, Body: Int) {
    self.Body = Body
    self.Cargo = 0
    self.model = model
    self.release = release
    self.engine = .stop
    self.windows = .open
    }
}

class SportCar: Sport {
    var model: String
    var release: Int
    var windows: windows
    var engine: engine
    var maxSpeed: Int
    var currentSpeed: Int
    
    init (model: String, release: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.currentSpeed = 0
        self.model = model
        self.release = release
        self.engine = .start
        self.windows = .close
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль: \(model) \n" +
        "Дата выпуска: \(release) \n" +
        "Двигатель: \(engine) \n" +
        "Окна: \(windows) \n" +
        "Кузов: \(BodySpace) - осталось загрузить\n" +
        "Багажник: \(Cargo) кг\n"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль: \(model) \n" +
        "Дата выпуска: \(release) \n" +
        "Двигатель: \(engine) \n" +
        "Окна: \(windows) \n" +
        "Максимальная скорость: \(maxSpeed) км/ч \n" +
        "Скорость в данный момент: \(currentSpeed) км/ч \n"
    }
}

print ("   ")
print ("     ")
print ("Автопарк, когда я станну миллионершей 🙂")
print ("     ")

var SportCar1 = SportCar (model: "Mustang", release: 2020, maxSpeed: 450)
var SportCar2 = SportCar (model: "Ferarri", release: 2020, maxSpeed: 450)
var TrunkCar3 = TrunkCar (model: "Volvo", release: 2013, Body: 3000)

print ("     ")
print ("     ")

print ("Состояние автомобилей")
print ("     ")
SportCar1.Engine(status: .start)
SportCar1.Windows(status: .close)
SportCar1.IncreaseSpeed(speed: 100)
SportCar1.ReduceSpeed(speed: 50)
SportCar1.ReduceSpeed(speed: 5)
SportCar1.IncreaseSpeed(speed: 500)
print ("     ")
SportCar2.Engine(status: .stop)
SportCar2.Windows(status: .open)
print ("     ")
TrunkCar3.PutinCargo(volume: 2999)
TrunkCar3.PutinCargo(volume: 13)
TrunkCar3.OutfromCargo(volume: 100)
TrunkCar3.OutfromCargo(volume: 4000)
TrunkCar3.Engine(status: .stop)
TrunkCar3.Windows(status: .open)

print ("     ")
print("Описание автопарка")
print ("     ")

print(SportCar1)
print(SportCar2)
print(TrunkCar3)
