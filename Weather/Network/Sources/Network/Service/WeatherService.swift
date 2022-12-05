//
//  WeatherService.swift
//  
//
//  Created by Helga on 30.11.22.
//


import Foundation

public protocol WeatherServiceProtocol {
    func getCurrentWeather(
        coordinates: CoordinatesModel,
        completion: ((_ model: CurrentWeatherModel) -> Void)?
    )
    
    func getForecast(
        coordinates: CoordinatesModel,
        completion: ((_ model: ForecastModel) -> Void)?
    )
}

public final class WeatherService: WeatherServiceProtocol {
    
    private let router = WeatherRouter()
    private let configProvider = ConfigProvider()
    
    public init() { }
    
    public func getCurrentWeather(
        coordinates: CoordinatesModel,
        completion: ((_ model: CurrentWeatherModel) -> Void)?
    ) {
        let appId = configProvider.appID
        guard let url = URL(string: router.requestPath(transaction: .getCurrentWeather(appId: appId, coordinates: coordinates))) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = router.requestMethod(transaction: .getCurrentWeather(appId: appId, coordinates: coordinates))
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CurrentWeatherModel.self, from: data)
                completion?(response)
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
    
    public func getForecast(
        coordinates: CoordinatesModel,
        completion: ((_ model: ForecastModel) -> Void)?
    ) {
        let appId = configProvider.appID
        guard let url = URL(string: router.requestPath(transaction: .getForecast(appId: appId, coordinates: coordinates))) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = router.requestMethod(transaction: .getForecast(appId: appId, coordinates: coordinates))
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ForecastModel.self, from: data)
                completion?(response)
            } catch {
                debugPrint(error)
            }
        }
        task.resume()
    }
}

