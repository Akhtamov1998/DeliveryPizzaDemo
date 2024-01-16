//
//  DefaultMainScreenUseCase.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Foundation

final class DefaultMainScreenUseCase {
    private let networkManager: NetworkManager
    private let api: MainScreenRepository
    init(networkManager: NetworkManager = DefaultNetworkManager.shared,
         api: MainScreenRepository = DefaultMainScreenRepository()) {
        self.networkManager = networkManager
        self.api = api
    }
}

extension DefaultMainScreenUseCase: MainScreenUseCase {
    func getProducts(onComplete: @escaping (Result<[MainProductDataObject], Error>) -> Void) {
        api.getProducts { result in
            switch result {
            case .success(let response):
                onComplete(.success(response))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
    
    
}
