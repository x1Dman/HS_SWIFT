//
//  JSONParseable.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 27.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

protocol JSONParseable {
    func jsonParser(urlString: String, completionHandler: @escaping (_ cards: Cards?, _ error: JSONError) -> ())
}
