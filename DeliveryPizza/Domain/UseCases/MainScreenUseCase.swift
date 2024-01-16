//
//  MainScreenUseCase.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Foundation

protocol MainScreenUseCase {
    func getProducts(onComplete: @escaping (Swift.Result<[MainProductDataObject], Error>) -> Void)
}
