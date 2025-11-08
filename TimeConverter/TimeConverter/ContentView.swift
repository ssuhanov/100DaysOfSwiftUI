//
//  ContentView.swift
//  TimeConverter
//
//  Created by Sergii Sukhanov on 08.11.25.
//

import SwiftUI

struct Unit: Hashable {
  let singular: String
  let plural: String
}

struct ContentView: View {
  @FocusState private var inputValueIsFocused: Bool
  @State private var inputValue = 0
  @State private var unitFrom = "hours"
  @State private var unitTo = "minutes"
  private let units = [
    Unit(singular: "second", plural: "seconds"),
    Unit(singular: "minute", plural: "minutes"),
    Unit(singular: "hour", plural: "hours"),
    Unit(singular: "day", plural: "days"),
    Unit(singular: "week", plural: "weeks")
  ]
  private let unitValues = [604_800, 10_080, 168, 7, 1]

  private var outputValue: Double {
    guard
      let inputUnitValueIndex = units.firstIndex(where: { $0.plural == unitFrom }),
      let outputUnitValueIndex = units.firstIndex(where: { $0.plural == unitTo })
    else {
      return .zero
    }

    let inputUnitValue = unitValues[inputUnitValueIndex]
    let outputUnitValue = unitValues[outputUnitValueIndex]

    return Double(inputValue) * Double(outputUnitValue) / Double(inputUnitValue)
  }

  private var resultText: String {
    guard
      let unitFrom = units.first(where: { $0.plural == self.unitFrom }),
      let unitTo = units.first(where: { $0.plural == self.unitTo })
    else {
      return ""
    }

    let resultValue = outputValue.formatted()
    let unitFromValue = inputValue == 1 ? unitFrom.singular : unitFrom.plural
    let unitToValue = outputValue == 1 ? unitTo.singular : unitTo.plural
    return "\(inputValue) \(unitFromValue) the same as \(resultValue) \(unitToValue)"
  }

  var body: some View {
    NavigationStack {
      Form {
        TextField(
          "Input",
          value: $inputValue,
          format: .number
        )
        .keyboardType(.numberPad)
        .focused($inputValueIsFocused)

        Picker("From", selection: $unitFrom) {
          ForEach(units, id: \.plural) {
            Text($0.plural)
          }
        }

        Picker("To", selection: $unitTo) {
          ForEach(units, id: \.plural) {
            Text($0.plural)
          }
        }

        Section {
          Text(resultText)
        }
      }
      .navigationTitle("Time Converter")
      .navigationSubtitle("from seconds to weeks and back")
      .toolbar {
        if inputValueIsFocused {
          Button("Done") {
            inputValueIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
