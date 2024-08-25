//
//  CoffeeService.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation
import Combine

struct FetchHotDrink: Request {
    var path: String  = CoffeeEndpoint.hot.path
    typealias ReturnType = [DrinkCoffee]
}

struct FetchIcedDrink: Request {
    var path: String  = CoffeeEndpoint.iced.path
    typealias ReturnType = [DrinkCoffee]
}

protocol CoffeeServiceProtocal {
    func getHotDrink() -> AnyPublisher<FetchHotDrink.ReturnType, NetworkRequestError>
    func getIcedDrink() -> AnyPublisher<FetchIcedDrink.ReturnType, NetworkRequestError>
}

class CoffeeService: CoffeeServiceProtocal {

    let dispatcher = NetworkDispatcher()
    let apiClient = APIClient(baseURL: CoffeeEndpoint.baseURL)
    func getHotDrink() -> AnyPublisher<FetchHotDrink.ReturnType, NetworkRequestError> {
        return apiClient.dispatch(FetchHotDrink())
    }
    func getIcedDrink() -> AnyPublisher<FetchIcedDrink.ReturnType, NetworkRequestError> {
        return apiClient.dispatch(FetchIcedDrink())
    }
}
