//
//  FeelsLikeView.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

final class FeelsLikeView: UIView {
    private enum Constants: Grid { }
    
    private let headerIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "thermometer.medium")
        imageView.tintColor = Colors.Inverse.inverseA01
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA01
        label.font = Fonts.displayXS500
        label.text = AppStrings.FeelsLikeComponent.header.get().uppercased()
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayL500
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTemperature(_ temperature: Int) {
        temperatureLabel.text = "\(temperature) °"
    }
    
    private func setUpLayout() {
        backgroundColor = Colors.Neutral.neutralG400
        [
            headerIcon,
            headerLabel,
            temperatureLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            headerIcon.topAnchor.constraint(equalTo: topAnchor, constant: Constants.xsSpace),
            headerIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.xsSpace),
            headerIcon.widthAnchor.constraint(equalToConstant: Constants.sSize.width),
            headerIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            
            headerLabel.centerYAnchor.constraint(equalTo: headerIcon.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerIcon.trailingAnchor, constant: Constants.xsSpace),
            
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.xsSpace),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
