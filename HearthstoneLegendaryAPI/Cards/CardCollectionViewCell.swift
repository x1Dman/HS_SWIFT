//
//  CardCollectionViewCell.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var presenter: CardsPresenterProtocol!
    
    private var cardImage = UIImageView()
    private var cardLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CardCollectionViewCell : CardsCollectionViewCellProtocol {
    func setViewCell() {
        cardLabel.text = "Just a text"
    }
    
    func setConstraintsCell() {
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardImage.bottomAnchor.constraint(equalTo: cardLabel.topAnchor),
            cardImage.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor),
            cardLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
