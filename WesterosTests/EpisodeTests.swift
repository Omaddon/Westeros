//
//  EpisodeTests.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 28/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    
    var episode1    : Episode!
    var episode2    : Episode!
    var char        : Person!
    var houseTest   : House!
    
    
    override func setUp() {
        super.setUp()
        
        episode1 = Repository.local.seasons.first?.sortedMembers().first
        episode2 = Repository.local.seasons.first?.sortedMembers()[1]
        houseTest = Repository.local.house(named: "Stark")
        char = Person(name: "CharTest",
                      house: houseTest,
                      image: UIImage(named: "noimage.jpg")!)

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1)
    }
    
    
    func testAddChar() {
        XCTAssertEqual(episode1.count, 10)
        
        episode1.add(char: char)
        XCTAssertEqual(episode1.count, 11)
    }
    
    func testSortedEpisodes() {
        XCTAssertLessThanOrEqual(episode1, episode2)
        
        let episodes = (Repository.local.seasons.first?.sortedMembers())!
        XCTAssertNotEqual(episodes, episodes.reversed())
    }
    
    func testSeasonEquality() {
        XCTAssertEqual(episode1, episode1)
        XCTAssertNotEqual(episode1, episode2)
        
        let season1 = Repository.local.seasons.first
        
        let charsTest = season1?.sortedMembers().first?.sortedMembers()
        
        let episodeTest = Episode(title: "Winter is coming",
                                  emitOn: "09/05/2011",
                                  number: 1,
                                  chars: charsTest!,
                                  season: season1!,
                                  image: UIImage(named: "1x1.jpg")!)
        
        XCTAssertEqual(episode1, episodeTest)
        
    }
    
    
    func testHashableSeason() {
        XCTAssertNotNil(episode1)
    }
    
    
    func testCustomStringConvertible() {
        XCTAssertEqual(episode1.description, "Winter is coming")
    }
    
}

































