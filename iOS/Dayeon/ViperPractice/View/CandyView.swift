//
//  CandyView.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

protocol ViewProtocol : class {
    var presenter : PresenterProtocol? { get set }
    func setCandy(viewModel : CandyViewModel)
    func setChoco(viewModel : CandyViewModel)
    func set(totalPriceViewModel viewModel : TotalPriceViewModel)
}

// View는 비즈니스 로직을 피한다. UI코드만 기억해야한다.
class CandyView : UIViewController {
    var presenter : PresenterProtocol?
    
    // CandyView
    @IBOutlet weak private var candyImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var quantityStepper: UIStepper!
    @IBOutlet weak private var quantityLabel: UILabel!
    
    // Chocolate View
    @IBOutlet weak private var chocoImageView: UIImageView!
    @IBOutlet weak private var chocoTitleLabel: UILabel!
    @IBOutlet weak private var chocoDescriptionLabel: UILabel!
    @IBOutlet weak private var chocoPriceLabel: UILabel!
    @IBOutlet weak private var chocoQuantityStepper: UIStepper!
    @IBOutlet weak private var chocoQuantityLabel: UILabel!
    
    // Total View
    @IBOutlet weak private var totalPriceLabel: UILabel!
    @IBOutlet weak private var taxLabel: UILabel!
    @IBOutlet weak private var inclTaxLabel: UILabel!
 
    
    override func viewDidLoad() {
           super.viewDidLoad()
           presenter?.fetch()
    }
    
    
    // reset button
    @IBAction func cancleBtn(_ sender: UIButton) {
        quantityStepper!.value = 0
        chocoQuantityStepper!.value = 0
        presenter?.update(candyQuantity: Int(quantityStepper!.value), chocoQuantity: Int(chocoQuantityStepper!.value))
    }
    
    @IBAction func quantityStepperVaueChanged(_ sender: UIStepper) {
        presenter?.update(candyQuantity: Int(quantityStepper!.value), chocoQuantity: Int(chocoQuantityStepper!.value))
        }
    
    @IBAction func chocoStepperChanged(_ sender: UIStepper){
        presenter?.update(candyQuantity: Int(quantityStepper!.value), chocoQuantity: Int(chocoQuantityStepper!.value))
    }
}

extension CandyView : ViewProtocol {
    // candyview setting
    func setCandy(viewModel : CandyViewModel){
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        candyImageView.image = UIImage(named: viewModel.imageName)
    }
    
    // chocoview setting
    func setChoco(viewModel : CandyViewModel){
        chocoTitleLabel.text = viewModel.title
        chocoDescriptionLabel.text = viewModel.description
        chocoPriceLabel.text = viewModel.price
        chocoImageView.image = UIImage(named: viewModel.imageName)
    }

    //excl tax, incl tax, VAT
    func set(totalPriceViewModel viewModel: TotalPriceViewModel) {
        quantityLabel.text = "Quantity : \(viewModel.candyQuantity)"
        chocoQuantityLabel.text = "Quantity : \(viewModel.chocoQuantity)"
        
        totalPriceLabel.text = viewModel.totalPrice
        taxLabel.text = viewModel.vat
        inclTaxLabel.text = viewModel.totalInclTax
    }
}
