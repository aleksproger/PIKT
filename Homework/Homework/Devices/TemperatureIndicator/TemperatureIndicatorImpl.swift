//
//  TemperatureIndicatorImpl.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class TemperatureIndicatorImpl: TemperatureIndicator {
    var id: UUID = UUID()
    
    func getTemperature() -> String {
        "\(Double.random(in: -30...30)) C"
    }
}
