import UIKit

protocol Progression {
    var first: Int { get set }
    var last: Int { get set }
    var step: Int { get set }
    
    var list: [Int] { get set }
    
    func progress()
}

extension Progression {
    mutating func templateMethod() {
        initializeProgression(first: first, last: last, step: step)
        progress()
        print(list)
    }
    
    mutating func initializeProgression(first: Int, last: Int, step: Int) {
        self.first = first
        self.last = last
        self.step = step
    }
}

class ArithmeticProgression: Progression {
    var first: Int
    
    var last: Int
    
    var step: Int
    
    var list: [Int] = []
    
    init(first: Int, last: Int, step: Int) {
        self.first = first
        self.last = last
        self.step = step
    }
    
    
    func progress() {
        var firstElement = first
        while firstElement < last {
            list.append(firstElement)
            firstElement += step
        }
    }
}

var progression: Progression = ArithmeticProgression(first: 1, last: 20, step: 3)
progression.templateMethod()
