//
//  AppState.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import SwiftUI
import CypherPoetSwiftUIKit

struct AppState {
    var orderState = OrdersState()
}

enum AppAction {
    case orders(_ orderAction: OrdersAction)
}

//let appReducer = Reducer<AppState, AppAction> { (state, action) in
//    switch action {
//    case let .orders(action):
//        ordersReducer.reduce(&state.ordersState, action)
//    }
//}

//typealias AppStore = Store<AppState, AppAction>
