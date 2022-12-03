//
//  LocalizationResourceConvertable.swift
//  Weather
//
//  Created by Helga on 03.12.22.
//

import Foundation

protocol LocalizationResourceConvertable: ResourceConvertible {}

extension LocalizationResourceConvertable {

    func get() -> String {
        NSLocalizedString(
            rawValue,
            comment: "Localization string for key \(rawValue)"
        )
    }
}
