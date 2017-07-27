//
//  Seasons.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 27/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


final class Season {

    let formatter = DateFormatter()

    private let _episodes   : [Episode]
    let name                : String
    let date                : Date
    
    init(episodes: [Episode], name: String, date: String) {
        
        (_episodes, self.name) = (episodes, name)
        
        self.formatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.date = formatter.date(from: date)!
//        "08/10/2016 22:31"
    }
}



extension Season {
    
    var count : Int {
        return _episodes.count
    }
    
    func sortedMembers() -> [Episode] {
        return _episodes.sorted()
    }
    
}


extension Season {
    
    var proxyForEquality : String {
        return "\(name.uppercased()) \(date) \(count)"
    }
    
    var proxyForComparasion : String {
        return "\(name.uppercased())"
    }
}


extension Season : CustomStringConvertible {
    var description: String {
        return "\(name)"
    }
}

extension Season : Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season : Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season : Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparasion < rhs.proxyForComparasion
    }
}


































