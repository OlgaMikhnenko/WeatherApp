//
//  CustomActivityView.swift
//  
//
//  Created by Helga on 05.12.22.
//

import UIKit

final class CustomActivityView: UIView {
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "sun.max.fill")
            imageView.tintColor = .yellow
        } else {
            imageView.backgroundColor = .yellow
        }
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomActivityView {
    private func setUpLayout() {
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}

extension CustomActivityView {
    func startAnimating() {
        let duration = 1.0
        if backgroundImage.layer.animation(forKey: "animatingView") == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float(.pi * 2.0)
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity

            backgroundImage.layer.add(rotationAnimation, forKey: "animatingView")
        }
    }
    
    func stopAnimating() {
        if backgroundImage.layer.animation(forKey: "animatingView") != nil {
            backgroundImage.layer.removeAnimation(forKey: "animatingView")
        }
    }
}

