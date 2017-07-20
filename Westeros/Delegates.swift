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
        
        // DEBERES
        
        return ArrayTableViewDelegate(model: model, controller: { (house: House) -> () in
            
            let elementVC = HouseViewController(model: house)
            nav.pushViewController(elementVC, animated: true)
            
            //let nav = UIApplication.shared.keyWindow?.rootViewController?.navigationController
            //nav?.pushViewController(elementVC, animated: true)
            
        })
    }
    
}
























