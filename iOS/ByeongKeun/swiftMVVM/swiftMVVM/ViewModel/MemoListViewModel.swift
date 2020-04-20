//
//  MemoListViewModel.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class MemoListViewModel: CommonViewModel{
  lazy var memoList = Dynamic<[Memo]>(self.storage.memoList())
  
  func performUpdate(memo: Memo, content: String){
    self.storage.update(memo: memo, content: content)
    self.memoList.value = storage.memoList()
  }
  func performDelete(memo: Memo){
    self.storage.delete(memo: memo)
    self.memoList.value = storage.memoList()
  }
  
  func createAction(){
    let memo = storage.createMemo(content: "")
    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: { (content) in
      self.performUpdate(memo: memo, content: content)
    }) {
      self.performDelete(memo: memo)
    }
    
    let composeScene = Scene.memoCompose(composeViewModel)
    self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true)
  }
  
  func detailAction(memo: Memo){
    let detailViewModel = MemoDetailViewModel(memo: memo, title: "메모 보기", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
    let detailScene = Scene.memoDetail(detailViewModel)
    self.sceneCoordinator.transition(to: detailScene, using: .push, animated: true)
  }
}
