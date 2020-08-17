//
//  NumberFormatters.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/17.
//

import Foundation

enum NumberFormatters {
    static let orderCost: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        
        return formatter
    }()
}
