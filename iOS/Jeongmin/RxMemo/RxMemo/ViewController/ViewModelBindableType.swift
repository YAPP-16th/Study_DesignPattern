//
//  ViewModelBindable.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import UIKit

//ViewModel의 타입은 ViewController마다 다르기에 Protocol타입을 Generic타입으로
protocol ViewModelBindableType {
    //viewModel타입이 달라질 수 있기 때문에 associatedtype을 사용함
    associatedtype viewModelType
    
    var viewModel: viewModelType! {get set}
    func bindViewModel()
    
}

//ViewController에 추가된 ViewModel속성의 실제 ViewModel을 저장하고
//bindViewModel() 메소드를 자동으로 호출
//개별 뷰컨에서 bindViewModel() 메소드를 호출할 필요가 없어져서 코드가 단순해짐
extension ViewModelBindableType where Self:UIViewController {
    mutating func bind(viewModel: Self.viewModelType){
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
