//
//  GradientView.swift
//  Petty
//
//  Created by chuongmd on 4/23/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class GradientView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradient(color: [UIColor.clear.cgColor, UIColor.black.cgColor], location: [0.6, 1])
    }
}
