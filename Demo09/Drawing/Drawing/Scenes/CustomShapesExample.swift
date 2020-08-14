//
//  CustomShapesExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct CustomShapesExample: View {
    private let shapeSize = CGSize(width: 200, height: 200)
    private let strokeStyle = StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                Triangle()
                    .fill(Color.accentColor)
                    .frame(width: shapeSize.width, height: shapeSize.height)
                
                Triangle()
                    .strokeBorder(Color.purple, style: strokeStyle)
                    .frame(width: shapeSize.width, height: shapeSize.height)
                
                Arc(
                    startAngle: .radians(0),
                    endAngle: .radians(.pi * 1.5)
                )
                .strokeBorder(Color.pink, style: strokeStyle)
                .frame(width: shapeSize.width, height: shapeSize.height)
                
                Arc(
                    startAngle: .radians(0),
                    endAngle: .radians(.pi * 1.5),
                    isCloseWise: true,
                    startsFromTop: true
                )
                .strokeBorder(Color.yellow, style: strokeStyle)
                .frame(width: shapeSize.width, height: shapeSize.height)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Triangle Shape")
    }
}

struct CustomShapesExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesExample()
    }
}
