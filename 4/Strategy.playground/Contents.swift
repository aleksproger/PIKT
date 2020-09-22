import UIKit

protocol StrategySort {
    var title: String { get set }
    
    func sort(array: inout [Int]) -> Void
}

class InsertionSort: StrategySort {
    var title: String = "Insertion Sort"
    
    func sort(array: inout [Int]) {
        guard array.count >= 2 else {
            return
        }
        for current in 1..<array.count {
            for shifting in (1...current).reversed() {
                if array[shifting] < array[shifting - 1] {
                    array.swapAt(shifting, shifting - 1)
                } else {
                    break
                }
            }
        }
    }
}

class SelectionSort: StrategySort {
    var title: String = "Strategy Sort"
    
    func sort(array: inout [Int]) {
        for current in 0..<(array.count - 1) {
            var lowest = current
            for other in (current + 1)..<array.count {
                if array[lowest] > array[other] {
                    lowest = other
                }
            }
            if lowest != current {
                array.swapAt(lowest, current)
            }
        }
    }
}

class Context {
    private let strategy: StrategySort
    private var array: [Int]
    
    init(array: [Int], strategy: StrategySort) {
        self.array = array
        self.strategy = strategy
    }
    
    func sort() {
        strategy.sort(array: &array)
    }
}

var arr1 = [31, 15, 20, 2, 4, 10, 68]
let sort = SelectionSort()
let context = Context(array: arr1, strategy: sort)
context.sort()
print(arr1)

var arr2 = [1, 2, 10, 6, 4]
let sort2 = InsertionSort()
let context2 = Context(array: arr2, strategy: sort2)
context.sort()
print(arr2)

class BubbleSort: StrategySort {
    var title: String = "Bubble sort"
    
    func sort(array: inout [Int]) {
        guard array.count >= 2 else {
            return
        }
        for end in (1..<array.count).reversed() {
            var swapped = false
            for current in 0..<end {
                if array[current] > array[current + 1] {
                    array.swapAt(current, current + 1)
                    swapped = true
                }
            }
            if !swapped {
                return
            }
        }
    }
}
