//
//  DrinkSize.swift
//  thecoffeeshop
//
//  Created by TE-Member on 13/12/2023.
//

import Foundation

enum DrinkSize: String, CaseIterable, Identifiable {
    var id: String {
        self.rawValue
    }
    case s = "S"
    case m = "M"
    case l = "L"
}

