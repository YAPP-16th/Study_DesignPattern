//
//  MemoStrage.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation
import RxSwift

//기본적인 CRUD 메소드 정의
protocol  MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    //반환값이 Observable이기 때문에 구독자가 원하는대로 작업을 할 수 있다.
    //작업결과가 필요 없는 경우가 있기 때문에 discardableResult특성 추가
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo:Memo, content:String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
    
}

