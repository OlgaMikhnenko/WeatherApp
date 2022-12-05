//
//  ConfigProvider.swift
//  
//
//  Created by Helga on 30.11.22.
//

import Foundation

final class ConfigProvider {

    enum Environment {
        case openWeather
        
        var endpoint: String {
            switch self {
            case .openWeather:
                return "api.openweathermap.org/"
            }
        }
    }

    private enum Constants {
        static let defaultEnvironment: Environment = .openWeather
        static let appID = "30341b2b5b8e36a430eff43b2eec96ca"
    }
      
    var currentEndpoint: String {
        "https://" + Constants.defaultEnvironment.endpoint
    }
    
    var appID: String {
        Constants.appID
    }
    
}
