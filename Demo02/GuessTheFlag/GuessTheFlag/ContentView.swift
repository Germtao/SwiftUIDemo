//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// shuffled()方法自动为我们处理数组顺序的随机化
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("选择国旗")
                        .foregroundColor(.white)
                    Text(self.countries[correctAnswer])
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                
                Spacer()
            }
        }
            
            /// 显示Alert了。这需要：
            /// 1. 使用alert()修饰符，以便在showingScore为true时显示警报
            /// 2. 展示我们设置的scoreTitle
            /// 3. 有一个在点击调用askQuestion()时的关闭按钮
            
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle),
                  message: Text("Your score is ???"),
                  dismissButton: .default(Text("Continue"),
                                          action: {
                    self.askQuestion()
            }))
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
