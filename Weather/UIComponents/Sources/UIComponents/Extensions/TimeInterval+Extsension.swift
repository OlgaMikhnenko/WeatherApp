//
//  TimeInterval+Extsension.swift
//  
//
//  Created by Helga on 03.12.22.
//

import Foundation

public extension TimeInterval {
    
    init(timestamp: Int, timezoneOffset: Int) {
        self = TimeInterval(timestamp + timezoneOffset)
    }
    
}
