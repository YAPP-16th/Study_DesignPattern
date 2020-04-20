//
//  MemoComposeViewModel.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class MemoComposeViewModel: CommonViewModel{
  private let content: String?
  var initialText: String?{
    return content
  }
  
  var saveAction: ((String) -> Void)?
  var cancelAction: (() -> Void)?
  
  init(title: String, content: String? = nil, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType, saveAction: ((String) -> Void)? = nil, cancelAction: (() -> Void)? = nil){
    self.content = content
    self.saveAction = saveAction
    self.cancelAction = cancelAction
    
    super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
  }
  
}
