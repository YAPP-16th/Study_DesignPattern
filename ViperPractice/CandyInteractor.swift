//
//  CandyInteractor.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

// Candy 오브젝트로 데이터를 얻기 위해 웹 서비스 호출을 하는 api worker을 만든다.
protocol CandyInteractorProtocol {
    func fetchCandy()
    func update(candyQuantity quantity:Int)
}

class CandyInteractor : CandyInteractorProtocol {
    private static let vat : Float = 6.5
    private var candyEntity : CandyEntity?
    private let apiWorker : CandyAPIWorkerProtocol
    
    var presenter : CandyPresenterProtocol?
    
    required init(withApiWorker apiworker: CandyAPIWorkerProtocol){
        self.apiWorker = apiworker
    }
    
    func fetchCandy() {
        apiWorker.fetchCandy{ [unowned self] (candyEntity) in
            self.candyEntity = candyEntity
            self.presenter?.interactor(self, didFetch : candyEntity)
        }
    }
    
    func update(candyQuantity quantity: Int) {
        guard let candyEntity = self.candyEntity else {
            return
        }
        
        let totalPrice = candyEntity.price * Float(quantity)
        let tax = (totalPrice/100) * CandyInteractor.vat
        let totalInclTax = totalPrice + tax
        presenter?.interactor(self,
                              didUpdateTotalPrice: totalPrice,
                              totalInclTax: totalInclTax,
                              vat: CandyInteractor.vat,
                              quantity: quantity)
    }
}
