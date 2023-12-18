//
//  NavigationStackState.swift
//  thecoffeeshop
//
//  Created by mac on 18/12/2023.
//

import SwiftUI


class NavigationStackState: ObservableObject {
    @Published var path: [Route]
    
    static func readSerializeData() -> Data? {
        nil
    }
    
    static func writeSerializeData(_ data: Data){
        
    }
    init(){
        if let data = Self.readSerializeData(){
            do{
                let representation = try JSONDecoder().decode(
                    NavigationPath.CodableRepresentation.self,
                    from:  data
                )
                self.path = []
            } catch {
                self.path = []
            }
        }
        else {
            self.path = []
        }
    }
    func save(){

    }
    
    func popTopRoot(){
        path = []
        print("popTopRoot")
    }
    func popToHome(){
        
    }
}
