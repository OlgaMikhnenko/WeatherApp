//  
//  MainInteractor.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import Foundation
import Network
import CoreLocation

final class MainInteractor: NSObject, MainInteractorProtocol {
    private enum Constants {
        static let coordinates = CLLocation(latitude: 50.11, longitude: 8.68)
    }
    
    let presenter: MainPresenterProtocol
    
    private let networkService: WeatherServiceProtocol
    
    private let locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        return locationManager
    }()
    
    private let dataQueue = DispatchQueue(label: "com.module.MainInteractor")
    
    init(
        presenter: MainPresenterProtocol,
        networkService: WeatherServiceProtocol
    ) {
        self.presenter = presenter
        self.networkService = networkService
        super.init()
        locationManager.delegate = self
    }
    
    func execute(_ event: MainDataFlow.Event) {
        dataQueue.async { [weak self] in
            self?.applyEvent(event)
        }
    }
    
    private func applyEvent(_ event: MainDataFlow.Event) {
        switch event {
        case .getCurrentWeather:
            locationManager.requestLocation()

        case .getForecast:
            locationManager.requestLocation()
            
        }
    }
    
    private func getCurrentWeather(with location: CLLocation) {
        networkService.getCurrentWeather(coordinates: CoordinatesModel(
            latitude: location.coordinate.latitude,
            longtitude: location.coordinate.longitude
        )) { [weak self] model in
            self?.presenter.present(.parseCurrentWeather(model))
        }
    }
    
    private func getForecast(with location: CLLocation) {
        networkService.getForecast(coordinates: CoordinatesModel(
            latitude: location.coordinate.latitude,
            longtitude: location.coordinate.longitude
        )) { [weak self] model in
            self?.presenter.present(.prepareForecast(model))
        }
    }
    
}

extension MainInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            getCurrentWeather(with: location)
            getForecast(with: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = CLLocationManager.authorizationStatus()
        switch status {
            case .authorizedAlways:
                locationManager.requestLocation()
            
            case .authorizedWhenInUse:
                locationManager.requestLocation()
            
            case .denied:
                getCurrentWeather(with: Constants.coordinates)
                getForecast(with: Constants.coordinates)
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            
            case .restricted:
                getCurrentWeather(with: Constants.coordinates)
                getForecast(with: Constants.coordinates)
            
        }
    }

}
