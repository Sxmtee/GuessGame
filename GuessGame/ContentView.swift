//
//  ContentView.swift
//  GuessGame
//
//  Created by mac on 02/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
//            Color(
//                red: 1,
//                green: 0.8,
//                blue: 0.2
//            )
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
//        VStack(spacing: 20) {
//            Spacer()
//            
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            
//            Spacer()
//            Spacer()
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
