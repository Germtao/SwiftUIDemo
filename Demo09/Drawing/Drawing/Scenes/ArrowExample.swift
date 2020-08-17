//
//  ArrowExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct ArrowExample: View {
    @State private var arrowBaseWidthPercentage: CGFloat = 0.5
    @State private var arrowBaseHeightPercentage: CGFloat = 0.67
}

extension ArrowExample {
    var body: some View {
        VStack(spacing: 24.0) {
            Arrow(
                baseWidthPct: arrowBaseWidthPercentage,
                baseHeightPct: arrowBaseHeightPercentage
            )
            .animation(.easeIn(duration: 0.8))
            
            controls
                .padding(.vertical)
        }
        .padding()
        .navigationTitle("自定义箭头形状")
    }
}

extension ArrowExample {
    private var controls: some View {
        VStack(spacing: 22.0) {
            VStack(spacing: 8.0) {
                Text("基本宽度百分比: \(Int(arrowBaseWidthPercentage * 100))%")
                
                Slider(value: $arrowBaseWidthPercentage, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                    Text("Base Width Percentage")
                }
            }
            
            VStack(spacing: 8.0) {
                Text("基本高度百分比: \(Int(arrowBaseHeightPercentage * 100))%")
                
                Slider(value: $arrowBaseHeightPercentage, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                    Text("Base Height Percentage")
                }
            }
        }
        .labelsHidden()
    }
}

struct ArrowExample_Previews: PreviewProvider {
    static var previews: some View {
        ArrowExample()
    }
}
