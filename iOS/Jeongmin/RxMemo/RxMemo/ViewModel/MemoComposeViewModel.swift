//
//  MemoComposeViewModel.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoComposeViewModel : CommonViewModel {
    private let content: String?
    
    var initialText : Driver<String?> {
        return Observable.just(content).asDriver(onErrorJustReturn: nil)
    }
    
    //저장 버튼, 취소 버튼
    let saveAction : Action<String, Void>
    let cancelAction: CocoaAction
    
    init(title: String, content: String? = nil, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType, saveAction: Action<String, Void>? = nil, cancelAction: CocoaAction? = nil){
        self.content = content
        self.saveAction = Action<String, Void> { input in
            if let action = saveAction {
                //액션이 전달 시 실제로 액션을 실행함
                action.execute(input)
            }
            
            //화면 닫고 끝남
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        self.cancelAction = CocoaAction {
               if let action = cancelAction {
                   //액션이 전달 시 실제로 액션을 실행함
                   action.execute(())
               }
               
               //화면 닫고 끝남
               return sceneCoordinator.close(animated: true).asObservable().map { _ in }
           }
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
        
    }
}
