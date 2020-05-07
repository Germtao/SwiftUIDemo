//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// 1. 条件修饰符
    @State private var useRedText = false
    
    /// 3. 将视图作为属性
    var motto1: some View { return Text("Draco dormiens") }
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Hello World") {
                self.useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            /// 2. 环境修饰符
            VStack {
                /// 子视图的修饰符优先
                Text("Gryffindor")
                    .font(.headline)
                // 常规修饰符, 应用于子视图的任何模糊都会添加到VStack模糊之上，而不是替换它
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .blur(radius: 5)
            
            VStack {
                motto1
                    .foregroundColor(.red)
                motto2
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
