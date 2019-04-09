//
//  UIViewController+.swift
//  Petty
//
//  Created by chuongmd on 4/4/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

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
    
    private func basicAlert(title: String, message: String) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        DispatchQueue.main.async { self.present(alert, animated: true, completion: nil) }
    }
    
    func registerSuccessAlert() {
        basicAlert(title: "Thành Công", message: "Đăng Ký Thành Công - Hãy Đăng Nhập")
    }
    func invalidLoginEmailAlert() {
        basicAlert(title: "Email Đăng Nhập Không Đúng", message: "Xin Hãy Kiểm Tra Lại Email")
    }
    func wrongLoginPasswordAlert() {
        basicAlert(title: "Mật Khẩu Không Đúng", message: "Xin Hãy Kiểm Tra Lại Mật Khẩu")
    }
    func invalidRegisterEmailAlert() {
        basicAlert(title: "Không Thành Công", message: "Địa Chỉ Email Không Đúng Định Dạng")
    }
    func emailAlreadyInUseAlert() {
        basicAlert(title: "Email Đã Được Sử Dụng", message: "Xin Hãy Dùng Email Khác")
    }
    func userNotFoundAlert() {
        basicAlert(title: "Không Thành Công", message: "Email Của Bạn Không Tồn Tại")
    }
    func userDisabledAlert() {
        basicAlert(title: "Không Thành Công", message: "Tài Khoản Của Bạn Đã Bị Vô Hiệu Hoá")
    }
}
