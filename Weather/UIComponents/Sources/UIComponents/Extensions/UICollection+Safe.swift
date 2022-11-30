//
//  UICollection+Safe.swift
//  
//
//  Created by Helga on 30.11.22.
//

public extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
