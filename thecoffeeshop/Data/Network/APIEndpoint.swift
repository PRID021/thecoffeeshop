//
//  ApiEndpoint.swift
//  thecoffeeshop
//
//  Created by TE-Member on 25/08/2024.
//

import Foundation

var scheme: String = "https"
var domain: String = "api.sampleapis.com"
var basePath: String = "coffee"

public protocol APIEndpoint {
    static  var baseURL: String { get }
    var path: String { get }
}
