//
//  MainBuilder.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

class MainBuilder {
    func buildModule(arroundView view: MainViewProtocol) {
        let presenter = MainPresenter() //초기화 시킬 때 메모리에 올라가며 RC가 들어감
        let interactor = MainInteractor(withAPIWorker: StoreAPIWorker())
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router as RouterProtocol
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
