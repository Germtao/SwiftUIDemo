//
//  Trapezoid.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

/// 梯形
struct Trapezoid {
    /// 梯形的顶点向内倾斜的量, 其界限
    var insetAmount: CGFloat = 0.0
}

extension Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: bottomLeftPoint(in: rect))
        
        path.addLine(to: topLeftPoint(in: rect))
        path.addLine(to: topRightPoint(in: rect))
        path.addLine(to: bottomRightPoint(in: rect))
        path.addLine(to: bottomLeftPoint(in: rect))
        
        return path
    }
}

extension Trapezoid {
    func bottomLeftPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.minX, y: rect.maxY)
    }
    
    func bottomRightPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.maxX, y: rect.maxY)
    }
    
    func topLeftPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.minX + insetAmount, y: rect.minY)
    }
    
    func topRightPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.maxX - insetAmount, y: rect.minY)
    }
}

extension Trapezoid {
    var animatableData: CGFloat {
        get { insetAmount }
        set { insetAmount = newValue }
    }
}
