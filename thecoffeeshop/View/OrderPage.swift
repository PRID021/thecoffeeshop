//
//  OrderPage.swift
//  thecoffeeshop
//
//  Created by TE-Member on 14/12/2023.
//

import SwiftUI
import MapKit

struct OrderPage: View {
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
@EnvironmentObject var nav: NavigationStackState
var btnBack: some View {
    Button {
        self.presentationMode.wrappedValue.dismiss()
    } label: {
        Image(systemName: "chevron.left")
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
    }
}
var drinkDetail: DrinkItem
var drinkSize: DrinkSize
@State private var selectedOrderType: String = "Deliver"
@State private var value: Int = 1
static private var orderTypes = ["Deliver", "Pick Up"]
@State private var selectPaymentMethod = "Cash"
@State private var  orderLocation = MKMapItem(
    placemark: MKPlacemark(coordinate: .orderLocation))
private var totalPrice: CGFloat {
    CGFloat(value) * drinkDetail.price + CGFloat(1)
}
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                SegmentPicker()
                Text("Delivery Address")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.top, 24)
                    .padding(.bottom, 16)
                Text("Jl. Kpg Sutoyo")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.bottom, 8)
                Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.onBackground)
                    .padding(.bottom, 16)
                HStack {
                    Label {
                        Text("Edit Address")
                            .font(.system(size: 12, weight: .regular))
                    }icon: {
                        Image("edit")
                    }
                    .labelStyle(.titleAndIcon)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/))
                    Spacer().frame(width: 16, height: 0)
                    Label {
                        Text("Add note")
                            .font(.system(size: 12, weight: .regular))
                    }icon: {
                        Image("note")
                    }
                    .labelStyle(.titleAndIcon)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(style: /*@START_MENU_TOKEN@*/StrokeStyle()/*@END_MENU_TOKEN@*/))
                }
                Divider()
                    .padding(.vertical, 20)
                CardQuantityPicker(drinkItem: drinkDetail, value: $value)
            }
            .padding(.horizontal, 32)
            CustomDivider(lineWidth: 4, strokeColor: Color.onBackground).padding(.vertical, 20)
            Group {
                HStack {
                    Image("discount")
                        .padding(.trailing, 8)
                    Text("1 Discount is applied")
                        .font(.system(size: 14, weight: .semibold))
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 32)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .foregroundColor(Color.onBackground))
                .padding(.bottom, 16)
                Text("Payment Summary")
                    .font(.system(size: 16, weight: .semibold))
                PriceLabel(label: "Price", price: drinkDetail.price)
                    .padding(.vertical, 16)
                PriceLabel(label: "Delivery Fee", price: 1.0, rawPrice: 2.0)
                Divider()
                    .padding(.vertical, 16)
                PriceLabel(label: "Total Payment", price: totalPrice)
            }
            .padding(.horizontal, 32)
            Spacer()
        }
            .padding(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.canvas)
            .overlay(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Image("moneys")
                        Picker("Wich is your favor?", selection: $selectPaymentMethod) {
                            ForEach(["Cash", "$ \(totalPrice)"], id: \.self) { paymentType in
                                Text(paymentType)
                            }
                        }
                        .pickerStyle(.segmented)
                        .labelsHidden()
                        .frame(maxWidth: 150)
                        Spacer()
                        Image("dots")
                    }
                    .padding(.vertical, 16)
                    ElevatedButton(title: "Order", onPress: {
                        nav.path.append(.orderTracking(orderLocation))
                    })
                        .padding(.bottom, 32)
                }
                .padding(.horizontal, 16)
                .borderBackgroundWithRadient()
            }
            .ignoresSafeArea(.container, edges: .bottom)
    }
}

struct PriceLabel: View {
    var label: String
    var price: CGFloat
    var rawPrice: CGFloat?
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(label)
            Spacer()
            if rawPrice != nil {
                Text("~~$ \(String(format: "%.2f", rawPrice!))~~  ")
                    .font(.system(size: 14, weight: .regular))
            }
            Text("$ \(String(format: "%.2f", price))")
                .font(.system(size: 14, weight: .bold))
        }
    }
}

#Preview {
    let drinkItem: DrinkItem = drinkSections[0].drinks[0]
    return OrderPage(drinkDetail: drinkItem, drinkSize: .siM)
}
