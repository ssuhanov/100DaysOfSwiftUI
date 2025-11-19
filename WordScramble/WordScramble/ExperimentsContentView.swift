//
//  ContentView.swift
//  WordScramble
//
//  Created by Sergii Sukhanov on 18.11.25.
//

import SwiftUI

struct ExperimentsContentView: View {
  private let people = ["Finn", "Leia", "Luke", "Rey"]

  private var fileContent: String? {
    guard
      let fileUrl = Bundle.main.url(forResource: "some_file", withExtension: "txt"),
      let fileContent = try? String(contentsOf: fileUrl)
    else {
      let input = """
               a
               b
               c
        """
      let letters = input.components(separatedBy: "\n")
      print(letters)
      let letter = letters.randomElement()
      print(letter ?? "N/A")

      let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
      print(trimmed ?? "N/A")

      let word = "swift"
      let checker = UITextChecker()
      let range = NSRange(location: .zero, length: word.utf16.count)
      let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: .zero, wrap: false, language: "en")
      let allGood = misspelledRange.location == NSNotFound
      print(allGood)

      return nil
    }

    return fileContent
  }

  var body: some View {
    List {
      Text("Static row")

      ForEach(people, id: \.self) {
        Text($0)
      }

      Text("Static row")
      Text(fileContent ?? "N/A")
    }

//    List(people, id: \.self) {
//      Text($0)
//    }

//    List(0..<10) {
//      Text("Dynamic row \($0)")
//    }

//    List {
//      Text("Hello, World!")
//      Text("Hello, World!!")
//      Text("Hello, World!!!")
//    }

//    List {
//      Section("Section 1") {
//        Text("Static row 1")
//        Text("Static row 2")
//      }
//
//      Section("Section 2") {
//        ForEach(0..<10) {
//          Text("Dynamic row \($0)")
//        }
//      }
//
//      Section("Section 3") {
//        Text("Static row 3")
//        Text("Static row 4")
//      }
//    }
//    .listStyle(.grouped)
  }
}

#Preview {
  ExperimentsContentView()
}
