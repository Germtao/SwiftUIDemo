//
//  ContentView.swift
//  WeSplit
//
//  Created by QDSG on 2020/5/6.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    /// 属性包装器 @State
    /// @State允许绕过结构体的限制：知道不能更改它们的属性，因为结构是固定的
    /// @State允许SwiftUI将该值单独存储在可以修改的地方
    @State private var tapCount = 0
    
    var body: some View {
        Button(action: {
            self.tapCount += 1
        }) {
            Text("Tap Count: \(tapCount)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
