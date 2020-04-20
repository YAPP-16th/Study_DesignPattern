//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    //Completable은 Observable의 향상된 버전
    //구독자를 추가하고 화면 전환이 완료된 후 원하는 코드 구현 가능
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    //현재씬을 닫고 이전 씬으로 돌아감
    @discardableResult
    func close(animated: Bool) -> Completable
}
