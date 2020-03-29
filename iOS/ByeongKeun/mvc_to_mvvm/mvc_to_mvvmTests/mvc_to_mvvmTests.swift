//
//  mvc_to_mvvmTests.swift
//  mvc_to_mvvmTests
//
//  Created by byeonggeunSon on 2020/03/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import XCTest
@testable import mvc_to_mvvm
class mvc_to_mvvmTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testCourseViewModel(){
    let course = Course(id: 0, name: "My Course Name", number_of_lessons: 10)
    let viewmodel = CourseViewModel(course: course)
    XCTAssertEqual(course.name, viewmodel.name)
    
    XCTAssertEqual("Lessons: \(course.number_of_lessons)", viewmodel.detailTextString)
    XCTAssertEqual(.none, viewmodel.accessoryType)
  }
  
  func testCourseViewModelOverThreshold(){
    let course = Course(id: 0, name: "My Course Name", number_of_lessons: 100)
       let viewmodel = CourseViewModel(course: course)
       XCTAssertEqual(course.name, viewmodel.name)
       
       XCTAssertEqual("Lessons 30+ Check it out!", viewmodel.detailTextString)
    XCTAssertEqual(.detailDisclosureButton , viewmodel.accessoryType)
  }
  
  
}
