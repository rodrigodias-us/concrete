//
//  RepositoriesBOTests.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import XCTest

class RepositoriesBOTests: XCTestCase {
    
    let repositoriesBO = RepositoriesBO()
    
    override func setUp() {
        super.setUp()
        repositoriesBO.dataProvider = MockSearchAPI()
    }

    func testQuery() {
        repositoriesBO.search(q: "Test") { (result, error) in
            XCTAssertEqual(result?.items?.count, 30)
            XCTAssertEqual(result?.items?.first?.name, "RxJava")
            XCTAssertEqual(result?.items?.first?.description, "RxJava – Reactive Extensions for the JVM – a library for composing asynchronous and event-based programs using observable sequences for the Java VM.")
            XCTAssertEqual(result?.items?.first?.fullName, "ReactiveX/RxJava")
            XCTAssertEqual(result?.items?.first?.forksCount, 4522)
            XCTAssertEqual(result?.items?.first?.stargazersCount, 25543)
            XCTAssertEqual(result?.items?.first?.owner?.login, "ReactiveX")
        }
    }
    
}
