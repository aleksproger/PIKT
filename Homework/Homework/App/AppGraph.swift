//
//  AppGraph.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class AppGraph {
    let app: App
    
    init(
        logger: Logger
    ) {
        let storage = DevicesStorageImpl()
        let performer = DefaultPerformer()
        
        app = AppController(
            logger: logger,
            requestPerformer: performer,
            devicesStorage: storage
        )
    }
}
