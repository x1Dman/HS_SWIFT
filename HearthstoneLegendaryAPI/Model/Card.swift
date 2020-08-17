//
//  Card.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

struct Card: Codable {
    var name: String = ""
    var manaCost: Int = 0
    var image: String = ""
    var imageGold: String? = ""
    var text: String?
    var flavorText = ""
    
    //
    var health: Int = 0
    var attack: Int = 0
}
