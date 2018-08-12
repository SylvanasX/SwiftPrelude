//
//  Monoid.swift

public protocol Monoid: Semigroup {
    static var empty: Self { get }
}

extension String: Monoid {
    public static let empty = ""
}

extension Array: Monoid {
    public static var empty: Array { return [] }
}


