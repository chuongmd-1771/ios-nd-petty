//
//  UIViewController+.swift
//  Petty
//
//  Created by chuongmd on 4/4/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func removeSubViewWhenTappedAround(subView: UIView) {
        let tap = UITapGestureRecognizer(target: subView, action: #selector(UIView.remove))
        view.addGestureRecognizer(tap)
    }
    
    private func createBasicAlert(title: String, message: String) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        DispatchQueue.main.async { self.present(alert, animated: true, completion: nil) }
    }
    
    func showRegisterSuccessAlert() {
        createBasicAlert(title: "Thành Công", message: "Đăng Ký Thành Công - Hãy Đăng Nhập")
    }
    
    func showInvalidLoginEmailAlert() {
        createBasicAlert(title: "Email Đăng Nhập Không Đúng", message: "Xin Hãy Kiểm Tra Lại Email")
    }
    
    func showWrongLoginPasswordAlert() {
        createBasicAlert(title: "Mật Khẩu Không Đúng", message: "Xin Hãy Kiểm Tra Lại Mật Khẩu")
    }
    
    func showInvalidRegisterEmailAlert() {
        createBasicAlert(title: "Không Thành Công", message: "Địa Chỉ Email Không Đúng Định Dạng")
    }
    
    func showEmailAlreadyInUseAlert() {
        createBasicAlert(title: "Email Đã Được Sử Dụng", message: "Xin Hãy Dùng Email Khác")
    }
    
    func showUserNotFoundAlert() {
        createBasicAlert(title: "Không Thành Công", message: "Email Của Bạn Không Tồn Tại")
    }
    
    func showUserDisabledAlert() {
        createBasicAlert(title: "Không Thành Công", message: "Tài Khoản Của Bạn Đã Bị Vô Hiệu Hoá")
    }
    
    func presentSharePhotoController(image: UIImage) {
        let vc = SharePhotoController.instantiate()
        vc.capturedImage = image
        present(vc, animated: true)
    }
    
    func presentUserDetailController() {
        let vc = UserDetailViewController.instantiate()
        present(vc, animated: true)
    }
    
    func presentHomeController() {
        let vc = HomeViewController.instantiate()
        present(vc, animated: true)
    }
    
    func presentSettingController() {
        let vc = SettingViewController.instantiate()
        present(vc, animated: true)
    }
    
    func presentInBoxController() {
        let vc = InboxTableViewController.instantiate()
        present(vc, animated: true)
    }
}
