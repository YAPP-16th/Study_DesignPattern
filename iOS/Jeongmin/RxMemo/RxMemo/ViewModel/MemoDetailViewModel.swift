//
//  MemoDetailViewModel.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoDetailViewModel : CommonViewModel {
    //이전씬에서 전달된 메모가 저장
    let memo: Memo
    
    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "KO_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    //테이블뷰에 표시할 문자열 배열 방출
    //왜 BehaviorSubject : 메모 보기 후 다시 목록으로 돌아갈 시 편집한 내용이 업데이트 되어야 함
    var contents: BehaviorSubject<[String]>
    
    init(memo: Memo, title: String, sceneCoordinator: SceneCoordinatorType,
         storage: MemoStorageType){
        self.memo = memo
        contents = BehaviorSubject<[String]>(value: [
            memo.content,
            formatter.string(from: memo.insertDate)
        ])
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
    
    lazy var popAction = CocoaAction {
           [unowned self] in
           return self.sceneCoordinator.close(animated: true).asObservable().map{
               _ in }
       }
}
