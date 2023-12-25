//
//  DrinkSection.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import Foundation

struct DrinkSection: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var collection: String
}

