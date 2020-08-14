//
//  RadialFlower.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

/// 径向花
struct RadialFlower {
    /// 每片花瓣的宽度
    var petalWidth: CGFloat = 100.0
    
    var petalCount: Int = 16
    
    /// 花瓣移离中心多少距离
    var petalOffset: CGFloat = -20.0
}

extension RadialFlower: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for radians in stride(
            from: 0,
            to: CGFloat.pi * 2,
            by: CGFloat(rotationIncrement.radians)
        ) {
            let rotation = CGAffineTransform(rotationAngle: radians)
            
            let position = rotation.concatenating(
                CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2)
            )
            
            let rotatedPetal = basePetal(in: rect).applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

// MARK: - Computeds
extension RadialFlower {
    private var rotationIncrement: Angle {
        .radians((2 * .pi) / Double(petalCount))
    }
}

// MARK: - Private Helpers
extension RadialFlower {
    private func basePetal(in rect: CGRect) -> Path {
        let petalHeight = rect.width / 2
        
        return Path(ellipseIn:
            CGRect(
                x: petalOffset,
                y: 0,
                width: petalWidth,
                height: petalHeight
            )
        )
    }
}


