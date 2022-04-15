//
//  NetworkManager.swift
//  BoredMemes
//
//  Created by Владимир Киселев on 10.04.2022.
//

import Foundation
import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    func fetchBreweryWithAlamofire(_ url: String, completion: @escaping(Result<[Brewery], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let brewery = Brewery.getBreweries(from: value)
                    DispatchQueue.main.async {
                        completion(.success(brewery))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
