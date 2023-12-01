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
                        CardImage(name: "KC")
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
                    }
                }
                ZStack {
                    CardImage(name: "blue_back")
                        .offset(x: 0.0, y: 190.0)
                    if flipped {
                        CardImage(name: "QC")
                            .offset(x: 0.0, y: 190.0)
                    }
                }
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
//start work on card images system (card value) (suit number)
