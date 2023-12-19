//
//  Compareable.swift
//  thecoffeeshop
//
//  Created by mac on 12/12/2023.
//

import Foundation

extension Comparable {
    func clamped(from lowerBound: Self , to upperBound: Self) -> Self {
        return min(max(self, lowerBound), upperBound)
    }
}

#if swift(<5.1)
extension Strideable where Stride: SignedInteger {
    func clamped(to limits: CountableClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
#endif
