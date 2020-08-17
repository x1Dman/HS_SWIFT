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

    private var goldImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        guard let urlString = DetailCardData.instance.goldCardImage else {
            view.addSubview(goldImage)
            return
        }
        guard let url = URL(string: urlString) else {
            view.addSubview(goldImage)
            return
        }
        goldImage.load(url: url)
        view.addSubview(goldImage)
    }
    
    private func setConstraints() {
        goldImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goldImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            goldImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            goldImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            goldImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

