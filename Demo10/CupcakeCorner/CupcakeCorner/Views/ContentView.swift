//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
}

extension ContentView {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("选择蛋糕样式", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("蛋糕数: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation(), label: {
                        Text("有什么特殊要求吗？")
                    })
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting, label: {
                            Text("加糖")
                        })
                        
                        Toggle(isOn: $order.addSprinkles, label: {
                            Text("加奶")
                        })
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: AddressView(order: order),
                        label: {
                            Text("交易详情")
                        }
                    )
                }
            }
            .navigationTitle("蛋糕角")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
