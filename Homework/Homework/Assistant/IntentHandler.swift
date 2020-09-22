//
//  IntentHandler.swift
//  Homework
//
//  Created by Alex on 22.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol IntentHandler {
    func handleIntent(_ intent: Intent)
}

final class IntentHandlerImpl: IntentHandler {
    func handleIntent(_ intent: Intent) {
        print("Handling intent")
    }
}
