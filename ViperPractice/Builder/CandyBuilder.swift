//
//  CandyBuilder.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

// Builder = Configurator
// Appdelegate 또는 이전 router 내의 모든 VIPER 부품을 초기화하지 않는 대신, Builder 클래스를 사용하여 모듈에 대한 모든 쵝화 코드를 넣을 수 있다.
// 일반적으로 View 주위에 VIPER 모듈을 구축하는 정적클래스만 포함한다.
// 간단하게 말하면 Builder는 초기화용 코드

class CandyBuilder {    
    class func buildModule(arroundView view: ViewProtocol){
        let presenter = CandyPresenter()
        let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
        let router = CandyRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = router as CandyRouterProtocol
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
