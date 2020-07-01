//
//  ContentView.swift
//  GeometryReaderDemo
//
//  Created by QDSG on 2020/7/1.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image("Example")
//                .resizable() // 调整图像内容的大小
//                .aspectRatio(contentMode: .fill) // 按比例调整自身大小
//                .frame(width: 300, height: 300)
////                .clipped()
            
            // 让这个图像填满屏幕的宽度
            // 它可以自动计算出高度：它知道原始宽度，知道我们的目标宽度，并且知道我们的内容模式，
            // 因此它了解图像的目标高度如何与图像的目标宽度成比例
            GeometryReader { geo in
                Image("Example")
                    .resizable() // 调整图像内容的大小
                    .aspectRatio(contentMode: .fit) // 按比例调整自身大小
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
