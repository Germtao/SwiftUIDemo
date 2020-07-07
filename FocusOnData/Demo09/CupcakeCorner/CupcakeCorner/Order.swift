//
//  Order.swift
//  CupcakeCorner
//
//  Created by TT on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    /// 所有可能选项的静态数组
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    /// 蛋糕的类型
    @Published var type = 0
    
    /// 用户想要订购多少蛋糕
    @Published var quantity = 3
    
    /// 用户是否要提出特殊请求
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    /// 用户是否要在蛋糕上加糖霜
    @Published var extraFrosting = false
    
    /// 用户是否要在蛋糕上撒些巧克力
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    /// 地址是否有效
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    /// 蛋糕总价格
    var cost: Double {
        // 每个蛋糕 $2
        var cost = Double(quantity) * 2
        
        // 复杂的蛋糕成本更高
        cost += Double(type) / 2
        
        // 额外的糖霜费 $1
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 添加巧克力末 $0.50
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
