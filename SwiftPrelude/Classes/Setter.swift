//
//  Setter.swift
//  Pods-SwiftPrelude_Example
//
//  Created by ptyuan on 2018/10/19.
//

public typealias Setter <A, B, S, T> = (@escaping (A) -> B) -> (S) -> T

public func over <A, B, S, T> (
    _ setter: Setter <A, B, S, T>,
    _ f: @escaping (A) -> B) -> (S) -> T {
    return setter(f)
}

public func set <A, B, S, T> (
    _ setter: Setter <A, B, S, T>,
    _ value: B) -> (S) -> T {
    return setter { _ in value }
}

public typealias MutableSetter <S, A> = (@escaping (inout A) -> Void) -> (inout S) -> Void

public func mver <S, A> (
    _ setter: MutableSetter <S, A>,
    _ set: (@escaping (inout A) -> Void))
    -> (inout S) -> Void {
        return setter(set)
}

public func mut <S, A> (_ setter: MutableSetter <S, A>, _ value: A) -> (inout S) -> Void {
    return mver(setter, { $0 = value })
}

public func mver <S: AnyObject, A> (
    _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
    _ set: (@escaping (inout A) -> Void))
    -> (S) -> Void {
        return setter(set)
}

public func mut <S: AnyObject, A> (_ setter: (@escaping (inout A) -> Void) -> (S) -> Void, _ value: A) -> (S) -> Void {
    return mver(setter, { $0 = value })
}


//// Lens
//infix operator %~: infixr10 // over
//infix operator .~: infixr10 // set
//infix operator ^*: infixl1 // view
//infix operator ..: infixr11 // compose
//infix operator %~~: infixr10 // over part whole


public func %~ <A, B, S, T> (
    _ setter: Setter <A, B, S, T>,
    _ f: @escaping (A) -> B) -> (S) -> T {
    return over(setter, f)
}

public func %~ <S, A> (
    _ setter: MutableSetter <S, A>,
    _ set: (@escaping (inout A) -> Void))
    -> (inout S) -> Void {
        return mver(setter, set)
}

public func %~ <S: AnyObject, A> (
    _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
    _ set: (@escaping (inout A) -> Void))
    -> (S) -> Void {
        return mver(setter, set)
}

public func .~ <A, B, S, T> (
    _ setter: Setter <A, B, S, T>,
    _ value: B) -> (S) -> T {
    return set(setter, value)
}

public func .~ <S, A> (_ setter: MutableSetter <S, A>, _ value: A) -> (inout S) -> Void {
    return mut(setter, value)
}

public func .~ <S: AnyObject, A> (_ setter: (@escaping (inout A) -> Void) -> (S) -> Void, _ value: A) -> (S) -> Void {
    return mut(setter, value)
}

