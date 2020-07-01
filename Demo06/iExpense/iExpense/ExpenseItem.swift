//
//  ExpenseItem.swift
//  iExpense
//
//  Created by QDSG on 2020/6/30.
//  Copyright © 2020 tTao. All rights reserved.
//

import Foundation

// Identifiable: Swift内置的协议之一，表示“可以唯一地标识此类型”
// 它只有一个要求，那就是必须有一个名为id的属性，其中包含唯一的标识符

// Codable协议，这将使我们能够存档所有准备存储的现有费用项目

struct ExpenseItem: Identifiable, Codable {
    let id = UUID() // 唯一的标志
    let name: String
    let type: String
    let amount: Int
}
