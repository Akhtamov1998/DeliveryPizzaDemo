//
//  EndPoint.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Alamofire

protocol EndPoint {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var urlString: String { get }
}

extension EndPoint {
    var urlString: String { return baseURL + path }
}
