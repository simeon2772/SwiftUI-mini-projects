//
//  ContentView.swift
//  Guess the flag
//
//  Created by Simeon Ivanov on 27.06.23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerScore = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countires = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .padding()
                    .foregroundColor(.white)
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.title.weight(.heavy))
                        Text(countires[correctAnswer])
                            .font(.title.weight(.semibold))
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countires[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(color: .white, radius: 10)
                        }
                    }
                }
                Spacer()
                Text("Score \(playerScore)")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(playerScore)")
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            playerScore += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countires[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countires.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func finishGame() {
        if playerScore == 8 {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
