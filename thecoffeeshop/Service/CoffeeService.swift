//
//  CoffeeService.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation
import Combine

protocol CoffeeServiceProtocal {
    func getHotDrink() -> AnyPublisher<[DrinkCoffee], Error>
    func getIcedDrink() -> AnyPublisher<[DrinkCoffee], Error>
}

class CoffeeService : CoffeeServiceProtocal {
    func getHotDrink() -> AnyPublisher<[DrinkCoffee], Error> {
        apiClient.request(.hot)
    }
    func getIcedDrink() -> AnyPublisher<[DrinkCoffee], Error> {
        apiClient.request(.iced)
    }
    let apiClient = URLSessionAPIClient<CoffeeEndpoint>()
}
