//
//  MainPresenterMock.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

@testable import Weather

final class MainPresenterMock: MainPresenterProtocol {
    
    var presentedData: MainDataFlow.Data?
    
    func present(_ data: MainDataFlow.Data) {
        presentedData = data
    }
}
