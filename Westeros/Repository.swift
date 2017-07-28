//
//  Repository.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 12/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit


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
            let season1 = Season(name: "Season 1",
                                 date: "09/05/2011",
                                 image: UIImage(named: "season1.png")!)
            let season2 = Season(name: "Season 2",
                                 date: "01/04/2012",
                                 image: UIImage(named: "season2.png")!)
            let season3 = Season(name: "Season 3",
                                 date: "31/03/2013",
                                 image: UIImage(named: "season3.png")!)
            let season4 = Season(name: "Season 4",
                                 date: "06/04/2014",
                                 image: UIImage(named: "season4.png")!)
            let season5 = Season(name: "Season 5",
                                 date: "12/04/2015",
                                 image: UIImage(named: "season5.png")!)
            let season6 = Season(name: "Season 6",
                                 date: "24/04/2016",
                                 image: UIImage(named: "season6.png")!)
            let season7 = Season(name: "Season 7",
                                 date: "16/07/2017",
                                 image: UIImage(named: "season7.png")!)
            
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
                                    season: season1,
                                    image: UIImage(named: "1x1.jpg")!))
            
            episodes.append(Episode(title: "The kingsroad",
                                    emitOn: "16/05/2011",
                                    number: 2,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x2.jpg")!))
            
            episodes.append(Episode(title: "Lord Snow",
                                    emitOn: "23/05/2011",
                                    number: 3,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x3.jpg")!))
            
            episodes.append(Episode(title: "Cripples, Bastards, and Broken Things",
                                    emitOn: "30/05/2011",
                                    number: 4,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x4.jpg")!))
            
            episodes.append(Episode(title: "The Wolf and the Lion",
                                    emitOn: "06/06/2011",
                                    number: 5,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x5.jpg")!))
            
            episodes.append(Episode(title: "A Golden Crown",
                                    emitOn: "13/06/2011",
                                    number: 6,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x6.jpg")!))
            
            episodes.append(Episode(title: "You Win or You Die",
                                    emitOn: "20/06/2011",
                                    number: 7,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x7.jpg")!))
            
            episodes.append(Episode(title: "The Pointy End",
                                    emitOn: "27/06/2011",
                                    number: 8,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x8.jpg")!))
            
            episodes.append(Episode(title: "Baelor",
                                    emitOn: "04/07/2011",
                                    number: 9,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x9.jpg")!))
            
            episodes.append(Episode(title: "Fire and Blood",
                                    emitOn: "11/07/2011",
                                    number: 10,
                                    chars: chars,
                                    season: season1,
                                    image: UIImage(named: "1x10.jpg")!))

            
            season1.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 2
            episodes.append(Episode(title: "The North remembers",
                                    emitOn: "01/04/2012",
                                    number: 1,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x1.jpg")!))
            
            episodes.append(Episode(title: "The night lands",
                                    emitOn: "08/04/2012",
                                    number: 2,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x2.jpg")!))
            
            episodes.append(Episode(title: "What Is Dead May Never Die",
                                    emitOn: "15/04/2012",
                                    number: 3,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x3.jpg")!))
            
            episodes.append(Episode(title: "Garden of Bones",
                                    emitOn: "22/04/2012",
                                    number: 4,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x4.jpg")!))
            
            episodes.append(Episode(title: "The Ghost of Harrenhal",
                                    emitOn: "29/04/2012",
                                    number: 5,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x5.jpg")!))
            
            episodes.append(Episode(title: "The Old Gods and the New",
                                    emitOn: "06/05/2012",
                                    number: 6,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x6.jpg")!))
            
            episodes.append(Episode(title: "A Man Without Honor",
                                    emitOn: "13/05/2012",
                                    number: 7,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x7.jpg")!))
            
            episodes.append(Episode(title: "The Prince of Winterfell",
                                    emitOn: "20/05/2012",
                                    number: 8,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x8.jpg")!))
            
            episodes.append(Episode(title: "Blackwater",
                                    emitOn: "27/05/2012",
                                    number: 9,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x9.jpg")!))
            
            episodes.append(Episode(title: "Valar Morghulis",
                                    emitOn: "03/06/2012",
                                    number: 10,
                                    chars: chars,
                                    season: season2,
                                    image: UIImage(named: "2x10.jpg")!))
            
            season2.add(episodes: episodes)
            episodes = []

            // Episodes Season 3
            episodes.append(Episode(title: "Valar Dohaeris",
                                    emitOn: "31/03/2013",
                                    number: 1,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x1.jpg")!))
            episodes.append(Episode(title: "Dark wings, dark words",
                                    emitOn: "07/04/2013",
                                    number: 2,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x2.jpg")!))
            
            episodes.append(Episode(title: "Walk of Punishment",
                                    emitOn: "14/04/2013",
                                    number: 3,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x3.jpg")!))
            
            episodes.append(Episode(title: "And Now His Watch Is Ended",
                                    emitOn: "21/04/2013",
                                    number: 4,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x4.jpg")!))
            
            
            episodes.append(Episode(title: "Kissed by Fire",
                                    emitOn: "28/04/2013",
                                    number: 5,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x5.jpg")!))
            
            
            episodes.append(Episode(title: "The Climb",
                                    emitOn: "05/05/2013",
                                    number: 6,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x6.jpg")!))
            
            
            episodes.append(Episode(title: "The Bear and the Maiden Fair",
                                    emitOn: "12/05/2013",
                                    number: 7,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x7.jpg")!))
            
            
            episodes.append(Episode(title: "Second Sons",
                                    emitOn: "19/05/2013",
                                    number: 8,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x8.jpg")!))
            
            
            episodes.append(Episode(title: "The Rains of Castamere",
                                    emitOn: "02/06/2013",
                                    number: 9,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x9.jpg")!))
            
            
            episodes.append(Episode(title: "Mhysa",
                                    emitOn: "09/06/2013",
                                    number: 10,
                                    chars: chars,
                                    season: season3,
                                    image: UIImage(named: "3x10.jpg")!))
            
            
            season3.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 4
            episodes.append(Episode(title: "Two swords",
                                    emitOn: "06/04/2014",
                                    number: 1,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x1.jpg")!))
            
            episodes.append(Episode(title: "The lion and the rose",
                                    emitOn: "13/04/2014",
                                    number: 2,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x2.jpg")!))
            
            episodes.append(Episode(title: "Breaker of Chains",
                                    emitOn: "20/04/2014",
                                    number: 3,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x3.jpg")!))
            
            episodes.append(Episode(title: "Oathkeeper",
                                    emitOn: "27/04/2014",
                                    number: 4,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x4.jpg")!))
            
            episodes.append(Episode(title: "First of His Name",
                                    emitOn: "04/05/2014",
                                    number: 5,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x5.jpg")!))
            
            episodes.append(Episode(title: "The Laws of Gods and Men",
                                    emitOn: "11/05/2014",
                                    number: 6,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x6.jpg")!))
            
            episodes.append(Episode(title: "Mockingbird",
                                    emitOn: "18/05/2014",
                                    number: 7,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x7.jpg")!))
            
            episodes.append(Episode(title: "The Mountain and the Viper",
                                    emitOn: "01/06/2014",
                                    number: 8,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x9.jpg")!))
            
            episodes.append(Episode(title: "The Watchers on the Wall",
                                    emitOn: "08/06/2014",
                                    number: 9,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x9.jpg")!))
            
            episodes.append(Episode(title: "The Children",
                                    emitOn: "15/06/2014",
                                    number: 10,
                                    chars: chars,
                                    season: season4,
                                    image: UIImage(named: "4x10.jpg")!))
            
            season4.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 5
            episodes.append(Episode(title: "The war to come",
                                    emitOn: "12/04/2015",
                                    number: 1,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x1.jpg")!))
            
            episodes.append(Episode(title: "The house of black and white",
                                    emitOn: "19/04/2015",
                                    number: 2,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x2.jpg")!))
            
            episodes.append(Episode(title: "High Sparrow",
                                    emitOn: "26/04/2015",
                                    number: 3,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x3.jpg")!))
            
            episodes.append(Episode(title: "High Sparrow",
                                    emitOn: "03/05/2015",
                                    number: 4,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x4.jpg")!))
            
            episodes.append(Episode(title: "Kill the Boy",
                                    emitOn: "10/05/2015",
                                    number: 5,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x5.jpg")!))
            
            episodes.append(Episode(title: "Unbowed, Unbent, Unbroken",
                                    emitOn: "17/05/2015",
                                    number: 6,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x6.jpg")!))
            
            episodes.append(Episode(title: "The Gift",
                                    emitOn: "24/05/2015",
                                    number: 7,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x7.jpg")!))
            
            episodes.append(Episode(title: "Hardhome",
                                    emitOn: "31/05/2015",
                                    number: 8,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x8.jpg")!))
            
            episodes.append(Episode(title: "The Dance of Dragons",
                                    emitOn: "07/06/2015",
                                    number: 9,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x9.jpg")!))
            
            episodes.append(Episode(title: "Mother's Mercy",
                                    emitOn: "14/06/2015",
                                    number: 10,
                                    chars: chars,
                                    season: season5,
                                    image: UIImage(named: "5x10.jpg")!))
            
            
            season5.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 6
            episodes.append(Episode(title: "The red woman",
                                    emitOn: "24/04/2016",
                                    number: 1,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x1.jpg")!))
            
            episodes.append(Episode(title: "Home",
                                    emitOn: "01/05/2016",
                                    number: 2,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x2.jpg")!))
            
            episodes.append(Episode(title: "Oathbreaker",
                                    emitOn: "08/05/2016",
                                    number: 3,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x3.jpg")!))
            
            episodes.append(Episode(title: "Book of the Stranger",
                                    emitOn: "15/05/2016",
                                    number: 4,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x4.jpg")!))
            
            episodes.append(Episode(title: "The Door",
                                    emitOn: "22/05/2016",
                                    number: 5,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x5.jpg")!))
            
            episodes.append(Episode(title: "Blood of My Blood",
                                    emitOn: "29/05/2016",
                                    number: 6,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x6.jpg")!))
            
            episodes.append(Episode(title: "The Broken Man",
                                    emitOn: "05/06/2016",
                                    number: 7,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x7.jpg")!))
            
            episodes.append(Episode(title: "No One",
                                    emitOn: "12/06/2016",
                                    number: 8,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x8.jpg")!))
            
            episodes.append(Episode(title: "Battle of the Bastards",
                                    emitOn: "19/06/2016",
                                    number: 9,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x9.jpg")!))
            
            episodes.append(Episode(title: "The Winds of Winter",
                                    emitOn: "26/06/2016",
                                    number: 10,
                                    chars: chars,
                                    season: season6,
                                    image: UIImage(named: "6x10.jpg")!))
            
            
            season6.add(episodes: episodes)
            episodes = []
            
            // Episodes Season 7
            episodes.append(Episode(title: "Dragonstone",
                                    emitOn: "16/07/2017",
                                    number: 1,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "7x1.jpg")!))
            
            episodes.append(Episode(title: "Stormborn",
                                    emitOn: "23/07/2017",
                                    number: 2,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "7x2.jpg")!))
            
            episodes.append(Episode(title: "The Queen's Justice",
                                    emitOn: "30/07/2017",
                                    number: 3,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "7x3.jpg")!))
            
            episodes.append(Episode(title: "The Spoils of War",
                                    emitOn: "06/08/2017",
                                    number: 4,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "7x4.jpg")!))
            
            episodes.append(Episode(title: "Episode #7.5",
                                    emitOn: "13/08/2017",
                                    number: 5,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "noimage.jpg")!))
            
            episodes.append(Episode(title: "Episode #7.6",
                                    emitOn: "20/08/2017",
                                    number: 6,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "noimage.jpg")!))
            
            episodes.append(Episode(title: "Episode #7.7",
                                    emitOn: "27/08/2017",
                                    number: 7,
                                    chars: chars,
                                    season: season7,
                                    image: UIImage(named: "noimage.jpg")!))
            
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
            
            let robb = Person(name: "Robb",
                              alias: "The young wolf",
                              house: stark,
                              url: URL(string: "https://awoiaf.westeros.org/index.php/Robb_Stark"),
                              image: UIImage(named: "robbStark.png")!)
            let arya = Person(name: "Arya",
                              house: stark,
                              url: URL(string: "https://awoiaf.westeros.org/index.php/Arya_Stark"),
                              image: UIImage(named: "aryaStark.png")!)
            let eddard = Person(name: "Eddard",
                                alias: "The king in the North",
                                house: stark,
                                url: URL(string: "https://awoiaf.westeros.org/index.php/Eddard_Stark"),
                                image: UIImage(named: "eddardStark.png")!)
            let sansa = Person(name: "Sansa",
                               house: stark,
                               url: URL(string: "https://awoiaf.westeros.org/index.php/Sansa_Stark"),
                               image: UIImage(named: "sansaStark.png")!)
            
            let tywin = Person(name: "Tywin",
                               alias: "The Lion of Lannister",
                               house: lannister,
                               url: URL(string: "https://awoiaf.westeros.org/index.php/Tywin_Lannister"),
                               image: UIImage(named: "tywinLannister.jpg")!)
            let jaime = Person(name: "Jaime",
                               alias: "Kingslayer",
                               house: lannister,
                               url: URL(string: "https://awoiaf.westeros.org/index.php/Jaime_Lannister"),
                               image: UIImage(named: "jaimeLannister.jpg")!)
            let tyrion = Person(name: "Tyrion",
                                alias: "The Imp",
                                house: lannister,
                                url: URL(string: "https://awoiaf.westeros.org/index.php/Tyrion_Lannister"),
                                image: UIImage(named: "tyrionLannister.jpg")!)
            let cersei = Person(name: "Cersei",
                                house: lannister,
                                url: URL(string: "https://awoiaf.westeros.org/index.php/Cersei_Lannister"),
                                image: UIImage(named: "cerseiLannister.png")!)
            
            let daenerys = Person(name: "Daenerys",
                                  alias: "Khaleesi",
                                  house: targaryen,
                                  url: URL(string: "https://awoiaf.westeros.org/index.php/Daenerys_Targaryen"),
                                  image: UIImage(named: "daenerysTargaryen.png")!)
            let viserys = Person(name: "Viserys",
                                 alias: "The beggar king",
                                 house: targaryen,
                                 url: URL(string: "https://awoiaf.westeros.org/index.php/Viserys_Targaryen"),
                                 image: UIImage(named: "viserysTargaryen.png")!)
            
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


















