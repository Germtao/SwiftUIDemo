//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
}

extension AddressView {
    var body: some View {
        Form {
            Section {
                TextField("姓名", text: $order.name)
                TextField("街道地址", text: $order.streetAddress)
                TextField("城市", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(
                    destination: CheckoutView(order: order),
                    label: {
                        Text("下单")
                    }
                )
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationBarTitle("交易详情", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
