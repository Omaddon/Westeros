//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 18/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    var model : [House]
    
    init(model: [House]) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Westeros"
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
        let house = model[indexPath.row]
        
        // Crear una celda
        let cellID = "HouseCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // Creamos la celda
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.textLabel?.text = "House \(house.name)"
        cell?.imageView?.image = house.sigil.image
        cell?.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    
    //MARK: - TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let house = model[indexPath.row]
        
        let houseVC = HouseViewController(model: house)
        
        self.navigationController?.pushViewController(houseVC, animated: true)
    }
    
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    //    }
    
}



























