//
//  ContentView.swift
//  BetterRest
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

// MARK: - 使用机器学习改善睡眠

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier: "%.2f") hours")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
