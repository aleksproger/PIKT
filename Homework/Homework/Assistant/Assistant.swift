//
//  Assistant.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol Assistant {
    func startRecognition(
        handler: @escaping (Result<RecognitionResponse, RecognitionError>) -> Void
    )
}
