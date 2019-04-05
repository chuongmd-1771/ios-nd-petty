//
//  CustomView.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        clipsToBounds(color: .lightGray, cornerRadius: 50, shadowRadius: 2, clipsToBounds: true)
        dropShadow(color: .lightGray, opacity: 1, offSet: CGSize(width: 1, height: 1), radius: 20, scale: true)
    }
}
