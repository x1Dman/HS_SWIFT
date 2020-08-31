//
//  DetailCardData.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 17.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

// service for keeping the images of selected card
final class DetailCardData {
    
    static let instance = DetailCardData()
    
    var cardImage: String = ""
    var goldCardImage: String? = ""
}
