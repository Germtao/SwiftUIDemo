//
//  GCD.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import Foundation

public func gcd(_ a: Int, b: Int) -> Int {
    precondition(a != 0)
    
    guard b != 0 else { return a }
    
    return gcd(b, b: a % b)
}
