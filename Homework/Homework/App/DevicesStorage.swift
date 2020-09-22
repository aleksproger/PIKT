//
//  DevicesStorage.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol DevicesStorage {
    func add(_ device: Device)
    func remove(_ id: UUID)
}
