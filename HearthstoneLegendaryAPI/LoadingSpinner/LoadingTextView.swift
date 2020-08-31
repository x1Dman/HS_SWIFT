//
//  LoadingTextView.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 25.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

final class LoadingTextView: UITextView, LoadingProtocol {
    
    private enum Constants {
        static let font = "Zapfino"
        static let startAnimationText = "Loading"
        static let stopAnimationText = ""
        static let connectionErrorText = "Connection error\n Can't receive access token"
        
        static let fontStartSize: CGFloat = 30
        static let fontStopSize: CGFloat = 15
        static let startAnimationAlpha: CGFloat = 0.25
        static let stopAnimationAlpha: CGFloat = 1
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        insertText(Constants.startAnimationText)
        font = UIFont(name: Constants.font, size: Constants.fontStartSize)
        textColor = .white
        textAlignment = .center
        backgroundColor = .black
    }
    
    func startLoading() {
        alpha = Constants.startAnimationAlpha
    }
    
    func stopLoading() {
        isHidden = true
    }
    
    func stopLoadingError() {
        font = UIFont(name: Constants.font, size: Constants.fontStopSize)
        text = Constants.connectionErrorText
    }
}
