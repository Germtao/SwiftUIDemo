//
//  ColorCyclingCircle.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var ringCount: Int = 10
    var hueStep: CGFloat = 0.2
}

extension ColorCyclingCircle {
    var body: some View {
        ZStack {
            ForEach(0..<ringCount, id: \.self) { ringIndex in
                Circle()
                    .inset(by: CGFloat(ringIndex))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                self.color(for: ringIndex),
                                self.color(for: ringIndex, brightness: 0.2)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
}

// MARK: - Private Helpers
extension ColorCyclingCircle {
    func hue(for ringIndex: Int) -> Double {
        (Double(ringIndex) / Double(ringCount) + Double(hueStep)).truncatingRemainder(dividingBy: 1)
    }
    
    func color(for ringIndex: Int, brightness: Double = 1, saturation: Double = 1) -> Color {
        Color(
            hue: hue(for: ringIndex),
            saturation: saturation,
            brightness: brightness
        )
    }
}

struct ColorCyclingCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingCircle()
    }
}
