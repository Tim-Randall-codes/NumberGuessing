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
    @StateObject var guessCounter: Counter
    @State var guessedNumberString: String = ""
    @State var displayVariable: String = ""
    @State var randomNumber = Int.random(in: 1..<200)
    var body: some View {
        VStack{
            Text("Guessing game").fontWeight(.heavy)
                .padding()
            Spacer()
            Text(String(randomNumber))
            Text("Guesses \(guessCounter.count)")
                .padding()
            Text(displayVariable)
                .padding()
            Spacer()
            TextField("Enter a number", text: $guessedNumberString)
                .padding()
                .keyboardType(.numberPad)
                .onReceive(Just(guessedNumberString)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.guessedNumberString = filtered
                    }
                }
            Button("Guess", action:{
                game()
            })
            .padding()
            .foregroundColor(.black)
            .border(Color.black, width: 2)
            Spacer()
        }
    }
    
    func game() {
        let guessedNumber: Int = Int(guessedNumberString) ?? 0
        if guessedNumber == randomNumber {
            viewRouter.currentPage = .page2
        }
        else {
            guessCounter.count += 1
            let selector = Int.random(in: 1...7)
            switch selector {
            case 1:
                if randomNumber > 100 {
                    displayVariable = "It is greater than 100"
                }
                else {
                    displayVariable = "It is less than 100"
                }
            case 2:
                if randomNumber % 3 == 0 {
                    displayVariable = "It is divisble by 3"
                }
                else {
                    displayVariable = "It is not divisible by 3"
                }
            case 3:
                if randomNumber % 2 == 0 {
                    displayVariable = "It is an even number"
                }
                else {
                    displayVariable = "It is an odd number"
                }
            case 4:
                if randomNumber % 5 == 0 {
                    displayVariable = "It is divisible by 5"
                }
                else {
                    displayVariable = "It is not divisible by 5"
                }
            case 5:
                if randomNumber % 10 == 0 {
                    displayVariable = "It is divisible by 10"
                }
                else {
                    displayVariable = "It is not divisible by 10"
                }
            case 6:
                if randomNumber <= 50 {
                    displayVariable = "It is less than or equal to 50"
                }
                else if randomNumber <= 100 {
                    displayVariable = "It is within 51 and 100"
                }
                else if randomNumber <= 150 {
                    displayVariable = "It is within 101 and 150"
                }
                else {
                    displayVariable = "It is over 150"
                }
            case 7:
                if randomNumber == 42 {
                    displayVariable = "It is 42"
                }
                else {
                    displayVariable = "It is not 42"
                }
            default: break
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), guessCounter: Counter())
    }
}
