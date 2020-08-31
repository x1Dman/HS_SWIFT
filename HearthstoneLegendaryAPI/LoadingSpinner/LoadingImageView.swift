//
//  LoadingImageView.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 25.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

final class LoadingImageView: UIImageView, LoadingProtocol {
    
    private enum Constants {
        static let spinnerName = "loadingSpinner"
        static let gifName = "giphy-2"
        
        static let startAlpha: CGFloat = 0.25
        static let stopAlpha: CGFloat = 1
    }
    private let loadingImage = UIImage(named: Constants.spinnerName)
    
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
        alpha = Constants.startAlpha
    }
    
    func stopLoading() {
        alpha = Constants.stopAlpha
        image = UIImage.gif(asset: Constants.gifName)
    }
    
    func stopLoadingError() {
        
    }
}
