//
//  MemoDetailViewController.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType{
  var viewModel: MemoDetailViewModel!
  lazy var contentTableView: UITableView = {
    let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.dataSource = self
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "contentCell")
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "dateCell")
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(contentTableView)
    
    NSLayoutConstraint.activate([
      contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    
  }
  
  func bindViewModel() {
    self.navigationItem.title = viewModel.title
    
    self.navigationItem.hidesBackButton = false
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "메모 목록", style: .plain, target: self, action: #selector(close))
  }
  @objc func close(){
    viewModel.sceneCoordinator.close(animated: true)
  }
}

extension MemoDetailViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.contents.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let text = viewModel.contents[indexPath.row]
    switch indexPath.row{
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath)
      cell.textLabel?.text = text
      cell.selectionStyle = .none
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
      cell.textLabel?.textAlignment = .center
      cell.textLabel?.textColor = .lightGray
      cell.textLabel?.text = text
      cell.selectionStyle = .none
      return cell
    default:
      fatalError()
    }
  }
}
