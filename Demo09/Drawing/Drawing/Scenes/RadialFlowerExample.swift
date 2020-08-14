//
//  RadialFlowerExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct RadialFlowerExample: View {
    @State private var petalWidth: CGFloat = 100.0
    @State private var petalCount: Int = 16
    @State private var petalOffset: CGFloat = 20.0
}

extension RadialFlowerExample {
    var body: some View {
        VStack {
            RadialFlower(
                petalWidth: petalWidth,
                petalCount: petalCount,
                petalOffset: petalOffset
            )
            .fill(Color.pink, style: FillStyle(eoFill: true))
            
            Spacer()
            
            petalControls
                .padding()
        }
        .padding(.horizontal)
    }
}

extension RadialFlowerExample {
    private var petalControls: some View {
        VStack(spacing: 22.0) {
            Stepper(value: $petalCount, in: 4...24) {
                HStack {
                    Text("花瓣数量")
                    Spacer()
                    Text("\(petalCount)")
                }
            }
            
            VStack(spacing: 8) {
                Text("花瓣宽度：\(petalWidth)")
                
                Slider(
                    value: $petalWidth,
                    in: 0...100,
                    minimumValueLabel: Text("0"),
                    maximumValueLabel: Text("100")
                ) {
                    Text("花瓣宽度")
                }
                .labelsHidden()
            }
            
            VStack(spacing: 8) {
                Text("花瓣离中心的距离：\(petalOffset)")
                
                Slider(
                    value: $petalOffset,
                    in: -40...40,
                    minimumValueLabel: Text("-40"),
                    maximumValueLabel: Text("40")
                ) {
                    Text("花瓣离中心的距离")
                }
                .labelsHidden()
            }
        }
    }
}

struct RadialFlowerExample_Previews: PreviewProvider {
    static var previews: some View {
        RadialFlowerExample()
    }
}
