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
    var currentCount = DataBinding(0.0)
    
    func userTriggeredSayHelloButton() {
        helloText.valueForBind = "Hello World"
    }
    
    func userTriggeredUIStepper(_ value: Double) {
        currentCount.valueForBind = value
    }
}
