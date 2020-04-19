//
//  MemoryStorage.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class MemoryStorage: MemoStorageType{
  private var list = [
    Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
    Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20))
  ]
  
  @discardableResult
  func createMemo(content: String) -> Memo {
    let memo = Memo(content: content)
    list.insert(memo, at: 0)
    return memo
  }
  
  @discardableResult
  func memoList() -> [Memo] {
    return list
  }
  
  func update(memo: Memo, content: String) -> Memo {
    let updated = Memo(original: memo, updatedContent: content)
    if let index = list.firstIndex(where: { $0 == memo }){
      list.remove(at: index)
      list.insert(updated, at: index)
    }
    return updated
  }
  
  @discardableResult
  func delete(memo: Memo) -> Memo {
    if let index = list.firstIndex(where: { $0 == memo }){
      list.remove(at: index)
    }
    return memo
  }
}
