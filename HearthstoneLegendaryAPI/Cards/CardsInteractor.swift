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
    
    private let nc = NotificationCenter.default.publisher(for: NSNotification.Name("dataWasDownloaded"))
    private let headers = [
        "x-rapidapi-host": "omgvamp-hearthstone-v1.p.rapidapi.com",
        "x-rapidapi-key": "gf6PbcT2Gsmsh7sXlDSndOmOoB6vp1OB40BjsnufFTcxnINk4V"
    ]
    
    private let urlString = "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/qualities/Legendary?locale=ruRU&collectible=1&cost=5"
}

// MARK: - Extensions -

extension CardsInteractor: CardsInteractorProtocol {
    func fetchData() -> String {
        return ""
    }
}
