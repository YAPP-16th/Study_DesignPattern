//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError : Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
