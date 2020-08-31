//
//  Card3DView.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 19.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

/*
    View that works with transorms
    simple two 3D planes that have 1 metrics distance
    one is filled with card back, second with card (may not have one)
*/

class Card3DView: UIView {
    
    private enum Constants {
        static let keyPathAnimation = "transform"
    }
    
    private let card = CATransformLayer()
    private var animation = CABasicAnimation(keyPath: Constants.keyPathAnimation)
    private var cardImage = UIImageView()
    
    
    init(frame: CGRect, withUrl url: URL?) {
        super.init(frame: frame)
        guard let url = url else {
            // case where url is incorrect
            cardImage.image = UIImage(named: "3D")
            setup()
            return
        }
        cardImage.load(url: url) {[weak self] result in
            switch result {
            case .success(let image):
                self?.cardImage.image = image
                self?.setup()
            case .failure(let downloadImageError):
                print(downloadImageError.rawValue)
            }
        }
    }
    
    private func setup() {
        setupAnimation()
        setupCube()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAnimation()
        setupCube()
        setupView()
    }
    
    private func face(with transform: CATransform3D, color: UIColor = .black, width: CGFloat = 100, height: CGFloat = 100) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -100, y: -100, width: height, height: width)
        face.backgroundColor = color.cgColor
        face.transform = transform
        return face
    }
    
    private func setupCube() {
        // height is this case is the width
        let front = CATransform3DMakeTranslation(0, 0, 0.5)
        // to make it usable with image
        let cardFront = face(with: front, width: 400, height: 200)
        cardFront.contents = cardImage.image?.cgImage
        card.addSublayer(cardFront)
        
        // using the same transforms for back plane
        let transform5 = CATransform3DMakeTranslation(0, 0, -0.5)
        let back = CATransform3DRotate(transform5, CGFloat.pi, 0, 1, 0)
        let cardBack = face(with: back, width: 400, height: 200)
        cardBack.contents = UIImage(named: "CardBack")?.cgImage
        card.addSublayer(cardBack)
        
        // placed card at the middle of the view
        card.position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    
    private func setupAnimation() {
        animation.fromValue = card.transform
        animation.toValue = CATransform3DMakeRotation(CGFloat.pi, 0, 1, 0)
        animation.duration = 2
        animation.isCumulative = true
        animation.repeatCount = .greatestFiniteMagnitude
        card.add(animation, forKey: "Constants.keyPathAnimation")
    }
    
    private func setupView() {
        layer.addSublayer(card)
    }
}
