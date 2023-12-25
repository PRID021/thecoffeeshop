//
//  DinkCard.swift
//  thecoffeeshop
//
//  Created by TE-Member on 12/12/2023.
//

import SwiftUI
import CachedAsyncImage

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
            CachedAsyncImage(url: URL(string: drinkItem.image)) { image in
                image.resizable()
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
            } placeholder: {
                ProgressView()
                    .frame(width: 145, height: 148, alignment: .center)
            }
                VStack(alignment: .leading, spacing: 0) {
                    Text(drinkItem.categorie)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text("\(drinkItem.toping)")
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
let path1 = "https://upload.wikimedia.org/wikipedia/commons/d/d8/"
let path2 = "Blue_Bottle%2C_Kyoto_Style_Ice_Coffee_%285909775445%29.jpg"
let drinkItem = DrinkItem(
    id: UUID().uuidString,
    starRate: 4.3,
    image: "\(path1)\(path2)",
    categorie: "Hot",
    toping: "Coffee, with Sugar",
    price: 5.0)
    return DinkCard(drinkItem: drinkItem)
    .frame(width: 150, height: 250)
    .padding()
    .background(Color.black)
}

// URLCache+imageCache.swift
extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}
