//
//  UIView+.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor,
                    opacity: Float = 0.5,
                    offSet: CGSize,
                    radius: CGFloat = 1,
                    scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    func roundCorner(color: UIColor,
                     cornerRadius: CGFloat,
                     shadowRadius: CGFloat,
                     clipsToBounds: Bool) {
        self.clipsToBounds = true
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRadius
    }
}

extension UIView {
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide side: ViewSide,
                   withColor color: CGColor,
                   andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .top:
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        }
        
        layer.addSublayer(border)
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String,
                                  views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDictionary))
    }
}

extension UIView {
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
