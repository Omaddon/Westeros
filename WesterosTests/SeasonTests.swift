//
//  SeasonTests.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 27/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTests: XCTestCase {
    
    
    var season1     : Season!
    var season2     : Season!
    var charTest    : Person!
    var episodeTest : Episode!
    
    
    override func setUp() {
        super.setUp()
        
        season1 = Repository.local.seasons.first
        season2 = Repository.local.seasons[1]
        charTest = Repository.local.houses.first?.sortedMembers().first
        episodeTest = Episode(title: "EpisodioTest",
                              emitOn: "01/01/2017",
                              number: 1,
                              chars: [charTest],
                              season: season1,
                              image: UIImage(named: "noimage.jpg")!)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
    
    func testAddEpisode() {
        XCTAssertEqual(season1.count, 10)
        
        season1.add(episode: episodeTest)
        XCTAssertEqual(season1.count, 11)
    }
    
    func testSortedSeasons() {
        XCTAssertLessThanOrEqual(season1, season2)
        
        let seasons = Repository.local.seasons
        XCTAssertNotEqual(seasons, seasons.reversed())
    }
    
    func testSeasonEquality() {
        XCTAssertEqual(season1, season1)
        XCTAssertNotEqual(season1, season2)
        
        let seasonTest = Season(name: "Season 1",
                                date: "09/05/2011",
                                image: UIImage(named: "season1.png")!)
        
        let episodeForLoop = Episode(title: "EpisodioTest",
                                     emitOn: "01/01/2017",
                                     number: 1,
                                     chars: [charTest],
                                     season: seasonTest,
                                     image: UIImage(named: "noimage.jpg")!)
        
        var episodesTest = [Episode]()
        for _ in 1...10 {
            episodesTest.append(episodeForLoop)
        }
        
        seasonTest.add(episodes: episodesTest)
        XCTAssertEqual(season1, seasonTest)
        
    }
    
    
    func testHashableSeason() {
        XCTAssertNotNil(season1)
    }
    
    
    func testCustomStringConvertible() {
        XCTAssertEqual(season1.description, "Season 1")
    }
    
}
































