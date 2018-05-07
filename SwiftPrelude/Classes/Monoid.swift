//
//  Monoid.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/5/7.
//

public protocol Monoid: Semigroup {
    static func identity() -> Self
}
