//
//  LoginViewController.swift
//  Petty
//
//  Created by chuongmd on 4/3/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email_txt: UITextField!
    @IBOutlet weak var pass_txt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func loginPressed(_ sender: Any)
    {
        
    }
    
    @IBAction func registerPressed(_ sender: Any)
    {
        
    }
    
    func setupUI()
    {
        // do something
    }
}


