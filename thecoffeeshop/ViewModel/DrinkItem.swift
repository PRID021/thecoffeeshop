//
//  DrinkItem.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI

struct DrinkItem: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var starRate: CGFloat
    var image: String
    var categorie: String
    var toping: String
    var price: CGFloat
}
