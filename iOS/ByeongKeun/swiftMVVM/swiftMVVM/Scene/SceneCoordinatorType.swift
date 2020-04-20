//
//  SceneCoordinatorType.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol SceneCoordinatorType {
  func transition(to scene: Scene, using style: TransitionStyle, animated: Bool)
  func close(animated: Bool)
}
