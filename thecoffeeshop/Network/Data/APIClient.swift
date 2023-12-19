//
//  APIClient.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T,Error>
}


class URLSessionAPIClient<EndpointType: APIEndpoint> : APIClient{
    func request<T>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> where T : Decodable {
        debugPrint("==>\(endpoint)")
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach{ header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap{ data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                        debugPrint("==>\(response)")
                        throw APIError.invalidReponse
                    }
                debugPrint("==>\(data)")
                return data
                
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
