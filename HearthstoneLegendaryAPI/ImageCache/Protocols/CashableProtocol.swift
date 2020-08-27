//
//  ImageCashable.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 20.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

protocol URLCashable: AnyObject {
    // Returns the image associated with a given url
    func get(by url: URL) -> AnyObject?
    // Inserts the image of the specified url in the cache
    func insert(_ data: AnyObject?, for url: URL)
    // Update current data by url
    func update(_ data: AnyObject?, for url: URL)
    // Removes the image of the specified url in the cache
    func remove(by url: URL)
    // Removes all images from the cache
    func removeAll()
    // Accesses the value associated with the given key for reading and writing
    subscript(_ key: URL) -> AnyObject? { get set }
}
