//
//  TheGame.swift
//  GuessGame
//
//  Created by mac on 16/04/2024.
//

import SwiftUI

struct FlagImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct TheGame: View {
    @State private var countries = [
        "Estonia",
        "Germany",
        "France",
        "Ireland",
        "Italy", 
        "Monaco",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionsAsked = 0
    
    @State private var selectedFlag: Int? = nil
    @State private var animationAmount = 0.0
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
            let correctCountry = countries[correctAnswer]
            scoreTitle += "\nThat's the flag of \(correctCountry)"
        }
        
        showingScore = true
        
        questionsAsked += 1
        
        if questionsAsked == 8 {
            scoreTitle = "Game Over"
            scoreTitle += "\nYour final score is \(score)"
            score = 0
            questionsAsked = 0
        }
        
        withAnimation {
            animationAmount += 360
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        selectedFlag = nil
        animationAmount = 0.0
    }
    
    var body: some View {
        ZStack{
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3
                    ),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3
                    ),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
                .ignoresSafeArea()
            VStack{
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.black)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(number == selectedFlag ? animationAmount : 0),
                            axis: (x: 0, y: 1, z: 0))
                            .opacity(
                                selectedFlag == nil || selectedFlag == number ? 1 : 0.25
                            )
                            .animation(.default, value: animationAmount)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
}


#Preview {
    TheGame()
}
