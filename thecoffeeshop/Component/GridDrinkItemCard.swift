//
//  GridScrollView.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI

struct GridDrinkItemCard: View {
    var drinks: [DrinkItem] = []
    let layout = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
        GridItem(.adaptive(minimum: 150, maximum: 200))
    ]
    
    var body: some View {
            LazyVGrid(columns: layout) {
                ForEach(drinks){ drink in
                    DinkCard(drinkItem: drink)
                }
            }
    }
}

#Preview {
    var drinks: [DrinkItem] {
        [
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53),
            DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
        ]
    }
   return GridDrinkItemCard(drinks: drinks)
}
