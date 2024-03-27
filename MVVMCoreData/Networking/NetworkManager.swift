//
//  NetworkManager.swift
//  MVVMCoreData
//
//  Created by Divya on 2024-02-28.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
    case PUT = "PUT"
    case PATCH = "PATCH"
    
    func callAsFunction() -> String {
        rawValue
    }
}

enum HTTPError: Error {
    case failedResponse
    case failedDecoding
    case invalidUrl
    case invalidData
}



enum Endpoints: String {
    
    case catFacts
    static let baseURL = "https://cat-fact.herokuapp.com"
    
    var path : String {
        switch self {
        case .catFacts:
            return Endpoints.baseURL + "/facts"
        }
    }
}



class NetworkManager {
    
    func fetchData<T:Codable>(_ type: T.Type, url: String,
                              completion: @escaping (Result<T, HTTPError>) -> Void) {
        guard let sessionURL = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: sessionURL) { data, urlResponse, error in
            
            // 1 check the response
            guard let urlResponse = urlResponse as? HTTPURLResponse, (200...299).contains(urlResponse.statusCode) else {
                completion(.failure(.failedResponse))
                return
            }
            
            // 2 check the data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseData))
                return
            } catch {
                completion(.failure(.failedDecoding))
            }
            
        }.resume()
    }
    
    
}
