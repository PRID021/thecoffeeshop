//
//  Login.swift
//  thecoffeeshop
//
//  Created by TE-Member on 01/03/2024.
//

import SwiftUI

struct Login: View {
    @State var userAccount = ""
    @State var passWord = ""
    @EnvironmentObject var nav: NavigationStackState
    var body: some View {
        VStack {
            CustomTextField(icon: "person", placeHolder: "Username", text: $userAccount)
            Spacer()
                .frame(height: 32)
            SecurePasswordTextField(icon: "lock", placeHolder: "Password", text: $passWord)
            Spacer()
                .frame(height: 16)
            HStack {
                Spacer()
                Button {} label: {
                    Text("Registe right now")
                        .underline(true)
                        .foregroundColor(.white)
                }
            }
            Spacer()
                .frame(height: 16)
            ElevatedButton(title: "Sign In", onPress: {
                nav.path = [.home]
            })
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            GeometryReader { geo in
                Image("bg_login")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: 0, y: -geo.size.height / 8)
            }
                .background(Color.black)
                .navigationBarBackButtonHidden(true)
        )
    }
}

#Preview {
    Login()
}
