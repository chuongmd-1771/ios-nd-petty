//
//  SettingViewController.swift
//  Petty
//
//  Created by chuongmd on 4/16/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Reusable
import Firebase

final class SettingViewController: UIViewController {
    @IBOutlet private weak var logoutButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleDismissToHome()
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func handleDismissToHome() {
        let down = UISwipeGestureRecognizer(target: self,
                                            action: #selector(swipeDown(gesture:)))
        down.direction = .down
        view.addGestureRecognizer(down)
    }
    
    @objc
    private func swipeDown(gesture: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}

extension SettingViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}

