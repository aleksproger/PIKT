//
//  RequestPerformer.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

protocol RequestPerformer {
    func perform(
        handler: @escaping () -> Void
    )
}

final class DefaultPerformer: RequestPerformer {
    func perform(handler: @escaping () -> Void) {
        print("Performing network request")
        handler()
    }
}
