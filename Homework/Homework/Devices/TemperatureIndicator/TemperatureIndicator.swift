//
//  Temperature.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol TemperatureIndicator {
    var id: UUID { get }
    func getTemperature() -> String
}
