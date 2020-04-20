//
//  AppDelegate.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UINavigationController(rootViewController: MemoListViewController())
    window?.makeKeyAndVisible()
    
    let storage = MemoryStorage()
    let coordinator = SceneCoordinator(window: self.window!)
    let viewModel = MemoListViewModel(title: "메모 목록", sceneCoordinator: coordinator, storage: storage)
    let listScene = Scene.memoList(viewModel)
    viewModel.sceneCoordinator.transition(to: listScene, using: .root, animated: false)
    return true
  }

}

