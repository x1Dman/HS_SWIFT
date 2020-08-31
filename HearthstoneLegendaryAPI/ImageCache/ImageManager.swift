//
//  ImageManager.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 20.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//


// Обертка под AnyObject
// Обертка чтобы постоянно не писать lock/unlock
// Не совсем очевидно что в insert должно происходить удаление по урлу

import Foundation

/*
 IMAGE MANAGER
 CHECKS IF IMAGE IN THE CACHE:
    1) in cache -> returns it
    2) not in cache -> download it
 */

final class ImageManager {
    // cache
    private let cache: URLCashable
    // lets download using url
    private let downloader: URLDownloadable
    
    // has default setup for init
    init(cache: URLCashable = Cache(), downloader: URLDownloadable = Downloader()) {
        self.cache = cache
        self.downloader = downloader
    }
    
    func loadImage(from url: URL, completion: @escaping (AnyObject) -> () = { _ in }) {
        // check if image in cache
        if let data = cache[url] {
            completion(data)
        }
        // download it in other way
        _ = downloader.load(url: url){[weak self] data in
            self?.cache[url] = data
            completion(data)
        }
    }
}
