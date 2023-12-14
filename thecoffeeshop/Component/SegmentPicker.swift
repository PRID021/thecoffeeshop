//
//  SegmentPicker.swift
//  thecoffeeshop
//
//  Created by TE-Member on 14/12/2023.
//

import SwiftUI

struct SegmentPicker: View {
    @Namespace var animation
    @State var selected:  String = "Deliver"
    var body: some View {
        HStack{
            if(selected == "Deliver"){
                Text("Deliver")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .background(Color.appPrimary)
                    .matchedGeometryEffect(id: "Segment", in: animation)
            }
            else{
                Text("Deliver")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.vertical,10)
                    .background(Color(hex: "#F2F2F2").opacity(0.01))
                    .onTapGesture {
                        withAnimation {
                            selected = "Deliver"
                        }
                    }
            }
        
            if(selected == "Pick up"){
                Text("Pick up")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .background(Color.appPrimary)
                    .matchedGeometryEffect(id: "Segment", in: animation)
            }
            else{
                Text("Pick up")
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.vertical,10)
                    .background(Color(hex: "#F2F2F2").opacity(0.01))
                    .onTapGesture {
                        withAnimation {
                            selected = "Pick up"
                        }
                     
                    }
            }
        }
        .padding(2)
        .background(Color(hex: "#F2F2F2"),in: RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    SegmentPicker()
        .padding(.horizontal, 34)
}
