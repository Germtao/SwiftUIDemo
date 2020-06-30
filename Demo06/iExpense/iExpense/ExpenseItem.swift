//
//  ExpenseItem.swift
//  iExpense
//
//  Created by QDSG on 2020/6/30.
//  Copyright © 2020 tTao. All rights reserved.
//

import Foundation

struct ExpenseItem {
    let id = UUID() // 唯一的标志
    let name: String
    let type: String
    let amount: Int
}
