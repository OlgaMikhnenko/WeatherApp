//
//  ResourceConvertible.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

protocol ResourceConvertible {
    associatedtype ResourceType

    var rawValue: String { get }

    func get() -> ResourceType
}
