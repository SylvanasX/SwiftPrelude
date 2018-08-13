//
//  Optional.swift

public func optional <A, B> (_ default: @autoclosure @escaping () -> B) -> (@escaping (A) -> B) -> (A?) -> B {
    return { a2b in
        { a in a.map(a2b) ?? `default`() }
    }
}

public func coalesce <A> (with defalut: @autoclosure @escaping () -> A) -> (A?) -> A {
    return optional(`defalut`) <| id
}

extension Optional {
    public static func <¢> <A> (f: (Wrapped) -> A, x: Optional) -> A? {
        return x.map(f)
    }
}

public func map <A, B> (_ f: @escaping (A) -> B) -> (A?) -> B? {
    return { a in f <¢> a }
}

extension Optional {
    public func apply <A> (_ f: ((Wrapped) -> A)?) -> A? {
        guard let f = f, let x = self else { return nil }
        return f(x)
    }
    
    public static func <*> <A> (f: ((Wrapped) -> A)?, _ x: Optional) -> A? {
        return x.apply(f)
    }
}

public func apply <A, B> (_ f: ((A) -> B)?, _ x: A) -> B? {
    return f <*> x
}

public func pure <A> (_ x: A) -> A? {
    return .some(x)
}

public func flatMap <A, B> (_ f: @escaping (A) -> B?) -> (A?) -> B? {
    return { a in a.flatMap(f) }
}

public func >=> <A, B, C> (_ f: @escaping (A) -> B?, _ g: @escaping (B) -> C?) -> (A) -> C? {
    return f >>> flatMap(g)
}

extension Optional where Wrapped: Semigroup {
    public static func <> (lhs: Optional, rhs: Optional) -> Optional {
        switch (lhs, rhs) {
        case (.none, _):
            return rhs
        case (_, .none):
            return lhs
        case let (.some(l), .some(r)):
            return .some(l <> r)
        }
    }
}

extension Optional where Wrapped: Semigroup {
    static var empty: Optional {
        return .none
    }
}










