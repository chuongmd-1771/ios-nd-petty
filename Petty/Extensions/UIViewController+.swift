//
//  UIViewController+.swift
//  Petty
//
//  Created by chuongmd on 4/4/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
