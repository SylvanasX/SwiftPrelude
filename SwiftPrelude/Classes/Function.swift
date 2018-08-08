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

public func first <A, B> (_ x: (A, B)) -> A {
    return x.0
}

public func second <A, B> (_ x: (A, B)) -> B {
    return x.1
}
