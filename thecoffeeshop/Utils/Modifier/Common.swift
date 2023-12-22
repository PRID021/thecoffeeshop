//
//  Common.swift
//  thecoffeeshop
//
//  Created by TE-Member on 15/12/2023.
//

import SwiftUI

extension View {
    func borderBackgroundWithRadient() -> some View {
        modifier(BorderBackGroundGradient())
    }
}

struct BorderBackGroundGradient: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(LinearGradient(colors: [.bgStart, .bgEnd], startPoint: .bottomLeading, endPoint: .topTrailing),
                in: .rect(
                topLeadingRadius: 24,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 24,
                style: RoundedCornerStyle.continuous
            ))
    }
}
