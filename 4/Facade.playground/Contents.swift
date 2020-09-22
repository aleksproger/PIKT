import UIKit

class EventHandler {
    func handle(_ event: String) {
        print(event)
    }
}

class Drive {
    var driveEvent: EventHandler
    
    private var twist: String = "" {
        didSet {
            driveEvent.handle(twist)
        }
    }
    
    var toString: String {
        "Привод \(twist)"
    }
    
    init(driveEvent: EventHandler = EventHandler()) {
        self.driveEvent = driveEvent
    }
    
    func drive() {
        twist = "Starting"
    }
    
    func turnLeft() {
        twist = "Turning left"
    }
    
    func turnRight() {
        twist = "Turning right"
    }
    
    func stop() {
        twist = "Stop"
    }
}

class Power {
    var powerEvent: EventHandler
    
    var microwavePower: String = ""{
        didSet {
            powerEvent.handle(microwavePower)
        }
    }
    
    var toString: String {
        "Мощность \(microwavePower)"
    }
    
    init(powerEvent: EventHandler = EventHandler()) {
        self.powerEvent = powerEvent
    }
}

class Notification {
    var notificationEvent: EventHandler
    
    private var message: String = ""{
        didSet {
            notificationEvent.handle(message)
        }
    }
    
    var toString: String {
        "Информация \(message)"
    }
    
    init(notificationEvent: EventHandler = EventHandler()) {
        self.notificationEvent = notificationEvent
    }
    
    func startNotification() {
        message = "Operation started"
    }
    
    func stopNotification() {
        message = "Operation finished"
    }
}

class Microwave {
    private let drive: Drive
    private let power: Power
    private let notification: Notification
    
    init(drive: Drive, power: Power, notification: Notification) {
        self.drive = drive
        self.power = power
        self.notification = notification
    }
    
    func defrost() {
        notification.startNotification()
        power.microwavePower = "1000"
        drive.turnRight()
        drive.stop()
    }
}

class Program {
    func main() {
        let drive = Drive()
        let power = Power()
        let notification = Notification()
        let microwave = Microwave(drive: drive, power: power, notification: notification)
        print("Starting defrost")
        microwave.defrost()
    }
}

Program().main()
