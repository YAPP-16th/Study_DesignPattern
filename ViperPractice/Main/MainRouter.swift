//
//  MainRouter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

protocol MainRouterProtocol {
    func pushToCandyStore()
}


class MainRouter : MainRouterProtocol {
    func pushToCandyStore() {
        //let moveToCandy =
        
    }
    
    func createModule(arroundView view : MainViewProtocol) {
        let presenter = MainPresenter()
        let interactor = MainInteractor(withAPIWorker: StoreAPIWorker())
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
