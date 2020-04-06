//
//  ViewController.swift
//  MVPExample_CollectionView
//
//  Created by 홍정민 on 2020. 2. 14..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import UIKit

class ColorCollectionViewController: UIViewController {
   
    //presenter와 collectionView 선언
    let presenter : ColorCollectionPresenter!
    var collectionView: UICollectionView!
    
    init(with presenter: ColorCollectionPresenter){
        self.presenter = presenter
        
        //storyboard가 아닌 분리된 .nib파일로 관리될 경우 init(coder:) 대신 이 메소드를 사용
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = presenter.backgroundColor
        
        //컬렉션 뷰 설정
        setUpCollectionView()
        
        //presenter의 메소드를 이용해서 랜덤으로 변경된 컬러를 적용 후 reload
        presenter.updateColors{
            [weak self] in self?.collectionView.reloadData()
        }
    }

    
    //UICollectionViewFlowLayout 정의
    let layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let insetLeft : CGFloat = 5.0
        let insetRight : CGFloat = 5.0
        layout.sectionInset = UIEdgeInsets(top: 10, left: insetLeft, bottom: 5.0, right: insetRight)
        
        //화면 크기를 구해서 CollectionView에 들어갈 아이템의 width를 결정
        let itemWidth = UIScreen.main.bounds.width / 2 - (insetLeft + insetRight)
        
        layout.itemSize = CGSize(width: itemWidth, height: 300.0)
        
        return layout
    }()
    
    
    //Refresh 시 셀 색 랜덤 변경
    let refreshControl : UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(ColorCollectionViewController.refreshColor), for: .valueChanged)
        
        return refresh
    }()
    
    
    @objc func refreshColor(){
        presenter.updateColors {
            [weak self] in
            DispatchQueue.main.async{
                self?.collectionView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    

    
    func setUpCollectionView(){
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.refreshControl = refreshControl
        presenter.registerCells(for: collectionView)
        self.view.addSubview(collectionView)
    }
    
}

extension ColorCollectionViewController : UICollectionViewDelegate {
    
}
