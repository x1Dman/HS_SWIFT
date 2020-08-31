//
//  GoldenCardViewController.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 14.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit
/*
 VIEW FOR SHOWING GOLDEN VERSION OF CARD
 CARD MAY NOT HAVE GOLDEN VERSION
*/
final class GoldenCardViewController: UIViewController {
    
    var goldImageUrl = ""
    private var card3D: Card3DView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        let url = URL(string: goldImageUrl)
        setup3DCard(url: url)
    }
    
    private func setup3DCard(url: URL?) {
        card3D = Card3DView(frame: CGRect(), withUrl: url)
        card3D.layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        view.addSubview(card3D)
    }
    
    private func setConstraints() {
        card3D.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card3D.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            card3D.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            card3D.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            card3D.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
}
