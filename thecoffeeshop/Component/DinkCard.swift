//
//  DinkCard.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI

struct DinkCard: View {
    var drinkItem: DrinkItem
    var body: some View {
    
            VStack(alignment: .center) {
                Image(drinkItem.image)
                    .resizable()
                    .aspectRatio(141/132,contentMode: .fill)
                    .cornerRadius(16)
                    .padding(.horizontal,4)
                    .padding(.top,4)
                    .padding(.bottom,12)
                
                VStack(alignment: .leading, spacing: 0){
                    Text(drinkItem.categorie)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text("with \(drinkItem.toping)")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(.onBackground)
                        .padding(.top,4)
                        .padding(.bottom,8)
                    
                    HStack(spacing: 0){
                        Text("$ \(String(format: "%.2f",drinkItem.price))")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Spacer()
                        Label("",systemImage: "plus")
                            .labelStyle(.iconOnly)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(16)
                            .background(Color.appPrimary, in: RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.bottom,12)
                }
                .padding(.horizontal, 12)
            }
    
            .background(Color.white)
        .cornerRadius(16)
    }
}

#Preview {
    let drinkItem = DrinkItem(starRate: 4.8, image: "cappucino", categorie: "Cappucino", toping: "Chocolate", price: 4.53)
    return DinkCard(drinkItem: drinkItem)
        .frame(maxWidth: 150, maxHeight: 250)
        .frame(width: .infinity,height: .infinity)
        .background(Color.canvas)
}
