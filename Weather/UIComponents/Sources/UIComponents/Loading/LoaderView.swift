//
//  LoaderView.swift
//  
//
//  Created by Helga on 05.12.22.
//

import UIKit

public class LoaderView: UIView {
    
    private enum Constants: Grid { }
    
    let shadowView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    let indicator = CustomActivityView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension LoaderView {
    private func setUpView() {
        [
            shadowView,
            indicator
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            shadowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            shadowView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo:centerXAnchor),
            indicator.heightAnchor.constraint(equalToConstant: Constants.xxlSize.height),
            indicator.widthAnchor.constraint(equalToConstant: Constants.xxlSize.width)
            
        ])
    }
}

extension LoaderView {
    func showLoaderView() {
        sendSubviewToBack(shadowView)
        indicator.startAnimating()
    }
    
    func hideLoaderView() {
        indicator.stopAnimating()
    }
    
}
