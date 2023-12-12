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
    var animation: Namespace.ID
    var body: some View {
        GeometryReader { geo in
                ResizeableVStack{ offset in
                    
                        VStack(alignment: .leading,spacing: 0) {

                            VStack(spacing: 0) {
                                if (offset.y.clamped(from: 0, to: .infinity) < 10){
                                    UserTitle(address: "Bilzen, Tanjungbalai", image: "woman")
                                        .foregroundColor(.onBackground)
                                        .padding(.horizontal)
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.vertical,12)
                                        .padding(.leading,8)
                                        .frame(width: 44,height: 44)
                                    
                                    TextField("",text: $searchInput)
                                        .placeholder(when: searchInput.isEmpty){
                                            Text("Search Coffee")
                                                .foregroundColor(Color.onBackground)
                                        }
                                    Button {
                                        
                                    }label:{
                                        Label("",systemImage: "slider.horizontal.3")
                                            .labelStyle(.iconOnly)
                                            .frame(width: 44, height:  44)
                                            .aspectRatio(contentMode: .fit)
                                            .background(Color.appPrimary)
                                    }
                                    .padding(8)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                                .foregroundColor(.white)
                                .background(Color.bgStart ,in:RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal,30)
                                .padding(.vertical)
                            }
                            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height/4  - offset.y.clamped(from: 0, to: .infinity))
                            .background(
                            LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .bottomLeading, endPoint: .topTrailing))
                        
                        ScrollViewReader { scrollView in
                            ScrollView(.horizontal){
                                LazyHStack(spacing: 8) {
                                    ForEach(drinkSections, id: \.self){ drinkSection in
                                        Button{
                                            withAnimation{
                                                selectedDrinkSection = drinkSection
                                                scrollView.scrollTo(selectedDrinkSection)
                                            }
                                        }label: {
                                            Label(drinkSection.collection,systemImage: "")
                                                .labelStyle(.titleOnly)
                                                .font(.system(size: 16))
                                                .fontWeight(selectedDrinkSection == drinkSection ? .bold : .medium)
                                                .padding(.vertical ,10)
                                                .padding(.horizontal,16)
                                                .foregroundColor(selectedDrinkSection == drinkSection  ? .white : .black)
                                                .background{
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .fill()
                                                            .foregroundColor(.white)
                                                        if(selectedDrinkSection == drinkSection ) {
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
                            .safeAreaPadding(.horizontal,16)
                            .frame(height: 64)
                            }
                        }
                    } 
                            contentScrollable:{
//                                TabView(selection: $selectedDrinkSection)  {
//                                    ForEach(drinkSections){drinkSection in
                                            GridScrollView(drinks: selectedDrinkSection.drinks)
//                                            .tag(drinkSection)
                                            .safeAreaPadding(.bottom,64)
//                                    }
//                                }
                                .padding(.horizontal,16)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                .animation(nil, value: UUID())
                                .background(Color.green)

                    }
                
                        .background(Color.red)
            
            
        }
        
    }
}
#Preview {
    ContentView()
}
