//
//  CommandsExecutor.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

protocol CommandExecutor {
    func executeCommand(command: Command)
    func undo()
    func redo()
}

final class CommandExecutorImpl: CommandExecutor {
    static let shared: CommandExecutor = CommandExecutorImpl()
    
    private init() {}
    
    private var commands: [Command]  = []
    
    func executeCommand(command: Command) {
        commands.append(command)
        command.execute()
    }
    
    func undo() {
        commands.last?.unExecute()
    }
    
    func redo() {
        commands.last?.execute()
    }
}
