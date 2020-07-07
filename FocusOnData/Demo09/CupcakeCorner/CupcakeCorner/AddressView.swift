//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by TT on 2020/7/3.
//  Copyright © 2020 tTao. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("姓名", text: $order.name)
                TextField("街道地址", text: $order.streetAddress)
                TextField("城市", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("检查有效地址")
                }
                .disabled(!order.hasValidAddress)
            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
