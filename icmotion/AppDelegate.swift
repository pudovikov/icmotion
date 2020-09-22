//
//  AppDelegate.swift
//  icmotion
//
//  Created by Vladimir on 19.09.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
                        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let splashScreenController = storyboard.instantiateViewController(withIdentifier: "authorizationViewController")
        self.window!.rootViewController = splashScreenController
        self.window!.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            self.window!.overrideUserInterfaceStyle = .light
        }
        
        return true
    }
}

