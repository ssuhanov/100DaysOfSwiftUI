//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sergii Sukhanov on 12.11.25.
//

import SwiftUI

struct CapsuleText: View {
  var text: String

  var body: some View {
    Text(text)
      .titleStyle()
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .padding()
      .background(.blue)
      .clipShape(.rect(cornerRadius: 20))
  }
}

struct Watermark: ViewModifier {
  var text: String

  func body(content: Content) -> some View {
    ZStack(alignment: .bottomTrailing) {
      content
      Text(text)
        .font(.caption)
        .foregroundStyle(.white)
        .padding(5)
        .background(.black)
    }
  }
}

extension View {
  func titleStyle() -> some View {
    modifier(Title())
  }

  func watermarked(with text: String) -> some View {
    modifier(Watermark(text: text))
  }
}

struct GridStack<Content: View>: View {
  let rows: Int
  let columns: Int
  @ViewBuilder let content: (Int, Int) -> Content

  var body: some View {
    VStack {
      ForEach(0..<rows, id: \.self) { row in
        HStack {
          ForEach(0..<columns, id: \.self) { column in
            content(row, column)
          }
        }
      }
    }
  }
}

struct ContentView: View {
//  @State private var useRedText = false
//
//  let motto1 = Text("Draco dormiens")
//  let motto2 = Text("nunquam titillandus")
//
//  var motto3: some View {
//    Text("Lorem ipsum...")
//  }
//
//  var spells: some View {
////    Text("Lumos") // ERROR
////    Text("Obliviate") // ERROR
//    // should be wrapped with VStack/HStack/ZStack/Group
//    Group {
//      Text("Lumos")
//      Text("Obliviate")
//    }
//  }
//
//  @ViewBuilder var spells2: some View {
//    Text("Lumos")
//    Text("Obliviate")
//  }

  var body: some View {
    GridStack(rows: 5, columns: 5) { row, column in
      Image(systemName: "\(row * 5 + column).circle")
      Text("R\(row) C\(column)")
        .frame(maxWidth: 60, maxHeight: 60)
        .background(.green)
//      HStack {
//        Image(systemName: "\(row * 5 + column).circle")
//        Text("R\(row) C\(column)")
//          .frame(maxWidth: 60, maxHeight: 60)
//          .background(.green)
//      }
    }

//    Color.green
//      .frame(width: 300, height: 200)
//      .watermarked(with: "Sergii is hacking with Swift")
//
//    VStack(spacing: 10) {
////      Text("First")
////        .font(.largeTitle)
////        .padding()
////        .foregroundStyle(.white)
////        .background(.blue)
////        .clipShape(.capsule)
////
////      Text("Second")
////        .font(.largeTitle)
////        .padding()
////        .foregroundStyle(.white)
////        .background(.blue)
////        .clipShape(.capsule)
//
//      CapsuleText(text: "First")
//        .foregroundStyle(.white)
//      CapsuleText(text: "Second")
//        .foregroundStyle(.yellow)
//    }

//    VStack {
//      motto1
//        .foregroundStyle(.red)
//
//      motto2
//        .foregroundStyle(.blue)
//
//      motto3
//        .foregroundStyle(.green)
//
//      spells
//        .font(.title)
//        .foregroundStyle(.indigo)
//
//      spells2
//        .font(.largeTitle)
//        .foregroundStyle(.pink)
//    }

//    VStack {
//      Text("Gryffindor")
//        .blur(radius: 0)
//      Text("Hufflepuff")
//      Text("Ravenclaw")
//      Text("Slytherin")
//        .font(.largeTitle)
//    }
//    .font(.title)
//    .blur(radius: 5)

//    if useRedText {
//      Button("Red") {
//        useRedText.toggle()
//      }
//      .foregroundStyle(.red)
//    } else {
//      Button("Blue") {
//        useRedText.toggle()
//      }
//      .foregroundStyle(.blue)
//    }

//    Button("Hello World") {
//      useRedText.toggle()
//    }
//    .foregroundStyle(useRedText ? .red : .blue)

//    Text("Hello, World!")
//      .padding()
//      .background(.red)
//      .padding()
//      .background(.blue)
//      .padding()
//      .background(.green)
//      .padding()
//      .background(.yellow)

//    Button("Hello, World!") {
//      print(type(of: self.body))
//    }
//     .background(.red)
//     .frame(width: 200, height: 200)
//     .background(.green)

//    VStack {
//      Image(systemName: "globe")
//        .imageScale(.large)
//        .foregroundStyle(.tint)
//      Text("Hello, world!")
//    }
//    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .background(.red)
  }
}

#Preview {
  ContentView()
}
