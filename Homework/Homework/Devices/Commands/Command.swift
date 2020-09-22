//
//  Command.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

struct Command {
    var execute: () -> Void
    var unExecute: () -> Void
}

enum Action {
    case turnOn
    case turnOff
}

