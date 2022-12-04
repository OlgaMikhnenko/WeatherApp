//
//  SunTimingView.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

final class SunTimingView: UIView {
    private enum Constants: Grid { }
    
    private let headerIcon: UIImageView = {
        let imageView = UIImageView(withShadow: true)
        imageView.image = UIImage(systemName: "sun.and.horizon")
        imageView.tintColor = Colors.Inverse.inverseA01
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA01
        label.font = Fonts.displayXS500
        label.text = AppStrings.SunMovementComponent.header.get().uppercased()
        return label
    }()
    
    private let sunriseLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayS500
        return label
    }()
    
    private let sunsetLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayS500
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTimes(
        sunrise: String,
        sunset: String
    ) {
        sunriseLabel.text = AppStrings.SunMovementComponent.sunrise.get() + ": \(sunrise)"
        sunsetLabel.text = AppStrings.SunMovementComponent.sunset.get() + ": \(sunset)"
    }
    
    private func setUpLayout() {
        backgroundColor = Colors.Neutral.neutralG400
        [
            headerIcon,
            headerLabel,
            sunriseLabel,
            sunsetLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            headerIcon.topAnchor.constraint(equalTo: topAnchor, constant: Constants.xsSpace),
            headerIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.xsSpace),
            headerIcon.widthAnchor.constraint(equalToConstant: Constants.mSize.width),
            headerIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            
            headerLabel.centerYAnchor.constraint(equalTo: headerIcon.centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: headerIcon.trailingAnchor, constant: Constants.xsSpace),
            
            sunriseLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.xxsSpace),
            sunriseLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sSpace),
            
            sunsetLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.mSpace),
            sunsetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sSpace)
            
        ])
    }
}

