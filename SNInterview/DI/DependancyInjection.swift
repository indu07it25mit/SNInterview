//
//  DependancyInjection.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

class DependancyInjection {
    @Injected(\.service) var service: Service
    
    static let shared = DependancyInjection()
    
    private init() { }
}
