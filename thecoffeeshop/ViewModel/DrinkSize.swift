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
    case siS = "S"
    case siM = "M"
    case siL = "L"
}
