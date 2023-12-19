//
//  DrinkItem.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI

struct DrinkItem: Identifiable,Hashable {
    var id: String = UUID().uuidString
    var starRate: CGFloat
    var image:  String
    var categorie: String
    var toping: String
    var price: CGFloat
}


let drinks: [DrinkItem] =  [
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
]


let drinks1: [DrinkItem] =  [
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino1", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
]


let drinks2: [DrinkItem] =  [
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino2", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
]


let drinks3: [DrinkItem] =  [
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
    DrinkItem(starRate: 4.8, image: "cappucino3", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
]
