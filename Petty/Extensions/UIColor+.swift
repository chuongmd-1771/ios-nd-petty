//
//  UIColor+.swift
//  Petty
//
//  Created by chuongmd on 4/4/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1.0)
    }
    
    static let frenchBlue = UIColor(r: 0, g: 109, b: 188)
}
