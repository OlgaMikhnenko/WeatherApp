//  
//  MainView.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit
import UIComponents

extension MainView {
    struct ViewModel {
        let location: String
        let temperature: Int
        let description: String?
        let feelsLike: Int
        let sunriseTime: String?
        let sunsetTime: String?
        let weatherState: WeatherState
    }
}

final class MainView: UIView {
    private enum Constants: Grid {
        static let hoursForecastCollectionViewHeight: CGFloat = 120
        static let daysForecastCollectionViewHeight: CGFloat = 600
        static let mapViewHeight: CGFloat = 300
        static let additionalInfoCornerRadius: CGFloat = 16
    }
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayL500
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayXL500
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(withShadow: true)
        label.textColor = Colors.Inverse.inverseA00
        label.font = Fonts.displayM500
        return label
    }()
    
    lazy var hoursForecastCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
//        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.ViewModel.reuseIdentifier)
        return collectionView
    }()
    
    lazy var daysForecastCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
//        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.ViewModel.reuseIdentifier)
        return collectionView
    }()
    
    lazy var mapView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var feelsLikeView: FeelsLikeView = {
        let view = FeelsLikeView()
        view.layer.cornerRadius = Constants.additionalInfoCornerRadius
        return view
    }()
    
    private lazy var sunTimingView: SunTimingView = {
        let view = SunTimingView()
        view.layer.cornerRadius = Constants.additionalInfoCornerRadius
        return view
    }()
    
    private let contentView = UIView(frame: .zero)
    private let scrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ViewModel) {
        locationLabel.text = model.location
        temperatureLabel.text = "\(model.temperature) °"
        descriptionLabel.text = model.description
        feelsLikeView.setUpTemperature(model.feelsLike)
        sunTimingView.setUpTimes(
            sunrise: model.sunriseTime ?? "",
            sunset: model.sunsetTime ?? ""
        )
        backgroundImageView.image = model.weatherState.image
    }
    
    private func setUpLayout() {
        [
            backgroundImageView,
            locationLabel,
            temperatureLabel,
            descriptionLabel
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        [
            hoursForecastCollectionView,
            daysForecastCollectionView,
            mapView,
            feelsLikeView,
            sunTimingView
        ].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.xlSpace),
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor,constant: Constants.mSpace),
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: Constants.mSpace),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.lSpace),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            hoursForecastCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hoursForecastCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            hoursForecastCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            hoursForecastCollectionView.heightAnchor.constraint(equalToConstant: Constants.hoursForecastCollectionViewHeight),
            
            daysForecastCollectionView.topAnchor.constraint(equalTo: hoursForecastCollectionView.bottomAnchor, constant: Constants.lSpace),
            daysForecastCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            daysForecastCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            daysForecastCollectionView.heightAnchor.constraint(equalToConstant: Constants.daysForecastCollectionViewHeight),
            
            mapView.topAnchor.constraint(equalTo: daysForecastCollectionView.bottomAnchor, constant: Constants.lSpace),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            mapView.heightAnchor.constraint(equalToConstant: Constants.mapViewHeight),
            
            feelsLikeView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: Constants.lSpace),
            feelsLikeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            feelsLikeView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -Constants.sSpace),
            feelsLikeView.heightAnchor.constraint(equalToConstant: Constants.xxxxlSize.height),
            feelsLikeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sSpace),
            
            sunTimingView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: Constants.lSpace),
            sunTimingView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: Constants.sSpace),
            sunTimingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            sunTimingView.heightAnchor.constraint(equalToConstant: Constants.xxxxlSize.height),
            sunTimingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sSpace)
        ])
    }
}
