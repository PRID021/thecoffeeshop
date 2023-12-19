//
//  SwiftUIView.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI

struct Landing: View {
    @EnvironmentObject var nav: NavigationStackState
    var body: some View {
        VStack{
            Spacer()
            Text("Coffee so good, your taste buds will love it.")
                .multilineTextAlignment(.center)
                .font(.system(size: 34))
                .foregroundColor(.white)
                .padding(.horizontal,48)
            Text("The best grain, the finest roast, the powerful flavor.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14))
                .foregroundColor(.onBackground)
                .padding(.horizontal,48)

            ElevatedButton(title: "Get Started", onPress:  {
                nav.path.append(.home)
                print("nav : \(nav.path.count)")
            })
            .padding()
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity, maxHeight:  .infinity)
        .background(
            GeometryReader { geo in
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 0,y: -geo.size.height/8)
            }
                .background(Color.black)
        )
    }
}

#Preview {
   ContentView()
}
