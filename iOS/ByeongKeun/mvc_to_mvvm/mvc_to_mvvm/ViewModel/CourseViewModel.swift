//
//  CourseViewModel.swift
//  mvc_to_mvvm
//
//  Created by byeonggeunSon on 2020/03/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

struct CourseViewModel {
  let name: String
  let detailTextString: String
  let accessoryType: UITableViewCell.AccessoryType
  // Dependancy Injection (DI)
  init(course: Course){
    self.name = course.name
    
    if course.number_of_lessons > 35 {
      detailTextString = "Lessons 30+ Check it out!"
      accessoryType = .detailDisclosureButton
    }else{
      detailTextString = "Lessons: \(course.number_of_lessons)"
      accessoryType = .none 
    }
  }
}
