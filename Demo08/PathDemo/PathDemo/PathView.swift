//
//  PathView.swift
//  PathDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack(spacing: 15) {
//                    Path { path in
//                        path.move(to: CGPoint(x: 200, y: 100))
//                        path.addLine(to: CGPoint(x: 100, y: 300))
//                        path.addLine(to: CGPoint(x: 300, y: 300))
//                        path.addLine(to: CGPoint(x: 200, y: 100))
//                        path.addLine(to: CGPoint(x: 100, y: 300))
//                    }
//            //        .fill(Color.blue)
//                    .stroke(
//                        Color.blue,
//                        style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
//                    )
                    
                    Spacer()
                            
                    Triangle()
        //                .fill(Color.red)
                        .stroke(
                            Color.red,
                            style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
                        )
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    
                    Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                        .strokeBorder(Color.blue, lineWidth: 40)
//                        .stroke(Color.blue, lineWidth: 40)
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationBarTitle("Path、Shade等", displayMode: .inline)
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
