//
//  ContentView.swift
//  ScrollViewDemo
//
//  Created by QDSG on 2020/7/1.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 会立即创建CustomText
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        // 仅在真正需要时才创建CustomText
//        List {
//            ForEach(0..<100) {
//                CustomText("Item \($0)")
//                    .font(.title)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
