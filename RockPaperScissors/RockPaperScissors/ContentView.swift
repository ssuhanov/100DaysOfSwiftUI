//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sergii Sukhanov on 14.11.25.
//

import SwiftUI

enum Move {
  case rock
  case paper
  case scissors

  var emoji: String {
    switch self {
    case .rock:
      "🪨"
    case .paper:
      "📃"
    case .scissors:
      "✂️"
    }
  }
}

struct ContentView: View {
  @State private var appMove: Move = .rock
  @State private var playerShouldWin = true
  @State private var playerMove: Move = .rock
  @State private var score = 0
  @State private var numberOfMoves = 0
  @State private var showingFinalScore = false

  private var playerWins: Bool {
    switch appMove {
    case .rock:
      playerMove == .paper
    case .paper:
      playerMove == .scissors
    case .scissors:
      playerMove == .rock
    }
  }

  private var isDraw: Bool {
    appMove == playerMove
  }

  private var playerLoses: Bool {
    !playerWins && !isDraw
  }

  var body: some View {
    ZStack {
      RadialGradient(
        stops: [
          .init(color: .cyan, location: 0.2),
          .init(color: .black, location: 0.7)
        ],
        center: .top,
        startRadius: 200,
        endRadius: 700
      )
      .ignoresSafeArea()

      VStack {
        Spacer()
        Spacer()

        Text("Try to \(playerShouldWin ? "win" : "lose")!")
          .font(.largeTitle.bold())

        Spacer()
        Spacer()

        Text(appMove.emoji)
          .font(.system(size: 120.0))

        Spacer()

        HStack {
          Spacer()
          Spacer()
          Button {
            buttonTapped(with: .rock)
          } label: {
            Text(Move.rock.emoji)
              .padding(24)
              .font(.largeTitle)
              .glassEffect(.clear)
          }
          Spacer()
          Button {
            buttonTapped(with: .paper)
          } label: {
            Text(Move.paper.emoji)
              .padding(24)
              .font(.largeTitle)
              .glassEffect(.clear)
          }
          Spacer()
          Button {
            buttonTapped(with: .scissors)
          } label: {
            Text(Move.scissors.emoji)
              .padding(24)
              .font(.largeTitle)
              .glassEffect(.clear)
          }
          Spacer()
          Spacer()
        }

        Spacer()
        Spacer()

        Text("Score: \(score)")
          .foregroundStyle(.white)
          .font(.largeTitle.bold())

        Spacer()
        Spacer()
      }
    }
    .alert(alertTitle, isPresented: $showingFinalScore) {
      Button("Continue") {
        startAgain()
      }
    } message: {
      Text("Your score is \(score)")
    }
  }

  private var alertTitle: String {
    if score > 0 {
      "You won!"
    } else if score < 0 {
      "Try again..."
    } else {
      "It's a draw"
    }
  }

  private func buttonTapped(with move: Move) {
    numberOfMoves += 1
    showingFinalScore = numberOfMoves >= 10

    playerMove = move
    let earnPointThisRound: Bool
    if playerShouldWin && playerWins {
      earnPointThisRound = true
    } else if !playerShouldWin && playerLoses {
      earnPointThisRound = true
    } else {
      earnPointThisRound = false
    }

    score += earnPointThisRound ? 1 : -1

    nextMove()
  }

  private func nextMove() {
    playerShouldWin = Bool.random()
    let possibleMoves: [Move] = [.rock, .paper, .scissors]
    appMove = possibleMoves.randomElement()!
  }

  private func startAgain() {
    numberOfMoves = 0
    score = 0
  }
}

#Preview {
  ContentView()
}
