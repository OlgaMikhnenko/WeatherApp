//
//  HourForecastCell.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

extension HourForecastCell {
    struct ViewModel: CellRepresentable {
        let time: String?
        let icon: UIImage?
        let temperature: Int
    }
}

final class HourForecastCell: UICollectionViewCell {
    private enum Constants: Grid { }
    
    private let timeLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayXS500
        return label
    }()
    
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView(withShadow: true)
        imageView.tintColor = Colors.Inverse.inverseA00
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayXS500
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ViewModel) {
        timeLabel.text = model.time
        weatherIcon.image = model.icon
        temperatureLabel.text = "\(model.temperature)°"
    }
    
    private func setUpLayout() {
        [
            timeLabel,
            weatherIcon,
            temperatureLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherIcon.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: Constants.xsSpace),
            weatherIcon.widthAnchor.constraint(equalToConstant: Constants.mSize.width),
            weatherIcon.heightAnchor.constraint(equalToConstant: Constants.mSize.height),
            weatherIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: Constants.xsSpace),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
