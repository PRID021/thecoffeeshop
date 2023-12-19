//
//  Image.swift
//  thecoffeeshop
//
//  Created by TE-Member on 15/12/2023.
//

import SwiftUI



extension Image {
    func roundedRect() -> some View {
        modifier(ImageRoundRect())
    }
}

struct ImageRoundRect : ViewModifier {
    func body(content: Content) -> some View {
        content
        .aspectRatio(contentMode: .fit)
        .frame(width: 32,height:32)
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 16).stroke(Color(hex: "#EAEAEA"), lineWidth: 2))
    }
}
