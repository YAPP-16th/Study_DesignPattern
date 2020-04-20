//
//  Course.swift
//  mvc_to_mvvm
//
//  Created by byeonggeunSon on 2020/03/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Course: Decodable{
  let id: Int
  let name: String
  let number_of_lessons: Int
}
