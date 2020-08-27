//
//  Heroes.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 26.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

enum Hero: Int {
    case druid
    case warlock
    case warrior
    case hunter
    case rogue
    case priest
    case demonHunter
    case shaman
    case paladin
    case mage
    
    // need to optimize code and set the GIF/Image path in one place
    var path: String {
        switch self {
        case .demonHunter:
            return "dh"
        case .druid:
            return "druid"
        case .mage:
            return "mage"
        case .rogue:
            return "rogue"
        case .priest:
            return "priest"
        case .shaman:
            return "shaman"
        case .warlock:
            return "warlock"
        case .warrior:
            return "warrior"
        case .hunter:
            return "hunter"
        case .paladin:
            return "paladin"
        default:
            return "3D"
        }
    }
    // returns the name of a hero class
    var className: String {
        switch self {
        case .demonHunter:
            return "Demon Hunter"
        case .druid:
            return "Druid"
        case .mage:
            return "Mage"
        case .rogue:
            return "Rogue"
        case .priest:
            return "Priest"
        case .shaman:
            return "Shaman"
        case .warlock:
            return "Warlock"
        case .warrior:
            return "Warrior"
        case .hunter:
            return "Hunter"
        case .paladin:
            return "Paladin"
        default:
            return "3D"
        }
    }
    
    var apiClassName: String {
        switch self {
        case .demonHunter:
            return "dh"
        case .druid:
            return "druid"
        case .mage:
            return "mage"
        case .rogue:
            return "rogue"
        case .priest:
            return "priest"
        case .shaman:
            return "shaman"
        case .warlock:
            return "warlock"
        case .warrior:
            return "warrior"
        case .hunter:
            return "hunter"
        case .paladin:
            return "paladin"
        default:
            return "unknown"
        }
    }
}
