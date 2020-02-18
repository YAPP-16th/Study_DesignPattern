//
//  CandyPresenter.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

protocol CandyPresenterProtocol : class {
    func fetchCandy()
    func update(candyQuantity quantity : Int)
    // 병합 성공
    func interactor(_ interactor : CandyInteractorProtocol, didFetch object: CandyEntity)
    // 병합 실패
    func interactor(_ interactor : CandyInteractorProtocol, didFailWith error:Error)
    // total price 업데이트
    func interactor(_ interactor: CandyInteractorProtocol, didUpdateTotalPrice totalPrice: Float, totalInclTax:Float,vat:Float, quantity:Int)
}

struct CandyViewModel{
    let title: String
    let description: String
    let price: String
    let imageName: String
}

struct TotalPriceViewModel {
    let totalPrice: String
    let totalInclTax: String
    let vat: String
    let quantity: String
}

class CandyPresenter{
    weak var view : CandyViewProtocol?
    var wireframe : CandyRouterProtocol?
    var interactor : CandyInteractorProtocol?
}



extension CandyPresenter : CandyPresenterProtocol {
    func fetchCandy() {
        interactor?.fetchCandy()
    }
    
    func update(candyQuantity quantity: Int) {
        interactor?.update(candyQuantity: quantity)
    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity) {
        let priceText = "\(object.price) won"
        let candyViewModel = CandyViewModel(title: object.title, description: object.description, price: priceText, imageName: object.imageName)
        view?.set(viewModel: candyViewModel)
    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error) {
        //
    }
    
    func interactor(_ interactor: CandyInteractorProtocol,
    didUpdateTotalPrice totalPrice: Float,
    totalInclTax: Float,
    vat: Float,
    quantity: Int) {
        let totalPriceText = "Total Price : \(totalPrice)won"
        let totalInclTaxText = "Incl Tax : \(totalInclTax)won"
        let vatText = "Tax : \(vat)%"
        let quantity = "Quantity : \(quantity)"
        
        let totalPriceViewModel = TotalPriceViewModel(totalPrice: totalPriceText, totalInclTax: totalInclTaxText, vat: vatText, quantity: quantity)
        
        view?.set(totalPriceViewModel: totalPriceViewModel)
    }
}
