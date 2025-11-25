//
//  ContentView.swift
//  iExpense
//
//  Created by Sergii Sukhanov on 25.11.25.
//

import Observation
import SwiftUI

//@Observable
//class User {
//  var firstName = "Bilbo"
//  var lastName = "Baggins"
//}

struct User: Codable {
  var firstName = "Bilbo"
  var lastName = "Baggins"
}

struct ExperimentsContentView: View {
  @State private var user = User()
  @State private var showingSheet = false

  @State private var numbers: [Int] = [0]
  @State private var currentNumber = 1

  // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
  @AppStorage("tapCount") private var tapCount = 0

  var body: some View {
    NavigationStack {
      VStack {
        Button("Tap count: \(tapCount)") {
          tapCount += 1
          UserDefaults.standard.set(tapCount, forKey: "Tap")
        }

        Spacer()

        List {
          ForEach(numbers, id: \.self) {
            Text("Row \($0)")
          }
          .onDelete(perform: removeRows)
        }
        .frame(maxHeight: 200)

        Button("Add Number") {
          numbers.append(currentNumber)
          currentNumber += 1
        }

        Spacer()

        Text("Your name is \(user.firstName) \(user.lastName)")

        TextField("First name", text: $user.firstName)
        TextField("Last name", text: $user.lastName)

        Button("Save User") {
          let encoder = JSONEncoder()

          if let data = try? encoder.encode(user) {
            UserDefaults.standard.set(data, forKey: "UserData")
          }
        }
        .padding()

        Button("Show Sheet") {
          showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
          SecondView(name: user.firstName)
        }

        Spacer()
        Spacer()
      }
      .padding()
      .toolbar {
        EditButton()
      }
    }
  }

  private func removeRows(at offsets: IndexSet) {
    numbers.remove(atOffsets: offsets)
  }
}

struct SecondView: View {
  let name: String

  @Environment(\.dismiss) var dismiss

  var body: some View {
    Text("Hello, \(name)!")
      .padding()

    Button("Dismiss") {
      dismiss()
    }
  }
}

#Preview {
  ExperimentsContentView()
}
