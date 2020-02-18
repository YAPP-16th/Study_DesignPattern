//
//  CandyBuilder.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

class CandyBuilder {
    class func buildModule(arroundView view:CandyViewProtocol){
        let presenter = CandyPresenter()
        let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
        let router = CandyRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
