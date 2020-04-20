//
//  MainPresenter.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation


protocol MainPresenterProtocol : class {
    var view : MainViewProtocol? {get set}
    var router : RouterProtocol? {get set}
    var item : CandyEntity? {get set}
    
    // presenter -> router
    func viewDidLoad(fromView: Viewable)
    // presenter -> interactor
    func fetch()
    // present -> view (data setting)
    func mergeInteractionCandy(_ interactor : MainInteractorProtocol, FetchCandy storeObject: StoreEntity)
}


class MainPresenter {
    weak var view : MainViewProtocol? // 뷰 연결 
    var router : RouterProtocol? // 라우터 연결
    var interactor : MainInteractorProtocol? // 인터렉터 연결
    var item : CandyEntity?
}


extension MainPresenter : MainPresenterProtocol {
    func viewDidLoad(fromView: Viewable) {
        router?.push(from: fromView)
    }
    
    func fetch() {
        interactor?.fetchStore()
    }
   
    func mergeInteractionCandy(_ interactor: MainInteractorProtocol, FetchCandy storeObject: StoreEntity) {
        let viewModel = StoreEntity(StoreName: storeObject.StoreName, StoreImage: storeObject.StoreImage)
        view?.setCandyStore(viewmodel: viewModel)
    }
}

