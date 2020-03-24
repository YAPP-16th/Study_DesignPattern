//
//  TrafficLight.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

struct TrafficLight{
    let colorName: String
    let description: String
}

class TrafficLightModel: TrafficLightModelProtocol {
    func getTrafficLight(_ colorName: (String)) -> TrafficLight? {
       
        //신호등 배열
        let trafficLights = [TrafficLight(colorName : "Red", description: "Stop"),
                             TrafficLight(colorName: "Green", description: "Go"),
                             TrafficLight(colorName: "Yellow", description: "About to change to Red")]
        
        return trafficLights.first(where: {$0.colorName == colorName})
    }
}
