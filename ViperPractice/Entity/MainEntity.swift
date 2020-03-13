//
//  MainModel.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

// 가공 전 모델
struct StoreEntity{
    let StoreName : String
    let StoreImage : String
}

// 가공 후 모델
struct StoreViewModel {
    let name: String
    let imageName: String
}
