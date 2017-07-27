//
//  DataSources.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 19/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

final class DataSources {
    
    static func houseDataSource(model: [House]) -> ArrayDataSource<House> {
        return ArrayDataSource(model: model, cellMake: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "HouseCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
        })
    }
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person> {
        return ArrayDataSource(model: model, cellMake: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "PersonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            
            return cell!
        })
    }
    
    static func seasonDataSource(model: [Season]) -> ArrayDataSource<Season> {
        return ArrayDataSource(model: model, cellMake: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "SeasonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = season.description
            cell?.detailTextLabel?.text = season.formatter.string(from: season.date)
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
            
        })
    }
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        return ArrayDataSource(model: model, cellMake: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "EpisodeCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = episode.description
            cell?.detailTextLabel?.text = episode.formatter.string(from: episode.emitOn)
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
            
        })
    }
}



































