//
//  AssistantController.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class AssistantController: Assistant {
    private let voiceRecognizer: VoiceRecognizer
    private let intentRecognizer: IntentRecognizer
    private let intentHandler: IntentHandler

    init(
        voiceRecognizer: VoiceRecognizer,
        intentRecognizer: IntentRecognizer,
        intentHandler: IntentHandler
    ) {
        self.voiceRecognizer = voiceRecognizer
        self.intentRecognizer = intentRecognizer
        self.intentHandler = intentHandler
    }
    
    func startRecognition(
        handler: @escaping (Result<RecognitionResponse, RecognitionError>) -> Void
    ) {
        voiceRecognizer.recognize(handler: { result in
            switch result {
            case let .success(response):
                let scenario = intentRecognizer.createScenario(response)
                intentHandler.handleIntent(scenario)
            case.failure:
                print("Recognition Error")
            }
            handler(result)
        })
    }
}
