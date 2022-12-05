//
//  NetworkRouter.swift
//  
//
//  Created by Helga on 30.11.22.
//

import Foundation

class NetworkRouter {
    
    let configProvider = ConfigProvider()
    
    func buildParametersString(using bodyParameters: [String: String]) -> String {
        return bodyParameters.map { $0.key + "=" + $0.value.description }.joined(separator: "&")
    }
    
}
