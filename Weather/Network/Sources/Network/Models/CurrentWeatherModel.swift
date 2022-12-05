//
//  CurrentWeatherModel.swift
//  
//
//  Created by Helga on 30.11.22.
//

import Foundation

public struct CurrentWeatherModel: Codable {
    public let coordinates: CoordinatesModel
    public let weather: [WeatherModel]
    public let base: String
    public let main: WeatherDetailsModel
    public let visibility: Int
    public let wind: WindModel
    public let rain: RainModel?
    public let clouds: CloudsModel
    public let date: Int
    public let system: SystemModel
    public let timezone: Int
    public let id: Int
    public let name: String
    public let code: Int
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather, base, main, visibility, wind, rain, clouds
        case date = "dt"
        case system = "sys"
        case timezone, id, name
        case code = "cod"
    }
    
    public init(coordinates: CoordinatesModel, weather: [WeatherModel], base: String, main: WeatherDetailsModel, visibility: Int, wind: WindModel, rain: RainModel?, clouds: CloudsModel, date: Int, system: SystemModel, timezone: Int, id: Int, name: String, code: Int) {
        self.coordinates = coordinates
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.rain = rain
        self.clouds = clouds
        self.date = date
        self.system = system
        self.timezone = timezone
        self.id = id
        self.name = name
        self.code = code
    }
}

public struct CoordinatesModel: Codable {
    public let latitude: Double
    public let longtitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longtitude = "lon"
    }
    
    public init(latitude: Double, longtitude: Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }
}

public struct WeatherModel: Codable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
    
    public init(id: Int, main: String, description: String, icon: String) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

public struct WeatherDetailsModel: Codable {
    public let temperature: Double
    public let feelsLike: Double
    public let tempMin: Double
    public let tempMax: Double
    public let pressure: Int
    public let humidity: Int
    public let seaLevel: Int?
    public let groundLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
    }
    
    public init(temperature: Double, feelsLike: Double, tempMin: Double, tempMax: Double, pressure: Int, humidity: Int, seaLevel: Int?, groundLevel: Int?) {
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.seaLevel = seaLevel
        self.groundLevel = groundLevel
    }
    
}

public struct WindModel: Codable {
    public let speed: Double
    public let deg: Int
    public let gust: Double?
    
    public init(speed: Double, deg: Int, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}

public struct RainModel: Codable {
    public let oneH: Double
    
    enum CodingKeys: String, CodingKey {
        case oneH = "1h"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.oneH = try container.decode(Double.self, forKey: .oneH)
    }
}
    
public struct CloudsModel: Codable {
    public let all: Int
    
    public init(all: Int) {
        self.all = all
    }
    
}
 
public struct SystemModel: Codable {
    public let country: String
    public let sunrise: Int
    public let sunset: Int
    
    public init(country: String, sunrise: Int, sunset: Int) {
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
}
