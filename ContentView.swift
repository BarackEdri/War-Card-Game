//
//  ContentView.swift
//  War Card Game
//
//  Created by Barak Edry on 20/10/2023.
//

import SwiftUI

struct ContentView: View {
   
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {

        
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(
                    action: {
                        deal()
                    },
                    label: {
                        Image("button")
                    }
                )
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").font(.headline).padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU").font(.headline).padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
                
            }
        }
        
    }
    
    func deal(){
        // Randomize the player card
        let playerRand = Int.random(in: 2...14)
        playerCard = "card" + String(playerRand)
        
        // Randomize the cpu card
        let cpuRand = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuRand)
        
        // Update the scores
        if playerRand != cpuRand {
            if playerRand > cpuRand {
                playerScore = playerScore + 1
            }
            else {
                cpuScore = cpuScore + 1
            }
        }
    }
}

#Preview {
    ContentView()
}
