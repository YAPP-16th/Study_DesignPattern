//
//  ViewModelBindableType.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol ViewModelBindableType{
  associatedtype ViewModelType
  
  var viewModel: ViewModelType! { get set }
  func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController{
  mutating func bind(viewModel: ViewModelType){
    self.viewModel = viewModel
    loadViewIfNeeded()
    
    bindViewModel()
  }
}
