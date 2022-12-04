//  
//  MainBuilder.swift
//  Weather
//
//  Created by Helga on 01.12.22.
//

import UIKit
import Network

final class MainBuilder {
    func build() -> UIViewController {
        let presenter = MainPresenter()
        let networkService = WeatherService()
        let interactor = MainInteractor(presenter: presenter, networkService: networkService)
        let controller = MainViewController(interactor: interactor)
        presenter.controller = controller
        
        return controller
    }
}
