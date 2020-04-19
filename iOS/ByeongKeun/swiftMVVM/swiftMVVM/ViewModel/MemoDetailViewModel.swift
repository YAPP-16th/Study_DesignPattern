//
//  MemoDetailViewModel.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class MemoDetailViewModel: CommonViewModel{
  let memo: Memo
  
  private var formatter: DateFormatter = {
    let f = DateFormatter()
    f.locale = Locale(identifier: "Ko_kr")
    f.dateStyle = .medium
    f.timeStyle = .medium
    return f
  }()
  
  var contents: [String]
  
  init(memo: Memo, title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType){
    self.memo = memo
    contents = [memo.content, formatter.string(from: memo.insertDate)]
    super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
  }
}
