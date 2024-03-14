//
//  GuessTheFlag.swift
//  WeSplit
//
//  Created by yeojuseok on 2024/03/06.
//

import SwiftUI

struct GuessTheFlag: View {
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var countries = allCountries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingResult = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCounter = 1

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()

                Text("Guses the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) {number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius:5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("your score is \(score)")
                }
                .alert("Game Over!", isPresented: $showingResult) {
                    Button("Start Again", action: newGame)
                } message: {
                    Text("your final score is \(score)")
                }


                Spacer()
                Spacer()

                Text("Score : \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
        }

    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            let needThe = ["UK", "US"]
            let theAnswer = countries[number]

            if needThe.contains(theAnswer) {
                scoreTitle = "Wrong! That's the flag of the \(theAnswer)"
            } else {
                scoreTitle = "Wrong! That's the flag of \(theAnswer)"
            }


            if score > 0 {
                score -= 1
            }
        }

        if questionCounter == 8 {
            showingResult = true
        } else {
            showingScore = true
        }
    }


    func askQuestion() {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
    }

    func newGame() {
        questionCounter = 0
        score = 0
        countries = Self.allCountries
        askQuestion()
    }
}

#Preview {
    GuessTheFlag()
}

