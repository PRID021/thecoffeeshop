////
////  UserProfileView.swift
////  thecoffeeshop
////
////  Created by TE-Member on 19/12/2023.
////
//
//import SwiftUI
//
//struct UserProfileView: View {
//    @StateObject var viewModel = UserViewModel(userService: UserService())
//    var body: some View {
//        Text("Hello, \(viewModel.userProfile?.username ?? "anonymous")")
//            .onAppear(perform: {
//                viewModel.fetchUserProfile()
//            })
//    }
//}
//
//#Preview {
//    UserProfileView()
//}
