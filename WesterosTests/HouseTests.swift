//
//  HouseTests.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 7/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkImage      : UIImage!
    var lannisterImage  : UIImage!
    
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    
    var starkHouse      : House!
    var lannisterHouse  : House!
    
    var lyanna    : Person!
    var martyn     : Person!
    
    override func setUp() {
        super.setUp()
        
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        starkSigil = starkHouse.sigil
        lannisterSigil = lannisterHouse.sigil
        
        lyanna = Person(name: "Lyanna", house: starkHouse)
        martyn = Person(name: "Martyn", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence() {        
        XCTAssertNotNil(starkHouse)
    }
    
    
    func testSigilExistance() {
        
        let starkSigil = starkHouse.sigil
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = lannisterHouse.sigil
        XCTAssertNotNil(lannisterSigil)
    }
    
    
    func testAddPersons() {
        XCTAssertEqual(starkHouse.count, 4)
        starkHouse.add(person: lyanna)
        XCTAssertEqual(starkHouse.count, 5)
        
        XCTAssertEqual(lannisterHouse.count, 4)
        lannisterHouse.add(person: martyn)
        XCTAssertEqual(lannisterHouse.count, 5)
    }
    
    func testHouseEquality() {
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
//        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
//        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    func testHouseNamed() {
        XCTAssertEqual(starkHouse, Repository.local.house(named: "Stark"))
        XCTAssertNotEqual(starkHouse, Repository.local.house(named: "Lannister"))
        XCTAssertEqual(Repository.local.house(named: "Stark"), Repository.local.house(named: "Stark"))
    }
}


















