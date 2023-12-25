//
//  CoffeeEndpoint.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation

var scheme: String = "https"
var domain: String = "api.sampleapis.com"
var basePath: String = "coffee"

enum CoffeeEndpoint: APIEndpoint {
    var baseURL: URL {
        return URL(string: "\(scheme):/\(domain)/\(basePath)")!
    }
    var path: String {
        switch self {
        case .hot:
            return "hot"
        case .iced:
            return "iced"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .hot:
            return .get
        case .iced:
            return .get
        }
    }
    var headers: [String: String]? {
        return nil
    }
    var paramester: [String: Any]? {
        return nil
    }
    case hot
    case iced
}
