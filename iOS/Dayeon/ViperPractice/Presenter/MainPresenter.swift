//
//  MainPresenter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol : class {
    func fetch()
    func mergeInteractionCandy(_ interactor : MainInteractorProtocol, FetchCandy storeObject: StoreEntity)
}

struct StoreViewModel {
    let name: String
    let imageName: String
}

class MainPresenter {
    weak var view : MainViewProtocol? // 뷰 연결 
    var router : RouterProtocol? // 라우터 연결
    var interactor : MainInteractorProtocol? // 인터렉터 연결
}

extension MainPresenter : MainPresenterProtocol {
    func fetch() {
        interactor?.fetchStore()
    }
   
    func mergeInteractionCandy(_ interactor: MainInteractorProtocol, FetchCandy storeObject: StoreEntity) {
        let viewModel = StoreViewModel(name: storeObject.StoreName, imageName: storeObject.StoreImage)
        view?.setCandyStore(viewmodel: viewModel)
    }
}
