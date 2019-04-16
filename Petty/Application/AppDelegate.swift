//
//  AppDelegate.swift
//  Petty
//
//  Created by chuongmd on 4/2/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Firebase
import Reusable

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate, StoryboardBased {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        checkIfUserSigned()
        checkIfAppRunFirstTime()
        return true
    }
    
    func checkIfAppRunFirstTime() {
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "appFirstTimeOpen") == nil {
            //if app is first time opened then it will be nil
            userDefaults.setValue(true, forKey: "appFirstTimeOpen")
            // signOut from FIRAuth
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func checkIfUserSigned() {
        guard let windows = window else { return }
        let navigateToLogin = LoginViewController.instantiate()
        let navigateToHome = HomeViewController.instantiate()
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            guard self != nil else { return }
            windows.rootViewController = user != nil ? navigateToHome : navigateToLogin
        }
        window?.makeKeyAndVisible()
    }
}
