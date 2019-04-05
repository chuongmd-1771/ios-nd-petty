//
//  PetDetailViewController.swift
//  Petty
//
//  Created by chuongmd on 4/5/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit

final class PetDetailViewController: UIViewController {
    @IBOutlet private weak var petImageView: UIView!
    @IBOutlet private weak var petDetailView: UIView!
    @IBOutlet private weak var likeNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func handleLikeButton(_ sender: Any) {
    }
    
    @IBAction func handleFollowButton(_ sender: Any) {
    }
    
    fileprivate func setupUI() {
        
    }
}
