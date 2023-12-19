//
//  CustomDivider.swift
//  thecoffeeshop
//
//  Created by TE-Member on 14/12/2023.
//

import SwiftUI

struct CustomDivider: View {
    var lineWidth: CGFloat = 2
    var strokeColor: Color = Color.onBackground
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: lineWidth))
            .foregroundColor(strokeColor) // Change color as needed
        }
        .frame(height: lineWidth)
    }
}

#Preview {
    CustomDivider()
}
