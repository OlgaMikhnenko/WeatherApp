//
//  CellRepresentable.swift
//  
//
//  Created by Helga on 30.11.22.
//

import Foundation

public protocol CellRepresentable {
    static var reuseIdentifier: String { get }
    var reuseIdentifier: String { get }
}

public extension CellRepresentable {
    static var reuseIdentifier: String {
        return String(reflecting: Self.self)
    }
    
    var reuseIdentifier: String {
        return String(reflecting: Self.self)
    }
}

