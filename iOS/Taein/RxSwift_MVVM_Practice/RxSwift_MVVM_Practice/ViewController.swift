//
//  ViewController.swift
//  RxSwift_MVVM_Practice
//
//  Created by TaeinKim on 2020/03/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let allCities   = ["NewYork", "London", "Paris", "Osaka", "Osagu", "Seoul"]
    var shownCities = [String]()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.separatorInset = .zero

        searchBar
          .rx.text // RxCocoa의 Observable 속성(ControlProperty<String?>). 검색 바의 텍스트가 변경될 때 신호 발생
          .orEmpty // 옵셔널이 아니게 만듦 (Transforms control property of type String? into control property of type String.)
          .subscribe(onNext: { [unowned self] query in // subscribe
            print("query: \(query)")
            self.shownCities = self.allCities.filter({ $0.hasPrefix(query) })
            self.tableView.reloadData()
          })
          .disposed(by: disposeBag)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
        
        return cell
    }
    
    
}
