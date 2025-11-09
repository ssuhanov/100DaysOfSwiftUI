//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sergii Sukhanov on 09.11.25.
//

import SwiftUI

struct ExperimentsContentView: View {
  @State private var showingAlert = false

  var body: some View {
    ZStack {
      // Color.teal
      LinearGradient(colors: [.teal, .cyan, .mint], startPoint: .leading, endPoint: .bottomTrailing)

      VStack {
        Text("Your content")
          .foregroundStyle(.secondary)
          .padding(50)
          .background(.orange.gradient)

        Button("Delete selection", role: .destructive, action: executeDelete)

        Button("Button 1") { }
          .buttonStyle(.bordered)
        Button("Button 2", role: .destructive) { }
          .buttonStyle(.bordered)
        Button("Button 3") { }
          .buttonStyle(.borderedProminent)
          .tint(.cyan)
        Button("Button 4", role: .destructive) { }
          .buttonStyle(.borderedProminent)
        Button {
          print("Button has been tapped")
        } label: {
          Text("Tap me!")
            .padding()
            .foregroundStyle(.white)
            .background(.mint.gradient)
        }

        Button {
          print("Edit button has been tapped")
        } label: {
          Image(systemName: "pencil")
        }

        Button("Edit", systemImage: "pencil") {
          print("Another edit button has been tapped")
        }

        Button {
          showingAlert = true
        } label: {
          Label("Show Alert", systemImage: "pencil")
            .padding()
            .foregroundStyle(.white)
            // .background(.orange.gradient)
            // .clipShape(.rect(cornerRadius: 8))
        }
        .glassEffect(.clear)
        .alert("Important message", isPresented: $showingAlert) {
          Button("OK", role: .cancel) { print("Alert OK") }
          Button("Not OK", role: .destructive) { print("Alert is not OK") }
        } message: {
          Text("Please read this.")
        }
      }
    }

//    ZStack {
//      // LinearGradient(colors: [.red, .blue, .green], startPoint: .top, endPoint: .bottom)
////      LinearGradient(
////        stops: [
////          .init(color: .red, location: 0.15),
////          .init(color: .blue, location: 0.25),
////          .init(color: .blue, location: 0.75),
////          .init(color: .green, location: 0.85)
////        ],
////        startPoint: .top,
////        endPoint: .bottomTrailing
////      )
//
////       RadialGradient(colors: [.blue, .green], center: .center, startRadius: 20, endRadius: 200)
//
////      AngularGradient(
////        colors: [.red, .blue, .green, .yellow],
////        center: .center
////      )
//
//      Text("Your content")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.orange.gradient)
//    }

//    ZStack {
//      VStack(spacing: .zero) {
//        Color.red
//        Color.blue
//      }
//
//      Text("Your content")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.ultraThinMaterial)
//    }
//    .ignoresSafeArea()

//    ZStack {
//      // Color.indigo
//      Color(red: 238.0/255.0, green: 121.0/255.0, blue: 59.0/255.0)
//        // .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//        // .frame(width: 200, height: 200)
//
//      Text("Your content")
//    }
//    .ignoresSafeArea()
//    // .background(.red)

//    HStack(spacing: 20) {
//      VStack(spacing: 20) {
//        Text("1")
//        Text("2")
//        Text("3")
//      }
//
//      VStack(spacing: 20) {
//        Text("4")
//        Text("5")
//        Text("6")
//      }
//
//      VStack(spacing: 20) {
//        Text("7")
//        Text("8")
//        Text("9")
//      }
//    }

//    VStack(alignment: .leading, spacing: 20) {
//      Spacer()
//      Text("Hello, World!")
//      Text("This is another text view")
//      Spacer()
//      Spacer()
//    }
  }

  func executeDelete() {
    print(#function)
  }
}

#Preview {
  ExperimentsContentView()
}
