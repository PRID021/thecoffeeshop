//
//  ElevatedButton.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI

struct ElevatedButton: View {
    var cornerRadius: CGFloat = 25.0
    let title: String
    let onPress: () ->()
    var body: some View {
        Button(action: onPress){
            Text(title)
                .frame(minWidth:0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(.onPrimary)
                .overlay{
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.onPrimary,lineWidth: 1)
                }
        }
        .background(Color.appPrimary)
        .cornerRadius(cornerRadius)
    }
}
