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
        VStack {
            
            Button(action: {
                print("文本按钮已点击")
            }) {
                Text("文本按钮")
            }
            
            Image(systemName: "pencil")
            
            Button(action: {
                print("图文按钮已点击")
            }) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("图文按钮")
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
