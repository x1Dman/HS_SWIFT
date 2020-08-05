//
//  CardCollectionViewCell.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var presenter: CardPresenterProtocol!
    var cardImage = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cardImage)
        setConstraintsCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension CardCollectionViewCell : CardsCollectionViewCellProtocol {
    func cellUpdate(index: Int) {
        presenter.loadImage(withIndex: index)
    }
    
    func setViewCell() {
        contentView.addSubview(cardImage)
    }
    
    func setConstraintsCell() {
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardImage.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
