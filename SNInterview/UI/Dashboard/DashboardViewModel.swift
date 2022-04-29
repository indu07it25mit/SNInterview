//
//  DashboardViewModel.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class DashboardViewModel: BaseViewModel {
    let dependancyInjection: DependancyInjection
    var reviews: [CoffeeShop] = []
    var errorMessage: String?
    
    init(dependancyInjection: DependancyInjection) {
        self.dependancyInjection = dependancyInjection
    }
    
    func getRowCount() -> Int {
        reviews.count
    }
    
    func getCoffeeShop(at index: Int) -> CoffeeShop {
        reviews[index]
    }
    
    func loadData() {
        dependancyInjection.service.fetchReviews("CoffeeShops", type: [CoffeeShop].self) { [weak self] result in
            guard let strongSelf = self else { return }
                
            switch result {
            case.success(let coffeeShops):
                strongSelf.reviews = coffeeShops
                
            case .failure(let error):
                strongSelf.errorMessage = error.localizedDescription
            }
        }
    }
}
