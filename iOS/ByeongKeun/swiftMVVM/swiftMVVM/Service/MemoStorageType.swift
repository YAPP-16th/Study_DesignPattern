//
//  MemoStorageType.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol MemoStorageType{
  @discardableResult
  func createMemo(content: String) -> Memo
  
  @discardableResult
  func memoList() -> [Memo]
  
  @discardableResult
  func update(memo: Memo, content: String) -> Memo
  
  @discardableResult
  func delete(memo: Memo) -> Memo
}
