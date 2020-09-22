import UIKit

protocol Command {
    var operand: Double { get set }
    var unit: ArithmeticUnit { get set }
    func execute()
    func unExecute()
}

enum OperationCode {
    case plus
    case minus
    case divide
    case multiply
}
class ArithmeticUnit {
    private(set) var register: Double
    
    init(register: Double) {
        self.register = register
    }
    
    func run(code: OperationCode, operand: Double) {
        switch code {
        case .plus:
            register += operand
        case .minus:
            register -= operand
        case .divide:
            register /= operand
        case .multiply:
            register *= operand
        }
    }
}

class ControlUnit {
    var commands: [Command] = []
    var current: Int = 0
    
    func storeCommand(_ command: Command) {
        commands.append(command)
    }
    
    func executeCommand() {
        commands[current].execute()
        current += 1
    }
    
    func undo() {
        commands[current-1].unExecute()
    }
    
    func redo() {
        commands[current-1].execute()
    }
}


class Add: Command {
    var operand: Double
    
    var unit: ArithmeticUnit
    
    init(operand: Double, unit: ArithmeticUnit) {
        self.operand = operand
        self.unit = unit
    }
    
    func execute() {
        unit.run(code: .plus, operand: operand)
    }
    
    func unExecute() {
        unit.run(code: .minus, operand: operand)
    }
}

class Calculator {
    var arithmeticUnit: ArithmeticUnit = ArithmeticUnit(register: 0)
    var controlUnit: ControlUnit = ControlUnit()
    
    func run(_ command: Command) -> Double {
        controlUnit.storeCommand(command)
        controlUnit.executeCommand()
        return arithmeticUnit.register
    }
    
    func add(_ operand: Double) -> Double {
        run(Add(operand: operand, unit: arithmeticUnit))
    }
    
    func undo() {
        controlUnit.undo()
    }
    
    func redo() {
        controlUnit.redo()
    }
}

var calculator = Calculator()
var result: Double = 0
result = calculator.add(5)
print(result)

result = calculator.add(4)
print(result)

result = calculator.add(3)
print(result)

calculator.undo()
print(calculator.arithmeticUnit.register)
