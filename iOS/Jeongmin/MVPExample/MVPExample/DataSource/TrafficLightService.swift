//
//  TrafficLightService.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

class TrafficLightService{
    func getTrafficLight(colorName: (String), callBack: (TrafficLight?) -> Void){
       
        //신호등 배열
        let trafficLights = [TrafficLight(colorName : "Red", description: "Stop"),
                             TrafficLight(colorName: "Green", description: "Go"),
                             TrafficLight(colorName: "Yellow", description: "About to change to Red")]
        
        //first : Returns the first element of the sequence that satisfies the given predicate.
        //
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName}){
            callBack(foundTrafficLight)
        }else {
            callBack(nil)
        }
    }
}
