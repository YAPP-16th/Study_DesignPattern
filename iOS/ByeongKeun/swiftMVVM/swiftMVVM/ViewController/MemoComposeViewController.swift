//
//  ComposeViewController.swift
//  swiftMVVM
//
//  Created by byeonggeunSon on 2020/04/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MemoComposeViewController: UIViewController, ViewModelBindableType{
  var viewModel: MemoComposeViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupContentTextViewUI()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    contentTextView.becomeFirstResponder()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if contentTextView.isFirstResponder{
      contentTextView.resignFirstResponder()
    }
  }
  let contentTextView: UITextView = {
    let tv = UITextView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  
  
  private func setupContentTextViewUI(){
    view.addSubview(contentTextView)
    NSLayoutConstraint.activate([
      contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      contentTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  func bindViewModel() {
    self.navigationItem.title = viewModel.title
    self.contentTextView.text = viewModel.initialText
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAction))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
  }
  
  @objc func cancelAction(){
    viewModel.cancelAction?()
    viewModel.sceneCoordinator.close(animated: true)
  }
  
  @objc func saveAction(){
    guard let text = contentTextView.text, !text.isEmpty else { return }
    viewModel.saveAction?(text)
    viewModel.sceneCoordinator.close(animated: true)
  }
}
