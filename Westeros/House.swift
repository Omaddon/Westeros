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
    let wikiURL : URL
    
    private var _members : Members
    
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
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
        // OJO! 'insert' es un método de Set, por lo que no mete elementos repetidos
        _members.insert(person)
    }
    
    // Variadic Function: permite recibibir varios parámetros, separados por coma. Genera un array.
    func add(persons: Person...) {
        for person in persons {
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person] {
        return _members.sorted()
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





















