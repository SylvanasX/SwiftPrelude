//
//  File.swift
//  SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/4/17.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
public struct Lens <Whole, Part> {
    public let view: (Whole) -> Part
    public let set: (Part, Whole) -> Whole
    
    public init(view: @escaping (Whole) -> Part, set: @escaping (Part, Whole) -> Whole) {
        self.view = view
        self.set = set
    }
    
    
    public func over(_ f: @escaping (Part) -> Part) -> (Whole) -> Whole {
        return { whole in
            let part = self.view(whole)
            return self.set(f(part), whole)
        }
    }
    
    public func compose <Subpart> (_ rhs: Lens <Part, Subpart>) -> Lens<Whole, Subpart> {
        return Lens<Whole, Subpart>(view: { whole in
            let part = self.view(whole)
            return rhs.view(part)
        }, set: { subpart, whole in
            let part = self.view(whole)
            let newPart = rhs.set(subpart, part)
            return self.set(newPart, whole)
        })
    }
}

// set operator
public func .~ <Whole, Part> (lens: Lens<Whole, Part>, part: Part) -> (Whole) -> Whole {
    return { whole in lens.set(part, whole)}
}

// view
public func ^* <Whole, Part> (whole: Whole, lens: Lens<Whole, Part>) -> Part {
    return lens.view(whole)
}

// compose
public func .. <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
    return lhs.compose(rhs)
}

// over
public func %~ <Whole, Part> (lens: Lens<Whole, Part>, f: @escaping (Part) -> Part) -> (Whole) -> Whole {
    return lens.over(f)
}

public func %~~ <Whole, Part> (lens: Lens<Whole, Part>, f: @escaping (Part, Whole) -> Part) -> (Whole) -> Whole {
    return { whole in
        lens.set(f(lens.view(whole), whole), whole)
    }
}

// KeyPath
public func lens <Whole, Part> (_ keyPath: WritableKeyPath<Whole, Part>) -> Lens<Whole, Part> {
    return Lens<Whole, Part>(view: {
        $0[keyPath: keyPath]
    }, set: {
        var copy = $1
        copy[keyPath: keyPath] = $0
        return copy
    })
}

// KeyPath set
public func .~ <Whole, Part> (_ keyPath: WritableKeyPath<Whole, Part>, part: Part) -> (Whole) -> Whole {
    return lens(keyPath) .~ part
}

// KeyPath over
public func %~ <Whole, Part> (_ keyPath: WritableKeyPath<Whole, Part>, f: @escaping (Part) -> Part) -> (Whole) -> Whole {
    return lens(keyPath) %~ f
}











