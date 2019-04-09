//
//  AppDelegate.swift
//  Petty
//
//  Created by chuongmd on 4/2/19.
//  Copyright © 2019 Sun-Asterisk. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard = Storyboard.mainStoryBoard
        let navigateToLogin = storyBoard.instantiateViewController(withIdentifier: Constant.loginViewController)
        let navigateToHome = storyBoard.instantiateViewController(withIdentifier: Constant.loginViewController)
        if Auth.auth().currentUser != nil {
            window?.rootViewController = navigateToHome
        } else {
            window?.rootViewController = navigateToLogin
        }
        window?.makeKeyAndVisible()
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "appFirstTimeOpend") == nil {
            //if app is first time opened then it will be nil
            userDefaults.setValue(true, forKey: "appFirstTimeOpend")
            // signOut from FIRAuth
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
        }
        return true
    }
}
