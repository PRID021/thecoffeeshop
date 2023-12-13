//
//  CardQuantityPicker.swift
//  thecoffeeshop
//
//  Created by TE-Member on 13/12/2023.
//

import SwiftUI

struct CardQuantityPicker: View {
    var drinkItem: DrinkItem
    @State private var value = 0
    
    func incrementStep(){
        value+=1
    }
    
    func decrementStep(){
        value-=1
    }
    
    var body: some View {
        HStack{
            Image(drinkItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 64, maxHeight: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack (alignment: .leading){
                Text(drinkItem.categorie)
                    .font(.title3)
                Text("with \(drinkItem.toping)")
                    .font(.subheadline)
                    .foregroundColor(.onBackground)
            }
            Spacer()

        }
        .frame(minWidth: 0, maxWidth: .infinity)

    }
}

#Preview {
    let drinkItem = drinkSections[0].drinks[0]
   return CardQuantityPicker(drinkItem: drinkItem)
        .padding(32)
        .frame(width: .infinity, height: .infinity )
        .background(Color.canvas)
}
