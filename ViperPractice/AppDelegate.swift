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
    var navController : UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        // 스토리보드 없이 xib로만 프로젝트를 구성했을 시 이런 식으로 윈도우를 선언해야 함
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainView = MainView(nibName: "MainView", bundle: nil)
        MainBuilder.buildModule(arroundView: mainView)
        navController = UINavigationController(rootViewController: mainView)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
       
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

