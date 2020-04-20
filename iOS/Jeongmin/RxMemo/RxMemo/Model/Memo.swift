//
//  Memo.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation

struct Memo : Equatable {
    var content: String //메모 저장
    var insertDate: Date //생성 날짜 저장
    var identity: String //메모를 구분할 때 사용
    
    init(content: String, insertDate: Date = Date()){
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    //새로운 내용으로 메모를 업데이트
    init(original: Memo, updateContent:String){
        self = original
        self.content = updateContent
    }
}



