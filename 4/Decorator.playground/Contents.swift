import UIKit

protocol AutoBase {
    var name: String { get }
    var description: String { get }
    var cost: Double { get }
    var toString: String { get }
    
    func getCost() -> Double
}

extension AutoBase {
    var toString: String {
        "Auto - \(name), description - \(description), cost - \(cost)"
    }
}

class Renault: AutoBase {
    var name: String
    
    var description: String
    
    var cost: Double
    
    func getCost() -> Double {
        cost * 1.18
    }
    
    init(name: String, description: String, cost: Double) {
        self.name = name
        self.description = description
        self.cost = cost
    }
}

class DecoratorOptions: AutoBase {
    var name: String {
        autoProperty.name
    }
    
    var description: String {
        autoProperty.description
    }
    
    var cost: Double {
        autoProperty.cost
    }
    
    func getCost() -> Double {
        autoProperty.getCost()
    }
    
    let autoProperty: AutoBase
    var title: String
    
    init(auto: AutoBase, title: String) {
        self.autoProperty = auto
        self.title = title
    }
}

class MediaNAV: DecoratorOptions {
    var auto: AutoBase
    
    override var name: String {
        autoProperty.name + "Modern"
    }
    
    override var description: String {
        autoProperty.description + "updated stereo"
    }
    
    override var cost: Double {
        autoProperty.cost + 15
    }
    
    override func getCost() -> Double {
        autoProperty.getCost() + 15
    }
    
    init(auto: AutoBase) {
        self.auto = auto
        super.init(auto: auto, title: "Media")
    }
}

class SystemSecurity: DecoratorOptions {
    var auto: AutoBase
    
    override var name: String {
        autoProperty.name + "Security System"
    }
    
    override var description: String {
        autoProperty.description + "high safety"
    }
    
    override var cost: Double {
        autoProperty.cost + 15
    }
    
    override func getCost() -> Double {
        autoProperty.getCost() + 15
    }
    
    init(auto: AutoBase) {
        self.auto = auto
        super.init(auto: auto, title: "Security")
    }
}

var reno = Renault(name: "Renault", description: "Logan Active", cost: 500)
print(reno)

var myReno: AutoBase = MediaNAV(auto: reno)
print(myReno)

var securedReno: AutoBase = SystemSecurity(auto: myReno)
print(securedReno)
