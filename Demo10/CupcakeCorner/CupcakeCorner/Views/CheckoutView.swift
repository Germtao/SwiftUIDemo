//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
}

extension CheckoutView {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("您的价格: $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("下订单") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation, content: {
            Alert(
                title: Text("谢谢！"),
                message: Text(confirmationMessage),
                dismissButton: .default(Text("确定"))
            )
        })
    }
}

// MARK: - Private Helpers
extension CheckoutView {
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "您的订单 \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) 蛋糕已经在路上！"
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
