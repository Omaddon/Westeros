//
//  RepositoryTests.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 12/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
    
}