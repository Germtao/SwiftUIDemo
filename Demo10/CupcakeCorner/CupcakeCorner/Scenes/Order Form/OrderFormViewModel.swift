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
        
        setupSubscribers()
    }
}

// MARK: - Publishers
extension OrderFormViewModel {
    private var selectedFlavorPubilsher: AnyPublisher<Cupcake.Flavor?, Never> {
        $selectedFlavorIndex
            .drop(while: { $0 < 0 })
            .map({ Cupcake.Flavor.allCases[$0] })
            .eraseToAnyPublisher()
    }
    
    private var isFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(selectedFlavorPubilsher, $cupcakeQuantity)
            .map { (flavor, quantity) in
                flavor != nil && quantity > 0
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Private Helpers
private extension OrderFormViewModel {
    func setupSubscribers() {
        selectedFlavorPubilsher
            .receive(on: DispatchQueue.main)
            .assign(to: \.selectedFlavor, on: self)
            .store(in: &subscriptions)
        
        isFormValidPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &subscriptions)
    }
}
