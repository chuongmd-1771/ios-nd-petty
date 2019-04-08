//
//  AlertView.swift
//  Petty
//
//  Created by chuongmd on 4/8/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class AlertView: NSObject {
    
    class func showAlert(view: UIViewController, message: String, alertTitle: String, actionTitle: String) {
        let alertTitle = alertTitle
        let alertActionTitle = actionTitle
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: alertActionTitle, style: UIAlertAction.Style.default, handler: nil))
        
        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}
