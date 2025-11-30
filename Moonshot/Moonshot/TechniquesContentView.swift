//
//  ContentView.swift
//  Moonshot
//
//  Created by Sergii Sukhanov on 30.11.25.
//

import SwiftUI

struct CustomText: View {
  let text: String

  var body: some View {
    Text(text)
  }

  init(text: String) {
    print("Creating a new CustomText with text \(text)")
    self.text = text
  }
}

struct User: Codable {
  let name: String
  let address: Address
}

struct Address: Codable {
  let street: String
  let city: String
}

struct TechniquesContentView: View {
  let layout = [
    GridItem(.adaptive(minimum: 80.0, maximum: 120.0))
//    GridItem(.fixed(80.0)),
//    GridItem(.fixed(80.0)),
//    GridItem(.fixed(80.0)),
//    GridItem(.fixed(80.0))
  ]

  var body: some View {
    ScrollView {
      LazyVGrid(columns: layout) {
        ForEach(0..<1000) {
          Text("Item \($0)")
        }
      }
    }

    ScrollView(.horizontal) {
      LazyHGrid(rows: layout) {
        ForEach(0..<1000) {
          Text("Item \($0)")
        }
      }
    }

//    Button("Decode JSON") {
//      let input = """
//        {
//          "name": "Taylor Swift",
//          "address": {
//            "street": "555, Taylor Swift Avenue",
//            "city": "Nashville"
//          }
//        }
//        """
//
//      let data = Data(input.utf8)
//      let decoder = JSONDecoder()
//      if let user = try? decoder.decode(User.self, from: data) {
//        print("Decoded street: \(user.address.street)")
//      }
//    }

//    NavigationStack {
//      List(0..<100) { row in
//        NavigationLink {
//          Text("Detail \(row)")
//        } label: {
//          Text("Row \(row)")
//          Image(systemName: row.isMultiple(of: 2) ? "star.fill" : "face.smiling")
//        }
//      }
//      .navigationTitle("SwiftUI")
//    }

//    NavigationStack {
//      NavigationLink {
//        Text("Detail View")
//      } label: {
//        VStack {
//          Text("This is the label")
//          Text("So is this")
//          Image(systemName: "face.smiling")
//        }
//        .font(.largeTitle)
//      }
//      .navigationTitle("SwiftUI")
//    }

//    ScrollView(.horizontal) {
//      LazyHStack(spacing: 10) {
//        ForEach(0..<100) {
//          CustomText(text: "Item \($0)")
//            .font(.title)
//        }
//      }
//      .frame(maxWidth: .infinity)
//    }

//    Image(.screenshot)
//      .resizable()
//      .scaledToFit()
//      .containerRelativeFrame(.horizontal) { containerSize, axis in
//        // axis is `.horizontal` for our case and is not in use, can be replaced with _
//        containerSize * 0.8
//      }

//    Image(.rotatedScreenshot)
//      .resizable()
//      .scaledToFit()
//      .containerRelativeFrame(.horizontal) { containerSize, axis in
//        // axis is `.horizontal` for our case and is not in use, can be replaced with _
//        containerSize * 0.8
//      }
  }
}

#Preview {
  TechniquesContentView()
}
