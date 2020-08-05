//
//  Cards.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 30.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

struct Cards: Codable {
    
    var cardCount: Int = 0
    var cards: [Card]?
    var page: Int = 0
    var pageCount: Int = 0
}
