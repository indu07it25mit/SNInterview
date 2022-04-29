//
//  ReviewViewModel.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class ReviewViewModel: BaseViewModel {
    private var selectedCoffee: CoffeeShop?
    let dependancyInjection = DependancyInjection.shared
    
    func getSelectedReview() -> CoffeeShop? {
        selectedCoffee
    }
    
    func setSelectedReview(_ coffee: CoffeeShop) {
        selectedCoffee = coffee
    }
}
