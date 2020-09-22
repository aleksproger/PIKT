//
//  TemperatureAdapter.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class TemperatureAdapter: Device {
    enum State {
        case idle
    }
    
    var id: UUID {
        subject.id
    }
    
    private let subject: TemperatureIndicator
    private let dateProvider: DateProvider
    private let state: State = .idle
    
    init(
        subject: TemperatureIndicator,
        dateProvider: DateProvider
    ) {
        self.subject = subject
        self.dateProvider = dateProvider
    }
    
    func getAnalytics(
        dateProvidingStrategy: DateProvidingStrategy
    ) -> DeviceAnalytics {
        DeviceAnalytics(
            date: dateProvider.getCurrentDate(with: dateProvidingStrategy),
            name: String(describing: subject),
            description: "Temperature is \(subject.getTemperature())"
        )
    }
    
    func sendCommand(command: Action) {}
    
    func undoLast() {}
}
