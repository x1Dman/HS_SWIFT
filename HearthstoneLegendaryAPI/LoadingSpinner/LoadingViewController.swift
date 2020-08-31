//
//  LoadingViewController.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 25.08.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit

final class LoadingViewController: UIViewController, LoadingViewControllerProtocol {
    private var image: LoadingImageView = LoadingImageView(frame: CGRect.zero)
    private var text: LoadingTextView = LoadingTextView(frame: CGRect.zero, textContainer: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(image)
        view.addSubview(text)
        setConstraints()
    }
    
    private func setConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.widthAnchor.constraint(equalToConstant: view.bounds.width),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.0)
        ])
        
        text.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            text.widthAnchor.constraint(equalToConstant: view.bounds.width),
            text.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            text.heightAnchor.constraint(equalToConstant: view.bounds.height / 3.0)
        ])
    }
    
    private func rebuildConstraints() {
        text.translatesAutoresizingMaskIntoConstraints = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.0)
        ])
    }
    
    func start() {
        print("start")
        image.startLoading()
        text.startLoading()
    }
    
    func stop() {
        print("stop")
        rebuildConstraints()
        image.stopLoading()
        text.stopLoading()
    }
    
    func stopError() {
        image.stopLoadingError()
        text.stopLoadingError()
    }
}
