//
//  PullRequestsBOTests.swift
//  Concrete
//
//  Created by Rodrigo Dias on 08/07/17.
//  Copyright © 2017 Rodrigo Dias. All rights reserved.
//

import XCTest

class PullRequestsBOTests: XCTestCase {
    let pullRequestsBO = PullRequestsBO()
    
    override func setUp() {
        super.setUp()
        pullRequestsBO.dataProvider = MockPullRequestsAPI()
    }
    
    func testQuery() {
        pullRequestsBO.query(criador: "criador", repositorio: "repositorio") { (result, error) in
            XCTAssertEqual(result?.first?.title, "2.x: See if sudo required results in consistent & faster build times")
        }
    }
}
