//
//  CandyView.swift
//  ViperPractice
//
//  Created by 성다연 on 14/02/2020.
//  Copyright © 2020 성다연. All rights reserved.
//

import UIKit

protocol CandyViewProtocol : class {
    var presenter : CandyPresenterProtocol? {get set}
    func set(viewModel : CandyViewModel)
    func set(totalPriceViewModel viewModel : TotalPriceViewModel)
}

class CandyView : UIViewController {
    var presenter : CandyPresenterProtocol?
    
    @IBOutlet weak private var candyImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var quantityStepper: UIStepper!
    @IBOutlet weak private var quantityLabel: UILabel!
    
    @IBOutlet weak private var totalPriceLabel: UILabel!
    @IBOutlet weak private var taxLabel: UILabel!
    @IBOutlet weak private var inclTaxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchCandy()
    }
    
    @IBAction func quantityStepperVaueChanged(_ sender: Any) {
        presenter?.update(candyQuantity: Int(quantityStepper!.value))
    }
}

extension CandyView : CandyViewProtocol {
    func set(viewModel : CandyViewModel){
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price
        candyImageView.image = UIImage(named: viewModel.imageName)
    }
    
    func set(totalPriceViewModel viewModel: TotalPriceViewModel) {
           //excl tax, incl tax, VAT
        quantityLabel.text = viewModel.quantity
        totalPriceLabel.text = viewModel.totalPrice
        taxLabel.text = viewModel.vat
        inclTaxLabel.text = viewModel.totalInclTax
    }
}
