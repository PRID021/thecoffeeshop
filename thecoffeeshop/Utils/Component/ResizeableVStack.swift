//
//  ResizeableView.swift
//  thecoffeeshop
//
//  Created by mac on 12/12/2023.
//

import SwiftUI
import Foundation
// Reference  https://www.swiftbysundell.com/articles/observing-swiftui-scrollview-content-offset/

struct PositionObservingView<Content: View>: View {
    struct PreferenceKey: SwiftUI.PreferenceKey {
        static var defaultValue: CGPoint { .zero }
        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        }
    }
    var coordinateSpace: CoordinateSpace
    @Binding var position: CGPoint
    @ViewBuilder var content: () -> Content
    var body: some View {
        content()
            .background(
                GeometryReader { geometry in
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
    var showsIndicators = false
    @Binding var offset: CGPoint
    @ViewBuilder var content: () -> Content

    // The name of our coordinate space doesn't have to be
    // stable between view updates (it just needs to be
    // consistent within this view), so we'll simply use a
    // plain UUID for it:
    private let coordinateSpaceName = UUID()

    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
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

struct ResizeableVStack<R: View, S: View>: View {
    var geo: GeometryProxy
    @Binding var seletedSectionDrink: DrinkSection
    var sections: [DrinkSection]
    @State private var offSet: CGPoint = CGPoint(x: 0.0, y: 0.0)
    @ViewBuilder var contentResizeable: (_ offSet: CGPoint) -> R
    @ViewBuilder var contentScrollable: (_ selectedSection: DrinkSection) -> S
    var body: some View {
        VStack(spacing: 0) {
            contentResizeable(offSet)
            TabView(selection: $seletedSectionDrink) {
                ForEach(sections) { section in
                    OffsetObservingScrollView(offset: $offSet) {
                        contentScrollable(section)
                            .padding(.horizontal, 16)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        }.tag(section)
                    }
                    .background(Color.canvas)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
    }
}
