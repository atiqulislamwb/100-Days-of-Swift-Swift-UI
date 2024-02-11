//
//  ContentView.swift
//  iExpense
//
//  Created by Atiqul Islam on 11/2/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

struct Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
    
}

struct SheetView:View {
    @State private var amount = ""
    var body: some View{
        List{
            TextField("Enter Amount", text: $amount)
        }
    }
}


struct ContentView: View {

   @State private var expenses = Expenses()

    @State private var showingAddExpense = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack{
            List {
                ForEach(expenses.items, id:\.id) { item in
                    HStack {
                          VStack(alignment: .leading) {
                              Text(item.name)
                                  .font(.headline)
                              Text(item.type)
                          }

                          Spacer()
                          Text(item.amount, format: .currency(code: "USD"))
                      }
                  }
                  .onDelete(perform: removeItems)
              }
              .navigationTitle("iExpense")
              .toolbar {
                  Button("+") {
                      showingAddExpense.toggle()
                  }
                  .font(.largeTitle)
                  .sheet(isPresented: $showingAddExpense) {
                      AddView(expenses: expenses)
                  }
              }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
