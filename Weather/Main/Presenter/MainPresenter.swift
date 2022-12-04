//  
//  MainPresenter.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit

final class MainPresenter: MainPresenterProtocol {
    
    weak var controller: MainViewControllerProtocol?
    
    func present(_ data: MainDataFlow.Data) {
        switch data {
        case .parceCurrentWeather(let model):
            let sunrise = TimeInterval(
                timestamp: model.system.sunrise,
                timezoneOffset: model.timezone
            )
            
            let sunset = TimeInterval(
                timestamp: model.system.sunset,
                timezoneOffset: model.timezone
            )
            
            let timestamp = TimeInterval(
                timestamp: model.date,
                timezoneOffset: model.timezone
            )
            
            let weatherState = defineWeatherState(
                description: model.weather.first?.main,
                timestamp: timestamp,
                sunrise: sunrise,
                sunset: sunset
            )
            
            let timeState: TimeState = weatherState == .rainDay ? .night : defineTimeState(
                date: Date(timeIntervalSince1970: timestamp),
                sunrise: Date(timeIntervalSince1970: sunrise),
                sunset: Date(timeIntervalSince1970: sunset)
            )
            
            let viewModel = MainView.ViewModel(
                location: model.name,
                temperature: Int(model.main.temperature),
                description: model.weather.first?.main,
                feelsLike: Int(model.main.feelsLike),
                sunriseTime: dateForDisplay(timestamp: sunrise),
                sunsetTime: dateForDisplay(timestamp: sunset),
                weatherState: weatherState,
                timeState: timeState
            )
            controller?.apply(.success(.updateMainView(viewModel)))
            
        case .prepareForecast(let model):
            var hourForecastModels: [HourForecastCell.ViewModel]  = []
            var dayForecastModels: [DayForecastCell.ViewModel]  = []
            
            let sunrise = TimeInterval(
                timestamp: model.city.sunrise,
                timezoneOffset: model.city.timezone
            )
            
            let sunset = TimeInterval(
                timestamp: model.city.sunset,
                timezoneOffset: model.city.timezone
            )
            
            for state in model.list {
                let timestamp = TimeInterval(
                    timestamp: state.date,
                    timezoneOffset: model.city.timezone
                )
                if isDateInside24Hours(Date(timeIntervalSince1970: timestamp)) {
                    let weatherState = defineWeatherState(
                        description: state.weather.first?.main,
                        timestamp: timestamp,
                        sunrise: sunrise,
                        sunset: sunset
                    )
                    let stateModel = HourForecastCell.ViewModel(
                        time: dateForecastDisplay(timestamp: timestamp),
                        icon: weatherState.icon,
                        temperature: Int(state.main.temperature)
                    )
                    hourForecastModels.append(stateModel)
                } else {
                    let weatherState = defineWeatherState(
                        description: state.weather.first?.main,
                        timestamp: timestamp,
                        sunrise: sunrise,
                        sunset: sunset
                    )
                    let stateModel = DayForecastCell.ViewModel(
                        day: defineDayName(timestamp: timestamp),
                        icon: weatherState.icon,
                        temperatureMin: Int(state.main.tempMin),
                        temperatureMax: Int(state.main.tempMax)
                    )
                    dayForecastModels.append(stateModel)
                }
            }
            
            let groupedDayForecast = groupByDays(models: dayForecastModels)
            controller?.apply(.success(.updateHoursForecast(hourForecastModels)))
            controller?.apply(.success(.updateDaysForecast(groupedDayForecast)))
            
        }
    }
    
    private func groupByDays(models: [DayForecastCell.ViewModel]) -> [DayForecastCell.ViewModel] {
        var groupedDayForecast: [DayForecastCell.ViewModel] = []
        guard
            let firstModel = models.first,
            let firstDay = models.first?.day else { return groupedDayForecast }
        var currentDay = firstDay
        var minTemperature = firstModel.temperatureMin
        var maxTemperaute = firstModel.temperatureMax
        for model in models {
            if model.day != currentDay {
                let stateModel = DayForecastCell.ViewModel(
                    day: currentDay,
                    icon: model.icon,
                    temperatureMin: minTemperature,
                    temperatureMax: maxTemperaute
                )
                groupedDayForecast.append(stateModel)
                currentDay = model.day ?? ""
                minTemperature = model.temperatureMin
                maxTemperaute = model.temperatureMax
            } else {
                if maxTemperaute < model.temperatureMax {
                    maxTemperaute = model.temperatureMax
                }
                if minTemperature > model.temperatureMin {
                    minTemperature = model.temperatureMin
                }
            }
        }
        return groupedDayForecast
    }
    
    private func defineDayName(timestamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timestamp)
        let utcDateFormatter = DateFormatter.dateDayNameDisplay
        return utcDateFormatter.string(from: date)
    }
    
    private func isDateInside24Hours(_ date: Date) -> Bool {
        let currentDate = Date()
        let difference = Calendar.current.dateComponents([.hour], from: currentDate, to: date)
        guard let hour = difference.hour else { return false }
        if hour <= 24 {
            return true
        } else {
            return false
        }
    }
    
    private func dateForDisplay(timestamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timestamp)
        let utcDateFormatter = DateFormatter.displayTimeFormatter
        return utcDateFormatter.string(from: date)
    }
    
    private func dateForecastDisplay(timestamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timestamp)
        let utcDateFormatter = DateFormatter.dateForecastDisplay
        return utcDateFormatter.string(from: date)
    }
    
    private func defineWeatherState(
        description: String?,
        timestamp: TimeInterval,
        sunrise: TimeInterval,
        sunset: TimeInterval
    ) -> WeatherState {
        var resultState: WeatherState = .cloudDay
        guard let description = description?.lowercased() else { return resultState }
        var possibleStates: [WeatherState] = []
        for state in WeatherState.allCases {
            if state.keyWords.contains(description) {
                possibleStates.append(state)
            }
        }
        
        let timeState = defineTimeState(
            date: Date(timeIntervalSince1970: timestamp),
            sunrise: Date(timeIntervalSince1970: sunrise),
            sunset: Date(timeIntervalSince1970: sunset)
        )
        
        for state in possibleStates {
            if state.rawValue.lowercased().contains(timeState.rawValue) {
                resultState = state
            }
        }
        
        return resultState
    }
    
    private func defineTimeState(
        date: Date,
        sunrise: Date,
        sunset: Date
    ) -> TimeState {
        let previousMidnight = Calendar.current.startOfDay(for: date)
        if date >= previousMidnight &&
            date < sunrise ||
            date > sunset {
            return .night
        } else {
            return .day
        }
    }

}
