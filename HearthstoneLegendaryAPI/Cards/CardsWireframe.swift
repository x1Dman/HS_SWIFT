//
//  CardsWireframe.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CardsWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        // ViewFlowLayout ???? instead of ViewLayout
        let moduleViewController = CardsCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        super.init(viewController: moduleViewController)

        let interactor = CardsInteractor()
        let viewCell = CardCollectionViewCell()
        let presenter = CardsPresenter(view: moduleViewController, interactor: interactor, wireframe: self, viewCell: viewCell)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension CardsWireframe: CardsWireframeProtocol {
    func openDetailInfo(card: Card) {
        let cardDetailWireframe = CardDetailWireframe(withCard: card)
        viewController.show(cardDetailWireframe.viewController, sender: self)
    }
}
