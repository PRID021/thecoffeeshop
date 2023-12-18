//
//  Route.swift
//  thecoffeeshop
//
//  Created by mac on 18/12/2023.
//

import Foundation

enum Route {
  
    case home
    case drinkDetail(DrinkItem)
    case order(DrinkItem,DrinkSize)
    case orderTracking
}

extension Route: Hashable {
    func  hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine("home")
        case .drinkDetail(let drinkItem):
            hasher.combine(drinkItem)
        case .order(let drinkItem, let drinkSize):
            hasher.combine(drinkItem)
            hasher.combine(drinkSize)
        case .orderTracking:
            hasher.combine("orderTracking")
        }

    }
}

