//
//  AppStrings.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import Foundation

public enum AppStrings {
    
    enum FeelsLikeComponent: String, LocalizationResourceConvertable {
        case header = "FeelsLikeComponent.header"
    }
    
    enum SunMovementComponent: String, LocalizationResourceConvertable {
        case header = "SunMovementComponent.header"
        case sunrise = "SunMovementComponent.sunrise"
        case sunset = "SunMovementComponent.sunset"
    }
    
    enum KeyWords: String, LocalizationResourceConvertable {
        case sun = "KeyWords.sun"
        case rain = "KeyWords.rain"
        case cloud = "KeyWords.cloud"
        case snow = "KeyWords.snow"
    }
    
}
