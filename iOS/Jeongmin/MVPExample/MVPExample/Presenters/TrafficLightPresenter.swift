//
//  TrafficLightPresenter.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate : NSObjectProtocol {
    func displayTrafficLight(description: String)
}


class TrafficLightPresenter {
    private let trafficLightService : TrafficLightService
    weak private var trafficLightViewDelegate : TrafficLightViewDelegate?
    
    init(trafficLightService : TrafficLightService){
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate : TrafficLightViewDelegate?){
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    //ViewController에서 Action이 발생하면 Service에 있는 모델과 비교해서 description을 ViewController로 넘겨줌
    func trafficLightColorSelected(colorName:(String)){
        
        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] traficLight in
            
            if let traficLight = traficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: traficLight.description)
            }
        }
    }
}
