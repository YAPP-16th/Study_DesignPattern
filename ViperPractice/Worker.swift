//
//  CandyWorker.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation

// Worker의 사용은 선택사항
//Interactor 클래스는 서로 다른 소스의 데이터를 관리하고 있는데, 오프라인 모드에 사용할 restAPI와 로컬 데이터베이스를 가지고 있다.
// Worker는 각 데이터 소스에 대한 worker class를 만들 수 있다. interactor 크기를 줄이기 위해 쓰이기도 한다.

protocol APIWorkerProtocol {
    func fetchCandy(callBack: (Entity) -> Void)
    func fetchChoco(callBack: (Entity) -> Void)
}

class APIWorker : APIWorkerProtocol {
    func fetchCandy(callBack: (Entity) -> Void) {
        let candyEntity = Entity(title: "천국 사탕", description: "마법 사탕은 천국에서 만들어집니다. 맛보고 싶으시다면 주문하세요! \n#마약 아닙니다. #사기 아닙니다.", price: 100, imageName: "magic_candy")
        callBack(candyEntity)
    }
    
    func fetchChoco(callBack: (Entity) -> Void) {
        let chocoEntity = Entity(title: "지옥 초콜릿", description: "많은 사람들의 다이어트를 방해한 지옥에서 올라온 초콜릿입니다. 사랑스러운 단맛과 깔끔함의 조합, 이런저런 일로 수고한 나에게 달콤함을 주는건 어떨까요? 어서 주문하세요!", price: 150, imageName: "magic_chocolate")
        callBack(chocoEntity)
    }
}
