//
//  ContentView.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI



struct ContentView: View {
   @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            Landing()
        }
    }
}

#Preview {
    ContentView()
}
