//
//  MainInteractorTest.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import XCTest
import CoreLocation
@testable import Network
@testable import Weather

class MainInteractorTest: XCTestCase {
    
    private var presenter: MainPresenterMock!
    private var networkService: WeatherServiceMock!
    var sut: MainInteractor!
    
    override func setUpWithError() throws {
        presenter = MainPresenterMock()
        networkService = WeatherServiceMock()
        sut = MainInteractor(presenter: presenter, networkService: networkService)
    }
    
    func testGetCurrentWeather() {
        let exp = expectation(description: #function)
        networkService.getCurrentWeatherExecutedAfterCompletion = { exp.fulfill() }
        
        sut.execute(.getCurrentWeather(CLLocation(latitude: 50.11, longitude: 8.68)))
        wait(for: [exp], timeout: 1.0)
        
        switch presenter.presentedData {
        case .parseCurrentWeather:
            XCTAssert(true)
        default:
            XCTAssert(false)
        }
    }
    
    func testForecastWeather() {
        let exp = expectation(description: #function)
        networkService.getForecastWeatherExecutedAfterCompletion = { exp.fulfill() }
        
        sut.execute(.getForecast(CLLocation(latitude: 50.11, longitude: 8.68)))
        wait(for: [exp], timeout: 1.0)
        
        switch presenter.presentedData {
        case .prepareForecast:
            XCTAssert(true)
        default:
            XCTAssert(false)
        }
        
    }
}
