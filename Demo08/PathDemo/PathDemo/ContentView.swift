//
//  ContentView.swift
//  PathDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

// Path: 路径被设计为做一件特定的事情
// Shape: 形状具有绘制空间的灵活性，并且还可以接受参数以使我们进一步自定义它们

struct ContentView: View {
    
    let dataSource = ["Path、Shape等", "CGAffineTransform"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<dataSource.count) { index in
                    if index == 0 {
                        NavigationLink(destination: PathView()) {
                            Text(self.dataSource[index]).font(.headline)
                        }
                    } else {
                        NavigationLink(destination: CGAffineTransformView()) {
                            Text(self.dataSource[index]).font(.headline)
                        }
                    }
                }
            }
            .navigationBarTitle("绘图")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
