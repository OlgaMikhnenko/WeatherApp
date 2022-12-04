//
//  MainPresenterTests.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import XCTest
@testable import Network
@testable import Weather

class MainPresenterTests: XCTestCase {
    
    var sut: MainPresenter!
    
    private let currentWeatherMock = CurrentWeatherMock()
    private let forecastWeatherMock = ForecastModelMock()
    
    override func setUpWithError() throws {
        sut = MainPresenter()
    }
    
    func testParseCurrentWeather() throws {
        let controller = MainViewControllerMock()
        sut.controller = controller
        sut.present(.parseCurrentWeather(currentWeatherMock.model))
        
        let appliedState = try controller.appliedState?.get()
        switch appliedState {
        case .updateMainView:
            XCTAssert(true)
        default:
            XCTAssert(false)
        }
    }
    
    func testPrepareForecastDays() throws {
        let controller = MainViewControllerMock()
        sut.controller = controller
        sut.present(.prepareForecast(forecastWeatherMock.model))
        
        let appliedState = try controller.appliedState?.get()
        switch appliedState {
        case .updateDaysForecast:
            XCTAssert(true)
        default:
            XCTAssert(false)
        }
    }
    
}
