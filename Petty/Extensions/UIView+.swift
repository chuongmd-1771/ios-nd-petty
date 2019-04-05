//
//  UIView+.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func clipsToBounds(color: UIColor, cornerRadius: CGFloat, shadowRadius: CGFloat, clipsToBounds: Bool) {
        self.clipsToBounds = true
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRadius
    }
}
