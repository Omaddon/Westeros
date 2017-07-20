//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 19/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource  : ArrayDataSource<Element>
    let delegate    : ArrayTableViewDelegate<Element>
    
    
    init(dataSource : ArrayDataSource<Element>,
         delegate   : ArrayTableViewDelegate<Element>,
         title      : String,
         style      : UITableViewStyle) {
        
        self.dataSource = dataSource
        self.delegate = delegate
        
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
























