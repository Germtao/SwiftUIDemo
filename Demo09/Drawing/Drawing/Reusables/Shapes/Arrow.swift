//
//  Arrow.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct Arrow {
    var baseWidthPct: CGFloat = 0.5
    var baseHeightPct: CGFloat = 0.7
}

extension Arrow {
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(baseWidthPct, baseHeightPct) }
        set {
            baseWidthPct = newValue.first
            baseHeightPct = newValue.second
        }
    }
}

extension Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let baseTopY = self.baseTopY(in: rect)
        let baseWidth = self.baseWidth(in: rect)
        
        // 箭头点
        let arrowHeadBottomLeft = CGPoint(x: rect.minX, y: baseTopY)
        let arrowHeadTop = CGPoint(x: rect.minX + (rect.width / 2), y: rect.minY)
        let arrowHeadBottomRight = CGPoint(x: rect.maxX, y: baseTopY)
        
        // 基点
        let baseTopRight = CGPoint(x: rect.midX + baseWidth / 2, y: baseTopY)
        let baseBottomRight = CGPoint(x: rect.midX + baseWidth / 2, y: rect.maxY)
        let baseBottomLeft = CGPoint(x: rect.midX - baseWidth / 2, y: rect.maxY)
        let baseTopLeft = CGPoint(x: rect.midX - baseWidth / 2, y: baseTopY)
        
        path.move(to: arrowHeadBottomLeft)
        
        path.addLine(to: arrowHeadTop)
        path.addLine(to: arrowHeadBottomRight)
        
        path.addLine(to: baseTopRight)
        path.addLine(to: baseBottomRight)
        path.addLine(to: baseBottomLeft)
        path.addLine(to: baseTopLeft)
        
        path.addLine(to: arrowHeadBottomLeft)
        
        return path
    }
}

extension Arrow {
    func baseTopY(in rect: CGRect) -> CGFloat {
        rect.height * (1 - baseHeightPct)
    }
    
    func baseWidth(in rect: CGRect) -> CGFloat {
        rect.width * baseWidthPct
    }
}
