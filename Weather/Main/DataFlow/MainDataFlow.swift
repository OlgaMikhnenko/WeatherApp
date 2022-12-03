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
    }
        
    enum Data {
        case parceCurrentWeather(CurrentWeatherModel)
    }
    
    typealias State = Result<Success, Errors>
   
    enum Success {
        case updateMainView(MainView.ViewModel)
    }
   
    enum Errors: Error { }
    
}
