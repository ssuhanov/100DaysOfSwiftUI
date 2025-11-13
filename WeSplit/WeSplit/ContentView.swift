//
//  ContentView.swift
//  WeSplit
//
//  Created by Sergii Sukhanov on 05.11.25.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var amountIsFocused: Bool
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 10
  private let tipPercentages = [5, 10, 15, 20, 0]

  private var totalCheckAmount: Double {
    let tipSelection = Double(tipPercentage)
    let tipValue = (checkAmount / 100.0) * tipSelection

    return checkAmount + tipValue
  }

  private var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    return totalCheckAmount / peopleCount
  }

  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField(
            "Amount",
            value: $checkAmount,
            format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
          )
          .keyboardType(.decimalPad)
          .focused($amountIsFocused)

          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
          .pickerStyle(.menu)
        }

        Section("How much tip do you want to leave?") {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0...100, id: \.self) {
              Text($0, format: .percent)
            }
          }
          .pickerStyle(.navigationLink)
        }

        Section("Total check amount") {
          Text(totalCheckAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
            .foregroundStyle(tipPercentage == .zero ? .red : .primary)
        }

        Section("Amount per person") {
          Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
        }
      }
      .navigationTitle("WeSplit")
      .navigationSubtitle("easily")
      .toolbar {
        if amountIsFocused {
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
