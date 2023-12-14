//
//  Home.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @StateObject var tabBarViewModel = TabBarViewModel()
    init(){
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = transparentAppearence

        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.appPrimary)
        UISegmentedControl.appearance().backgroundColor = UIColor(Color(hex: "#F2F2F2"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
           UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        TabView(selection: $tabBarViewModel.currentTab){
            HomeTab( animation: animation)
                .tag(Tab.home)
                .toolbar(.hidden, for: .tabBar)
            FavoriteTab()
                .tag(Tab.favorite)
            Text("TAB_C")
                .tag(Tab.news)
            Text("TAB_D")
                .tag(Tab.payment)
        }

        .overlay(alignment: .bottom){
            HStack{
                TabBarButton(tab: .home , image: "cup.and.saucer", animation: animation)
                TabBarButton(tab: .favorite , image: "heart", animation: animation)
                TabBarButton(tab: .news , image:  "party.popper", animation: animation)
                TabBarButton(tab: .payment , image: "creditcard", animation: animation)
            }
            .background(Color.bgEnd)
        }
        .environmentObject(tabBarViewModel)
        .navigationBarBackButtonHidden(true)

  
    }
}



enum Tab: String, CaseIterable {
    case home = "Menu"
    case favorite = "Like"
    case news = "Voucher"
    case payment = "Payment"
    
}

class TabBarViewModel: ObservableObject {
    @Published var currentTab: Tab = .home
    @Published var showDetail:Bool = false
}

struct TabBarButton : View {
    var tab: Tab
    var image: String
    var animation: Namespace.ID
    
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    
    var body: some View {
        Button{
            withAnimation{
                tabBarViewModel.currentTab = tab
            }
        }label: {
            VStack{
                Image(systemName: tabBarViewModel.currentTab == tab ? image+".fill" : image)
                    .font(.title2)
                    .frame(height: 16)
                    .padding(.top,8)
                Text(tab.rawValue)
                    .font(.caption.bold())
            }
            .foregroundColor(tabBarViewModel.currentTab == tab ?
                .appPrimary : .gray)
            .frame(maxWidth: .infinity)
            .overlay{
                ZStack {
                    if tabBarViewModel.currentTab == tab {
                        TabBarIndicator()
                            .fill(
                                .linearGradient(.init(
                                    colors: [.appPrimary.opacity(0.5), .appPrimary.opacity(0.1),.clear]
                                ), startPoint: .top, endPoint: .bottom)
                            )
                            .padding(.horizontal, 8)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }

            }
        }
    }
}

struct TabBarIndicator: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height))
        };
    }
}


#Preview {
    ContentView()
}
