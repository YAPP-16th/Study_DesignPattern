//
//  CandyEntity.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

// Entitiy는 단순 데이터 모델

// 가공 전 모델
struct CandyEntity{
    let title : String
    let description : String
    let price : Float
    let imageName : String
}

// price -> String. 가공 후 모델
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
    let candyQuantity: String
    let chocoQuantity: String
}
