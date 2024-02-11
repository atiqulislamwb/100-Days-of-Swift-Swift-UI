//
//  AddView.swift
//  iExpense
//
//  Created by Atiqul Islam on 11/2/24.
//

import SwiftUI

struct AddView: View {
      @State  var name = ""
      @State  var type = "Personal"
      @State  var amount = 0

    
    let types = ["Business", "Personal", "Others"]

    var expenses : Expenses
    
    var body: some View {
        NavigationStack {
                  Form {
                      TextField("Name", text: $name)

                      Picker("Type", selection: $type) {
                          ForEach(types, id: \.self) {
                              Text($0)
                          }
                      }

                      TextField("Amount", value: $amount, format: .currency(code: "USD"))
                          .keyboardType(.decimalPad)
                  }
                  .navigationTitle("Add new expense")
                  .toolbar{
                      Button ("Save"){
                          let item = ExpenseItem(name: name, type: type, amount:amount)
                          expenses.items.append(item)
                      }
                  }
              }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses:Expenses())
    }
}
