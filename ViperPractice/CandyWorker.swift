//
//  CandyWorker.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation


/*
 각 구성요소의 행동을 정의하기 위해 프로토콜을 사용한다.
 서로에 대해 더 알 필요 없이 사용할 수 있는 계약을 맺기 위해,
 그리고 쉽게 구성요소를 대체할 수 있도록 하기 위해서다.
 */
protocol CandyAPIWorkerProtocol {
    func fetchCandy(callBack: (CandyEntity) -> Void)
}

class CandyAPIWorker : CandyAPIWorkerProtocol {
    func fetchCandy(callBack: (CandyEntity) -> Void) {
        let candyEntity = CandyEntity(title: "마법 사탕", description: "마법 사탕은 천국에서 만들어집니다. 만약 맛보고 싶으시다면 주문하세요! \n#마약 아닙니다. #사기 아닙니다.", price: 100, imageName: "magic_candy")
        callBack(candyEntity)
    }
}
