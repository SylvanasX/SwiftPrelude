//
//  Tuple.swift
//  Pods-SwiftPrelude_Example
//
//  Created by ptyuan on 2018/8/8.
//

import Foundation


public func first <A, B> (_ x: (A, B)) -> A {
    return x.0
}

public func second <A, B> (_ x: (A, B)) -> B {
    return x.1
}
