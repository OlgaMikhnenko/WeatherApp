//
//  DateFormatter+Extension.swift
//  
//
//  Created by Helga on 03.12.22.
//

import Foundation

public extension DateFormatter {
    static var displayTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = NSLocale.current
        return formatter
    }
    
    static var dateForecastDisplay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = NSLocale.current
        return formatter
    }
    
    static var dateDayNameDisplay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = NSLocale.current
        return formatter
    }
}
