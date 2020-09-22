//
//  DevicesStorageImpl.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

final class DevicesStorageImpl: DevicesStorage {
    private var storage = [UUID: Device]()
    
    func add(_ device: Device) {
        storage[device.id] = device
    }
    
    func remove(_ id: UUID) {
        storage.removeValue(forKey: id)
    }
}
