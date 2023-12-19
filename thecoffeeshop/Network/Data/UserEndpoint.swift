//
//  UserEndpoint.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation

let baseDomain = "http://10.10.10.100:4443"

enum UserEndpoint: APIEndpoint {
    
    case profile
    
    var baseURL: URL {
        return URL(string: "\(baseDomain)/api/user/")!
    }
    
    var path: String {
        switch self {
        case .profile:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .profile:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .profile:
            return nil
//            return ["Authorization":"Bearer TOKEN"]
        }
    }
    
    var paramester: [String : Any]? {
        switch self {
        case .profile:
            return nil
        }
    }
}
