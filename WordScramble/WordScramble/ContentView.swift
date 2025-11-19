//
//  ContentView.swift
//  WordScramble
//
//  Created by Sergii Sukhanov on 18.11.25.
//

import SwiftUI

struct ContentView: View {
  @State private var usedWords: [String] = []
  @State private var rootWord = ""
  @State private var newWord = ""

  @State private var errorTitle = ""
  @State private var errorMessage = ""
  @State private var showingError = false

  var body: some View {
    NavigationStack {
      List {
        Section {
          TextField("Enter your word", text: $newWord)
            .textInputAutocapitalization(.never)
        }

        Section {
          ForEach(usedWords, id: \.self) { word in
            HStack {
              Image(systemName: "\(word.count).circle")
              Text(word)
            }
          }
        }
      }
      .navigationTitle(rootWord)
      .onSubmit(addNewWord)
      .onAppear(perform: startGame)
      .alert(errorTitle, isPresented: $showingError) {} message: {
        Text(errorMessage)
      }
    }
  }

  private func isOriginal(word: String) -> Bool {
    !usedWords.contains(word)
  }

  private func isPossible(word: String) -> Bool {
    var copyOfRootWord = rootWord

    for letter in word {
      if let position = copyOfRootWord.firstIndex(of: letter) {
        copyOfRootWord.remove(at: position)
      } else {
        return false
      }
    }

    return true
  }

  private func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: .zero, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(
      in: word,
      range: range,
      startingAt: .zero,
      wrap: false,
      language: "en"
    )

    return misspelledRange.location == NSNotFound
  }

  private func addNewWord() {
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

    guard !answer.isEmpty else {
      return
    }

    guard isOriginal(word: answer) else {
      wordError(title: "Word has been used already", message: "Be more original")
      return
    }

    guard isPossible(word: answer) else {
      wordError(title: "Word is not possible", message: "You can't spell the word from \"\(rootWord)\"!")
      return
    }

    guard isReal(word: answer) else {
      wordError(title: "Word has not been recognized", message: "You can't just make them up, you know!")
      return
    }

    withAnimation {
      usedWords.insert(answer, at: .zero)
    }
    newWord = ""
  }

  private func wordError(title: String, message: String) {
    errorTitle = title
    errorMessage = message
    showingError = true
  }

  private func startGame() {
    guard let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") else {
      fatalError("Could not load start.txt from bundle.")
    }

    guard let startWords = try? String(contentsOf: startWordsUrl) else {
      return
    }

    let allWords = startWords.components(separatedBy: "\n")
    rootWord = allWords.randomElement() ?? "silkworm"
  }
}

#Preview {
  ContentView()
}
