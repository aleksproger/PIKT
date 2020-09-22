//
//  AirConditionerFactory.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class AirConditionerFactory: DevicesFactory {
    private let dateProvider: DateProvider
    
    init(
        dateProvider: DateProvider
    ) {
        self.dateProvider = dateProvider
    }
    
    func makeDevice(
        _ info: DeviceInfo
    ) -> Device {
        AirConditioner(
            location: info.location,
            dateProvider: dateProvider
        )
    }
}
