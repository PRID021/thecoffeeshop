//
//  HotCoffee.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation

struct DrinkCoffee : Decodable, Identifiable {
    var title: String
    var description: String
    var image: String
    var id: String
}
