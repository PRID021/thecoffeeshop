//
//  Root.swift
//  thecoffeeshop
//
//  Created by TE-Member on 01/03/2024.
//

import SwiftUI

struct Root: View {
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
                   .ignoresSafeArea()
            Image(.appIcon)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/ , height: 100)
                .cornerRadius(5)
        }
    }
}

#Preview {
    Root()
}
