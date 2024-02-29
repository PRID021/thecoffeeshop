//
//  NavigationStackState.swift
//  thecoffeeshop
//
//  Created by mac on 18/12/2023.
//

import SwiftUI

class NavigationStackState: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var path: [Route]
    static func readSerializeData() -> Data? {
        nil
    }
    static func writeSerializeData(_ data: Data) {
    }
    init() {
        self.path = []
    }
    func save() {
    }
    func popTopRoot() {
        path = []
    }
    func popToHome() {
        path = [.home]
    }
}
