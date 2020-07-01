//
//  CustomText.swift
//  ScrollViewDemo
//
//  Created by QDSG on 2020/7/1.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText("")
    }
}
