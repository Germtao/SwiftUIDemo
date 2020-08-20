//
//  Address.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/17.
//

import Foundation

struct Address {
    var name: String
    var streetAddress: String
    var city: String
    var zipCode: String
}

extension Address: Codable {}
