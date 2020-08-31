//
//  UIImageViewLoadFromURL.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 05.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

enum DownloadImageError: String, Error {
    case dataToImageError = "Error: can't cast data to UIImage"
    case urlToDataError = "Error: can't get data from URL"
}

// Loading images from internet by url
extension UIImageView {
    func load(url: URL, completion: @escaping (Result<UIImage, DownloadImageError>) -> () = { _ in }) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion(.success(image))
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(.dataToImageError))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(.urlToDataError))
                }
            }
        }
    }
}
