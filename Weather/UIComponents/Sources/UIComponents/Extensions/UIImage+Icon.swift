//
//  UIImage+Icon.swift
//  
//
//  Created by Helga on 30.11.22.
//

import UIKit

private class BundleProvider {
    static let bundle = Bundle.module
}

public extension UIImage {
    static var iconDownArrows24: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
}

