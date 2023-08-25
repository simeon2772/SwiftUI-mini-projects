//
//  ContentView.swift
//  Card Game
//
//  Created by Simeon Ivanov on 20.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard: String = "card7"
    @State var computerCard: String = "card11"
    
    @State var playerScore: Int = 0
    @State var computerScore: Int = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image("logo").padding()
                
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(computerCard)
                    Spacer()
                }
                .padding()

                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text("Player")
                        Spacer()
                        Text(String(playerScore))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom)
                    Spacer()
                    VStack {
                        Spacer()
                        Text("CPU")
                        Spacer()
                        Text(String(computerScore))
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom)
                    
                    Spacer()
                }
        
            }
            .padding()
        }
    }
    
    func deal() {
        // randomize player cards
        var playerNum = Int.random(in: 2...14)
        playerCard = "card" + String(playerNum)
        
        // randomize computer cards
        var computerNum = Int.random(in: 2...14)
        computerCard = "card" + String(computerNum)
        
        // update score according to result
        if playerNum > computerNum {
            playerScore += 1
        } else if computerNum > playerNum{
            computerScore += 1
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
