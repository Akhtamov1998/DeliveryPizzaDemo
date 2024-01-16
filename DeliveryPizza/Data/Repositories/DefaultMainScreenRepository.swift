//
//  MainScreenRepository.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Alamofire

final class DefaultMainScreenRepository {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = DefaultNetworkManager.shared) {
        self.networkManager = networkManager
    }
}

extension DefaultMainScreenRepository: MainScreenRepository  {
    func getProducts(onComplete: @escaping (Result<[MainProductDataObject], Error>) -> Void) {
        networkManager.call(endPoint: MainScreenEndPoint.getProducts) { (result: Swift.Result<[MainProductDataObject], Error>) in
            switch result {
            case .success(let response):
                onComplete(.success(response))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
    
    
}
