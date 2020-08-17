//
//  Checkerboard.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct Checkerboard {
    var rowCount: Int = 3
    var columnCount: Int = 3
}

extension Checkerboard {
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(CGFloat(rowCount), CGFloat(columnCount))
        }
        set {
            rowCount = Int(newValue.first)
            columnCount = Int(newValue.second)
        }
    }
}

extension Checkerboard: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let columnWidth = self.columnWidth(in: rect)
        let rowHeight = self.rowHeight(in: rect)
        
        for row in 0..<rowCount {
            for column in 0..<columnCount {
                if (row + column).isMultiple(of: 2) {
                    // 这个正方形应该被填满
                    let startX = columnWidth * CGFloat(column)
                    let startY = rowHeight * CGFloat(row)
                    
                    let boardRect = CGRect(x: startX, y: startY, width: columnWidth, height: rowHeight)
                    
                    path.addRect(boardRect)
                }
            }
        }
        
        return path
    }
}

extension Checkerboard {
    func columnWidth(in rect: CGRect) -> CGFloat {
        rect.width / CGFloat(columnCount)
    }
    
    func rowHeight(in rect: CGRect) -> CGFloat {
        rect.height / CGFloat(rowCount)
    }
}
