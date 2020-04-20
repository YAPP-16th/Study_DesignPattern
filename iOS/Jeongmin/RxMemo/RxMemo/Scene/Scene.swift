//
//  Scene.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    //스토리보드의 Scene을 생성하고 연관값에 저장된 ViewModel을 바인딩하고 리턴
    //실제 씬이 만들어지는 부분
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else {
                fatalError()
            }
            
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: viewModel)
            return nav
            
            
        case .detail(let viewModel):
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else{
                fatalError()
            }
            
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
                fatalError()
            }
            
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            composeVC.bind(viewModel: viewModel)
            return nav

        }
    }
    
}
