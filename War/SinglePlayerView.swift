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
    @State private var winner = ""
    @State private var pointsPlayer = 0
    @State private var pointsCPU = 0
    @State private var cardValuePlayer = 0
    @State private var cardValueCPU = 0
    @State private var suitValuePlayer = 0
    @State private var suitValueCPU = 0
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
                            HStack {
                                CardImage(name: "gray_back")
                                CardImage(name: "\(cardValueCPU) \(suitValueCPU)")
                                CardImage(name: "gray_back")
                            }
                        }
                }
                HStack {
                    VStack {
                        CustomText1(text: "CPU: \(pointsCPU)")
                            .offset(x: -51.0, y: 0.0)
                        CustomText1(text: "Player 1: \(pointsPlayer)")
                            .offset(x: -33.0, y: 0.0)
                    }
                    ZStack {
                        Button("Flip") {
                            flipped.toggle()
                            cardValueCPU = Int.random(in: 2...14)
                            cardValuePlayer = Int.random(in: 2...14)
                            suitValueCPU = Int.random(in: 1...4)
                            suitValuePlayer = Int.random(in: 1...4)
                            playTurn()
                        }
                        if tie {
                            Button("Tie") {
                                flipped.toggle()
                                cardValueCPU = Int.random(in: 2...14)
                                cardValuePlayer = Int.random(in: 2...14)
                                suitValueCPU = Int.random(in: 1...4)
                                suitValuePlayer = Int.random(in: 1...4)
                               turnWinner()
                            }
                        }
                    }
                       .buttonStyle(CustomButtonStyle())
                       .offset(x: -15.0, y: 0.0)
                    CustomText1(text: String(winner))
                        .frame(width: 86, height: 55)
                }
                ZStack {
                    CardImage(name: "blue_back")
                        .offset(x: 0.0, y: 190.0)
                    if flipped {
                        CardImage(name: "\(cardValuePlayer) \(suitValuePlayer)")
                            .offset(x: 0.0, y: 190.0)
                    }
                    if tie {
                        HStack {
                            CardImage(name: "blue_back")
                            CardImage(name: "\(cardValuePlayer) \(suitValuePlayer)")
                            CardImage(name: "blue_back")
                        }
                    }
                }
            }
        }
    }
    // add gameplay for ties, add card flip animation, add ending
    func turnWinner() {
        if cardValueCPU > cardValuePlayer {
            pointsCPU += cardValueCPU
            winner = ("CPU WINS")
        }
        else if cardValuePlayer > cardValueCPU {
            pointsPlayer += cardValuePlayer
            winner = ("PLAYER WINS")
        }
        else if cardValueCPU == cardValuePlayer {
            tie = true
        }
    }
    
    func playTurn() {
        if flipped == false {
            cardValuePlayer = 0
            cardValueCPU = 0
            suitValuePlayer = 0
            suitValueCPU = 0
            tie = false
        }
        else {
            turnWinner()
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
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


