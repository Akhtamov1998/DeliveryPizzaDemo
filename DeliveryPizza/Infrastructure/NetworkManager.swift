//
//  NetworkManager.swift
//  DeliveryPizza
//
//  Created by ~Akhtamov on 1/16/24.
//

import Alamofire

protocol NetworkManager {
    typealias CompletionHandler<T> = (Swift.Result<T, Error>) -> Void
    
    func call<T>(endPoint: EndPoint, params: Parameters?, encoding: ParameterEncoding, handler: @escaping CompletionHandler<T>) where T: Codable
}

extension NetworkManager {
    func call<T>(endPoint: EndPoint, params: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, handler: @escaping CompletionHandler<T>) where T: Codable {
        call(endPoint: endPoint, params: params, encoding: encoding, handler: handler)
    }
}

final class DefaultNetworkManager: NetworkManager {
    
    //MARK: - Singleton
    static let shared = DefaultNetworkManager()
    
    //MARK: - Init
    private init() {}
    
    func call<T>(endPoint: EndPoint, params: Parameters? = nil,encoding: ParameterEncoding = JSONEncoding.default, handler: @escaping (Swift.Result<T, Error>) -> Void) where T: Codable {
        
        AF.request(
            endPoint.urlString,
            method: endPoint.httpMethod,
            parameters: params,
            encoding: encoding,
            headers: endPoint.headers
        ).validate().responseJSON { (data) in
            do {
                guard let data = data.data else { throw NSError(domain: "123", code: 12) }
                
                let result = try JSONDecoder().decode(T.self, from: data)
                handler(.success(result))
            } catch {
                print("error: ", error)
                if let error = error as? Error {
                    return handler(.failure(error))
                }
//                else {
//                    return handler(.failure(DefaultNetworkManager.parseApiError(data: data.data)))
//                }
            }
        }
    }
}
