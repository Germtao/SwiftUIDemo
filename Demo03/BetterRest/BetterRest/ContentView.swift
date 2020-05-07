//
//  ContentView.swift
//  BetterRest
//
//  Created by QDSG on 2020/5/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

// MARK: - 使用机器学习改善睡眠

struct ContentView: View {
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeUpTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    let model = SleepCalculator()
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section(header: Text("你想什么时候醒？").font(.headline)) {
                    DatePicker("闹铃",
                           selection: $wakeUp,
                           displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("每日需要睡眠的时间").font(.headline)) {
                    Stepper(value: $sleepAmount, in: 4 ... 12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") 小时")
                    }
                }
                
                Section(header: Text("每日咖啡摄入量").font(.headline)) {
                    Stepper(value: $coffeeAmount, in: 1...12) {
                        Text("\(coffeeAmount) 杯")
                    }
                }
            }
            .navigationBarTitle("更好的休息")
            .navigationBarItems(trailing:
                Button(action: calculateBedtime) {
                    Text("计算")
                }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("确定")))
            }
        }
    }
    
    func calculateBedtime() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertTitle = "您理想的就寝时间是..."
            alertMessage = formatter.string(from: sleepTime)
            
        } catch {
            alertTitle = "错误"
            alertMessage = "抱歉，计算您的入睡时间时出现问题"
        }
        
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
