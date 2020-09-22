//
//  RecognitionResponse.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

struct RecognitionResponse {
    enum Language {
        case russian
        case english
    }
    var recognizedText: String
    var recognitionLanguage: Language
}
