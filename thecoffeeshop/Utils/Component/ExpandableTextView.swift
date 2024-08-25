//
//  ExpandableTextView.swift
//  thecoffeeshop
//
//  Created by TE-Member on 25/08/2024.
//

import SwiftUI

struct ExpandableTextView: View {
    @State private var isExpand: Bool = false
    @State private var isTextOverflowing: Bool = false
    var text: String
    var fontSize: CGFloat = 16

    var body: some View {
        VStack (alignment: .leading,spacing: 0){
            ZStack(alignment: isExpand ? .bottomLeading : .bottomTrailing) {
                Text(text)
                    .lineLimit(isExpand ? nil : 3)
                    .font(.system(size: fontSize))
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    DispatchQueue.main.async {
                                        let textWidth = geo.size.width
                                        let characterWidth: CGFloat = fontSize
                                        let maxCharactersPerLine = textWidth / characterWidth
                                        let totalLines = ceil(CGFloat(text.count) / maxCharactersPerLine)
                                        isTextOverflowing = totalLines > 3
                                    }
                                }
                        }
                    )
                if !isExpand && isTextOverflowing {
                    let inline = Text("...")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text("\(inline)See more")
                        .foregroundColor(Color.appPrimary)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .onTapGesture {
                            withAnimation {
                                isExpand.toggle()
                            }
                        }
                        .background(Color.canvas)
                }
            }
            .padding([.leading,.trailing])
            if isExpand {
               Text("Collapse")
                    .font(.system(size: 14))
                   .fontWeight(.semibold)
                   .foregroundColor(Color.appPrimary)
                   .onTapGesture {
                       withAnimation {
                           isExpand.toggle()
                       }
                   }
                   .padding([.trailing])
                   .frame(maxWidth: .infinity, alignment: .trailing)
           }
        }
      
    }
  
}


let textA = "Being a top 1% developer isn’t just about mastering Swift, SwiftUI, and Xcode."
let textB = " It’s also about having a solid grasp of various languages, allowing you to blend them together to streamline your iOS project development."

#Preview {
    ExpandableTextView(text: "\(textA)\(textB)")
        .background(Color.canvas)
}
