//
//  SinglePlayerView.swift
//  War
//
//  Created by Ethan Davis on 11/27/23.
//

import SwiftUI
struct SinglePlayerView: View {
    @State private var flipped = false
    @State private var tie = false
    @State private var gameOver = false
    @State private var stalemate = false
    @State private var test = false
    @State private var winner = ""
    @State private var pointsPlayer = 0
    @State private var pointsCPU = 0
    @State private var cardValuePlayer = 0
    @State private var cardValueCPU = 0
    @State private var suitValuePlayer = 0
    @State private var suitValueCPU = 0
    @State private var preTiePointsCPU = 0
    @State private var preTiePointsPlayer = 0
    let name : String
    var body: some View {
        ZStack {
            Image("Green Background")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300.0, height: 1000)
            VStack {
                ZStack {
                    CardImage(name: "gray_back")
                        .offset(x: 0.0, y: -170.0)
                    if flipped {
                        CardImage(name: "\(cardValueCPU) \(suitValueCPU)")
                            .offset(x: 0.0, y: -170.0)
                    }
                        if tie {
                            ZStack {
                                CardImage(name: "\(cardValueCPU) \(suitValueCPU)")
                                if flipped {
                                    CardImage(name: "gray_back")
                                }
                            }
                        }
                }
                HStack {
                    VStack {
                        CustomText1(text: "CPU: \(pointsCPU)")
                            .offset(x: -51.0, y: 7.5)
                        CustomText1(text: "\(name): \(pointsPlayer)")
                            .offset(x: -40.0, y: 17.5)
                        Button("Reset") {
                            restart()
                        }
                        .background(Rectangle().frame(width: 65.0, height: 30.0) .foregroundColor(.yellow).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5))
                        .offset(x: -33.0, y: 75.0)
                    }
                    ZStack {
                        Button("Flip") {
                            flipped.toggle()
                                setRandom()
                                playTurn()
                        }
                        if tie {
                            Button("Tie") {
                                flipped.toggle()
                                setRandom()
                                turnWinner()
                                if flipped == false {
                                    test = true
                                    preTiePointsCPU = 0
                                    preTiePointsCPU = 0
                                    if cardValueCPU == cardValuePlayer {
                                        stalemate = true
                                    }
                                }
                                else {
                                    resetTie()
                                    flipped = false
                                    playTurn()
                                }
                            }
                        }
                    }
                       .buttonStyle(CustomButtonStyle())
                       .offset(x: 0, y: 0.0)
                    CustomText1(text: String(winner))
                        .frame(width: 86, height: 55)
                }
                ZStack {
                    CardImage(name: "blue_back")
                        .offset(x: 0.0, y: 170.0)
                    if flipped {
                        CardImage(name: "\(cardValuePlayer) \(suitValuePlayer)")
                            .offset(x: 0.0, y: 170.0)
                    }
                    if tie {
                        ZStack {
                            CardImage(name: "\(cardValuePlayer) \(suitValuePlayer)")
                            if flipped {
                                CardImage(name: "blue_back")
                            }
                        }
                    }
                }
            }
        }
        .alert(isPresented: $gameOver, content: {
            Alert(title: Text("\(winner)"), dismissButton:
                    .destructive(Text("Restart"), action: {
                        withAnimation(Animation.default) {
                            restart()
                            gameOver = false
                            stalemate = false
                        }
                    }))
                 })
    }
    
    
    func checkWinner() {
        if stalemate == true {
            winner = ("STALEMATE: EVERYONE LOSES")
            gameOver = true
            test = true
        }
        else if pointsCPU >= 100 {
            winner = ("CPU WINS")
            gameOver = true
            test = true
        }
        else if pointsPlayer >= 25 {
            gameOver = true
            winner = ("\(name) WINS")
            test = true
        }
    }
    
    func setRandom() {
        checkWinner()
        cardValueCPU = Int.random(in: 2...14)
        cardValuePlayer = Int.random(in: 2...14)
        suitValueCPU = Int.random(in: 1...4)
        suitValuePlayer = Int.random(in: 1...4)
        //Int.random(in: 2...14)
    }
    
    func turnWinner() {
        checkWinner()
        if cardValueCPU > cardValuePlayer {
            pointsCPU += cardValuePlayer
            pointsCPU += preTiePointsPlayer
            winner = ("CPU WINS")
        }
        else if cardValuePlayer > cardValueCPU {
            pointsPlayer += cardValueCPU
            pointsPlayer += preTiePointsCPU
            winner = ("\(name) WINS")
        }
        else if cardValueCPU == cardValuePlayer {
            tie = true
            if tie == true {
                checkWinner()
                preTiePointsCPU = cardValueCPU
                preTiePointsPlayer = cardValuePlayer
            }
        }
    }
    
    func resetTie() {
         if test == true {
            if cardValueCPU > cardValuePlayer {
                pointsCPU -= (cardValuePlayer + preTiePointsPlayer)
            }
            else if cardValuePlayer > cardValueCPU {
                pointsPlayer -= (cardValueCPU + preTiePointsCPU)
            }
             else if cardValueCPU == cardValuePlayer {
                 stalemate = true
             }
        }
    }
    
    func resetCards() {
        cardValuePlayer = 0
        cardValueCPU = 0
        suitValuePlayer = 0
        suitValueCPU = 0
        preTiePointsCPU = 0
        preTiePointsPlayer = 0
    }
    
    func playTurn() {
        if flipped == false {
            if test == false {
                winner = ""
            }
            resetCards()
            tie = false
            if tie == false {
                test = false
            }
        }
        else {
            turnWinner()
        }
    }
    
    func restart() {
        flipped = false
        resetCards()
        pointsCPU = 0
        pointsPlayer = 0
    }
    
   
    
    
}


struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView(name: "")
    }
}


struct CustomText1: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("", size: 22)).fontWeight(.bold).foregroundColor(Color.white)
    }
}


struct CardImage: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100.0, height: 180.0)
    }
}


struct CustomButtonStyle: ButtonStyle {
    func makeBody (configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60).font(Font.custom("", size: 24))
            .padding().background(.red).opacity(configuration.isPressed ? 0.0: 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


