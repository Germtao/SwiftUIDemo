//
//  ContentView.swift
//  URLSessionDemo
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        // 1. 创建我们要读取的URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
            else {
                print("Invalid URL")
                return
        }
        
        // 2. 将其包装在URLRequest中，这允许我们配置如何访问URL
        let request = URLRequest(url: url)
        
        // 3. 从该URL请求创建并启动网络任务
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 4. 处理网络任务的结果
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // 得到了有用的数据 - 返回到主线程
                    DispatchQueue.main.async {
                        // 更新UI
                        self.results = decodedResponse.results
                    }
                    
                    // 所有工作都完成了，所以可以退出了
                    return
                }
            }
            
            // 如果代码跑到这里了，说明发生了某些错误
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        .resume() // 请求立即开始，控制权移交给系统
        // 它将自动在后台运行，即使在我们的方法结束后也不会被破坏
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
