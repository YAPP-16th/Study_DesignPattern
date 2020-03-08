//
//  RouterInput.swift
//  ViperPractice
//
//  Created by 성다연 on 06/03/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation
import UIKit

struct CandyRouterInput {
    private func view() -> CandyView {
        let view = CandyView()
        let presenter = CandyPresenter()
        let interactor = CandyInteractor(withApiWorker: CandyAPIWorker())
        let router = CandyRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = router as CandyRouterProtocol
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func push(from: Viewable){
        let View = self.view()
        from.push(View, animated: true)
    }
    
    func present(from: Viewable){
        let nav = UINavigationController(rootViewController: view())
        from.present(nav, animated: true)
    }
}


