//
//  ContentView.swift
//  Animations
//
//  Created by Sergii Sukhanov on 21.11.25.
//

import SwiftUI

struct ExperimentalContentView: View {
  // @State private var animationAmount = 1.0
  @State private var animationAmount = 0.0

  var body: some View {
    Button("Tap me") {
      withAnimation(.spring(duration: 1, bounce: 0.5)) {
        animationAmount += 360
      }
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.1, y: 0.5, z: 0.7))

//    print(animationAmount)
//
//    return VStack {
//      Stepper(
//        "Scale amount",
//        value: $animationAmount.animation(
//          .easeInOut(duration: 1)
//            .repeatCount(3, autoreverses: true)
//        ),
//        in: 1...10
//      )
//      .padding()
//
//      Spacer()
//
//      Button("Tap me") {
//        animationAmount += 1
//      }
//      .padding(40)
//      .background(.red)
//      .foregroundStyle(.white)
//      .clipShape(.circle)
//      .scaleEffect(animationAmount)
//    }

//    Button("Tap me") {
//      // animationAmount += 1
//    }
//    .padding(50)
//    .background(.red)
//    .foregroundStyle(.white)
//    .clipShape(.circle)
//    // .scaleEffect(animationAmount)
//    // .blur(radius: (animationAmount - 1) * 3)
//    // .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
////    .animation(
////      .easeInOut(duration: 2)
////        .delay(1),
////      value: animationAmount
////    )
//    .overlay(
//      Circle()
//        .stroke(.red)
//        .scaleEffect(animationAmount)
//        .opacity(2 - animationAmount)
//        .animation(
//          .easeInOut(duration: 1)
//            .repeatForever(autoreverses: true),
//          value: animationAmount
//        )
//    )
//    .onAppear {
//      animationAmount = 2
//    }
////    .animation(
////      .easeInOut(duration: 1)
////        // .repeatCount(3, autoreverses: true),
////        .repeatForever(autoreverses: true),
////      value: animationAmount
////    )
  }
}

#Preview {
  ExperimentalContentView()
}
