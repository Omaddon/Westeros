//
//  CharacterTest.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 7/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkSigil      : Sigil!
    var lannisterSigil  : Sigil!
    
    var starkHouse      : House!
    var lannisterHouse  : House!
    
    var robb    : Person!
    var arya    : Person!
    var tyrion  : Person!
    
    override func setUp() {
        super.setUp()
      
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
//        robb = Repository.local.char(named: "Robb", house: "Stark")
//        arya = Repository.local.char(named: "Arya", house: "Stark")
//        tyrion = Repository.local.char(named: "Tyrion", house: "Lannister")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistance() {
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName() {
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testPersonEquality() {
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
}





















