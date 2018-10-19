//
//  KeyPath.swift
//  Pods-SwiftPrelude_Example
//
//  Created by ptyuan on 2018/10/19.
//
public func prop <Root, Value> (_ kp: WritableKeyPath<Root, Value>) -> (@escaping (Value) -> Value) -> (Root) -> Root {
    return { update in
        { root in
            var copy = root
            copy[keyPath: kp] = update(root[keyPath: kp])
            return copy
        }
    }
}

public func prop<Root, Value> (_ kp: WritableKeyPath<Root, Value>, _ f: @escaping (Value) -> Value) -> (Root) -> Root {
    return prop(kp)(f)
}

public func over <Root, Value> (
    _ kp: WritableKeyPath<Root, Value>,
    _ update: (@escaping (Value) -> Value))
    -> (Root) -> Root {
        return prop(kp)(update)
}

public func set <Root, Value> (_ kp: WritableKeyPath<Root, Value>, _ value: Value) -> (Root) -> Root {
    return over(kp) { _ in value }
}

public func mprop <Root, Value> (_ kp: WritableKeyPath<Root, Value>) -> (@escaping (inout Value) -> Void) -> (inout Root) -> Void {
    return { update in
        { root in
            update(&root[keyPath: kp])
        }
    }
}

public func mver <Root, Value> (_ kp: WritableKeyPath<Root, Value>, _ update: @escaping (inout Value) -> Void) -> (inout Root) -> Void {
    return mprop(kp)(update)
}

public func mut <Root, Value> (_ kp: WritableKeyPath<Root, Value>, _ value: Value) -> (inout Root) -> Void {
    return mver(kp) { $0 = value }
}

public func mprop <Root, Value> (_ kp: ReferenceWritableKeyPath<Root, Value>) -> (@escaping (inout Value) -> Void) -> (Root) -> Void {
    return { update in
        { root in
            update(&root[keyPath: kp])
        }
    }
}

public func mver <Root, Value> (_ kp: ReferenceWritableKeyPath<Root, Value>, _ update: @escaping (inout Value) -> Void) -> (Root) -> Void {
    return mprop(kp)(update)
}

public func mut <Root, Value> (_ kp: ReferenceWritableKeyPath<Root, Value>, _ value: Value) -> (Root) -> Void {
    return mver(kp) { $0 = value }
}
