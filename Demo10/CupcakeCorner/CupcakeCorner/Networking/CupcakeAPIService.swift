//
//  CupcakeAPIService.swift
//  CupcakeCorner
//
//  Created by QDSG on 2020/8/19.
//

import Foundation
import Combine
import CypherPoetNetStack
import CypherPoetNetStack_Core

class CupcakeAPIService: ModelTransportRequestPublishing {
    static let defaultQueue = DispatchQueue(label: "API Queue", qos: .userInitiated, attributes: [.concurrent])
    
    var session: URLSession
    var queue: DispatchQueue
    
    init(session: URLSession = .shared, queue: DispatchQueue = defaultQueue) {
        self.session = session
        self.queue = queue
    }
    
    func save(_ order: Order) -> AnyPublisher<Order, Error> {
        guard let url = Endpoint.order.url else { fatalError() }
        
        return encode(dataFor: order, sendingInBodyOf: URLRequest(url: url), parsingResponseOn: queue)
            .eraseToAnyPublisher()
    }
}

extension CupcakeAPIService {
    public typealias Error = NetStackError
}
