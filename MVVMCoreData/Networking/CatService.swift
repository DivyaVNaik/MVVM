//
//  APIService.swift
//  MVVMCoreData
//
//  Created by Divya on 2024-02-28.
//

import Foundation

protocol CatserviceDelegate {
    func fetchCatFacts() async throws -> [CatFacts]
}


class CatService: CatserviceDelegate {
    
    // Backend Call with Async Await
    func fetchCatFacts() async throws -> [CatFacts] {
        let url = URL(string:Endpoints.catFacts.path)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let facts = try JSONDecoder().decode([CatFacts].self, from: data)
        return facts
    }
    
    // Backend Call with Closure
    func fetchCatFactsWith(completion: @escaping (Result<[CatFacts], HTTPError>) -> Void) {
        let urlString = Endpoints.catFacts.path
        NetworkManager().fetchData([CatFacts].self, url: urlString) {  result in
            completion(result)
        }
    }
    
    
    
    
}

