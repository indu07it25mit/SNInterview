//
//  NetworkService.swift
//  SNInterview
//
//  Created by Inderjeet Kumar on 29/04/22.
//  Copyright © 2022 ServiceNow. All rights reserved.
//

import UIKit

protocol Service {
    func fetchReviews<T: Codable>(_ url: String, type: T.Type, completion: (Result<T, SNError>) -> Void)
}

class NetworkService: Service {
    func fetchReviews<T>(_ url: String, type: T.Type, completion: (Result<T, SNError>) -> Void) where T : Decodable, T : Encodable {
        
    }
}

class MockedNetworkService: Service {
    func fetchReviews<T>(_ url: String, type: T.Type, completion: (Result<T, SNError>) -> Void) where T : Decodable, T : Encodable {
        guard let response = Utilities.getJson(url, type: type) else {
            completion(.failure(SNError.failed))
            return
        }
        completion(.success(response))
    }
}
