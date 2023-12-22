//
//  CoffeeViewModel.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation
import Combine

class CoffeeViewModel: ObservableObject {
    private var canvellables = Set<AnyCancellable>()
    @Published var coffees: [DrinkCoffee]?
    let coffeeService: CoffeeServiceProtocal
    
    init(coffeeService: CoffeeServiceProtocal){
        self.coffeeService = coffeeService
    }
    func fetchHotCoffee(){
        coffeeService.getHotDrink()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
                _ in
            }, receiveValue:   { [weak self] data in
                self?.coffees =  data
            } )
            .store(in: &canvellables)
    }
}
