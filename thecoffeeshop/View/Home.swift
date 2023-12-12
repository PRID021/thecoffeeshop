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
        UITableView.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $tabBarViewModel.currentTab){
            HomeTab(animation: animation)
                .tag(Tab.home)
                .toolbar(.hidden, for: .tabBar)
            FavoriteTab()
                .tag(Tab.favorite)
            Text("TAB_C")
                .tag(Tab.news)
            Text("TAB_D")
                .tag(Tab.message)
        }

        .overlay(alignment: .bottom){
            HStack{
                TabBarButton(tab: .home , image: "house", animation: animation)
                TabBarButton(tab: .favorite , image: "heart", animation: animation)
                TabBarButton(tab: .news , image:  "newspaper", animation: animation)
                TabBarButton(tab: .message , image: "bell", animation: animation)
            }
            .background(Color.bgEnd)

        }
        .environmentObject(tabBarViewModel)
        .navigationBarBackButtonHidden(true)
    }
}



enum Tab: String, CaseIterable {
    case home = "Home"
    case favorite = "Favorite"
    case news = "News"
    case message = "Message"
    
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
