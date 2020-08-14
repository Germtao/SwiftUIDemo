//
//  AnimatableDataExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct AnimatableDataExample: View {
    @State private var insetAmount: CGFloat = 10.0
}

extension AnimatableDataExample {
    var body: some View {
        VStack {
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 300, height: 200)
                .animation(.easeInOut(duration: 0.3))
            
            Slider(value: $insetAmount, in: 0...200)
                .accessibility(label: Text("更改梯形插入量"))
                .padding()
        }
    }
}

struct AnimatableDataExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataExample()
    }
}
