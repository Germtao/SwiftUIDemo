//
//  OrderFormViewModel.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/17.
//

import SwiftUI
import Combine

final class OrderFormViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Published Properties
    @Published var selectedFlavorIndex: Int = -1
    @Published var selectedFlavor: Cupcake.Flavor?
    
    @Published var cupcakeQuantity: Int
    @Published var wantsExtraFrosting: Bool
    @Published var addsSprinkles: Bool
    
    @Published var hasSpecialRequest: Bool {
        didSet {
            if hasSpecialRequest == false {
                wantsExtraFrosting = false
                addsSprinkles = false
            }
        }
    }
    
    @Published var isFormValid = false
    
    init(currentOrder: Order? = nil) {
        selectedFlavor = currentOrder?.cupcake?.flavor
        cupcakeQuantity = currentOrder?.quantity ?? 0
        hasSpecialRequest = currentOrder?.preferences.hasSpecialRequest ?? false
        wantsExtraFrosting = currentOrder?.preferences.wantsExtraFrosting ?? false
        addsSprinkles = currentOrder?.preferences.addsSprinkles ?? false
    }
}
