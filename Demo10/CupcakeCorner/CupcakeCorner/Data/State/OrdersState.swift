//
//  OrdersState.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import Foundation
import Combine
import CypherPoetSwiftUIKit

struct OrdersState {
    var currentOrder: Order? = nil
    var successfullySavedOrder: Order? = nil
    var saveError: CupcakeAPIService.Error? = nil
}

enum OrdersSideEffect {//: SideEffect {
    case saveCurrent(order: Order)
    
//    func mapToAction() -> AnyPublisher<AppAction, Never> {
//        switch self {
//        case .saveCurrent(let order):
//            return Dependencies.cupcakeAPIService
//                .save(order)
////                .map { AppAction.order }
//        default:
//            <#code#>
//        }
//    }
    
//    func mapToAction(using environment: AppEnvironment) -> AnyPublisher<AppAction, Never> {
//        switch self {
//        case .saveCurrent(let order):
//            return Dependencies.cupcakeAPIService
//                .save(order)
//                .map { AppAction.order }
//        default:
//            <#code#>
//        }
//    }
}

enum OrdersAction {
    case saved(_ order: Order)
    case saveFailed(error: CupcakeAPIService.Error)
}

// MARK: - Reducer
//let ordersReducer = Reducer<OrdersState, OrdersAction> { state, action in
//    switch action {
//    case .saved(let order):
//        state.currentOrder = nil
//        state.saveError = nil
//        state.successfullySavedOrder = order
//    case .saveFailed(let error):
//        state.successfullySavedOrder = nil
//        state.saveError = error
//    }
//}
