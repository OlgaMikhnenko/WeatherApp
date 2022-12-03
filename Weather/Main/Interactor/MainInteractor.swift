//  
//  MainInteractor.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import Foundation
import Network

final class MainInteractor: MainInteractorProtocol {
    let presenter: MainPresenterProtocol
    
    private let networkService = WeatherService()
    
    private let dataQueue = DispatchQueue(label: "com.module.MainInteractor")
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func execute(_ event: MainDataFlow.Event) {
        dataQueue.async { [weak self] in
            self?.applyEvent(event)
        }
    }
    
    private func applyEvent(_ event: MainDataFlow.Event) {
        switch event {
        case .getCurrentWeather:
            networkService.getCurrentWeather(coordinates: CoordinatesModel(latitude: 19.69, longtitude: -99.7)) { [weak self] model in
                self?.presenter.present(.parceCurrentWeather(model))
            }
        }
    }
}
