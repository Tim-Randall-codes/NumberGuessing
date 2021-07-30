//
//  ContentView.swift
//  NumberGuessing
//
//  Created by Tim Randall on 28/7/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @State var guessedNumberString: String = ""
    @State var displayVariable: String = ""
    let randomNumber = Int.random(in: 1...200)
    var body: some View {
        VStack{
            Text("Guessing game")
                .padding()
            Text(String(randomNumber))
            TextField("Enter a number", text: $guessedNumberString)
                .keyboardType(.numberPad)
                .onReceive(Just(guessedNumberString)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.guessedNumberString = filtered
                    }
                }
            Button("Guess", action:{
                let guessedNumber: Int = Int(guessedNumberString) ?? 0
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
