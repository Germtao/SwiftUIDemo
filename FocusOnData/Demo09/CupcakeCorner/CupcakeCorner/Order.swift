//
//  Order.swift
//  CupcakeCorner
//
//  Created by TT on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

class Order: ObservableObject, Codable {
    /// 所有可能选项的静态数组
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    /// 要保存的所有属性
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: CodingKeys.type)
        try container.encode(quantity, forKey: CodingKeys.quantity)
        
        try container.encode(extraFrosting, forKey: CodingKeys.extraFrosting)
        try container.encode(addSprinkles, forKey: CodingKeys.addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
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
