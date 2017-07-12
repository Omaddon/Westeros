//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by MIGUEL JARDÓN PEINADO on 12/7/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController.init(rootViewController: self)
        return nav
    }
}
