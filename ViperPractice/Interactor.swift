//
//  CandyInteractor.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

// Candy 오브젝트로 데이터를 얻기 위해 웹 서비스 호출을 하는 api worker을 만든다.
protocol InteractorProtocol {
    func fetchItems()
    func update(candyQuantity candyquantity:Int, chocoQuantity chocoquantity: Int)
}

// Interactor의 안에 비즈니스 로직이 있어야한다.
// 네트워크 호출이나 데이터베이스 쿼리 등 데이터 수집 작업을 이곳에서 진행한다.

class Interactor : InteractorProtocol {
    
    private static let vat : Float = 6.5
    private var candyEntity : Entity?
    private var chocoEntity : Entity?
    private let apiWorker : APIWorkerProtocol
    
    var presenter : PresenterProtocol?
    
    required init(withApiWorker apiworker: APIWorkerProtocol){
        self.apiWorker = apiworker
    }
    
    func fetchItems() {
        apiWorker.fetchCandy{ [unowned self] (candyEntity) in
            self.candyEntity = candyEntity
            self.presenter?.interactorCandy(self, didFetchCandy : candyEntity)
        }
        apiWorker.fetchChoco{ [unowned self] (chocoEntity) in
                   self.chocoEntity = chocoEntity
                   self.presenter?.interactorChoco(self, didFetchChoco: chocoEntity)
        }
    }
    

    func update(candyQuantity candyquantity: Int, chocoQuantity chocoquantity: Int) {
           guard let candyEntity = self.candyEntity else { return }
           guard let chocoEntity = self.chocoEntity else { return }
           
           let totalPrice = candyEntity.price * Float(candyquantity) + chocoEntity.price * Float(chocoquantity)
           let tax = (totalPrice/100) * Interactor.vat
           let totalInclTax = totalPrice + tax
        
           presenter?.interactor(self,
                                 didUpdateTotalPrice: totalPrice,
                                 totalInclTax: totalInclTax,
                                 vat: Interactor.vat,
                                 candyQuantity: candyquantity, chocoQuantity: chocoquantity)
    }
       
}
