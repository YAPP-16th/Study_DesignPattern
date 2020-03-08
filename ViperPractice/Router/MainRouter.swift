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
    func pushToCandyScreen()
}

struct MainRouterInput{
    private func setCandyview()-> CandyView {
        let storeView = CandyView(nibName: "CandyView",bundle: nil)
        CandyBuilder.buildModule(arroundView: storeView)
        return storeView
    }
    
    func push(from:Viewable) {
        let view = self.setCandyview()
        from.push(view, animated: true)
    }
    
    func present(from:Viewable) {
        let nav = UINavigationController(rootViewController: setCandyview())
        from.present(nav, animated: true)
    }
}

class MainRouter : RouterProtocol {
    func pushToCandyScreen(){
        let storeView = CandyView(nibName: "CandyView",bundle: nil)
        CandyBuilder.buildModule(arroundView: storeView)
        //UINavigationController.pushViewController(storeView, animated: true)
        print("push new screen complete")
    }
}


