//
//  MainView.swift
//  ViperPractice
//
//  Created by 성다연 on 21/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

/*
 프로토콜 선언에 : class 를 적는 이유
 - class를 쓰지 않는다면 해당 타입이 무엇인지 알 수 없기 때문에 reference cycle를 위한 unowned, weak를 사용할 수 없다. 클래스 타입임을 정의하는 경우, unowned, weak를 사용할 수 있고 메모리 릭에 대응할 수 있다.
 
 메모리 릭이란?
 - 메모리 누수 현상, 필요하지 않은 메모리를 계속 점유하고 있는 현상으로 할당된 메모리를 사용한 다음 반환하지 않는 것이 누적되면 메모리가 낭비된다.
 **/
protocol MainViewProtocol : class {
    var presenter: MainPresenterProtocol? {get set}
    func setCandyStore(viewmodel: StoreViewModel)
}

class MainView : UIViewController {
    @IBOutlet weak var candyView: UIView!
    @IBOutlet weak var candyName: UILabel!
    @IBOutlet weak var candyImage: UIImageView!
    
    var presenter: MainPresenterProtocol? // 프레센터 연결
    
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
        MainRouter().push(from: self)
        
        
        //dependencies?.router.view.push(storeView, animated: true)
        //presenter?.showNextController(navigationController: navigationController!)
        //mainRouter?.pushToCandyScreen(nav: (navigationController!))
        // view -> Presenter -> Router 로 네비게이션을 넘겨주어야 화면이 이동한다. <- viper에 부합하지 않음
    }
}

extension MainView : Viewable {}
