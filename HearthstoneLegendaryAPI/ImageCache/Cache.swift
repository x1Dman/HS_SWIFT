//
//  ImageCache.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 20.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

struct Config {
    var memoryLimit: Int
    var countLimit: Int
    
    static let defaultConfig = Config(memoryLimit: 100, countLimit: 1024 * 1024 * 100) // 100 mb
    
}



final class Cache: URLCashable {
    
    private lazy var cache: NSCache<NSURL, AnyObject> = {
        let cache = NSCache<NSURL, AnyObject>()
        cache.totalCostLimit = config.memoryLimit
        return cache
    }()
    
    private let lock = NSLock()
    private let config: Config
    
    init(config: Config = .defaultConfig) {
        self.config = config
    }
    
    func update(_ data: AnyObject?, for url: URL) {
        guard let data = data else {
            return remove(by: url)
        }
        lock.lock()
        defer { lock.unlock() }
        let url = url as NSURL
        cache.setObject(data, forKey: url)
    }

    func get(by url: URL) -> AnyObject? {
        lock.lock()
        defer { lock.unlock() }
        let url = url as NSURL
        if let cached = cache.object(forKey: url) {
            return cached
        } else {
            return nil
        }
    }
    
    func insert(_ data: AnyObject?, for url: URL) {
        guard let data = data else {
            return
        }
        lock.lock()
        defer { lock.unlock() }
        let url = url as NSURL
        cache.setObject(data, forKey: url)
    }
    
    func remove(by url: URL) {
        lock.lock()
        defer { lock.unlock() }
        let url = url as NSURL
        cache.removeObject(forKey: url)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
    
    subscript(key: URL) -> AnyObject? {
        get {
            let url = key as NSURL
            return cache.object(forKey: url)
        }
        set {
            return insert(newValue, for: key)
        }
    }
    
    
}
