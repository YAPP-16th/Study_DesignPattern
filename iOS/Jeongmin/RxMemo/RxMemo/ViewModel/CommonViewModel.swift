//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/20.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel : NSObject {
    let title : Driver<String>
    let sceneCoordinator : SceneCoordinator
    let storage:MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage : MemoStorageType){
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator as! SceneCoordinator
        self.storage = storage
    }
}
