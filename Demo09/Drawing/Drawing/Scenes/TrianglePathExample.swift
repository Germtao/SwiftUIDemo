//
//  TrianglePathExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/14.
//

import SwiftUI

struct TrianglePathExample: View {
    var body: some View {
        VStack {
            trianglePath
        }
        .navigationBarTitle("Triangle Path")
    }
}

// MARK: - View Variables
extension TrianglePathExample {
    private var trianglePath: some View {
        Path({ path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        })
        .stroke(Color.pink, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct TrianglePathExample_Previews: PreviewProvider {
    static var previews: some View {
        TrianglePathExample()
    }
}
