//
//  MotherView.swift
//  NumberGuessing
//
//  Created by Tim Randall on 28/7/21.
//

import SwiftUI

struct MotherView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var guessCounter: Counter
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            ContentView(viewRouter: viewRouter, guessCounter: guessCounter)
        case .page2:
            ContentView2(viewRouter: viewRouter, guessCounter: guessCounter)
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter(), guessCounter: Counter())
    }
}
