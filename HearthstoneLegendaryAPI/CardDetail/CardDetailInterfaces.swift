//
//  CardDetailInterfaces.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol CardDetailWireframeInterface: WireframeInterface {
    func moveTo(withStringUrl url: String)
}

protocol CardDetailViewInterface: ViewInterface {
    func setView()
    func setConstraints()
    
    var cardImage: UIImageView { get set }
    var cardDescription: UILabel { get set }
}

protocol CardDetailPresenterInterface: PresenterInterface {
    func configureView()
    func move()
}

protocol CardDetailInteractorInterface: InteractorInterface {
    var cards: Card { get set }
}
