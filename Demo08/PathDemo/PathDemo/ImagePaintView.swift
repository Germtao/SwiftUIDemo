//
//  ImagePaintView.swift
//  PathDemo
//
//  Created by QDSG on 2020/7/2.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, World!")
                .frame(width: 300, height: 300)
                .border(
                    ImagePaint(
                        image: Image("Example"),
                        // 0-“开始”，1-“结束”
                        sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5),
                        scale: 0.8
                    ),
                    width: 30
                )
            
            Spacer()
            
            Capsule()
                .strokeBorder(
                    ImagePaint(image: Image("Example"), scale: 0.4),
                    lineWidth: 20
                )
                .frame(width: 300, height: 200)
            
            Spacer()
        }
        .navigationBarTitle("ImagePaint", displayMode: .inline)
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
