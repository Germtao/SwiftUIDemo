//
//  Model.swift
//  URLSessionDemo
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
