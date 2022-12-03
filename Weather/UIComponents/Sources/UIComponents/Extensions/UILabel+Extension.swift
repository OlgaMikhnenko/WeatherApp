//
//  UILabel+Extension.swift
//  
//
//  Created by Helga on 03.12.22.
//

import UIKit

public extension UILabel {
    convenience init(withShadow: Bool) {
        self.init()
        guard withShadow else { return }
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}
