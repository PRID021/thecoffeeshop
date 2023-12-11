//
//  UserTitle.swift
//  thecoffeeshop
//
//  Created by mac on 11/12/2023.
//

import Foundation
import SwiftUI

struct UserTitle : View {
    var  address: String
    var  image: String
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading){
                Text("Location")
                HStack(alignment:.center){
                    Text(address)
                        .foregroundStyle(Color.white)
                    Image(systemName: "chevron.down")
                }
            }
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 48)
        }
        .padding()
        
    }
}

