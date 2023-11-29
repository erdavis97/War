//
//  SinglePlayerView.swift
//  War
//
//  Created by Ethan Davis on 11/27/23.
//

import SwiftUI

struct SinglePlayerView: View {
    var body: some View {
        VStack {
            Image("gray_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 180.0)
                .offset(x: 0.0, y: -130.0)
            Group {
                Text("CPU has (filler) cards remaining")
                    .padding()
                Text("Player 1 has (filler) cards remaining")
            }
            Image("blue_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 180.0)
                .offset(x: 0.0, y: 150.0)
        }
    }
        //set image to top of screen, text to center
}

struct SinglePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayerView()
    }
}

