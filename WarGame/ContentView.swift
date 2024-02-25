//
//  ContentView.swift
//  WarGame
//
//  Created by Brage Skrettingland on 25/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var player1card = "card7"
    @State  var player2card = "card3"
    @State var showAlert = false
    @State  var player1score = 0
    @State var player2score = 0
    func deal(){
        var player1cardvalue = Int.random(in: 2...14)
        var player2cardvalue = Int.random(in: 2...14)
        player1card = "card" + String(player1cardvalue)
        player2card = "card" + String(player2cardvalue)
        if (player1cardvalue > player2cardvalue){
            player1score = player1score + 1
        }
        else if (player1cardvalue < player2cardvalue){
            player2score = player2score + 1
        }
        if (player1score == 20) || (player2score == 20) {
            showAlert = true
        }
        
    }
    func resetgame(){
        player1score = 0
        player2score = 0
    }
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Image(player1card)
                        .padding(40)
                        .shadow(radius: 20)
                    Spacer()
                    Image(player2card)
                        .padding(40)
                        .shadow(radius: 20)
                }
                
                Button {
                    deal()
                    
                } label: {
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player1")
                            .font(.headline)
                            .fontDesign(.rounded)
                        Text(String(player1score))
                            .padding(.bottom,100)
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("Player2")
                            .font(.headline)
                            .fontDesign(.rounded)
                        Text(String(player2score))
                            .padding(.bottom,100)
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                }
                
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Game Over"),
                    dismissButton: .default(Text("Restart")) {
                        resetgame()
                    }
                )
            }
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
