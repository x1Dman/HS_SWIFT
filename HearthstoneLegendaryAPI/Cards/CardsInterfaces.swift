//
//  CardsInterfaces.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol CardsWireframeProtocol: WireframeInterface {
    func openDetailInfo(card: Card)
}

protocol CardsCollectionViewCellProtocol : ViewInterface {
    var cardImage: UIImageView { get set }
    func setViewCell()
    func setConstraintsCell()
    func cellUpdate(index: Int)
}

protocol CardsCollectionViewProtocol: ViewInterface {
    func setView()
    func setConstraints()
    func reload()
}

protocol CardsPresenterProtocol: PresenterInterface {
    // prepare view to show
    func configureView()
    // when user taps at the specific card
    func viewTapped(byIndex index: Int)
    // return number of cells
    func cellsCount() -> Int
    func url(byIndex index: Int) -> URL?
}

protocol CardPresenterProtocol: PresenterInterface {
    // prepare view to show
    func loadImage(withIndex: Int)
}

protocol CardsInteractorProtocol: InteractorInterface {
    var cards: Cards? { get set }
    
    // download the cards with API;
    // return JSON
    func fetchData(completion: @escaping () -> ())
}
