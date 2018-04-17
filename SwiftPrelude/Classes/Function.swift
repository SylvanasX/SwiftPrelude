//
//  Function.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/4/17.
//

public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> (C) {
    return { g(f($0)) }
}
