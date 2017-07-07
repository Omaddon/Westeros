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
    
    var starkHouse  : House!
    var starkSigil  : Sigil!
    var ned         : Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistance() {
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
}
