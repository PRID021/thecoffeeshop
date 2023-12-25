//
//  CardQuantityPicker.swift
//  thecoffeeshop
//
//  Created by TE-Member on 13/12/2023.
//

import SwiftUI

struct CardQuantityPicker: View {
    var drinkItem: DrinkItem
    @Binding  var value: Int
    func incrementStep() {
        value += 1
    }
    func decrementStep() {
        let preferValue = value - 1
        value = max(preferValue, 1)
    }
    var body: some View {
        HStack {
            Image(drinkItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 64, maxHeight: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading) {
                Text(drinkItem.categorie)
                    .font(.title3)
                Text("with \(drinkItem.toping)")
                    .font(.subheadline)
                    .foregroundColor(.onBackground)
            }
            Spacer()
            HStack {
                Button {
                    decrementStep()
                }label: {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .padding(8)
                        .background(Circle().stroke(Color.onBackground, lineWidth: 1))
                        .foregroundColor(Color.appPrimary)
                }
                Text("\(value)").padding(.horizontal, 8)
                    .frame(maxWidth: 40)
                Button {
                    incrementStep()
                }label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .padding(8)
                        .background(Circle().stroke(Color.onBackground, lineWidth: 1))
                        .foregroundColor(Color.appPrimary)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)

    }
}

//#Preview {
//  
//    let viewModel = CoffeeViewModel(coffeeService: CoffeeService())
//    @State var quantity: Int = 0
//    return CardQuantityPicker(drinkItem: drinkItem, value: $quantity)
//        .padding(32)
//        .frame(width: .infinity, height: .infinity )
//        .background(Color.canvas)
//}
