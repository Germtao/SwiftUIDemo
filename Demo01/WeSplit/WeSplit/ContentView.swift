//
//  ContentView.swift
//  WeSplit
//
//  Created by QDSG on 2020/5/6.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// 1. 有一系列可能的学生名字
    /// 2. 具有一个@State属性存储当前选定学生
    /// 3. 创建一个Picker视图，要求用户选择他们最喜欢的，并将选择的值和@State属性双向绑定
    /// 4. 使用ForEach循环遍历所有可能的学生姓名，将其转换为文本视图
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
            Picker("选择学生", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("选择的学生 # \(students[selectedStudent])")
        }
    }
    
    /// 总结：
    /// 1. students数组不需要用@State标记，因为它是一个常量,不会改变
    /// 2. selectedStudent属性初始值为0，但可以更改，这就是为什么它标记为@State的原因
    /// 3. Picker有一个标签，"选择你的学生"，它告诉用户它做了什么，还提供了一些描述性的东西供屏幕阅读器朗读
    /// 4. Picker与selectedStudent有双向绑定，这意味着它将开始显示0的选择，但是在用户滑动选择器时更新属性
    /// 5. 在ForEach中，我们从0数到（但不包括）数组中的学生数
    /// 6. 我们为每个学生创建一个文本视图，显示该学生的姓名
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
