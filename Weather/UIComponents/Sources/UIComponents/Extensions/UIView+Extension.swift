//
//  UIView+Extension.swift
//  
//
//  Created by Helga on 03.12.22.
//

import UIKit

public extension UIView {
    convenience init(withShadow: Bool) {
        self.init()
        guard withShadow else { return }
        layer.shadowColor = UIColor.black.withAlphaComponent(0.8).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.masksToBounds = false
    }
    
}

