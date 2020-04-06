//
//  AppDelegate.swift
//  MVPExample_CollectionView
//
//  Created by 홍정민 on 2020. 2. 14..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // 스토리보드 기반의 앱으로 구동되면 시스테에서 UIWindonw객체를 할당하며 초기화
    // 코드 기반일 경우 didFinishLaunchingWithOptions 타이밍에 직접 생성
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        //window는 어플리케이션에서 여러 뷰들을 올릴 수 있는 창
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter = ColorCollectionPresenter()
        let rootViewController = ColorCollectionViewController(with: presenter)
        window?.rootViewController = rootViewController
        
        //만든 윈도우에서 키보드의 입력을 받을 수 있게 하는 코드
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

