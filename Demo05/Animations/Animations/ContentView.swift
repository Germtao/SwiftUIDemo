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
    @State private var animAmount1 = 0.0
    
    @State private var enabled = false
    
    /// 存储其拖动量
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    
    var body: some View {
        print(animAmount)
        
        return VStack {
            Stepper(
                "Scale Amount",
                value: $animAmount.animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ),
                in: 1...10
            )
            
            Spacer()
            
            Button("隐式动画") {
                self.animAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animAmount)
            
            Spacer()
            
            Button("显式动画") {
//                withAnimation {
//                    self.animAmount1 += 360
//                }
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animAmount1 += 360
                }
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animAmount1), axis: (x: 0, y: 1, z: 0)) // 沿Y轴旋转
            
            Spacer()
            
            Button("控制动画堆栈") {
                self.enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? Color.blue : Color.red)
//            .animation(nil)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//            .background(enabled ? Color.blue : Color.red)
            
            Spacer()
            
            // 手势动画
            LinearGradient(
                gradient: Gradient(colors: [.yellow, .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in
                        // 显式动画
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
            )
//            .animation(.spring()) // 隐式动画
            
            LabelView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
