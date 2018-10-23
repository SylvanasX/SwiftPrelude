//: Playground - noun: a place where people can play

import UIKit
import Result
import SwiftPrelude
import Swiftx

var str = "Hello, playground"


let array = ["Amy", "Mike", "John"]


zip(1..., array)
    .map({ "\($0) ) \($1)"})

struct Account {
    
}

enum AccountError: Error {
    case error
}

typealias Amount = Double


protocol AccountService {
    func open(no: String, name: String, openDate: Date?) -> Result<Account, AccountError>
    func close(account: Account, closeDate: Date?) -> Result<Account, AccountError>
    func debit(account: Account, amount: Amount) -> Result<Account, AccountError>
    func credit(account: Account, amout: Amount) -> Result<Account, AccountError>
    func balance(account: Account) -> Result<Account, AccountError>
}

class AccountServiceImp: AccountService {
    func open(no: String, name: String, openDate: Date?) -> Result<Account, AccountError> {
        return Result.init(value: Account())
    }
    func close(account: Account, closeDate: Date?) -> Result<Account, AccountError> {
        return Result.init(value: Account())
    }
    func debit(account: Account, amount: Amount) -> Result<Account, AccountError> {
        return Result.init(value: Account())
    }
    func credit(account: Account, amout: Amount) -> Result<Account, AccountError> {
        return Result.init(value: Account())
    }
    func balance(account: Account) -> Result<Account, AccountError> {
        return Result.init(value: Account())
    }
}

/*
 public func >>- <A, B>(a : A?, f : (A) -> B?) -> B? {
 return a.flatMap(f)
 }
 */
func >>- <E, A, B> (_ a: Result<A, E>, _ f: (A) -> Result<B, E>) -> Result<B, E> {
    return a.flatMap(f)
}

//public func >=> <A, B, C, E> (_ f: @escaping (A) -> B?, _ g: @escaping (B) -> C?) -> (A) -> C? {
//    return f >>> flatMap(g)
//}

let account = Account()
let service: AccountService = AccountServiceImp()
//account |>
// 3.2.3
func transfer(from: Account, to: Account, amount: Amount) -> Result<(Account, Account, Amount), AccountError> {
    return service.debit(account: from, amount: amount)
        >>- { a in service.credit(account: to, amout: amount)
            >>- { b in
                Result.init(value: (a, b, amount))
            }
        }
}

