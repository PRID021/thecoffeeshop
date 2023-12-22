//
//  HomeTab.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//
import Foundation
import SwiftUI

struct HomeTab: View {
    @State var searchInput: String = ""
    @State var selectedDrinkSection = drinkSections[0]
    @State var shouldExpand = false
    var animation: Namespace.ID
    var body: some View {
        GeometryReader { geo in
            ResizeableVStack(
                geo: geo,
                seletedSectionDrink: $selectedDrinkSection,
                sections: drinkSections
            ) { offset in
                VStack(alignment: .leading, spacing: 0) {
                    VStack(spacing: 0) {
                        if offset.y.clamped(from: 0, to: .infinity) < 10 {
                            UserTitle(address: "Bilzen, Tanjungbalai", image: "woman")
                                .foregroundColor(.onBackground)
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.vertical, 12)
                                .padding(.leading, 8)
                                .frame(width: 44, height: 44)
                            TextField("", text: $searchInput)
                                .placeholder(when: searchInput.isEmpty) {
                                    Text("Search Coffee")
                                        .foregroundColor(Color.onBackground)
                                }
                            Button {
                            }label: {
                                Label("", systemImage: "slider.horizontal.3")
                                    .labelStyle(.iconOnly)
                                    .frame(width: 44, height: 44)
                                    .aspectRatio(contentMode: .fit)
                                    .background(Color.appPrimary)
                            }
                            .padding(8)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .foregroundColor(.white)
                        .background(Color.bgStart, in: RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal, offset.y.clamped(from: 0, to: .infinity) < 10 ? 32 : 16)
                    }
                    .frame(maxWidth: geo.size.width,
                    maxHeight: max(geo.size.height / 4 - offset.y.clamped(from: 0, to: .infinity), 80)  )
                    .background(
                        LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .bottomLeading, endPoint: .topTrailing))
                    ScrollViewReader { scrollView in
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 8) {
                                ForEach(drinkSections, id: \.self) { drinkSection in
                                    Button {
                                        withAnimation {
                                            selectedDrinkSection = drinkSection
                                            scrollView.scrollTo(selectedDrinkSection)
                                        }
                                    }label: {
                                        Label(drinkSection.collection, systemImage: "")
                                            .labelStyle(.titleOnly)
                                            .font(.system(size: 16))
                                            .fontWeight(selectedDrinkSection == drinkSection ? .bold : .medium)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 16)
                                            .foregroundColor(selectedDrinkSection == drinkSection ? .white : .black)
                                            .background {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 12)
                                                        .fill()
                                                        .foregroundColor(.white)
                                                    if selectedDrinkSection == drinkSection {
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .fill()
                                                            .foregroundColor(.appPrimary)
                                                            .matchedGeometryEffect(id: "Section", in: animation)
                                                    }
                                                }
                                            }
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.viewAligned)
                        .safeAreaPadding(.horizontal, 16)
                        .frame(height: 64)
                    }
                }
            }
        contentScrollable: { selectedSectionDrink in
            GridDrinkItemCard(drinks: selectedSectionDrink.drinks)
        }
        .background(Color.canvas)
        }
    }
}
#Preview {
    ContentView()
}
