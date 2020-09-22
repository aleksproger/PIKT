//
//  DateStrategy.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

enum DateStrategy {
    static let years = YearsStrategy()
    static let full = FullDateStrategy()
}

protocol DateProvidingStrategy {
    var date: String { get }
}

struct YearsStrategy: DateProvidingStrategy {
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: Date())
    }
}

struct FullDateStrategy: DateProvidingStrategy {
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "DD-MM-YYYY"
        return dateFormatter.string(from: Date())
    }
}
