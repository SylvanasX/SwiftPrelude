//
//  PrecedenceGroups.swift

// 0
precedencegroup infixl0 {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup infixr0 {
    associativity: right
    higherThan: infixl0
}

// 1
precedencegroup infixl1 {
    associativity: left
    higherThan: infixr0
}

precedencegroup infixr1 {
    associativity: right
    higherThan: infixl1
}

// 2
precedencegroup infixl2 {
    associativity: left
    higherThan: infixr1
}

precedencegroup infixr2 {
    associativity: right
    higherThan: infixl2
}

// 3
precedencegroup infixl3 {
    associativity: left
    higherThan: infixr2
}

precedencegroup infixr3 {
    associativity: right
    higherThan: infixl3
}

// 4
precedencegroup infixl4 {
    associativity: left
    higherThan: infixr3
}

precedencegroup infixr4 {
    associativity: right
    higherThan: infixl4
}

// 5
precedencegroup infixl5 {
    associativity: left
    higherThan: infixr4
}

precedencegroup infixr5 {
    associativity: right
    higherThan: infixl5
    lowerThan: AdditionPrecedence
}

// 6
precedencegroup infixl6 {
    associativity: left
    higherThan: infixr5
}

precedencegroup infixr6 {
    associativity: right
    higherThan: infixl6
    lowerThan: MultiplicationPrecedence
}

// 7
precedencegroup infixl7 {
    associativity: left
    higherThan: infixr6
}

precedencegroup infixr7 {
    associativity: right
    higherThan: infixl7
}

// 8
precedencegroup infixl8 {
    associativity: left
    higherThan: infixr7
}

precedencegroup infixr8 {
    associativity: right
    higherThan: infixl8
}

// 9
precedencegroup infixl9 {
    associativity: left
    higherThan: infixr8
}

precedencegroup infixr9 {
    associativity: right
    higherThan: infixl9
}

// 10
precedencegroup infixl10 {
    associativity: left
    higherThan: infixr9
}

precedencegroup infixr10 {
    associativity: right
    higherThan: infixl10
}

// 11
precedencegroup infixl11 {
    associativity: left
    higherThan: infixr10
}

precedencegroup infixr11 {
    associativity: right
    higherThan: infixl11
}







