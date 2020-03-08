//
//  RouterOutput.swift
//  ViperPractice
//
//  Created by 성다연 on 06/03/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import Foundation
import UIKit

protocol Routerable {
    var view: Viewable! {get}
    
    func push(nav : UINavigationController, vc: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: @escaping (() -> Void))
    func pop(animated: Bool)
}

extension Routerable {
    func push(nav : UINavigationController, vc: UIViewController,  animated: Bool){
        nav.pushViewController(vc, animated: true)
    }
    func dismiss(animated: Bool) {
        view.dismiss(animated: animated)
    }
    func dismiss(animated: Bool, completion: @escaping (() -> Void)) {
        view.dismiss(animated: animated, _completion: completion)
    }
    func pop(animated: Bool) {
        view.pop(animated: animated)
    }
}


class RouterOutput: Routerable {
    private(set) weak var view: Viewable!
    
    init(_ view: Viewable) {
        self.view = view
    }
}
