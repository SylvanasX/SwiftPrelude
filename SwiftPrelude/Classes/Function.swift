//
//  Function.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/4/17.
//

public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

public func ||> <A, B>(xs: [A], f: (A) -> B) -> [B] {
    return xs.map(f)
}

public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> (C) {
    return { g(f($0)) }
}

public func <> <A> (f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
    return {
        g(f($0))
    }
}

public func flip <A, B, C> (_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in { a in f(a)(b) }}
}

public func flip <A, C> (_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {
    return { { a in f(a)() }}
}

public func zurry <A> (_ f: () -> A) -> A {
    return f()
}
