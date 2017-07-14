//
//  House.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 7/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>     // Esto crea un conjuto de Personas

// MARK: - Classes
final class House {
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    
    private var _members : Members
    
//    var members : Members {
//        return _members
//    }
    
    init(name: String, sigil: Sigil, words: Words) {
        
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
    
}


final class Sigil {
    
    let image       : UIImage
    let description : String
    
    init(image: UIImage, description: String) {
        
        (self.image, self.description) = (image, description)
    }
    
}


// MARK: - Extensiones

extension House {
    var count : Int {
        return _members.count
    }
    
    // Debemos verificar que la Person añadida pertenece a dicha House
    func add(person: Person) {
        // Si se cumple la codición, sigue adelante
        // Si NO se cumple, entra en el guard (y sale de la func)
        guard person.house == self else {
            return
        }
        _members.insert(person)
    }
}

extension House {
    // No comparamos el Sigil pues necesitariamos hacer que Sigil también fuera Equatable
    // Se podría hacer, pero no es imprescindible... se puede hacer más adelante
    var proxyForEquality : String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparasion : String {
        return "\(name.uppercased()) \(count)"
    }
}

extension House : Hashable {
    var hashValue : Int {
        get {
            return proxyForEquality.hashValue
        }
    }
}

extension House : Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparasion < rhs.proxyForComparasion
    }
    
    static func <=(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparasion <= rhs.proxyForComparasion
    }
    
    static func >(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparasion > rhs.proxyForComparasion
    }
    
    static func >=(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparasion >= rhs.proxyForComparasion
    }
    
}





















