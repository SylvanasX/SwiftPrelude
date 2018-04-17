//
//  LensTests.swift
//  SwiftPrelude_Tests
//
//  Created by Sylvanas on 2018/4/17.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftPrelude

private struct City: Equatable {
    let id: Int
    static let _id = Lens<City, Int>(view: {
        $0.id
    }, set: { (id, _) in
        City(id: id)
    })
}

private func == (lhs: City, rhs: City) -> Bool {
    return lhs.id == rhs.id
}

private struct Location: Equatable {

    let id: Int
    let city: City
    
    static let _id = Lens<Location, Int>(view: {
        $0.id
    }, set: { (id, location) in
        Location(id: id, city: location.city)
    })
    
    static let _city = Lens<Location, City>(view: {
        $0.city
    }, set: {
        Location(id: $1.id, city: $0)
    })
}

private func == (lhs: Location, rhs: Location) -> Bool {
    return lhs.id == rhs.id && lhs.city == rhs.city
}

private struct User: Equatable {
    let id: Int
    let location: Location
    let name: String
    
    static let _id = Lens<User, Int>(view: {
        $0.id
    }, set: { (id, user) in
        User(id: id, location: user.location, name: user.name)
    })
    
    static let _location = Lens<User, Location>(
        view: { $0.location },
        set: { User(id: $1.id, location: $0, name: $1.name) }
    )
    
    static let _name = Lens<User, String>(
        view: { $0.name },
        set: { User(id: $1.id, location: $1.location, name: $0)} )
}

private func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id && lhs.location == rhs.location && lhs.name == rhs.name
}


class LensTests: XCTestCase {
    

    private let user = User(id: 1, location: Location(id: 2, city: City(id: 3)), name: "xiaoming")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testLensComposition() {
        XCTAssertEqual(2, User._location.compose(Location._id).view(user))
        XCTAssertEqual(3, User._location.compose(Location._city.compose(City._id)).view(user))
    }
    
    func testLensCompositionOperator() {
        XCTAssertEqual(2, (User._location..Location._id).view(user))
        XCTAssertEqual(3, (User._location..Location._city..City._id).view(user))
    }
    
    func testLensSet() {
        XCTAssertEqual(10, (User._id .~ 10)(user).id)
    }
    
    func testLensSetAndCompositionOperator() {
        XCTAssertEqual(10, (User._location..Location._city..City._id .~ 10)(user).location.city.id)
    }
    
    func testLensViewOperator() {
        XCTAssertEqual(1, user ^* User._id)
    }
    
    func testLensViewAndComposition() {
        XCTAssertEqual(2, user ^* User._location..Location._id)
    }
    
    func testOverOperator() {
        XCTAssertEqual(2, (User._id %~ { $0 + 1})(user).id)
    }
    
    func testOverAndCompostionOperator() {
        XCTAssertEqual(3, ((User._location..Location._id) %~ { $0 + 1 })(user).location.id)
    }
    
    func testOperatorPrecedences() {
        let temp = user
            |> User._id %~ ({ $0 + 2})
            |> User._location..Location._id %~ ({$0 + 3})
            |> User._location..Location._city..City._id .~ 10
            |> User._name .~ "abc"
        XCTAssertEqual(User(id: 3, location: Location(id: 5, city: City(id: 10)), name: "abc"), temp)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
