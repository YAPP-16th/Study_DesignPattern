//
//  MainBuilder.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit


class MainBuilder {
    class func MainModule(arroundView view: MainViewProtocol) -> UIViewController {
        let mainView = MainView(nibName: "MainView", bundle: nil)
        let presenter = MainPresenter()
        let interactor = MainInteractor(withAPIWorker: StoreAPIWorker())
        let router = MainRouter()
        var navController : UINavigationController
        
        mainView.presenter = presenter
        presenter.view = mainView
        presenter.wireframe = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        navController = UINavigationController(rootViewController : mainView)
        
        return navController
    }
}
