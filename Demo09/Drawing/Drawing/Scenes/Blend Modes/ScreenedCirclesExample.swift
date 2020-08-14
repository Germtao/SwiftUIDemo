//
//  ScreenedCirclesExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct ScreenedCirclesExample: View {
    @State private var circleOffsetAmount: CGFloat = 1.0
}

extension ScreenedCirclesExample {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * circleOffsetAmount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * circleOffsetAmount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * circleOffsetAmount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $circleOffsetAmount, in: 0...1)
                .accessibility(label: Text("更改圆偏移量"))
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
    }
}

struct ScreenedCirclesExample_Previews: PreviewProvider {
    static var previews: some View {
        ScreenedCirclesExample()
    }
}
