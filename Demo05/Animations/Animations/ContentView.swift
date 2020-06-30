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
//            self.animAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .overlay( // 按钮周围形成一种脉动的圆圈
            Circle()
                .stroke(Color.red)
                .scaleEffect(animAmount)
                .opacity(Double(2 - animAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
