//
//  DateLoggerDecorator.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class DateLoggerDecorator: Logger {
    private let subject: Logger
    private let dateProvider: DateProvider
    
    init(
        subject: Logger,
        dateProvider: DateProvider
    ) {
        self.subject = subject
        self.dateProvider = dateProvider
    }
    
    func log(_ logMessage: String) {
        let date = dateProvider.getCurrentDate(with: DateStrategy.full)
        print("[\(date)]:")
        print("[")
        subject.log(logMessage)
        print("]")
    }
}
