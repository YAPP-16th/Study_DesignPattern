//
//  MainView.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

protocol MainViewProtocol : class{
    var presenter: MainPresenterProtocol? {get set}
    func setCandyStore(viewmodel: StoreViewModel)
}


class MainView : UIViewController {
    @IBOutlet weak var candyView: UIView!
    @IBOutlet weak var candyName: UILabel!
    @IBOutlet weak var candyImage: UIImageView!
    
    var presenter: MainPresenterProtocol? // 프레센터 연결
    var mainRouter : RouterProtocol?
    var candyRouter : CandyRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetch()
    }
}

extension MainView : MainViewProtocol {
    func setCandyStore(viewmodel: StoreViewModel) {
        let candyGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchCandyView(sender:)))
        candyName.text = viewmodel.name
        candyImage.image = UIImage(named: viewmodel.imageName)
        
        self.candyView.addGestureRecognizer(candyGesture)
    }

       
    @objc func touchCandyView(sender: UITapGestureRecognizer){
        presenter?.showNextController(navigationController: navigationController!)
        //mainRouter?.pushToCandyScreen(nav: (navigationController!))
        // view -> Presenter -> Router 로 네비게이션을 넘겨주어야 화면이 이동한다.
    }
}
