//
//  ContentView2.swift
//  NumberGuessing
//
//  Created by Tim Randall on 28/7/21.
//

import SwiftUI

struct ContentView2: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var guessCounter: Counter
    var body: some View {
        VStack{
            Text("You Win!")
                .padding()
            Text("Good job, you took \(guessCounter.count + 1) attempts!")
                .padding()
            Button("Play again", action:{
                guessCounter.count = 0
                viewRouter.currentPage = .page1
            })
            .padding()
            .foregroundColor(.black)
            .border(Color.black, width: 2)            
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2(viewRouter: ViewRouter(), guessCounter: Counter())
    }
}
