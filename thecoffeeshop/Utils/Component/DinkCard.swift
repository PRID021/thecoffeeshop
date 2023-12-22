//
//  DinkCard.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI

struct AdaptiveLabelStyle: LabelStyle {
    var iconColor: Color = .yellow
    var titleColor: Color = .white
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon.foregroundColor(iconColor)
            configuration.title.foregroundColor(titleColor)
        }
    }
}

struct DinkCard: View {
    var drinkItem: DrinkItem
    @EnvironmentObject var nav: NavigationStackState
    var body: some View {
        VStack(alignment: .center) {
            Image(drinkItem.image)
                .resizable()
                .scaledToFill()
                .frame(width: 141, height: 132, alignment: .center)
                .clipped()
                .cornerRadius(16)
                .padding(.horizontal, 4)
                .padding(.top, 4)
                .padding(.bottom, 12)
                .overlay(alignment: .topLeading) {
            Label("\(String(format: "%.2f", drinkItem.starRate))", systemImage: "star.fill")
                .labelStyle(AdaptiveLabelStyle())
                .font(.system(size: 16))
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(.ultraThinMaterial)
                .clipShape(
                    .rect(
                        topLeadingRadius: 16,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 18,
                        topTrailingRadius: 0
                    )
                )
                .padding(.top, 4)
                .padding(.leading, 4)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(drinkItem.categorie)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text("with \(drinkItem.toping)")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                        .foregroundColor(.onBackground)
                        .padding(.top, 4)
                        .padding(.bottom, 8)
                    HStack(spacing: 0) {
                        Text("$ \(String(format: "%.2f", drinkItem.price))")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        Spacer()
                        Button {
                            nav.path.append(.drinkDetail(drinkItem))
                        }label: {
                            Label("", systemImage: "plus")
                                .labelStyle(.iconOnly)
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(16)
                                .background(Color.appPrimary, in: RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.bottom, 12)
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
        .padding()
        .background(Color.black)
}
