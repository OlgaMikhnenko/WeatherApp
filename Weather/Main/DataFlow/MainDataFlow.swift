//  
//  MainDataFlow.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import Network

enum MainDataFlow {
    
    enum Event {
        case getCurrentWeather
        case getForecast
    }
        
    enum Data {
        case parceCurrentWeather(CurrentWeatherModel)
        case prepareForecast(ForecastModel)
    }
    
    typealias State = Result<Success, Errors>
   
    enum Success {
        case updateMainView(MainView.ViewModel)
        case updateHoursForecast([HourForecastCell.ViewModel])
        case updateDaysForecast([DayForecastCell.ViewModel])
    }
   
    enum Errors: Error { }
    
}
