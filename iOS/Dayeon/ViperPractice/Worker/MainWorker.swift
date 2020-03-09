//
//  MainWorker.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

protocol APIStoreWorkerProtocol {
    func fetchCandyStore(callBack: (StoreEntity) -> Void)
}

class StoreAPIWorker : APIStoreWorkerProtocol {
    func fetchCandyStore(callBack: (StoreEntity) -> Void) {
        let Entity = StoreEntity(StoreName: "Candy Store", StoreImage: "candystoreimg")
        callBack(Entity)
    }
}
