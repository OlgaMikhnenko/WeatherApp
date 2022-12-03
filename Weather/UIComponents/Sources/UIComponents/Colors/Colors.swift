//
//  Colors.swift
//  
//
//  Created by Helga on 30.11.22.
//

import UIKit

public class Colors {
    
    public enum Neutral {
        public static let neutralG900 = UIColor(red: 0.10, green: 0.10, blue: 0.12, alpha: 1.00)
        public static let neutralG700 = UIColor(red: 0.19, green: 0.19, blue: 0.21, alpha: 1.00)
        public static let neutralG800 = UIColor.black.withAlphaComponent(0.9)
        public static let neutralG500 = UIColor.black.withAlphaComponent(0.6)
        public static let neutralG400 = UIColor.black.withAlphaComponent(0.2)
    }
    
    public enum Inverse {
        public static let inverseA00 = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.86)
        public static let inverseA01 = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.30)
    }
    
    public enum Functional {
        public static let negative = UIColor(red: 1.00, green: 0.27, blue: 0.23, alpha: 1.00)
        public static let positive = UIColor(red: 0.00, green: 0.91, blue: 0.74, alpha: 1.00)
    }
    
}

