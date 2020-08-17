//
//  Configurator.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 14.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

final public class Configurator: ConfiguratorProtocol {
    static let conf = Configurator()
    private var navigationController = UINavigationController()
    
    func setNavigationController(_ navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func configure(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
