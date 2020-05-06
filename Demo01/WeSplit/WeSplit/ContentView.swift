//
//  ContentView.swift
//  WeSplit
//
//  Created by QDSG on 2020/5/6.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 表单最大10行, 可以使用Section、Group
        Form {
            
            Section {
                Text("Hello, World!")
            }
            
            Section {
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
                Text("Hello World")
            }
            
            Group {
                Text("Hello World")
                Text("Hello World")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
