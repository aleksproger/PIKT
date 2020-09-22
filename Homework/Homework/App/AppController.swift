//
//  AppController.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class AppController: App {
    private let logger: Logger
    private let requestPerformer: RequestPerformer
    private let devicesStorage: DevicesStorage
    
    init(
        logger: Logger,
        requestPerformer: RequestPerformer,
        devicesStorage: DevicesStorage
    ) {
        self.logger = logger
        self.requestPerformer = requestPerformer
        self.devicesStorage = devicesStorage
    }
    
    func connect(device: Device) {
        requestPerformer.perform() { [logger, devicesStorage] in
            devicesStorage.add(device)
            logger.log("Request has been performed")
        }
    }
}
