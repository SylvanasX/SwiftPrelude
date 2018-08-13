//
//  Sequence.swift

public func mapOptional <S: Sequence, A> (_ f: @escaping (S.Element) -> A?) -> (S) -> [A] {
    return { xs in
        #if swift(>=4.1)
        return xs.compactMap(f)
        #else
        return xs.flatMap(f)
        #endif
    }
}

public func catOptionals <S: Sequence, A> (_ xs: S) -> [A] where S.Element == A? {
    return xs |> mapOptional(id)
}

extension Sequence {
    public static func <¢> <A> (f: (Element) -> A, xs: Self) -> [A] {
        return xs.map(f)
    }
}

public func map <S: Sequence, A> (_ f: @escaping (S.Element) -> A) -> (S) -> [A] {
    return { xs in f <¢> xs  }
}

public extension Sequence {
    // [(+3), (*3), (^3)] <*> [1,2,3]
    // [4,5,6,3,6,9,1,8,27]
    public func apply<S: Sequence, A> (_ fs: S) -> [A] where S.Element == ((Element) -> A) {
        return fs.flatMap { f in self.map { x in f(x) }}
    }
    
    public static func <*> <S: Sequence, A> (fs: S, xs: Self) -> [A] where S.Element == ((Element) -> A) {
        return fs.flatMap { f in xs.map { x in f(x) } }
    }
}

public func apply <S: Sequence, T: Sequence, A> (_ fs: S) -> (T) -> [A] where S.Element == ((T.Element) -> A) {
    return { xs in fs.flatMap { f in xs.map(f) } }
}


public func flatMap <S: Sequence, A> (_ f: @escaping (S.Element) -> A) -> (S) -> [A] {
    return { xs in
        #if swift(>=4.1)
        return xs.compactMap(f)
        #else
        return xs.flatMap(f)
        #endif
    }
}

extension Sequence where Element: Monoid {
    public func concat() -> Element {
        return SwiftPrelude.concat(self)
    }
}

public func concat <S: Sequence> (_ xs: S) -> S.Element where S.Element: Monoid {
    return xs.reduce(.empty, <>)
}
















