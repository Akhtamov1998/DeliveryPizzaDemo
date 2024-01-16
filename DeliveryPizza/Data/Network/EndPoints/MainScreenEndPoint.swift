//
//  MainScreenEndPoint.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Alamofire

enum MainScreenEndPoint {
    case getProducts
}

extension MainScreenEndPoint: EndPoint {
    var baseURL: String {
        switch self {
        case .getProducts:
            return EndPointConst.BASE_URL
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/demo/posts"
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var headers: Alamofire.HTTPHeaders? {
        return [
            "Accept": "*/*",
            "Connection": "keep-alive"
        ]
    }
    
    
}
