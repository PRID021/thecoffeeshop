//
//  ResizeableView.swift
//  thecoffeeshop
//
//  Created by mac on 12/12/2023.
//

import SwiftUI

// Reference  https://www.swiftbysundell.com/articles/observing-swiftui-scrollview-content-offset/
import SwiftUI
import Foundation


struct PositionObservingView<Content: View>: View {
    
    struct PreferenceKey: SwiftUI.PreferenceKey {
         static var defaultValue: CGPoint { .zero }

         static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
             // No-op
         }
     }
    
    var coordinateSpace: CoordinateSpace
    @Binding var position: CGPoint
    @ViewBuilder var content: () -> Content
    var body: some View {
        content()
            .background(
                GeometryReader{ geometry in
                    Color.clear.preference(
                        key: PreferenceKey.self,
                        value: geometry.frame(in: coordinateSpace).origin
                    )
                }
            )
            .onPreferenceChange(PreferenceKey.self) { position in
                            self.position = position
        }
    }
}




struct OffsetObservingScrollView<Content: View>: View {
    var axes: Axis.Set = [.vertical]
    var showsIndicators = true
    @Binding var offset: CGPoint
    @ViewBuilder var content: () -> Content

    // The name of our coordinate space doesn't have to be
    // stable between view updates (it just needs to be
    // consistent within this view), so we'll simply use a
    // plain UUID for it:
    private let coordinateSpaceName = UUID()

    var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            PositionObservingView(
                coordinateSpace: .named(coordinateSpaceName),
                position: Binding(
                    get: { offset },
                    set: { newOffset in
                        offset = CGPoint(
                            x: -newOffset.x,
                            y: -newOffset.y)
                    }
                ),
                content: content
            )
        }
        .coordinateSpace(name: coordinateSpaceName)
    }
}


struct ResizeableVStack<Content: View>: View {
    @State var offSet: CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State  var items: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    @ViewBuilder var contentResizeable: () -> Content
    var body: some View {
        GeometryReader { geo in
            let maxWidth: CGFloat = .infinity
            let minHeight: CGFloat = geo.size.height/8
            let maxHeight: CGFloat = geo.size.height/2
            VStack {
//                Text("Offset: \(offSet.y.clamped(from: 0, to: .infinity))")
                    contentResizeable()
                    .frame(maxWidth: maxWidth,minHeight: minHeight,maxHeight: max(maxHeight - offSet.y, minHeight))
                    .background(.yellow)
                OffsetObservingScrollView(offset: $offSet){
                    ForEach(items, id: \.self){ index in
                        Text("\(index)")
                            .padding()
                    }
                }
            }
        }
    }
}
