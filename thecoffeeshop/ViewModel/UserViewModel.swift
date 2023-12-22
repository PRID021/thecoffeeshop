//
//  UserViewModel.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    private var canvellables = Set<AnyCancellable>()
    let userService: UserServiceProtocol
    @Published var userProfile: UserProfile?
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    func fetchUserProfile() {
        userService.getUserProfile()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] data in
                self?.userProfile = data
            })
            .store(in: &canvellables)
    }
}
