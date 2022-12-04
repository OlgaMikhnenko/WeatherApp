//
//  ForecastModelMock.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import Network

final class ForecastModelMock {
    var model = ForecastModel(
        code: "200",
        message: 0,
        list: [
            ForecastStateModel(
                date: 1670198400,
                main: WeatherDetailsModel(
                    temperature: 2.85,
                    feelsLike: 1.52,
                    tempMin: 2.75,
                    tempMax: 2.85,
                    pressure: 1015,
                    humidity: 91,
                    seaLevel: 1004,
                    groundLevel: 1004
                ),
                weather: [
                    WeatherModel(
                        id: 500,
                        main: "Rain",
                        description: "light rain",
                        icon: "10n"
                    )
                ],
                clouds: CloudsModel(all: 83),
                wind: WindModel(
                    speed: 1.48,
                    deg: 348,
                    gust: 2.58
                ),
                visibility: 10000,
                pop: 0
            )
        ],
        city: CityModel(
            id: 2925533,
            name: "Frankfurt am Main",
            coordinates: CoordinatesModel(latitude: 50.11, longtitude: 8.68),
            country: "DE",
            population: 650000,
            timezone: 3600,
            sunrise: 1670137578,
            sunset: 1670167494
        )
    )
}
