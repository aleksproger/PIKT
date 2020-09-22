//
//  VoiceRecognizer.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol VoiceRecognizer {
    func recognize(
        handler: (Result<RecognitionResponse, RecognitionError>) -> Void
    )
}

final class VoiceRecognizerImpl: VoiceRecognizer {
    func recognize(handler: (Result<RecognitionResponse, RecognitionError>) -> Void) {
        print("Recognizing voice")
        let result: Result<RecognitionResponse, RecognitionError> = .success(
            RecognitionResponse(
                recognizedText: "Some voice recognition",
                recognitionLanguage: .russian
            )
        )
        handler(result)
    }
}
