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
            
            Button("显示动画") {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
