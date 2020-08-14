//
//  Triangle.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

/// 三角形
struct Triangle {
    /// 每当调用`inset(by:)`时添加到此，以便我们可以正确地支持使用”strokeBorder修饰符”
    var insetAmount: CGFloat = 0.0
}

extension Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: topPoint(in: rect))
        
        path.addLine(to: rightBottomPoint(in: rect))
        path.addLine(to: leftBottomPoint(in: rect))
        path.addLine(to: topPoint(in: rect))
        
        return path
    }
}

// MARK: -  InsettableShape 固定形状
extension Triangle: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var newShape = self
        newShape.insetAmount += amount
        return newShape
    }
}

// MARK: - Private Helpers
extension Triangle {
    private func topPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.midX, y: rect.minY)
    }
    
    private func leftBottomPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.minX, y: rect.maxY)
    }
    
    private func rightBottomPoint(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.maxX, y: rect.maxY)
    }
}
