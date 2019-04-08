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
    
    @IBAction func loginPressed(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text!) { [weak self] (user, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                DispatchQueue.global(qos: .default).async {
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
                self?.performSegue(withIdentifier: "gotoHome", sender: self)
            }
        }
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!) { [weak self] (user, error) in
            guard self != nil else { return } 
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                AlertView.showAlert(view: self!, message: Alert.registerMessage, alertTitle: Alert.registerAlertTitle, actionTitle: Alert.registerActionTitle)
            }
        }
    }
}
