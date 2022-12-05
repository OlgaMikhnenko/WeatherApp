//
//  WeatherRouter.swift
//  
//
//  Created by Helga on 30.11.22.
//

import Foundation

final class WeatherRouter: NetworkRouter {
    
    enum Transaction {
        case getCurrentWeather(
            appId: String,
            coordinates: CoordinatesModel,
            units: UnitsModel = .metric
        )
        
        case getForecast(
            appId: String,
            coordinates: CoordinatesModel,
            units: UnitsModel = .metric
        )
        
        var path: String {
            switch self {
            case .getCurrentWeather:
                return "data/2.5/weather"
                
            case .getForecast:
                return "data/2.5/forecast"
            }
        }
        
        var method: HTTPMethod {
            switch self {
            case .getCurrentWeather:
                return .get
                
            case .getForecast:
                return .get
            }
        }
        
        var queryParameters: [String: String] {
            switch self {
            case .getCurrentWeather(let appId, let coordinates, let units):
                return [
                    "lat": "\(coordinates.latitude)",
                    "lon": "\(coordinates.longtitude)",
                    "appid": appId,
                    "units": units.rawValue
                ]
                
            case .getForecast(let appId, let coordinates, let units):
                return [
                    "lat": "\(coordinates.latitude)",
                    "lon": "\(coordinates.longtitude)",
                    "appid": appId,
                    "units": units.rawValue
                ]
            }
        }
    }
    
    func requestPath(transaction: Transaction) -> String {
        var path = configProvider.currentEndpoint + transaction.path
        if !transaction.queryParameters.isEmpty {
            path.append("?" + buildParametersString(using: transaction.queryParameters))
        }
        return path
    }
    
    func requestMethod(transaction: Transaction) -> String {
        transaction.method.rawValue
    }
    
}
