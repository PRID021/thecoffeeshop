//
//  Home.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import SwiftUI

struct Home: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var btnBack : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//            Image("ic_back") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//                Text("Go back")
//            }
//        }
//    }
    
    var body: some View {
            List {
                Text("sample code")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
