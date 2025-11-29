//
//  AddView.swift
//  iExpense
//
//  Created by Sergii Sukhanov on 26.11.25.
//

import SwiftUI

struct AddExpenseView: View {
  @State private var name = ""
  @State private var type = "Personal"
  @State private var amount = 0.0
  @State private var date: Date = .now.startOfDay

  @Environment(\.dismiss) var dismiss

  private var currencyCode: String {
    Locale.current.currency?.identifier ?? "EUR"
  }

  var expenses: Expenses

  let types = ["Business", "Personal"]

  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $name)

        Picker("Type", selection: $type) {
          ForEach(types, id: \.self) {
            Text($0)
          }
        }

        TextField("Amount", value: $amount, format: .currency(code: currencyCode))
          .keyboardType(.decimalPad)

        DatePicker(
          "Please enter a date",
          selection: $date,
          displayedComponents: .date
        )
      }
      .navigationTitle("Add new expense")
      .toolbar {
        Button("Save") {
          defer {
            dismiss()
          }

          guard !name.isEmpty, amount > 0.0 else {
            return
          }

          expenses.items.append(
            ExpenseItem(
              date: date.startOfDay,
              name: name,
              type: type,
              amount: amount
            )
          )
        }
      }
    }
  }
}

#Preview {
  AddExpenseView(expenses: Expenses())
}
