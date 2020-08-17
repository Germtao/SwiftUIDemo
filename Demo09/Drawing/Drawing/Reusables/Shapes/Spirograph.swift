//
//  Spirograph.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct Spirograph {
    /// 外圆半径
    let majorRadius: CGFloat
    
    /// 内圆半径
    let minorRadius: CGFloat
    
    /// 虚拟笔距内圆中心的距离
    let penOffset: CGFloat
    
    /// 画多少轮盘
    let amount: CGFloat
}

extension Spirograph {
    var animatableData: EmptyAnimatableData {
        .init()
    }
}

extension Spirograph: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let divisor = gcd(Int(minorRadius), b: Int(majorRadius))
        let deltaR = majorRadius - minorRadius
        let endPoint = ceil(2 * .pi * majorRadius / CGFloat(divisor)) * amount
        let xIncrement = rect.width / 2
        let yIncrement = rect.height / 2
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = (cos(theta) * deltaR) + (penOffset * cos(deltaR * theta / minorRadius))
            var y = (sin(theta) * deltaR) + (penOffset * sin(deltaR * theta / minorRadius))
            
            x += xIncrement
            y += yIncrement
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}
