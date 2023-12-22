//
//  DrinkDetail.swift
//  thecoffeeshop
//
//  Created by TE-Member on 13/12/2023.
//

import SwiftUI

struct DrinkDetail: View {
var drinkDetail: DrinkItem
@State var isFavorite: Bool = false
@State var selectedSize: DrinkSize = .siM
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
@EnvironmentObject var nav: NavigationStackState
var btnBack: some View {
    Button {
    self.presentationMode.wrappedValue.dismiss()
    }label: {
        Image(systemName: "chevron.left")
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
    }
}
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                Image(drinkDetail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                Spacer()
            }.padding(.bottom, 20)
            Text(drinkDetail.categorie)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 4)
            Text("with \(drinkDetail.toping)")
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(Color.onBackground)
            HStack {
                Label(String(format: "%.2f", drinkDetail.starRate), systemImage: "star.fill")
                    .labelStyle(AdaptiveLabelStyle(titleColor: .black))
                    .font(.system(size: 20))
                    .padding(.top, 16)
                Text("(230)")
                    .font(.system(size: 16))
                    .foregroundColor(Color.onBackground)
                    .offset(x: -6, y: 10)
                Spacer()
                Group {
                    Image("bean")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)
                        .padding(10)
                        .background(Color.iconBg)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    Image("milk")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)
                        .padding(10)
                        .background(Color.iconBg)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.leading)
                }
                .offset(x: 0, y: -10)
            }
            Divider()
                .padding(.vertical)
            Text("Description")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 16)
            let inline = Text("Read more")
                .font(.system(size: 18))
                .foregroundColor(Color.appPrimary)
                .fontWeight(.semibold)
            Text("A cappuccino is an approximately 150 ml (5 oz) beverage,with 25 ml of espresso coffee and 85ml of fresh milk the fo... \(inline)")
                .lineLimit(3)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(Color.onBackground)
            Text("Size")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.bottom, 16)
                .padding(.top, 16)
            HStack {
                ForEach(DrinkSize.allCases) { size in
                    let isSelected = (size == selectedSize)
                    Button {
                        withAnimation {
                            selectedSize = size
                        }
                    } label: {
                        Text(size.rawValue)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(isSelected ? Color.appPrimary : .black)
                            .background {
                                if isSelected {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.appPrimary, lineWidth: 1)
                                        .fill(Color.appPrimary.opacity(0.25))
                                } else {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.onBackground, lineWidth: 1)
                                }
                            }
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 24)
        .background(Color.canvas)
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing: Button {
                isFavorite.toggle()
            }label: {
                Image(systemName:
                    "heart" + ( isFavorite ? ".fill" : "")
                )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
                .padding(.trailing, 8)
        )
        .overlay(alignment: .bottom) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Price")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.onBackground)
                    Text("$ \(String(format: "%.2f", drinkDetail.price))")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.appPrimary)
                }
                .padding(.horizontal, 24)
                ElevatedButton(title: "Buy Now", onPress: {
                    nav.path.append(.order(drinkDetail, .siM))
                })
            }
            .frame(maxHeight: 88)
            .padding()
            .borderBackgroundWithRadient()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    ContentView()
}
