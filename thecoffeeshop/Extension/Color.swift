//
//  Color.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import Foundation
import SwiftUI

public extension Color {
    
    
    static let appPrimary = Color(hex: "#C67C4E")
    static let onPrimary = Color(hex: "#F2F2F2")
    static let caption = Color(hex: "#2F4B4E")
    static let onBackground = Color(hex: "#A9A9A9")
    static let canvas = Color(hex: "#FFF5EE")
    static let variant = Color(hex: "#F1F1F1")
    static let bgStart = Color(hex: "#313131")
    static let bgEnd =  Color(hex: "#131313")
    init(hex: String) {
         var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
         cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
         print(cleanHexCode)
         var rgb: UInt64 = 0
         
         Scanner(string: cleanHexCode).scanHexInt64(&rgb)
         
         let redValue = Double((rgb >> 16) & 0xFF) / 255.0
         let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
         let blueValue = Double(rgb & 0xFF) / 255.0
         self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
