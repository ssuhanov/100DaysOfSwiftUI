//
//  ContentView.swift
//  BetterRest
//
//  Created by Sergii Sukhanov on 15.11.25.
//

import SwiftUI

struct ExeprimentsContentView: View {
  @State private var sleepAmount: Double = 8.0
  @State private var wakeUp: Date = .now

  var body: some View {
    VStack {
      Stepper(
        "\(sleepAmount.formatted()) hours",
        value: $sleepAmount,
        in: 4...12,
        step: 0.25
      )

      DatePicker(
        "Please enter a date",
        selection: $wakeUp,
        in: Date.now...,
        displayedComponents: .hourAndMinute
      )
      .labelsHidden()

      Spacer().frame(height: 200)
      Text(Date.now, format: .dateTime.hour().minute())
      Text(Date.now, format: .dateTime.year().month().day()) // or .day().year().month() - order is not important
      Spacer().frame(height: 100)
      Text(Date.now.formatted(date: .long, time: .shortened))
    }
    .padding()
  }

//  private func exampleDates() {
//    // create a second Date instance set to one day in seconds from now
//    let tomorrow = Date.now.addingTimeInterval(86400)
//
//    // create a range from those two
//    let range = Date.now...tomorrow
//  }

//  private func something() {
//    var components = DateComponents()
//    components.hour = 8
//    components.minute = 0
//    let date = Calendar.current.date(from: components) ?? .now
//
//    let components2 = Calendar.current.dateComponents([.hour, .minute], from: date)
//    let hour = components2.hour ?? .zero
//    let minute = components2.minute ?? .zero
//  }
}

#Preview {
  ExeprimentsContentView()
}
