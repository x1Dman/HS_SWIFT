//
//  UIImageViewLoadFromURL.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 05.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit


// Loading images from internet by url
extension UIImageView {
    func load(url: URL, completion: @escaping (UIImage) -> () = { _ in }) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion(image)
                    }
                } else {
                    DispatchQueue.main.async {
                        print("Error")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    print("Error 2")
                }
            }
        }
    }
}
