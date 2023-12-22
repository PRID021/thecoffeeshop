//
//  UserService.swift
//  thecoffeeshop
//
//  Created by TE-Member on 19/12/2023.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func getUserProfile() -> AnyPublisher<UserProfile, Error>
}

class UserService: UserServiceProtocol {
    let apiClient = URLSessionAPIClient<UserEndpoint>()
    func getUserProfile() -> AnyPublisher<UserProfile, Error> {
        return apiClient.request(.profile)
    }
}
