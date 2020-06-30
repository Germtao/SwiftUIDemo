//
//  ContentView.swift
//  iExpense
//
//  Created by QDSG on 2020/6/30.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject 监听这些公告，并使用该对象刷新所有视图
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                trailing: Button(action: {
                    let item = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    self.expenses.items.append(item)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
