//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/7/7.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    /// 存储消息
    @State private var confirmationMessage = ""
    /// 消息是否可见
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("总价格：$\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("下单") { self.placeOrder() }
                        .padding()
                }
            }
        }
        .navigationBarTitle("支付订单", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("谢谢!"),
                message: Text(confirmationMessage),
                dismissButton: .default(Text("确定"))
            )
        }
    }
    
    func placeOrder() {
        // 1. 将当前的order对象转换为一些可以发送的JSON数据
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // 2. 准备一个URLRequest以JSON格式发送我们的编码数据
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        // 3. 运行该请求并处理响应
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decoded = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "您订购的 \(decoded.quantity)x \(Order.types[decoded.type].lowercased()) 纸杯蛋糕订单即将开始!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server.")
            }
        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
