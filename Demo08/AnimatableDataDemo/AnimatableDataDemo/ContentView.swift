//
//  ContentView.swift
//  AnimatableDataDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var insetAmount: CGFloat = 50
    
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        VStack {
            Spacer()
            
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 10...90)
                    }
            }
            
            Spacer()
            
            Checkerboard(rows: rows, columns: columns)
                .onTapGesture {
                    withAnimation(.linear(duration: 3)) {
                        self.rows = Int.random(in: 4...8)
                        self.columns = Int.random(in: 4...16)
                    }
                }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
