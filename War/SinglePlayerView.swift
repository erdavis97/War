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
                    Image("gray_back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 180.0)
                        .offset(x: 0.0, y: -170.0)
                    if flipped {
                        Image("KC")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 180.0)
                            .offset(x: 0.0, y: -170.0)
                    }
                }
                //add button to flip, add animation
                VStack {
                    CustomText1(text: "CPU: \(points)")
                        .offset(x: -145.0, y: 0.0)
                    CustomText1(text: "Player 1: \(points)")
                        .offset(x: -128.0, y: 0.0)
                }
                Image("blue_back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 180.0)
                    .offset(x: 0.0, y: 190.0)
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
        Text(text).font(Font.custom("", size: 36)).fontWeight(.bold).foregroundColor(Color.white)
    }
}
