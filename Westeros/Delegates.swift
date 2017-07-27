//
//  Delegates.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 19/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

final class Delegates {
    
    static func housesDelegate(model: [House],
                               nav: UINavigationController) -> ArrayTableViewDelegate<House> {
        
        
        return ArrayTableViewDelegate(model: model, controller: { (house: House) -> () in
            
            let elementVC = HouseViewController(model: house)
            nav.pushViewController(elementVC, animated: true)
            
            //let nav = UIApplication.shared.keyWindow?.rootViewController?.navigationController
            //nav?.pushViewController(elementVC, animated: true)
            
        })
    }
    
    static func personsDelegate(model: [Person],
                                nav: UINavigationController) -> ArrayTableViewDelegate<Person> {
        
        return ArrayTableViewDelegate(model: model, controller: { (person: Person) in
            
            // Cuado se pulsa en una celda de PersonTableViewController, no navega más
            
        })
    }
    
    static func seasonDelegate(model: [Season],
                               nav: UINavigationController) -> ArrayTableViewDelegate<Season> {
        
        return ArrayTableViewDelegate(model: model, controller: { (season: Season) -> () in
            
            let dataSource = DataSources.episodesDataSource(model: season.sortedMembers())
            let delegate = Delegates.episodesDelegate(model: season.sortedMembers(), nav: nav)
            let elementVC = ArrayTableViewController(dataSource: dataSource,
                                                     delegate: delegate,
                                                     title: season.name,
                                                     style: .plain)
            
            nav.pushViewController(elementVC, animated: true)
            
            
        })
        
    }
    
    static func episodesDelegate(model: [Episode],
                                 nav: UINavigationController) -> ArrayTableViewDelegate<Episode>{
        
        return ArrayTableViewDelegate(model: model, controller: { (episode: Episode) in
            
            let dataSource = DataSources.personDataSource(model: episode.sortedMembers())
            let delegate = Delegates.personsDelegate(model: episode.sortedMembers(),
                                                     nav: nav)
            let elementVC = ArrayTableViewController(dataSource: dataSource,
                                                     delegate: delegate,
                                                     title: "Episode \(episode.number) - Characters",
                                                     style: .plain)
            
            nav.pushViewController(elementVC, animated: true)
            
        })
        
    }
    
}
























