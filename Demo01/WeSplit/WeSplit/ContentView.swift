//
//  ContentView.swift
//  WeSplit
//
//  Created by QDSG on 2020/5/6.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// 账单金额
    @State private var checkAmount = ""
    /// 人数
    @State private var numberOfPeople = 2
    /// 小费百分比
    @State private var tipPercentage = 2
    
    /// 小费百分比列表
    let tipPercentages = [10, 15, 20, 25, 0]
    
    /// 同步的原因：
    /// 1. 我们的文本输入框与checkAmount属性有双向绑定
    /// 2. checkAmount属性用@State标记，它自动监视值的更改
    /// 3. 当@State属性更改时，SwiftUI将重新调用body属性（即，重新加载我们的UI）
    /// 4. 因此，文本视图将获得checkAmount的更新值
    
    var body: some View {
        Form {
            Section {
                TextField("账单金额", text: $checkAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text("$\(checkAmount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
