//
//  Semigroup.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/5/7.
//

public protocol Semigroup {
    func op(_ other: Self) -> Self
}

public func <> <S: Semigroup> (lhs: S, rhs: S) -> S {
    return lhs.op(rhs)
}

// <>b
public prefix func <> <S: Semigroup> (b: S) -> (S) -> S {
    return { $0 <> b }
}

// a<>
public postfix func <> <S: Semigroup> (a: S) -> (S) -> S {
    return { a <> $0 }
}
