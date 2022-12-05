//  
//  MainInteractor.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import Foundation
import Network
import CoreLocation

final class MainInteractor: MainInteractorProtocol {
    
    let presenter: MainPresenterProtocol
    
    private let networkService: WeatherServiceProtocol
    
    private let dataQueue = DispatchQueue(label: "com.module.MainInteractor")
    
    init(
        presenter: MainPresenterProtocol,
        networkService: WeatherServiceProtocol
    ) {
        self.presenter = presenter
        self.networkService = networkService
    }
    
    func execute(_ event: MainDataFlow.Event) {
        dataQueue.async { [weak self] in
            self?.applyEvent(event)
        }
    }
    
    private func applyEvent(_ event: MainDataFlow.Event) {
        switch event {
        case .getCurrentWeather(let location):
            getCurrentWeather(with: location)
            
        case .getForecast(let location):
            getForecast(with: location)
            
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
