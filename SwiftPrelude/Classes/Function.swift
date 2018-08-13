//
//  Function.swift

public func <| <A, B> (f: (A) -> B, x: A) -> B {
    return f(x)
}

public func |> <A, B> (x: A, f: (A) -> B) -> B {
    return f(x)
}

//public func ||> <A, B> (xs: [A], f: (A) -> B) -> [B] {
//    return xs.map(f)
//}

public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

public func <<< <A, B, C> (g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C {
    return { g(f($0)) }
}

public func id <A> (_ x: A) -> A {
    return x
}

public func const <A, B> (_ x: A) -> (B) -> A {
    return { _ in x }
}

public func flip <A, B, C> (_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
    return { b in { a in f(a)(b) }}
}

public func flip <A, C> (_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {
    return { { a in f(a)() } }
}

public func zurry <A> (f: () -> A) -> A {
    return f()
}

//(>>=) :: (r -> a) -> (a -> r -> b) -> r -> b
public func flatMap <R, A, B> (_ lhs: @escaping (A) -> ((R) -> B), _ rhs: @escaping (R) -> A) -> (R) -> B {
    return { r in lhs(rhs(r))(r) }
}

public func >=> <R, A, B, C> (lhs: @escaping (A) -> ((R) -> B), rhs: @escaping (B) -> ((R) -> C)) -> (A) -> ((R) -> C) {
    return { a in flatMap(rhs, lhs(a)) }
}

























