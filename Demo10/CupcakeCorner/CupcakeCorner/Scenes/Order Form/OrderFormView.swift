//
//  OrderFormView.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/18.
//

import SwiftUI

struct OrderFormView<Destination: View>: View {
    @ObservedObject private(set) var viewModel: OrderFormViewModel
    
    var buildDestination: (() -> Destination)
}

extension OrderFormView {
    var body: some View {
        Form {
            cupcakeSection
            customizationsSection
            
            addressSection
                .disabled(!viewModel.isFormValid)
        }
    }
}

// MARK: - View Variables
extension OrderFormView {
    private var cupcakeSection: some View {
        Section(
            header: Text("蛋糕")
                .font(.headline)
        ) {
            Picker("选择一个蛋糕", selection: $viewModel.selectedFlavorIndex) {
                ForEach(0..<Cupcake.Flavor.allCases.count) { index in
                    Text(Cupcake.Flavor.allCases[index].formDisplayText)
                        .tag(index)
                }
            }
            
            Stepper(value: $viewModel.cupcakeQuantity, in: 0...24) {
                HStack {
                    Text("数量")
                    Spacer()
                    Text("\(viewModel.cupcakeQuantity)")
                }
            }
        }
    }
    
    private var customizationsSection: some View {
        Section(
            header: Text("定制选项")
                .font(.headline)
        ) {
            Toggle(
                isOn: $viewModel.hasSpecialRequest,
                label: {
                Text("特殊要求")
            })
            
            if viewModel.hasSpecialRequest {
                Toggle(isOn: $viewModel.wantsExtraFrosting, label: {
                    Text("糖")
                })
                
                Toggle(isOn: $viewModel.addsSprinkles, label: {
                    Text("奶霜")
                })
            }
        }
    }
    
    private var addressSection: some View {
        NavigationLink(
            destination: buildDestination(),
            label: {
                Text("交易详情")
            }
        )
    }
}

struct OrderFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderFormView(
                viewModel: OrderFormViewModel(),
                buildDestination: { EmptyView() }
            )
        }
    }
}
