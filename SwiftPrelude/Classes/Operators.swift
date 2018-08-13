//
//  Operators.swift

infix operator <|: infixr0
infix operator |>: infixl1
infix operator ||>: infixl1

// g(f(x))
infix operator >>>: infixr9
infix operator <<<: infixr9

infix operator >=>: infixr1

infix operator <>: infixr5
prefix operator <>
postfix operator <>

infix operator <|>: infixl3

infix operator <¢>: infixl4

infix operator <*>: infixl4

// Lens
infix operator %~: infixr4 // over
infix operator .~: infixr4 // set
infix operator ^*: infixl8 // view
infix operator ..: infixr9 // compose
infix operator %~~: infixr4 // over part whole
