//
//  DateProvider.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol DateProvider {
    func getCurrentDate(
        with strategy: DateProvidingStrategy
    ) -> String
}

final class DateProviderImpl: DateProvider {
    private let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func getCurrentDate(with strategy: DateProvidingStrategy) -> String {
        logger.log("Date requested")
        return strategy.date
     }
}
