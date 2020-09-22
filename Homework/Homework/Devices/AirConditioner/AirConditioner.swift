//
//  TemperatureIndicator.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class AirConditioner: Device {
    enum State {
        case off
        case on
    }
    var id = UUID()
    
    private let location: DeviceInfo.Location
    private let dateProvider: DateProvider
    
    private var description: String {
        return "\(String(describing: self))"
    }
    
    private(set) var state: State = .off
    
    init(
        location: DeviceInfo.Location,
        dateProvider: DateProvider
    ) {
        self.location = location
        self.dateProvider = dateProvider
    }
    
    func getAnalytics(
        dateProvidingStrategy strategy: DateProvidingStrategy
    ) -> DeviceAnalytics {
        DeviceAnalytics(
            date: dateProvider.getCurrentDate(with: strategy),
            name: "Air Conditioner",
            description: "\(description) located in \(location.rawValue)"
        )
    }
    
    func sendCommand(command: Action) {
        switch command {
        case .turnOn:
           let command = Command(
            execute: { self.state = .on },
            unExecute: { self.state = .off }
           )
           CommandExecutorImpl.shared.executeCommand(command: command)
        case .turnOff:
            let command = Command(
             execute: { self.state = .off },
             unExecute: { self.state = .on }
            )
            CommandExecutorImpl.shared.executeCommand(command: command)
        }
    }
    
    func undoLast() {
        CommandExecutorImpl.shared.undo()
    }
}
