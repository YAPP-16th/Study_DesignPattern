//
//  MainBuilder.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

class MainBuilder {
    class func buildModule(arroundView view: MainViewProtocol) {
        //let mainView = MainView(nibName: "MainView", bundle: nil)
        let presenter = MainPresenter()
        let interactor = MainInteractor(withAPIWorker: StoreAPIWorker())
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router as RouterProtocol
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
}
