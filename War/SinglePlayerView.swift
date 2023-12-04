//
//  SinglePlayerView.swift
//  War
//
//  Created by Ethan Davis on 11/27/23.
//

import SwiftUI

struct SinglePlayerView: View {
    @State private var points = ""
    @State private var flipped = false
    @State private var cardValue = 0
    @State private var suitValue = 0
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
                        CardImage(name: "\(cardValue) \(suitValue)")
                            .offset(x: 0.0, y: -170.0)
                    }
                }
                //add animation
                HStack {
                    VStack {
                        CustomText1(text: "CPU: \(points)")
                            .offset(x: -145.0, y: 0.0)
                        CustomText1(text: "Player 1: \(points)")
                            .offset(x: -128.0, y: 0.0)
                    }
                    Button("Flip") {
                        flipped.toggle()
                        chooseRandom(times: 1)
                        //set values to random ones between 1...14 and 1...4
                    }
                }
                ZStack {
                    CardImage(name: "blue_back")
                        .offset(x: 0.0, y: 190.0)
                    if flipped {
                        CardImage(name: "\(cardValue) \(suitValue)")
                            .offset(x: 0.0, y: 190.0)
                    }
                }
            }
        }
    }
    
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                cardValue = Int.random(in: 1...14)
                suitValue = Int.random(in: 1...4)
                chooseRandom(times: times - 1)
            }
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

//add custom button

