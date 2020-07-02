//
//  Flower.swift
//  PathDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct Flower: Shape {
    /// 花瓣移离中心多少距离
    var petalOffset: Double = -20.0
    
    /// 每片花瓣的宽度
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path() // 容纳所有花瓣的路径
        
        // 从0向上计数到 pi * 2，每次移动 pi / 8
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            // 根据循环旋转当前花瓣
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // 将花瓣移到我们视野的中心
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // 使用我们的属性以及固定的Y和高度为该花瓣创建路径
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            
            // 将我们的旋转/位置变换应用于花瓣
            let rotatedPetal = originalPetal.applying(position)
            
            // 将其添加到我们的主路径
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}
