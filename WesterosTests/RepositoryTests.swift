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
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositorySorted() {
        let houses = Repository.local.houses
        let firstHouse = "Lannister"
        
        XCTAssertNotEqual(houses, houses.reversed())
        
        XCTAssertEqual(houses, houses.sorted())
        
        XCTAssertEqual(houses[0].name, firstHouse)
    }
    
    func testLocalRepositoryFilter() {
        func filterStark(house: House) -> Bool {
            let starkHouse : House? = Repository.local.house(named: "Stark")
            return house == starkHouse
        }
        
        func filterFail(house: House) -> Bool {
            let omaddonHouse = House(name: "Omaddon",
                                     sigil: (Repository.local.house(named: "Stark")?.sigil)!,
                                     words: "No words",
                                     url: URL(string: "http://www.google.es")!)
            return house == omaddonHouse
        }
        
        var result : [House]? = Repository.local.houses(filteredBy: filterStark)
        XCTAssertNotEqual(result!, [])
        
        result = Repository.local.houses(filteredBy: filterFail)
        XCTAssertEqual(result!, [])
        
        let filtered = Repository.local.houses(filteredBy: { $0.count == 2 })
        XCTAssertEqual(filtered?.count, 1)
    }
}
























