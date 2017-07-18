//
//  PersonTableViewController.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 18/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController {
        
    var model : House
    
    init(model: House) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - TableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Casa a mostrar
        let person = model.sortedMembers()[indexPath.row]
        
        // Crear una celda
        let cellID = "PersonCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // Creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.textLabel?.text = "\(person.name) \(model.name)"
        
        return cell!
    }
    
}
