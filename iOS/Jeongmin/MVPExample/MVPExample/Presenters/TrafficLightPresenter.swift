//
//  TrafficLightPresenter.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

protocol TrafficLightPresenterProtocol {
    func setViewDelegate(trafficLightViewDelegate : TrafficLightViewDelegate?)
    
    func trafficLightColorSelected(colorName:(String))
}

protocol TrafficLightViewProtocol {
    func displayTrafficLight(description: String)
}

class TrafficLightPresenter: TrafficLightPresenterProtocol {
    private weak var view : TrafficLightViewProtocol!
    
    weak var model = TrafficLightModel()
    
    init(view: TrafficLightViewProtocol) {
        self.view = view
    }
    
    func trafficLightColorSelected(colorName:(String)){
        guard let light = model.getTrafficLight(colorName) else {
            return
        }
        
        self.view.displayTrafficLight(description: light.description)
    }
}
