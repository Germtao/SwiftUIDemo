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
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}
