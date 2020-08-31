//
//  Cards.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 30.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

/*
 CARDS
 Made for decode JSON data from blizzard REST API
 */

struct Cards: Codable {
    var cards: [Card]?
}
