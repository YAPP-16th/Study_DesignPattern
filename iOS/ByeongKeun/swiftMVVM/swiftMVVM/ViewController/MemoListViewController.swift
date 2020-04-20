//
//  MemoListViewController.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController, ViewModelBindableType{
  var viewModel: MemoListViewModel!
  
  lazy var listTableView: UITableView = {
    let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.dataSource = self
    tv.delegate = self
    tv.register(UITableViewCell.self, forCellReuseIdentifier: "listCell")
    
    return tv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(listTableView)
    
    NSLayoutConstraint.activate([
      listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      listTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      listTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.listTableView.reloadData()
  }
  func bindViewModel() {
    self.navigationItem.title = viewModel.title
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
    
    self.viewModel.memoList.bind = { [weak self] _ in
      self?.listTableView.reloadData()
    }
  }
  
  @objc func addAction(){
    self.viewModel.createAction()
  }
  @objc func refreshData(){
    self.listTableView.reloadData()
  }
}

extension MemoListViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.memoList.value?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
    let memo = viewModel.memoList.value?[indexPath.row]
    cell.textLabel?.text = memo?.content
    return cell
  }
}
extension MemoListViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let memo = viewModel.memoList.value?[indexPath.row] else { fatalError() }
    viewModel.detailAction(memo: memo)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
