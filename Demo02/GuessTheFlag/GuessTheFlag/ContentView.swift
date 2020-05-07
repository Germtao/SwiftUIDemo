//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
//            Text("Hello, World!")
//        }
//        .background(Color.red)
        
//        ZStack {
//            Text("Hello, World!")
//                .background(Color.red)
//        }
        
//        ZStack {
//            // Color.red作为一个视图
//            Color.red.frame(width: 200, height: 200)
//            Text("Hello, World!")
//        }
        
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
