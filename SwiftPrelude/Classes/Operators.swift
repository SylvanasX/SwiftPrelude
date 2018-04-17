//
//  Operators.swift
//  Pods-SwiftPrelude_Example
//
//  Created by Sylvanas on 2018/4/17.
//

precedencegroup LeftApplyPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: TernaryPrecedence
}

precedencegroup FunctionCompositionPrecedence {
    associativity: right
    higherThan: LeftApplyPrecedence
}

precedencegroup LensSetPrecedence {
    associativity: left
    higherThan: FunctionCompositionPrecedence
}

precedencegroup LensCompositionPrecedence {
    associativity: right
    higherThan: LensSetPrecedence
}

// f(x)
infix operator |>: LeftApplyPrecedence

// g(f(x))
infix operator >>>: FunctionCompositionPrecedence

// Lens set
infix operator .~: LensSetPrecedence

// Lens view
infix operator ^*: LeftApplyPrecedence

// Lens compose
infix operator ..: LensCompositionPrecedence

// Lens over
infix operator %~: LensSetPrecedence

// Lens %~~
infix operator %~~: LensSetPrecedence

