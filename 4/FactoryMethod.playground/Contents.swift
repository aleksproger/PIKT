import UIKit

protocol TransportService {
    var name: String { get }
    
    func transportationCost(distance: Double) -> Double
}

protocol TransportCompany {
    var name: String { get }
    var toString: String { get }
    
    func create(name: String, category: Int) -> TransportService
}

class TaxiService: TransportService {
    var name: String
    var category: Int
    
    init(name: String, category: Int) {
        self.name = name
        self.category = category
    }
    
    func transportationCost(distance: Double) -> Double { distance * Double(category) }
    
    var toString: String { "\(name) - категория \(category)"}
}

class ShippingService: TransportService {
    var name: String
    var plan: Int
    
    init(name: String, plan: Int) {
        self.name = name
        self.plan = plan
    }
    
    func transportationCost(distance: Double) -> Double { distance * Double(plan) }
    
    var toString: String { "\(name) - тариф \(plan)"}
}

class TaxiCompany: TransportCompany {
    var name: String
    
    var toString: String { name }
    
    init(name: String) {
        self.name = name
    }
    
    func create(name: String, category: Int) -> TransportService {
        TaxiService(name: name, category: category)
    }
}

class ShippingCompany: TransportCompany {
    var name: String
    
    var toString: String { name }
    
    init(name: String) {
        self.name = name
    }
    
    func create(name: String, category: Int) -> TransportService {
        ShippingService(name: name, plan: category)
    }
}

let transportCompany: TransportCompany = TaxiCompany(name: "Taxi Service")
let transportService: TransportService = transportCompany.create(name: "Taxi", category: 1)

var dist: Double = 15.5

func _print(service: TransportService, dist: Double) {
    print("Компания \(service.name), расстоние \(dist) стоимость \(service.transportationCost(distance: dist))")
}

_print(service: transportService, dist: dist)

let gCom: TransportCompany = ShippingCompany(name: "Shipping Service")
let gService: TransportService = gCom.create(name: "Shipping", category: 2)

var dist2: Double = 150.5

_print(service: gService, dist: dist2)

class DrunkDriverCompany: TransportCompany {
    var name: String
    
    var toString: String { name }
    
    init(name: String) {
        self.name = name
    }
    
    func create(name: String, category: Int) -> TransportService {
        DrunkDriverService(name: name, plan: category)
    }
}


class DrunkDriverService: TransportService {
    var name: String
    var plan: Int
    
    init(name: String, plan: Int) {
        self.name = name
        self.plan = plan
    }
    
    func transportationCost(distance: Double) -> Double { distance * Double(plan) }
    
    var toString: String { "\(name) - тариф \(plan)"}
}

let dCom: TransportCompany = DrunkDriverCompany(name: "Drunk driver Service")
let dService: TransportService = dCom.create(name: "Drunk Driver", category: 3)

var dist3: Double = 150.5

_print(service: dService, dist: dist3)
