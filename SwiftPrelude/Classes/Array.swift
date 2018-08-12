//
//  Array.swift

public func uncons <A> (_ xs: [A]) -> (A, [A])? {
    guard let x = xs.first else { return nil }
    return (x, Array(xs.dropLast()))
}

public func partition <A> (_ p: @escaping (A) -> Bool) -> ([A]) -> ([A], [A]) {
    return { xs in
        xs.reduce(into: ([], [])) { accum, x in
            if p(x) {
                accum.0.append(x)
            } else {
                accum.1.append(x)
            }
        }
    }
}

public func elem <A: Equatable> (_ x: A) -> ([A]) -> Bool {
    return { xs in xs.contains(x) }
}

public func elem <A: Equatable> (_ xs: [A]) -> (A) -> Bool {
    return { x in xs.contains(x) }
}

// lookup :: Eq a => a -> [(a, b)] -> Maybe b
public func lookup <A: Equatable, B> (_ x: A) -> ([(A, B)]) -> B? {
    return { pairs in
        let isTrue = { a in x == a }
        return pairs.filter(first >>> isTrue).map(second).first
    }
}

public func replicate <A> (_ n: Int) -> (A) -> [A] {
    return { a in (1...n).map(const(a)) }
}

// (a -> b) -> fa -> fb
//public func map <A, B> (_ f: @escaping (A) -> B) -> ([A]) -> ([B]) {
//    return { xs in xs.map(f) }
//}

public func prue <A> (_ a: A) -> [A] {
    return [a]
}

// ma -> (a -> mb) -> mb
//public func flatMap <A, B> (_ f: @escaping (A) -> [B]) -> ([A]) -> [B] {
//    return { xs in xs.flatMap(f) }
//}
















