//
//  ForecastModel.swift
//  
//
//  Created by Helga on 04.12.22.
//

import Foundation

public struct ForecastModel: Codable {
    public let code: String
    public let message: Int
    public let list: [ForecastStateModel]
    public let city: CityModel
    
    enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message, list, city
    }
    
    public init(code: String, message: Int, list: [ForecastStateModel], city: CityModel) {
        self.code = code
        self.message = message
        self.list = list
        self.city = city
    }
    
}

public struct ForecastStateModel: Codable {
    public let date: Int
    public let main: WeatherDetailsModel
    public let weather: [WeatherModel]
    public let clouds: CloudsModel
    public let wind: WindModel
    public let visibility: Int
    public let pop: Double
   
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main, weather, clouds, wind, visibility, pop
    }
    
    public init(date: Int, main: WeatherDetailsModel, weather: [WeatherModel], clouds: CloudsModel, wind: WindModel, visibility: Int, pop: Double) {
        self.date = date
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.pop = pop
    }
    
}

public struct CityModel: Codable {
    public let id: Int
    public let name: String
    public let coordinates: CoordinatesModel
    public let country: String
    public let population: Int
    public let timezone: Int
    public let sunrise: Int
    public let sunset: Int
   
    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case id, name, country, population, timezone, sunrise, sunset
    }
    
    public init(id: Int, name: String, coordinates: CoordinatesModel, country: String, population: Int, timezone: Int, sunrise: Int, sunset: Int) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
    
}
