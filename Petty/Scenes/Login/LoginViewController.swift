//
//  LoginViewController.swift
//  Petty
//
//  Created by chuongmd on 4/3/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import Reusable

final class LoginViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var loginButton: CustomButton!
    @IBOutlet private weak var registerButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction private func handleLogin(_ sender: Any) {
        guard let userEmail = emailTextField.text, let userPassword = passTextField.text else { return }
        
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { [weak self] (_, error) in
            guard let self = self else { return }
            if let error = error as NSError? {
                print(error as Any)
                let errorCode = AuthErrorCode(rawValue: error.code)
                self.handleLoginAuthError(with: errorCode)
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.dismiss()
                let vc = HomeViewController.instantiate()
                self.present(vc, animated: true)
            }
        }
    }
    
    @IBAction private func handleRegister(_ sender: Any) {
        guard let userEmail = emailTextField.text, let userPassword = passTextField.text else { return }
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { [weak self] (_, error) in
            guard let self = self else { return }
            if let error = error as NSError? {
                print(error as Any)
                let errCode = AuthErrorCode(rawValue: error.code)
                self.handleRegisterAuthError(with: errCode)
            } else {
                self.showRegisterSuccessAlert()
            }
        }
    }
}

extension LoginViewController: FirebaseAuthorizable {
    internal func handleLoginAuthError(with code: AuthErrorCode?) {
        guard let code = code else { return }
        
        switch code {
        case .emailAlreadyInUse:
            showEmailAlreadyInUseAlert()
        case .invalidEmail:
            showInvalidLoginEmailAlert()
        case .wrongPassword:
            showWrongLoginPasswordAlert()
        case .userNotFound:
            showUserNotFoundAlert()
        case .userDisabled:
            showUserDisabledAlert()
        default:
            break
        }
    }
    internal func handleRegisterAuthError(with code: AuthErrorCode?) {
        guard let code = code else { return }
        
        switch code {
        case .invalidEmail:
            showInvalidRegisterEmailAlert()
        case .emailAlreadyInUse:
            showEmailAlreadyInUseAlert()
        default:
            break
        }
    }
}

extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
