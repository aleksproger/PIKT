import UIKit

//MARK: - Упражнение

protocol Game {
    func makeThrow() -> Int
}

class Dice: Game {
    func makeThrow() -> Int { Int.random(in: 1...6) }
}

class Player {
    var toString: String { name }
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func gameTry(game: Game) -> Int { game.makeThrow() }
}

let dice = Dice()
let player = Player("Alex")
print("The result of \(player.toString) is \(dice.makeThrow())")

class Coin {
    func makeCoinThrow() -> Int { Int.random(in: 1...2) }
}

class GameAdapter: Game {
    private let coin: Coin
    
    init(_ coin: Coin) {
        self.coin = coin
    }
    
    func makeThrow() -> Int { coin.makeCoinThrow() }
}

let coin = Coin()
let adapter = GameAdapter(coin)
print("The result of \(player.toString) is \(adapter.makeThrow())")

//MARK: - Задание

struct Celsius {
    var toString: String { "\(value)" }
    let value: Double
    
    init(celsius: Double) {
        self.value = celsius
    }
    
    init(farenheits: Farenheit) {
        self.value = (farenheits.value - 32) * 5/9
    }
}

struct Farenheit {
    let value: Double
}

protocol Sensor {
    func getIndications() -> String
}

class ClimateSystem {
    private let sensors: [Sensor]
    
    init(_ sensors: [Sensor]) {
        self.sensors = sensors
    }
    
    func showIndications() {
        sensors.forEach{ print($0.getIndications()) }
    }
}

class TemperatureSensor {
    func getTemperature() -> Farenheit { Farenheit(value: Double.random(in: 0...10)) }
}

class SensorAdapter: Sensor {

    private let sensor: TemperatureSensor
    
    init(_ sensor: TemperatureSensor) {
        self.sensor = sensor
    }
    
    func getIndications() -> String {
        let temp = sensor.getTemperature()
        return Celsius(farenheits: temp).toString
    }
}


let tempSensor = TemperatureSensor()
let tempAdapter = SensorAdapter(tempSensor)
let system = ClimateSystem([tempAdapter])
system.showIndications()

