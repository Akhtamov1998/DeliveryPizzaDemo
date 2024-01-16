//
//  MainProductDataObject.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/14/24.
//

import Foundation

struct MainProductDataObject: Codable {
    let id: Int?
    let price: String?
    let title: String?
    let description: String?
    let categoryId: Int?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case price
        case title
        case description
        case categoryId
        case imageUrl = "image_url"
    }
}
