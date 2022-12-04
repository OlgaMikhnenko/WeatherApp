//
//  MainViewControllerTest.swift
//  WeatherTests
//
//  Created by Helga on 04.12.22.
//

import XCTest
@testable import Weather

final class MainViewControllerMock: MainViewControllerProtocol {
    
    var appliedState: MainDataFlow.State?
    
    func apply(_ state: MainDataFlow.State) {
        appliedState = state
    }
}

