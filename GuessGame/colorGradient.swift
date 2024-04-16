//
//  colorGradient.swift
//  GuessGame
//
//  Created by mac on 02/04/2024.
//

import SwiftUI

struct ColorGradient: View {
    var body: some View {
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.indigo.gradient)
//        AngularGradient(
//            colors: [.red, .green, .purple, .blue, .red],
//            center: .center
//        )
//        RadialGradient(
//            colors: [.blue, .green],
//            center: .center,
//            startRadius: 20,
//            endRadius: 200
//        )
//        LinearGradient(
//            colors: [.white, .black],
//            startPoint: .top,
//            endPoint: .bottom
//        )
        .ignoresSafeArea()
    }
}

#Preview {
    ColorGradient()
}
