//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 19/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model      : Elements
    private let _cellMaker  : CellMaker
    
    
    // El @scaping es para manejar clausuras que se escapan, es decir, que el compilador
    // no sabe si dicha clausura va a ser usada en otra parte
    init(model: Elements, cellMake: @escaping CellMaker) {
        (_model, _cellMaker) = (model, cellMake)
        
        super.init()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let element = _model[indexPath.row]
        return _cellMaker(element, tableView)
    }

}
























