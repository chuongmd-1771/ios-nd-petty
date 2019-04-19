//
//  UIScrollView+.swift
//  Petty
//
//  Created by chuongmd on 4/19/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

extension UIScrollView {
    func resetScrollPositionToTop() {
        contentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
    }
}
