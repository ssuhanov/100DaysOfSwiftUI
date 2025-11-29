//
//  ContentView.swift
//  iExpense
//
//  Created by Sergii Sukhanov on 25.11.25.
//

import SwiftUI

extension Date {
  var startOfDay: Date {
    Calendar.current.startOfDay(for: self)
  }
}

struct ExpenseItem: Identifiable, Codable, Equatable {
  var id: UUID = .init()
  var date: Date
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
        ForEach(Array(Set(expenses.items.map { $0.date })).sorted(), id: \.self ) { itemDate in
          Section("\(itemDate, format: .dateTime.year().month().day())") {
            ForEach(expenses.items.filter { $0.date == itemDate }) { item in
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
              removeItems(at: indexSet, with: itemDate)
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

  private func removeItems(at offsets: IndexSet, with date: Date) {
    let itemsWithDate = expenses.items.filter { $0.date == date }
    let itemsToDelete = offsets.map { itemsWithDate[$0] }
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
