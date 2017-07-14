//
//  HouseViewController.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 11/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    let model : House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        self.title = model.name
    }
    
    // Requerido para evitar los nil durante los estados intermedios de la inicialización
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        // model -> view
        
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }    
}

























