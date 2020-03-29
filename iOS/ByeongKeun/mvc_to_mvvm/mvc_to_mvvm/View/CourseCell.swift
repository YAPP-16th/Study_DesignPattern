//
//  CourseCell.swift
//  mvc_to_mvvm
//
//  Created by byeonggeunSon on 2020/03/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell{
  var course: Course!{
    didSet{
      textLabel?.text = course.name
      if course.number_of_lessons > 35{
        accessoryType = .detailDisclosureButton
        detailTextLabel?.text = "Lessons 30+ Check it out!"
      }else{
        detailTextLabel?.text = "Lessons: \(course.number_of_lessons)"
        accessoryType = .none
      }
    }
  }
  
  override func setHighlighted(_ highlighted: Bool, animated: Bool) {
    super.setHighlighted(highlighted, animated: animated)
    contentView.backgroundColor = isHighlighted ? .highlightColor : .white
    textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
    detailTextLabel?.textColor = isHighlighted ? .white : .black
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    textLabel?.numberOfLines = 0
    detailTextLabel?.textColor = .black
    detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
}
