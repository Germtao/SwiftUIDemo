//
//  AnimatablePairExample.swift
//  Drawing
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct AnimatablePairExample: View {
    @State private var rowCount: CGFloat = 3.0
    @State private var columnCount: CGFloat = 3.0
}

extension AnimatablePairExample {
    var body: some View {
        VStack {
            Checkerboard(rowCount: Int(rowCount), columnCount: Int(columnCount))
                .fill(Color.pink)
                .animation(.easeOut(duration: 2.6))
            
            boardControls
                .padding()
        }
    }
}

extension AnimatablePairExample {
    private var boardControls: some View {
        VStack(spacing: 22.0) {
            VStack(spacing: 8.0) {
                Text("行")
                
                Slider(value: $rowCount, in: 1...50, minimumValueLabel: Text("1"), maximumValueLabel: Text("50")) {
                    Text("Row Count")
                }
                .labelsHidden()
            }
            
            VStack(spacing: 8.0) {
                Text("列")
                
                Slider(value: $columnCount, in: 1...50, minimumValueLabel: Text("1"), maximumValueLabel: Text("50")) {
                    Text("Column Count")
                }
                .labelsHidden()
            }
        }
    }
}

struct AnimatablePairExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairExample()
    }
}
