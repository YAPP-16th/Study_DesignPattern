//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by 홍정민 on 2020/04/06.
//  Copyright © 2020 홍정민. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemoListViewModel!
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func bindViewModel() {
        
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        //옵저버블과 테이블 뷰 바인딩
        //셀 리턴 코드, 데이터 소스 코드 필요 없음
   
        viewModel.memoList.bind(to: listTableView.rx.items(cellIdentifier: "cell")){
            row, memo, cell in
            cell.textLabel?.text = memo.content
        }.disposed(by: rx.disposeBag)
        
        
        //메모 추가 액션 바인딩
        addButton.rx.action = viewModel.makeCreateAction()
        
        //메모 디테일
        //튜플형태로 선택한 메모와 인덱스패스가 튜플 형태로 방출
        //맵연산자 사용 이유 : 인덱스패스 필요없어져서 데이터만 방출하도록
        Observable.zip(listTableView.rx.modelSelected(Memo.self),
                       listTableView.rx.itemSelected)
            .do(onNext: {[unowned self](_, indexPath) in
                self.listTableView.deselectRow(at: indexPath, animated: true)
            })
            .map {$0.0}
            .bind(to: viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        

    }
    
    
}
