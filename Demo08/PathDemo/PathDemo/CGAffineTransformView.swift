//
//  DrawPathView.swift
//  PathDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct CGAffineTransformView: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(Color.red, lineWidth: 1)
//                .fill(Color.purple)
                .fill(Color.red, style: FillStyle(eoFill: true))
            
            Spacer()
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle("CGAffineTransform", displayMode: .inline)
    }
}

struct DrawPathView_Previews: PreviewProvider {
    static var previews: some View {
        CGAffineTransformView()
    }
}
