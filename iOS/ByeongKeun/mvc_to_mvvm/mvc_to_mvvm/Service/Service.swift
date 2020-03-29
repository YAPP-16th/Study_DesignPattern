//
//  Service.swift
//  mvc_to_mvvm
//
//  Created by byeonggeunSon on 2020/03/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class Service: NSObject{
  static let shared = Service()
  
  private override init() { }
  func fetchCourses(completion: @escaping ([Course]?, Error?) -> Void){
    let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err{
        completion(nil, err)
        print("Failed to fetch courses:", err)
        return
      }
      
      guard let data = data else { return }
      do {
        let courses = try JSONDecoder().decode([Course].self, from: data)
        DispatchQueue.main.async {
          completion(courses, nil)
        }
      }catch let jsonErr {
        print("Failed to decode: ", jsonErr)
        completion(nil, jsonErr)
      }
    }.resume()
  }
}
