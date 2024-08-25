//
//  APIClient.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation
import Combine

struct APIClient {
    var baseURL: String!
    var networkDispatcher: NetworkDispatcher!
    init(baseURL: String,networkDispatcher: NetworkDispatcher = NetworkDispatcher()
    ) {
        self.baseURL = baseURL
        self.networkDispatcher = networkDispatcher
    }
    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        print("\(String(describing: urlRequest.httpMethod)): \(String(describing: urlRequest.url?.absoluteURL))")
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}
