//
//  Cupcake.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/17.
//

import Foundation

struct Cupcake {
    var flavor: Flavor = .vanilla
}

extension Cupcake: Codable {}

extension Cupcake {
    /// 味道
    enum Flavor: String, CaseIterable {
        case vanilla    // 香草
        case strawberry // 草莓
        case chocolate  // 巧克力
        case rainbow    // 彩虹
    }
}

extension Cupcake.Flavor: Hashable {}
extension Cupcake.Flavor: Codable {}

extension Cupcake.Flavor: Identifiable {
    var id: String { rawValue }
}

extension Cupcake.Flavor {
    var formDisplayText: String {
        switch self {
        case .vanilla:
            return "🍨 香草味"
        case .strawberry:
            return "🍓 草莓味"
        case .chocolate:
            return "🍫 巧克力味"
        case .rainbow:
            return "🌈 彩虹味"
        }
    }
    
    var cost: Double {
        switch self {
        case .vanilla:
            return 2_000
        case .strawberry:
            return 2_200
        case .chocolate:
            return 2_200
        case .rainbow:
            return 3_000
        }
    }
}
