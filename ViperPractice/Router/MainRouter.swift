//
//  MainRouter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//
import Foundation
import UIKit

protocol RouterProtocol {
    func setCandyview() -> CandyView
    func push(from:Viewable)
    func present(from:Viewable)
}

class MainRouter : RouterProtocol {
    func setCandyview()-> CandyView {
        let storeView = CandyView(nibName: "CandyView",bundle: nil)
        CandyBuilder.buildModule(arroundView: storeView)
        return storeView
    }
    
    func push(from:Viewable) {
        let view = self.setCandyview()
        from.push(view, animated: true)
        print("router respond")
    }
    
    func present(from:Viewable) {
        let nav = UINavigationController(rootViewController: setCandyview())
        from.present(nav, animated: true)
    }
}


