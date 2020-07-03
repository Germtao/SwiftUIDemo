//
//  Checkerboard.swift
//  AnimatableDataDemo
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

// MARK: - 问题：我们如何为三个属性设置动画？还是四个？
// AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>
// 它们使用三个独立的动画对，然后使用诸如newValue.second.second.first之类的代码对其进行设置

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 计算每行/列需要多大
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        
        // 循环遍历所有行和列，从而使交替的正方形变为彩色
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // 这个正方形应该是彩色的；在此处添加一个矩形
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}
