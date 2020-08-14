//
//  ColorGradientCyclingExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct ColorGradientCyclingExample: View {
    @State private var ringCount: CGFloat = 90.0
    @State private var hueStep: CGFloat = 0.2
}

extension ColorGradientCyclingExample {
    var body: some View {
        VStack {
            ColorCyclingCircle(ringCount: Int(ringCount), hueStep: hueStep)
            
            circleControls
                .padding()
        }
        .padding(.horizontal)
    }
}

extension ColorGradientCyclingExample {
    private var circleControls: some View {
        VStack(spacing: 32.0) {
            VStack(spacing: 8) {
                Text("环数：\(Int(ringCount))")
                
                Slider(value: $ringCount, in: 1...200, minimumValueLabel: Text("1"), maximumValueLabel: Text("200")) {
                    Text("环数")
                }
                .labelsHidden()
            }
            
            VStack(spacing: 8) {
                Text("色相：\(hueStep)")
                
                Slider(value: $hueStep, in: 0...1, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                    Text("色相")
                }
                .labelsHidden()
            }
        }
    }
}

struct ColorGradientCyclingExample_Previews: PreviewProvider {
    static var previews: some View {
        ColorGradientCyclingExample()
    }
}
