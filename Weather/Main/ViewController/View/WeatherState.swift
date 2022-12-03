//
//  WeatherState.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import UIKit
import UIComponents

enum WeatherState: CaseIterable {
    case sunDay
    case sunNight
    case cloudDay
    case cloudNight
    case rainDay
    case rainNight
    case snowDay
    case snowNight
    
    var keyWords: String {
        switch self {
        case .sunDay, .sunNight:
            return AppStrings.KeyWords.sun.get()
            
        case .cloudDay, .cloudNight:
            return AppStrings.KeyWords.cloud.get()
        
        case .rainDay, .rainNight:
            return AppStrings.KeyWords.rain.get()
            
        case .snowDay, .snowNight:
            return AppStrings.KeyWords.snow.get()
            
        }
    }
    
    var image: UIImage {
        switch self {
        case .sunDay:
            return UIImage.imageSunDay
            
        case .sunNight:
            return UIImage.imageSunNight
            
        case .cloudDay:
            return UIImage.imageCloudDay
            
        case .cloudNight:
            return UIImage.imageCloudNight
            
        case .rainDay:
            return UIImage.imageRainDay
            
        case .rainNight:
            return UIImage.imageRainNight
            
        case .snowDay:
            return UIImage.imageSnowDay
            
        case .snowNight:
            return UIImage.imageSnowNight
            
        }
    }
}
