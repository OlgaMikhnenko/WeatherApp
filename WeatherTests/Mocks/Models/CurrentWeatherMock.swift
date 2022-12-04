//
//  CurrentWeatherMock.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import Network

final class CurrentWeatherMock {
    var model = CurrentWeatherModel(
        coordinates: CoordinatesModel(latitude: 50.11, longtitude: 8.68),
        weather: [WeatherModel(
            id: 300,
            main: "Drizzle",
            description: "light intensity drizzle",
            icon: "09n"
        )],
        base: "stations",
        main: WeatherDetailsModel(
            temperature: 2.91,
            feelsLike: -1.35,
            tempMin:  1.92,
            tempMax: 3.97,
            pressure: 1014,
            humidity: 90,
            seaLevel: nil,
            groundLevel: nil
        ),
        visibility: 10000,
        wind: WindModel(
            speed: 5.14,
            deg: 40,
            gust: nil
        ),
        rain: nil,
        clouds: CloudsModel(all: 75),
        date: 1670186541,
        system: SystemModel(
            country: "DE",
            sunrise: 1670137578,
            sunset: 1670167494
        ),
        timezone: 3600,
        id: 2925533,
        name: "Frankfurt am Main",
        code: 200
    )
}
