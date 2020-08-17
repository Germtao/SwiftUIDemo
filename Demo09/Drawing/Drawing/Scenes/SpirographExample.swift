//
//  SpirographExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct SpirographExample: View {
    @State private var majorRadius: CGFloat = 125.0
    @State private var minorRadius: CGFloat = 75.0
    @State private var penOffset: CGFloat = 25.0
    @State private var amountToDraw: CGFloat = 1.0
    @State private var hue: CGFloat = 0.17
}

extension SpirographExample {
    var body: some View {
        VStack {
            Spirograph(
                majorRadius: majorRadius,
                minorRadius: minorRadius,
                penOffset: penOffset,
                amount: amountToDraw
            )
            .stroke(currentStrokeColor, lineWidth: 1)
            .drawingGroup()
            
            controls
                .padding()
        }
    }
}

extension SpirographExample {
    var currentStrokeColor: Color {
        Color(hue: Double(hue), saturation: 1, brightness: 1)
    }
}

extension SpirographExample {
    private var controls: some View {
        VStack(spacing: 22.0) {
            VStack(spacing: 8.0) {
                Text("外圆半径: \(Int(majorRadius))")
                
                Slider(value: $majorRadius, in: 1...250, step: 1.0, minimumValueLabel: Text("1"), maximumValueLabel: Text("250")) {
                    Text("Major Radius")
                }
                .labelsHidden()
            }
            
            VStack(spacing: 8.0) {
                Text("内圆半径: \(Int(minorRadius))")
                
                Slider(value: $minorRadius, in: 1...150, step: 1.0, minimumValueLabel: Text("1"), maximumValueLabel: Text("150")) {
                    Text("Minor Radius")
                }
            }
            
            VStack(spacing: 8.0) {
                Text("虚拟笔距内圆中心的距离: \(Int(penOffset))")
                
                Slider(value: $penOffset, in: 1...100, step: 1.0, minimumValueLabel: Text("1"), maximumValueLabel: Text("100")) {
                    Text("Pen Offset Distance")
                }
            }
            
            VStack(spacing: 8.0) {
                Text("画多少轮盘: \(amountToDraw, specifier: "%.2f")")
                
                Slider(value: $amountToDraw, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                    Text("Amount To Draw")
                }
            }
            
            VStack(spacing: 8.0) {
                Text("色调: \(hue, specifier: "%.2f")")
                
                Slider(value: $hue, minimumValueLabel: Text("0"), maximumValueLabel: Text("1")) {
                    Text("Hue")
                }
            }
        }
        .labelsHidden()
        .font(.callout)
    }
}

struct SpirographExample_Previews: PreviewProvider {
    static var previews: some View {
        SpirographExample()
    }
}
