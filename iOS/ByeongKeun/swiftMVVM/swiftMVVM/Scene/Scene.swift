//
//  Scene.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum Scene{
  case memoList(MemoListViewModel)
  case memoCompose(MemoComposeViewModel)
  case memoDetail(MemoDetailViewModel)
}

extension Scene{
  func instantiate() -> UIViewController{
    switch self {
    case .memoList(let viewModel):
      guard let nav = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { fatalError() }
      guard var listVC = nav.topViewController as? MemoListViewController else { fatalError() }
      listVC.bind(viewModel: viewModel)
      return nav
    case .memoCompose(let viewModel):
      var composeVC = MemoComposeViewController()
      composeVC.bind(viewModel: viewModel)
      let nav = UINavigationController(rootViewController: composeVC)
      return nav
    case .memoDetail(let viewModel):
      var detailVC = MemoDetailViewController()
      detailVC.bind(viewModel: viewModel)
      return detailVC
    }
    
  }
}
