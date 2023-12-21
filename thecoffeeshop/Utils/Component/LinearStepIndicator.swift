//
//  LinearStepIndicator.swift
//  thecoffeeshop
//
//  Created by TE-Member on 15/12/2023.
//

import SwiftUI

struct LinearStepIndicator: View {
    var numberSteps: Int
    var initStep: Int
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 20){
                ForEach(1...numberSteps,id: \.self){ index in
                    let modWidth = ((numberSteps - 1) * 20)
                    let indicatorWidth = (geo.size.width - CGFloat(modWidth)) / CGFloat(numberSteps)
                    Spacer()
                        .frame(width: max(0,indicatorWidth), height: 4)
                        .background(initStep >= index ? Color(hex:"#36C07E") : Color(hex:"#DFDFDF"), in: RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .frame(maxHeight:4)
    }
}

#Preview {
    LinearStepIndicator(numberSteps: 4, initStep: 3)
 
}
