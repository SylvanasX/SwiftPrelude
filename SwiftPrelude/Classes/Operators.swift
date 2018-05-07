//  Created by Sylvanas

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

infix operator ||>: LeftApplyPrecedence

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

infix operator <>: FunctionCompositionPrecedence

// Semigroup
prefix operator <>

// Semigroup
postfix operator <>








