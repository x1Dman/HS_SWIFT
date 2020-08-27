//
//  ImageDownloadable.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 21.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

protocol URLDownloadable {
    func load(url: URL, completion: @escaping (AnyObject) -> ()) -> AnyObject?
}
