//
//  ImageDownloader.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 21.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import Foundation

class Downloader: URLDownloadable {
    func load(url: URL, completion: @escaping (AnyObject) -> () = { _ in }) -> AnyObject? {
        DispatchQueue.global().async { 
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(data as AnyObject)
                }
            }
        }
        return nil
    }
}
