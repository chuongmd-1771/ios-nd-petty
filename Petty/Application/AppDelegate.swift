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
        
        return true
    }
}

