//
//  ContentView.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var navigationStateState = NavigationStackState()
    @State var orderLocation = MKMapItem(
        placemark: MKPlacemark(coordinate: .orderLocation))
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        NavigationStack(path: $navigationStateState.path) {
            Root()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .landing:
                        Landing()
                    case .login:
                        Login()
                    case .home:
                        Home()
                    case .drinkDetail(let drinkDetail):
                        DrinkDetail(drinkDetail: drinkDetail)
                    case .order(let drinkItem, let drinkSize):
                        OrderPage(drinkDetail: drinkItem, drinkSize: drinkSize)
                    case .orderTracking:
                        TrackingMap(orderLocation: $orderLocation)
                    case .userProfile:
                        Text("Un Implement")
                    }
                }
                .onAppear {
                    let isFirstLaunch = UserDefaults.standard.value(forKey: UserPreferenceKeys.firstLaunch)
                    if isFirstLaunch != nil {
                        navigationStateState.path.append(.login) } else {
                        UserDefaults.standard.set(true, forKey: UserPreferenceKeys.firstLaunch)
                        navigationStateState.path.append(.landing) }
                }
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
