//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        /// 渐变由以下几部分组成：
        /// 1. 要显示的颜色数组
        /// 2. 尺寸和方向信息
        /// 3. 要使用的渐变类型
        
        VStack {
            // 线性渐变 LinearGradient 沿一个方向运行, 因此我们为其提供了一个起点和终点
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .leading, endPoint: .trailing)
            // 径向渐变 RadialGradient 以圆形向外移动，因此，我们没有指定方向，而是指定了起点和终点半径——颜色应从圆心到圆心的距离开始和停止变化
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
            // 角度渐变 AngularGradient，尽管您可能听说过其他地方将其称为圆锥形或圆锥形渐变
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
