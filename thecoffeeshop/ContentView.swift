//
//  ContentView.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var navigationStateState = NavigationStackState()

    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        NavigationStack(path: $navigationStateState.path) {
            Root()
        }
        .onChange(of: scenePhase, initial: true) { _, newValue in
            if newValue == .background {
                navigationStateState.save()
            }
        }
        .environmentObject(navigationStateState)
    }
}

#Preview {
    ContentView()
}
