//
//  Arc.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

/// 弧
struct Arc {
    let startAngle: Angle
    let endAngle: Angle
    let isCloseWise: Bool
    let startsFromTop: Bool
    
    private let rotationAdjustment = Angle(radians: .pi / 2)
    
    /// 每当调用`inset(by:)`时添加到此，以便我们可以正确地支持使用”strokeBorder修饰符”
    var insetAmount: CGFloat = 0.0
    
    init(
        startAngle: Angle,
        endAngle: Angle,
        isCloseWise: Bool = false,
        startsFromTop: Bool = false
    ) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.isCloseWise = isCloseWise
        self.startsFromTop = startsFromTop
    }
}

// MARK: - Computeds
extension Arc {
    var modifiedStartAngle: Angle {
        startsFromTop ? startAngle - rotationAdjustment : startAngle
    }
    
    var modifiedEndAngle: Angle {
        startsFromTop ? endAngle - rotationAdjustment : endAngle
    }
}

// MARK: - Shape
extension Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: (min(rect.width, rect.height) / 2) - insetAmount,
            startAngle: modifiedStartAngle,
            endAngle: modifiedEndAngle,
            clockwise: isCloseWise
        )
        
        return path
    }
}

// MARK: - InsettableShape
extension Arc: InsettableShape {
    func inset(by amount: CGFloat) -> some InsettableShape {
        var newArc = self
        newArc.insetAmount += amount
        return newArc
    }
}


