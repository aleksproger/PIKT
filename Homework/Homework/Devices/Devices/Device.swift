//
//  Device.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol Device {
    var id: UUID { get }
    func getAnalytics(dateProvidingStrategy: DateProvidingStrategy) -> DeviceAnalytics
    func sendCommand(command: Action)
    func undoLast()
}
