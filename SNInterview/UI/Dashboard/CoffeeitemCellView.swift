//
//  CoffeeitemCellView.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 28/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeitemCellView: UITableViewCell {
    @IBOutlet weak var coffeeView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ model: CoffeeShop) {
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.nameLabel.text = model.name
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.reviewLabel.text = model.review
        (coffeeView as? CoffeeShopItemViewWrapper)?.contentView.ratingLabel.text = "Rating: \(Int(model.rating))"
    }
}
