//
//  ReviewViewController.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var coffeeView: UIView!
    
    var viewModel = ReviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = viewModel.getSelectedReview() {
            update(model)
        }
    }
    
    func update(_ model: CoffeeShop) {
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.nameLabel.text = model.name
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.reviewLabel.text = model.review
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.ratingLabel.text = "Rating: \(Int(model.rating))"
    }
}
