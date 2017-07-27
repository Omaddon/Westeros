//
//  Episode.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 27/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


final class Episode {
    
    let formatter = DateFormatter()
    
    let title           : String
    let emitOn          : Date
    let number          : Int
    weak var season     : Season?
    
    private var _chars   : [Person]
    
    init(title: String, emitOn: String, number: Int, chars: [Person], season: Season) {
        (self.title, self.season) = (title, season)

        _chars = chars
        
        self.formatter.dateFormat = "dd/MM/yyyy"
        self.emitOn = formatter.date(from: emitOn)!
        //        "08/10/2016"
        
        guard number > 0 else {
            self.number = 0
            return
        }
        
        self.number = number

    }
    
}


extension Episode {
    
    var count : Int {
        return _chars.count
    }
    
    func add(char: Person) {
        _chars.append(char)
    }
    
    func add(chars: Person...) {
        for char in chars {
            add(char: char)
        }
    }
    
    func add(chars: [Person]) {
        for char in chars {
            add(char: char)
        }
    }
    
    func sortedMembers() -> [Person] {
        return _chars.sorted()
    }
    
}


extension Episode {
    
    var proxyForEquality : String {
        return "\(title.uppercased()) \(emitOn)"
    }
    
    var proxyForComparasion : Date {
        return emitOn
    }
}


extension Episode : CustomStringConvertible {
    var description: String {
        return "\(title)"
    }
}

extension Episode : Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode : Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode : Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparasion < rhs.proxyForComparasion
    }
}





































