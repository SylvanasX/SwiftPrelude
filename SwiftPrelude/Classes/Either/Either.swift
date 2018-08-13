//
//  Either.swift

public enum Either <L, R> {
    case left(L)
    case right(R)
}

extension Either {
    public func either <A> (_ l2a: (L) throws -> A, _ r2a: (R) -> A) rethrows -> A {
        switch self {
        case let .left(l):
            return try l2a(l)
        case let .right(r):
            return r2a(r)
        }
    }
    
    public var left: L? {
        return either(Optional.some, const(.none))
    }
    
    public var right: R? {
        return either(const(.none), Optional.some)
    }
    
    public var isLeft: Bool {
        return either(const(true), const(false))
    }
    
    public var isRight: Bool {
        return either(const(false), const(true))
    }
}

public func either <A, B, C> (_ a2c: @escaping (A) -> C, _ b2c: @escaping (B) -> C) -> (Either<A, B>) -> C {
    return { e in e.either(a2c, b2c) }
}

public func lefts <S: Sequence, L, R> (_ xs: S) -> [L] where S.Element == Either<L, R> {
    return xs |> mapOptional({ $0.left })
}

public func rights <S: Sequence, L, R> (_ xs: S) -> [R] where S.Element == Either<L, R> {
    return xs |> mapOptional({ $0.right })
}

public extension Either {
    public func map <A> (_ f: (R) -> A) -> Either<L, A> {
        switch self {
        case let .left(l):
            return .left(l)
        case let .right(r):
            return .right(f(r))
        }
    }
}

public func <¢> <A, L, R> (_ f: (R) -> A, _ e: Either<L, R>) -> Either<L, A> {
    return e.map(f)
}

public func map <A, L, R> (_ f: @escaping (R) -> A) -> (Either<L, R>) -> Either<L, A> {
    return { e in f <¢> e }
}

public extension Either {
    public func bimap <A, B> (_ l2a: (L) -> A, _ r2b: (R) -> B) -> Either<A, B> {
        switch self {
        case let .left(l):
            return .left(l2a(l))
        case let .right(r):
            return .right(r2b(r))
        }
    }
}

public func bimap <A, B, L, R> (_ l2a: @escaping (L) -> A, _ r2b: @escaping (R) -> B) -> (Either<L, R>) -> Either<A, B> {
    return { e in e.bimap(l2a, r2b) }
}

public extension Either {
    public func apply <A> (_ f: Either<L, (R) -> A>) -> Either<L, A> {
        return f.flatMap(self.map)
    }
    
    public static func <*> <A> (r2a: Either<L, (R) -> A>, e: Either<L, R>) -> Either<L, A> {
        return e.apply(r2a)
    }
}

public func apply <A, L, R> (_ r2a: Either<L, (R) -> A>) -> (Either<L, R>) -> Either<L, A> {
    return { e in r2a <*> e }
}

public func prue <L, R> (_ r: R) -> Either<L, R> {
    return Either.right(r)
}

extension Either: Alt {
    public static func <|> (lhs: Either, rhs: @autoclosure @escaping () -> Either) -> Either {
        switch lhs {
        case .left:
            return rhs()
        case .right:
            return lhs
        }
    }
}

public extension Either {
    public func flatMap <A> (_ f: (R) -> Either<L, A>) -> Either<L, A> {
        return self.either(Either<L, A>.left, f)
    }
}

public func flatMap <A, L, R> (_ f: @escaping (R) -> Either<L, A>) -> (Either<L, R>) -> Either<L, A> {
    return { e in e.flatMap(f) }
}

public func >=> <L, A, B, C> (lhs: @escaping (A) -> Either<L, B>, rhs: @escaping (B) -> Either<L, C>) -> (A) -> Either<L, C> {
    return lhs >>> flatMap(rhs)
}

extension Either where L: Equatable, R: Equatable {
    public static func == (lhs: Either, rhs: Either) -> Bool {
        switch (lhs, rhs) {
        case let (.left(lhs), .left(rhs)):
            return lhs == rhs
        case let (.right(lhs), .right(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}








