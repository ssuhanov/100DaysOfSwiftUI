//
//  ContentView.swift
//  iExpense
//
//  Created by Sergii Sukhanov on 25.11.25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
  var id: UUID = .init()
  let name: String
  let type: String
  let amount: Double
}

@Observable
class Expenses {
  var items: [ExpenseItem] = [] {
    didSet {
      if let encoded = try? JSONEncoder().encode(items) {
        UserDefaults.standard.set(encoded, forKey: "Items")
      }
    }
  }

  init() {
    guard
      let savedItems = UserDefaults.standard.data(forKey: "Items"),
      let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems)
    else {
      items = []
      return
    }

    items = decodedItems
  }
}

struct ContentView: View {
  @State private var expenses: Expenses = .init()
  @State private var showingAddExpenseView = false

  var body: some View {
    NavigationStack {
      List {
        ForEach(expenses.items) { item in
          HStack {
            VStack(alignment: .leading) {
              Text(item.name)
                .font(.headline)
              Text(item.type)
                .font(.subheadline)
            }

            Spacer()

            Text(item.amount, format: .currency(code: "EUR"))
          }
        }
        .onDelete(perform: removeItems(at:))
      }
      .navigationTitle("iExpense")
      .toolbar {
        Button("Add Expense", systemImage: "plus") {
          showingAddExpenseView = true
        }
      }
    }
    .sheet(isPresented: $showingAddExpenseView) {
      AddExpenseView(expenses: expenses)
    }
  }

  private func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

#Preview {
  ContentView()
}
