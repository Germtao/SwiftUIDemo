//
//  Spirograph.swift
//  Spirograph
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int // 内圈的半径
    let outerRadius: Int // 外圈的半径
    let distance: Int    // 虚拟笔与外圆中心的距离
    let amount: CGFloat  // 要画多少轮盘赌(可选)
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let outerRadius = CGFloat(self.outerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        // 360度乘以外半径除以最大公约数，再乘以我们的数量输入
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path()
        
        // 通过循环从0到我们的终点来画轮盘赌，并放置在精确的X/Y坐标点
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
    
    /// 内半径和外半径的最大公约数
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
}
