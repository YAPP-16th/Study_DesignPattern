//
//  ViewController.swift
//  MVVM_NoRx
//
//  Created by 김태인 on 2020/04/05.
//  Copyright © 2020 김태인. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var viewModel: MVVMViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        if let viewModel = viewModel {
            viewModel.helloText.bind({ (helloText) in
                DispatchQueue.main.async {
                    self.helloLabel.text = helloText
                }
            })
            
            viewModel.currentCount.bind({ (currentCount) in
                DispatchQueue.main.async {
                    self.countLabel.text = "\(currentCount)"
                }
            })
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
        viewModel?.userTriggeredUIStepper(sender.value)
    }
    
    @IBAction func sayHelloButtonPressed(_ sender: UIButton) {
        viewModel?.userTriggeredSayHelloButton()
    }
}

