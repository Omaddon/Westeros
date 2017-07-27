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
    
    @objc func displayWiki() {
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: self.model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayPersons(recognizer: UITapGestureRecognizer) {
        
        
        let dataSource = DataSources.personDataSource(model: model.sortedMembers())
        let nav = self.navigationController
        let delegate = Delegates.personsDelegate(model: model.sortedMembers(), nav: nav!)
        let personsVC = ArrayTableViewController(dataSource  : dataSource,
                                                delegate    : delegate,
                                                title       : model.name,
                                                style       : .plain)

//        let personVC = PersonTableViewController(model: self.model)
        self.navigationController?.pushViewController(personsVC, animated: true)
        
    }
    
    func setupUI() {
        // Creamos un botón
        let wikiButton = UIBarButtonItem(title: "Wiki",
                                         style: .plain,
                                         target: self,
                                         action: #selector(displayWiki))
        
        let houseButton = UIBarButtonItem(title: "Members",
                                          style: .plain,
                                          target: self,
                                          action: #selector(displayPersons))
        
        // Añadimos el botón a la barra del navigationController
        navigationItem.rightBarButtonItems = [houseButton, wikiButton]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        syncViewWithModel()
    }
    
    // PARTE OPCIONAL IMPLEMENTADA POR MI
    
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(displayPersons))
        
        sigilImageView.isUserInteractionEnabled = true
        sigilImageView.addGestureRecognizer(tapGesture)
    }
    
}

























