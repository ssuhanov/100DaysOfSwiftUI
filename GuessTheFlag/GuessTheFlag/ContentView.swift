//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sergii Sukhanov on 09.11.25.
//

import SwiftUI

struct FlagButton: View {
  let country: String
  let action: () -> Void

  var body: some View {
    if #available(iOS 26.0, *) {
      Button(action: action, label: { Image(country) })
        .clipShape(.capsule)
        .shadow(radius: 5)
        .glassEffect(.clear)
    } else {
      Button(action: action, label: { Image(country) })
        .clipShape(.capsule)
        .shadow(radius: 5)
    }
  }
}

struct ContentView: View {
  @State private var showingScore = false
  @State private var scoreTitle = ""

  @State private var countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Nigeria",
    "Poland",
    "Spain",
    "UK",
    "Ukraine",
    "US"
  ].shuffled()

  @State private var correctAnswer = Int.random(in: 0...2)
  @State private var score = 0
  @State private var tappedFlag = ""

  private var endOfTheGame: Bool {
    score >= 8
  }

  var body: some View {
    ZStack {
      RadialGradient(
        stops: [
          .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
          .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
        ],
        center: .top,
        startRadius: 200,
        endRadius: 700
      )
      .ignoresSafeArea()

      // LinearGradient(colors: [.mint, .black], startPoint: .top, endPoint: .bottomTrailing)
      //   .ignoresSafeArea()

      VStack {
        Spacer()

        Text("Guess the Flag")
          .font(.largeTitle.bold())
          .foregroundStyle(.white)

        VStack(spacing: 15) {
          VStack {
            Text("Tap the flag of")
              .font(.subheadline.weight(.heavy))
              .foregroundStyle(.secondary)
            Text(countries[correctAnswer])
              .font(.largeTitle.weight(.semibold))
          }

          ForEach(0..<3) { number in
            FlagButton(country: countries[number]) {
              flagTapped((number))
            }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 20))

        Spacer()
        Spacer()

        Text("Score \(score)")
          .foregroundStyle(.white)
          .font(.title.bold())

        Spacer()
      }
      .padding()
    }
    .alert(scoreTitle, isPresented: $showingScore) {
      Button(endOfTheGame ? "Restart game": "Continue", action: askQuestion)
    } message: {
      if endOfTheGame {
        Text("You got the final score. Let's play again")
      } else if tappedFlag.isEmpty {
        Text("Your score is \(score)")
      } else {
        Text("You chose \(tappedFlag)")
      }
    }
  }

  private func flagTapped(_ number: Int) {
    if number == correctAnswer {
      score += 1
      scoreTitle = "Correct"
      tappedFlag = ""
    } else {
      scoreTitle = "Wrong"
      tappedFlag = countries[number]
    }

    showingScore = true
  }

  private func askQuestion() {
    if endOfTheGame {
      score = 0
    }
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

#Preview {
  ContentView()
}
