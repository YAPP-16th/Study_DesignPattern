//
//  MVVMViewModel.swift
//  MVVM_NoRx
//
//  Created by 김태인 on 2020/04/05.
//  Copyright © 2020 김태인. All rights reserved.
//

import Foundation

public class MVVMViewModel {
    
    var helloText = DataBinding("")
    
    func userTriggeredSayHelloButton() {
        helloText.valueForBind = "Hello World"
    }
}
