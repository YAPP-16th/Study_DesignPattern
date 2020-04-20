//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

//MVVM 패턴으로 구현할 때는 ViewModel을 ViewController의 속성으로 추가
//ViewModel과 View를 바인딩 -> 프로토콜 선언(ViewModelBindableType)
//MVC에서는 Segue로 화면전환, MVVM에서는 해당 ViewModel에서 화면전환

class MemoListViewModel : CommonViewModel {
    //의존성 주입 생성자
    //바인딩에 사용되는 속성과 메소드
    
    //메모배열 방출 속성
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
    
    //입력값이 String인 Action
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action {
            input in
            return self.storage.update(memo: memo, content: input).map { _ in }
        }
    }
    
    func performCancel(memo: Memo) -> CocoaAction {
        return Action {
            return self.storage.delete(memo: memo).map { _ in }
        }
    }
    
    
    func makeCreateAction() -> CocoaAction {
        return CocoaAction { _ in
            return self.storage.createMemo(content: "")
                .flatMap { memo -> Observable<Void> in
                    let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancelAction: self.performCancel(memo: memo))
                    
                    let composeScene = Scene.compose(composeViewModel)
                    return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map { _ in }
            }
            
        }
    }
    
    //클로저 내부에서 self에 접근해야하기 때문에 lazy로 선언
    lazy var detailAction: Action<Memo, Void> = {
        return Action {
            memo in
            let detailViewModel = MemoDetailViewModel(memo: memo, title: "메모 보기", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
            
            let detailScene = Scene.detail(detailViewModel)
            return self.sceneCoordinator.transition(to: detailScene, using: .push, animated: true)
                .asObservable().map{ _ in }
        }
    }()
    
    
    
    
    
}
