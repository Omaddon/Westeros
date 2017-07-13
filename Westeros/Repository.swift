//
//  Repository.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 12/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation

typealias FilteredBy = (House) -> Bool

final class Repository {
    
    static let local = LocalFactory()
}


protocol HouseFactory {
    
    var houses : [House] { get }
    func house(named: String) -> House?
    func houses(filter: FilteredBy) -> [House]?
}


final class LocalFactory : HouseFactory {
    
    func houses(filter: FilteredBy) -> [House]? {
        return houses.filter(filter)
    }

    var houses : [House] {
        get {
            // Creamos nuestras casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.jpg"), description: "Red three-headed dragon")
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and blood!")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let eddard = Person(name: "Eddard", alias: "The king in the North", house: stark)
            let sansa = Person(name: "Sansa", house: stark)
            
            let tywin = Person(name: "Tywin", alias: "The Lion of Lannister", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            let daenerys = Person(name: "Daenerys", alias: "Khaleesi", house: targaryen)
            let viserys = Person(name: "Viserys", alias: "The beggar king", house: targaryen)
            
            // Añadimos los personajes a las casas
            stark.add(person: robb)
            stark.add(person: arya)
            stark.add(person: eddard)
            stark.add(person: sansa)
            lannister.add(person: tywin)
            lannister.add(person: jaime)
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }

    func house(named: String) -> House? {
        return houses.filter({ (house: House) -> Bool in
            return house.name == named
        }).last
    }
    
//    func char(named: String, house: String) -> Person? {
//        let casa = self.house(named: house)
//        return casa?.members.filter({ (person: Person) -> Bool in
//            return person.name == named
//        }).last
//    }
}


















