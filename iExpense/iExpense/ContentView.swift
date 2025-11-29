//
//  ContentView.swift
//  iExpense
//
//  Created by Sergii Sukhanov on 25.11.25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable {
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

  private var currencyCode: String {
    Locale.current.currency?.identifier ?? "EUR"
  }

  var body: some View {
    NavigationStack {
      List {
        ForEach(Array(Set(expenses.items.map { "\($0.type)" })).sorted(), id: \.self ) { itemType in
          Section("\(itemType)") {
            ForEach(expenses.items.filter { $0.type == itemType }) { item in
              HStack {
                VStack(alignment: .leading) {
                  Text(item.name)
                    .font(item.amount.nameFont)

                  if item.amount > 10 {
                    Text(item.type)
                      .font(.subheadline)
                  }
                }

                Spacer()

                Text(item.amount, format: .currency(code: currencyCode))
                  .font(item.amount.amountFont)
              }
            }
            .onDelete { indexSet in
              removeItems(at: indexSet, with: itemType)
            }
          }
        }
      }
      .navigationTitle("iExpense")
      .toolbar {
        ToolbarItemGroup(placement: .primaryAction) {
          Button("Add Expense", systemImage: "plus") {
            showingAddExpenseView = true
          }
          EditButton()
        }
      }
    }
    .sheet(isPresented: $showingAddExpenseView) {
      AddExpenseView(expenses: expenses)
    }
  }

  private func removeItems(at offsets: IndexSet, with type: String) {
    let itemsWithType = expenses.items.filter { $0.type == type }
    let itemsToDelete = offsets.map { itemsWithType[$0] }
    expenses.items = expenses.items.filter { !itemsToDelete.contains($0) }
  }
}

private extension Double {
  var nameFont: Font {
    switch self {
    case ...10:
      .title3
    case ...100:
      .title2.bold()
    default:
      .largeTitle
    }
  }

  var amountFont: Font {
    switch self {
    case ...10:
      .body
    case ...100:
      .body.bold()
    default:
      .title.bold()
    }
  }
}

#Preview {
  ContentView()
}
