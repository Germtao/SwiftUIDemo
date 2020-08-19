//
//  OrderFormContainerViewModel.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import SwiftUI
import Combine

class OrderFormContainerViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    var store: AppStore
    
    @Published var isShowAlert = false
    
    init(store: AppStore) {
        self.store = store
    }
}
