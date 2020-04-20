//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action
import NSObject_Rx

//NSObject_Rx는 DisposeBag()의 선언 필요없이 사용가능하게 해줌

class MemoComposeViewController: UIViewController, ViewModelBindableType {
    
    var viewModel : MemoComposeViewModel!
    
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func bindViewModel() {
        //네비게이션바의 타이틀을 viewModel.title에 바인딩
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.initialText
            .drive(contentTextView.rx.text)
            .disposed(by: rx.disposeBag)
        
        cancelButton.rx.action = viewModel.cancelAction
        
        
        
        //throttle로 (0.5)초마다 탭 처리 (더블 탭 막기 위함)
        //withLatestFrom로 텍스트뷰에 입력된 텍스트 방출
        saveButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(contentTextView.rx.text.orEmpty)
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: rx.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentTextView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        contentTextView.resignFirstResponder()
        
    }
    
    
}
