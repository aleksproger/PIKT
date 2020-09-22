//
//  DefaultLogger.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class DefaultLogger: Logger {
    static let shared: Logger = DefaultLogger()
    
    private init() {}
    
    func log(_ logMessage: String) {
        print("\t\(logMessage)")
    }
}
