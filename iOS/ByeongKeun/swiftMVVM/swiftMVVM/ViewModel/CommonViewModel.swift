//
//  CommonViewModel.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class CommonViewModel: NSObject{
  let title: String
  let sceneCoordinator: SceneCoordinatorType
  let storage: MemoStorageType
  
  init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType){
    self.title = title
    self.sceneCoordinator = sceneCoordinator
    self.storage = storage
  }
}
