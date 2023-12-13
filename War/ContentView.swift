//
//  ContentView.swift
//  War
//
//  Created by Ethan Davis on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var color = Color.mint
    @State private var name = ""
    var body: some View {
        NavigationView {
        VStack {
            CustomText(text: "WAR")
                .padding(55.0)
            Image("aces")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            TextField(" Enter Name", text: $name)
                .frame(width: 100, height: 30, alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.red/*@END_MENU_TOKEN@*/, width: 1)
                .padding(35)
            NavigationLink(destination: {
                    SinglePlayerView()
                }, label: {
                    Text("Start Game")
                        .background(Rectangle().frame(width: 130.0, height: 40.0) .foregroundColor(.yellow).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5))
                })
            .padding(50)
            }
        .background(color)
        
        }
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


