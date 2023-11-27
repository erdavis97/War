//
//  ContentView.swift
//  War
//
//  Created by Ethan Davis on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomText(text: "WAR")
                .padding(55.0)
            Image("aces")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            
            NavigationView {
                NavigationLink(destination: {
                    SinglePlayerView()
                }, label: {
                    Text("Start Game")
                        .background(Rectangle().frame(width: 130.0, height: 40.0) .foregroundColor(.yellow).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5))
                        .background(Rectangle().frame(width: 394.0, height: 2000.0) .foregroundColor(.mint))
                })
                
            
            }
            
        }
        .background(Rectangle().frame(width: 394.0, height: 2000.0) .foregroundColor(.mint))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("", size: 120))
    }
}



