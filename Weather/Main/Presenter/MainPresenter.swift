//  
//  MainPresenter.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import Foundation

final class MainPresenter: MainPresenterProtocol {
    
    weak var controller: MainViewControllerProtocol?
    
    func present(_ data: MainDataFlow.Data) {
        switch data {
        case .parceCurrentWeather(let model):
            let viewModel = MainView.ViewModel(
                location: model.name,
                temperature: Int(model.main.temperature),
                description: model.weather.first?.main,
                feelsLike: Int(model.main.feelsLike),
                sunriseTime: dateForDisplay(timestamp: TimeInterval(
                    timestamp: model.system.sunrise,
                    timezoneOffset: model.timezone
                )),
                sunsetTime: dateForDisplay(timestamp: TimeInterval(
                    timestamp: model.system.sunset,
                    timezoneOffset: model.timezone
                )),
                weatherState: defineWeatherState(description: model.weather.first?.main)
            )
            controller?.apply(.success(.updateMainView(viewModel)))
            
        }
    }

    private func dateForDisplay(timestamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timestamp)
        let utcDateFormatter = DateFormatter.displayTimeFormatter
        return utcDateFormatter.string(from: date)
    }
    
    private func defineWeatherState(description: String?) -> WeatherState {
        guard let description = description?.lowercased() else { return .cloudDay }
        for state in WeatherState.allCases {
            if state.keyWords.contains(description) {
                return state
            }
        }
        return .cloudDay
    }

}
