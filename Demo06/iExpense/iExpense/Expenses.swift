//
//  Expenses.swift
//  iExpense
//
//  Created by QDSG on 2020/6/30.
//  Copyright © 2020 tTao. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    // @Published来确保每当对items数组进行修改时, 都会发送更改公告
    @Published var items = [ExpenseItem]()
}
