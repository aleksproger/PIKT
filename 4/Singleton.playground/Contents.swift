import UIKit

class LogWriter {
    func log(message: String) {
        print("Log Entry:")
        print(Date(), "Action:", message)
    }
}

class Log {
    private init () {}
    
    static let shared = Log()
    
    func logExecution(_ message: String) {
        Self.Loger(logMessage: message, writer: LogWriter())
    }
    
    private static func Loger(logMessage: String, writer: LogWriter) {
        writer.log(message: logMessage)
    }
}

enum MathOp {
    case plus
    case minus
    case multiply
    case divide
}

class Operation {
    static func run(operationCode: MathOp, operand: Double) -> Double{
        let lg2 = Log.shared
        var rez: Double = 0
        switch operationCode {
        case .plus:
            lg2.logExecution("Adding + \(operand)")
            rez += operand
        case .minus:
            lg2.logExecution("Minus + \(operand)")
            rez -= operand
        case .multiply:
            lg2.logExecution("Multipply * \(operand)")
            rez *= operand
        case .divide:
            lg2.logExecution("Divide / \(operand)")
            rez /= operand
        }
        return rez
    }
}

var lg = Log.shared
lg.logExecution("Start")
var op = Operation.run(operationCode: .minus, operand: 35)
op = Operation.run(operationCode: .plus, operand: 30)


