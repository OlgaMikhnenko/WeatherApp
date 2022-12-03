//
//  ViewController.swift
//  Weather
//
//  Created by Helga on 30.11.22.
//

import UIKit
import Network

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = WeatherService()
        let coordinates: CoordinatesModel = CoordinatesModel(latitude: 44.55, longtitude: 44.34)
        service.getCurrentWeather(coordinates: coordinates) { model in
            print(model)
        }
    }


}

