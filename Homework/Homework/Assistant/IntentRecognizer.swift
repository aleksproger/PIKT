//
//  IntentRecognizer.swift
//  Homework
//
//  Created by Alex on 22.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

enum Intent {
    case weatherForecast
    case deviceInteraction
    case other
}

protocol IntentRecognizer {
    func createScenario(_ recognitionResponse: RecognitionResponse) -> Intent
}

final class IntentRecognizerImpl: IntentRecognizer {
    func createScenario(_ recognitionResponse: RecognitionResponse) -> Intent {
        print("Some decision was made")
        return .other
    }
}
