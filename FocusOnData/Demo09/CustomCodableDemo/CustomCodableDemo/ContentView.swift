//
//  ContentView.swift
//  CustomCodableDemo
//
//  Created by QDSG on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class User: ObservableObject, Codable {
    /// 告诉Swift应该加载和保存哪些属性
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        // 此数据应有一个容器，其中的键与CodingKeys枚举中的大小写匹配
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 我们明确表示希望读取字符串，因此，如果name将其更改为整数，则代码将停止编译
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
