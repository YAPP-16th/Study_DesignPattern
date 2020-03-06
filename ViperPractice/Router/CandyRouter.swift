//
//  CandyRouter.swift
//  ViperPractice
//
//  Created by 성다연 on 04/03/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation
import UIKit


//struct CandyRouterInput {
//    private func view(candyEntity: CandyEntity) -> CandyView {
//        let view = CandyView()
//        let presenter = CandyPresenter()
//        let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
//        let router = CandyRouter()
//        
//        view.presenter = presenter
//        presenter.view = view
//        presenter.wireframe = router as CandyRouterProtocol
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//
//        return view
//    }
//
//    func push(from: Viewable, candyEntity: CandyEntity){
//        let view = self.view(candyEntity: candyEntity)
//        from.push(view, animated: true)
//    }
//}

protocol CandyRouterProtocol{
//    func pushToNextScreen(nav:UINavigationController?)
}

class CandyRouter : CandyRouterProtocol {
//    func pushToNextScreen(nav navigationController:UINavigationController?){
//        let storeView = CandyView(nibName: "CandyView",bundle: nil)
//        CandyBuilder.buildModule(arroundView: storeView)
//        navigationController?.pushViewController(storeView, animated: true)
//    }
}
