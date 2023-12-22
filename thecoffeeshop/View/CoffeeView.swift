//
//  CoffeeView.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import SwiftUI

struct CoffeeView: View {
    @StateObject var viewModel: CoffeeViewModel = CoffeeViewModel(coffeeService: CoffeeService())
    
    var body: some View {
        Text("\(viewModel.coffees?.count ?? 0)")
            .onAppear {
                viewModel.fetchHotCoffee()
            }
    }
}

#Preview {
    CoffeeView()
}
