//
//  HomeTab.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        VStack(alignment: .leading){
            UserTitle(address: "Bilzen, Tanjungbalai", image: "woman")
                .foregroundColor(.onBackground)
                .padding()
            Spacer()
        }
            .background(
                GeometryReader{ geo in
               Spacer()
                    .frame(width: geo.size.width, height: geo.size.height/3)
                    .background(
                        LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .topTrailing, endPoint: .bottomLeading)
                    )
                }
            )
    }
}

#Preview {
    ContentView()
}
