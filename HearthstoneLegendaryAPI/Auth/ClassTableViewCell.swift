//
//  ClassTableViewCell.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 26.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell, AuthScreenViewCellInterface {
    
    private enum Constants {
        static let fontSize: CGFloat = 30
        static let borderWidth: CGFloat = 5
    }
    private let classTextView = UITextView()
    
    func setup(with text: String, imagePath: String) {
        addSubview(classTextView)
        guard let image = UIImage(named: imagePath) else { return }
        setupImage(image)
        setupTextView(text)
        setConstraints()
    }
    
    private func setupTextView(_ text: String) {
        classTextView.isUserInteractionEnabled = false
        classTextView.text = text
        classTextView.backgroundColor = .clear
        classTextView.font = .italicSystemFont(ofSize: Constants.fontSize)
        classTextView.textColor = .white
        classTextView.textAlignment = .center
        classTextView.textContainer.size = CGSize(width: frame.width, height: frame.height)
    }
    
    private func setupImage(_ image: UIImage) {
        let imageView = UIImageView()
        imageView.image = image
        backgroundView = imageView
        layer.cornerRadius = bounds.size.width / 4.0
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = Constants.borderWidth
        clipsToBounds = true
    }

    private func setConstraints() {
        classTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            classTextView.widthAnchor.constraint(equalTo: widthAnchor),
            classTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            classTextView.bottomAnchor.constraint(equalTo: bottomAnchor),
            classTextView.topAnchor.constraint(equalTo: topAnchor, constant: bounds.height / 2.0)
        ])
    }

}
