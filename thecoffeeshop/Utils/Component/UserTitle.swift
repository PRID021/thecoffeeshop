//
//  UserTitle.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import Foundation
import SwiftUI

struct UserTitle: View {
    @EnvironmentObject var nav: NavigationStackState
    var  address: String
    var  image: String
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("Location")
                HStack(alignment: .center) {
                    Text(address)
                        .foregroundStyle(Color.white)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
            Button {
                nav.path.append(.userProfile)
            }label: {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 48)
            }
        }
        .padding()
    }
}
