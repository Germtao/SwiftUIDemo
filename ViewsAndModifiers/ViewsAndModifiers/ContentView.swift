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
            
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                CapsuleText(text: "Second")
            }
            
            VStack(spacing: 10) {
                Text("Hello World")
                    .modifier(Title())
                
                Text("Hello SwiftUI")
                    .titleStyle()
                
                Color.blue
                    .frame(width: 200, height: 100)
                    .watermark(with: "SwiftUI Demo")
            }
            
            GrideStack(rows: 4, columns: 4) { (row, column) in
                HStack {
                    Image(systemName: "\(row * 4 + column).circle")
                    Text("R\(row) C\(column)")
                }
            }
        }
    }
}

/// 4. 视图拆分与组合
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

/// 5. 自定义修饰符
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermark(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

/// 6. 自定义容器
struct GrideStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
//    init(rows: Int, columns: Int, content: @escaping (Int, Int) -> Content) {
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
