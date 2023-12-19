//
//  ApiEndpoint.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? {get}
    var paramester: [String: Any]? {get}
}

enum HTTPMethod: String {
    case `get` = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError: Error {
    case invalidReponse
    case invalidData
}
