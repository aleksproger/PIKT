//
//  main.swift
//  Homework
//
//  Created by Alex on 21.09.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import Foundation

let logger = DefaultLogger.shared

let dateProvider = DateProviderImpl(
    logger: logger
)

let appGraph = AppGraph(
    logger: DateLoggerDecorator(
        subject: logger,
        dateProvider: dateProvider
    )
)

let conditioner = AirConditioner(
    location: .bedroom,
    dateProvider: dateProvider
)

appGraph.app.connect(device: conditioner)

let temperatureIndicator = TemperatureIndicatorImpl()
let temperatureAdapter = TemperatureAdapter(
    subject: temperatureIndicator,
    dateProvider: dateProvider
)

appGraph.app.connect(device: temperatureAdapter)

let analytics = temperatureAdapter.getAnalytics(
    dateProvidingStrategy: DateStrategy.full
)
print(analytics)

conditioner.sendCommand(command: .turnOff)
print(conditioner.state)
conditioner.undoLast()
print(conditioner.state)

let assistant = AssistantController(
    voiceRecognizer: VoiceRecognizerImpl(),
    intentRecognizer: IntentRecognizerImpl(),
    intentHandler: IntentHandlerImpl()
)
