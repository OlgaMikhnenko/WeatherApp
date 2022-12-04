//
//  WeatherServiceMock.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import XCTest
@testable import Network

final class WeatherServiceMock: WeatherServiceProtocol {
    private let currentWeatherMock = CurrentWeatherMock()
    var getCurrentWeatherExecutedAfterCompletion: (() -> ())?
    
    private let forecastWeatherMock = ForecastModelMock()
    var getForecastWeatherExecutedAfterCompletion: (() -> ())?

    func getCurrentWeather(
        coordinates: Network.CoordinatesModel,
        completion: ((Network.CurrentWeatherModel) -> Void)?
    ) {
        completion?(currentWeatherMock.model)
        getCurrentWeatherExecutedAfterCompletion?()
    }
    
    func getForecast(
        coordinates: Network.CoordinatesModel,
        completion: ((Network.ForecastModel) -> Void)?
    ) {
        completion?(forecastWeatherMock.model)
        getForecastWeatherExecutedAfterCompletion?()
    }
}
