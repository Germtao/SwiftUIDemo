//
//  ContentView.swift
//  Instafilter
//
//  Created by QDSG on 2020/7/14.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount: CGFloat = 0
    
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.red
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get: { self.blurAmount },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        return VStack {
            Text("Hello World")
                .blur(radius: blurAmount)
                .frame(width: 300, height: 300)
                .background(backgroundColor)
                .onTapGesture {
                    self.showingActionSheet = true
                }
                .actionSheet(isPresented: $showingActionSheet) {
                    ActionSheet(
                        title: Text("改变背景色"),
                        message: Text("选择一个颜色"),
                        buttons: [
                            .default(Text("红色"), action: { self.backgroundColor = .red }),
                            .default(Text("绿色"), action: { self.backgroundColor = .green }),
                            .default(Text("蓝色"), action: { self.backgroundColor = .blue })
                        ]
                    )
                }
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
