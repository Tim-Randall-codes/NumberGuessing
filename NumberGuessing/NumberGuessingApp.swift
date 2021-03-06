//
//  NumberGuessingApp.swift
//  NumberGuessing
//
//  Created by Tim Randall on 28/7/21.
//

import SwiftUI

@main
struct NumberGuessingApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var guessCounter = Counter()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter, guessCounter: guessCounter)
        }
    }
}
