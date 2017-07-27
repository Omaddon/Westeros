//
//  Repository.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 12/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import Foundation


final class Repository {
    
    static let local = LocalFactory()
}


protocol HouseFactory {
    
    typealias FilterHouse = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    var houses  : [House] { get }
    var seasons : [Season] { get }
    func house(named: String) -> House?
    func houses(filteredBy: FilterHouse) -> [House]?
    func seasons(filterdBy: FilterSeason) -> [Season]?
}


final class LocalFactory : HouseFactory {

    func houses(filteredBy: FilterHouse) -> [House]? {
        return houses.filter(filteredBy)
    }
    
    func seasons(filterdBy: FilterSeason) -> [Season]? {
        return seasons.filter(filterdBy)
    }
    
    
    var seasons : [Season] {
        get {
            
            // SEASONS
            let season1 = Season(name: "Season 1", date: "09/05/2011")
            let season2 = Season(name: "Season 2", date: "01/04/2012")
            let season3 = Season(name: "Season 3", date: "31/03/2013")
            let season4 = Season(name: "Season 4", date: "06/04/2014")
            let season5 = Season(name: "Season 5", date: "12/04/2015")
            let season6 = Season(name: "Season 6", date: "24/04/2016")
            let season7 = Season(name: "Season 7", date: "16/07/2017")
            
            // PERSONS by Episodes
            let houses = self.houses
            var persons = [Person]()
            
            for house in houses {
                for person in house.sortedMembers() {
                    persons.append(person)
                }
            }
            
            let chars = persons.sorted()
            
            
            // EPISODES
            var episodes = [Episode]()
            
            // Episodes Season 1
            episodes.append(Episode(title: "Winter is coming",
                                    emitOn: "09/05/2011",
                                    number: 1,
                                    chars: chars,
                                    season: season1))
            
            episodes.append(Episode(title: "The kingsroad",
                                    emitOn: "16/05/2011",
                                    number: 2,
                                    chars: chars,
                                    season: season1))
            
            season1.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 2
            episodes.append(Episode(title: "The North remembers",
                                    emitOn: "01/04/2012",
                                    number: 1,
                                    chars: chars,
                                    season: season2))
            episodes.append(Episode(title: "The night lands",
                                    emitOn: "08/04/2012",
                                    number: 2,
                                    chars: chars,
                                    season: season2))
            
            season2.add(episodes: episodes)
            episodes = []

            // Episodes Season 3
            episodes.append(Episode(title: "Valar Dohaeris",
                                    emitOn: "31/03/2013",
                                    number: 1,
                                    chars: chars,
                                    season: season3))
            episodes.append(Episode(title: "Dark wings, dark words",
                                    emitOn: "07/04/2013",
                                    number: 2,
                                    chars: chars,
                                    season: season3))
            
            season3.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 4
            episodes.append(Episode(title: "Two swords",
                                    emitOn: "06/04/2014",
                                    number: 1,
                                    chars: chars,
                                    season: season4))
            episodes.append(Episode(title: "The lion and the rose",
                                    emitOn: "13/04/2012",
                                    number: 2,
                                    chars: chars,
                                    season: season4))
            
            season4.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 5
            episodes.append(Episode(title: "The war to come",
                                    emitOn: "12/04/2015",
                                    number: 1,
                                    chars: chars,
                                    season: season5))
            episodes.append(Episode(title: "The house of black and white",
                                    emitOn: "19/04/2015",
                                    number: 2,
                                    chars: chars,
                                    season: season5))
            
            season5.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 6
            episodes.append(Episode(title: "The red woman",
                                    emitOn: "24/04/2016",
                                    number: 1,
                                    chars: chars,
                                    season: season6))
            episodes.append(Episode(title: "Home",
                                    emitOn: "01/05/2016",
                                    number: 2,
                                    chars: chars,
                                    season: season6))
            
            season6.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 7
            episodes.append(Episode(title: "Dragonstone",
                                    emitOn: "16/07/2017",
                                    number: 1,
                                    chars: chars,
                                    season: season7))
            episodes.append(Episode(title: "Stormborn",
                                    emitOn: "23/07/2017",
                                    number: 2,
                                    chars: chars,
                                    season: season7))
            
            season7.add(episodes: episodes)
            episodes = []
            
            
            return [season1, season2, season3, season4, season5, season6, season7].sorted()
            
        }
    }
    

    var houses : [House] {
        get {
            // Creamos nuestras casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSigil.jpg"), description: "Red three-headed dragon")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL)
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire and blood!",
                                  url: targaryenURL)
            
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
//            stark.add(person: robb)
//            stark.add(person: arya)
//            stark.add(person: eddard)
//            stark.add(person: sansa)
            stark.add(persons: robb, arya, eddard, sansa)
//            lannister.add(person: tywin)
//            lannister.add(person: jaime)
//            lannister.add(person: tyrion)
//            lannister.add(person: cersei)
            lannister.add(persons: tywin, jaime, tyrion, cersei)
//            targaryen.add(person: daenerys)
//            targaryen.add(person: viserys)
            targaryen.add(persons: daenerys, viserys)
            
            return [stark, lannister, targaryen].sorted()
        }
    }

    func house(named: String) -> House? {
        return houses.filter({ (house: House) -> Bool in
            return house.name == named
        }).first
    }
    
//    func char(named: String, house: String) -> Person? {
//        let casa = self.house(named: house)
//        return casa?.members.filter({ (person: Person) -> Bool in
//            return person.name == named
//        }).last
//    }
}


















