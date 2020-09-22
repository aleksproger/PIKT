import UIKit

//MARK: - Упражнение

protocol Car {
    var name: String { get set }
    var body: String { get set }
    func maxSpeed(engine: Engine) -> Int
}
protocol Engine {
    var maxSpeed: Int { get }
}

protocol CarFactory {
    func createCar() -> Car
    func createEngine() -> Engine
}

class Ford: Car {
    var body: String = "Muscle"
    var name: String = "Ford"
    
    func maxSpeed(engine: Engine) -> Int { engine.maxSpeed }
}

class FordEngine: Engine {
    var maxSpeed: Int = 220
}

class FordFactory: CarFactory {
    func createCar() -> Car { Ford() }
    
    func createEngine() -> Engine { FordEngine() }
}

class Client {
    private let car: Car
    private let engine: Engine
    
    var toString: String { car.name }
    var maxSpeed: String { "\(engine.maxSpeed)" }
    
    init(_ factory: CarFactory) {
        self.car = factory.createCar()
        self.engine = factory.createEngine()
    }
}

let factory: CarFactory = FordFactory()
let client = Client(factory)
print("Максимальная скорость - \(client.toString) составляет \(client.maxSpeed) км/ч")

//MARK: - Задание

struct Audi: Car {
    var body: String = "Coupe"
    var name: String = "Audi"
    
    func maxSpeed(engine: Engine) -> Int { engine.maxSpeed }
}

struct AudiEngine: Engine {
    var maxSpeed: Int = 250
}

class AudiFactory: CarFactory {
    func createCar() -> Car { Audi() }
    
    func createEngine() -> Engine { AudiEngine() }
}

let factoryAudi: CarFactory = AudiFactory()
let client2 = Client(factoryAudi)
print("Максимальная скорость - \(client2.toString) составляет \(client2.maxSpeed) км/ч")
