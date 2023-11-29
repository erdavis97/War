//
//  SinglePlayerView.swift
//  War
//
//  Created by Ethan Davis on 11/27/23.
//

import SwiftUI

struct SinglePlayerView: View {
    @State private var remainingCards = ""
    @State private var flipped = false
    var body: some View {
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
            HStack {
                Text("CPU: \(remainingCards)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .offset(x: -90.0, y: 0.0)
                Text("Player 1: \(remainingCards)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .offset(x: 90.0, y: 0.0)
            }
            Image("blue_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 180.0)
                .offset(x: 0.0, y: 190.0)
        }
    }
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}

