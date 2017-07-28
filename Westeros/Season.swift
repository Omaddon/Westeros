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

    private var _episodes   : [Episode]
    let name                : String
    let date                : Date
    let image               : UIImage
    
    init(name: String, date: String, image: UIImage) {
        
        (self.name, self.image) = (name, image)
        
        _episodes = [Episode]()
        
        self.formatter.dateFormat = "dd/MM/yyyy"
        self.date = formatter.date(from: date)!
//        "08/10/2016"
    }
}



extension Season {
    
    var count : Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        
        guard episode.season == self else {
            return
        }
        
        _episodes.append(episode)
    }
    
    func add(episodes: Episode...) {
        for episode in episodes {
            add(episode: episode)
        }
    }
    
    func add(episodes: [Episode]) {
        for episode in episodes {
            add(episode: episode)
        }
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


































