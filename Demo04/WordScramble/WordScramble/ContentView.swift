//
//  ContentView.swift
//  WordScramble
//
//  Created by QDSG on 2020/6/29.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord  = ""
    @State private var newWord   = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("输入单词", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none) // 禁用大写
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) { () -> Alert in
                Alert(
                    title: Text(errorTitle),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("知道了"))
                )
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "已使用的单词", message: "请重新输入！")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "无法识别的单词", message: "请重新输入！")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "无效的单词", message: "那不是一个真正的单词！")
            return
        }
        
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        // 1. 在应用程序包中找到start.txt的URL
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. 将start.txt加载到字符串中
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. 将字符串拆分为字符串数组
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. 选择一个随机单词(为空时，用“蚕”作为默认选择)
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // 如果一切都正常，那么可以退出
                return
            }
        }
        
        // 如果在这里，则存在问题–触发崩溃并报告错误
        fatalError("Could not load start.txt from bundle.")
    }
    
    /// 检测单词没有被使用过
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    /// 检查一个随机单词是否可以由另一个随机单词的字母构成
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    /// 检查是一个真正的英语单词
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    // MARK: - Error
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
