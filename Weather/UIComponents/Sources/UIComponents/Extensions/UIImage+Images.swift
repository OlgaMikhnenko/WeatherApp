//
//  UIImage+Images.swift
//  
//
//  Created by Helga on 03.12.22.
//

import UIKit

private class BundleProvider {
    static let bundle = Bundle.module
}

public extension UIImage {
    static var imageSunNight: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageSunDay: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageCloudDay: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageCloudNight: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageRainDay: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageRainNight: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageSnowDay: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }
    static var imageSnowNight: UIImage { UIImage(named: #function, in: BundleProvider.bundle, compatibleWith: nil)! }

}


