//
//  ImagePicker.swift
//  CoreImageDemo
//
//  Created by QDSG on 2020/7/15.
//  Copyright © 2020 tTao. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        return UIImagePickerController()
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIImagePickerController
}
