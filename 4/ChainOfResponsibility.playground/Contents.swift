import UIKit

class Receiver {
    var bankTransfer: Bool
    var moneyTransfer: Bool
    var paypalTransfer: Bool
    
    init(isBank: Bool, isMoney: Bool, isPayPal: Bool) {
        self.bankTransfer = isBank
        self.moneyTransfer = isMoney
        self.paypalTransfer = isPayPal
    }
}

protocol PaymentHandler {
    var successor: PaymentHandler? { get set }
    func handle(receiver: Receiver)
}

class BankPaymentHandler: PaymentHandler {
    var successor: PaymentHandler?
    
    func handle(receiver: Receiver) {
        if receiver.bankTransfer {
            print("Bank transfering...")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}

class MoneyPaymentHandler: PaymentHandler {
    var successor: PaymentHandler?
    
    func handle(receiver: Receiver) {
        if receiver.moneyTransfer {
            print("Transfering money")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}

class PayPalPaymentHandler: PaymentHandler {
    var successor: PaymentHandler?
    
    func handle(receiver: Receiver) {
        if receiver.paypalTransfer {
            print("Transfering thru paypal")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}

let receiver = Receiver(isBank: false , isMoney: true, isPayPal: true)

var bankHandler = BankPaymentHandler()
var moneyHandler = MoneyPaymentHandler()
var paypalHandler = PayPalPaymentHandler()

bankHandler.successor = moneyHandler
moneyHandler.successor = paypalHandler

bankHandler.handle(receiver: receiver)
