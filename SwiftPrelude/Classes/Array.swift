//
//  Array.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/5/7.
//

extension Array: Semigroup, Monoid {
    public func op(_ other: Array<Element>) -> Array<Element> {
        return self + other
    }
    
    public static func identity() -> Array<Element> {
        return []
    }
}

