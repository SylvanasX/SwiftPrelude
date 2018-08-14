//
//  Zip.swift
// array
public func zip2 <A, B> (_ xs: [A], _ ys: [B]) -> [(A, B)] {
    var result: [(A, B)] = []
    (0..<min(xs.count, ys.count)).forEach {
        result.append((xs[$0], ys[$0]))
    }
    return result
}

public func zip2 <A, B, C> (with f: @escaping (A, B) -> C) -> ([A], [B]) -> [C] {
    return { zip2($0, $1).map(f) }
}

public func zip3 <A, B, C> (_ xs: [A], _ ys: [B], _ zs: [C]) -> [(A, B, C)] {
    return zip2(xs, zip2(ys, zs)).map { a, bc in (a, bc.0, bc.1) }
}

public func zip3 <A, B, C, D> (with f: @escaping (A, B, C) -> D) -> ([A], [B], [C]) -> [D] {
    return { zip3($0, $1, $2).map(f) }
}

// optional
public func zip2 <A, B> (_ a: A?, _ b: B?) -> (A, B)? {
    guard let a = a, let b = b else { return nil }
    return (a, b)
}

public func zip2 <A, B, C> (with f: @escaping (A, B) -> C) -> (A?, B?) -> C? {
    return { zip2($0, $1) |> map(f) }
}

public func zip3 <A, B, C> (_ a: A?, _ b: B?, _ c: C?) -> (A, B, C)? {
    return zip2(a, zip2(b, c)).map { a, bc in (a, bc.0, bc.1) }
}

public func zip3 <A, B, C, D> (with f: @escaping (A, B, C) -> D) -> (A?, B?, C?) -> D? {
    return { zip3($0, $1, $2) |> map(f) }
}









