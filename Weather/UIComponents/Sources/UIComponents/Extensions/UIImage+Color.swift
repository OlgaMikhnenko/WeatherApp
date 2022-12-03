//
//  UIImage+Color.swift
//  
//
//  Created by Helga on 30.11.22.
//

import UIKit

public extension UIImage {

    func maskWithColor(_ color: UIColor) -> UIImage? {
        
        if  #available(iOS 13.0, *) {
            return self.withTintColor(color)
        }

        guard let maskImage = cgImage else { return nil }

        let width = size.width * UIScreen.main.scale
        let height = size.height * UIScreen.main.scale
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        guard
            let context = CGContext(
                data: nil,
                width: Int(width),
                height: Int(height),
                bitsPerComponent: 8,
                bytesPerRow: 0,
                space: colorSpace,
                bitmapInfo: bitmapInfo.rawValue
            )
        else { return nil }

        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        guard let cgImage = context.makeImage() else { return nil }

        let coloredImage = UIImage(cgImage: cgImage)
        return coloredImage
    }

}

