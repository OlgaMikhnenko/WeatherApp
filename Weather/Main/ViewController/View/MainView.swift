//  
//  MainView.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit
import UIComponents
import MapKit

extension MainView {
    struct ViewModel {
        let location: String
        let temperature: Int
        let description: String?
        let feelsLike: Int
        let sunriseTime: String?
        let sunsetTime: String?
        let weatherState: WeatherState
        let timeState: TimeState
    }
}

final class MainView: UIView {
    private enum Constants: Grid {
        static let hoursForecastCollectionViewHeight: CGFloat = 100
        static let daysForecastTableViewHeight: CGFloat = 270
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: 50, height: 80)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .zero
        collectionView.register(HourForecastCell.self, forCellWithReuseIdentifier: HourForecastCell.ViewModel.reuseIdentifier)
        collectionView.backgroundColor = Colors.Neutral.neutralG400
        collectionView.layer.cornerRadius = Constants.additionalInfoCornerRadius
        return collectionView
    }()
    
    lazy var daysForecastTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(DayForecastCell.self, forCellReuseIdentifier: DayForecastCell.ViewModel.reuseIdentifier)
        tableView.backgroundColor = Colors.Neutral.neutralG400
        tableView.layer.cornerRadius = Constants.additionalInfoCornerRadius
        tableView.showsVerticalScrollIndicator = false
        let header = AdditionalSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        header.configure(
            image: UIImage(systemName: "calendar"),
            text: AppStrings.ForecastComponent.dayForecast.get()
        )
        tableView.tableHeaderView = header
        return tableView
    }()
    
    private let mapView : MKMapView = {
        let map = MKMapView()
        map.layer.cornerRadius = Constants.additionalInfoCornerRadius
        map.showsUserLocation = true
        return map
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
        temperatureLabel.text = "\(model.temperature)°"
        descriptionLabel.text = model.description
        feelsLikeView.setUpTemperature(model.feelsLike)
        sunTimingView.setUpTimes(
            sunrise: model.sunriseTime ?? "",
            sunset: model.sunsetTime ?? ""
        )
        backgroundImageView.image = model.weatherState.image
        
        switch model.timeState {
        case .day:
            
            mapView.overrideUserInterfaceStyle = .light
        case .night:
            mapView.overrideUserInterfaceStyle = .dark
        }
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
            daysForecastTableView,
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
            
            daysForecastTableView.topAnchor.constraint(equalTo: hoursForecastCollectionView.bottomAnchor, constant: Constants.xsSpace),
            daysForecastTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            daysForecastTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            daysForecastTableView.heightAnchor.constraint(equalToConstant: Constants.daysForecastTableViewHeight),
            
            mapView.topAnchor.constraint(equalTo: daysForecastTableView.bottomAnchor, constant: Constants.xsSpace),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            mapView.heightAnchor.constraint(equalToConstant: Constants.mapViewHeight),
            
            feelsLikeView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: Constants.xsSpace),
            feelsLikeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sSpace),
            feelsLikeView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -Constants.xxsSpace),
            feelsLikeView.heightAnchor.constraint(equalToConstant: Constants.xxxxlSize.height),
            feelsLikeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sSpace),
            
            sunTimingView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: Constants.xsSpace),
            sunTimingView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: Constants.xxsSpace),
            sunTimingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sSpace),
            sunTimingView.heightAnchor.constraint(equalToConstant: Constants.xxxxlSize.height),
            sunTimingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.sSpace)
        ])
    }
}
