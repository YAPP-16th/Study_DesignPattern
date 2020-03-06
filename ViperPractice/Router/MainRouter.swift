//
//  MainRouter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//
import Foundation
import UIKit

protocol RouterProtocol : class {
    func pushToCandyScreen(nav navigationController: UINavigationController)
}

class MainRouter : RouterProtocol {
    func pushToCandyScreen(nav navigationController: UINavigationController){
        let storeView = CandyView(nibName: "CandyView",bundle: nil)
        CandyBuilder.buildModule(arroundView: storeView)
        navigationController.pushViewController(storeView, animated: true)
        print("push new screen complete")
    }
}


