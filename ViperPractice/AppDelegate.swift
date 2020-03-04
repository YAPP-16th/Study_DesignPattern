//
//  AppDelegate.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        let routing = MainRouter()
        window = UIWindow(frame: UIScreen.main.bounds)
        //window = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 1000))
        // Display Window
        window?.makeKeyAndVisible()
        window?.rootViewController = routing.navController
       
        return true
    }

    // MARK: UISceneSession Lifecycle

   

    func applicationWillResignActive(_ application: UIApplication) {
        //
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //
    }

}

