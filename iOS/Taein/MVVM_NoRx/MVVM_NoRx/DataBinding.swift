//
//  DataBinding.swift
//  MVVM_NoRx
//
//  Created by 김태인 on 2020/04/05.
//  Copyright © 2020 김태인. All rights reserved.
//

import Foundation

public class DataBinding<T> {
//    typealias Listener = (T) -> Void
    var listener: ((T) -> Void)?
    
    func bind(_ listener: ((T) -> Void)?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: ((T) -> Void)?) {
        self.listener = listener
        listener?(valueForBind)
    }
    
    var valueForBind: T {
        didSet {
            listener?(valueForBind)
        }
    }
    
    init(_ value: T) {
        valueForBind = value
    }
}
