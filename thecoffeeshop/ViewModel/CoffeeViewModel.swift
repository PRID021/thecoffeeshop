//
//  CoffeeViewModel.swift
//  thecoffeeshop
//
//  Created by TE-Member on 22/12/2023.
//

import Foundation
import Combine

class CoffeeViewModel: ObservableObject {
    @Published var filter: String = ""
    private var canvellables = Set<AnyCancellable>()
    @Published var drinkItems: [DrinkItem]?

    private var coffees: [DrinkCoffee]? {
        didSet {
            drinkItems = coffees!.map { coffee in
                coffee.toDrinkItem()
            }
        }
    }
    let coffeeService: CoffeeServiceProtocal
    private(set) var  drinkSections: [DrinkSection] = [
        DrinkSection(collection: "Hot"),
        DrinkSection(collection: "Iced")
    ]
    @Published var selectedDrinkSection: DrinkSection {
        didSet {
            if selectedDrinkSection == drinkSections[0] {
                return fetchHotCoffee()
            }
            if selectedDrinkSection == drinkSections[1] {
                return fetchIcedCoffee()
            }
        }
    }
    init(coffeeService: CoffeeServiceProtocal) {
        self.coffeeService = coffeeService
        self.selectedDrinkSection = drinkSections[0]
        $filter.debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                guard !value.isEmpty else {
                    if self!.drinkItems?.count != self!.coffees?.count {
                        self!.drinkItems = self!.coffees!.map { coffee in
                            coffee.toDrinkItem()
                        }
                    }
                    return
                }
                self!.filter(with: value)
            })
            .store(in: &canvellables)
    }
    func fetchHotCoffee() {
        coffeeService.getHotDrink()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    return
                case .failure(let error):
                    debugPrint("getHotDrink throw: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.coffees = data
            })
            .store(in: &canvellables)
    }
    func fetchIcedCoffee() {
        print("fetchIcedCoffee")
        coffeeService.getIcedDrink()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { complete in
                switch complete {
                case .finished:
                    return
                case .failure(let error):
                    debugPrint("getIcedDrink throw: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.coffees = data
            })
            .store(in: &canvellables)
    }
    func filter(with value: String) {
       drinkItems = coffees?.filter { coffee in
          coffee.title.lowercased().contains(value.lowercased())
        }.map { coffee in
            coffee.toDrinkItem()
        }
    }
}
