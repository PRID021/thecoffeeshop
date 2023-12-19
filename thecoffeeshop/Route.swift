//
//  Route.swift
//  thecoffeeshop
//
//  Created by mac on 18/12/2023.
//

import Foundation
import MapKit

enum Route {
  
    case home
    case drinkDetail(DrinkItem)
    case order(DrinkItem,DrinkSize)
    case orderTracking(MKMapItem)
    case userProfile
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
        case .orderTracking(let orderLocation):
            hasher.combine(orderLocation)
        case .userProfile:
            hasher.combine("userProfile")
        }

    }
}

