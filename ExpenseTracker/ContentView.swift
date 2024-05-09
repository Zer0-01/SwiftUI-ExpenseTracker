//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Silentmode Sdn Bhd on 09/05/2024.
//
import Observation
import SwiftUI



struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (expenses.items) { item in
                    HStack {
                        VStack (alignment: .leading) {
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
            .navigationTitle("ExpenseTracker")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            
        }
    }
    
    func removeItems (at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

#Preview {
    ContentView()
}
