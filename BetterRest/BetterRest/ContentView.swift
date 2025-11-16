//
//  ContentView.swift
//  BetterRest
//
//  Created by Sergii Sukhanov on 15.11.25.
//

import CoreML
import SwiftUI

struct BackwardsCompatibleNavigationSubtitle: ViewModifier {
  let text: String

  func body(content: Content) -> some View {
    if #available(iOS 26.0, *) {
      content.navigationSubtitle(text)
    } else {
      content
    }
  }
}

extension View {
  func backwardCompatibleNavigationSubtitle(_ text: String) -> some View {
    modifier(BackwardsCompatibleNavigationSubtitle(text: text))
  }
}

struct ContentView: View {
  @State private var wakeUp = Self.defaultWakeTime
  @State private var sleepAmount = 8.0
  @State private var coffeeAmount = 1

  @State private var alertTitle = ""
  @State private var alertMessage = ""
  @State private var showingAlert = false

  private static let defaultWakeTime: Date = {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? .now
  }()

  init() {
    UIDatePicker.appearance().minuteInterval = 10
  }

  var body: some View {
    NavigationStack {
      Form {
        VStack(alignment: .leading, spacing: .zero) {
          Text("When do you want to wake up?")
            .font(.headline)

          DatePicker(
            "Please enter a time",
            selection: $wakeUp,
            displayedComponents: .hourAndMinute
          )
          .labelsHidden()
          .onDisappear {
            UIDatePicker.appearance().minuteInterval = 1
          }
        }

        VStack(alignment: .leading, spacing: .zero) {
          Text("Desired amount of sleep")
            .font(.headline)

          Stepper(
            "\(sleepAmount.formatted()) hours",
            value: $sleepAmount,
            in: 4...12,
            step: 0.25
          )
        }

        VStack(alignment: .leading, spacing: .zero) {
          Text("Daily coffee intake")
            .font(.headline)

//          Stepper(
//            coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups",
//            value: $coffeeAmount,
//            in: 0...20
//          )
          Stepper(
            "^[\(coffeeAmount) cup](inflect: true)",
            value: $coffeeAmount,
            in: 0...20
          )
        }
      }
      .navigationTitle("BetterRest")
      .backwardCompatibleNavigationSubtitle("Let us help you to sleep better!")
      .toolbar {
        Button("Calculate", action: calculateBedtime)
      }
      .alert(alertTitle, isPresented: $showingAlert) {
        Button("OK") {}
      } message: {
        Text(alertMessage)
      }
    }
  }

  private func calculateBedtime() {
    defer {
      showingAlert = true
    }

    do {
      let config = MLModelConfiguration()
      let model = try SleepCalculator(configuration: config)

      let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
      let hour = components.hour ?? .zero
      let minute = components.minute ?? .zero

      let amountOfMinutes = hour * 60 + minute
      let amountOfSeconds = amountOfMinutes * 60

      let modelInput = SleepCalculatorInput(
        wake: Double(amountOfSeconds),
        estimatedSleep: sleepAmount,
        coffee: Double(coffeeAmount)
      )
      let prediction = try model.prediction(input: modelInput)

      let sleepTime = wakeUp - prediction.actualSleep
      alertTitle = "Your ideal bedtime is..."
      alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
    } catch {
      alertTitle = "Error"
      alertMessage = "Sorry, there was an issue with bedtime calculation."
    }
  }
}

#Preview {
  ContentView()
}
