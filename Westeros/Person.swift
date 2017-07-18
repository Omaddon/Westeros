//
//  Character.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 7/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


// private:         dentro de la clase o la extension (se suele poner _ delante)
// finalprivate:    solo desde la clase
// public:          se ve desde fuera
// internal:        se ve dentro del módulo

final class Person {
    
    // Variables de instancia
    let name    : String
    let house   : House
    private let _alias   : String?
    
    // Variable computada
    var alias : String {
        get {
            
            // Si NO es 'nil', devuelve _alias. Si es 'nil, devuelve ""
            return _alias ?? ""
            
            /*
            // Esta asignación solo se realiza si hay algo dentro de "_alias"
            if let _alias = _alias {
                // Se crea una variable solo visible aquí. Se entrará solo si existe
                return _alias
            } else {
                return ""
            }
             */
        }
    }
    
    init(name: String, alias: String?, house: House) {
        
        (self.name, _alias, self.house) = (name, alias, house)
    }
    
    
    convenience init(name: String, house: House) {
        self.init(name: name, alias: nil, house: house)
    }
    
//    init(name: String, house: House) {
//        
//        (self.name, self.house) = (name, house)
//        _alias = nil
//    }
}


extension Person {
    
    var fullName : String {
        return "\(name) \(house.name)"
    }
    
}


extension Person {
    var proxy : String {
        return "\(name) \(alias) \(house.name)"
    }
}


extension Person : Hashable {
    var hashValue : Int {
        get {
            return proxy.hashValue
        }
    }
}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    static func <=(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy <= rhs.proxy
    }
    
    static func >(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy > rhs.proxy
    }
    
    static func >=(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy >= rhs.proxy
    }
}


















