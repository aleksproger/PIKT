//
//  DeviceInfo.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

struct DeviceInfo {
    enum Location: String {
        case kitchen
        case hall
        case bedroom
    }
    
    let name: String
    let id: Int
    let location: Location
}
