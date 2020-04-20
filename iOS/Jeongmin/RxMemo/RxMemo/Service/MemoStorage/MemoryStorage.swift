//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift


class MemoryStorage : MemoStorageType {
    // 배열은 Observable을 통해 외부로 공개
    // Observable은 배열 상태가 업데이트되면 새로운 next이벤트 방출 -> Subject
    // 초기에 더미값을 가져야 하기 때문에 -> Behavior Subject
    private var list = [
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20))
    ]
    
    // 기본값을 list로 하기 위해 lazy로 선언
    // lazy var은 처음 사용되기 전까지는 연산이 되지 않음
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    
    // 모든 메소드에서 subject에서 CRUD가 일어날 때마다 onNext이벤트를 방출하고 있음
    // subject와 tableView 바인딩, 새로운 배열을 계속해서 방출해야 tableView가 계속해서 update
    // cocoatouch에서의 reloadData로는 tableView가 제대로 업데이트 되지 않음
    
    
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content:content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updateContent: content)
 
        //기존 메모를 교체
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        return Observable.just(updated)
    }
    
    
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
        
    }
    
    
}
