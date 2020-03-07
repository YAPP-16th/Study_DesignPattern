//
//  TrafficLightViewController.swift
//  MVPExample
//
//  Created by 홍정민 on 2020. 2. 11..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation
import UIKit

class TrafficLightViewController : UIViewController, TrafficLightViewProtocol {
    
    //신호등에 따른 description을 보여줄 라벨
    @IBOutlet weak var descriptionLabel : UILabel!
    
    //presenter
    private weak var presenter: TrafficLightPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = TrafficLightPresenter(view: self)
    }
    
    @IBAction func redLightAction(_sender: Any) {
        presenter.trafficLightColorSelected(colorName: "Red")
    }
    
    @IBAction func yelloLightAction(_sender: Any) {
        presenter.trafficLightColorSelected(colorName: "Yellow")
    }
    
    @IBAction func greenLightAction(_sender: Any) {
        presenter.trafficLightColorSelected(colorName: "Green")
    }
    
    func displayTrafficLight(description: String) {
        descriptionLabel.text = description
    }
}
