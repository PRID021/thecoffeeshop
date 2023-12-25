//
//  HotCoffee.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation

struct DrinkCoffee: Codable, Identifiable {
    var title: String
    var description: String
    var ingredients: [String]
    var image: String
    var id: Int
}

extension DrinkCoffee {
    func toDrinkItem() -> DrinkItem {
        DrinkItem(
        starRate: 4.3,
        image: self.image,
        categorie: self.title,
        toping: self.ingredients.reduce("") { retVal, value in retVal + "\(value);"},
        price: 5.0)
    }
}
