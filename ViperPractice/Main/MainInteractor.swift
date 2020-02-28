//
//  MainInteractor.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol {
    func fetchStore()
}

class MainInteractor : MainInteractorProtocol {
    private var candyStore : StoreEntity?
    private let storeAPIWorker : APIStoreWorkerProtocol
    
    var presenter : MainPresenterProtocol?
    
    required init(withAPIWorker apiworker : APIStoreWorkerProtocol) {
        self.storeAPIWorker = apiworker
    }
    
    func fetchStore() {
        storeAPIWorker.fetchCandyStore{ [unowned self] (candyStore) in
            self.candyStore = candyStore
        
        }
    }
    
}
