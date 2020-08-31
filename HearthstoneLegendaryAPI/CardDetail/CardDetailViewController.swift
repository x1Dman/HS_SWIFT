//
//  CardDetailViewController.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright (c) 2020 18579118. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CardDetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: CardDetailPresenterInterface!
    
    // MARK: - private properties -
    private struct Constants {
        static let buttonTitle = "Show gold"
        static let buttonHeight: CGFloat = 6.0
        static let numberOfLines = 0
    }
    
    var cardImage = UIImageView()
    var cardDescription = UILabel()
    var goldButton = UIButton(frame: CGRect())
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configureView()
    }

}

// MARK: - Extensions -

extension CardDetailViewController: CardDetailViewInterface {
    func setView() {
        view.backgroundColor = .black
        view.addSubview(goldButton)
        view.addSubview(cardDescription)
        view.addSubview(cardImage)
        
        cardDescription.numberOfLines = Constants.numberOfLines
        cardDescription.sizeToFit()
        cardDescription.textAlignment = .center
        
        goldButton.setTitle(Constants.buttonTitle, for: .normal)
        goldButton.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
    }
    
    @objc func imageTapped() {
        // go to next view to show gold card
        presenter.move()
    }
    
    func setConstraints() {
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardImage.widthAnchor.constraint(equalTo: view.widthAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 2.0),
            cardImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        cardDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardDescription.topAnchor.constraint(equalTo: cardImage.bottomAnchor),
            cardDescription.widthAnchor.constraint(equalTo: view.widthAnchor),
            cardDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardDescription.bottomAnchor.constraint(equalTo: goldButton.topAnchor)
        ])
        
        goldButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goldButton.heightAnchor.constraint(equalToConstant: view.frame.height / Constants.buttonHeight),
            goldButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            goldButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            goldButton.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
