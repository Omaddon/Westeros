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
    
    let title       : String
    let emitOn      : Date
    var season      : String
    
    init(title: String, emitOn: String, season: String) {
        (self.title, self.season) = (title, season)
        
        self.formatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.emitOn = formatter.date(from: emitOn)!
        //        "08/10/2016 22:31"
    }
    
}


extension Episode {
    
    var proxyForEquality : String {
        return "\(title.uppercased()) \(emitOn)"
    }
    
    var proxyForComparasion : String {
        return "\(title.uppercased())"
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





































