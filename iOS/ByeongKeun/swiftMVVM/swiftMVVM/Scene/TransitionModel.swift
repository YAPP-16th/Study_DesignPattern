//
//  TransitionModel.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum TransitionStyle{
  case root
  case push
  case modal
}

enum TransitionError:Error{
  case navigationControllerMissing
  case cannorPop
  case unknown
}
