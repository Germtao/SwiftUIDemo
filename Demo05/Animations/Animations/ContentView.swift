//
//  ContentView.swift
//  Animations
//
//  Created by QDSG on 2020/6/30.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animAmount: CGFloat = 1
    
    var body: some View {
        Button("隐式动画") {
            self.animAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .scaleEffect(animAmount) // 放大
        .animation(
            Animation.easeInOut(duration: 1.0)
//                .delay(1) // 延时
            // 重复一定次数，甚至可以通过将autoreverses设置为true来使其前后反弹
//            .repeatCount(3, autoreverses: true)
            .repeatForever(autoreverses: true)
        )
        
        // 弹簧动画
//        .animation(
//            // stiffness: 初始刚度 即初速度
//            // damping: 阻尼 即摩擦力
//            .interpolatingSpring(stiffness: 20, damping: 0.5)
//        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
