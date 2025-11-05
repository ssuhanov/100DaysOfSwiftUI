//
//  ContentView.swift
//  WeSplit
//
//  Created by Sergii Sukhanov on 05.11.25.
//

import SwiftUI

struct ExperimentsContentView: View {
  private let students = ["Harry", "Hermione", "Ron"]
  @State private var selectedStudent = "Ron"

  var body: some View {
    NavigationStack {
      Form {
        Picker("Select your student", selection: $selectedStudent) {
          ForEach(students, id: \.self) {
            Text($0)
          }
        }
      }
      .navigationTitle("Students")
    }
  }

//  var body: some View {
//    NavigationStack {
//      Form {
//        ForEach(0..<100) {
//          Text("Row \($0)")
//        }
//      }
//      .navigationTitle("SwiftUI")
//      .navigationBarTitleDisplayMode(.large)
//      .navigationSubtitle("learn I")
//    }
//  }

//  @State private var name = ""
//
//  var body: some View {
//    Form {
//      TextField("Enter your name", text: $name)
//      Text("Your name is \(name)")
//    }
//  }

//  @State private var tapCount = 0
//
//  var body: some View {
//    Button("Tap Count: \(tapCount)") {
//      tapCount += 1
//    }
//  }

//  var body: some View {
//    NavigationStack {
//      Form {
//        Section {
//          Text("Hello, World!")
//          Text("Hello, World!")
//          Text("Hello, world!")
//        }
//
//        Section {
//          Text("Hello, World!")
//        }
//      }
//      .navigationTitle("SwiftUI")
//      .navigationBarTitleDisplayMode(.inline)
//      .navigationSubtitle("learning am I")
//    }
//  }
}

#Preview {
  ExperimentsContentView()
}
