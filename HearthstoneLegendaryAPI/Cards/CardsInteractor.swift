//
//  CardsInteractor.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class CardsInteractor {
    private let network = NetworkService()
    private weak var presenter: CardsPresenterProtocol?
    var cards: Cards?
}

// MARK: - Extensions -

extension CardsInteractor: CardsInteractorProtocol {
    
    func fetchData(completion: @escaping () -> ()) {
        self.network.jsonParser{cards, error in
            switch error {
            case .none:
                DispatchQueue.main.async {
                    self.cards = cards
                    completion()
                }
            default:
                DispatchQueue.main.async {
                    self.cards = nil
                    completion()
                }
            }
        }
    }
}
