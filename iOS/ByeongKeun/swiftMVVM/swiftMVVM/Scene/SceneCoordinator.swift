//
//  SceneCoordinator.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension UIViewController{
  var sceneViewController: UIViewController{
    return self.children.first ?? self
  }
}

class SceneCoordinator: SceneCoordinatorType{
  private var window: UIWindow
  private var currentVC: UIViewController
  
  required init(window: UIWindow){
    self.window = window
    currentVC = window.rootViewController!
  }
  
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) {
    let target = scene.instantiate()
    
    switch style{
    case .root:
      currentVC = target.sceneViewController
      window.rootViewController = target
    case .push:
      guard let nvc = currentVC.navigationController else { print(TransitionError.navigationControllerMissing)
        return
      }
      nvc.pushViewController(target, animated: animated)
      currentVC = target.sceneViewController
    case .modal:
      currentVC.present(target, animated: animated)
      currentVC = target.sceneViewController
    }
    
  }
  
  func close(animated: Bool) {
    if let presentingVC = self.currentVC.presentingViewController{
      self.currentVC.dismiss(animated: animated) {
        self.currentVC = presentingVC.sceneViewController
      }
    }else if let nav = self.currentVC.navigationController{
      guard nav.popViewController(animated: animated) != nil else {
        fatalError(TransitionError.cannorPop.localizedDescription)
      }
      self.currentVC = nav.viewControllers.last!
    }else{
      fatalError(TransitionError.unknown.localizedDescription)
    }
  }
  
  
}
