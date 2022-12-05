//
//  LoadingSupportableProtocol.swift
//  
//
//  Created by Helga on 05.12.22.
//

import UIKit

public protocol LoadingSupportableProtocol {
    
    var loaderView: LoaderView { get }
    
    func configureLoaderView()
    func showLoaderView()
    func hideLoaderView()
    
}

public extension LoadingSupportableProtocol where Self: UIViewController {
    
    func configureLoaderView() {
        view.addSubview(loaderView)
        loaderView.isHidden = true
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func showLoaderView() {
        loaderView.isHidden = false
        loaderView.showLoaderView()
    }
    
    func hideLoaderView() {
        loaderView.isHidden = true
        loaderView.hideLoaderView()
    }
   
}

