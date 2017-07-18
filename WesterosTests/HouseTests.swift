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
    
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    
    var starkHouse      : House!
    var lannisterHouse  : House!
    
    var lyanna     : Person!
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
        XCTAssertNotNil(starkSigil)
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
        let jinxed = House(name: "Stark",
                           sigil: starkSigil, words: "Winter is coming!",
                           url: URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let robbJinxed = Person(name: "Robb", alias: "The young wolf", house: jinxed)
        let aryaJinxed = Person(name: "Arya", house: jinxed)
        let eddardJinxed = Person(name: "Eddard", alias: "The king in the North", house: jinxed)
        let sansaJinxed = Person(name: "Sansa", house: jinxed)
        
        jinxed.add(person: robbJinxed)
        jinxed.add(person: aryaJinxed)
        jinxed.add(person: eddardJinxed)
        jinxed.add(person: sansaJinxed)
        
        XCTAssertEqual(jinxed, starkHouse)
        
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
        XCTAssertNil(Repository.local.house(named: "CasaFalsa"))
    }
}


















