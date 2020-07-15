//
//  ContentView.swift
//  CoreImageDemo
//
//  Created by QDSG on 2020/7/15.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

struct ContentView: View {
    @State private var image: Image?
    
    @State private var showingImagePicker = false
    
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("选择图片") {
                self.showingImagePicker = true
            }
        }
        .onAppear(perform: loadImage)
        .sheet(isPresented: $showingImagePicker, onDismiss: updateImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func updateImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        // 第一个是要保存的图像
        // 第二个是应通知有关保存结果的对象
        // 第三个是应运行的对象的方法
        // 第四个是可以在此处提供任何类型的数据，并且在调用我们的完成方法时会将其传递回给我们
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
        
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        // 创建一个 Core Image 上下文
        let context = CIContext()
        
        // 创建一个 Core Image 过滤器
        
        // 棕褐色调
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.intensity = 1 // 棕褐色效果的强度[0, 1]
        
//        let currentFilter = CIFilter.pixellate() // 像素化滤镜
//        currentFilter.scale = 100
        
//        currentFilter.inputImage = beginImage
        
        // 水晶效果
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.setValue(beginImage, forKey: kCIInputImageKey) // 旧Api，效果更好
//        currentFilter.radius = 200
        
        // 旋转扭曲
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(200, forKey: kCIInputRadiusKey)
        currentFilter.setValue(
            CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2),
            forKey: kCIInputCenterKey
        )
        
        // 过滤器读取输出图像 CIImage
        guard let outputImage = currentFilter.outputImage else { return }
        
        // 询问我们的上下文，从该输出图像创建 CGImage
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            // 将该CGImage转换为UIImage
            let uiImage = UIImage(cgImage: cgImage)
            
            // 将该UIImage转换为SwiftUI Image
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
