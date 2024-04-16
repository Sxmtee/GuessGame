//
//  Buttons.swift
//  GuessGame
//
//  Created by mac on 02/04/2024.
//

import SwiftUI

struct CustomButtons: View {
    @State private var showAlert = false
    
    func executeDelete() {
        print("Now Deleting...")
    }
    
    var body: some View {
        Button("Show Alert"){
            showAlert = true
        }
        .buttonStyle(.borderedProminent)
        .alert("Important Message", isPresented: $showAlert){
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this")
        }
    }
}

#Preview {
    CustomButtons()
}
