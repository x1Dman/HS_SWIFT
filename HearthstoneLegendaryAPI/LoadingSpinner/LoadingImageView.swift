//
//  LoadingImageView.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 25.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

final class LoadingImageView: UIImageView, LoadingProtocol {
    private let loadingImage = UIImage(named: "loadingSpinner")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .black
        image = loadingImage
    }
    
    func startLoading() {
        alpha = 0.25
    }
    
    func stopLoading() {
        alpha = 1
        image = UIImage.gif(asset: "giphy-2")
    }
    
    func stopLoadingError() {
        
    }
}
