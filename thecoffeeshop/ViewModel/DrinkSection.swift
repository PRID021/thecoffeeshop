//
//  DrinkSection.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import Foundation


struct DrinkSection: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var collection: String
    var drinks: [DrinkItem]
}

let  drinkSections: [DrinkSection] = [
     DrinkSection(collection: "Cappuccino", drinks: drinks),
     DrinkSection(collection: "Machiato", drinks: drinks1),
     DrinkSection(collection: "Latte", drinks: drinks2),
     DrinkSection(collection: "Americano", drinks: drinks3)
 ]
