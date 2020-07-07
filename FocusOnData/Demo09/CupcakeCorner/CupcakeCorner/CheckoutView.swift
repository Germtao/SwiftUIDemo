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
                    
                    Button("下单") {
                        // 下单
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("支付订单", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
