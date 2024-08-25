//
//  CoffeeEndpoint.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation

enum CoffeeEndpoint: APIEndpoint {
    static var baseURL: String {
        return "\(scheme):/\(domain)/\(basePath)"
    }
    var path: String {
        switch self {
        case .hot:
            return "hot"
        case .iced:
            return "iced"
        }
    }
    case hot
    case iced
}
