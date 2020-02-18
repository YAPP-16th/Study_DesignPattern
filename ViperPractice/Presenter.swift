//
//  CandyPresenter.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

protocol PresenterProtocol : class {
    func fetch()
    func update(candyQuantity candyquantity : Int, chocoQuantity chocoquantity: Int)
    // 병합 성공
    func interactorCandy(_ interactor : InteractorProtocol, didFetchCandy candyObject: Entity)
    func interactorChoco(_ interactor : InteractorProtocol, didFetchChoco chocoObject: Entity)
    // 병합 실패
    func interactor(_ interactor : InteractorProtocol, didFailWith error:Error)
    // total price 업데이트
    func interactor(_ interactor: InteractorProtocol, didUpdateTotalPrice totalPrice: Float, totalInclTax:Float,vat:Float, candyQuantity:Int, chocoQuantity:Int)
}

// Presenter는 View에서 사용할 데이터 변환과 UI 작업 가로채기 작업을 수행한다.

struct ViewModel{
    let title: String
    let description: String
    let price: String
    let imageName: String
}

struct TotalPriceViewModel {
    let totalPrice: String
    let totalInclTax: String
    let vat: String
    let candyQuantity: String
    let chocoQuantity: String
}

class Presenter{
    weak var view : ViewProtocol?
    var wireframe : RouterProtocol?
    var interactor : InteractorProtocol?
}

extension Presenter : PresenterProtocol {
    func fetch() {
        interactor?.fetchItems()
    }
    
    func update(candyQuantity candyquantity: Int, chocoQuantity chocoquantity: Int) {
        interactor?.update(candyQuantity: candyquantity, chocoQuantity: chocoquantity)
    }
    
    func interactorCandy(_ interactor: InteractorProtocol, didFetchCandy candyObject: Entity) {
        let candyPriceText = "\(candyObject.price) 원"
        let candyViewModel = ViewModel(title: candyObject.title, description: candyObject.description, price: candyPriceText, imageName: candyObject.imageName)
        
        view?.setCandy(viewModel: candyViewModel)
    }
    
    func interactorChoco(_ interactor: InteractorProtocol, didFetchChoco chocoObject: Entity) {
         let chocoPriceText = "\(chocoObject.price) 원"
         let chocoViewModel = ViewModel(title: chocoObject.title, description: chocoObject.description, price: chocoPriceText, imageName: chocoObject.imageName)
        
        view?.setChoco(viewModel: chocoViewModel)
    }
    
    func interactor(_ interactor: InteractorProtocol, didFailWith error: Error) {
        //
    }
    
    func interactor(_ interactor: InteractorProtocol,
    didUpdateTotalPrice totalPrice: Float,
    totalInclTax: Float,
    vat: Float, candyQuantity:Int, chocoQuantity:Int) {
        let totalPriceText = "Total Price : \(totalPrice)won"
        let totalInclTaxText = "Incl Tax : \(totalInclTax)won"
        let vatText = "Tax : \(vat)%"
        
        let totalPriceViewModel = TotalPriceViewModel(totalPrice: totalPriceText, totalInclTax: totalInclTaxText, vat: vatText, candyQuantity: String(candyQuantity), chocoQuantity: String(chocoQuantity))
        
        view?.set(totalPriceViewModel: totalPriceViewModel)
    }
}
