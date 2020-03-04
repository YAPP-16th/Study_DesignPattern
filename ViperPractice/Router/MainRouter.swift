//
//  MainRouter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    
}


class MainRouter : RouterProtocol {
    let mainView = MainView(nibName: "MainView", bundle: nil)
    let presenter = MainPresenter()
    let interactor = MainInteractor(withAPIWorker: StoreAPIWorker())
    var navController : UINavigationController?
    
    init(){
        mainView.presenter = presenter
        presenter.view = mainView
        presenter.interactor = interactor
        presenter.wireframe = self
        interactor.presenter = presenter
        navController = UINavigationController(rootViewController : mainView)
    }
    
    func pushView(){
        
    }
}


