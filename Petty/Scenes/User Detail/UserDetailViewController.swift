//
//  UserDetailViewController.swift
//  Petty
//
//  Created by chuongmd on 4/8/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class UserDetailViewController: UIViewController {
    @IBOutlet weak var stackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationController?.isNavigationBarHidden = true
        stackView.addTopBorderWithColor(color: .lightGray, width: 1)
        stackView.addBottomBorderWithColor(color: .lightGray, width: 1)
    }
}
