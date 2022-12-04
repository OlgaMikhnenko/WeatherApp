//
//  DayForecastCell.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

extension DayForecastCell {
    struct ViewModel: CellRepresentable {
        let day: String?
        let icon: UIImage?
        let temperatureMin: Int
        let temperatureMax: Int
    }
}

final class DayForecastCell: UITableViewCell {
    private enum Constants: Grid { }
    
    private let dayNameLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayM500
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView(withShadow: true)
        imageView.tintColor = Colors.Inverse.inverseA00
        return imageView
    }()
    
    private let temperatureMinLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA01
        label.font = Fonts.displayS500
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let imageView = UIImageView(withShadow: true)
        imageView.tintColor = Colors.Inverse.inverseA00
        imageView.image = UIImage(systemName: "arrow.left.arrow.right")
        return imageView
    }()
    
    private let temperatureMaxLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayS500
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ViewModel) {
        dayNameLabel.text = model.day
        weatherIcon.image = model.icon
        temperatureMinLabel.text = "\(model.temperatureMin)°"
        temperatureMaxLabel.text = "\(model.temperatureMax)°"
    }
    
    private func setUpLayout() {
        backgroundColor = .clear
        selectionStyle = .none
        [
            dayNameLabel,
            weatherIcon,
            temperatureMinLabel,
            arrowIcon,
            temperatureMaxLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            dayNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dayNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.mSpace),
            
            weatherIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: Constants.mSize.width),
            weatherIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            weatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.xxxlSpace),
            
            temperatureMinLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperatureMinLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor, constant: -Constants.lSpace),
            
            arrowIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: Constants.lSize.width),
            arrowIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            arrowIcon.trailingAnchor.constraint(equalTo: temperatureMaxLabel.leadingAnchor, constant: -Constants.lSpace),
            
            temperatureMaxLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            temperatureMaxLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.lSpace),
        ])
    }
}

