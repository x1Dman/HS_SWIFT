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

final class ImageManager {
    private let cache: URLCashable
    private let downloader: URLDownloadable
    
    init(cache: URLCashable = Cache(), downloader: URLDownloadable = Downloader()) {
        self.cache = cache
        self.downloader = downloader
    }
    
    func loadImage(from url: URL, completion: @escaping (AnyObject) -> () = { _ in }) {
        if let data = cache[url] {
            print("wow it's in cache")
            completion(data)
        }
        
        _ = downloader.load(url: url){[weak self] data in
            self?.cache[url] = data
            completion(data)
        }
    }
}
