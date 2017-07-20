//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 19/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate {
    
    typealias Elements = [Element]
    typealias ControllerMaker = (Element) -> ()
    
    private let _model       : Elements
    private let _controller  : ControllerMaker
    
    
    init(model: Elements, controller: @escaping ControllerMaker) {
        (_model, _controller) = (model, controller)
        
        super.init()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // DEBERES
        
        let element = _model[indexPath.row]
        _controller(element)
        
    }
    
}






























