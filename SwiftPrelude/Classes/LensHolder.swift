//
//  LensHolder.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/4/17.
//
public protocol LensObject {}

public struct LensHolder <Object: LensObject> {}

public extension LensObject {
    public static var lens: LensHolder<Self> {
        return LensHolder()
    }
}
