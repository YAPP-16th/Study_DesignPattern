//
//  AppDelegate.swift
//  MVVM_NoRx
//
//  Created by 김태인 on 2020/04/05.
//  Copyright © 2020 김태인. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let rootVC = window?.rootViewController as? ViewController {
            let viewModel = MVVMViewModel()
            rootVC.viewModel = viewModel
        }
        return true
    }
}

