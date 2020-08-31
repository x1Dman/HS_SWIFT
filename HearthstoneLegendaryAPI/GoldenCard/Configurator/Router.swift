//
//  Configurator.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 14.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

/*
 Use for routing the views in app
*/
final public class Router: RouterProtocol {
    static let instance = Router()
    private var navigationController = UINavigationController()
    
    func setNavigationController(_ navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func route(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    func rollBack() {
        navigationController.popViewController(animated: true)
    }
}
