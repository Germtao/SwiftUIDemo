//
//  ColorCyclingRectangle.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var layerCount: Int = 10
    var hueStep: CGFloat = 0.2
    
    var gradientStartPoint = UnitPoint(x: 0.5, y: 0.0)
    var gradientEndPoint = UnitPoint(x: 0.5, y: 1.0)
}

extension ColorCyclingRectangle {
    var body: some View {
        ZStack {
            ForEach(0..<layerCount, id: \.self) { layerIndex in
                Rectangle()
                    .inset(by: CGFloat(layerIndex))
                    .strokeBorder(self.borderGradient(for: layerIndex))
            }
        }
    }
}

extension ColorCyclingRectangle {
    func borderGradient(for layerIndex: Int) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    self.color(for: layerIndex),
                    self.color(for: layerIndex, brightness: 0.0)
                ]),
            startPoint: gradientStartPoint,
            endPoint: gradientEndPoint
        )
    }
    
    func color(for layerIndex: Int, saturation: Double = 1, brightness: Double = 1) -> Color {
        Color(
            hue: hue(for: layerIndex),
            saturation: saturation,
            brightness: brightness
        )
    }
    
    func hue(for layerIndex: Int) -> Double {
        let steppedHue = (Double(layerIndex) / Double(layerCount)) + Double(hueStep)
        
        return steppedHue.truncatingRemainder(dividingBy: 1)
    }
}

struct ColorCyclingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingRectangle(layerCount: 100, hueStep: 0.02)
            .drawingGroup()
    }
}
